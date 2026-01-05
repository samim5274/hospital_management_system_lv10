<?php

namespace App\Http\Controllers\Staff;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

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
    private function uploadPhoto($file, $folder, $fileName, $oldFile = null)
    {
        $maxSize = 2 * 1024 * 1024; // 2MB
        if ($file->getSize() > $maxSize) {
            throw new \Exception('Image size must not exceed 2MB.');
        }

        // Delete old file if exists
        if ($oldFile && file_exists(public_path("img/{$folder}/{$oldFile}"))) {
            unlink(public_path("img/{$folder}/{$oldFile}"));
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

    public function edit($id){
        $company = Company::first();
        $staff = Admin::findOrFail($id);
        return view('staff.staff-details-edit', compact('company','staff'));
    }

    public function update(Request $request, $id){
        $company = Company::first();
        $staff = Admin::findOrFail($id);

        // Validation
        $data = $request->validate([
            'name' => 'required|string|max:255',
            // 'email' => ['required','email','max:255', Rule::unique('admins')->ignore($staff->id)],
            // 'role' => ['required', Rule::in(['superadmin','admin','manager','staff'])],
            'dob' => 'nullable|date',
            'gender' => 'nullable|in:Male,Female,Other',
            'blood_group' => 'nullable|string|max:5',
            'religion' => 'nullable|string|max:50',
            'nationality' => 'nullable|string|max:50',
            'national_id' => 'nullable|string|max:20',
            'contact_number' => 'nullable|string|max:20',
            'address1' => 'nullable|string|max:255',
            'address2' => 'nullable|string|max:255',

            // Parent
            'father_name' => 'nullable|string|max:255',
            'father_profession' => 'nullable|string|max:100',
            'father_contact' => 'nullable|string|max:20',
            'father_email' => 'nullable|email|max:255',
            'father_photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',

            'mother_name' => 'nullable|string|max:255',
            'mother_profession' => 'nullable|string|max:100',
            'mother_contact' => 'nullable|string|max:20',
            'mother_email' => 'nullable|email|max:255',
            'mother_photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',

            // Guardian
            'guardian_name' => 'nullable|string|max:255',
            'guardian_relationship' => 'nullable|string|max:50',
            'guardian_contact' => 'nullable|string|max:20',
            'guardian_email' => 'nullable|email|max:255',
            'guardian_nid' => 'nullable|string|max:20',

            // Staff photo
            'photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        // Upload images using your existing uploadPhoto method
        try {
            if ($request->hasFile('photo')) {
                $data['photo'] = $this->uploadPhoto($request->file('photo'), 'staff', 'staff-'.$staff->id, $staff->photo);
            }

            if ($request->hasFile('father_photo')) {
                $data['father_photo'] = $this->uploadPhoto($request->file('father_photo'), 'father', 'father-'.$staff->id, $staff->father_photo);
            }

            if ($request->hasFile('mother_photo')) {
                $data['mother_photo'] = $this->uploadPhoto($request->file('mother_photo'), 'mother', 'mother-'.$staff->id, $staff->mother_photo);
            }
        } catch (\Exception $e) {
            return back()->withErrors(['photo' => $e->getMessage()]);
        }

        // Update staff
        $staff->update($data);

        return redirect()->route('staff.edit', $staff->id)->with('success', 'Staff updated successfully!');
    }

}
