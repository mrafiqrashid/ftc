-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 08, 2025 at 08:04 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ftc`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memberID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateJoin` date DEFAULT NULL,
  `telM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `parentID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `memberID`, `name`, `dateJoin`, `telM`, `email`, `birthDate`, `parentID`, `created_at`, `updated_at`) VALUES
('01957196-9ff5-71b1-a7ef-ab93f6da9b2d', 'A', 'Jacky', '2024-01-01', '0122123324', 'jacky@gmail.com', '1987-06-24', NULL, '2025-03-07 09:10:51', '2025-03-07 09:10:51'),
('06591b23-27e0-422d-bc26-396ba2ed920f', 'H', 'Andy', '2024-02-25', '0176654456', 'andy@gmail.com', '2011-03-23', 'F', '2025-03-07 10:29:23', '2025-03-07 10:29:23'),
('1b690167-dca1-4e01-8e39-a87e85b441aa', 'K', 'Ara', '2023-01-30', '019281271211', 'ara@gmail.com', '2009-02-02', 'I', '2025-03-07 21:10:20', '2025-03-07 21:10:20'),
('26e6a231-3374-4999-83e0-340a16d9367e', 'D', 'Lily', '2024-01-03', '0152155328', 'lily@gmail.com', '2000-05-08', 'B', '2025-03-07 10:25:30', '2025-03-07 10:25:30'),
('308e486e-e66c-4170-b277-f483b0f27e33', 'J', 'Sammy', '2024-03-04', '0122239940', 'sammy@gmail.com', '2025-02-17', 'H', '2025-03-07 10:31:07', '2025-03-07 10:31:07'),
('569c28d0-440e-4428-959e-3008c7edd49c', 'G', 'Ali', '2024-02-03', '0101120022', 'ali@gmail.com', '2010-02-25', 'E', '2025-03-07 10:28:26', '2025-03-07 10:28:26'),
('714235a7-875f-45d3-93dd-7e6debd3f481', 'I', 'Muthu', '2024-03-02', '0198890099', 'muthu@gmail.com', '2024-05-06', 'A', '2025-03-07 10:30:11', '2025-03-07 10:30:11'),
('75fa5622-decb-4d11-914a-dfc6c248ccbf', 'C', 'Jimmy', '2024-01-02', '0122123245', 'jimmy@gmail.com', '2000-02-07', 'A', '2025-03-07 10:24:29', '2025-03-07 10:24:29'),
('a2d72eda-70aa-4d8f-b633-6ecc2e2a3312', 'F', 'Cindy', '2024-01-20', '0131232332', 'cindy@gmail.com', '2003-02-02', 'C', '2025-03-07 10:27:34', '2025-03-07 10:27:34'),
('c6956e65-c256-4827-a463-3574ed7a91eb', 'B', 'Nancy', '2024-01-02', '0122233324', 'nancy@gmail.com', '2010-06-16', 'A', '2025-03-07 09:45:27', '2025-03-07 10:33:10'),
('eb7ac853-433c-4ccf-b241-4ed700873919', 'E', 'Linda', '2024-01-10', '0171231329', 'linda@gmail.com', '2000-06-06', 'D', '2025-03-07 10:26:35', '2025-03-07 10:26:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(11, '0001_01_01_000002_create_jobs_table', 2),
(15, '2025_03_07_141151_create_members_table', 3),
(16, '2025_03_07_153619_create_purchases_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memberID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salesDate` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `billNo`, `memberID`, `salesDate`, `amount`, `created_at`, `updated_at`) VALUES
('019571b3-3628-7230-8e5d-62361fed4550', 'INV001', 'A', '2024-01-01', 50, '2025-03-07 09:42:05', '2025-03-07 10:34:15'),
('019571ea-df42-71b3-867d-53c2d9603b04', 'INV002', 'B', '2024-01-02', 100, '2025-03-07 10:42:52', '2025-03-07 11:07:07'),
('01957201-d46e-7367-82c5-8363e2c80784', 'INV003', 'C', '2024-01-02', 30, '2025-03-07 11:07:57', '2025-03-07 11:07:57'),
('01957202-2a84-73c9-8bcf-36c4fdeb6a40', 'INV004', 'D', '2024-01-03', 100, '2025-03-07 11:08:19', '2025-03-07 11:08:19'),
('01957202-a533-71a0-bb77-4eff34758a22', 'INV005', 'E', '2024-01-10', 20, '2025-03-07 11:08:50', '2025-03-07 11:08:50'),
('01957202-f55e-70b8-a8ce-a90413240467', 'INV006', 'F', '2024-01-20', 50, '2025-03-07 11:09:11', '2025-03-07 11:09:11'),
('01957203-6188-70f0-9caf-5538c796f4d4', 'INV007', 'E', '2024-01-20', 60, '2025-03-07 11:09:39', '2025-03-07 11:09:39'),
('01957203-c10b-7373-befd-8e7a611b780c', 'INV008', 'G', '2024-02-03', 45, '2025-03-07 11:10:03', '2025-03-07 11:10:03'),
('01957204-24d9-7377-8cdc-ebfa01c0ff07', 'INV009', 'H', '2024-02-25', 25, '2025-03-07 11:10:29', '2025-03-07 11:10:29'),
('01957204-7d07-7283-8091-1f9d600c911d', 'INV010', 'A', '2024-02-28', 50, '2025-03-07 11:10:51', '2025-03-07 11:10:51'),
('01957204-d578-7364-9171-bfbc982bbaa6', 'INV011', 'I', '2024-03-02', 100, '2025-03-07 11:11:14', '2025-03-07 11:11:14'),
('01957205-20fe-725c-8aef-96a1dabe269c', 'INV012', 'J', '2024-03-04', 125, '2025-03-07 11:11:33', '2025-03-07 11:11:33');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('7HgttdjkJ1gq3pMIyI75ceDwrjEkN6y9hQ9OJLL9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiclgyRnd0NEp4WW5uUzFoMFlkR3pqd2xNRXRkb3hKSHRaRTFDTnFGMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9tZW1iZXIvZmFtaWx5LXRyZWUtY2hhcnQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1NToibG9naW5fYmFja3BhY2tfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjI6InBhc3N3b3JkX2hhc2hfYmFja3BhY2siO3M6NjA6IiQyeSQxMiRobW4uQy9ZRlVEWExsOE5nVVRSSDFlTjA3bHB0dUlqdXdVNXcybjNaOExTSGN6YnVPUzRmbSI7czo2OiJjcmVhdGUiO2E6MTp7czoxMDoic2F2ZUFjdGlvbiI7czoxMzoic2F2ZV9hbmRfYmFjayI7fX0=', 1741420640);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'rafiq', 'farmapps.rafiq@gmail.com', NULL, '$2y$12$hmn.C/YFUDXLl8NgUTRH1eN07lptuIjuwU5w2n3Z8LSHczbuOS4fm', NULL, '2025-03-07 03:16:20', '2025-03-07 03:16:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `members_memberid_unique` (`memberID`),
  ADD KEY `members_parentid_foreign` (`parentID`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchases_billno_unique` (`billNo`),
  ADD KEY `purchases_memberid_foreign` (`memberID`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_parentid_foreign` FOREIGN KEY (`parentID`) REFERENCES `members` (`memberID`) ON DELETE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_memberid_foreign` FOREIGN KEY (`memberID`) REFERENCES `members` (`memberID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
