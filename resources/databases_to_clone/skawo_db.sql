-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Paź 03, 2023 at 11:14 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skawo_db`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_21_210448_create_workflows_table', 1),
(6, '2023_09_23_094946_create_trip_schedule_table', 2),
(7, '2023_09_23_094953_create_users_table', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'user-access-token', '9514258c46f57f2bb3948862467e7ed8f51ba80d047f07c10cd1e8dc190773ac', '[\"*\"]', NULL, NULL, '2023-10-03 13:24:14', '2023-10-03 13:24:14'),
(2, 'App\\Models\\User', 3, 'user-access-token', 'fe9a1b8370a0f70401b4d81949ab06b028c1f38f2516145d04d0fb66bb64f7ec', '[\"*\"]', NULL, NULL, '2023-10-03 13:24:20', '2023-10-03 13:24:20'),
(3, 'App\\Models\\User', 3, 'user-access-token', 'e663c81639badb4b41d615bd8ccab841f0e8c8f5e871bcbadc4371b85d309027', '[\"*\"]', NULL, NULL, '2023-10-03 13:26:38', '2023-10-03 13:26:38'),
(4, 'App\\Models\\User', 3, 'user-access-token', 'f8b7293e3db7b537a21187dfe1a1b61470fb272427349815ec63c27ecbb58014', '[\"*\"]', NULL, NULL, '2023-10-03 13:28:44', '2023-10-03 13:28:44'),
(5, 'App\\Models\\User', 3, 'user-access-token', 'b8041bd77f7372f6585e744e29f68266a764240c44bee6dd63afaaebf0b34e84', '[\"*\"]', NULL, NULL, '2023-10-03 13:33:54', '2023-10-03 13:33:54'),
(6, 'App\\Models\\User', 3, 'user-access-token', '36035158fba0efb7729a6f90407f531ad352fa3aede8d8495e0ff4c6b4113b92', '[\"*\"]', NULL, NULL, '2023-10-03 13:34:53', '2023-10-03 13:34:53'),
(7, 'App\\Models\\User', 3, 'user-access-token', '6380a0cff1e52b9eea3c091870f9631dee4867e8d3d7f999311e409e156b36cc', '[\"*\"]', NULL, NULL, '2023-10-03 13:38:38', '2023-10-03 13:38:38'),
(8, 'App\\Models\\User', 3, 'user-access-token', 'b3c9fc537a821fe57609981f97a0be713975efb462fdd94bd986592223011e99', '[\"*\"]', NULL, NULL, '2023-10-03 13:46:46', '2023-10-03 13:46:46'),
(9, 'App\\Models\\User', 3, 'user-access-token', 'd5da8129d79e0f0a8daf6923193df09406f3fc0c18b4c447f403c9de8cd71c15', '[\"*\"]', NULL, NULL, '2023-10-03 13:47:56', '2023-10-03 13:47:56'),
(10, 'App\\Models\\User', 3, 'user-access-token', '7150737d543b6f1064f2a1c9078ac983ee5b13f610bcd68e6573010351dacb50', '[\"*\"]', NULL, NULL, '2023-10-03 13:50:03', '2023-10-03 13:50:03'),
(11, 'App\\Models\\User', 3, 'user-access-token', 'e1de53fd1c5711cdc7d84ccd0bda2394f85b3acadde363b1f41e8497301da3dd', '[\"*\"]', NULL, NULL, '2023-10-03 13:50:11', '2023-10-03 13:50:11'),
(12, 'App\\Models\\User', 3, 'user-access-token', '63053dfa7c1a12da2d4fe1c548521fd798aa48c2696a7543031b0d8694d05437', '[\"*\"]', NULL, NULL, '2023-10-03 13:50:41', '2023-10-03 13:50:41'),
(13, 'App\\Models\\User', 3, 'user-access-token', '5afac4c8c3474cea42d859d813c0dd1d49b6308ed33935a6ad8236c509132f54', '[\"*\"]', NULL, NULL, '2023-10-03 13:50:59', '2023-10-03 13:50:59'),
(14, 'App\\Models\\User', 3, 'user-access-token', 'f1fd3aedd313fe27a58e51bedde7d91e0a0c9f70ac9c8a44c71fc3562f45cd53', '[\"*\"]', NULL, NULL, '2023-10-03 13:52:06', '2023-10-03 13:52:06'),
(15, 'App\\Models\\User', 3, 'user-access-token', '0904f95250d2a986c433383a77df7b465691f0f5156bae513386614dbe648246', '[\"*\"]', NULL, NULL, '2023-10-03 13:52:17', '2023-10-03 13:52:17'),
(16, 'App\\Models\\User', 3, 'user-access-token', 'ab9eb75f8e6d80674bf59e25c3d7f1ad673be7ad869e118550f7328899e7f343', '[\"*\"]', NULL, NULL, '2023-10-03 13:53:41', '2023-10-03 13:53:41'),
(17, 'App\\Models\\User', 3, 'user-access-token', 'bce0f73406b81b7009c1d995478ba1a59c90ab5a19641fbfddaf717c2a7cc8ee', '[\"*\"]', NULL, NULL, '2023-10-03 13:54:42', '2023-10-03 13:54:42'),
(18, 'App\\Models\\User', 3, 'user-access-token', 'c60cc927e5428779c569bd84be74dd2b1dfe1027b80ba30a6d95c39092c6d888', '[\"*\"]', NULL, NULL, '2023-10-03 13:58:42', '2023-10-03 13:58:42'),
(19, 'App\\Models\\User', 3, 'user-access-token', '0b0be1401af4a02ac143e0cb34d7a746c261ade18dcea1fa5ea689ecbea3c3d1', '[\"*\"]', NULL, NULL, '2023-10-03 13:58:49', '2023-10-03 13:58:49'),
(20, 'App\\Models\\User', 3, 'user-access-token', '102c074c3d44d4b3cb087f8815b03f299737968464639209c442832d802b77f8', '[\"*\"]', NULL, NULL, '2023-10-03 14:01:57', '2023-10-03 14:01:57'),
(21, 'App\\Models\\User', 6, 'user-access-token', 'f73c4f4c3cfd970a6504f234139cffbde3d14190498281b5044d01002df497d4', '[\"*\"]', NULL, NULL, '2023-10-03 14:06:41', '2023-10-03 14:06:41'),
(22, 'App\\Models\\User', 6, 'user-access-token', '22b4575115d5f0f59c98575822c9d5c8a84b84f6b68de978a69e538ddace6e25', '[\"*\"]', NULL, NULL, '2023-10-03 14:08:17', '2023-10-03 14:08:17'),
(23, 'App\\Models\\User', 6, 'user-access-token', '1d034f17039a796fc1038857e9913b875b25d98c285ad371b49f1b3a7fe76fac', '[\"*\"]', NULL, NULL, '2023-10-03 14:08:53', '2023-10-03 14:08:53'),
(24, 'App\\Models\\User', 6, 'user-access-token', '8997c77491f5a68bde6e4f3b10c21ed7dfe5dcc3aa0b406832e2188bcb3c691b', '[\"*\"]', NULL, NULL, '2023-10-03 14:10:34', '2023-10-03 14:10:34'),
(25, 'App\\Models\\User', 7, 'user-access-token', 'ec27fc0088c7856dab41d790c5ca6fbe90031e78be768c488dfc6fbc06742506', '[\"*\"]', NULL, NULL, '2023-10-03 14:10:51', '2023-10-03 14:10:51'),
(26, 'App\\Models\\User', 3, 'user-access-token', '97e1922826f5681e5c510b7eb2fd7ec92fe2611ffa583207b826be7fa81e6d97', '[\"*\"]', NULL, NULL, '2023-10-03 14:12:37', '2023-10-03 14:12:37'),
(27, 'App\\Models\\User', 8, 'user-access-token', '742373c6018a53b619ac5e4d8e347c3889dbd84b372dbe220effbcc0987c54bc', '[\"*\"]', NULL, NULL, '2023-10-03 18:38:16', '2023-10-03 18:38:16');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trip_schedules`
--

