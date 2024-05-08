<?php

namespace App\Http\Controllers;

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
            'bussiness_name' => 'required|unique:m_project,branch_name'
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        $name = $request->input('fullName');
        $email = $request->input('email');
        $password = bcrypt($request->input('password'));
        $token = $request->input('_token');
        $bussiness_name = $request->input('bussiness_name');
        $gender = $request->input('gender');
        $phone = $request->input('phone');
        $address = $request->input('address');

        // dd($email);

        // If validation passes, you can proceed to save the data.
        $result = DB::statement("CALL sp_user_create_user(?, ?, ?, ?, ?, ?, ?, ?)", [$name, $email, $password, $token, '', $gender, $phone, $address]);
        if ($result) {
            // get owner id
            $owner_id = DB::table('users')
                ->select(DB::raw('*'))
                ->where('email', 'like', "%" . $email . "%")
                ->first();


            // Perintah SQL berhasil dieksekusi
            DB::table('m_project')->insert([
                'name' => $bussiness_name,
                'branch_name' => $bussiness_name,
                'owner_id' => $owner_id->id
            ]);
        } else {
            // Ada masalah saat mengeksekusi perintah SQL
        }


        $message = 'User Created Successfully!';








        // $data = [
        //     'email' => $request->input('email'),
        //     'password' => $request->input('password'),
        // ];

        // if (Auth::Attempt($data)) {
        //     return redirect('/dashboard');
        // } else {

        //     Session::flash('error', 'Email atau Password Salah');
        //     return redirect('/');
        // }
    }
}
