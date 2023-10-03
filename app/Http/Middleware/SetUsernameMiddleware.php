<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Crypt;
use Laravel\Sanctum\PersonalAccessToken;

class SetUsernameMiddleware
{
    public function handle($request, Closure $next)
    {
        $usernameCookie = $request->cookie('username');

        if ($usernameCookie) {
            try {
                // Decrypt the token to get the token ID.
                $tokenId = decrypt($usernameCookie);

                $token = PersonalAccessToken::findToken($tokenId);

                if ($token && $user = $token->tokenable) {
                    $request->merge(['username' => $user->username]);
                }
            } catch (\Illuminate\Contracts\Encryption\DecryptException $e) {
                \Log::error('Failed to decrypt username: ' . $e->getMessage());
            }
        }

        return $next($request);
    }
}
