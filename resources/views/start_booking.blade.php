<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    
    <title>Skawo - Booking</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/8b6addd488.js" crossorigin="anonymous"></script>

    <!-- Styles -->
    <link rel="stylesheet" href="{{ asset('public_css/header.css') }}">
    <link rel="stylesheet" href="{{ asset('public_css/booking.css') }}">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="{{ asset('scripts/main.js') }}"></script>

    <!-- Icon -->
    <link rel="icon" href="{{ asset('Skawo-Glass.ico') }}" type="image/x-icon">
</head>

<body>

<div class="header">
    <img src="{{ asset('mirrors/Skawo-Glass.png') }}" alt="Logo" class="logo-img">
    <div class="overlay"></div>
    <div class="text-section">
        <div style="font-size: 48px" class="logo-text">☸ • SKAWO • ☸</div>
        <div class="divider"></div>
        <div class="main-text">Discover Scandinavia: Your Gateway to Nordic Adventures!</div>
    </div>
</div>

<div class="container">
    <div class="nav-item" onclick="redirect_to_route('about')">ABOUT</div>
    <div class="nav-item" onclick="redirect_to_route('start_booking')">START BOOKING</div>
    <div class="nav-item" onclick="redirect_to_route('sign_in')">SIGN IN</div>
    <div class="nav-item" onclick="redirect_to_route('sign_out')">SIGN OUT</div>
    <div class="nav-item">Welcome, <span id="username-display">{{ request()->username ?? 'Guest'}}</span>!</div>
</div>

<div id="booking-container">
<div id="map" style="height: 400px;"></div>

<div id="trip-details-container">
    <h2>Selected Trip:</h2>
    <div class="trip-map" id="finland-map">
    @if (session('status') && session('message') != 'Enrollment canceled successfully.' )
        <div class="{{ session('status') }}-message">
            {{ session('message') }}
        @if (session('status') && session('message') != 'Enrollment successful!')
            <p>ⓘ Click on a trip to cancel enrollment.</p>
        @endif
        </div>
    @endif
    </div>
</div>

<?php
    $today = now()->toDateString();
    $next_month = now()->addMonth()->toDateString();

    $trip_scheludes = DB::table('trip_schedules')
        ->where('start_date', '>=', $today)
        ->where('start_date', '<=', $next_month)
        ->get();

    if ($trip_scheludes->isEmpty()) 
    {
        echo '<div id="error-message">';
        echo '<div class="animated-text"><i class="fa-solid fa-triangle-exclamation fa-beat fa-3x" style="color: rgb(255, 255, 255);"></i></div>';
        echo '<hr class="faded-hr" style="width: 50%;">';
        echo 'Sorry! There aren\'t currently any active trips.';
        echo '</div>';
    } 
?>

<script>
    $(document).ready(function() {
        var map = L.map('map').setView([0, 0], 2);

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 18,
        }).addTo(map);

        var tripSchedules = {!! json_encode($trip_scheludes) !!};

        for (var i = 0; i < tripSchedules.length; i++) {
            var trip = tripSchedules[i];
            var tripMarker = L.marker([trip.latitude, trip.longitude]);
            tripMarker.bindPopup(trip.description);

            tripMarker.on('click', (function(clickedTrip) {
                return function() {
                    $('#finland-map').html(`
                    @if (session('status') == 'error' && session('message') == 'User is already enrolled.')
                    <div class="{{ session('status') }}-message">
                        {{ session('message') }}
                        <form id="cancelEnrollmentForm" action="/cancelEnrollment" method="POST">
                            @csrf
                            <input type="hidden" name="tripId" value="${clickedTrip.id}">
                            <input type="hidden" name="username" value="{{ request()->username }}">
                            <button class="button-cancel-enroll" type="submit">Cancel Enrollment</button>
                        </form>
                    @endif

                        <h3 style="margin-top: 35px; font-size:21px;">${clickedTrip.description}</h3>
                        <hr style="width: 60%;" class="faded-hr"></hr>
                        <p>Start Date: ${clickedTrip.start_date}</p>
                        <p>End Date: ${clickedTrip.end_date}
                        <hr  style="width: 60%;" class="faded-hr">
                        <div class="schema-container">
                        <p>End Date: ${clickedTrip.trip_schema}
                        </div>
                        <hr  style="width: 30%;" class="faded-hr">
                        
                        @if(request()->username && request()->username !== 'Guest')
                            <form id="enrollForm" action="/enrollUser" method="POST">
                                @csrf
                                <input type="hidden" name="tripId" id="tripIdInput" value="${clickedTrip.id}">
                                <input type="hidden" name="username" value="{{ request()->username }}">
                                @if (session('status') == 'error' && session('message') == 'User is already enrolled.')
                                    <!-- Do not display the enroll button -->
                                @else
                                    <button class="button-enroll" type="submit">Enroll</button>
                                @endif
                            </form>
                        @else
                     <div style="margin-top: 5px;" class="animated-text"><i class="fa-solid fa-triangle-exclamation fa-beat fa-3x" style="color: rgb(255, 255, 255);"></i> <p>Please sign in to enroll.</p><br></div>
                    @endif
                   
                    </div>
                    `);
                };
            })(trip));

            tripMarker.addTo(map);
        }
    });
</script>
</div>

<script>
        function redirect_to_route(route) 
        {
            let redirect_url = '';

            switch (route) 
            {
                case 'about':
                    redirect_url = "{{ route('about.route') }}";
                    break;
                case 'start_booking':
                    redirect_url = "{{ route('start.booking.route') }}";
                    break;
                case 'sign_in':
                    redirect_url = "{{ route('sign.in.route') }}";
                    break;
                case 'sign_out':
                    redirect_url = "{{ route('sign.out.route') }}";
                    break;
                case 'register':
                    redirect_url = "{{ route('register.route') }}";
                    break;
                default:
                    break;
            }

            if (redirect_url) 
            {
                window.location.href = redirect_url;
            }
        }
</script>

</body>
</html>