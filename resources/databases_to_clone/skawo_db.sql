-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Wrz 23, 2023 at 12:16 PM
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
(1, '[1]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(2, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
(3, '[1,2,3,4]', '2023-09-21', '2023-09-28', 'A trip to the mountains', 45.12345678, -78.12345678, NULL, NULL),
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
(2, 'john_doe', 'John', 'Doe', '$2y$10$7UEAhXykOT14uzTE9AhysOddQhW.PlJTwiehQ15Cd1/6My.CGzyty', 1, NULL, NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trip_schedules`
--
ALTER TABLE `trip_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
