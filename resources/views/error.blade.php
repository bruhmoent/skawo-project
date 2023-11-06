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
    <link rel="stylesheet" href="{{ asset('public_css/register.css') }}">
    <link rel="stylesheet" href="{{ asset('public_css/error.css') }}">
    <link rel="stylesheet" href="{{ asset('public_css/account.css') }}">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Icon -->
    <link rel="icon" href="{{ asset('Skawo-Glass.ico') }}" type="image/x-icon">
</head>

<body>
   
    <div class="container">
        <div class="nav-item">Welcome, <span id="username-display">{{ request()->username ?? 'Guest'}}</span>!</div>
        <div class="nav-item" onclick="redirect_to_route('about')">ABOUT </div>
    </div>

    <div id="session-container">
    <br><img src="{{ asset('mirrors/Skawo-Glass.png') }}" alt="Logo" class="logo-img">
    <p style="color:white;" class="text-middle-soft"> If you are seeing this page, this means we have encountered the following error with your request: </p>
    @if(session('status') && session('message'))
        <div class="{{ session('status') }}-message-form">
            {{ session('message') }}
        </div>
    @endif
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