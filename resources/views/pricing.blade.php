<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">

    <title>Skawo - Pricing</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/8b6addd488.js" crossorigin="anonymous"></script>
    <script src="{{ asset('scripts/main.js') }}"></script>

    <!-- Styles -->
    <link rel="stylesheet" href="{{ asset('public_css/header.css') }}">
    <link rel="stylesheet" href="{{ asset('public_css/pricing.css') }}">

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
        <h1 id="text-middle">Our pricing list:</h1>
        <div id="middle-content">

        <div id="middle-center">
            <div id="text-container">
            <select id="country-select">
                <option value="all">All</option>
                <option value="Finland">Finland</option>
                <option value="Sweden">Sweden</option>
                <option value="Norway">Norway</option>
            </select>

            <table id="pricing-table" class="styled-table">
                <thead>
                    <tr>
                        <th>Trip Description</th>
                        <th>Country</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Pricing ($)</th>
                        <th>Number of Days</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>

            <p id="average-price">Average Price Per Day: $0.00</p>
        </div>

        <?php
            $trip_schedules = DB::table('trip_schedules')
                            ->get();

            if ($trip_schedules->isEmpty()) {
                echo '<div id="error-message">';
                echo '<div class="animated-text"><i class="fa-solid fa-triangle-exclamation fa-beat fa-3x" style="color: rgb(255, 255, 255);"></i></div>';
                echo '<hr class="faded-hr" style="width: 50%;">';
                echo 'Sorry! We had a problem finding trips in our database.';
                echo '</div>';
            }
        ?>

        <script>
            $(document).ready(function() {
            var tripSchedules = {!! json_encode($trip_schedules) !!};

            function updatePricingTable(selectedCountry) {
                var totalPrice = 0;
                var totalDays = 0;
                var $tableBody = $('#pricing-table tbody');

                // Clear the existing table content.
                $tableBody.empty();

                tripSchedules.forEach(function(trip) {
                if (selectedCountry === 'all' || trip.country === selectedCountry) {
                    var startDate = new Date(trip.start_date);
                    var endDate = new Date(trip.end_date);
                    var timeDiff = endDate - startDate;
                    var daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));

                    // Check if trip.pricing is a valid number.
                    if (!isNaN(parseFloat(trip.pricing))) {
                        totalPrice += parseFloat(trip.pricing);
                        totalDays += daysDiff;

                        $tableBody.append(`
                            <tr>
                                <td>${trip.description}</td>
                                <td>${trip.country}</td>
                                <td>${trip.start_date}</td>
                                <td>${trip.end_date}</td>
                                <td>${parseFloat(trip.pricing).toFixed(2)}</td>
                                <td>${daysDiff}</td>
                            </tr>
                        `);
                    }
                }
                });
                // Calculate and display the average price per day.
                var averagePricePerDay = totalDays > 0 ? totalPrice / totalDays : 0;
                $('#average-price').text('Average Price Per Day: $' + averagePricePerDay.toFixed(2));
            }

                // Initialize with all countries selected.
                updatePricingTable('all');

                // Handle country selection change.
                $('#country-select').change(function() {
                    var selectedCountry = $(this).val();
                    updatePricingTable(selectedCountry);
                });
            });

            </script>
            <button id="mid-but">
                <div id="mid-but-text" onclick="redirect_to_route('start_booking')">Start booking!</div>
            </button>
        </div>
    </div>
    
    <h1 id="featured-text"> Featured photos from our community: </h1>

    <div id="footer">
        <button id="arrow-left" onclick="show(-1)"><i class="arrow left"></i></button>

        <div id="carousel-container">
        <ul id="slider">
            <li class="slider-page">
            <div class="slide-content">
                <img class="slider-img img1" src="//picsum.photos/300/200?1" alt="Slide 1">
                <img class="slider-img img2" src="//picsum.photos/300/200?2" alt="Slide 2">
            </div>
            </li>
            <li class="slider-page">
            <div class="slide-content">
                <img class="slider-img img3" src="//picsum.photos/300/200?3" alt="Slide 3">
                <img class="slider-img img4" src="//picsum.photos/300/200?4" alt="Slide 4">
            </div>
            </li>
        </ul>
        </div>

        <button id="arrow-right" onclick="show(+1)"><i class="arrow right"></i></button>
    </div>
  
    <script>
        let slider = document.getElementById('slider');
        let li_els = slider.querySelectorAll('li');
        let index = 0;

        function show(increase) 
        {
        index = index + increase;
        index = Math.min(Math.max(index, 0), li_els.length - 1);
        li_els[index].scrollIntoView({
            behavior: 'smooth',
            block: 'center',
            inline: 'nearest'
        });
        }
    
        window.addEventListener("load", (event) => {
            show(1);
        });
    </script>

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