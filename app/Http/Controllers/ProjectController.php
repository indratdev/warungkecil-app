<?php

namespace App\Http\Controllers;

use App\Models\MasterProject;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;


class ProjectController extends Controller
{
    public function createProjectAndUserAdmin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'fullName' => 'required|string|max:255',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8',
            'business_name' => 'required|unique:m_project,branch_name'
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        // Create user
        $user = new User();
        $user->name = $request->input('fullName');
        $user->email = $request->input('email');
        $user->password = bcrypt($request->input('password'));
        $user->gender = $request->input('gender');
        $user->phone = $request->input('phone');
        $user->address = $request->input('address');
        $user->save();

        // Check if user creation was successful
        if (!$user->id) {
            return redirect()->back()->with('error', 'Failed to create user!');
        }

        // Create project
        $project = new MasterProject();
        $project->name = $request->input('business_name');
        $project->branch_name = $request->input('business_name');
        $project->owner_id = $user->id;

        // Validate project data
        $projectValidator = Validator::make($project->toArray(), [
            'name' => 'required',
            'branch_name' => 'required|unique:m_project,branch_name'
        ]);

        if ($projectValidator->fails()) {
            $user->delete(); // Rollback user creation
            return redirect()->back()
                ->withErrors($projectValidator)
                ->withInput();
        }

        $project->save();

        return redirect()->back()->with('success', 'User Created Successfully');
    }
}
