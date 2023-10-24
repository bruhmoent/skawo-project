-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: sql11.freesqldatabase.com
-- Czas generowania: 24 Paź 2023, 20:08
-- Wersja serwera: 5.5.62-0ubuntu0.14.04.1
-- Wersja PHP: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `sql11654905`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `migrations`
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
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`, `id`) VALUES
('App\\Models\\User', 6, 'user-access-token', 'f73c4f4c3cfd970a6504f234139cffbde3d14190498281b5044d01002df497d4', '[\"*\"]', NULL, NULL, '2023-10-03 14:06:41', '2023-10-03 14:06:41', 1),
('App\\Models\\User', 6, 'user-access-token', '22b4575115d5f0f59c98575822c9d5c8a84b84f6b68de978a69e538ddace6e25', '[\"*\"]', NULL, NULL, '2023-10-03 14:08:17', '2023-10-03 14:08:17', 2),
('App\\Models\\User', 6, 'user-access-token', '1d034f17039a796fc1038857e9913b875b25d98c285ad371b49f1b3a7fe76fac', '[\"*\"]', NULL, NULL, '2023-10-03 14:08:53', '2023-10-03 14:08:53', 3),
('App\\Models\\User', 6, 'user-access-token', '8997c77491f5a68bde6e4f3b10c21ed7dfe5dcc3aa0b406832e2188bcb3c691b', '[\"*\"]', NULL, NULL, '2023-10-03 14:10:34', '2023-10-03 14:10:34', 4),
('App\\Models\\User', 7, 'user-access-token', 'ec27fc0088c7856dab41d790c5ca6fbe90031e78be768c488dfc6fbc06742506', '[\"*\"]', NULL, NULL, '2023-10-03 14:10:51', '2023-10-03 14:10:51', 5),
('App\\Models\\User', 8, 'user-access-token', '742373c6018a53b619ac5e4d8e347c3889dbd84b372dbe220effbcc0987c54bc', '[\"*\"]', NULL, NULL, '2023-10-03 18:38:16', '2023-10-03 18:38:16', 6),
('App\\Models\\User', 3, 'user-access-token', 'a5c64af2d026f4464133dc29e41cb6a0384ccd15bb9d9e2b22b188d36a138cab', '[\"*\"]', NULL, NULL, '2023-10-19 21:13:41', '2023-10-19 21:13:41', 7),
('App\\Models\\User', 6, 'user-access-token', '91eae5656b9e3324da114462939d22dd3964b1de5eafa3063c1aa3948ce9d935', '[\"*\"]', NULL, NULL, '2023-10-19 22:26:47', '2023-10-19 22:26:47', 8),
('App\\Models\\User', 9, 'user-access-token', '67593099a5f63b69aeac28acf08e87625df44171d118dea50ae04c27f725654d', '[\"*\"]', NULL, NULL, '2023-10-19 22:27:47', '2023-10-19 22:27:47', 9),
('App\\Models\\User', 3, 'user-access-token', 'c01e6d139a3842cc616efb1ea1c621ca187904593c23dd4affe86649291d3b7b', '[\"*\"]', NULL, NULL, '2023-10-19 22:28:03', '2023-10-19 22:28:03', 10),
('App\\Models\\User', 9, 'user-access-token', '967edd0220af8c2bc1e696b8a581e56e78db217561176ad0ea3c1de919072ca7', '[\"*\"]', NULL, NULL, '2023-10-19 22:35:28', '2023-10-19 22:35:28', 11),
('App\\Models\\User', 3, 'user-access-token', 'b26f8da400ce614a3c221536b5875dbbe2dc630c25c7e5b95ccb5372d03774c1', '[\"*\"]', NULL, NULL, '2023-10-19 22:43:53', '2023-10-19 22:43:53', 12),
('App\\Models\\User', 9, 'user-access-token', '33f397551f5ffabe8bacf5a97c639164c4697f917fdd5311c515e7bcb001ad6d', '[\"*\"]', NULL, NULL, '2023-10-19 22:46:12', '2023-10-19 22:46:12', 13),
('App\\Models\\User', 9, 'user-access-token', '8d0b6202c2bfe18a9dfcf60747864f84c5df9a69fb57741cac540322286111dc', '[\"*\"]', NULL, NULL, '2023-10-19 23:09:35', '2023-10-19 23:09:35', 14),
('App\\Models\\User', 9, 'user-access-token', 'fea5299b7813d10e49696e50201debcb5e777be89184dfad5417bd451768b84c', '[\"*\"]', NULL, NULL, '2023-10-19 23:11:31', '2023-10-19 23:11:31', 15),
('App\\Models\\User', 10, 'user-access-token', 'e466494b93f8d51ca3c81b16c034659fb80dac4ee0872c022583f86e7c948d04', '[\"*\"]', NULL, NULL, '2023-10-20 11:16:32', '2023-10-20 11:16:32', 16),
('App\\Models\\User', 10, 'user-access-token', '3d35d686205e5347b8c2a7ccf799e73498e7f37fc5d6e47f1a1e6853ad7c126d', '[\"*\"]', NULL, NULL, '2023-10-20 11:45:13', '2023-10-20 11:45:13', 17),
('App\\Models\\User', 10, 'user-access-token', 'e0ea852e6511dbb7dd6f6711b9e1e609742b530067816c25cc9e2e2dd3c54e6e', '[\"*\"]', NULL, NULL, '2023-10-20 15:30:20', '2023-10-20 15:30:20', 18),
('App\\Models\\User', 10, 'user-access-token', 'e9ba7aa246a79dcb6f2a276d77579a35f4dffe69447a90f6c6fae0d2f0433712', '[\"*\"]', NULL, NULL, '2023-10-20 16:03:37', '2023-10-20 16:03:37', 19),
('App\\Models\\User', 10, 'user-access-token', '4a8d76cda30219d1f22682dbe28063bf45cf54ac43a51c222106a3e44dbe623b', '[\"*\"]', NULL, NULL, '2023-10-20 16:26:14', '2023-10-20 16:26:14', 20),
('App\\Models\\User', 10, 'user-access-token', '94b401fd9ced9c12acd2bdd8158ea830c6ad01553f6e9dd16b1bff7b8bde5de1', '[\"*\"]', NULL, NULL, '2023-10-20 17:30:41', '2023-10-20 17:30:41', 21),
('App\\Models\\User', 3, 'user-access-token', '509e3624d20fdc98301ab157af714621af93d477c7e00abeeac0e277a05134c3', '[\"*\"]', NULL, NULL, '2023-10-22 21:24:26', '2023-10-22 21:24:26', 22),
('App\\Models\\User', 3, 'user-access-token', '61cb4b56abe8bd054047b09ec8e51b77fdb13489d9eaffd8d41f0d9bcff57cc6', '[\"*\"]', NULL, NULL, '2023-10-22 21:58:47', '2023-10-22 21:58:47', 23),
('App\\Models\\User', 3, 'user-access-token', 'b5030209aba18455f1c0a567f5e0625b6564ddc2ba9c1c4ef884dc17e2c9a544', '[\"*\"]', NULL, NULL, '2023-10-22 22:00:54', '2023-10-22 22:00:54', 24),
('App\\Models\\User', 3, 'user-access-token', '1227fd6e96dacb02a012198168ce3f4186affccac67e5fb3f0af6619e306bcc9', '[\"*\"]', NULL, NULL, '2023-10-23 15:27:57', '2023-10-23 15:27:57', 25);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trip_schedules`
--

