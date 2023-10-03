<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Cookie;

class SignInController extends Controller
{
    public function sign_in(Request $request)
    {
        $username = $request->input('username');
        $password = $request->input('password');

        $user = User::where('username', $username)->first();

        if (!$user) {
            return redirect()->route('sign_in.route')->with('status', 'error')->with('message', 'Invalid username or password.');
        }

        if (Hash::check($password, $user->password)) {
            // Create a personal access token for the user.
            $token = $user->createToken('user-access-token');

            // Use the token id as the encrypted username.
            $encryptedUsername = encrypt($token->plainTextToken);

            $cookie = cookie('username', $encryptedUsername, 10 * 365 * 24 * 60);

            return redirect()->route('sign_in.route')
                ->withCookie($cookie)
                ->with('status', 'success')
                ->with('message', 'Login successful!')
                ->with('username', $username);
        }
    }
}

