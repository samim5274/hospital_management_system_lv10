-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 03, 2026 at 01:55 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'admin',
  `otp` varchar(255) DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `role`, `otp`, `otp_expires_at`, `email_verified_at`, `last_login_at`, `last_login_ip`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'SAMIM Hossain', 'samim@gmail.com', '$2y$12$XpSO9YALOs7vC.N5uXb.0OJyd5V2kBcnMpM/qUQvWDjF33mPFKsru', 'admin', '508373', '2025-12-31 17:50:42', NULL, '2026-01-01 16:25:12', '127.0.0.1', 'kHlmLoGsoEq429eFVdcDRf1pdMe5IcEv1g8TkRuU7BPW6M7hvn0w0gENizI4', NULL, '2026-01-01 16:25:12'),
(2, 'Akib Hossain', 'akib@gmail.com', '$2y$12$XpSO9YALOs7vC.N5uXb.0OJyd5V2kBcnMpM/qUQvWDjF33mPFKsru', 'Admin', NULL, NULL, NULL, NULL, NULL, 'jSPfQ1rBQIGa5n2chjx2mtXfGWlwyl3Srsg5dd0wAxdUNgo6hlrPSyGGok20', '2025-10-25 00:00:59', '2025-10-25 00:00:59'),
(3, 'Akib Hossain', 'akib2@gmail.com', '$2y$12$nk8MgzG7.Ggnnclyokz0v.V0uEFjK05mJbq75MfBQv0LnSuwMhRKO', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-25 00:14:41', '2025-10-25 00:14:41');

-- --------------------------------------------------------

--
-- Table structure for table `admission_bill_summaries`
--

CREATE TABLE `admission_bill_summaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `general_bed` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cabin_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `doctor_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `service_charge` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ot_medicine` decimal(10,2) NOT NULL DEFAULT 0.00,
  `oral_medicine` decimal(10,2) NOT NULL DEFAULT 0.00,
  `others` decimal(10,2) NOT NULL DEFAULT 0.00,
  `contract_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `advance_paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payable_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `remaining_due` decimal(10,2) NOT NULL DEFAULT 0.00,
  `reg` varchar(255) DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admission_patients`
--

CREATE TABLE `admission_patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reg` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `father_husband` varchar(255) DEFAULT NULL,
  `guardian` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `nid` varchar(255) DEFAULT NULL,
  `contract_type` enum('Contract','NonContract') NOT NULL DEFAULT 'Contract',
  `contract_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `procedure_type` enum('Operative','Conservative') NOT NULL DEFAULT 'Operative',
  `medicine_package` enum('Package','NonPackage') NOT NULL DEFAULT 'Package',
  `refer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `treatment_under_id` bigint(20) UNSIGNED DEFAULT NULL,
  `duty_doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `disease_id` bigint(20) UNSIGNED DEFAULT NULL,
  `duty_nurse` varchar(255) DEFAULT NULL,
  `bed_booked_date` date DEFAULT NULL,
  `bed_id` bigint(20) UNSIGNED NOT NULL,
  `bed_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `remarks` varchar(255) NOT NULL DEFAULT 'N/A',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `routing_number` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_details`
--

INSERT INTO `bank_details` (`id`, `bank_name`, `branch_name`, `account_name`, `account_number`, `routing_number`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 'Dutch-Bangla Bank Ltd', 'Dhanmondi Branch', 'Samim Hossain', '12345678901', '090261234', 'Primary business account', NULL, NULL),
(2, 'BRAC Bank Ltd', 'Gulshan Branch', 'Samim Hossain', '98765432109', '060123456', 'Savings account', NULL, NULL),
(3, 'Islami Bank Bangladesh Ltd', 'Mirpur Branch', 'Samim Hossain', '45678912300', '125678900', 'Personal account', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bank_transection_details`
--

CREATE TABLE `bank_transection_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `remarks` text NOT NULL DEFAULT 'N/A',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beds`
--

CREATE TABLE `beds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bed_number` varchar(255) NOT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `status` enum('available','booked','maintenance') NOT NULL DEFAULT 'available',
  `price_per_day` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beds`
--

INSERT INTO `beds` (`id`, `bed_number`, `ward`, `status`, `price_per_day`, `created_at`, `updated_at`) VALUES
(1, 'B001', 'Male Ward', 'available', 1900.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(2, 'B002', 'Emergency', 'available', 1334.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(3, 'B003', 'Cabin', 'available', 841.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(4, 'B004', 'Male Ward', 'available', 1385.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(5, 'B005', 'Male Ward', 'available', 1419.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(6, 'B006', 'Male Ward', 'available', 1654.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(7, 'B007', 'Cabin', 'available', 724.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(8, 'B008', 'Cabin', 'available', 1065.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(9, 'B009', 'Male Ward', 'available', 1850.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(10, 'B010', 'Emergency', 'available', 1084.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(11, 'B011', 'Female Ward', 'available', 1962.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(12, 'B012', 'Cabin', 'available', 828.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(13, 'B013', 'ICU', 'available', 851.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(14, 'B014', 'Male Ward', 'available', 926.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(15, 'B015', 'Female Ward', 'available', 1176.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(16, 'B016', 'Cabin', 'available', 1033.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(17, 'B017', 'Emergency', 'available', 1684.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(18, 'B018', 'Emergency', 'available', 1405.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(19, 'B019', 'ICU', 'available', 1364.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(20, 'B020', 'Female Ward', 'available', 1413.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(21, 'B021', 'Cabin', 'available', 1176.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(22, 'B022', 'Male Ward', 'available', 1808.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(23, 'B023', 'Cabin', 'available', 1710.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(24, 'B024', 'Cabin', 'available', 612.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(25, 'B025', 'Male Ward', 'available', 1088.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(26, 'B026', 'Emergency', 'available', 1317.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(27, 'B027', 'Emergency', 'available', 1247.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(28, 'B028', 'Female Ward', 'available', 1755.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(29, 'B029', 'Female Ward', 'available', 1998.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(30, 'B030', 'ICU', 'available', 1213.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(31, 'B031', 'Cabin', 'available', 950.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(32, 'B032', 'Male Ward', 'available', 1150.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(33, 'B033', 'ICU', 'available', 610.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(34, 'B034', 'Emergency', 'available', 613.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(35, 'B035', 'Female Ward', 'available', 1525.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(36, 'B036', 'Female Ward', 'available', 1882.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(37, 'B037', 'Female Ward', 'available', 746.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(38, 'B038', 'Emergency', 'available', 795.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(39, 'B039', 'Emergency', 'available', 1711.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(40, 'B040', 'Male Ward', 'available', 870.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(41, 'B041', 'Male Ward', 'available', 844.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(42, 'B042', 'Female Ward', 'available', 1046.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(43, 'B043', 'Female Ward', 'available', 1843.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(44, 'B044', 'Male Ward', 'available', 1740.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(45, 'B045', 'Emergency', 'available', 1220.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(46, 'B046', 'Emergency', 'available', 561.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(47, 'B047', 'ICU', 'available', 838.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(48, 'B048', 'Female Ward', 'available', 840.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(49, 'B049', 'Cabin', 'available', 1705.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(50, 'B050', 'ICU', 'available', 1818.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(51, 'B051', 'Emergency', 'available', 1158.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(52, 'B052', 'ICU', 'available', 756.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(53, 'B053', 'Female Ward', 'available', 708.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(54, 'B054', 'Female Ward', 'available', 1457.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(55, 'B055', 'Female Ward', 'available', 1781.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(56, 'B056', 'ICU', 'available', 1241.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(57, 'B057', 'Cabin', 'available', 1601.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(58, 'B058', 'Female Ward', 'available', 1181.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(59, 'B059', 'Male Ward', 'available', 1248.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(60, 'B060', 'ICU', 'available', 641.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(61, 'B061', 'ICU', 'available', 1905.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(62, 'B062', 'Male Ward', 'available', 1946.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(63, 'B063', 'Male Ward', 'available', 830.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(64, 'B064', 'Male Ward', 'available', 1410.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(65, 'B065', 'ICU', 'available', 1846.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(66, 'B066', 'Male Ward', 'available', 1029.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(67, 'B067', 'Male Ward', 'available', 1416.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(68, 'B068', 'ICU', 'available', 1901.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(69, 'B069', 'Male Ward', 'available', 1602.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(70, 'B070', 'Male Ward', 'available', 1745.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(71, 'B071', 'ICU', 'available', 1735.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(72, 'B072', 'ICU', 'available', 527.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(73, 'B073', 'Cabin', 'available', 570.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(74, 'B074', 'Male Ward', 'available', 1540.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(75, 'B075', 'Cabin', 'available', 1676.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(76, 'B076', 'Female Ward', 'available', 1635.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(77, 'B077', 'ICU', 'available', 1537.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(78, 'B078', 'Female Ward', 'available', 1367.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(79, 'B079', 'Emergency', 'available', 773.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(80, 'B080', 'ICU', 'available', 1811.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(81, 'B081', 'Female Ward', 'available', 711.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(82, 'B082', 'Male Ward', 'available', 1144.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(83, 'B083', 'Cabin', 'available', 1582.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(84, 'B084', 'Female Ward', 'available', 858.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(85, 'B085', 'Cabin', 'available', 1752.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(86, 'B086', 'Male Ward', 'available', 1339.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(87, 'B087', 'Emergency', 'available', 1756.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(88, 'B088', 'Male Ward', 'available', 840.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(89, 'B089', 'Male Ward', 'available', 652.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(90, 'B090', 'Emergency', 'available', 1975.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(91, 'B091', 'Emergency', 'available', 1471.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(92, 'B092', 'Cabin', 'available', 1846.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(93, 'B093', 'ICU', 'available', 1266.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(94, 'B094', 'Emergency', 'available', 1750.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(95, 'B095', 'Male Ward', 'available', 693.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(96, 'B096', 'Female Ward', 'available', 730.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(97, 'B097', 'Male Ward', 'available', 1231.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(98, 'B098', 'Female Ward', 'available', 1807.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(99, 'B099', 'ICU', 'available', 737.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(100, 'B100', 'Female Ward', 'available', 936.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(101, 'B101', 'Male Ward', 'available', 1884.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(102, 'B102', 'Female Ward', 'available', 1201.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(103, 'B103', 'Emergency', 'available', 1849.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(104, 'B104', 'ICU', 'available', 1969.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(105, 'B105', 'Emergency', 'available', 1192.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(106, 'B106', 'Cabin', 'available', 1814.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(107, 'B107', 'Emergency', 'available', 1921.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(108, 'B108', 'Emergency', 'available', 1870.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(109, 'B109', 'ICU', 'available', 1180.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(110, 'B110', 'Cabin', 'available', 1882.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(111, 'B111', 'Female Ward', 'available', 775.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(112, 'B112', 'Cabin', 'available', 502.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(113, 'B113', 'ICU', 'available', 848.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(114, 'B114', 'Male Ward', 'available', 891.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(115, 'B115', 'Male Ward', 'available', 848.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(116, 'B116', 'Cabin', 'available', 1596.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(117, 'B117', 'Cabin', 'available', 727.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(118, 'B118', 'ICU', 'available', 595.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(119, 'B119', 'Male Ward', 'available', 1757.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(120, 'B120', 'Female Ward', 'available', 562.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(121, 'B121', 'ICU', 'available', 1546.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(122, 'B122', 'Male Ward', 'available', 925.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(123, 'B123', 'Male Ward', 'available', 560.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(124, 'B124', 'Emergency', 'available', 1840.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(125, 'B125', 'Female Ward', 'available', 1819.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(126, 'B126', 'Female Ward', 'available', 1539.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(127, 'B127', 'Female Ward', 'available', 1674.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(128, 'B128', 'ICU', 'available', 678.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(129, 'B129', 'Female Ward', 'available', 654.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(130, 'B130', 'ICU', 'available', 1523.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(131, 'B131', 'Cabin', 'available', 1446.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(132, 'B132', 'Emergency', 'available', 1674.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(133, 'B133', 'Male Ward', 'available', 1668.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(134, 'B134', 'ICU', 'available', 1805.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(135, 'B135', 'ICU', 'available', 1933.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(136, 'B136', 'Male Ward', 'available', 1372.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(137, 'B137', 'Female Ward', 'available', 510.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(138, 'B138', 'Male Ward', 'available', 972.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(139, 'B139', 'Male Ward', 'available', 738.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(140, 'B140', 'Emergency', 'available', 1334.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(141, 'B141', 'Emergency', 'available', 885.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(142, 'B142', 'Emergency', 'available', 1714.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(143, 'B143', 'ICU', 'available', 1916.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(144, 'B144', 'ICU', 'available', 813.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(145, 'B145', 'Female Ward', 'available', 1006.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(146, 'B146', 'Female Ward', 'available', 1481.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(147, 'B147', 'Male Ward', 'available', 669.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(148, 'B148', 'Emergency', 'available', 1744.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(149, 'B149', 'Cabin', 'available', 1841.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(150, 'B150', 'Male Ward', 'available', 688.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(151, 'B151', 'ICU', 'available', 1942.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(152, 'B152', 'Male Ward', 'available', 1961.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(153, 'B153', 'Male Ward', 'available', 1150.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(154, 'B154', 'Emergency', 'available', 1923.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(155, 'B155', 'ICU', 'available', 1062.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(156, 'B156', 'Emergency', 'available', 1296.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(157, 'B157', 'Male Ward', 'available', 1792.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(158, 'B158', 'Emergency', 'available', 1724.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(159, 'B159', 'Female Ward', 'available', 1915.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(160, 'B160', 'Emergency', 'available', 1546.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(161, 'B161', 'Emergency', 'available', 1571.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(162, 'B162', 'ICU', 'available', 1843.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(163, 'B163', 'ICU', 'available', 712.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(164, 'B164', 'Cabin', 'available', 893.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(165, 'B165', 'Female Ward', 'available', 561.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(166, 'B166', 'Cabin', 'available', 875.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(167, 'B167', 'Cabin', 'available', 1953.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(168, 'B168', 'Cabin', 'available', 1693.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(169, 'B169', 'ICU', 'available', 1737.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(170, 'B170', 'Emergency', 'available', 1690.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(171, 'B171', 'Male Ward', 'available', 847.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(172, 'B172', 'Female Ward', 'available', 888.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(173, 'B173', 'Male Ward', 'available', 962.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(174, 'B174', 'ICU', 'available', 726.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(175, 'B175', 'Female Ward', 'available', 1810.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(176, 'B176', 'ICU', 'available', 1900.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(177, 'B177', 'Female Ward', 'available', 2000.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(178, 'B178', 'Cabin', 'available', 1353.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(179, 'B179', 'Female Ward', 'available', 1098.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(180, 'B180', 'ICU', 'available', 1273.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(181, 'B181', 'Female Ward', 'available', 1996.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(182, 'B182', 'Female Ward', 'available', 1744.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(183, 'B183', 'ICU', 'available', 1109.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(184, 'B184', 'Female Ward', 'available', 1348.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(185, 'B185', 'Emergency', 'available', 1452.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(186, 'B186', 'Male Ward', 'available', 1625.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(187, 'B187', 'Emergency', 'available', 1114.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(188, 'B188', 'ICU', 'available', 1876.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(189, 'B189', 'Emergency', 'available', 1513.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(190, 'B190', 'Male Ward', 'available', 1150.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(191, 'B191', 'Male Ward', 'available', 1486.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(192, 'B192', 'ICU', 'available', 1177.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(193, 'B193', 'ICU', 'available', 1136.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(194, 'B194', 'Cabin', 'available', 1801.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(195, 'B195', 'Male Ward', 'available', 1452.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(196, 'B196', 'Cabin', 'available', 858.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(197, 'B197', 'Male Ward', 'available', 1864.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(198, 'B198', 'Female Ward', 'available', 1180.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(199, 'B199', 'ICU', 'available', 661.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(200, 'B200', 'Female Ward', 'available', 1434.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(201, 'B201', 'Female Ward', 'available', 749.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(202, 'B202', 'Male Ward', 'available', 818.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(203, 'B203', 'Cabin', 'available', 948.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(204, 'B204', 'Female Ward', 'available', 1170.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(205, 'B205', 'Cabin', 'available', 711.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(206, 'B206', 'Emergency', 'available', 1346.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(207, 'B207', 'Emergency', 'available', 573.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(208, 'B208', 'Male Ward', 'available', 1359.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(209, 'B209', 'Male Ward', 'available', 1407.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(210, 'B210', 'Female Ward', 'available', 1848.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(211, 'B211', 'ICU', 'available', 1999.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(212, 'B212', 'ICU', 'available', 1698.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(213, 'B213', 'ICU', 'available', 1191.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(214, 'B214', 'Male Ward', 'available', 1622.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(215, 'B215', 'Female Ward', 'available', 850.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(216, 'B216', 'Male Ward', 'available', 1203.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(217, 'B217', 'Male Ward', 'available', 668.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(218, 'B218', 'Male Ward', 'available', 892.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(219, 'B219', 'Cabin', 'available', 1366.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(220, 'B220', 'Emergency', 'available', 764.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(221, 'B221', 'Female Ward', 'available', 1426.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(222, 'B222', 'ICU', 'available', 1103.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(223, 'B223', 'Female Ward', 'available', 1459.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(224, 'B224', 'Female Ward', 'available', 1637.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(225, 'B225', 'Male Ward', 'available', 921.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(226, 'B226', 'Male Ward', 'available', 1640.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(227, 'B227', 'Female Ward', 'available', 1487.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(228, 'B228', 'Emergency', 'available', 1022.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(229, 'B229', 'Female Ward', 'available', 1658.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(230, 'B230', 'Female Ward', 'available', 1024.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(231, 'B231', 'Female Ward', 'available', 1354.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(232, 'B232', 'Emergency', 'available', 1313.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(233, 'B233', 'ICU', 'available', 803.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(234, 'B234', 'Male Ward', 'available', 867.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(235, 'B235', 'Male Ward', 'available', 1421.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(236, 'B236', 'Female Ward', 'available', 815.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(237, 'B237', 'Male Ward', 'available', 1686.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(238, 'B238', 'Cabin', 'available', 525.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(239, 'B239', 'Emergency', 'available', 1822.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(240, 'B240', 'Female Ward', 'available', 537.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(241, 'B241', 'Male Ward', 'available', 1176.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(242, 'B242', 'Female Ward', 'available', 1165.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(243, 'B243', 'Cabin', 'available', 1852.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(244, 'B244', 'Male Ward', 'available', 787.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(245, 'B245', 'ICU', 'available', 1915.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(246, 'B246', 'Male Ward', 'available', 965.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(247, 'B247', 'ICU', 'available', 1511.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(248, 'B248', 'Emergency', 'available', 935.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(249, 'B249', 'Cabin', 'available', 887.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(250, 'B250', 'Cabin', 'available', 518.00, '2026-01-03 11:50:53', '2026-01-03 11:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `address`, `email`, `phone`, `website`, `created_at`, `updated_at`) VALUES
(1, 'Bangladesh Diabetic & Diagnostic Care ltd.', 'Dholibita, Dhamrai, Dhaka', 'info@bddcl.info', '01700000000', 'www.bddcl.info', '2025-11-30 22:00:59', '2025-11-30 22:00:59');

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE `diseases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Diabetes Mellitus', 'A metabolic disorder causing high blood sugar levels.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(2, 'Hypertension', 'High blood pressure condition.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(3, 'Asthma', 'A chronic lung disease causing breathing difficulty.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(4, 'Heart Disease', 'Conditions affecting the heart and blood vessels.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(5, 'Arthritis', 'Inflammation of the joints causing pain and stiffness.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(6, 'Migraine', 'Severe recurring headaches often with nausea.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(7, 'Tuberculosis', 'An infectious disease mainly affecting the lungs.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(8, 'Pneumonia', 'Infection that inflames the air sacs in one or both lungs.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(9, 'Covid-19', 'Respiratory illness caused by SARS-CoV-2 virus.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(10, 'Hepatitis B', 'A viral infection that affects the liver.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(11, 'Typhoid Fever', 'Bacterial infection caused by Salmonella typhi.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(12, 'Malaria', 'Mosquito-borne infectious disease affecting red blood cells.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(13, 'Dengue Fever', 'Viral infection spread by Aedes mosquitoes.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(14, 'Gastritis', 'Inflammation of the stomach lining.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(15, 'Ulcer', 'Open sores on the stomach or intestinal lining.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(16, 'Cancer', 'Abnormal cell growth that can spread to other parts of the body.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(17, 'Jaundice', 'Yellowing of the skin and eyes due to liver problems.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(18, 'Influenza', 'Common viral infection causing fever and sore throat.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(19, 'Kidney Stone', 'Hard deposits of minerals in the kidneys.', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(20, 'Anemia', 'Low red blood cell count causing fatigue.', '2026-01-03 11:50:53', '2026-01-03 11:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fees` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `specialization`, `phone`, `email`, `fees`, `created_at`, `updated_at`) VALUES
(1, 'Dr. John Smith', 'Cardiologist', '01710000001', 'john.smith@example.com', 1000.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(2, 'Dr. Alice Johnson', 'Neurologist', '01710000002', 'alice.johnson@example.com', 800.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(3, 'Dr. Robert Brown', 'Pediatrician', '01710000003', 'robert.brown@example.com', 500.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(4, 'Dr. Emily Davis', 'Dermatologist', '01710000004', 'emily.davis@example.com', 1000.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(5, 'Dr. Michael Wilson', 'Orthopedic', '01710000005', 'michael.wilson@example.com', 800.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(6, 'Dr. Sophia Taylor', 'Gynecologist', '01710000006', 'sophia.taylor@example.com', 1000.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(7, 'Dr. William Martinez', 'ENT Specialist', '01710000007', 'william.martinez@example.com', 1000.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(8, 'Dr. Olivia Anderson', 'Oncologist', '01710000008', 'olivia.anderson@example.com', 800.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(9, 'Dr. James Thomas', 'Radiologist', '01710000009', 'james.thomas@example.com', 700.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(10, 'Dr. Isabella Jackson', 'Endocrinologist', '01710000010', 'isabella.jackson@example.com', 1500.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(11, 'Dr. Benjamin White', 'Urologist', '01710000011', 'benjamin.white@example.com', 2000.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(12, 'Dr. Mia Harris', 'Gastroenterologist', '01710000012', 'mia.harris@example.com', 850.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(13, 'Dr. Daniel Clark', 'Pulmonologist', '01710000013', 'daniel.clark@example.com', 500.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(14, 'Dr. Charlotte Lewis', 'Nephrologist', '01710000014', 'charlotte.lewis@example.com', 1000.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(15, 'Dr. Matthew Lee', 'Ophthalmologist', '01710000015', 'matthew.lee@example.com', 1000.00, '2026-01-03 11:50:52', '2026-01-03 11:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `duty_doctors`
--

CREATE TABLE `duty_doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `specialization` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `duty_doctors`
--

INSERT INTO `duty_doctors` (`id`, `name`, `specialization`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Dr. Ayesha Karim', 'Cardiology', '01710000001', 'ayesha@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(2, 'Dr. Rahat Hossain', 'Orthopedics', '01710000002', 'rahat@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(3, 'Dr. Tanvir Alam', 'Neurology', '01710000003', 'tanvir@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(4, 'Dr. Nusrat Jahan', 'Gynecology', '01710000004', 'nusrat@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(5, 'Dr. Mamun Rahman', 'Medicine', '01710000005', 'mamun@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(6, 'Dr. Farhana Ahmed', 'Dermatology', '01710000006', 'farhana@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(7, 'Dr. Shahidul Islam', 'ENT', '01710000007', 'shahidul@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(8, 'Dr. Sabrina Akter', 'Cardiology', '01710000008', 'sabrina@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(9, 'Dr. Tareq Hasan', 'Urology', '01710000009', 'tareq@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(10, 'Dr. Rafiq Mahmud', 'Medicine', '01710000010', 'rafiq@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(11, 'Dr. Mahiya Sultana', 'Gynecology', '01710000011', 'mahiya@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(12, 'Dr. Hasan Chowdhury', 'Orthopedics', '01710000012', 'hasan@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(13, 'Dr. Sumaiya Rahman', 'Dermatology', '01710000013', 'sumaiya@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(14, 'Dr. Arif Mahmud', 'Cardiology', '01710000014', 'arif@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(15, 'Dr. Nayeem Islam', 'ENT', '01710000015', 'nayeem@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(16, 'Dr. Rima Akter', 'Neurology', '01710000016', 'rima@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(17, 'Dr. Omar Faruk', 'Medicine', '01710000017', 'omar@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(18, 'Dr. Sadiya Hossain', 'Gynecology', '01710000018', 'sadiya@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(19, 'Dr. Kamrul Hasan', 'Cardiology', '01710000019', 'kamrul@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(20, 'Dr. Rashedul Islam', 'Urology', '01710000020', 'rashed@example.com', '2026-01-03 11:50:53', '2026-01-03 11:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `expenses_categories`
--

CREATE TABLE `expenses_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses_categories`
--

INSERT INTO `expenses_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Salary', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(2, 'Utility', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(3, 'Maintenance', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(4, 'Academic', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(5, 'Transport', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(6, 'Event', '2026-01-03 11:50:54', '2026-01-03 11:50:54');

-- --------------------------------------------------------

--
-- Table structure for table `expenses_details`
--

CREATE TABLE `expenses_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `remark` text NOT NULL DEFAULT 'N/A',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses_sub_categories`
--

CREATE TABLE `expenses_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses_sub_categories`
--

INSERT INTO `expenses_sub_categories` (`id`, `category_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Teacher Salary', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(2, 1, 'Staff Salary', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(3, 1, 'Guest Teacher Salary', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(4, 2, 'Electricity Bill', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(5, 2, 'Water Bill', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(6, 2, 'Internet Bill', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(7, 3, 'Furniture Repair', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(8, 3, 'Building Repair', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(9, 3, 'Painting', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(10, 4, 'Books Purchase', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(11, 4, 'Lab Equipment', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(12, 4, 'Classroom Materials', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(13, 5, 'Bus Fuel', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(14, 5, 'Driver Salary', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(15, 5, 'Vehicle Repair', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(16, 6, 'Annual Program', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(17, 6, 'Sports Day', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(18, 6, 'Prize Giving Ceremony', '2026-01-03 11:50:54', '2026-01-03 11:50:54');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `generics`
--

CREATE TABLE `generics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generics`
--

INSERT INTO `generics` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Paracetamol', '2026-01-03 11:50:53', '2025-10-22 10:57:39'),
(2, 'Amoxicillin', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(3, 'Ibuprofen', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(4, 'Metformin', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(5, 'Ciprofloxacin', '2026-01-03 11:50:53', '2026-01-03 11:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_categories`
--

CREATE TABLE `income_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `income_categories`
--

INSERT INTO `income_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Tuition Fee', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(2, 'Donation', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(3, 'Library Fee', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(4, 'Transport Fee', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(5, 'Examination Fee', '2026-01-03 11:50:54', '2026-01-03 11:50:54');

-- --------------------------------------------------------

--
-- Table structure for table `income_sub_categories`
--

CREATE TABLE `income_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `income_sub_categories`
--

INSERT INTO `income_sub_categories` (`id`, `category_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Grade 1-5', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(2, 1, 'Grade 6-10', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(3, 1, 'Grade 11-12', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(4, 1, 'Pre-School', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(5, 2, 'Alumni Donation', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(6, 2, 'Sponsor Donation', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(7, 2, 'General Donation', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(8, 3, 'Book Fee', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(9, 3, 'Late Fee', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(10, 3, 'Library Membership Fee', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(11, 4, 'Bus Fee', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(12, 4, 'Van Fee', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(13, 4, 'Driver Allowance', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(14, 5, 'Monthly Test', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(15, 5, 'Final Exam', '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(16, 5, 'Practical Exam', '2026-01-03 11:50:54', '2026-01-03 11:50:54');

-- --------------------------------------------------------

--
-- Table structure for table `lab_categories`
--

CREATE TABLE `lab_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `catName` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lab_categories`
--

INSERT INTO `lab_categories` (`id`, `catName`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Hematology', 'Blood related tests', '2026-01-03 11:50:51', '2026-01-03 11:50:51'),
(2, 'Biochemistry', 'Chemical analysis tests', '2026-01-03 11:50:51', '2026-01-03 11:50:51'),
(3, 'Microbiology', 'Bacteria and virus tests', '2026-01-03 11:50:51', '2026-01-03 11:50:51'),
(4, 'Immunology', 'Immune system tests', '2026-01-03 11:50:51', '2026-01-03 11:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `lab_groups`
--

CREATE TABLE `lab_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lab_groups`
--

INSERT INTO `lab_groups` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Routine', 'Routine tests', '2026-01-03 11:50:51', '2026-01-03 11:50:51'),
(2, 'Special', 'Special tests', '2026-01-03 11:50:51', '2026-01-03 11:50:51'),
(3, 'Emergency', 'Emergency tests', '2026-01-03 11:50:51', '2026-01-03 11:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `lab_materials`
--

CREATE TABLE `lab_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `unit` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lab_specimens`
--

CREATE TABLE `lab_specimens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lab_specimens`
--

INSERT INTO `lab_specimens` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Blood', 'Venous blood sample', '2026-01-03 11:50:51', '2026-01-03 11:50:51'),
(2, 'Urine', 'Urine sample', '2026-01-03 11:50:51', '2026-01-03 11:50:51'),
(3, 'Saliva', 'Saliva sample', '2026-01-03 11:50:51', '2026-01-03 11:50:51'),
(4, 'Swab', 'Throat/nasal swab', '2026-01-03 11:50:51', '2026-01-03 11:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `lab_subcategories`
--

CREATE TABLE `lab_subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `catId` int(11) NOT NULL,
  `subCatName` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lab_subcategories`
--

INSERT INTO `lab_subcategories` (`id`, `catId`, `subCatName`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'CBC', 'Complete Blood Count', '2026-01-03 11:50:51', '2026-01-03 11:50:51'),
(2, 1, 'ESR', 'Erythrocyte Sedimentation Rate', '2026-01-03 11:50:51', '2026-01-03 11:50:51'),
(3, 2, 'Liver Function Test', 'LFT panel', '2026-01-03 11:50:51', '2026-01-03 11:50:51'),
(4, 2, 'Kidney Function Test', 'KFT panel', '2026-01-03 11:50:51', '2026-01-03 11:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `lab_tests`
--

CREATE TABLE `lab_tests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `testName` varchar(255) NOT NULL,
  `categoryId` bigint(20) UNSIGNED NOT NULL,
  `subcategoryId` bigint(20) UNSIGNED NOT NULL,
  `specimenId` bigint(20) UNSIGNED NOT NULL,
  `groupId` bigint(20) UNSIGNED NOT NULL,
  `testPrice` decimal(8,2) NOT NULL,
  `rprice` decimal(8,2) NOT NULL,
  `room` varchar(255) DEFAULT NULL,
  `testDescription` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lab_tests`
--

INSERT INTO `lab_tests` (`id`, `testName`, `categoryId`, `subcategoryId`, `specimenId`, `groupId`, `testPrice`, `rprice`, `room`, `testDescription`, `status`, `created_at`, `updated_at`) VALUES
(1, 'CBC Test', 3, 3, 2, 2, 2075.00, 643.00, 'Room 2', 'Vel beatae odio quis doloremque.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(2, 'Thyroid Function Test', 4, 4, 3, 3, 1268.00, 2307.00, 'Room 10', 'Impedit fuga aliquid impedit dolore labore.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(3, 'Liver Function Test', 1, 2, 4, 1, 2856.00, 3100.00, 'Room 2', 'Excepturi non eos laborum placeat dolores fugit ab.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(4, 'Kidney Function Test', 3, 3, 1, 1, 3686.00, 3928.00, 'Room 7', 'Cumque perferendis beatae commodi incidunt corrupti.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(5, 'Lipid Profile', 4, 1, 3, 1, 2412.00, 3826.00, 'Room 8', 'Quod dolores a eaque aliquid ut saepe.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(6, 'Blood Sugar Test', 2, 1, 4, 1, 3552.00, 580.00, 'Room 7', 'Provident quis officiis error dolores rerum voluptatem quae.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(7, 'Urine Routine Test', 2, 3, 1, 1, 1166.00, 4093.00, 'Room 9', 'Eos quos quam voluptates praesentium laudantium praesentium et.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(8, 'Electrolyte Test', 4, 3, 2, 3, 2079.00, 1667.00, 'Room 6', 'Qui eum eligendi architecto ipsum aut.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(9, 'Pulmonary Function Test', 3, 3, 4, 1, 4244.00, 2893.00, 'Room 2', 'Deleniti assumenda qui repellendus excepturi.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(10, 'ECG Test', 1, 4, 1, 3, 1194.00, 2991.00, 'Room 2', 'Sed doloribus sapiente mollitia quo hic occaecati nihil.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(11, 'Eye Test', 4, 4, 1, 2, 4690.00, 2233.00, 'Room 10', 'Hic est fugiat corrupti consequuntur occaecati eligendi.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(12, 'Brain MRI', 4, 3, 4, 1, 4657.00, 1095.00, 'Room 8', 'A dignissimos similique libero porro.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(13, 'Cardiac Enzyme Test', 4, 3, 4, 2, 3658.00, 4169.00, 'Room 4', 'Voluptatem maiores rerum quam et.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(14, 'Dengue Test', 2, 3, 3, 1, 2846.00, 2172.00, 'Room 10', 'Sunt unde ut assumenda blanditiis.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(15, 'Malaria Test', 3, 3, 4, 1, 712.00, 2544.00, 'Room 8', 'Aut nihil quis voluptatum.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(16, 'Vitamin D Test', 3, 2, 4, 2, 575.00, 1585.00, 'Room 1', 'Velit voluptatem quidem explicabo id.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(17, 'Vitamin B12 Test', 1, 4, 4, 1, 4471.00, 3956.00, 'Room 4', 'Dolore qui iure autem consequatur iusto est.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(18, 'Iron Test', 1, 4, 2, 1, 4551.00, 1488.00, 'Room 8', 'Recusandae veritatis qui doloremque neque.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(19, 'Ferritin Test', 3, 2, 4, 3, 2503.00, 2208.00, 'Room 1', 'Vel cupiditate ut assumenda commodi non nemo eaque.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(20, 'Uric Acid Test', 4, 3, 2, 3, 728.00, 852.00, 'Room 1', 'Ex aspernatur at cumque eum est.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(21, 'ESR Test', 4, 2, 3, 2, 1890.00, 3492.00, 'Room 2', 'Enim esse enim quisquam id est voluptatem.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(22, 'RBC Count Test', 3, 3, 3, 1, 3456.00, 589.00, 'Room 8', 'Beatae assumenda corporis labore nulla rerum iusto.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(23, 'PCV Test', 1, 2, 1, 3, 2636.00, 2906.00, 'Room 1', 'Est quia corrupti officia et et sed.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(24, 'MCH Test', 4, 2, 4, 2, 1080.00, 1520.00, 'Room 9', 'Quae odio delectus explicabo quas dolorem voluptas explicabo.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(25, 'MCHC Test', 3, 2, 1, 2, 4687.00, 1779.00, 'Room 3', 'Quia molestiae vero impedit fuga eveniet cupiditate.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(26, 'RDW Test', 1, 4, 2, 2, 2289.00, 3843.00, 'Room 7', 'Et totam non consectetur.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(27, 'Neutrophils Test', 1, 3, 4, 3, 3018.00, 613.00, 'Room 6', 'Voluptatibus praesentium nihil suscipit corporis illum magnam.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(28, 'Lymphocytes Test', 2, 3, 4, 2, 4947.00, 2781.00, 'Room 10', 'Corporis quibusdam voluptatem hic aperiam asperiores soluta necessitatibus et.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(29, 'Monocytes Test', 3, 1, 4, 3, 3330.00, 380.00, 'Room 7', 'Ducimus molestiae delectus accusamus ut in.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(30, 'Eosinophils Test', 2, 3, 1, 3, 2404.00, 3206.00, 'Room 9', 'Alias accusantium modi a quis laudantium repellendus.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(31, 'Basophils Test', 3, 3, 3, 3, 4973.00, 2106.00, 'Room 5', 'Eos qui dolorem ut enim.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(32, 'Prothrombin Time Test', 1, 2, 1, 1, 2299.00, 3336.00, 'Room 4', 'Optio reiciendis quod aut placeat quae.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(33, 'INR Test', 3, 1, 1, 1, 1336.00, 3033.00, 'Room 9', 'Et nemo ex cupiditate.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(34, 'aPTT Test', 2, 4, 4, 3, 2756.00, 3624.00, 'Room 9', 'Earum pariatur dignissimos minus quaerat.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(35, 'HIV 1 & 2 Test', 1, 2, 2, 2, 2507.00, 1418.00, 'Room 9', 'Laboriosam maxime vero provident enim.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(36, 'HCV Antibody Test', 3, 2, 4, 2, 2852.00, 2323.00, 'Room 4', 'Est rerum ea quo sint.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(37, 'HbA1c Test', 3, 2, 4, 2, 2789.00, 1937.00, 'Room 6', 'Rerum alias molestiae nesciunt voluptatum nostrum.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(38, 'Blood Group Test', 3, 2, 2, 3, 3824.00, 4076.00, 'Room 8', 'Dolorem iure fuga nihil dolorem laudantium sunt.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(39, 'Pregnancy Test', 3, 1, 1, 3, 4179.00, 2521.00, 'Room 4', 'Minus commodi ullam cumque.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(40, 'Stool Occult Blood Test', 3, 4, 3, 2, 1123.00, 2313.00, 'Room 7', 'Molestiae cupiditate cupiditate sit.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(41, 'Amylase Test', 1, 3, 2, 3, 628.00, 3585.00, 'Room 7', 'Optio ut cupiditate a nisi reiciendis quisquam.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(42, 'Lipase Test', 1, 4, 3, 3, 2649.00, 3285.00, 'Room 9', 'Expedita aspernatur est sed quae eaque maxime.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(43, 'LDH Test', 2, 3, 3, 3, 4095.00, 2395.00, 'Room 4', 'Et officiis et at occaecati mollitia autem.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(44, 'GGT Test', 4, 1, 2, 3, 3611.00, 524.00, 'Room 6', 'Ducimus id ea corrupti neque.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(45, 'Phosphorus Test', 3, 1, 1, 1, 1795.00, 3261.00, 'Room 1', 'Numquam et tempora perferendis vitae molestias dolor.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(46, 'Magnesium Test', 4, 2, 3, 3, 2730.00, 1412.00, 'Room 4', 'Magnam deleniti rerum eos sunt architecto unde.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(47, 'Zinc Test', 4, 4, 4, 3, 555.00, 559.00, 'Room 5', 'Sed consequuntur soluta ratione voluptatem amet ipsam voluptates iure.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(48, 'Copper Test', 3, 2, 4, 3, 3328.00, 2013.00, 'Room 1', 'Sapiente exercitationem et est sed nobis fugit.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(49, 'Insulin (Fasting) Test', 2, 1, 3, 3, 2914.00, 2977.00, 'Room 8', 'Non aliquid modi rerum dignissimos possimus doloremque.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(50, 'Cortisol (Morning) Test', 3, 4, 3, 3, 1181.00, 1229.00, 'Room 6', 'Quisquam vel provident possimus.', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
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
(49, '2025_10_16_061019_create_expenses_table', 1),
(126, '2014_10_12_000000_create_users_table', 2),
(127, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(128, '2014_10_12_100000_create_password_resets_table', 2),
(129, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(130, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(131, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(132, '2016_06_01_000004_create_oauth_clients_table', 2),
(133, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(134, '2019_08_19_000000_create_failed_jobs_table', 2),
(135, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(136, '2025_10_16_060305_create_doctors_table', 2),
(137, '2025_10_16_060344_create_lab_materials_table', 2),
(138, '2025_10_16_062212_create_lab_categories_table', 2),
(139, '2025_10_16_062212_create_lab_groups_table', 2),
(140, '2025_10_16_062212_create_lab_specimens_table', 2),
(141, '2025_10_16_062212_create_lab_subcategories_table', 2),
(142, '2025_10_16_064353_create_lab_tests_table', 2),
(143, '2025_10_16_065015_create_admins_table', 2),
(144, '2025_10_16_065016_create_store_tests_table', 2),
(145, '2025_10_16_085053_create_references_table', 2),
(146, '2025_10_16_124831_create_payment_details_table', 2),
(147, '2025_10_17_044528_create_companies_table', 2),
(148, '2025_10_17_154807_create_beds_table', 2),
(149, '2025_10_17_162645_create_duty_doctors_table', 2),
(150, '2025_10_17_163136_create_diseases_table', 2),
(151, '2025_10_18_113032_create_admission_patients_table', 2),
(152, '2025_10_18_181954_create_admission_bill_summaries_table', 2),
(153, '2025_10_20_153826_create_test_report_details_table', 2),
(154, '2025_10_21_103401_create_patient_test_reports_table', 2),
(155, '2025_10_21_143623_create_units_table', 2),
(156, '2025_10_21_143701_create_generics_table', 2),
(157, '2025_10_21_143740_create_presentations_table', 2),
(158, '2025_10_21_143850_create_reagents_table', 2),
(159, '2025_10_23_114129_create_reagent_stocks_table', 2),
(160, '2025_10_23_115839_create_reagent_test_table', 2),
(161, '2025_12_29_105054_create_expenses_categories_table', 2),
(162, '2025_12_29_105102_create_expenses_sub_categories_table', 2),
(163, '2025_12_29_105112_create_expenses_details_table', 2),
(164, '2025_12_29_150117_create_income_categories_table', 2),
(165, '2025_12_29_150138_create_income_sub_categories_table', 2),
(166, '2025_12_29_150655_create_incomes_table', 2),
(167, '2026_01_01_114435_create_bank_details_table', 2),
(168, '2026_01_01_114446_create_bank_transection_details_table', 2),
(169, '2026_01_02_121227_create_ticket_sales_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_test_reports`
--

CREATE TABLE `patient_test_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reg` varchar(255) DEFAULT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `test_id` bigint(20) UNSIGNED NOT NULL,
  `part_of_test` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `reference_value` varchar(255) DEFAULT NULL,
  `ref_value_of_hormone` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reg` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `doctorId` bigint(20) UNSIGNED NOT NULL,
  `referId` bigint(20) UNSIGNED DEFAULT NULL,
  `total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payable` decimal(12,2) NOT NULL DEFAULT 0.00,
  `pay` decimal(12,2) NOT NULL DEFAULT 0.00,
  `duestatus` int(11) NOT NULL DEFAULT 0,
  `due` decimal(12,2) NOT NULL DEFAULT 0.00,
  `return` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`id`, `reg`, `date`, `name`, `dob`, `gender`, `phone`, `address`, `doctorId`, `referId`, `total`, `discount`, `payable`, `pay`, `duestatus`, `due`, `return`, `status`, `userId`, `created_at`, `updated_at`) VALUES
(1, 'LAB2026010311', '2026-01-03', 'Shamim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 3, 2, 15849.00, 0.00, 15849.00, 15000.00, 1, 849.00, 0.00, 1, 1, '2026-01-03 11:53:30', '2026-01-03 11:53:30'),
(2, 'LAB2026010312', '2026-01-03', 'Farjana Hossain', '2001-12-31', 'Female', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 12, 15, 6199.00, 0.00, 6199.00, 6000.00, 1, 199.00, 0.00, 1, 1, '2026-01-03 11:53:48', '2026-01-03 11:53:48'),
(3, 'LAB2026010313', '2026-01-03', 'Shamim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 1, 3, 12297.00, 0.00, 12297.00, 10000.00, 1, 2297.00, 0.00, 1, 1, '2026-01-03 11:54:07', '2026-01-03 11:54:07');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
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
-- Table structure for table `presentations`
--

CREATE TABLE `presentations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `presentations`
--

INSERT INTO `presentations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Tablet', '2026-01-03 11:50:53', '2025-10-22 11:00:20'),
(2, 'Capsule', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(3, 'Syrup', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(4, 'Injection', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(5, 'Powder', '2026-01-03 11:50:53', '2026-01-03 11:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `reagents`
--

CREATE TABLE `reagents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `generic_id` bigint(20) UNSIGNED NOT NULL,
  `presentation_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `min_qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reagents`
--

INSERT INTO `reagents` (`id`, `name`, `unit_id`, `generic_id`, `presentation_id`, `purchase_price`, `min_qty`, `created_at`, `updated_at`) VALUES
(1, 'Acetone', 1, 1, 1, 186.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(2, 'Alcohol', 1, 1, 1, 164.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(3, 'Ammonia', 1, 1, 1, 125.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(4, 'Benzene', 1, 1, 1, 175.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(5, 'Calcium Chloride', 1, 1, 1, 239.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(6, 'Chloroform', 1, 1, 1, 139.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(7, 'Citric Acid', 1, 1, 1, 493.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(8, 'Copper Sulphate', 1, 1, 1, 443.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(9, 'Formaldehyde', 1, 1, 1, 71.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(10, 'Glucose', 1, 1, 1, 88.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(11, 'Glycerol', 1, 1, 1, 177.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(12, 'Hydrochloric Acid', 1, 1, 1, 500.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(13, 'Hydrogen Peroxide', 1, 1, 1, 201.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(14, 'Iodine', 1, 1, 1, 176.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(15, 'Iron Sulphate', 1, 1, 1, 392.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(16, 'Magnesium Sulphate', 1, 1, 1, 205.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(17, 'Methanol', 1, 1, 1, 175.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(18, 'Nitric Acid', 1, 1, 1, 131.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(19, 'Phenol', 1, 1, 1, 431.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(20, 'Potassium Chloride', 1, 1, 1, 457.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(21, 'Potassium Hydroxide', 1, 1, 1, 219.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(22, 'Sodium Bicarbonate', 1, 1, 1, 330.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(23, 'Sodium Carbonate', 1, 1, 1, 101.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(24, 'Sodium Chloride', 1, 1, 1, 58.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(25, 'Sodium Hydroxide', 1, 1, 1, 137.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(26, 'Sulfuric Acid', 1, 1, 1, 473.00, 50, '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(27, 'Toluene', 1, 1, 1, 458.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(28, 'Urea', 1, 1, 1, 158.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(29, 'Zinc Sulphate', 1, 1, 1, 196.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(30, 'Sodium Nitrate', 1, 1, 1, 378.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(31, 'Ammonium Chloride', 1, 1, 1, 437.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(32, 'Barium Sulphate', 1, 1, 1, 222.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(33, 'Ethyl Acetate', 1, 1, 1, 63.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(34, 'Formic Acid', 1, 1, 1, 445.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(35, 'Hydrazine', 1, 1, 1, 484.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(36, 'Lithium Carbonate', 1, 1, 1, 329.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(37, 'Magnesium Hydroxide', 1, 1, 1, 100.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(38, 'Manganese Sulphate', 1, 1, 1, 465.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(39, 'Nickel Sulphate', 1, 1, 1, 219.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(40, 'Phenolphthalein', 1, 1, 1, 377.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(41, 'Potassium Bromide', 1, 1, 1, 305.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(42, 'Silver Nitrate', 1, 1, 1, 482.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(43, 'Sodium Sulphate', 1, 1, 1, 130.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(44, 'Sulfur', 1, 1, 1, 475.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(45, 'Thymol', 1, 1, 1, 132.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(46, 'Triethanolamine', 1, 1, 1, 285.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(47, 'Xylene', 1, 1, 1, 224.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(48, 'Zinc Chloride', 1, 1, 1, 304.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54'),
(49, 'Aluminium Sulphate', 1, 1, 1, 366.00, 50, '2026-01-03 11:50:54', '2026-01-03 11:50:54');

-- --------------------------------------------------------

--
-- Table structure for table `reagent_stocks`
--

CREATE TABLE `reagent_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reagent_id` bigint(20) UNSIGNED NOT NULL,
  `stock_in` int(11) NOT NULL DEFAULT 0,
  `stock_out` int(11) NOT NULL DEFAULT 0,
  `current_stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reagent_test`
--

CREATE TABLE `reagent_test` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `test_id` bigint(20) UNSIGNED NOT NULL,
  `reagent_id` bigint(20) UNSIGNED NOT NULL,
  `quantity_required` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `references`
--

CREATE TABLE `references` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `references`
--

INSERT INTO `references` (`id`, `name`, `designation`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mr. John Smith', 'Consultant', 'john@example.com', '01710000001', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(2, 'Ms. Alice Johnson', 'Lab Manager', 'alice@example.com', '01710000002', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(3, 'Dr. Robert Brown', 'Physician', 'robert@example.com', '01710000003', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(4, 'Dr. Emily Davis', 'Surgeon', 'emily@example.com', '01710000004', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(5, 'Mr. Michael Wilson', 'Technician', 'michael@example.com', '01710000005', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(6, 'Ms. Sophia Taylor', 'Nurse', 'sophia@example.com', '01710000006', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(7, 'Dr. William Martinez', 'Radiologist', 'william@example.com', '01710000007', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(8, 'Dr. Olivia Anderson', 'Oncologist', 'olivia@example.com', '01710000008', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(9, 'Dr. James Thomas', 'Endocrinologist', 'james@example.com', '01710000009', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(10, 'Dr. Isabella Jackson', 'Pediatrician', 'isabella@example.com', '01710000010', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(11, 'Dr. Benjamin White', 'Cardiologist', 'benjamin@example.com', '01710000011', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(12, 'Dr. Mia Harris', 'Neurologist', 'mia@example.com', '01710000012', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(13, 'Dr. Daniel Clark', 'Orthopedic', 'daniel@example.com', '01710000013', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(14, 'Dr. Charlotte Lewis', 'Dermatologist', 'charlotte@example.com', '01710000014', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52'),
(15, 'Dr. Matthew Lee', 'Ophthalmologist', 'matthew@example.com', '01710000015', 1, '2026-01-03 11:50:52', '2026-01-03 11:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `store_tests`
--

CREATE TABLE `store_tests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `regNum` varchar(255) NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `testId` bigint(20) UNSIGNED NOT NULL,
  `testprice` decimal(8,2) NOT NULL,
  `referprice` decimal(8,2) NOT NULL,
  `categoryId` bigint(20) UNSIGNED NOT NULL,
  `subcategoryId` bigint(20) UNSIGNED NOT NULL,
  `specimenId` bigint(20) UNSIGNED NOT NULL,
  `groupId` bigint(20) UNSIGNED NOT NULL,
  `room` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `reportstatus` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `store_tests`
--

INSERT INTO `store_tests` (`id`, `regNum`, `userId`, `testId`, `testprice`, `referprice`, `categoryId`, `subcategoryId`, `specimenId`, `groupId`, `room`, `status`, `reportstatus`, `created_at`, `updated_at`) VALUES
(1, 'LAB2026010311', 1, 1, 2075.00, 643.00, 3, 3, 2, 2, 'Room 2', 1, 0, '2026-01-03 11:53:18', '2026-01-03 11:53:18'),
(2, 'LAB2026010311', 1, 2, 1268.00, 2307.00, 4, 4, 3, 3, 'Room 10', 1, 0, '2026-01-03 11:53:18', '2026-01-03 11:53:18'),
(3, 'LAB2026010311', 1, 3, 2856.00, 3100.00, 1, 2, 4, 1, 'Room 2', 1, 0, '2026-01-03 11:53:19', '2026-01-03 11:53:19'),
(4, 'LAB2026010311', 1, 4, 3686.00, 3928.00, 3, 3, 1, 1, 'Room 7', 1, 0, '2026-01-03 11:53:19', '2026-01-03 11:53:19'),
(5, 'LAB2026010311', 1, 5, 2412.00, 3826.00, 4, 1, 3, 1, 'Room 8', 1, 0, '2026-01-03 11:53:20', '2026-01-03 11:53:20'),
(6, 'LAB2026010311', 1, 6, 3552.00, 580.00, 2, 1, 4, 1, 'Room 7', 1, 0, '2026-01-03 11:53:20', '2026-01-03 11:53:20'),
(7, 'LAB2026010312', 1, 1, 2075.00, 643.00, 3, 3, 2, 2, 'Room 2', 1, 0, '2026-01-03 11:53:33', '2026-01-03 11:53:33'),
(8, 'LAB2026010312', 1, 2, 1268.00, 2307.00, 4, 4, 3, 3, 'Room 10', 1, 0, '2026-01-03 11:53:33', '2026-01-03 11:53:33'),
(9, 'LAB2026010312', 1, 3, 2856.00, 3100.00, 1, 2, 4, 1, 'Room 2', 1, 0, '2026-01-03 11:53:34', '2026-01-03 11:53:34'),
(10, 'LAB2026010313', 1, 1, 2075.00, 643.00, 3, 3, 2, 2, 'Room 2', 1, 0, '2026-01-03 11:53:58', '2026-01-03 11:53:58'),
(11, 'LAB2026010313', 1, 2, 1268.00, 2307.00, 4, 4, 3, 3, 'Room 10', 1, 0, '2026-01-03 11:53:58', '2026-01-03 11:53:58'),
(12, 'LAB2026010313', 1, 3, 2856.00, 3100.00, 1, 2, 4, 1, 'Room 2', 1, 0, '2026-01-03 11:53:59', '2026-01-03 11:53:59'),
(13, 'LAB2026010313', 1, 5, 2412.00, 3826.00, 4, 1, 3, 1, 'Room 8', 1, 0, '2026-01-03 11:54:00', '2026-01-03 11:54:00'),
(14, 'LAB2026010313', 1, 4, 3686.00, 3928.00, 3, 3, 1, 1, 'Room 7', 1, 0, '2026-01-03 11:54:00', '2026-01-03 11:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `test_report_details`
--

CREATE TABLE `test_report_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `test_id` bigint(20) UNSIGNED NOT NULL,
  `part_of_test` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `reference_value` varchar(255) DEFAULT NULL,
  `ref_value_of_hormone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_report_details`
--

INSERT INTO `test_report_details` (`id`, `test_id`, `part_of_test`, `result`, `unit`, `reference_value`, `ref_value_of_hormone`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hemoglobin', '14.2', 'g/dL', '13.0 - 17.0', NULL, NULL, NULL),
(2, 1, 'WBC Count', '6.5', '×10³/µL', '4.0 - 11.0', NULL, NULL, NULL),
(3, 1, 'Platelet Count', '230', '×10³/µL', '150 - 400', NULL, NULL, NULL),
(4, 2, 'T3', '1.3', 'ng/mL', '0.8 - 2.0', 'Normal thyroid function', NULL, NULL),
(5, 2, 'T4', '8.2', 'µg/dL', '5.0 - 12.0', 'Normal thyroid function', NULL, NULL),
(6, 2, 'TSH', '2.7', 'µIU/mL', '0.4 - 4.0', 'Normal thyroid function', NULL, NULL),
(7, 3, 'SGPT (ALT)', '32', 'U/L', '0 - 45', NULL, NULL, NULL),
(8, 3, 'SGOT (AST)', '28', 'U/L', '0 - 40', NULL, NULL, NULL),
(9, 3, 'Bilirubin Total', '0.8', 'mg/dL', '0.2 - 1.2', NULL, NULL, NULL),
(10, 4, 'Urea', '35', 'mg/dL', '15 - 45', NULL, NULL, NULL),
(11, 4, 'Creatinine', '1.1', 'mg/dL', '0.7 - 1.4', NULL, NULL, NULL),
(12, 5, 'Cholesterol Total', '180', 'mg/dL', '<200', NULL, NULL, NULL),
(13, 5, 'HDL', '52', 'mg/dL', '>40', NULL, NULL, NULL),
(14, 5, 'LDL', '110', 'mg/dL', '<130', NULL, NULL, NULL),
(15, 5, 'Triglycerides', '145', 'mg/dL', '<150', NULL, NULL, NULL),
(16, 6, 'Fasting Blood Sugar', '92', 'mg/dL', '70 - 100', NULL, NULL, NULL),
(17, 6, 'Postprandial Blood Sugar', '128', 'mg/dL', '<140', NULL, NULL, NULL),
(18, 7, 'pH', '6.5', NULL, '4.5 - 8.0', NULL, NULL, NULL),
(19, 7, 'Protein', 'Negative', NULL, 'Negative', NULL, NULL, NULL),
(20, 7, 'Glucose', 'Negative', NULL, 'Negative', NULL, NULL, NULL),
(21, 8, 'Sodium', '138', 'mmol/L', '135 - 145', NULL, NULL, NULL),
(22, 8, 'Potassium', '4.2', 'mmol/L', '3.5 - 5.1', NULL, NULL, NULL),
(23, 8, 'Chloride', '103', 'mmol/L', '98 - 107', NULL, NULL, NULL),
(24, 9, 'FEV1', '3.5', 'L', '>2.5', NULL, NULL, NULL),
(25, 9, 'FVC', '4.2', 'L', '>3.0', NULL, NULL, NULL),
(26, 10, 'Heart Rate', '78', 'bpm', '60 - 100', NULL, NULL, NULL),
(27, 10, 'QRS Duration', '85', 'ms', '70 - 110', NULL, NULL, NULL),
(28, 11, 'Vision (Left)', '6/6', NULL, '6/6', NULL, NULL, NULL),
(29, 11, 'Vision (Right)', '6/6', NULL, '6/6', NULL, NULL, NULL),
(30, 12, 'Observation', 'Normal', NULL, 'Normal', NULL, NULL, NULL),
(31, 13, 'CK-MB', '20', 'U/L', '<25', NULL, NULL, NULL),
(32, 13, 'Troponin I', '0.01', 'ng/mL', '<0.04', NULL, NULL, NULL),
(33, 14, 'NS1 Antigen', 'Negative', NULL, 'Negative', NULL, NULL, NULL),
(34, 14, 'IgM Antibody', 'Negative', NULL, 'Negative', NULL, NULL, NULL),
(35, 15, 'Plasmodium Falciparum', 'Negative', NULL, 'Negative', NULL, NULL, NULL),
(36, 15, 'Plasmodium Vivax', 'Negative', NULL, 'Negative', NULL, NULL, NULL),
(37, 16, 'Vitamin D', '35', 'ng/mL', '30 - 100', NULL, NULL, NULL),
(38, 17, 'Vitamin B12', '450', 'pg/mL', '200 - 900', NULL, NULL, NULL),
(39, 18, 'Iron', '95', 'µg/dL', '60 - 170', NULL, NULL, NULL),
(40, 19, 'Ferritin', '80', 'ng/mL', '30 - 400', NULL, NULL, NULL),
(41, 20, 'Uric Acid', '5.6', 'mg/dL', '3.5 - 7.2', NULL, NULL, NULL),
(42, 21, 'ESR', '12', 'mm/hr', '0 - 15', NULL, NULL, NULL),
(43, 22, 'RBC Count', '4.9', 'million/µL', '4.2 - 6.0', NULL, NULL, NULL),
(44, 23, 'PCV', '42', '%', '40 - 50', NULL, NULL, NULL),
(45, 24, 'MCH', '29', 'pg', '27 - 33', NULL, NULL, NULL),
(46, 25, 'MCHC', '33', 'g/dL', '32 - 36', NULL, NULL, NULL),
(47, 26, 'RDW', '13.2', '%', '11.5 - 14.5', NULL, NULL, NULL),
(48, 27, 'Neutrophils', '60', '%', '40 - 75', NULL, NULL, NULL),
(49, 28, 'Lymphocytes', '32', '%', '20 - 45', NULL, NULL, NULL),
(50, 29, 'Monocytes', '6', '%', '2 - 8', NULL, NULL, NULL),
(51, 30, 'Eosinophils', '2', '%', '1 - 6', NULL, NULL, NULL),
(52, 31, 'Basophils', '0.5', '%', '0 - 1', NULL, NULL, NULL),
(53, 32, 'Prothrombin Time', '13', 'sec', '11 - 15', NULL, NULL, NULL),
(54, 33, 'INR', '1.0', NULL, '0.8 - 1.2', NULL, NULL, NULL),
(55, 34, 'aPTT', '30', 'sec', '25 - 35', NULL, NULL, NULL),
(56, 35, 'HIV 1 & 2', 'Negative', NULL, 'Negative', NULL, NULL, NULL),
(57, 36, 'HCV Antibody', 'Negative', NULL, 'Negative', NULL, NULL, NULL),
(58, 37, 'HbA1c', '5.4', '%', '<5.7', NULL, NULL, NULL),
(59, 38, 'Blood Group', 'B+', NULL, NULL, NULL, NULL, NULL),
(60, 39, 'Pregnancy Test', 'Negative', NULL, 'Negative', NULL, NULL, NULL),
(61, 40, 'Stool Occult Blood', 'Negative', NULL, 'Negative', NULL, NULL, NULL),
(62, 41, 'Amylase', '85', 'U/L', '30 - 110', NULL, NULL, NULL),
(63, 42, 'Lipase', '45', 'U/L', '13 - 60', NULL, NULL, NULL),
(64, 43, 'LDH', '180', 'U/L', '140 - 280', NULL, NULL, NULL),
(65, 44, 'GGT', '28', 'U/L', '10 - 50', NULL, NULL, NULL),
(66, 45, 'Phosphorus', '3.6', 'mg/dL', '2.5 - 4.5', NULL, NULL, NULL),
(67, 46, 'Magnesium', '2.1', 'mg/dL', '1.7 - 2.4', NULL, NULL, NULL),
(68, 47, 'Zinc', '95', 'µg/dL', '60 - 120', NULL, NULL, NULL),
(69, 48, 'Copper', '110', 'µg/dL', '70 - 140', NULL, NULL, NULL),
(70, 49, 'Insulin (Fasting)', '8.5', 'µIU/mL', '2 - 25', NULL, NULL, NULL),
(71, 50, 'Cortisol (Morning)', '15', 'µg/dL', '6 - 23', 'Normal morning level', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_sales`
--

CREATE TABLE `ticket_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reg` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `refer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payable` decimal(12,2) NOT NULL DEFAULT 0.00,
  `pay` decimal(12,2) NOT NULL DEFAULT 0.00,
  `duestatus` int(11) NOT NULL DEFAULT 0,
  `due` decimal(12,2) NOT NULL DEFAULT 0.00,
  `return` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'mg', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(2, 'ml', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(3, 'g', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(4, 'L', '2026-01-03 11:50:53', '2025-10-22 10:52:17'),
(5, 'tablet', '2026-01-03 11:50:53', '2026-01-03 11:50:53'),
(6, 'capsule', '2026-01-03 11:50:53', '2026-01-03 11:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admission_bill_summaries`
--
ALTER TABLE `admission_bill_summaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admission_bill_summaries_patient_id_foreign` (`patient_id`),
  ADD KEY `admission_bill_summaries_user_id_foreign` (`user_id`);

--
-- Indexes for table `admission_patients`
--
ALTER TABLE `admission_patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admission_patients_refer_id_foreign` (`refer_id`),
  ADD KEY `admission_patients_treatment_under_id_foreign` (`treatment_under_id`),
  ADD KEY `admission_patients_duty_doctor_id_foreign` (`duty_doctor_id`),
  ADD KEY `admission_patients_disease_id_foreign` (`disease_id`),
  ADD KEY `admission_patients_bed_id_foreign` (`bed_id`),
  ADD KEY `admission_patients_user_id_foreign` (`user_id`);

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bank_details_account_number_unique` (`account_number`);

--
-- Indexes for table `bank_transection_details`
--
ALTER TABLE `bank_transection_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_transection_details_bank_id_foreign` (`bank_id`),
  ADD KEY `bank_transection_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `beds`
--
ALTER TABLE `beds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `beds_bed_number_unique` (`bed_number`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_email_unique` (`email`);

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `duty_doctors`
--
ALTER TABLE `duty_doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `duty_doctors_phone_unique` (`phone`);

--
-- Indexes for table `expenses_categories`
--
ALTER TABLE `expenses_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses_details`
--
ALTER TABLE `expenses_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_details_category_id_foreign` (`category_id`),
  ADD KEY `expenses_details_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `expenses_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `expenses_sub_categories`
--
ALTER TABLE `expenses_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `generics`
--
ALTER TABLE `generics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `generics_name_unique` (`name`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incomes_category_id_foreign` (`category_id`),
  ADD KEY `incomes_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `incomes_user_id_foreign` (`user_id`);

--
-- Indexes for table `income_categories`
--
ALTER TABLE `income_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `income_categories_name_unique` (`name`);

--
-- Indexes for table `income_sub_categories`
--
ALTER TABLE `income_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `income_sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `lab_categories`
--
ALTER TABLE `lab_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_groups`
--
ALTER TABLE `lab_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_materials`
--
ALTER TABLE `lab_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_specimens`
--
ALTER TABLE `lab_specimens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_subcategories`
--
ALTER TABLE `lab_subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_tests`
--
ALTER TABLE `lab_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lab_tests_categoryid_foreign` (`categoryId`),
  ADD KEY `lab_tests_subcategoryid_foreign` (`subcategoryId`),
  ADD KEY `lab_tests_specimenid_foreign` (`specimenId`),
  ADD KEY `lab_tests_groupid_foreign` (`groupId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `patient_test_reports`
--
ALTER TABLE `patient_test_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_test_reports_patient_id_foreign` (`patient_id`),
  ADD KEY `patient_test_reports_test_id_foreign` (`test_id`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_details_doctorid_foreign` (`doctorId`),
  ADD KEY `payment_details_referid_foreign` (`referId`),
  ADD KEY `payment_details_userid_foreign` (`userId`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `presentations`
--
ALTER TABLE `presentations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `presentations_name_unique` (`name`);

--
-- Indexes for table `reagents`
--
ALTER TABLE `reagents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reagents_unit_id_foreign` (`unit_id`),
  ADD KEY `reagents_generic_id_foreign` (`generic_id`),
  ADD KEY `reagents_presentation_id_foreign` (`presentation_id`);

--
-- Indexes for table `reagent_stocks`
--
ALTER TABLE `reagent_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reagent_stocks_reagent_id_foreign` (`reagent_id`);

--
-- Indexes for table `reagent_test`
--
ALTER TABLE `reagent_test`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reagent_test_test_id_reagent_id_unique` (`test_id`,`reagent_id`),
  ADD KEY `reagent_test_reagent_id_foreign` (`reagent_id`);

--
-- Indexes for table `references`
--
ALTER TABLE `references`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_tests`
--
ALTER TABLE `store_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_tests_userid_foreign` (`userId`),
  ADD KEY `store_tests_testid_foreign` (`testId`),
  ADD KEY `store_tests_categoryid_foreign` (`categoryId`),
  ADD KEY `store_tests_subcategoryid_foreign` (`subcategoryId`),
  ADD KEY `store_tests_specimenid_foreign` (`specimenId`),
  ADD KEY `store_tests_groupid_foreign` (`groupId`);

--
-- Indexes for table `test_report_details`
--
ALTER TABLE `test_report_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_report_details_test_id_foreign` (`test_id`);

--
-- Indexes for table `ticket_sales`
--
ALTER TABLE `ticket_sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_sales_reg_unique` (`reg`),
  ADD KEY `ticket_sales_doctor_id_foreign` (`doctor_id`),
  ADD KEY `ticket_sales_refer_id_foreign` (`refer_id`),
  ADD KEY `ticket_sales_user_id_foreign` (`user_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `units_name_unique` (`name`);

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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admission_bill_summaries`
--
ALTER TABLE `admission_bill_summaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admission_patients`
--
ALTER TABLE `admission_patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bank_transection_details`
--
ALTER TABLE `bank_transection_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beds`
--
ALTER TABLE `beds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `diseases`
--
ALTER TABLE `diseases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `duty_doctors`
--
ALTER TABLE `duty_doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `expenses_categories`
--
ALTER TABLE `expenses_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `expenses_details`
--
ALTER TABLE `expenses_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses_sub_categories`
--
ALTER TABLE `expenses_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `generics`
--
ALTER TABLE `generics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_categories`
--
ALTER TABLE `income_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `income_sub_categories`
--
ALTER TABLE `income_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `lab_categories`
--
ALTER TABLE `lab_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lab_groups`
--
ALTER TABLE `lab_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lab_materials`
--
ALTER TABLE `lab_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab_specimens`
--
ALTER TABLE `lab_specimens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lab_subcategories`
--
ALTER TABLE `lab_subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lab_tests`
--
ALTER TABLE `lab_tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_test_reports`
--
ALTER TABLE `patient_test_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `presentations`
--
ALTER TABLE `presentations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reagents`
--
ALTER TABLE `reagents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `reagent_stocks`
--
ALTER TABLE `reagent_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reagent_test`
--
ALTER TABLE `reagent_test`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `references`
--
ALTER TABLE `references`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `store_tests`
--
ALTER TABLE `store_tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `test_report_details`
--
ALTER TABLE `test_report_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `ticket_sales`
--
ALTER TABLE `ticket_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admission_bill_summaries`
--
ALTER TABLE `admission_bill_summaries`
  ADD CONSTRAINT `admission_bill_summaries_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `admission_patients` (`id`),
  ADD CONSTRAINT `admission_bill_summaries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `admission_patients`
--
ALTER TABLE `admission_patients`
  ADD CONSTRAINT `admission_patients_bed_id_foreign` FOREIGN KEY (`bed_id`) REFERENCES `beds` (`id`),
  ADD CONSTRAINT `admission_patients_disease_id_foreign` FOREIGN KEY (`disease_id`) REFERENCES `diseases` (`id`),
  ADD CONSTRAINT `admission_patients_duty_doctor_id_foreign` FOREIGN KEY (`duty_doctor_id`) REFERENCES `duty_doctors` (`id`),
  ADD CONSTRAINT `admission_patients_refer_id_foreign` FOREIGN KEY (`refer_id`) REFERENCES `references` (`id`),
  ADD CONSTRAINT `admission_patients_treatment_under_id_foreign` FOREIGN KEY (`treatment_under_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `admission_patients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `bank_transection_details`
--
ALTER TABLE `bank_transection_details`
  ADD CONSTRAINT `bank_transection_details_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `bank_details` (`id`),
  ADD CONSTRAINT `bank_transection_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `expenses_details`
--
ALTER TABLE `expenses_details`
  ADD CONSTRAINT `expenses_details_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expenses_categories` (`id`),
  ADD CONSTRAINT `expenses_details_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `expenses_sub_categories` (`id`),
  ADD CONSTRAINT `expenses_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `expenses_sub_categories`
--
ALTER TABLE `expenses_sub_categories`
  ADD CONSTRAINT `expenses_sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expenses_categories` (`id`);

--
-- Constraints for table `incomes`
--
ALTER TABLE `incomes`
  ADD CONSTRAINT `incomes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `income_categories` (`id`),
  ADD CONSTRAINT `incomes_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `income_sub_categories` (`id`),
  ADD CONSTRAINT `incomes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `income_sub_categories`
--
ALTER TABLE `income_sub_categories`
  ADD CONSTRAINT `income_sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `income_categories` (`id`);

--
-- Constraints for table `lab_tests`
--
ALTER TABLE `lab_tests`
  ADD CONSTRAINT `lab_tests_categoryid_foreign` FOREIGN KEY (`categoryId`) REFERENCES `lab_categories` (`id`),
  ADD CONSTRAINT `lab_tests_groupid_foreign` FOREIGN KEY (`groupId`) REFERENCES `lab_groups` (`id`),
  ADD CONSTRAINT `lab_tests_specimenid_foreign` FOREIGN KEY (`specimenId`) REFERENCES `lab_specimens` (`id`),
  ADD CONSTRAINT `lab_tests_subcategoryid_foreign` FOREIGN KEY (`subcategoryId`) REFERENCES `lab_subcategories` (`id`);

--
-- Constraints for table `patient_test_reports`
--
ALTER TABLE `patient_test_reports`
  ADD CONSTRAINT `patient_test_reports_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `payment_details` (`id`),
  ADD CONSTRAINT `patient_test_reports_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `test_report_details` (`id`);

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_doctorid_foreign` FOREIGN KEY (`doctorId`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `payment_details_referid_foreign` FOREIGN KEY (`referId`) REFERENCES `references` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `payment_details_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `admins` (`id`);

--
-- Constraints for table `reagents`
--
ALTER TABLE `reagents`
  ADD CONSTRAINT `reagents_generic_id_foreign` FOREIGN KEY (`generic_id`) REFERENCES `generics` (`id`),
  ADD CONSTRAINT `reagents_presentation_id_foreign` FOREIGN KEY (`presentation_id`) REFERENCES `presentations` (`id`),
  ADD CONSTRAINT `reagents_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `reagent_stocks`
--
ALTER TABLE `reagent_stocks`
  ADD CONSTRAINT `reagent_stocks_reagent_id_foreign` FOREIGN KEY (`reagent_id`) REFERENCES `reagents` (`id`);

--
-- Constraints for table `reagent_test`
--
ALTER TABLE `reagent_test`
  ADD CONSTRAINT `reagent_test_reagent_id_foreign` FOREIGN KEY (`reagent_id`) REFERENCES `reagents` (`id`),
  ADD CONSTRAINT `reagent_test_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `lab_tests` (`id`);

--
-- Constraints for table `store_tests`
--
ALTER TABLE `store_tests`
  ADD CONSTRAINT `store_tests_categoryid_foreign` FOREIGN KEY (`categoryId`) REFERENCES `lab_categories` (`id`),
  ADD CONSTRAINT `store_tests_groupid_foreign` FOREIGN KEY (`groupId`) REFERENCES `lab_groups` (`id`),
  ADD CONSTRAINT `store_tests_specimenid_foreign` FOREIGN KEY (`specimenId`) REFERENCES `lab_specimens` (`id`),
  ADD CONSTRAINT `store_tests_subcategoryid_foreign` FOREIGN KEY (`subcategoryId`) REFERENCES `lab_subcategories` (`id`),
  ADD CONSTRAINT `store_tests_testid_foreign` FOREIGN KEY (`testId`) REFERENCES `lab_tests` (`id`),
  ADD CONSTRAINT `store_tests_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `admins` (`id`);

--
-- Constraints for table `test_report_details`
--
ALTER TABLE `test_report_details`
  ADD CONSTRAINT `test_report_details_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `lab_tests` (`id`);

--
-- Constraints for table `ticket_sales`
--
ALTER TABLE `ticket_sales`
  ADD CONSTRAINT `ticket_sales_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `ticket_sales_refer_id_foreign` FOREIGN KEY (`refer_id`) REFERENCES `references` (`id`),
  ADD CONSTRAINT `ticket_sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