CREATE TABLE `trip_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `participants` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trip_schema` varchar(99) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pricing` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `trip_schedules`
--

INSERT INTO `trip_schedules` (`id`, `participants`, `start_date`, `end_date`, `description`, `latitude`, `longitude`, `created_at`, `updated_at`, `country`, `trip_schema`, `pricing`) VALUES
(41, '[9,10,3]', '2023-11-01', '2023-11-08', 'Finland Forest Camp', '64.56178191', '27.06494018', NULL, NULL, 'Finland', '8am - Group meetup starts at: Place A; 10am - Guided tour of Location B...', '450.00'),
(42, '[]', '2023-11-08', '2023-11-12', 'IKEA History Celebration Trip', '56.55203546', '14.13591407', NULL, NULL, 'Sweden', '8am - Group meetup starts at: Place X; 10am - Guided tour of Location Y...', '355.00'),
(43, '[9]', '2023-11-08', '2023-11-12', 'Learn about Norway`s Culture!', '59.91390000', '10.75220000', NULL, NULL, 'Norway', '8am - Group meetup starts at: Place P; 10am - Guided tour of Location Q...', '455.00'),
(44, '[3]', '2023-11-09', '2023-11-12', 'Explore Together: Helsinki', '60.16650760', '24.92389263', NULL, NULL, 'Finland', '8am - Group meetup starts at: Place C; 10am - Guided tour of Location D...', '550.00'),
(45, '[10]', '2023-10-20', '2023-10-26', 'IKEA History Celebration Trip', '56.55203546', '14.13591407', NULL, NULL, 'Sweden', '8am - Group meetup starts at: Place R; 10am - Guided tour of Location S...', '325.00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`username`, `name`, `surname`, `password`, `trip_id`, `created_at`, `updated_at`, `id`) VALUES
('bober', 'bobbing', 'jajo', '3', NULL, NULL, NULL, 1),
('john_doe', 'John', 'Doe', '$2y$10$7UEAhXykOT14uzTE9AhysOddQhW.PlJTwiehQ15Cd1/6My.CGzyty', NULL, NULL, NULL, 2),
('1', '1', '1', '$2y$10$V1qFuHpOOULcPpAwE.aNdOCWvMcPMjnSTem8qDDYgRSwp/amzcE3a', NULL, NULL, NULL, 3),
('123', '123', '123', '$2y$10$.Kte5l7MIIhK7yssVm7U3.T0zKs/ESh2wjo4uDIwPBkDJfHvV0h7W', NULL, NULL, NULL, 4),
('213', '123', '123', '$2y$10$kJPQOxkGpepwrI06FULcFOCTYKtI5eEAQd06Oq2oKO./BskZelIE6', NULL, NULL, NULL, 5),
('bob', '1', '1', '$2y$10$HZmzl0CJVAfHPkJ2mXWSluQsrMEX2qYa5NKLmqvG3q4Yiz.fsEuvi', NULL, NULL, NULL, 6),
('bobas', '1', '1', '$2y$10$L3RDnT7ZE2SlZby9GMGYI.OAw/qklU6HhBKZHCPLRI2xUWgRcrFoa', NULL, NULL, NULL, 7),
('bbb', 'bbb', 'bbb', '$2y$10$nDlz1fRVIGbLGtSR4m.33uSNfrQSc0c7Z2R31Pg8R7NdzdiwyASfW', NULL, NULL, NULL, 8),
('hi', 'g', 'g', '$2y$10$y.4JQ5AIhjoEUcBVKsIYKuNwa9wdO10IQcyZVcuujkTP.l4k2atay', NULL, NULL, NULL, 9),
('kill', 'f', 'f', '$2y$10$ZdLw/3iIcRkbvZJJnxyyWOqANfoEPky3r9IjSvs82CLRHwdLGEUpO', NULL, NULL, NULL, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `_workflow`
--

CREATE TABLE `_workflow` (
  `_ID` int(11) NOT NULL,
  `_LOG` varchar(99) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `_workflows`
--

CREATE TABLE `_workflows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `_LOG` varchar(99) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `_workflows`
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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
