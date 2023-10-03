<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Skawo - Welcome</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/8b6addd488.js" crossorigin="anonymous"></script>

    <!-- Styles -->
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
        <div class="nav-item" onclick="redirect_to_route('sign_in')">SIGN IN</div>
        <div class="nav-item" onclick="redirect_to_route('sign_out')">SIGN OUT</div>
        <div class="nav-item">Welcome, <span id="username-display">{{ request()->username ?? 'Guest'}}</span>!</div>
    </div>
    
    <div id="middle">
        <h1 id="text-middle">What's our mission?</h1>
        <div id="middle-content">
        <div id="infodiv">
        <h5>Our offers right now:</h5>
        <hr class="faded-hr" style="width: 80%;">

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
            else 
            {
                echo '<div id="offers-list-container">';
                foreach ($trip_scheludes as $trip_schelude)
                {
                    $trip_name = $trip_schelude->description;
                    $participant_ids = json_decode($trip_schelude->participants);
                    $participant_count = count($participant_ids);
                    $remaining_slots = max(0, 8 - $participant_count);

                    echo '<div class="trip-offer">';
                    echo '<h2>' . $trip_name . '</h2><hr class="faded-hr" style="width: 60%;"> Participants: <hr class="faded-hr" style="width: 60%;"><br>';
                    echo '<div class="person-container">';

                    for ($i = 0; $i < $participant_count; $i++) 
                    {
                        echo '<i class="fa-solid fa-person participant"></i>';
                    }
                    
                    for ($i = 0; $i < $remaining_slots; $i++) 
                    {
                        echo '<i class="fa-solid fa-person" style="color: gray;"></i>';
                    }
                    
                    echo '</div>';
                    echo '</div>';
                }
                echo '</div>';
            }
        ?>
        </div>

        <div id="middle-center">
            <div id="spin-wheel">
                <div id="spinner">☸</div>
            </div>

            <div id="text-container">
                <h1>Welcome to Skawo: Your Gateway to Nordic Adventures!</h1>
                <hr class="faded-hr" style="width: 80%;">
                <p>
                    Are you ready to embark on a journey of discovery through the stunning landscapes and vibrant cultures of Scandinavia? Look no further than Skawo - your digital passport to a world of Nordic wonders!
                </p>

                <p>
                    Skawo is more than just a web app; it's an invitation to immerse yourself in the beauty and magic that Scandinavia has to offer. From the majestic fjords of Norway to the picturesque forests of Sweden, and the fascinating history of Denmark - Skawo is here to guide you on an unforgettable adventure.
                </p>

                <h2>Why Choose Skawo?</h2>

                <ul>
                <li>Explore the best destinations across Scandinavia with ease and convenience.</li>
                <li>Discover hidden gems and lesser-known spots recommended by fellow adventurers.</li>
                <li>Access expert travel tips and curated itineraries to make the most of your trip.</li>
                <li>Connect with a community of like-minded explorers and share your experiences.</li>
                </ul>

                <p>
                    Join us at Skawo and unlock a world of breathtaking landscapes, rich history, and the warm hospitality of the Nordic region. Your adventure begins here - let's embrace the beauty of Scandinavia together!
                </p>
            </div>
            <button id="mid-but">
                <div id="mid-but-text" onclick="redirect_to_route('register')">Register</div>
            </button>
        </div>
    </div>
    
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

    <?php
    /*
        $participants = [1, 2, 3, 4];
        $json_participants = json_encode($participants);

        // Check if the trip schedule already exists.
        $trip_schedule = DB::table('trip_schedules')->where('id', 1)->first();

        if (!$trip_schedule) 
        {
            DB::table('trip_schedules')->insert([
                'participants' => $json_participants,
                'start_date' => '2023-09-21',
                'end_date' => '2023-09-28',
                'description' => 'A trip to the mountains',
                'latitude' => 45.12345678,
                'longitude' => -78.12345678,
            ]);

            $trip_schedule = DB::table('trip_schedules')->where('id', 1)->first();
        }

        // Check if the user already exists.
        $user = DB::table('users')->where('username', 'john_doe')->first();

        if (!$user) 
        {
            DB::table('users')->insert([
                'username' => 'john_doe',
                'name' => 'John',
                'surname' => 'Doe',
                'password' => bcrypt('password123'),
                'trip_id' => $trip_schedule->id,
            ]);

            $user = DB::table('users')->where('username', 'john_doe')->first();
        }

        if ($trip_schedule && $user) 
        {
            //echo $user->name . " participated in: " . $trip_schedule->description;
        } else 
        {
            //echo "Unable to find the required records.";
        }

        if ($trip_schedule) 
        {
            $participants = json_decode($trip_schedule->participants, true);
        
            $participants_to_add = 1;
            if (!in_array($participants_to_add, $participants)) 
            {
                // Add the participant to the array.
                $participants[] = $participants_to_add;
        
                $json_participants = json_encode($participants);
        
                // Update the participants in the database.
                DB::table('trip_schedules')->where('id', 1)->update([
                    'participants' => $json_participants,
                ]);
        
                //echo "Participant added successfully.";
            } else 
            {
                //echo "Participant already exists in the participants array.";
            }
        } else 
        {
            //echo "Trip schedule not found.";
        }

        $participant_ids = json_decode($trip_schedule->participants);

        // Fetch participant names from the users table.
        $participants = DB::table('users')
            ->whereIn('id', $participant_ids)
            ->pluck('name');

        // Display the name of the participants names.
        foreach ($participants as $participant) 
        {
        // echo $participant . '<br>';
        }
        */  
    ?>

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
