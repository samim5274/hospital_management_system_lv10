-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 03, 2026 at 07:31 AM
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
(1, 'SAMIM Hossain', 'samim@gmail.com', '$2y$12$XpSO9YALOs7vC.N5uXb.0OJyd5V2kBcnMpM/qUQvWDjF33mPFKsru', 'admin', '508373', '2025-12-31 23:50:42', NULL, '2026-01-01 22:25:12', '127.0.0.1', 'kHlmLoGsoEq429eFVdcDRf1pdMe5IcEv1g8TkRuU7BPW6M7hvn0w0gENizI4', NULL, '2026-01-01 22:25:12'),
(2, 'Akib Hossain', 'akib@gmail.com', '$2y$12$XpSO9YALOs7vC.N5uXb.0OJyd5V2kBcnMpM/qUQvWDjF33mPFKsru', 'Admin', NULL, NULL, NULL, NULL, NULL, 'jSPfQ1rBQIGa5n2chjx2mtXfGWlwyl3Srsg5dd0wAxdUNgo6hlrPSyGGok20', '2025-10-25 06:00:59', '2025-10-25 06:00:59'),
(3, 'Akib Hossain', 'akib2@gmail.com', '$2y$12$nk8MgzG7.Ggnnclyokz0v.V0uEFjK05mJbq75MfBQv0LnSuwMhRKO', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-25 06:14:41', '2025-10-25 06:14:41');

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
(1, 'B001', 'ICU', 'available', 1841.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(2, 'B002', 'Female Ward', 'available', 955.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(3, 'B003', 'Female Ward', 'available', 1119.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(4, 'B004', 'ICU', 'available', 1522.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(5, 'B005', 'Female Ward', 'available', 948.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(6, 'B006', 'ICU', 'available', 1247.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(7, 'B007', 'ICU', 'available', 797.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(8, 'B008', 'Emergency', 'available', 598.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(9, 'B009', 'Cabin', 'available', 1838.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(10, 'B010', 'ICU', 'available', 1066.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(11, 'B011', 'Emergency', 'available', 1313.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(12, 'B012', 'Cabin', 'available', 1537.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(13, 'B013', 'ICU', 'available', 720.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(14, 'B014', 'Emergency', 'available', 1202.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(15, 'B015', 'Female Ward', 'available', 581.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(16, 'B016', 'Male Ward', 'available', 1898.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(17, 'B017', 'Male Ward', 'available', 1315.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(18, 'B018', 'Male Ward', 'available', 1542.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(19, 'B019', 'Emergency', 'available', 1890.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(20, 'B020', 'Female Ward', 'available', 1774.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(21, 'B021', 'Male Ward', 'available', 1467.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(22, 'B022', 'ICU', 'available', 1907.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(23, 'B023', 'Emergency', 'available', 1287.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(24, 'B024', 'Male Ward', 'available', 1372.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(25, 'B025', 'Female Ward', 'available', 1495.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(26, 'B026', 'Emergency', 'available', 1421.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(27, 'B027', 'Female Ward', 'available', 1908.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(28, 'B028', 'Cabin', 'available', 1231.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(29, 'B029', 'ICU', 'available', 670.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(30, 'B030', 'Cabin', 'available', 759.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(31, 'B031', 'Male Ward', 'available', 1569.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(32, 'B032', 'Cabin', 'available', 1794.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(33, 'B033', 'ICU', 'available', 1288.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(34, 'B034', 'Male Ward', 'available', 1634.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(35, 'B035', 'Emergency', 'available', 669.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(36, 'B036', 'Male Ward', 'available', 1181.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(37, 'B037', 'Cabin', 'available', 531.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(38, 'B038', 'Emergency', 'available', 1067.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(39, 'B039', 'ICU', 'available', 512.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(40, 'B040', 'Emergency', 'available', 806.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(41, 'B041', 'Cabin', 'available', 785.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(42, 'B042', 'ICU', 'available', 1080.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(43, 'B043', 'Emergency', 'available', 1903.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(44, 'B044', 'Male Ward', 'available', 1700.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(45, 'B045', 'Male Ward', 'available', 1719.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(46, 'B046', 'Male Ward', 'available', 1156.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(47, 'B047', 'ICU', 'available', 763.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(48, 'B048', 'Emergency', 'available', 636.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(49, 'B049', 'ICU', 'available', 1858.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(50, 'B050', 'Cabin', 'available', 535.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(51, 'B051', 'Emergency', 'available', 933.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(52, 'B052', 'Cabin', 'available', 1333.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(53, 'B053', 'Female Ward', 'available', 1519.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(54, 'B054', 'ICU', 'available', 709.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(55, 'B055', 'Female Ward', 'available', 1428.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(56, 'B056', 'Cabin', 'available', 1146.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(57, 'B057', 'Male Ward', 'available', 1847.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(58, 'B058', 'Female Ward', 'available', 1546.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(59, 'B059', 'Female Ward', 'available', 554.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(60, 'B060', 'ICU', 'available', 1713.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(61, 'B061', 'Male Ward', 'available', 1021.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(62, 'B062', 'Cabin', 'available', 985.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(63, 'B063', 'Cabin', 'available', 1373.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(64, 'B064', 'Male Ward', 'available', 1808.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(65, 'B065', 'Emergency', 'available', 1574.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(66, 'B066', 'ICU', 'available', 1266.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(67, 'B067', 'Emergency', 'available', 1358.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(68, 'B068', 'Cabin', 'available', 776.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(69, 'B069', 'Emergency', 'available', 544.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(70, 'B070', 'Female Ward', 'available', 1423.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(71, 'B071', 'Emergency', 'available', 945.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(72, 'B072', 'Cabin', 'available', 1307.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(73, 'B073', 'ICU', 'available', 582.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(74, 'B074', 'Emergency', 'available', 1323.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(75, 'B075', 'ICU', 'available', 1804.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(76, 'B076', 'ICU', 'available', 1770.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(77, 'B077', 'Emergency', 'available', 1701.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(78, 'B078', 'Female Ward', 'available', 1125.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(79, 'B079', 'Female Ward', 'available', 1588.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(80, 'B080', 'ICU', 'available', 1866.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(81, 'B081', 'ICU', 'available', 925.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(82, 'B082', 'Cabin', 'available', 1062.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(83, 'B083', 'Cabin', 'available', 1878.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(84, 'B084', 'Female Ward', 'available', 1031.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(85, 'B085', 'Cabin', 'available', 1208.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(86, 'B086', 'Male Ward', 'available', 941.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(87, 'B087', 'Male Ward', 'available', 991.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(88, 'B088', 'Cabin', 'available', 1114.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(89, 'B089', 'Male Ward', 'available', 1788.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(90, 'B090', 'ICU', 'available', 588.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(91, 'B091', 'Cabin', 'available', 1045.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(92, 'B092', 'Female Ward', 'available', 776.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(93, 'B093', 'Cabin', 'available', 1084.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(94, 'B094', 'Male Ward', 'available', 1984.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(95, 'B095', 'ICU', 'available', 1239.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(96, 'B096', 'ICU', 'available', 1033.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(97, 'B097', 'Emergency', 'available', 1376.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(98, 'B098', 'Emergency', 'available', 1812.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(99, 'B099', 'Cabin', 'available', 734.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(100, 'B100', 'Female Ward', 'available', 2000.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(101, 'B101', 'Cabin', 'available', 1412.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(102, 'B102', 'Female Ward', 'available', 1315.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(103, 'B103', 'Cabin', 'available', 1489.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(104, 'B104', 'Female Ward', 'available', 848.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(105, 'B105', 'ICU', 'available', 742.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(106, 'B106', 'Emergency', 'available', 1301.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(107, 'B107', 'Emergency', 'available', 1759.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(108, 'B108', 'Cabin', 'available', 1624.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(109, 'B109', 'Female Ward', 'available', 1495.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(110, 'B110', 'ICU', 'available', 912.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(111, 'B111', 'Female Ward', 'available', 1294.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(112, 'B112', 'Emergency', 'available', 1509.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(113, 'B113', 'Cabin', 'available', 998.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(114, 'B114', 'ICU', 'available', 846.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(115, 'B115', 'Female Ward', 'available', 939.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(116, 'B116', 'Emergency', 'available', 741.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(117, 'B117', 'ICU', 'available', 1862.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(118, 'B118', 'Female Ward', 'available', 1315.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(119, 'B119', 'Male Ward', 'available', 1994.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(120, 'B120', 'Male Ward', 'available', 1151.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(121, 'B121', 'Emergency', 'available', 1512.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(122, 'B122', 'Emergency', 'available', 1037.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(123, 'B123', 'Emergency', 'available', 1764.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(124, 'B124', 'Cabin', 'available', 891.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(125, 'B125', 'ICU', 'available', 1556.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(126, 'B126', 'ICU', 'available', 514.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(127, 'B127', 'ICU', 'available', 1534.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(128, 'B128', 'Female Ward', 'available', 822.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(129, 'B129', 'Cabin', 'available', 1989.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(130, 'B130', 'ICU', 'available', 1344.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(131, 'B131', 'Female Ward', 'available', 1527.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(132, 'B132', 'Female Ward', 'available', 1891.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(133, 'B133', 'ICU', 'available', 1848.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(134, 'B134', 'Emergency', 'available', 742.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(135, 'B135', 'Cabin', 'available', 1444.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(136, 'B136', 'Emergency', 'available', 1920.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(137, 'B137', 'Emergency', 'available', 1871.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(138, 'B138', 'Female Ward', 'available', 1402.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(139, 'B139', 'Male Ward', 'available', 1874.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(140, 'B140', 'Female Ward', 'available', 990.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(141, 'B141', 'Female Ward', 'available', 1178.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(142, 'B142', 'Male Ward', 'available', 1367.00, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(143, 'B143', 'Emergency', 'available', 1679.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(144, 'B144', 'ICU', 'available', 873.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(145, 'B145', 'ICU', 'available', 1013.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(146, 'B146', 'Cabin', 'available', 896.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(147, 'B147', 'Emergency', 'available', 1970.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(148, 'B148', 'ICU', 'available', 1846.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(149, 'B149', 'Female Ward', 'available', 1132.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(150, 'B150', 'ICU', 'available', 1244.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(151, 'B151', 'Cabin', 'available', 1158.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(152, 'B152', 'ICU', 'available', 1914.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(153, 'B153', 'Cabin', 'available', 894.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(154, 'B154', 'Emergency', 'available', 541.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(155, 'B155', 'ICU', 'available', 827.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(156, 'B156', 'Male Ward', 'available', 845.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(157, 'B157', 'Male Ward', 'available', 1707.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(158, 'B158', 'Male Ward', 'available', 1966.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(159, 'B159', 'Male Ward', 'available', 705.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(160, 'B160', 'Female Ward', 'available', 623.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(161, 'B161', 'Emergency', 'available', 1954.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(162, 'B162', 'Female Ward', 'available', 1246.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(163, 'B163', 'Female Ward', 'available', 1398.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(164, 'B164', 'Female Ward', 'available', 1391.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(165, 'B165', 'Emergency', 'available', 1213.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(166, 'B166', 'Male Ward', 'available', 879.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(167, 'B167', 'Female Ward', 'available', 1255.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(168, 'B168', 'Female Ward', 'available', 1310.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(169, 'B169', 'Cabin', 'available', 714.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(170, 'B170', 'Female Ward', 'available', 1248.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(171, 'B171', 'Cabin', 'available', 934.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(172, 'B172', 'Emergency', 'available', 1283.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(173, 'B173', 'Female Ward', 'available', 1503.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(174, 'B174', 'ICU', 'available', 689.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(175, 'B175', 'Male Ward', 'available', 1869.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(176, 'B176', 'ICU', 'available', 1245.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(177, 'B177', 'Male Ward', 'available', 1677.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(178, 'B178', 'Cabin', 'available', 1037.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(179, 'B179', 'Male Ward', 'available', 1687.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(180, 'B180', 'ICU', 'available', 1090.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(181, 'B181', 'ICU', 'available', 1139.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(182, 'B182', 'Emergency', 'available', 1337.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(183, 'B183', 'Emergency', 'available', 583.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(184, 'B184', 'Male Ward', 'available', 1062.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(185, 'B185', 'Cabin', 'available', 1978.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(186, 'B186', 'ICU', 'available', 863.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(187, 'B187', 'Male Ward', 'available', 1200.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(188, 'B188', 'Male Ward', 'available', 1236.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(189, 'B189', 'Male Ward', 'available', 1417.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(190, 'B190', 'Female Ward', 'available', 1471.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(191, 'B191', 'Emergency', 'available', 1790.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(192, 'B192', 'Female Ward', 'available', 1890.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(193, 'B193', 'Male Ward', 'available', 922.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(194, 'B194', 'Emergency', 'available', 1122.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(195, 'B195', 'Cabin', 'available', 1034.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(196, 'B196', 'Cabin', 'available', 786.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(197, 'B197', 'Male Ward', 'available', 1586.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(198, 'B198', 'Emergency', 'available', 1489.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(199, 'B199', 'Male Ward', 'available', 1981.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(200, 'B200', 'ICU', 'available', 1040.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(201, 'B201', 'Male Ward', 'available', 1669.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(202, 'B202', 'ICU', 'available', 1818.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(203, 'B203', 'Cabin', 'available', 1072.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(204, 'B204', 'Emergency', 'available', 1999.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(205, 'B205', 'Cabin', 'available', 1610.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(206, 'B206', 'Male Ward', 'available', 649.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(207, 'B207', 'Female Ward', 'available', 1147.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(208, 'B208', 'Female Ward', 'available', 1443.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(209, 'B209', 'ICU', 'available', 594.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(210, 'B210', 'Female Ward', 'available', 1366.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(211, 'B211', 'Cabin', 'available', 1644.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(212, 'B212', 'Male Ward', 'available', 1788.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(213, 'B213', 'Female Ward', 'available', 1292.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(214, 'B214', 'Male Ward', 'available', 1751.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(215, 'B215', 'Male Ward', 'available', 1941.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(216, 'B216', 'Male Ward', 'available', 1261.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(217, 'B217', 'ICU', 'available', 1050.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(218, 'B218', 'Cabin', 'available', 533.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(219, 'B219', 'Cabin', 'available', 1276.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(220, 'B220', 'Male Ward', 'available', 835.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(221, 'B221', 'Female Ward', 'available', 1040.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(222, 'B222', 'Female Ward', 'available', 977.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(223, 'B223', 'Male Ward', 'available', 753.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(224, 'B224', 'Male Ward', 'available', 767.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(225, 'B225', 'Emergency', 'available', 2000.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(226, 'B226', 'ICU', 'available', 1991.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(227, 'B227', 'ICU', 'available', 1423.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(228, 'B228', 'Emergency', 'available', 1463.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(229, 'B229', 'Female Ward', 'available', 1043.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(230, 'B230', 'Female Ward', 'available', 1435.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(231, 'B231', 'ICU', 'available', 809.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(232, 'B232', 'Emergency', 'available', 922.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(233, 'B233', 'Male Ward', 'available', 1675.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(234, 'B234', 'Male Ward', 'available', 687.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(235, 'B235', 'Cabin', 'available', 1764.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(236, 'B236', 'Emergency', 'available', 1455.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(237, 'B237', 'Female Ward', 'available', 572.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(238, 'B238', 'Male Ward', 'available', 1926.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(239, 'B239', 'Male Ward', 'available', 589.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(240, 'B240', 'Emergency', 'available', 1777.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(241, 'B241', 'Male Ward', 'available', 512.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(242, 'B242', 'Male Ward', 'available', 1219.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(243, 'B243', 'Emergency', 'available', 1069.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(244, 'B244', 'Cabin', 'available', 1451.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(245, 'B245', 'ICU', 'available', 1606.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(246, 'B246', 'Male Ward', 'available', 692.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(247, 'B247', 'Male Ward', 'available', 1155.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(248, 'B248', 'Male Ward', 'available', 1863.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(249, 'B249', 'Male Ward', 'available', 1603.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(250, 'B250', 'Female Ward', 'available', 716.00, '2026-01-02 05:53:36', '2026-01-02 05:53:36');

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
(1, 'Bangladesh Diabetic & Diagnostic Care ltd.', 'Dholibita, Dhamrai, Dhaka', 'info@bddcl.info', '01700000000', 'www.bddcl.info', '2025-12-01 04:00:59', '2025-12-01 04:00:59');

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
(1, 'Diabetes Mellitus', 'A metabolic disorder causing high blood sugar levels.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(2, 'Hypertension', 'High blood pressure condition.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(3, 'Asthma', 'A chronic lung disease causing breathing difficulty.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(4, 'Heart Disease', 'Conditions affecting the heart and blood vessels.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(5, 'Arthritis', 'Inflammation of the joints causing pain and stiffness.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(6, 'Migraine', 'Severe recurring headaches often with nausea.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(7, 'Tuberculosis', 'An infectious disease mainly affecting the lungs.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(8, 'Pneumonia', 'Infection that inflames the air sacs in one or both lungs.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(9, 'Covid-19', 'Respiratory illness caused by SARS-CoV-2 virus.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(10, 'Hepatitis B', 'A viral infection that affects the liver.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(11, 'Typhoid Fever', 'Bacterial infection caused by Salmonella typhi.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(12, 'Malaria', 'Mosquito-borne infectious disease affecting red blood cells.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(13, 'Dengue Fever', 'Viral infection spread by Aedes mosquitoes.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(14, 'Gastritis', 'Inflammation of the stomach lining.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(15, 'Ulcer', 'Open sores on the stomach or intestinal lining.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(16, 'Cancer', 'Abnormal cell growth that can spread to other parts of the body.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(17, 'Jaundice', 'Yellowing of the skin and eyes due to liver problems.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(18, 'Influenza', 'Common viral infection causing fever and sore throat.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(19, 'Kidney Stone', 'Hard deposits of minerals in the kidneys.', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(20, 'Anemia', 'Low red blood cell count causing fatigue.', '2026-01-02 05:53:36', '2026-01-02 05:53:36');

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
(16, 'Dr. John Smith', 'Cardiologist', '01710000001', 'john.smith@example.com', 1000.00, '2026-01-02 05:57:05', '2026-01-02 06:01:26'),
(17, 'Dr. Alice Johnson', 'Neurologist', '01710000002', 'alice.johnson@example.com', 800.00, '2026-01-02 05:57:05', '2026-01-02 05:57:05'),
(18, 'Dr. Robert Brown', 'Pediatrician', '01710000003', 'robert.brown@example.com', 500.00, '2026-01-02 05:57:05', '2026-01-02 05:57:05'),
(19, 'Dr. Emily Davis', 'Dermatologist', '01710000004', 'emily.davis@example.com', 1000.00, '2026-01-02 05:57:05', '2026-01-02 05:57:05'),
(20, 'Dr. Michael Wilson', 'Orthopedic', '01710000005', 'michael.wilson@example.com', 800.00, '2026-01-02 05:57:05', '2026-01-02 05:57:05'),
(21, 'Dr. Sophia Taylor', 'Gynecologist', '01710000006', 'sophia.taylor@example.com', 1000.00, '2026-01-02 05:57:05', '2026-01-02 05:57:05'),
(22, 'Dr. William Martinez', 'ENT Specialist', '01710000007', 'william.martinez@example.com', 1000.00, '2026-01-02 05:57:05', '2026-01-02 05:57:05'),
(23, 'Dr. Olivia Anderson', 'Oncologist', '01710000008', 'olivia.anderson@example.com', 800.00, '2026-01-02 05:57:05', '2026-01-02 05:57:05'),
(24, 'Dr. James Thomas', 'Radiologist', '01710000009', 'james.thomas@example.com', 700.00, '2026-01-02 05:57:05', '2026-01-02 05:57:05'),
(25, 'Dr. Isabella Jackson', 'Endocrinologist', '01710000010', 'isabella.jackson@example.com', 1500.00, '2026-01-02 05:57:05', '2026-01-02 05:57:05'),
(26, 'Dr. Benjamin White', 'Urologist', '01710000011', 'benjamin.white@example.com', 2000.00, '2026-01-02 05:57:05', '2026-01-02 05:57:05'),
(27, 'Dr. Mia Harris', 'Gastroenterologist', '01710000012', 'mia.harris@example.com', 850.00, '2026-01-02 05:57:05', '2026-01-02 05:57:05'),
(28, 'Dr. Daniel Clark', 'Pulmonologist', '01710000013', 'daniel.clark@example.com', 500.00, '2026-01-02 05:57:05', '2026-01-02 05:57:05'),
(29, 'Dr. Charlotte Lewis', 'Nephrologist', '01710000014', 'charlotte.lewis@example.com', 1000.00, '2026-01-02 05:57:05', '2026-01-02 05:57:05'),
(30, 'Dr. Matthew Lee', 'Ophthalmologist', '01710000015', 'matthew.lee@example.com', 1000.00, '2026-01-02 05:57:05', '2026-01-02 05:57:05');

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
(1, 'Dr. Ayesha Karim', 'Cardiology', '01710000001', 'ayesha@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(2, 'Dr. Rahat Hossain', 'Orthopedics', '01710000002', 'rahat@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(3, 'Dr. Tanvir Alam', 'Neurology', '01710000003', 'tanvir@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(4, 'Dr. Nusrat Jahan', 'Gynecology', '01710000004', 'nusrat@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(5, 'Dr. Mamun Rahman', 'Medicine', '01710000005', 'mamun@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(6, 'Dr. Farhana Ahmed', 'Dermatology', '01710000006', 'farhana@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(7, 'Dr. Shahidul Islam', 'ENT', '01710000007', 'shahidul@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(8, 'Dr. Sabrina Akter', 'Cardiology', '01710000008', 'sabrina@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(9, 'Dr. Tareq Hasan', 'Urology', '01710000009', 'tareq@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(10, 'Dr. Rafiq Mahmud', 'Medicine', '01710000010', 'rafiq@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(11, 'Dr. Mahiya Sultana', 'Gynecology', '01710000011', 'mahiya@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(12, 'Dr. Hasan Chowdhury', 'Orthopedics', '01710000012', 'hasan@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(13, 'Dr. Sumaiya Rahman', 'Dermatology', '01710000013', 'sumaiya@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(14, 'Dr. Arif Mahmud', 'Cardiology', '01710000014', 'arif@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(15, 'Dr. Nayeem Islam', 'ENT', '01710000015', 'nayeem@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(16, 'Dr. Rima Akter', 'Neurology', '01710000016', 'rima@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(17, 'Dr. Omar Faruk', 'Medicine', '01710000017', 'omar@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(18, 'Dr. Sadiya Hossain', 'Gynecology', '01710000018', 'sadiya@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(19, 'Dr. Kamrul Hasan', 'Cardiology', '01710000019', 'kamrul@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(20, 'Dr. Rashedul Islam', 'Urology', '01710000020', 'rashed@example.com', '2026-01-02 05:53:36', '2026-01-02 05:53:36');

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
(1, 'Salary', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(2, 'Utility', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(3, 'Maintenance', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(4, 'Academic', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(5, 'Transport', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(6, 'Event', '2026-01-02 05:53:37', '2026-01-02 05:53:37');

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
(1, 1, 'Teacher Salary', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(2, 1, 'Staff Salary', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(3, 1, 'Guest Teacher Salary', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(4, 2, 'Electricity Bill', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(5, 2, 'Water Bill', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(6, 2, 'Internet Bill', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(7, 3, 'Furniture Repair', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(8, 3, 'Building Repair', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(9, 3, 'Painting', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(10, 4, 'Books Purchase', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(11, 4, 'Lab Equipment', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(12, 4, 'Classroom Materials', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(13, 5, 'Bus Fuel', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(14, 5, 'Driver Salary', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(15, 5, 'Vehicle Repair', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(16, 6, 'Annual Program', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(17, 6, 'Sports Day', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(18, 6, 'Prize Giving Ceremony', '2026-01-02 05:53:37', '2026-01-02 05:53:37');

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
(1, 'Paracetamol', '2026-01-02 05:53:36', '2025-10-22 10:57:39'),
(2, 'Amoxicillin', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(3, 'Ibuprofen', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(4, 'Metformin', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(5, 'Ciprofloxacin', '2026-01-02 05:53:36', '2026-01-02 05:53:36');

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
(1, 'Tuition Fee', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(2, 'Donation', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(3, 'Library Fee', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(4, 'Transport Fee', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(5, 'Examination Fee', '2026-01-02 05:53:37', '2026-01-02 05:53:37');

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
(1, 1, 'Grade 1-5', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(2, 1, 'Grade 6-10', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(3, 1, 'Grade 11-12', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(4, 1, 'Pre-School', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(5, 2, 'Alumni Donation', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(6, 2, 'Sponsor Donation', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(7, 2, 'General Donation', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(8, 3, 'Book Fee', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(9, 3, 'Late Fee', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(10, 3, 'Library Membership Fee', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(11, 4, 'Bus Fee', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(12, 4, 'Van Fee', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(13, 4, 'Driver Allowance', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(14, 5, 'Monthly Test', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(15, 5, 'Final Exam', '2026-01-02 05:53:37', '2026-01-02 05:53:37'),
(16, 5, 'Practical Exam', '2026-01-02 05:53:37', '2026-01-02 05:53:37');

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
(1, 'Hematology', 'Blood related tests', '2026-01-02 05:53:34', '2026-01-02 05:53:34'),
(2, 'Biochemistry', 'Chemical analysis tests', '2026-01-02 05:53:34', '2026-01-02 05:53:34'),
(3, 'Microbiology', 'Bacteria and virus tests', '2026-01-02 05:53:34', '2026-01-02 05:53:34'),
(4, 'Immunology', 'Immune system tests', '2026-01-02 05:53:34', '2026-01-02 05:53:34');

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
(1, 'Routine', 'Routine tests', '2026-01-02 05:53:34', '2026-01-02 05:53:34'),
(2, 'Special', 'Special tests', '2026-01-02 05:53:34', '2026-01-02 05:53:34'),
(3, 'Emergency', 'Emergency tests', '2026-01-02 05:53:34', '2026-01-02 05:53:34');

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
(1, 'Blood', 'Venous blood sample', '2026-01-02 05:53:34', '2026-01-02 05:53:34'),
(2, 'Urine', 'Urine sample', '2026-01-02 05:53:34', '2026-01-02 05:53:34'),
(3, 'Saliva', 'Saliva sample', '2026-01-02 05:53:34', '2026-01-02 05:53:34'),
(4, 'Swab', 'Throat/nasal swab', '2026-01-02 05:53:34', '2026-01-02 05:53:34');

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
(1, 1, 'CBC', 'Complete Blood Count', '2026-01-02 05:53:34', '2026-01-02 05:53:34'),
(2, 1, 'ESR', 'Erythrocyte Sedimentation Rate', '2026-01-02 05:53:34', '2026-01-02 05:53:34'),
(3, 2, 'Liver Function Test', 'LFT panel', '2026-01-02 05:53:34', '2026-01-02 05:53:34'),
(4, 2, 'Kidney Function Test', 'KFT panel', '2026-01-02 05:53:34', '2026-01-02 05:53:34');

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
(1, 'CBC Test', 1, 1, 1, 2, 4165.00, 3897.00, 'Room 3', 'Molestiae iste qui voluptatum fugit aliquam magnam voluptates.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(2, 'Thyroid Function Test', 1, 4, 3, 1, 1478.00, 2636.00, 'Room 9', 'At dolorem et distinctio velit.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(3, 'Liver Function Test', 4, 3, 1, 2, 999.00, 4333.00, 'Room 6', 'Hic mollitia eligendi vel et vel.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(4, 'Kidney Function Test', 1, 2, 3, 3, 4570.00, 638.00, 'Room 1', 'Recusandae illum voluptas doloribus quo aliquid iusto voluptatum velit.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(5, 'Lipid Profile', 2, 3, 3, 3, 1611.00, 3119.00, 'Room 3', 'Rerum at vitae aut et dolorem quae.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(6, 'Blood Sugar Test', 2, 4, 4, 2, 4207.00, 4454.00, 'Room 3', 'Autem non quis possimus tempore aut.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(7, 'Urine Routine Test', 2, 4, 3, 1, 2336.00, 3616.00, 'Room 2', 'Dolorem ut corporis veritatis inventore.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(8, 'Electrolyte Test', 3, 1, 1, 2, 4013.00, 2313.00, 'Room 6', 'Ipsum est qui enim.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(9, 'Pulmonary Function Test', 4, 3, 4, 2, 3543.00, 645.00, 'Room 6', 'A officia qui qui.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(10, 'ECG Test', 1, 4, 4, 3, 3964.00, 2660.00, 'Room 8', 'Ut ut pariatur possimus et tempore quis repudiandae.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(11, 'Eye Test', 4, 4, 2, 1, 1923.00, 1492.00, 'Room 6', 'Est saepe pariatur earum qui reiciendis aperiam.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(12, 'Brain MRI', 2, 2, 3, 2, 2173.00, 4164.00, 'Room 2', 'Autem placeat accusamus sed accusantium ut et.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(13, 'Cardiac Enzyme Test', 4, 4, 1, 1, 1906.00, 3657.00, 'Room 8', 'Architecto inventore error ab nihil sint delectus odit.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(14, 'Dengue Test', 1, 2, 3, 1, 4061.00, 4447.00, 'Room 10', 'Odit ipsum dolorum beatae molestiae.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(15, 'Malaria Test', 1, 3, 3, 2, 2460.00, 3122.00, 'Room 3', 'Laudantium quo voluptas iste error quae rerum quis.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(16, 'Vitamin D Test', 2, 4, 1, 1, 2609.00, 3295.00, 'Room 2', 'Laborum illum doloremque dolorem autem excepturi.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(17, 'Vitamin B12 Test', 3, 4, 2, 3, 4393.00, 2040.00, 'Room 1', 'Porro unde et rerum magni totam nesciunt voluptatibus aut.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(18, 'Iron Test', 1, 2, 2, 3, 2446.00, 308.00, 'Room 4', 'Corrupti quae qui veritatis corporis.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(19, 'Ferritin Test', 2, 3, 2, 2, 3940.00, 3023.00, 'Room 1', 'Quibusdam ad quisquam quibusdam ut rerum.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(20, 'Uric Acid Test', 1, 2, 3, 2, 4526.00, 1839.00, 'Room 10', 'Autem et repellendus non similique vel inventore delectus.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(21, 'ESR Test', 2, 4, 4, 2, 4630.00, 866.00, 'Room 6', 'Et iure accusamus eum aspernatur iure.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(22, 'RBC Count Test', 3, 4, 1, 1, 1011.00, 2088.00, 'Room 8', 'Debitis natus fuga quia magni.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(23, 'PCV Test', 3, 4, 1, 3, 545.00, 1056.00, 'Room 10', 'Et a voluptas cupiditate doloremque.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(24, 'MCH Test', 1, 2, 2, 2, 4956.00, 3200.00, 'Room 7', 'Veritatis occaecati non voluptate facere ab.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(25, 'MCHC Test', 1, 1, 1, 1, 4816.00, 1766.00, 'Room 6', 'A qui consequatur voluptas.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(26, 'RDW Test', 3, 1, 1, 1, 3371.00, 976.00, 'Room 8', 'Molestiae similique architecto inventore aut possimus hic ut vel.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(27, 'Neutrophils Test', 4, 1, 3, 2, 1829.00, 1678.00, 'Room 6', 'Ab praesentium occaecati molestias nihil aut.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(28, 'Lymphocytes Test', 3, 3, 3, 3, 2637.00, 2230.00, 'Room 4', 'Temporibus modi odio animi.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(29, 'Monocytes Test', 4, 2, 1, 2, 2574.00, 1320.00, 'Room 6', 'Eaque vero omnis neque sunt.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(30, 'Eosinophils Test', 1, 4, 4, 2, 2881.00, 824.00, 'Room 8', 'Cupiditate nobis dignissimos perspiciatis aliquid quam.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(31, 'Basophils Test', 3, 4, 2, 2, 1673.00, 2388.00, 'Room 8', 'Distinctio dignissimos officiis deleniti eius.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(32, 'Prothrombin Time Test', 1, 4, 2, 1, 4122.00, 3157.00, 'Room 2', 'Cupiditate sint quia nihil maxime dolores harum ipsum.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(33, 'INR Test', 3, 2, 4, 1, 2694.00, 3504.00, 'Room 1', 'Totam necessitatibus consequatur est aut.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(34, 'aPTT Test', 3, 4, 3, 1, 4649.00, 2655.00, 'Room 10', 'Eum iusto sit facere soluta eum voluptatem molestiae ut.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(35, 'HIV 1 & 2 Test', 1, 1, 3, 1, 2214.00, 3381.00, 'Room 9', 'Iusto tempora repellat repudiandae quisquam nobis.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(36, 'HCV Antibody Test', 3, 2, 1, 3, 4925.00, 1875.00, 'Room 9', 'Aliquam ab eligendi quibusdam maiores.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(37, 'HbA1c Test', 2, 3, 4, 1, 2336.00, 3837.00, 'Room 8', 'Ipsam culpa saepe porro iusto molestias qui natus.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(38, 'Blood Group Test', 3, 2, 1, 1, 1022.00, 1548.00, 'Room 8', 'Ex et earum autem harum sed et repudiandae.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(39, 'Pregnancy Test', 3, 4, 4, 2, 4946.00, 2272.00, 'Room 3', 'Hic rerum impedit est voluptatibus quaerat delectus.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(40, 'Stool Occult Blood Test', 2, 3, 1, 3, 1795.00, 1932.00, 'Room 1', 'Eos sit quaerat eos at dolor voluptatem aut.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(41, 'Amylase Test', 4, 2, 4, 3, 4327.00, 3485.00, 'Room 3', 'Omnis inventore veniam facere.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(42, 'Lipase Test', 2, 1, 4, 3, 1218.00, 1441.00, 'Room 2', 'Tenetur voluptas eum corporis sed rerum quia dolor.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(43, 'LDH Test', 2, 4, 3, 1, 4506.00, 4445.00, 'Room 1', 'Vitae ullam enim qui minus commodi.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(44, 'GGT Test', 1, 3, 3, 2, 2693.00, 1619.00, 'Room 6', 'Illo odit quisquam et reprehenderit et qui.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(45, 'Phosphorus Test', 3, 3, 3, 3, 2258.00, 2577.00, 'Room 8', 'At labore tempore aliquid eaque eos neque nisi.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(46, 'Magnesium Test', 2, 1, 4, 1, 3896.00, 3436.00, 'Room 7', 'Dolorum ipsam beatae architecto similique vitae voluptas.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(47, 'Zinc Test', 3, 1, 4, 3, 4239.00, 1819.00, 'Room 4', 'Iste nihil odit quaerat ut in consequatur excepturi maxime.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(48, 'Copper Test', 2, 3, 3, 1, 801.00, 2025.00, 'Room 2', 'Sed ducimus ipsa ab voluptates molestiae quis magni.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(49, 'Insulin (Fasting) Test', 2, 3, 2, 1, 4130.00, 2004.00, 'Room 7', 'Ad vel aspernatur voluptate.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35'),
(50, 'Cortisol (Morning) Test', 2, 1, 1, 3, 4560.00, 635.00, 'Room 2', 'Nihil omnis facilis eos.', 1, '2026-01-02 05:53:35', '2026-01-02 05:53:35');

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
(81, '2014_10_12_000000_create_users_table', 2),
(82, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(83, '2014_10_12_100000_create_password_resets_table', 2),
(84, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(85, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(86, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(87, '2016_06_01_000004_create_oauth_clients_table', 2),
(88, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(89, '2019_08_19_000000_create_failed_jobs_table', 2),
(90, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(91, '2025_10_16_060305_create_doctors_table', 2),
(92, '2025_10_16_060344_create_lab_materials_table', 2),
(93, '2025_10_16_062212_create_lab_categories_table', 2),
(94, '2025_10_16_062212_create_lab_groups_table', 2),
(95, '2025_10_16_062212_create_lab_specimens_table', 2),
(96, '2025_10_16_062212_create_lab_subcategories_table', 2),
(97, '2025_10_16_064353_create_lab_tests_table', 2),
(98, '2025_10_16_065015_create_admins_table', 2),
(99, '2025_10_16_065016_create_store_tests_table', 2),
(100, '2025_10_16_085053_create_references_table', 2),
(101, '2025_10_16_124831_create_payment_details_table', 2),
(102, '2025_10_17_044528_create_companies_table', 2),
(103, '2025_10_17_154807_create_beds_table', 2),
(104, '2025_10_17_162645_create_duty_doctors_table', 2),
(105, '2025_10_17_163136_create_diseases_table', 2),
(106, '2025_10_18_113032_create_admission_patients_table', 2),
(107, '2025_10_18_181954_create_admission_bill_summaries_table', 2),
(108, '2025_10_20_153826_create_test_report_details_table', 2),
(109, '2025_10_21_103401_create_patient_test_reports_table', 2),
(110, '2025_10_21_143623_create_units_table', 2),
(111, '2025_10_21_143701_create_generics_table', 2),
(112, '2025_10_21_143740_create_presentations_table', 2),
(113, '2025_10_21_143850_create_reagents_table', 2),
(114, '2025_10_23_114129_create_reagent_stocks_table', 2),
(115, '2025_10_23_115839_create_reagent_test_table', 2),
(116, '2025_12_29_105054_create_expenses_categories_table', 2),
(117, '2025_12_29_105102_create_expenses_sub_categories_table', 2),
(118, '2025_12_29_105112_create_expenses_details_table', 2),
(119, '2025_12_29_150117_create_income_categories_table', 2),
(120, '2025_12_29_150138_create_income_sub_categories_table', 2),
(121, '2025_12_29_150655_create_incomes_table', 2),
(122, '2026_01_01_114435_create_bank_details_table', 2),
(123, '2026_01_01_114446_create_bank_transection_details_table', 2),
(125, '2026_01_02_121227_create_ticket_sales_table', 3);

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
(1, 'Tablet', '2026-01-02 05:53:36', '2025-10-22 11:00:20'),
(2, 'Capsule', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(3, 'Syrup', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(4, 'Injection', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(5, 'Powder', '2026-01-02 05:53:36', '2026-01-02 05:53:36');

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
(1, 'Acetone', 1, 1, 1, 391.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(2, 'Alcohol', 1, 1, 1, 165.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(3, 'Ammonia', 1, 1, 1, 182.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(4, 'Benzene', 1, 1, 1, 66.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(5, 'Calcium Chloride', 1, 1, 1, 98.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(6, 'Chloroform', 1, 1, 1, 166.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(7, 'Citric Acid', 1, 1, 1, 480.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(8, 'Copper Sulphate', 1, 1, 1, 192.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(9, 'Formaldehyde', 1, 1, 1, 311.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(10, 'Glucose', 1, 1, 1, 238.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(11, 'Glycerol', 1, 1, 1, 479.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(12, 'Hydrochloric Acid', 1, 1, 1, 292.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(13, 'Hydrogen Peroxide', 1, 1, 1, 485.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(14, 'Iodine', 1, 1, 1, 69.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(15, 'Iron Sulphate', 1, 1, 1, 56.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(16, 'Magnesium Sulphate', 1, 1, 1, 299.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(17, 'Methanol', 1, 1, 1, 141.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(18, 'Nitric Acid', 1, 1, 1, 136.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(19, 'Phenol', 1, 1, 1, 500.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(20, 'Potassium Chloride', 1, 1, 1, 94.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(21, 'Potassium Hydroxide', 1, 1, 1, 131.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(22, 'Sodium Bicarbonate', 1, 1, 1, 166.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(23, 'Sodium Carbonate', 1, 1, 1, 435.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(24, 'Sodium Chloride', 1, 1, 1, 164.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(25, 'Sodium Hydroxide', 1, 1, 1, 193.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(26, 'Sulfuric Acid', 1, 1, 1, 327.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(27, 'Toluene', 1, 1, 1, 384.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(28, 'Urea', 1, 1, 1, 113.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(29, 'Zinc Sulphate', 1, 1, 1, 238.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(30, 'Sodium Nitrate', 1, 1, 1, 495.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(31, 'Ammonium Chloride', 1, 1, 1, 130.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(32, 'Barium Sulphate', 1, 1, 1, 467.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(33, 'Ethyl Acetate', 1, 1, 1, 60.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(34, 'Formic Acid', 1, 1, 1, 99.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(35, 'Hydrazine', 1, 1, 1, 312.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(36, 'Lithium Carbonate', 1, 1, 1, 456.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(37, 'Magnesium Hydroxide', 1, 1, 1, 479.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(38, 'Manganese Sulphate', 1, 1, 1, 422.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(39, 'Nickel Sulphate', 1, 1, 1, 434.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(40, 'Phenolphthalein', 1, 1, 1, 104.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(41, 'Potassium Bromide', 1, 1, 1, 113.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(42, 'Silver Nitrate', 1, 1, 1, 247.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(43, 'Sodium Sulphate', 1, 1, 1, 408.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(44, 'Sulfur', 1, 1, 1, 298.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(45, 'Thymol', 1, 1, 1, 99.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(46, 'Triethanolamine', 1, 1, 1, 116.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(47, 'Xylene', 1, 1, 1, 71.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(48, 'Zinc Chloride', 1, 1, 1, 374.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(49, 'Aluminium Sulphate', 1, 1, 1, 225.00, 50, '2026-01-02 05:53:36', '2026-01-02 05:53:36');

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
(16, 'Mr. John Smith', 'Consultant', 'john@example.com', '01710000001', 1, '2026-01-02 05:57:17', '2026-01-02 05:57:17'),
(17, 'Ms. Alice Johnson', 'Lab Manager', 'alice@example.com', '01710000002', 1, '2026-01-02 05:57:17', '2026-01-02 05:57:17'),
(18, 'Dr. Robert Brown', 'Physician', 'robert@example.com', '01710000003', 1, '2026-01-02 05:57:17', '2026-01-02 05:57:17'),
(19, 'Dr. Emily Davis', 'Surgeon', 'emily@example.com', '01710000004', 1, '2026-01-02 05:57:17', '2026-01-02 05:57:17'),
(20, 'Mr. Michael Wilson', 'Technician', 'michael@example.com', '01710000005', 1, '2026-01-02 05:57:17', '2026-01-02 05:57:17'),
(21, 'Ms. Sophia Taylor', 'Nurse', 'sophia@example.com', '01710000006', 1, '2026-01-02 05:57:17', '2026-01-02 05:57:17'),
(22, 'Dr. William Martinez', 'Radiologist', 'william@example.com', '01710000007', 1, '2026-01-02 05:57:17', '2026-01-02 05:57:17'),
(23, 'Dr. Olivia Anderson', 'Oncologist', 'olivia@example.com', '01710000008', 1, '2026-01-02 05:57:17', '2026-01-02 05:57:17'),
(24, 'Dr. James Thomas', 'Endocrinologist', 'james@example.com', '01710000009', 1, '2026-01-02 05:57:17', '2026-01-02 05:57:17'),
(25, 'Dr. Isabella Jackson', 'Pediatrician', 'isabella@example.com', '01710000010', 1, '2026-01-02 05:57:17', '2026-01-02 05:57:17'),
(26, 'Dr. Benjamin White', 'Cardiologist', 'benjamin@example.com', '01710000011', 1, '2026-01-02 05:57:17', '2026-01-02 05:57:17'),
(27, 'Dr. Mia Harris', 'Neurologist', 'mia@example.com', '01710000012', 1, '2026-01-02 05:57:17', '2026-01-02 05:57:17'),
(28, 'Dr. Daniel Clark', 'Orthopedic', 'daniel@example.com', '01710000013', 1, '2026-01-02 05:57:17', '2026-01-02 05:57:17'),
(29, 'Dr. Charlotte Lewis', 'Dermatologist', 'charlotte@example.com', '01710000014', 1, '2026-01-02 05:57:17', '2026-01-02 05:57:17'),
(30, 'Dr. Matthew Lee', 'Ophthalmologist', 'matthew@example.com', '01710000015', 1, '2026-01-02 05:57:17', '2026-01-02 05:57:17');

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

--
-- Dumping data for table `ticket_sales`
--

INSERT INTO `ticket_sales` (`id`, `reg`, `date`, `name`, `dob`, `gender`, `phone`, `address`, `doctor_id`, `refer_id`, `total`, `discount`, `payable`, `pay`, `duestatus`, `due`, `return`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'IYAILUGX7UGS', '2026-01-03', 'Shamim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 19, 26, 1000.00, 0.00, 1000.00, 1000.00, 1, 0.00, 0.00, 1, 1, '2026-01-03 04:51:40', '2026-01-03 04:51:40'),
(2, 'GXTUVZWYKMXZ', '2026-01-03', 'Fahim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 17, 25, 800.00, 0.00, 800.00, 1000.00, 1, 0.00, 200.00, 1, 1, '2026-01-03 04:52:07', '2026-01-03 04:52:07'),
(3, '6KFGBBTWS58M', '2026-01-03', 'Sojib Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 25, 20, 1500.00, 100.00, 1400.00, 2000.00, 1, 0.00, 600.00, 1, 1, '2026-01-03 05:23:35', '2026-01-03 05:23:35'),
(4, 'J7VJ0T67JTG9', '2026-01-03', 'Sabbir Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 28, 30, 500.00, 0.00, 500.00, 200.00, 0, 300.00, 0.00, 1, 1, '2026-01-03 06:02:38', '2026-01-03 06:02:38');

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
(1, 'mg', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(2, 'ml', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(3, 'g', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(4, 'L', '2026-01-02 05:53:36', '2025-10-22 10:52:17'),
(5, 'tablet', '2026-01-02 05:53:36', '2026-01-02 05:53:36'),
(6, 'capsule', '2026-01-02 05:53:36', '2026-01-02 05:53:36');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `store_tests`
--
ALTER TABLE `store_tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `test_report_details`
--
ALTER TABLE `test_report_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `ticket_sales`
--
ALTER TABLE `ticket_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
