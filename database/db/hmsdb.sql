-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 29, 2025 at 12:16 PM
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
(1, 'SAMIM Hossain', 'samim@gmail.com', '$2y$12$MCADF4zAqdJJ4EDlDG4MTuIivOTeDvdW2Tr7tACjjX1xFi3KtJCam', 'admin', NULL, NULL, NULL, '2025-12-29 04:47:34', '127.0.0.1', 'HDUuEwQx6Xfz9j9MyGgKT7okpDPYK3jqx4XnhtCc9nStecFnsn0gmhC3v7tM', NULL, '2025-12-29 04:47:34'),
(2, 'Akib Hossain', 'akib@gmail.com', '$2y$12$XpSO9YALOs7vC.N5uXb.0OJyd5V2kBcnMpM/qUQvWDjF33mPFKsru', 'Admin', NULL, NULL, NULL, NULL, NULL, 'jSPfQ1rBQIGa5n2chjx2mtXfGWlwyl3Srsg5dd0wAxdUNgo6hlrPSyGGok20', '2025-10-25 12:00:59', '2025-10-25 12:00:59'),
(3, 'Akib Hossain', 'akib2@gmail.com', '$2y$12$nk8MgzG7.Ggnnclyokz0v.V0uEFjK05mJbq75MfBQv0LnSuwMhRKO', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-25 12:14:41', '2025-10-25 12:14:41');

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
(1, 'B001', 'ICU', 'available', 1744.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(2, 'B002', 'Female Ward', 'available', 690.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(3, 'B003', 'ICU', 'available', 657.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(4, 'B004', 'Cabin', 'available', 1349.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(5, 'B005', 'Emergency', 'available', 841.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(6, 'B006', 'Male Ward', 'available', 1576.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(7, 'B007', 'Cabin', 'available', 637.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(8, 'B008', 'ICU', 'available', 1658.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(9, 'B009', 'ICU', 'available', 842.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(10, 'B010', 'Male Ward', 'available', 1240.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(11, 'B011', 'Emergency', 'available', 1610.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(12, 'B012', 'Cabin', 'available', 1762.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(13, 'B013', 'ICU', 'available', 1739.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(14, 'B014', 'Cabin', 'available', 1626.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(15, 'B015', 'Male Ward', 'available', 874.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(16, 'B016', 'ICU', 'available', 1294.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(17, 'B017', 'Cabin', 'available', 1997.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(18, 'B018', 'Emergency', 'available', 1803.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(19, 'B019', 'Male Ward', 'available', 1043.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(20, 'B020', 'Female Ward', 'available', 842.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(21, 'B021', 'Male Ward', 'available', 535.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(22, 'B022', 'Emergency', 'available', 1981.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(23, 'B023', 'Cabin', 'available', 734.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(24, 'B024', 'ICU', 'available', 1825.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(25, 'B025', 'Male Ward', 'available', 617.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(26, 'B026', 'Cabin', 'available', 569.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(27, 'B027', 'Cabin', 'available', 849.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(28, 'B028', 'Male Ward', 'available', 1691.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(29, 'B029', 'Male Ward', 'available', 1787.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(30, 'B030', 'Cabin', 'available', 1448.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(31, 'B031', 'Male Ward', 'available', 1650.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(32, 'B032', 'Male Ward', 'available', 1715.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(33, 'B033', 'ICU', 'available', 1146.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(34, 'B034', 'ICU', 'available', 998.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(35, 'B035', 'Cabin', 'available', 1464.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(36, 'B036', 'Male Ward', 'available', 626.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(37, 'B037', 'Emergency', 'available', 1547.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(38, 'B038', 'Female Ward', 'available', 1823.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(39, 'B039', 'Female Ward', 'available', 684.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(40, 'B040', 'Cabin', 'available', 1234.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(41, 'B041', 'Cabin', 'available', 1925.00, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(42, 'B042', 'Emergency', 'available', 1250.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(43, 'B043', 'ICU', 'available', 701.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(44, 'B044', 'Female Ward', 'available', 637.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(45, 'B045', 'Female Ward', 'available', 1061.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(46, 'B046', 'Cabin', 'available', 1765.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(47, 'B047', 'Male Ward', 'available', 1021.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(48, 'B048', 'Female Ward', 'available', 1062.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(49, 'B049', 'Cabin', 'available', 1830.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(50, 'B050', 'Emergency', 'available', 1321.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(51, 'B051', 'Female Ward', 'available', 918.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(52, 'B052', 'Male Ward', 'available', 933.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(53, 'B053', 'Female Ward', 'available', 1649.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(54, 'B054', 'Male Ward', 'available', 1237.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(55, 'B055', 'ICU', 'available', 1690.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(56, 'B056', 'Female Ward', 'available', 1926.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(57, 'B057', 'ICU', 'available', 765.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(58, 'B058', 'Female Ward', 'available', 697.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(59, 'B059', 'Emergency', 'available', 1314.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(60, 'B060', 'Male Ward', 'available', 1338.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(61, 'B061', 'Cabin', 'available', 1858.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(62, 'B062', 'Cabin', 'available', 1448.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(63, 'B063', 'Male Ward', 'available', 958.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(64, 'B064', 'Male Ward', 'available', 569.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(65, 'B065', 'Female Ward', 'available', 1815.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(66, 'B066', 'ICU', 'available', 1778.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(67, 'B067', 'Cabin', 'available', 813.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(68, 'B068', 'Female Ward', 'available', 1418.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(69, 'B069', 'ICU', 'available', 616.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(70, 'B070', 'ICU', 'available', 1991.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(71, 'B071', 'Emergency', 'available', 1099.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(72, 'B072', 'Cabin', 'available', 1615.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(73, 'B073', 'ICU', 'available', 869.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(74, 'B074', 'Cabin', 'available', 1486.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(75, 'B075', 'Emergency', 'available', 1516.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(76, 'B076', 'Cabin', 'available', 992.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(77, 'B077', 'Male Ward', 'available', 1054.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(78, 'B078', 'Cabin', 'available', 851.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(79, 'B079', 'Male Ward', 'available', 1204.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(80, 'B080', 'Cabin', 'available', 1864.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(81, 'B081', 'Male Ward', 'available', 1183.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(82, 'B082', 'Cabin', 'available', 1797.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(83, 'B083', 'Emergency', 'available', 1804.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(84, 'B084', 'Female Ward', 'available', 910.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(85, 'B085', 'Emergency', 'available', 1656.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(86, 'B086', 'Cabin', 'available', 939.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(87, 'B087', 'Cabin', 'available', 1083.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(88, 'B088', 'ICU', 'available', 1686.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(89, 'B089', 'ICU', 'available', 1969.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(90, 'B090', 'Cabin', 'available', 1836.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(91, 'B091', 'ICU', 'available', 963.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(92, 'B092', 'Cabin', 'available', 886.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(93, 'B093', 'Female Ward', 'available', 1471.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(94, 'B094', 'Emergency', 'available', 1504.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(95, 'B095', 'ICU', 'available', 993.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(96, 'B096', 'Female Ward', 'available', 1600.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(97, 'B097', 'Emergency', 'available', 1199.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(98, 'B098', 'Female Ward', 'available', 1050.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(99, 'B099', 'Male Ward', 'available', 579.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(100, 'B100', 'Male Ward', 'available', 1737.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(101, 'B101', 'Cabin', 'available', 934.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(102, 'B102', 'Male Ward', 'available', 1648.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(103, 'B103', 'Cabin', 'available', 1098.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(104, 'B104', 'ICU', 'available', 507.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(105, 'B105', 'Male Ward', 'available', 1499.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(106, 'B106', 'Emergency', 'available', 1681.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(107, 'B107', 'Cabin', 'available', 599.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(108, 'B108', 'Female Ward', 'available', 602.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(109, 'B109', 'ICU', 'available', 855.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(110, 'B110', 'Cabin', 'available', 881.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(111, 'B111', 'ICU', 'available', 623.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(112, 'B112', 'Cabin', 'available', 710.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(113, 'B113', 'Cabin', 'available', 511.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(114, 'B114', 'ICU', 'available', 1960.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(115, 'B115', 'Male Ward', 'available', 1665.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(116, 'B116', 'Female Ward', 'available', 522.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(117, 'B117', 'Male Ward', 'available', 988.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(118, 'B118', 'Female Ward', 'available', 1615.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(119, 'B119', 'Male Ward', 'available', 1123.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(120, 'B120', 'Female Ward', 'available', 1867.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(121, 'B121', 'ICU', 'available', 1048.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(122, 'B122', 'Female Ward', 'available', 1116.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(123, 'B123', 'Male Ward', 'available', 1297.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(124, 'B124', 'Cabin', 'available', 1163.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(125, 'B125', 'Emergency', 'available', 1589.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(126, 'B126', 'Male Ward', 'available', 1623.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(127, 'B127', 'Male Ward', 'available', 880.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(128, 'B128', 'Cabin', 'available', 1701.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(129, 'B129', 'Male Ward', 'available', 1503.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(130, 'B130', 'ICU', 'available', 1684.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(131, 'B131', 'Cabin', 'available', 1437.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(132, 'B132', 'Emergency', 'available', 842.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(133, 'B133', 'Emergency', 'available', 1311.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(134, 'B134', 'Female Ward', 'available', 637.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(135, 'B135', 'Male Ward', 'available', 592.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(136, 'B136', 'ICU', 'available', 1785.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(137, 'B137', 'Female Ward', 'available', 634.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(138, 'B138', 'Emergency', 'available', 1656.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(139, 'B139', 'Cabin', 'available', 1834.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(140, 'B140', 'Female Ward', 'available', 1440.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(141, 'B141', 'Cabin', 'available', 1821.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(142, 'B142', 'ICU', 'available', 1707.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(143, 'B143', 'Female Ward', 'available', 891.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(144, 'B144', 'Cabin', 'available', 1057.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(145, 'B145', 'ICU', 'available', 1454.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(146, 'B146', 'ICU', 'available', 767.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(147, 'B147', 'Male Ward', 'available', 1627.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(148, 'B148', 'Male Ward', 'available', 1518.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(149, 'B149', 'Female Ward', 'available', 1960.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(150, 'B150', 'Emergency', 'available', 1471.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(151, 'B151', 'Cabin', 'available', 580.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(152, 'B152', 'Emergency', 'available', 1233.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(153, 'B153', 'Cabin', 'available', 1319.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(154, 'B154', 'Female Ward', 'available', 1947.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(155, 'B155', 'Cabin', 'available', 1189.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(156, 'B156', 'Male Ward', 'available', 1646.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(157, 'B157', 'Male Ward', 'available', 1817.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(158, 'B158', 'Female Ward', 'available', 879.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(159, 'B159', 'Female Ward', 'available', 964.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(160, 'B160', 'Male Ward', 'available', 977.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(161, 'B161', 'Emergency', 'available', 1702.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(162, 'B162', 'Male Ward', 'available', 918.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(163, 'B163', 'ICU', 'available', 522.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(164, 'B164', 'Emergency', 'available', 1007.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(165, 'B165', 'Male Ward', 'available', 1295.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(166, 'B166', 'Cabin', 'available', 1086.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(167, 'B167', 'Cabin', 'available', 1022.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(168, 'B168', 'ICU', 'available', 736.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(169, 'B169', 'Emergency', 'available', 1436.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(170, 'B170', 'ICU', 'available', 763.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(171, 'B171', 'Female Ward', 'available', 1896.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(172, 'B172', 'ICU', 'available', 620.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(173, 'B173', 'ICU', 'available', 1395.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(174, 'B174', 'Cabin', 'available', 1623.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(175, 'B175', 'Male Ward', 'available', 1912.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(176, 'B176', 'Female Ward', 'available', 551.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(177, 'B177', 'Cabin', 'available', 1552.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(178, 'B178', 'Male Ward', 'available', 1452.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(179, 'B179', 'Male Ward', 'available', 1574.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(180, 'B180', 'ICU', 'available', 1719.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(181, 'B181', 'Female Ward', 'available', 1761.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(182, 'B182', 'Female Ward', 'available', 580.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(183, 'B183', 'Emergency', 'available', 838.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(184, 'B184', 'Female Ward', 'available', 603.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(185, 'B185', 'Male Ward', 'available', 529.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(186, 'B186', 'ICU', 'available', 1982.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(187, 'B187', 'Female Ward', 'available', 578.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(188, 'B188', 'Cabin', 'available', 1469.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(189, 'B189', 'Emergency', 'available', 1999.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(190, 'B190', 'Male Ward', 'available', 699.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(191, 'B191', 'Male Ward', 'available', 605.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(192, 'B192', 'Female Ward', 'available', 1803.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(193, 'B193', 'ICU', 'available', 697.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(194, 'B194', 'Male Ward', 'available', 1263.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(195, 'B195', 'Emergency', 'available', 613.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(196, 'B196', 'Male Ward', 'available', 616.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(197, 'B197', 'Emergency', 'available', 1350.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(198, 'B198', 'Cabin', 'available', 1674.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(199, 'B199', 'ICU', 'available', 1421.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(200, 'B200', 'Emergency', 'available', 1981.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(201, 'B201', 'Emergency', 'available', 915.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(202, 'B202', 'ICU', 'available', 1210.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(203, 'B203', 'ICU', 'available', 1447.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(204, 'B204', 'Cabin', 'available', 796.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(205, 'B205', 'Female Ward', 'available', 1231.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(206, 'B206', 'Cabin', 'available', 1578.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(207, 'B207', 'ICU', 'available', 1452.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(208, 'B208', 'Emergency', 'available', 855.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(209, 'B209', 'Male Ward', 'available', 1806.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(210, 'B210', 'Female Ward', 'available', 678.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(211, 'B211', 'ICU', 'available', 1797.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(212, 'B212', 'Female Ward', 'available', 1276.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(213, 'B213', 'Emergency', 'available', 1674.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(214, 'B214', 'Cabin', 'available', 1963.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(215, 'B215', 'Emergency', 'available', 1167.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(216, 'B216', 'Male Ward', 'available', 1412.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(217, 'B217', 'ICU', 'available', 968.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(218, 'B218', 'Cabin', 'available', 929.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(219, 'B219', 'ICU', 'available', 1220.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(220, 'B220', 'Male Ward', 'available', 1419.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(221, 'B221', 'Female Ward', 'available', 1728.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(222, 'B222', 'Male Ward', 'available', 1017.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(223, 'B223', 'Emergency', 'available', 529.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(224, 'B224', 'Cabin', 'available', 1019.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(225, 'B225', 'Male Ward', 'available', 1685.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(226, 'B226', 'Female Ward', 'available', 1828.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(227, 'B227', 'Cabin', 'available', 1553.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(228, 'B228', 'Cabin', 'available', 666.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(229, 'B229', 'Cabin', 'available', 1752.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(230, 'B230', 'Male Ward', 'available', 708.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(231, 'B231', 'Emergency', 'available', 1233.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(232, 'B232', 'Cabin', 'available', 1778.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(233, 'B233', 'Female Ward', 'available', 1447.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(234, 'B234', 'ICU', 'available', 1869.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(235, 'B235', 'Female Ward', 'available', 1966.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(236, 'B236', 'Female Ward', 'available', 628.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(237, 'B237', 'Emergency', 'available', 636.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(238, 'B238', 'Male Ward', 'available', 723.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(239, 'B239', 'Emergency', 'available', 511.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(240, 'B240', 'Male Ward', 'available', 1219.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(241, 'B241', 'Cabin', 'available', 923.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(242, 'B242', 'ICU', 'available', 1839.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(243, 'B243', 'ICU', 'available', 964.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(244, 'B244', 'Cabin', 'available', 1460.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(245, 'B245', 'Male Ward', 'available', 1510.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(246, 'B246', 'Male Ward', 'available', 1923.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(247, 'B247', 'Cabin', 'available', 1168.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(248, 'B248', 'Cabin', 'available', 686.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(249, 'B249', 'Emergency', 'available', 1978.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(250, 'B250', 'ICU', 'available', 1806.00, '2025-12-28 12:38:43', '2025-12-28 12:38:43');

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
(1, 'Bangladesh Diabetic & Diagnostic Care ltd.', 'Dholibita, Dhamrai, Dhaka', 'info@bddcl.info', '01700000000', 'www.bddcl.info', '2025-12-01 10:00:59', '2025-12-01 10:00:59');

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
(1, 'Diabetes Mellitus', 'A metabolic disorder causing high blood sugar levels.', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(2, 'Hypertension', 'High blood pressure condition.', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(3, 'Asthma', 'A chronic lung disease causing breathing difficulty.', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(4, 'Heart Disease', 'Conditions affecting the heart and blood vessels.', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(5, 'Arthritis', 'Inflammation of the joints causing pain and stiffness.', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(6, 'Migraine', 'Severe recurring headaches often with nausea.', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(7, 'Tuberculosis', 'An infectious disease mainly affecting the lungs.', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(8, 'Pneumonia', 'Infection that inflames the air sacs in one or both lungs.', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(9, 'Covid-19', 'Respiratory illness caused by SARS-CoV-2 virus.', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(10, 'Hepatitis B', 'A viral infection that affects the liver.', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(11, 'Typhoid Fever', 'Bacterial infection caused by Salmonella typhi.', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(12, 'Malaria', 'Mosquito-borne infectious disease affecting red blood cells.', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(13, 'Dengue Fever', 'Viral infection spread by Aedes mosquitoes.', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(14, 'Gastritis', 'Inflammation of the stomach lining.', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(15, 'Ulcer', 'Open sores on the stomach or intestinal lining.', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(16, 'Cancer', 'Abnormal cell growth that can spread to other parts of the body.', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(17, 'Jaundice', 'Yellowing of the skin and eyes due to liver problems.', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(18, 'Influenza', 'Common viral infection causing fever and sore throat.', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(19, 'Kidney Stone', 'Hard deposits of minerals in the kidneys.', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(20, 'Anemia', 'Low red blood cell count causing fatigue.', '2025-12-28 12:38:44', '2025-12-28 12:38:44');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `specialization`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Dr. John Smith', 'Cardiologist', '01710000001', 'john.smith@example.com', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(2, 'Dr. Alice Johnson', 'Neurologist', '01710000002', 'alice.johnson@example.com', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(3, 'Dr. Robert Brown', 'Pediatrician', '01710000003', 'robert.brown@example.com', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(4, 'Dr. Emily Davis', 'Dermatologist', '01710000004', 'emily.davis@example.com', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(5, 'Dr. Michael Wilson', 'Orthopedic', '01710000005', 'michael.wilson@example.com', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(6, 'Dr. Sophia Taylor', 'Gynecologist', '01710000006', 'sophia.taylor@example.com', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(7, 'Dr. William Martinez', 'ENT Specialist', '01710000007', 'william.martinez@example.com', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(8, 'Dr. Olivia Anderson', 'Oncologist', '01710000008', 'olivia.anderson@example.com', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(9, 'Dr. James Thomas', 'Radiologist', '01710000009', 'james.thomas@example.com', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(10, 'Dr. Isabella Jackson', 'Endocrinologist', '01710000010', 'isabella.jackson@example.com', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(11, 'Dr. Benjamin White', 'Urologist', '01710000011', 'benjamin.white@example.com', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(12, 'Dr. Mia Harris', 'Gastroenterologist', '01710000012', 'mia.harris@example.com', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(13, 'Dr. Daniel Clark', 'Pulmonologist', '01710000013', 'daniel.clark@example.com', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(14, 'Dr. Charlotte Lewis', 'Nephrologist', '01710000014', 'charlotte.lewis@example.com', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(15, 'Dr. Matthew Lee', 'Ophthalmologist', '01710000015', 'matthew.lee@example.com', '2025-12-28 12:38:42', '2025-12-28 12:38:42');

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
(1, 'Dr. Ayesha Karim', 'Cardiology', '01710000001', 'ayesha@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(2, 'Dr. Rahat Hossain', 'Orthopedics', '01710000002', 'rahat@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(3, 'Dr. Tanvir Alam', 'Neurology', '01710000003', 'tanvir@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(4, 'Dr. Nusrat Jahan', 'Gynecology', '01710000004', 'nusrat@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(5, 'Dr. Mamun Rahman', 'Medicine', '01710000005', 'mamun@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(6, 'Dr. Farhana Ahmed', 'Dermatology', '01710000006', 'farhana@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(7, 'Dr. Shahidul Islam', 'ENT', '01710000007', 'shahidul@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(8, 'Dr. Sabrina Akter', 'Cardiology', '01710000008', 'sabrina@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(9, 'Dr. Tareq Hasan', 'Urology', '01710000009', 'tareq@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(10, 'Dr. Rafiq Mahmud', 'Medicine', '01710000010', 'rafiq@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(11, 'Dr. Mahiya Sultana', 'Gynecology', '01710000011', 'mahiya@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(12, 'Dr. Hasan Chowdhury', 'Orthopedics', '01710000012', 'hasan@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(13, 'Dr. Sumaiya Rahman', 'Dermatology', '01710000013', 'sumaiya@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(14, 'Dr. Arif Mahmud', 'Cardiology', '01710000014', 'arif@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(15, 'Dr. Nayeem Islam', 'ENT', '01710000015', 'nayeem@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(16, 'Dr. Rima Akter', 'Neurology', '01710000016', 'rima@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(17, 'Dr. Omar Faruk', 'Medicine', '01710000017', 'omar@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(18, 'Dr. Sadiya Hossain', 'Gynecology', '01710000018', 'sadiya@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(19, 'Dr. Kamrul Hasan', 'Cardiology', '01710000019', 'kamrul@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43'),
(20, 'Dr. Rashedul Islam', 'Urology', '01710000020', 'rashed@example.com', '2025-12-28 12:38:43', '2025-12-28 12:38:43');

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
(1, 'Salary', '2025-12-29 05:07:25', '2025-12-29 05:07:25'),
(2, 'Utility', '2025-12-29 05:07:25', '2025-12-29 05:07:25'),
(3, 'Maintenance', '2025-12-29 05:07:25', '2025-12-29 05:07:25'),
(4, 'Academic', '2025-12-29 05:07:25', '2025-12-29 05:07:25'),
(5, 'Transport', '2025-12-29 05:07:25', '2025-12-29 05:07:25'),
(6, 'Event', '2025-12-29 05:07:25', '2025-12-29 05:07:25');

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

--
-- Dumping data for table `expenses_details`
--

INSERT INTO `expenses_details` (`id`, `category_id`, `sub_category_id`, `user_id`, `title`, `date`, `amount`, `remark`, `created_at`, `updated_at`) VALUES
(4, 1, 2, 1, 'Mumin December Salary', '2025-12-29', 15000.00, 'N/A', '2025-12-29 06:51:27', '2025-12-29 06:51:27'),
(5, 2, 5, 1, 'December 25 Water bill', '2025-12-29', 560.00, 'N/A', '2025-12-29 06:52:14', '2025-12-29 06:52:14');

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
(1, 1, 'Teacher Salary', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(2, 1, 'Staff Salary', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(3, 1, 'Guest Teacher Salary', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(4, 2, 'Electricity Bill', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(5, 2, 'Water Bill', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(6, 2, 'Internet Bill', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(7, 3, 'Furniture Repair', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(8, 3, 'Building Repair', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(9, 3, 'Painting', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(10, 4, 'Books Purchase', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(11, 4, 'Lab Equipment', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(12, 4, 'Classroom Materials', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(13, 5, 'Bus Fuel', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(14, 5, 'Driver Salary', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(15, 5, 'Vehicle Repair', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(16, 6, 'Annual Program', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(17, 6, 'Sports Day', '2025-12-29 05:07:34', '2025-12-29 05:07:34'),
(18, 6, 'Prize Giving Ceremony', '2025-12-29 05:07:34', '2025-12-29 05:07:34');

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
(1, 'Paracetamol', '2025-12-28 12:38:44', '2025-10-22 10:57:39'),
(2, 'Amoxicillin', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(3, 'Ibuprofen', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(4, 'Metformin', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(5, 'Ciprofloxacin', '2025-12-28 12:38:44', '2025-12-28 12:38:44');

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

--
-- Dumping data for table `incomes`
--

INSERT INTO `incomes` (`id`, `category_id`, `subcategory_id`, `user_id`, `title`, `description`, `amount`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 'Van', ' (Edited)', 1350.00, '2025-12-29', '2025-12-29 09:49:13', '2025-12-29 10:38:15'),
(2, 3, 9, 1, 'Late fee', 'N/A (Edited)', 1100.00, '2025-12-29', '2025-12-29 10:33:58', '2025-12-29 10:37:15');

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
(1, 'Tuition Fee', '2025-12-29 09:21:19', '2025-12-29 09:21:19'),
(2, 'Donation', '2025-12-29 09:21:19', '2025-12-29 09:21:19'),
(3, 'Library Fee', '2025-12-29 09:21:19', '2025-12-29 09:21:19'),
(4, 'Transport Fee', '2025-12-29 09:21:19', '2025-12-29 09:21:19'),
(5, 'Examination Fee', '2025-12-29 09:21:20', '2025-12-29 09:21:20'),
(6, 'xxx', '2025-12-29 10:54:55', '2025-12-29 10:58:31');

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
(1, 1, 'Grade 1-5', '2025-12-29 09:21:34', '2025-12-29 09:21:34'),
(2, 1, 'Grade 6-10', '2025-12-29 09:21:34', '2025-12-29 09:21:34'),
(3, 1, 'Grade 11-12', '2025-12-29 09:21:34', '2025-12-29 09:21:34'),
(4, 1, 'Pre-School', '2025-12-29 09:21:34', '2025-12-29 09:21:34'),
(5, 2, 'Alumni Donation', '2025-12-29 09:21:34', '2025-12-29 09:21:34'),
(6, 2, 'Sponsor Donation', '2025-12-29 09:21:34', '2025-12-29 09:21:34'),
(7, 2, 'General Donation', '2025-12-29 09:21:34', '2025-12-29 09:21:34'),
(8, 3, 'Book Fee', '2025-12-29 09:21:34', '2025-12-29 09:21:34'),
(9, 3, 'Late Fee', '2025-12-29 09:21:34', '2025-12-29 09:21:34'),
(10, 3, 'Library Membership Fee', '2025-12-29 09:21:34', '2025-12-29 09:21:34'),
(11, 4, 'Bus Fee', '2025-12-29 09:21:34', '2025-12-29 09:21:34'),
(12, 4, 'Van Fee', '2025-12-29 09:21:34', '2025-12-29 09:21:34'),
(13, 4, 'Driver Allowance', '2025-12-29 09:21:34', '2025-12-29 09:21:34'),
(14, 5, 'Monthly Test', '2025-12-29 09:21:34', '2025-12-29 09:21:34'),
(15, 5, 'Final Exam', '2025-12-29 09:21:34', '2025-12-29 09:21:34'),
(16, 5, 'Practical Exam', '2025-12-29 09:21:34', '2025-12-29 09:21:34'),
(17, 6, 'xxxxxxxxxxx', '2025-12-29 11:00:17', '2025-12-29 11:03:17');

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
(1, 'Hematology', 'Blood related tests', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(2, 'Biochemistry', 'Chemical analysis tests', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(3, 'Microbiology', 'Bacteria and virus tests', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(4, 'Immunology', 'Immune system tests', '2025-12-28 12:38:42', '2025-12-28 12:38:42');

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
(1, 'Routine', 'Routine tests', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(2, 'Special', 'Special tests', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(3, 'Emergency', 'Emergency tests', '2025-12-28 12:38:42', '2025-12-28 12:38:42');

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
(1, 'Blood', 'Venous blood sample', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(2, 'Urine', 'Urine sample', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(3, 'Saliva', 'Saliva sample', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(4, 'Swab', 'Throat/nasal swab', '2025-12-28 12:38:42', '2025-12-28 12:38:42');

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
(1, 1, 'CBC', 'Complete Blood Count', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(2, 1, 'ESR', 'Erythrocyte Sedimentation Rate', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(3, 2, 'Liver Function Test', 'LFT panel', '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(4, 2, 'Kidney Function Test', 'KFT panel', '2025-12-28 12:38:42', '2025-12-28 12:38:42');

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
(1, 'CBC Test', 1, 1, 4, 3, 1527.00, 1372.00, 'Room 6', 'Porro ut odio ipsam.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(2, 'Thyroid Function Test', 4, 1, 2, 2, 581.00, 3965.00, 'Room 10', 'Rerum ipsam inventore expedita eum fugiat assumenda.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(3, 'Liver Function Test', 2, 2, 1, 3, 2247.00, 1357.00, 'Room 8', 'Et quia nulla dolorem velit.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(4, 'Kidney Function Test', 2, 2, 2, 2, 4933.00, 1407.00, 'Room 3', 'Alias vero eveniet quia impedit officia.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(5, 'Lipid Profile', 3, 2, 2, 2, 2465.00, 1688.00, 'Room 5', 'Et unde tempora labore labore cum non aut.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(6, 'Blood Sugar Test', 3, 3, 2, 3, 3384.00, 2324.00, 'Room 10', 'Sint quia provident eos repellendus.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(7, 'Urine Routine Test', 3, 1, 1, 2, 3489.00, 1270.00, 'Room 9', 'Iste sint voluptas doloremque dolor.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(8, 'Electrolyte Test', 3, 3, 2, 2, 2863.00, 834.00, 'Room 6', 'Officia tenetur voluptas distinctio ex necessitatibus a error.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(9, 'Pulmonary Function Test', 4, 2, 3, 1, 4643.00, 2088.00, 'Room 7', 'Excepturi laborum quas aut laboriosam ut fuga.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(10, 'ECG Test', 4, 4, 2, 2, 1967.00, 1076.00, 'Room 8', 'Aliquam et sapiente dolorem corporis reprehenderit.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(11, 'Eye Test', 1, 4, 4, 1, 2871.00, 4400.00, 'Room 3', 'Non quisquam nulla sint accusantium.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(12, 'Brain MRI', 1, 2, 4, 2, 1098.00, 3430.00, 'Room 7', 'Sequi dolorum quibusdam hic et velit iusto.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(13, 'Cardiac Enzyme Test', 3, 3, 1, 2, 2601.00, 2822.00, 'Room 3', 'Minima debitis magnam quibusdam consectetur.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(14, 'Dengue Test', 2, 2, 2, 2, 2359.00, 1709.00, 'Room 2', 'Consequuntur iste totam aliquid.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(15, 'Malaria Test', 3, 1, 2, 3, 882.00, 1833.00, 'Room 7', 'Ullam voluptas culpa earum perspiciatis.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(16, 'Vitamin D Test', 4, 4, 4, 3, 1663.00, 3173.00, 'Room 8', 'Fugit reiciendis placeat autem officia assumenda ut asperiores.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(17, 'Vitamin B12 Test', 1, 4, 1, 1, 765.00, 3503.00, 'Room 8', 'Exercitationem adipisci consequatur odio.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(18, 'Iron Test', 3, 4, 3, 2, 4026.00, 1440.00, 'Room 8', 'Reprehenderit ad eligendi hic ullam odit quia neque unde.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(19, 'Ferritin Test', 4, 1, 3, 1, 2589.00, 709.00, 'Room 4', 'Esse aut consectetur dolorem vel et.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(20, 'Uric Acid Test', 3, 1, 2, 1, 3144.00, 335.00, 'Room 8', 'Alias unde eius ut ut.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(21, 'ESR Test', 2, 1, 2, 1, 780.00, 3893.00, 'Room 5', 'Repellat vel maiores ipsa quo consequatur.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(22, 'RBC Count Test', 4, 3, 4, 2, 1851.00, 750.00, 'Room 6', 'Ullam sint provident qui quo quidem minima impedit.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(23, 'PCV Test', 2, 1, 3, 3, 4284.00, 4343.00, 'Room 6', 'Deserunt facere voluptatem asperiores aut sunt numquam totam.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(24, 'MCH Test', 1, 1, 3, 1, 3190.00, 4083.00, 'Room 9', 'Sequi omnis perspiciatis odio modi sint optio.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(25, 'MCHC Test', 2, 3, 4, 1, 2685.00, 3741.00, 'Room 2', 'Consequuntur debitis sunt eligendi ut facilis necessitatibus deserunt aliquid.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(26, 'RDW Test', 2, 4, 4, 3, 3949.00, 2920.00, 'Room 4', 'Unde voluptate et et minima dignissimos soluta.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(27, 'Neutrophils Test', 2, 4, 3, 3, 828.00, 3752.00, 'Room 6', 'Laboriosam laudantium non asperiores necessitatibus officiis adipisci libero.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(28, 'Lymphocytes Test', 4, 3, 4, 1, 4113.00, 4314.00, 'Room 7', 'Totam dolore et quis autem temporibus fugit rerum.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(29, 'Monocytes Test', 2, 3, 1, 3, 1805.00, 1964.00, 'Room 3', 'Saepe qui repudiandae autem quo aut corrupti quibusdam ratione.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(30, 'Eosinophils Test', 2, 3, 3, 1, 685.00, 2492.00, 'Room 10', 'Sit magnam quae veniam minima qui ut adipisci.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(31, 'Basophils Test', 3, 1, 3, 2, 1947.00, 3964.00, 'Room 5', 'Est consequatur deleniti et neque similique.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(32, 'Prothrombin Time Test', 2, 3, 2, 2, 2562.00, 750.00, 'Room 8', 'Exercitationem eligendi velit aperiam reiciendis id fuga.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(33, 'INR Test', 4, 4, 1, 1, 2139.00, 1274.00, 'Room 2', 'Nesciunt sit quod nostrum eos eum temporibus.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(34, 'aPTT Test', 4, 1, 4, 3, 714.00, 4126.00, 'Room 5', 'Totam vero voluptatem voluptas enim.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(35, 'HIV 1 & 2 Test', 4, 3, 2, 1, 1469.00, 1865.00, 'Room 9', 'Dolore ut necessitatibus quibusdam quibusdam omnis harum eum.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(36, 'HCV Antibody Test', 1, 2, 2, 1, 3243.00, 1457.00, 'Room 6', 'Reprehenderit suscipit excepturi sed.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(37, 'HbA1c Test', 3, 3, 3, 2, 1984.00, 1002.00, 'Room 4', 'Id et vero animi sapiente facere quo blanditiis minima.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(38, 'Blood Group Test', 1, 1, 2, 3, 2403.00, 1515.00, 'Room 8', 'Hic labore consequuntur qui tempora.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(39, 'Pregnancy Test', 1, 4, 1, 3, 3003.00, 1503.00, 'Room 9', 'Nobis impedit occaecati recusandae deleniti eos.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(40, 'Stool Occult Blood Test', 1, 4, 2, 1, 3613.00, 536.00, 'Room 6', 'Debitis dolor voluptatem possimus sit culpa.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(41, 'Amylase Test', 1, 3, 3, 3, 3233.00, 932.00, 'Room 6', 'Magni est ea facere et ab ut.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(42, 'Lipase Test', 4, 1, 4, 2, 3962.00, 1075.00, 'Room 7', 'Sit ut labore omnis itaque aut tempore.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(43, 'LDH Test', 2, 1, 1, 1, 3339.00, 2901.00, 'Room 2', 'Ut fugiat est exercitationem necessitatibus accusamus quia sit.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(44, 'GGT Test', 4, 2, 1, 2, 2491.00, 3431.00, 'Room 6', 'Natus qui earum dolor.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(45, 'Phosphorus Test', 1, 2, 1, 1, 2748.00, 1201.00, 'Room 4', 'Nihil quis rerum facere sequi totam.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(46, 'Magnesium Test', 3, 1, 2, 2, 3930.00, 3459.00, 'Room 2', 'Corporis tenetur at qui voluptas temporibus tenetur.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(47, 'Zinc Test', 3, 1, 3, 2, 3730.00, 342.00, 'Room 4', 'Quaerat sed est distinctio ad aut non.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(48, 'Copper Test', 3, 2, 4, 1, 1764.00, 1500.00, 'Room 6', 'Quibusdam adipisci aut pariatur ut.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(49, 'Insulin (Fasting) Test', 2, 2, 2, 3, 3701.00, 2430.00, 'Room 4', 'Ducimus et voluptas quaerat iure inventore illum error.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(50, 'Cortisol (Morning) Test', 4, 4, 4, 3, 1234.00, 1709.00, 'Room 2', 'Ut quisquam nihil facilis unde voluptatem sequi.', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42');

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
(37, '2014_10_12_000000_create_users_table', 1),
(38, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(39, '2014_10_12_100000_create_password_resets_table', 1),
(40, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(41, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(42, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(43, '2016_06_01_000004_create_oauth_clients_table', 1),
(44, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(45, '2019_08_19_000000_create_failed_jobs_table', 1),
(46, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(47, '2025_10_16_060305_create_doctors_table', 1),
(48, '2025_10_16_060344_create_lab_materials_table', 1),
(49, '2025_10_16_061019_create_expenses_table', 1),
(50, '2025_10_16_062212_create_lab_categories_table', 1),
(51, '2025_10_16_062212_create_lab_groups_table', 1),
(52, '2025_10_16_062212_create_lab_specimens_table', 1),
(53, '2025_10_16_062212_create_lab_subcategories_table', 1),
(54, '2025_10_16_064353_create_lab_tests_table', 1),
(55, '2025_10_16_065015_create_admins_table', 1),
(56, '2025_10_16_065016_create_store_tests_table', 1),
(57, '2025_10_16_085053_create_references_table', 1),
(58, '2025_10_16_124831_create_payment_details_table', 1),
(59, '2025_10_17_044528_create_companies_table', 1),
(60, '2025_10_17_154807_create_beds_table', 1),
(61, '2025_10_17_162645_create_duty_doctors_table', 1),
(62, '2025_10_17_163136_create_diseases_table', 1),
(63, '2025_10_18_113032_create_admission_patients_table', 1),
(64, '2025_10_18_181954_create_admission_bill_summaries_table', 1),
(65, '2025_10_20_153826_create_test_report_details_table', 1),
(66, '2025_10_21_103401_create_patient_test_reports_table', 1),
(67, '2025_10_21_143623_create_units_table', 1),
(68, '2025_10_21_143701_create_generics_table', 1),
(69, '2025_10_21_143740_create_presentations_table', 1),
(70, '2025_10_21_143850_create_reagents_table', 1),
(71, '2025_10_23_114129_create_reagent_stocks_table', 1),
(72, '2025_10_23_115839_create_reagent_test_table', 1),
(73, '2025_12_29_105054_create_expenses_categories_table', 2),
(74, '2025_12_29_105102_create_expenses_sub_categories_table', 2),
(75, '2025_12_29_105112_create_expenses_details_table', 2),
(76, '2025_12_29_150117_create_income_categories_table', 3),
(77, '2025_12_29_150138_create_income_sub_categories_table', 3),
(78, '2025_12_29_150655_create_incomes_table', 3);

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

--
-- Dumping data for table `patient_test_reports`
--

INSERT INTO `patient_test_reports` (`id`, `reg`, `patient_id`, `test_id`, `part_of_test`, `result`, `unit`, `reference_value`, `ref_value_of_hormone`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 'LAB2025122811', 1, 1, 'Hemoglobin', '14.2', 'g/dL', '13.0 - 17.0', '10.5', 'N/A', '2025-12-28 12:39:26', '2025-12-28 13:05:07'),
(2, 'LAB2025122811', 1, 1, 'WBC Count', '6.5', '×10³/µL', '4.0 - 11.0', '8.87', NULL, '2025-12-28 12:39:26', '2025-12-28 13:05:32'),
(3, 'LAB2025122811', 1, 1, 'Platelet Count', '230', '×10³/µL', '150 - 400', NULL, NULL, '2025-12-28 12:39:26', '2025-12-28 12:39:26'),
(4, 'LAB2025122811', 1, 2, 'T3', '1.3', 'ng/mL', '0.8 - 2.0', 'Normal thyroid function', NULL, '2025-12-28 12:39:26', '2025-12-28 12:39:26'),
(5, 'LAB2025122811', 1, 2, 'T4', '8.2', 'µg/dL', '5.0 - 12.0', 'Normal thyroid function', NULL, '2025-12-28 12:39:26', '2025-12-28 12:39:26'),
(6, 'LAB2025122811', 1, 2, 'TSH', '2.7', 'µIU/mL', '0.4 - 4.0', 'Normal thyroid function', NULL, '2025-12-28 12:39:26', '2025-12-28 12:39:26'),
(7, 'LAB2025122811', 1, 3, 'SGPT (ALT)', '32', 'U/L', '0 - 45', '35', NULL, '2025-12-28 12:39:26', '2025-12-28 12:58:04'),
(8, 'LAB2025122811', 1, 3, 'SGOT (AST)', '28', 'U/L', '0 - 40', NULL, NULL, '2025-12-28 12:39:26', '2025-12-28 12:39:26'),
(9, 'LAB2025122811', 1, 3, 'Bilirubin Total', '0.8', 'mg/dL', '0.2 - 1.2', NULL, NULL, '2025-12-28 12:39:26', '2025-12-28 12:39:26'),
(10, 'LAB2025122811', 1, 4, 'Urea', '35', 'mg/dL', '15 - 45', NULL, NULL, '2025-12-28 12:39:26', '2025-12-28 12:39:26'),
(11, 'LAB2025122811', 1, 4, 'Creatinine', '1.1', 'mg/dL', '0.7 - 1.4', NULL, NULL, '2025-12-28 12:39:26', '2025-12-28 12:39:26'),
(12, 'LAB2025122811', 1, 5, 'Cholesterol Total', '180', 'mg/dL', '<200', NULL, NULL, '2025-12-28 12:39:26', '2025-12-28 12:39:26'),
(13, 'LAB2025122811', 1, 5, 'HDL', '52', 'mg/dL', '>40', NULL, NULL, '2025-12-28 12:39:26', '2025-12-28 12:39:26'),
(14, 'LAB2025122811', 1, 5, 'LDL', '110', 'mg/dL', '<130', NULL, NULL, '2025-12-28 12:39:26', '2025-12-28 12:39:26'),
(15, 'LAB2025122811', 1, 5, 'Triglycerides', '145', 'mg/dL', '<150', NULL, NULL, '2025-12-28 12:39:26', '2025-12-28 12:39:26'),
(16, 'LAB2025122812', 2, 6, 'Fasting Blood Sugar', '92', 'mg/dL', '70 - 100', '85', NULL, '2025-12-28 12:45:40', '2025-12-28 13:05:49'),
(17, 'LAB2025122812', 2, 6, 'Postprandial Blood Sugar', '128', 'mg/dL', '<140', NULL, NULL, '2025-12-28 12:45:40', '2025-12-28 12:45:40'),
(18, 'LAB2025122812', 2, 7, 'pH', '6.5', NULL, '4.5 - 8.0', NULL, NULL, '2025-12-28 12:45:40', '2025-12-28 12:45:40'),
(19, 'LAB2025122812', 2, 7, 'Protein', 'Negative', NULL, 'Negative', NULL, NULL, '2025-12-28 12:45:40', '2025-12-28 12:45:40'),
(20, 'LAB2025122812', 2, 7, 'Glucose', 'Negative', NULL, 'Negative', NULL, NULL, '2025-12-28 12:45:40', '2025-12-28 12:45:40'),
(21, 'LAB2025122812', 2, 8, 'Sodium', '138', 'mmol/L', '135 - 145', NULL, NULL, '2025-12-28 12:45:40', '2025-12-28 12:45:40'),
(22, 'LAB2025122812', 2, 8, 'Potassium', '4.2', 'mmol/L', '3.5 - 5.1', NULL, NULL, '2025-12-28 12:45:40', '2025-12-28 12:45:40'),
(23, 'LAB2025122812', 2, 8, 'Chloride', '103', 'mmol/L', '98 - 107', NULL, NULL, '2025-12-28 12:45:40', '2025-12-28 12:45:40'),
(24, 'LAB2025122812', 2, 9, 'FEV1', '3.5', 'L', '>2.5', NULL, NULL, '2025-12-28 12:45:40', '2025-12-28 12:45:40'),
(25, 'LAB2025122812', 2, 9, 'FVC', '4.2', 'L', '>3.0', NULL, NULL, '2025-12-28 12:45:40', '2025-12-28 12:45:40'),
(26, 'LAB2025122911', 3, 10, 'Heart Rate', '78', 'bpm', '60 - 100', NULL, NULL, '2025-12-29 04:48:20', '2025-12-29 04:48:20'),
(27, 'LAB2025122911', 3, 10, 'QRS Duration', '85', 'ms', '70 - 110', NULL, NULL, '2025-12-29 04:48:20', '2025-12-29 04:48:20'),
(28, 'LAB2025122911', 3, 11, 'Vision (Left)', '6/6', NULL, '6/6', NULL, NULL, '2025-12-29 04:48:20', '2025-12-29 04:48:20'),
(29, 'LAB2025122911', 3, 11, 'Vision (Right)', '6/6', NULL, '6/6', NULL, NULL, '2025-12-29 04:48:20', '2025-12-29 04:48:20'),
(30, 'LAB2025122911', 3, 12, 'Observation', 'Normal', NULL, 'Normal', NULL, NULL, '2025-12-29 04:48:20', '2025-12-29 04:48:20'),
(31, 'LAB2025122911', 3, 13, 'CK-MB', '20', 'U/L', '<25', NULL, NULL, '2025-12-29 04:48:20', '2025-12-29 04:48:20'),
(32, 'LAB2025122911', 3, 13, 'Troponin I', '0.01', 'ng/mL', '<0.04', NULL, NULL, '2025-12-29 04:48:20', '2025-12-29 04:48:20'),
(33, 'LAB2025122911', 3, 14, 'NS1 Antigen', 'Negative', NULL, 'Negative', NULL, NULL, '2025-12-29 04:48:20', '2025-12-29 04:48:20'),
(34, 'LAB2025122911', 3, 14, 'IgM Antibody', 'Negative', NULL, 'Negative', NULL, NULL, '2025-12-29 04:48:20', '2025-12-29 04:48:20'),
(35, 'LAB2025122911', 3, 15, 'Plasmodium Falciparum', 'Negative', NULL, 'Negative', NULL, NULL, '2025-12-29 04:48:20', '2025-12-29 04:48:20'),
(36, 'LAB2025122911', 3, 15, 'Plasmodium Vivax', 'Negative', NULL, 'Negative', NULL, NULL, '2025-12-29 04:48:20', '2025-12-29 04:48:20');

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
  `total` int(11) NOT NULL DEFAULT 0,
  `discount` int(11) NOT NULL DEFAULT 0,
  `payable` int(11) NOT NULL DEFAULT 0,
  `pay` int(11) NOT NULL DEFAULT 0,
  `duestatus` int(11) NOT NULL DEFAULT 0,
  `due` int(11) NOT NULL DEFAULT 0,
  `return` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`id`, `reg`, `date`, `name`, `dob`, `gender`, `phone`, `address`, `doctorId`, `referId`, `total`, `discount`, `payable`, `pay`, `duestatus`, `due`, `return`, `status`, `userId`, `created_at`, `updated_at`) VALUES
(1, 'LAB2025122811', '2025-12-28', 'Shamim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 8, 11, 11753, 0, 11753, 10000, 1, 1753, 0, 1, 1, '2025-12-28 12:39:21', '2025-12-28 12:39:21'),
(2, 'LAB2025122812', '2025-12-28', 'Fahim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 13, 11, 9288, 0, 9288, 9288, 0, 0, 0, 1, 1, '2025-12-28 12:45:35', '2025-12-28 12:45:35'),
(3, 'LAB2025122911', '2025-12-29', 'Rakib Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 7, 11, 17099, 2099, 15000, 15000, 0, 0, 0, 1, 1, '2025-12-29 04:48:11', '2025-12-29 04:48:11');

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
(1, 'Tablet', '2025-12-28 12:38:44', '2025-10-22 11:00:20'),
(2, 'Capsule', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(3, 'Syrup', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(4, 'Injection', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(5, 'Powder', '2025-12-28 12:38:44', '2025-12-28 12:38:44');

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
(1, 'Acetone', 1, 1, 1, 84.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(2, 'Alcohol', 1, 1, 1, 177.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(3, 'Ammonia', 1, 1, 1, 102.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(4, 'Benzene', 1, 1, 1, 372.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(5, 'Calcium Chloride', 1, 1, 1, 411.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(6, 'Chloroform', 1, 1, 1, 376.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(7, 'Citric Acid', 1, 1, 1, 245.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(8, 'Copper Sulphate', 1, 1, 1, 59.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(9, 'Formaldehyde', 1, 1, 1, 496.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(10, 'Glucose', 1, 1, 1, 345.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(11, 'Glycerol', 1, 1, 1, 388.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(12, 'Hydrochloric Acid', 1, 1, 1, 179.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(13, 'Hydrogen Peroxide', 1, 1, 1, 67.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(14, 'Iodine', 1, 1, 1, 281.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(15, 'Iron Sulphate', 1, 1, 1, 358.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(16, 'Magnesium Sulphate', 1, 1, 1, 154.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(17, 'Methanol', 1, 1, 1, 88.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(18, 'Nitric Acid', 1, 1, 1, 273.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(19, 'Phenol', 1, 1, 1, 139.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(20, 'Potassium Chloride', 1, 1, 1, 498.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(21, 'Potassium Hydroxide', 1, 1, 1, 289.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(22, 'Sodium Bicarbonate', 1, 1, 1, 166.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(23, 'Sodium Carbonate', 1, 1, 1, 130.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(24, 'Sodium Chloride', 1, 1, 1, 193.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(25, 'Sodium Hydroxide', 1, 1, 1, 228.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(26, 'Sulfuric Acid', 1, 1, 1, 188.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(27, 'Toluene', 1, 1, 1, 423.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(28, 'Urea', 1, 1, 1, 395.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(29, 'Zinc Sulphate', 1, 1, 1, 149.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(30, 'Sodium Nitrate', 1, 1, 1, 93.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(31, 'Ammonium Chloride', 1, 1, 1, 300.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(32, 'Barium Sulphate', 1, 1, 1, 340.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(33, 'Ethyl Acetate', 1, 1, 1, 160.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(34, 'Formic Acid', 1, 1, 1, 450.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(35, 'Hydrazine', 1, 1, 1, 126.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(36, 'Lithium Carbonate', 1, 1, 1, 341.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(37, 'Magnesium Hydroxide', 1, 1, 1, 317.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(38, 'Manganese Sulphate', 1, 1, 1, 463.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(39, 'Nickel Sulphate', 1, 1, 1, 141.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(40, 'Phenolphthalein', 1, 1, 1, 460.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(41, 'Potassium Bromide', 1, 1, 1, 323.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(42, 'Silver Nitrate', 1, 1, 1, 195.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(43, 'Sodium Sulphate', 1, 1, 1, 174.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(44, 'Sulfur', 1, 1, 1, 86.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(45, 'Thymol', 1, 1, 1, 123.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(46, 'Triethanolamine', 1, 1, 1, 150.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(47, 'Xylene', 1, 1, 1, 71.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(48, 'Zinc Chloride', 1, 1, 1, 351.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(49, 'Aluminium Sulphate', 1, 1, 1, 212.00, 50, '2025-12-28 12:38:44', '2025-12-28 12:38:44');

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

--
-- Dumping data for table `reagent_test`
--

INSERT INTO `reagent_test` (`id`, `test_id`, `reagent_id`, `quantity_required`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 10.00, '2025-12-29 04:49:08', '2025-12-29 04:49:08'),
(2, 1, 13, 10.00, '2025-12-29 04:49:18', '2025-12-29 04:49:18'),
(3, 2, 17, 10.00, '2025-12-29 04:49:26', '2025-12-29 04:49:26');

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
(1, 'Mr. John Smith', 'Consultant', 'john@example.com', '01710000001', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(2, 'Ms. Alice Johnson', 'Lab Manager', 'alice@example.com', '01710000002', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(3, 'Dr. Robert Brown', 'Physician', 'robert@example.com', '01710000003', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(4, 'Dr. Emily Davis', 'Surgeon', 'emily@example.com', '01710000004', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(5, 'Mr. Michael Wilson', 'Technician', 'michael@example.com', '01710000005', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(6, 'Ms. Sophia Taylor', 'Nurse', 'sophia@example.com', '01710000006', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(7, 'Dr. William Martinez', 'Radiologist', 'william@example.com', '01710000007', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(8, 'Dr. Olivia Anderson', 'Oncologist', 'olivia@example.com', '01710000008', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(9, 'Dr. James Thomas', 'Endocrinologist', 'james@example.com', '01710000009', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(10, 'Dr. Isabella Jackson', 'Pediatrician', 'isabella@example.com', '01710000010', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(11, 'Dr. Benjamin White', 'Cardiologist', 'benjamin@example.com', '01710000011', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(12, 'Dr. Mia Harris', 'Neurologist', 'mia@example.com', '01710000012', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(13, 'Dr. Daniel Clark', 'Orthopedic', 'daniel@example.com', '01710000013', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(14, 'Dr. Charlotte Lewis', 'Dermatologist', 'charlotte@example.com', '01710000014', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42'),
(15, 'Dr. Matthew Lee', 'Ophthalmologist', 'matthew@example.com', '01710000015', 1, '2025-12-28 12:38:42', '2025-12-28 12:38:42');

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
(1, 'LAB2025122811', 1, 1, 1527.00, 1372.00, 1, 1, 4, 3, 'Room 6', 1, 0, '2025-12-28 12:39:10', '2025-12-28 12:39:10'),
(2, 'LAB2025122811', 1, 2, 581.00, 3965.00, 4, 1, 2, 2, 'Room 10', 1, 0, '2025-12-28 12:39:10', '2025-12-28 12:39:10'),
(3, 'LAB2025122811', 1, 3, 2247.00, 1357.00, 2, 2, 1, 3, 'Room 8', 1, 0, '2025-12-28 12:39:11', '2025-12-28 12:39:11'),
(4, 'LAB2025122811', 1, 4, 4933.00, 1407.00, 2, 2, 2, 2, 'Room 3', 1, 0, '2025-12-28 12:39:11', '2025-12-28 12:39:11'),
(5, 'LAB2025122811', 1, 5, 2465.00, 1688.00, 3, 2, 2, 2, 'Room 5', 1, 0, '2025-12-28 12:39:11', '2025-12-28 12:39:11'),
(6, 'LAB2025122812', 1, 4, 4933.00, 1407.00, 2, 2, 2, 2, 'Room 3', 1, 0, '2025-12-28 12:45:22', '2025-12-28 12:45:22'),
(7, 'LAB2025122812', 1, 3, 2247.00, 1357.00, 2, 2, 1, 3, 'Room 8', 1, 0, '2025-12-28 12:45:23', '2025-12-28 12:45:23'),
(8, 'LAB2025122812', 1, 2, 581.00, 3965.00, 4, 1, 2, 2, 'Room 10', 1, 0, '2025-12-28 12:45:23', '2025-12-28 12:45:23'),
(9, 'LAB2025122812', 1, 1, 1527.00, 1372.00, 1, 1, 4, 3, 'Room 6', 1, 0, '2025-12-28 12:45:24', '2025-12-28 12:45:24'),
(10, 'LAB2025122911', 1, 2, 581.00, 3965.00, 4, 1, 2, 2, 'Room 10', 1, 0, '2025-12-29 04:47:44', '2025-12-29 04:47:44'),
(11, 'LAB2025122911', 1, 3, 2247.00, 1357.00, 2, 2, 1, 3, 'Room 8', 1, 0, '2025-12-29 04:47:45', '2025-12-29 04:47:45'),
(12, 'LAB2025122911', 1, 4, 4933.00, 1407.00, 2, 2, 2, 2, 'Room 3', 1, 0, '2025-12-29 04:47:45', '2025-12-29 04:47:45'),
(13, 'LAB2025122911', 1, 5, 2465.00, 1688.00, 3, 2, 2, 2, 'Room 5', 1, 0, '2025-12-29 04:47:46', '2025-12-29 04:47:46'),
(14, 'LAB2025122911', 1, 6, 3384.00, 2324.00, 3, 3, 2, 3, 'Room 10', 1, 0, '2025-12-29 04:47:46', '2025-12-29 04:47:46'),
(15, 'LAB2025122911', 1, 7, 3489.00, 1270.00, 3, 1, 1, 2, 'Room 9', 1, 0, '2025-12-29 04:47:47', '2025-12-29 04:47:47');

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
(1, 'mg', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(2, 'ml', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(3, 'g', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(4, 'L', '2025-12-28 12:38:44', '2025-10-22 10:52:17'),
(5, 'tablet', '2025-12-28 12:38:44', '2025-12-28 12:38:44'),
(6, 'capsule', '2025-12-28 12:38:44', '2025-12-28 12:38:44');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `expenses_details`
--
ALTER TABLE `expenses_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `expenses_sub_categories`
--
ALTER TABLE `expenses_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `income_categories`
--
ALTER TABLE `income_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `income_sub_categories`
--
ALTER TABLE `income_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `references`
--
ALTER TABLE `references`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `store_tests`
--
ALTER TABLE `store_tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `test_report_details`
--
ALTER TABLE `test_report_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
