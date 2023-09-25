<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Skawo - Welcome!</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />

    <!-- Styles -->
    <link rel="stylesheet" href="{{ asset('public_css/header.css') }}">

    <!-- Icon -->
    <link rel="icon" href="{{ asset('Skawo.ico') }}" type="image/x-icon">
</head>

<body>
    <div class="header">
    <img src="{{ asset('mirrors/Skawo.png') }}" alt="Logo" class="logo-img">
        <div class="overlay">
        </div>
        <div class="text-section">
            <div style="font-size: 48px"class="logo-text">SKAWO</div>
            <div class="divider"></div>
            <div class="main-text">Discover Scandinavia: Your Gateway to Nordic Adventures!</div>
        </div>
    </div>

    <div class="container">
        <div class="nav-item">ABOUT</div>
        <div class="nav-item">SIGN IN</div>
        <div class="nav-item">SIGN OUT</div>
        <div class="nav-item">BOOK</div>
        <div class="nav-item">Welcome, $user!</div>
    </div>
    <?php
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

    ?>
    
</body>
</html>