<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">

    <title>Skawo - Register</title>

    <!-- Styles -->
    <link rel="stylesheet" href="{{ asset('public_css/register.css') }}">
    <link rel="stylesheet" href="{{ asset('public_css/header.css') }}">
    
    <!-- Scripts -->
    <script src="{{ asset('scripts/main.js') }}"></script>

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
        <div class="nav-item" onclick="redirect_to_route('about')">ABOUT</div>
        <div class="nav-item" onclick="redirect_to_route('start_booking')">START BOOKING</div>
        <div class="nav-item" onclick="redirect_to_route('sign_in')">SIGN IN</div>
        <div class="nav-item" onclick="redirect_to_route('sign_out')">SIGN OUT</div>
    </div>

    <div class="main-container">
    <div class="container-form">
        <fieldset style="padding: 10px;">
                <legend>Register</legend>
                <form method="POST" action="{{ route('register.route') }}">
                    @csrf

                    <div class="form-group">
                        <label for="username">Username</label>
                        <input id="username" type="text" class="form-control" name="username" autofocus>
                    </div>

                    <div class="form-group">
                        <label for="surname">Surname</label>
                        <input id="surname" type="text" class="form-control" name="surname" required autocomplete="surname" autofocus>
                    </div>

                    <div class="form-group">
                        <label for="name">Name</label>
                        <input id="name" type="text" class "form-control" name="name" required autocomplete="name" autofocus>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input id="password" type="password" class="form-control" name="password" required autocomplete="new-password">
                    </div>

                    <button type="submit" class="btn btn-primary-form">
                        Register
                    </button>
                </form>
        </fieldset>

        @if(session('status') && session('message'))
            <div class="{{ session('status') }}-message-form">
                {{ session('message') }}
            </div>
        @endif
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