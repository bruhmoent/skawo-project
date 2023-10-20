<?php

use App\Http\Controllers\RegisterController;
use App\Http\Controllers\SignInController;
use Illuminate\Support\Facades\Cookie;
use Laravel\Sanctum\PersonalAccessToken;
use App\Http\Middleware\SetUsernameMiddleware;

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

Route::get('/', function () {
    return view('index');
});

Route::post('/enrollUser', 'App\Http\Controllers\EnrollmentController@enrollUser');

Route::post('/cancelEnrollment', 'App\Http\Controllers\EnrollmentController@cancelEnrollment');

Route::get('/about', function (Request $request) {
    return view('index');
})->name('about.route');

Route::get('/start_booking', function () {
    return view('start_booking');
})->name('start.booking.route');

Route::get('/sign_in', function () {
    return view('sign_in');
})->name('sign.in.route');

Route::get('/sign_out', function (\Illuminate\Http\Request $request) {
    // Clear the username parameter.
    $request->merge(['username' => null]);
    $user = auth()->user();
    if ($user) {
        $user->tokens()->delete(); // Revokes all tokens associated with the user.
    }

    Cookie::queue(Cookie::forget('username'));
    return view('index')->with('reload', true);
})->name('sign.out.route');

Route::get('/register', function () {
    return view('register');
})->name('register.route');

Route::middleware('web')->group(function () {
    // Other routes:

    Route::middleware(SetUsernameMiddleware::class)->group(function () {
        Route::post('/register', [RegisterController::class, 'register'])->name('register.route');
        Route::post('/sign_in', [SignInController::class, 'sign_in'])->name('sign_in.route');
    });
});
