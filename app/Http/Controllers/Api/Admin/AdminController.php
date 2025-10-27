<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use App\Models\Admin;

class AdminController extends Controller
{
    public function index($id = null)
    {
        if($id == NULL){
            $user = Admin::all();
            return response()->json([
                'message' => 'User found Successfully',
                'user' => $user
            ], 200);
        } else {
            $user = Admin::find($id);
            return response()->json([
                'message' => 'User found Successfully',
                'user' => $user
            ], 200);
        }
    }

    public function store(Request $request)
    {
        if($request->isMethod('post')){

            $data = $request->all();

            $rules = [
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|max:255|unique:admins,email',
                'password' => 'required|string|min:8',
                'role' => 'required|string|max:50',
            ];
            
            $customMessages = [
                'name.required' => 'Name is required',
                'email.required' => 'Email is required',
                'email.email' => 'Email must be a valid email address',
                'email.unique' => 'Email already exists',
                'password.required' => 'Password is required',
                'password.min' => 'Password must be at least 8 characters',
                'role.required' => 'Role is required',
            ];

            $validator = Validator::make($data, $rules, $customMessages);
            if ($validator->fails()) {
                return response()->json([
                    'errors' => $validator->errors()
                ], 422);
            }
            
            $user = new Admin();
            $user->name = $data['name'];
            $user->email = $data['email'];
            $user->password = bcrypt($data['password']);
            $user->role = $data['role'];
            $user->save();

            return response()->json([
                'message' => 'User Created Successfully',
                'user' => $user
            ], 201);
        }
    }

    public function update(Request $request, $id)
    {
        $user = Admin::find($id);
        if(!$user){
            return response()->json([
                'message' => 'User not found'
            ], 404);
        }

        $data = $request->all();

        $rules = [
            'name' => 'required|string|max:255',
            // 'email' => 'required|string|email|max:255|unique:admins,email',
            'password' => 'required|string|min:8',
            'role' => 'required|string|max:50',
        ];
        
        $customMessages = [
            'name.required' => 'Name is required',
            // 'email.required' => 'Email is required',
            // 'email.email' => 'Email must be a valid email address',
            // 'email.unique' => 'Email already exists',
            'password.required' => 'Password is required',
            'password.min' => 'Password must be at least 8 characters',
            'role.required' => 'Role is required',
        ];

        $validator = Validator::make($data, $rules, $customMessages);
        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()
            ], 422);
        }

        $user->name = $data['name'];
        // $user->email = $data['email'];
        $user->password = bcrypt($data['password']);
        $user->role = $data['role'];
        $user->update();

        return response()->json([
            'message' => 'User Updated Successfully',
            'user' => $user
        ], 200);
    }

    public function destroy($id)
    {
        $user = Admin::find($id);
        if(!$user){
            return response()->json([
                'message' => 'User not found'
            ], 404);
        }

        $user->delete();

        return response()->json([
            'message' => 'User Deleted Successfully'
        ], 200);
    }
}
