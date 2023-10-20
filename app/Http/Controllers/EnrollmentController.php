<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\TripSchedule;
use App\Models\User;

class EnrollmentController extends Controller
{
    public function enrollUser(Request $request) {
        $username = $request->input('username');
        $tripId = $request->input('tripId');
    
        $user = DB::table('users')->where('username', $username)->first();
    
        if ($user) {
            $userId = $user->id;
    
            $tripSchedule = DB::table('trip_schedules')->find($tripId);
    
            if ($tripSchedule) {
                // Ensure participants is a valid JSON array.
                $participants = json_decode($tripSchedule->participants, true);
    
                if (is_array($participants) && in_array($userId, $participants)) {
                    return 'User is already enrolled.';
                }
    
                if (count($participants) >= 8) {
                    // Maximum participants limit reached.
                    return 'Maximum participants limit reached.';
                }
    
                // Add the user to the participants array.
                $participants[] = $userId;
    
                DB::table('trip_schedules')
                    ->where('id', $tripId)
                    ->update(['participants' => json_encode($participants)]);
    
                return 'Enrollment successful';
            }
        }
    
        return 'User not authenticated or enrollment failed.';
    }
}