CREATE TABLE `trip_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `participants` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`participants`)),
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trip_schedules`
--

INSERT INTO `trip_schedules` (`id`, `participants`, `start_date`, `end_date`, `description`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, '[1]', '2023-10-02', '2023-10-05', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(2, '[1,2,3,4]', '2023-06-02', '2023-08-25', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(3, '[1,2,3,4]', '2023-10-02', '2023-10-19', 'IKEA History Trip', 45.12345678, -78.12345678, NULL, NULL),
(4, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(5, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(6, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(7, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(8, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(9, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(10, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(11, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(12, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(13, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(14, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(15, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(16, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(17, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(18, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(19, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(20, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(21, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(22, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(23, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(24, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(25, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(26, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(27, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(28, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(29, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(30, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(31, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(32, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(33, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(34, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(35, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(36, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(37, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(38, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(39, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(40, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `trip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `surname`, `password`, `trip_id`, `created_at`, `updated_at`) VALUES
(1, 'bober', 'bobbing', 'jajo', '3', 1, NULL, NULL),
(2, 'john_doe', 'John', 'Doe', '$2y$10$7UEAhXykOT14uzTE9AhysOddQhW.PlJTwiehQ15Cd1/6My.CGzyty', 1, NULL, NULL),
(3, '1', '1', '1', '$2y$10$V1qFuHpOOULcPpAwE.aNdOCWvMcPMjnSTem8qDDYgRSwp/amzcE3a', NULL, NULL, NULL),
(4, '123', '123', '123', '$2y$10$.Kte5l7MIIhK7yssVm7U3.T0zKs/ESh2wjo4uDIwPBkDJfHvV0h7W', NULL, NULL, NULL),
(5, '213', '123', '123', '$2y$10$kJPQOxkGpepwrI06FULcFOCTYKtI5eEAQd06Oq2oKO./BskZelIE6', NULL, NULL, NULL),
(6, 'bob', '1', '1', '$2y$10$HZmzl0CJVAfHPkJ2mXWSluQsrMEX2qYa5NKLmqvG3q4Yiz.fsEuvi', NULL, NULL, NULL),
(7, 'bobas', '1', '1', '$2y$10$L3RDnT7ZE2SlZby9GMGYI.OAw/qklU6HhBKZHCPLRI2xUWgRcrFoa', NULL, NULL, NULL),
(8, 'bbb', 'bbb', 'bbb', '$2y$10$nDlz1fRVIGbLGtSR4m.33uSNfrQSc0c7Z2R31Pg8R7NdzdiwyASfW', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `_workflow`
--

CREATE TABLE `_workflow` (
  `_ID` int(11) NOT NULL,
  `_LOG` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `_workflows`
--

CREATE TABLE `_workflows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `_LOG` varchar(99) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_workflows`
--

INSERT INTO `_workflows` (`id`, `_LOG`, `created_at`, `updated_at`) VALUES
(1, 'DEBUG::LOG', '2023-09-21 19:08:01', '2023-09-21 19:08:01'),
(2, 'DEBUG::LOG', '2023-09-21 19:08:30', '2023-09-21 19:08:30'),
(3, 'DEBUG::LOG', '2023-09-21 19:08:30', '2023-09-21 19:08:30'),
(4, 'DEBUG::LOG', '2023-09-21 19:08:30', '2023-09-21 19:08:30'),
(5, 'DEBUG::LOG', '2023-09-21 19:08:30', '2023-09-21 19:08:30'),
(6, 'DEBUG::LOG', '2023-09-21 19:08:30', '2023-09-21 19:08:30'),
(7, 'DEBUG::LOG', '2023-09-21 19:08:30', '2023-09-21 19:08:30'),
(8, 'DEBUG::LOG', '2023-09-21 19:08:30', '2023-09-21 19:08:30'),
(9, 'DEBUG::LOG', '2023-09-21 19:08:30', '2023-09-21 19:08:30'),
(10, 'DEBUG::LOG', '2023-09-21 19:08:30', '2023-09-21 19:08:30'),
(11, 'DEBUG::LOG', '2023-09-21 19:08:38', '2023-09-21 19:08:38');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeksy dla tabeli `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeksy dla tabeli `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeksy dla tabeli `trip_schedules`
--
ALTER TABLE `trip_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_trip_id_foreign` (`trip_id`);

--
-- Indeksy dla tabeli `_workflow`
--
ALTER TABLE `_workflow`
  ADD PRIMARY KEY (`_ID`);

--
-- Indeksy dla tabeli `_workflows`
--
ALTER TABLE `_workflows`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `trip_schedules`
--
ALTER TABLE `trip_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `_workflow`
--
ALTER TABLE `_workflow`
  MODIFY `_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_workflows`
--
ALTER TABLE `_workflows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trip_schedules` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
