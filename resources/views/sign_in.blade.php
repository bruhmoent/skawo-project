<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">

    <title>Skawo - Sign In</title>

    <!-- Styles -->
    <link rel="stylesheet" href="{{ asset('public_css/register.css') }}">
    <link rel="stylesheet" href="{{ asset('public_css/header.css') }}">
    
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
        <div class="nav-item" onclick="redirect_to_route('sign_out')">SIGN OUT</div>
    </div>

    <div class="main-container">
        <div class="container-form">
            <h2>Sign In</h2>
            <hr class="faded-hr" style="width: 80%;">
            <form method="POST" action="{{ route('sign_in.route') }}">
                @csrf

                <div class="form-group">
                    <label for="username">Username</label>
                    <input id="username" type="text" class="form-control" name="username" autofocus>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input id="password" type="password" class="form-control" name="password" required autocomplete="new-password">
                </div>

                <button type="submit" class="btn btn-primary-form">
                    Sign In
                </button>
            </form>

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