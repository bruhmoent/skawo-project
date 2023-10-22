<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    public function register(Request $request)
    {
        $username = $request->input('username');
        $name = $request->input('name');
        $surname = $request->input('surname');
        $password = $request->input('password');

        $existing_user = DB::table('users')->where('username', $username)->first();

        if ($existing_user) {
            return redirect()->route('register.route')->with('status', 'error')->with('message', 'Username already exists.');
        }

        $hashed_password = Hash::make($password);

        DB::table('users')->insert([
            'username' => $username,
            'name' => $name,
            'surname' => $surname,
            'password' => $hashed_password,
        ]);

        return redirect()->route('register.route')->with('status', 'success')->with('message', 'Registration successful!');
    }
}