<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">

    <title>Skawo - Your Account</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/8b6addd488.js" crossorigin="anonymous"></script>
    <script src="{{ asset('scripts/main.js') }}"></script>

    <!-- Styles -->
    <link rel="stylesheet" href="{{ asset('public_css/header.css') }}">
    <link rel="stylesheet" href="{{ asset('public_css/account.css') }}">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Icon -->
    <link rel="icon" href="{{ asset('Skawo-Glass.ico') }}" type="image/x-icon">
</head>

<body>
    <div class="header">
    <img src="{{ asset('mirrors/Skawo-Glass.png') }}" alt="Logo" class="logo-img">
        <div class="overlay">
        </div>
        <div class="text-section">
            <div style="font-size: 48px"class="logo-text">☸ • SKAWO • ☸</div>
            <div class="divider"></div>
            <div class="main-text">Discover Scandinavia: Your Gateway to Nordic Adventures!</div>
        </div>
    </div>

    <div class="container">
        <div class="nav-item" onclick="redirect_to_route('about')">ABOUT </div>
        <div class="nav-item" onclick="redirect_to_route('start_booking')">START BOOKING</div>
        <div class="nav-item" onclick="redirect_to_route('sign_in')">SIGN IN</div>
        <div class="nav-item" onclick="redirect_to_route('sign_out')">SIGN OUT</div>
        <div class="nav-item">Welcome, <span id="username-display">{{ request()->username ?? 'Guest'}}</span>!</div>
    </div>

    <div id="middle">

    <div id="middle-wrapper">
    <h1 id="text-middle"><i class="fa-solid fa-user"></i> of: {{ request()->username ?? 'Guest' }}</h1>

    <div id="text-middle">
        <h1 class="text-middle-soft">Enrolled Trips:</h1>
        <div id="text-container">
            <ul id="user-trips">
                @if (count($trips_data) === 0)
                    <p>No enrolled trips available.</p>
                @else
                    @foreach ($trips_data as $trip)
                        <div class="trip-info">
                            <h1 style="font-size: 28px;">"{{ $trip->description }}"</h1>
                            <i>{{ $trip->country }}</i>
                            <p>Start date: {{ $trip->start_date }}</p>
                            <p>End date: {{ $trip->end_date }}</p>
                        </div>
                    @endforeach
                @endif
            </ul>
        </div>
    </div>

    <div id="text-middle">
        <h1 class="text-middle-soft">Account Information:</h1>
        <div id="text-container">
            <div class="account-info">
                @if(!session('error'))
                <p id="user-username">Username: {{ $user_data['username'] }}</p>
                <p id="user-name">Name: {{ $user_data['name'] }}</p>
                <p id="user-surname">Surname: {{ $user_data['surname'] }}</p>
                @endif
                @if(session('error'))
                <div class="error-container">
                    {{ session('error') }}
                </div>
              @endif
            </div>
        </div>
    </div>
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