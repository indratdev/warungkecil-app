<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;


class AdminUserController extends Controller
{
    public function index()
    {
        $users = $this->readAllUser();
        $utilityController = app(UtilityController::class);
        $paginator = $utilityController->generatePaginator($users);

        $data = [
            'content' => 'users.index',
            'datas' => $paginator,

        ];

        return view('template.wrapper', $data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $data = [
            'content' => 'users.user_add'
        ];

        return view('template.wrapper', $data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        // Jika validasi berhasil, Anda dapat melanjutkan untuk menyimpan data.
        $name = $request->input('name');
        $email = $request->input('email');
        $password = bcrypt($request->input('password'));
        $token = $request->input('_token');
        $birthdate = $request->input('bday');
        $gender = $request->input('gender');
        $phone = $request->input('phone');
        $address = $request->input('address');

        // If validation passes, you can proceed to save the data.
        DB::statement("CALL sp_user_create_user(?, ?, ?, ?, ?, ?, ?, ?)", [$name, $email, $password, $token, $birthdate, $gender, $phone, $address]);
        $message = 'User Created Successfully!';
        return redirect()->back()->with('success', $message);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $user = DB::table('users')->where('id', $id)->get();

        $data = [
            'content' => 'users.user_edit',
            'data' => $user
        ];

        return view('template.wrapper', $data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        dd($request, $id);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function readAllUser()
    {
        return DB::select("CALL sp_user_read_all()");
    }

    public function readUserExist($email)
    {
        return  DB::table('users')
            ->where('email', 'like', '%' . $email . '%')
            ->count();
    }
}
