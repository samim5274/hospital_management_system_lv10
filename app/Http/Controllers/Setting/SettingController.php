<?php

namespace App\Http\Controllers\Setting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;
use Carbon\Carbon;

use App\Models\LabTest;
use App\Models\Doctor;
use App\Models\Reference;
use App\Models\Company;
use App\Models\Bed;
use App\Models\DutyDoctor;
use App\Models\Disease;
use App\Models\Admin;

class SettingController extends Controller
{
    
    public function setting(){
        $refers = Reference::all();
        $doctors = Doctor::all();
        $dutyDoctors = DutyDoctor::all();
        $diseases = Disease::all();
        $beds = bed::all();
        $company = Company::first();
        return view('setting.setting', compact('beds','refers','doctors','dutyDoctors','diseases','company'));
    }

    public function createRefer(Request $request){
        
        $request->validate([
            'name' => 'required|string|max:255',
            'designation' => 'nullable|string|max:255',
            'phone' => 'nullable|string|max:20',
            'email' => 'nullable|email|max:255',
            'status' => 'required|boolean',
        ]);

        $refer = new Reference();

        $refer->name = $request->input('name','');
        $refer->designation = $request->input('designation','');
        $refer->email = $request->input('email','');
        $refer->phone = $request->input('phone','');
        $refer->status = $request->input('status','');

        $refer->save();

        return redirect()->back()->with('success', 'Refer added successfully!');
    }

    public function editRefer(Request $request, $id){
        $request->validate([
            'name' => 'required|string|max:255',
            'designation' => 'nullable|string|max:255',
            'phone' => 'nullable|string|max:20',
            'email' => 'nullable|email|max:255',
            'status' => 'required|boolean',
        ]);

        $refer = Reference::where('id', $id)->first();

        if(empty($refer)){
            return redirect()->back()->with('warning', 'Reference not found. Please try another reference. Thank you!');
        }

        $refer->name = $request->input('name','');
        $refer->designation = $request->input('designation','');
        $refer->email = $request->input('email','');
        $refer->phone = $request->input('phone','');
        $refer->status = $request->input('status',''); 

        $refer->update();

        return redirect()->back()->with('primary', 'Refer modify successfully!');
    }

    // Create Doctor
    public function createDoctor(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'specialization' => 'nullable|string|max:255',
            'phone' => 'nullable|string|max:20',
            'email' => 'nullable|email|max:255',
        ]);

        $doctor = new Doctor();

        $doctor->name = $request->input('name', '');
        $doctor->specialization = $request->input('specialization', '');
        $doctor->phone = $request->input('phone', '');
        $doctor->email = $request->input('email', '');
        $doctor->fees = $request->input('fee', '');
        $doctor->save();

        return redirect()->back()->with('success', 'Doctor added successfully!');
    }

    // Edit Doctor
    public function editDoctor(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'specialization' => 'nullable|string|max:255',
            'phone' => 'nullable|string|max:20',
            'email' => 'nullable|email|max:255',
        ]);

        $doctor = Doctor::where('id', $id)->first();

        if (empty($doctor)) {
            return redirect()->back()->with('warning', 'Doctor not found. Please try another doctor!');
        }

        $doctor->name = $request->input('name', '');
        $doctor->specialization = $request->input('specialization', '');
        $doctor->phone = $request->input('phone', '');
        $doctor->email = $request->input('email', '');
        $doctor->fees = $request->input('fee', '');
        $doctor->update();

        return redirect()->back()->with('primary', 'Doctor modified successfully!');
    }

    // Create Doctor
    public function createDutyDoctor(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'specialization' => 'nullable|string|max:255',
            'phone' => 'nullable|string|max:20',
            'email' => 'nullable|email|max:255',
        ]);

        $doctor = new DutyDoctor();

        $doctor->name = $request->input('name', '');
        $doctor->specialization = $request->input('specialization', '');
        $doctor->phone = $request->input('phone', '');
        $doctor->email = $request->input('email', '');

        $doctor->save();

        return redirect()->back()->with('success', 'Doctor added successfully!');
    }

    // Edit Doctor
    public function editDutyDoctor(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'specialization' => 'nullable|string|max:255',
            'phone' => 'nullable|string|max:20',
            'email' => 'nullable|email|max:255',
        ]);

        $doctor = DutyDoctor::where('id', $id)->first();

        if(empty($doctor)){
            return redirect()->back()->with('warning', 'Doctor not found. Please try another doctor.');
        }

        $doctor->name = $request->input('name', '');
        $doctor->specialization = $request->input('specialization', '');
        $doctor->phone = $request->input('phone', '');
        $doctor->email = $request->input('email', '');

        $doctor->update();

        return redirect()->back()->with('success', 'Doctor updated successfully!');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
        ]);

        Disease::create($request->only('name', 'description'));

        return redirect()->back()->with('success', 'Disease added successfully!');
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
        ]);

        $disease = Disease::findOrFail($id);
        $disease->update($request->only('name', 'description'));

        return redirect()->back()->with('success', 'Disease updated successfully!');
    }

    public function bedStore(Request $request)
    {
        $request->validate([
            'bed_number' => 'required|string|max:50',
            'ward' => 'required|string|max:100',
            'status' => 'required|in:available,occupied,maintenance',
            'price_per_day' => 'required|numeric|min:0',
        ]);

        Bed::create($request->only('bed_number', 'ward', 'status', 'price_per_day'));

        return redirect()->back()->with('success', 'Bed added successfully!');
    }

    // Update existing bed
    public function bedUpdate(Request $request, $id)
    {
        $request->validate([
            'bed_number' => 'required|string|max:50',
            'ward' => 'required|string|max:100',
            'status' => 'required|in:available,occupied,maintenance',
            'price_per_day' => 'required|numeric|min:0',
        ]);

        $bed = Bed::findOrFail($id);
        $bed->update($request->only('bed_number', 'ward', 'status', 'price_per_day'));

        return redirect()->back()->with('success', 'Bed updated successfully!');
    }

    public function profile(){
        $company = Company::first();
        $staff = Auth::guard('admin')->user();
        return view('setting.profile', compact('company', 'staff'));
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

        $email = $request->email;
        $data = Admin::where('email', $email)->first();
        if(!$data){
            return redirect()->back()->with('error', 'Invalid request!');
        }
        $data->password = Hash::make($request->new_password);        
        $data->save();
        return redirect()->back()->with('success', 'Password updated successful!');
    }

    public function dbBackup(){
        try {
            Artisan::call('backup:run', ['--only-db' => true]);
        } catch (\Exception $e) {
            return back()->with('error', 'Backup failed: ' . $e->getMessage());
        }

        $diskName = config('backup.backup.destination.disks')[0];
        $disk = Storage::disk($diskName);

        $files = collect($disk->allFiles(config('backup.backup.name')))
                    ->filter(fn ($file) => Str::endsWith($file, '.zip'))
                    ->sortDesc();

        $latestBackup = $files->first();

        if (!$latestBackup) {
            return back()->with('error', 'No backup file found!');
        }

        $path = $disk->path($latestBackup);

        Mail::raw('Here is the latest database backup.', function ($message) use ($path) {
            $message->to('valobashi.tumake9999@gmail.com') 
                    ->subject('Database Backup')
                    ->attach($path);
        });

        return redirect()->back()->with('success', 'Database backup successfully. Thank You..!');
        // return response()->download($path);
    }
}
