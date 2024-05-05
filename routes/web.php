<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AdminUserController;
use App\Http\Controllers\AuthController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

// Route::get('/admin', 'AdminController@index');

Route::get('/', [AuthController::class, 'index']);

Route::post('actionlogin', [AuthController::class, 'actionlogin'])->name('actionlogin');

Route::get('/logout', [AuthController::class, 'actionlogout']);

Route::get('/home', [AdminController::class, 'index']);

Route::get('/dashboard', function () {
    $data = ['content' => 'dashboard.dashboard'];
    return view('template.wrapper', $data);
});

Route::resource('/users', AdminUserController::class);
