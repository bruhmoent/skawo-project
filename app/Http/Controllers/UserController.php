<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use App\Models\TripSchedule;
use App\Models\User;

class UserController extends Controller
{
    public function getUserDataAndTrips(Request $request)
    {
        $username = $request->input('username');

        if (!$username) {
            return redirect()->route('error.route')->with('status', 'error')->with('message', 'User not authenticated.');
        }

        else{
                $user = DB::table('users')->where('username', $username)->first();
                $userId = $user->id;
                if (!$userId) {
                    return redirect()->route('error.route')->with('status', 'error')->with('message', 'User not found.');
                }
        
                $trips = DB::table('trip_schedules')
                       ->whereJsonContains('participants', $userId)
                       ->get();

                $userData = [
                    'username' => $user->username,
                    'name' => $user->name,
                    'surname' => $user->surname,
                ];
        
                // Return to the account route with this data
                return view('account', ['user_data' => $userData, 'trips_data' => $trips]);
            }

            return redirect()->route('error.route')->with('status', 'error')->with('message', 'Invalid username format.');
        }
        
}
