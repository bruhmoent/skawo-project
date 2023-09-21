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
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">

    <!-- Icon -->
    <link rel="icon" href="{{ asset('Skawo.ico') }}" type="image/x-icon">
</head>

<body>
    <p>Welcome to Skawo!</p>

    <?php

    // EXAMPLE: Obtain data from table:
    $_workflows = \App\Models\_workflow::all();

    // EXAMPLE: Obtain data from table by specific ID:
    $_workflow = \App\Models\_workflow::find(1);

    // EXAMPLE: Create a new workflow
    $_new_log = \App\Models\_workflow::create([
        '_LOG' => "DEBUG::LOG"
    ]);

    echo $_workflow['_LOG'];
    ?>
</body>
</html>
