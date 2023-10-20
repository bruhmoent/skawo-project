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
                    return redirect()->route('start.booking.route')
                    ->with('status', 'error')
                    ->with('message', 'User is already enrolled.');
                }
    
                if (count($participants) >= 8) {
                    return redirect()->route('start.booking.route')
                    ->with('status', 'error')
                    ->with('message', 'Maximum participants limit reached.');
                }
    
                // Add the user to the participants array.
                $participants[] = $userId;
    
                DB::table('trip_schedules')
                    ->where('id', $tripId)
                    ->update(['participants' => json_encode($participants)]);
    
                return redirect()->route('start.booking.route')
                    ->with('status', 'success')
                    ->with('message', 'Enrollment successful!');
            }
        }
        return redirect()->route('start.booking.route')
        ->with('status', 'error')
        ->with('message', 'User not authenticated or enrollment failed.');
    }

    public function cancelEnrollment(Request $request) {
        $username = $request->input('username');
        $tripId = $request->input('tripId');

        $user = DB::table('users')->where('username', $username)->first();

        if ($user) {
            $userId = $user->id;

            $tripSchedule = DB::table('trip_schedules')->find($tripId);

            if ($tripSchedule) {
                $participants = json_decode($tripSchedule->participants, true);

                if (is_array($participants) && in_array($userId, $participants)) {
                    // Remove the user from the participants array.
                    $participants = array_diff($participants, [$userId]);

                    DB::table('trip_schedules')
                        ->where('id', $tripId)
                        ->update(['participants' => json_encode(array_values($participants))]);

                    return redirect()->route('start.booking.route')
                        ->with('status', 'success')
                        ->with('message', 'Enrollment canceled successfully.');
                }
            }
        }

        return redirect()->route('start.booking.route')
            ->with('status', 'error')
            ->with('message', 'Unable to cancel enrollment.');
    }
}
