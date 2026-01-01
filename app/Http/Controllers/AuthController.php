<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use App\Mail\OtpMail;

use App\Models\Admin;
use App\Models\Company;

class AuthController extends Controller
{
    public function login(){
        $company = Company::first();
        Auth::guard('admin')->logout();
        session()->invalidate();
        session()->regenerateToken();
        return view('auth.login-view', compact('company'));
    }

    public function authenticate(Request $request){
        $credentials = $request->validate([
            'email' => ['required','email'],
            'password' => ['required','string'],
        ]);

        $remember = $request->has('remember');

        if (Auth::guard('admin')->attempt($credentials, $remember)) {
            $request->session()->regenerate();
            $admin = Auth::guard('admin')->user();
            $admin->update([
                'last_login_at' => now(),
                'last_login_ip' => $request->ip(),
            ]);
            return redirect()->intended('/dashboard');
        }

        return back()->withErrors([
            'email' => 'Credentials do not match our records.',
        ])->withInput($request->only('email','remember'));
    }

    public function logout(Request $request)
    {
        Auth::guard('admin')->logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('login');
    }

    public function forgetPassView(){
        $company = Company::first();
        return view('auth.forget-password-view', compact('company'));
    }

    public function findAccount(Request $request){
        $request->validate([
            'email' => 'required|email',
        ]);

        $usermail = $request->email;

        $data = Admin::where('email', $usermail)->first();

        if(!$data){
            return redirect()->back()->with('error','User account not found. Please try again.');
        }

        $otp = rand(100000, 999999);
        $data->otp = $otp;
        $data->otp_expires_at = Carbon::now()->addMinutes(10);
        $data->save();

        Mail::to($data->email)->send(new OtpMail($otp,$data));

        session(['reset_email' => $data->email]);

        return redirect()->route('otp.form')->with('success', 'OTP sent to your email!');
    }

    public function otpConfirm(){
        $company = Company::first();
        return view('auth.otp-confirm', compact('company'));
    }

    public function verifyOTP(Request $request){
        $request->validate([
            'otp' => 'required|digits:6',
        ]);

        $email = session('reset_email');

        $data = Admin::where('email', $email)->first();

        if(!$data){
            return redirect()->back()->with('error', 'Invalid request!');
        }

        if ($data->otp != $request->otp) {
            return redirect()->back()->with('error', 'Invalid OTP!');
        }

        if (now()->gt($data->otp_expires_at)) {
            return redirect()->back()->with('error', '⏰ OTP Expired!');
        }

        return redirect()->route('new.password.form');
    }

    public function newPassword(){
        $company = Company::first();
        return view('auth.new-password-form', compact('company'));
    }

    public function updatePass(Request $request){
        $request->validate([
            'new_password' => [
                'required',
                'min:6',
                'regex:/[A-Z]/',
                'regex:/[a-z]/',
                'regex:/[0-9]/',
                'regex:/[@$!%*#?&]/',
                'same:confirm_password'
            ],
        ]);

        $email = session('reset_email');

        $data = Admin::where('email', $email)->first();

        if(!$data){
            return redirect()->back()->with('error', 'Invalid request!');
        }

        $data->password = Hash::make($request->new_password);
        $data->otp = null;
        $data->otp_expires_at = null;
        $data->save();

        session()->forget('reset_email');

        return redirect()->route('login')->with('success', 'Password reset successful!');
    }
}
