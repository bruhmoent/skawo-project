-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lis 06, 2023 at 08:14 PM
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
-- Database: `sqlposthost`
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
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`, `id`) VALUES
('App\\Models\\User', 1, 'user-access-token', '2ff37f46e62b4f91fb899ddef6489d2ebfba2b727c20dcf3e55f44acf710b817', '[\"*\"]', NULL, NULL, '2023-11-05 13:05:19', '2023-11-05 13:05:19', 1),
('App\\Models\\User', 2, 'user-access-token', '0cb513882ec448e6322e87bf13f75cabcce8482db2b8c74be1dbfcbd77fd1638', '[\"*\"]', NULL, NULL, '2023-11-05 13:58:00', '2023-11-05 13:58:00', 2),
('App\\Models\\User', 2, 'user-access-token', '9743bf826ed76319c98e7536ee2f53222061ffc1cea028e29ddb769484ee4764', '[\"*\"]', NULL, NULL, '2023-11-05 14:29:05', '2023-11-05 14:29:05', 3),
('App\\Models\\User', 2, 'user-access-token', '8b91adf4a2932fefc29f4ad7059c9891a9e8c9752ac64e86af4837521298c718', '[\"*\"]', NULL, NULL, '2023-11-05 14:32:14', '2023-11-05 14:32:14', 4),
('App\\Models\\User', 2, 'user-access-token', 'c019a5bcc0c67e8045ab67925bf4a5e88771f1fcdce873f2564df5d47f05574f', '[\"*\"]', NULL, NULL, '2023-11-05 16:17:16', '2023-11-05 16:17:16', 5),
('App\\Models\\User', 2, 'user-access-token', 'c286392bcb166a298e99a3b3961573ed0cad8d99f90e9e26fc99956fc8b29bff', '[\"*\"]', NULL, NULL, '2023-11-06 17:29:20', '2023-11-06 17:29:20', 6),
('App\\Models\\User', 2, 'user-access-token', 'ac0b6642ce73984f584f1f58d1226d28c58605cfd024b8caec1f756f8dfcaf96', '[\"*\"]', NULL, NULL, '2023-11-06 18:04:26', '2023-11-06 18:04:26', 7),
('App\\Models\\User', 1, 'user-access-token', 'd6b8109ad511c051421d9422956bbbb0979cdd4a0e0e376c20b295d4dbd43693', '[\"*\"]', NULL, NULL, '2023-11-06 18:05:12', '2023-11-06 18:05:12', 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trip_schedules`
--

CREATE TABLE `trip_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `participants` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `trip_schema` varchar(99) DEFAULT NULL,
  `pricing` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trip_schedules`
--

INSERT INTO `trip_schedules` (`id`, `participants`, `start_date`, `end_date`, `description`, `latitude`, `longitude`, `created_at`, `updated_at`, `country`, `trip_schema`, `pricing`) VALUES
(41, '[]', '2023-11-01', '2023-11-08', 'Finland Forest Camp', 64.56178191, 27.06494018, NULL, NULL, 'Finland', '8am - Group meetup starts at: Place A; 10am - Guided tour of Location B...', 450.00),
(42, '[2]', '2023-11-08', '2023-11-12', 'IKEA History Celebration Trip', 56.55203546, 14.13591407, NULL, NULL, 'Sweden', '8am - Group meetup starts at: Place X; 10am - Guided tour of Location Y...', 355.00),
(43, '[]', '2023-11-08', '2023-11-12', 'Learn about Norway`s Culture!', 59.91390000, 10.75220000, NULL, NULL, 'Norway', '8am - Group meetup starts at: Place P; 10am - Guided tour of Location Q...', 455.00),
(44, '[2]', '2023-11-09', '2023-11-12', 'Explore Together: Helsinki', 60.16650760, 24.92389263, NULL, NULL, 'Finland', '8am - Group meetup starts at: Place C; 10am - Guided tour of Location D...', 550.00),
(45, '[]', '2023-10-20', '2023-10-26', 'IKEA History Celebration Trip', 56.55203546, 14.13591407, NULL, NULL, 'Sweden', '8am - Group meetup starts at: Place R; 10am - Guided tour of Location S...', 325.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `username` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `trip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `name`, `surname`, `password`, `trip_id`, `created_at`, `updated_at`, `id`) VALUES
('1', '1', '1', '$2y$10$xZvPdhNzOXNi6S4SqUEcru09tCtc.kzMTmfB7WXUACr6cn0vdy4Gm', NULL, NULL, NULL, 1),
('accountname', '1', '1', '$2y$10$4sQ4IBzfeqZeIPlyBLXGEeqfOHXYGJMQFQRuFhFayblUvWvGEDD5S', NULL, NULL, NULL, 2);

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
-- Indeksy dla tabeli `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `trip_schedules`
--
ALTER TABLE `trip_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
