<?php

namespace App\Http\Controllers\Staff;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

use Auht;
use App\Models\Company;
use App\Models\Admin;

class StaffController extends Controller
{
    public function index(){
        $company = Company::first();
        $staffs = Admin::where('role', '!=', '1')->get();
        return view('staff.staff-details', compact('company','staffs'));
    }

    // helper function inside your controller
    private function uploadPhoto($file, $folder, $fileName)
    {
        $maxSize = 100 * 1024; // 100KB

        if ($file->getSize() > $maxSize) {
            throw new \Exception('Image size must not exceed 2MB.');
        }

        $ext = $file->getClientOriginalExtension();
        $finalName = $fileName . '-' . time() . '.' . $ext;

        $location = public_path("img/{$folder}");

        if (!file_exists($location)) {
            mkdir($location, 0755, true);
        }

        $file->move($location, $finalName);

        return $finalName;
    }

    public function store(Request $request){
        // ✅ Validation
        $request->validate([
            'name'  => 'required|string|max:255',
            'email' => 'required|email|unique:admins,email',
            'role'  => 'required|in:staff,manager,admin',

            'password' => [
                'required',
                'string',
                'min:8',
                'confirmed',
                'regex:/[A-Z]/',       // capital letter
                'regex:/[a-z]/',       // small letter
                'regex:/[0-9]/',       // number
                'regex:/[^A-Za-z0-9]/' // special character
            ],
        ], [
            'password.regex' => 'Password must contain uppercase, lowercase, number and special character.',
        ]);

        $data = new Admin();
        $data->name                 = $request->name;
        $data->email                = $request->email;
        $data->role                 = $request->role;
        $data->contact_number       = $request->number;
        $data->password             = Hash::make($request->password);
        $data->status               = 1;

        if ($request->hasFile('staff_photo')) {
            $data->photo = $this->uploadPhoto(
                $request->file('staff_photo'),
                'staff',
                'staff-' . $request->name
            );
        }

        if ($request->hasFile('father_photo')) {
            $data->father_photo = $this->uploadPhoto(
                $request->file('father_photo'),
                'father',
                'staff-' . $request->name . '-' . $request->father_name
            );
        }

        if ($request->hasFile('mother_photo')) {
            $data->mother_photo = $this->uploadPhoto(
                $request->file('mother_photo'),
                'mother',
                'staff-' . $request->name . '-' . $request->mother_name
            );
        }

        $data->save();
        return redirect()->back()->with('success', 'Staff created successfully!');

    }

    public function view($id){
        $company = Company::first();
        $staff = Admin::findOrFail($id);
        return view('staff.staff-details-veiw', compact('company','staff'));
    }
}
