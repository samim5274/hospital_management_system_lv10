-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 27, 2025 at 10:51 AM
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
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'SAMIM', 'samim@gmail.com', '$2y$12$MCADF4zAqdJJ4EDlDG4MTuIivOTeDvdW2Tr7tACjjX1xFi3KtJCam', 'admin', 'HDUuEwQx6Xfz9j9MyGgKT7okpDPYK3jqx4XnhtCc9nStecFnsn0gmhC3v7tM', NULL, NULL),
(2, 'Akib Hossain', 'akib@gmail.com', '$2y$12$XpSO9YALOs7vC.N5uXb.0OJyd5V2kBcnMpM/qUQvWDjF33mPFKsru', 'Admin', 'jSPfQ1rBQIGa5n2chjx2mtXfGWlwyl3Srsg5dd0wAxdUNgo6hlrPSyGGok20', '2025-10-26 00:00:59', '2025-10-26 00:00:59'),
(3, 'Akib Hossain', 'akib2@gmail.com', '$2y$12$nk8MgzG7.Ggnnclyokz0v.V0uEFjK05mJbq75MfBQv0LnSuwMhRKO', 'Admin', NULL, '2025-10-26 00:14:41', '2025-10-26 00:14:41');

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
(1, 'B001', 'ICU', 'available', 1066.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(2, 'B002', 'Female Ward', 'available', 1773.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(3, 'B003', 'Male Ward', 'available', 950.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(4, 'B004', 'Female Ward', 'available', 1076.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(5, 'B005', 'Male Ward', 'available', 1601.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(6, 'B006', 'Emergency', 'available', 1452.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(7, 'B007', 'Emergency', 'available', 1028.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(8, 'B008', 'Male Ward', 'available', 878.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(9, 'B009', 'ICU', 'available', 857.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(10, 'B010', 'ICU', 'available', 1533.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(11, 'B011', 'Female Ward', 'available', 624.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(12, 'B012', 'Female Ward', 'available', 668.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(13, 'B013', 'Male Ward', 'available', 1333.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(14, 'B014', 'Cabin', 'available', 1710.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(15, 'B015', 'ICU', 'available', 648.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(16, 'B016', 'Female Ward', 'available', 808.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(17, 'B017', 'Emergency', 'available', 1989.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(18, 'B018', 'Male Ward', 'available', 742.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(19, 'B019', 'Female Ward', 'available', 1200.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(20, 'B020', 'Emergency', 'available', 1567.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(21, 'B021', 'ICU', 'available', 1164.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(22, 'B022', 'Emergency', 'available', 837.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(23, 'B023', 'Female Ward', 'available', 1042.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(24, 'B024', 'Male Ward', 'available', 1831.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(25, 'B025', 'ICU', 'available', 1240.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(26, 'B026', 'Male Ward', 'available', 518.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(27, 'B027', 'Male Ward', 'available', 1608.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(28, 'B028', 'Emergency', 'available', 1606.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(29, 'B029', 'Cabin', 'available', 992.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(30, 'B030', 'Male Ward', 'available', 1378.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(31, 'B031', 'ICU', 'available', 817.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(32, 'B032', 'Female Ward', 'available', 1797.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(33, 'B033', 'Cabin', 'available', 827.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(34, 'B034', 'Cabin', 'available', 1254.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(35, 'B035', 'Emergency', 'available', 1942.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(36, 'B036', 'Cabin', 'available', 630.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(37, 'B037', 'ICU', 'available', 1061.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(38, 'B038', 'ICU', 'available', 833.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(39, 'B039', 'Female Ward', 'available', 1520.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(40, 'B040', 'Cabin', 'available', 620.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(41, 'B041', 'ICU', 'available', 1601.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(42, 'B042', 'Male Ward', 'available', 1827.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(43, 'B043', 'Male Ward', 'available', 1865.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(44, 'B044', 'Female Ward', 'available', 822.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(45, 'B045', 'Cabin', 'available', 970.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(46, 'B046', 'Emergency', 'available', 1996.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(47, 'B047', 'Male Ward', 'available', 1695.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(48, 'B048', 'Female Ward', 'available', 1917.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(49, 'B049', 'ICU', 'available', 1178.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(50, 'B050', 'Emergency', 'available', 606.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(51, 'B051', 'ICU', 'available', 1352.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(52, 'B052', 'Male Ward', 'available', 690.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(53, 'B053', 'ICU', 'available', 933.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(54, 'B054', 'Male Ward', 'available', 764.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(55, 'B055', 'Male Ward', 'available', 1533.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(56, 'B056', 'Cabin', 'available', 811.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(57, 'B057', 'Cabin', 'available', 897.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(58, 'B058', 'Male Ward', 'available', 1998.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(59, 'B059', 'Female Ward', 'available', 1923.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(60, 'B060', 'ICU', 'available', 1095.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(61, 'B061', 'Emergency', 'available', 1744.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(62, 'B062', 'Emergency', 'available', 675.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(63, 'B063', 'Emergency', 'available', 1701.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(64, 'B064', 'Male Ward', 'available', 1422.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(65, 'B065', 'Cabin', 'available', 1901.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(66, 'B066', 'ICU', 'available', 1802.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(67, 'B067', 'ICU', 'available', 594.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(68, 'B068', 'Male Ward', 'available', 1323.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(69, 'B069', 'Female Ward', 'available', 1757.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(70, 'B070', 'Emergency', 'available', 728.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(71, 'B071', 'Emergency', 'available', 763.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(72, 'B072', 'Cabin', 'available', 1865.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(73, 'B073', 'Female Ward', 'available', 1765.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(74, 'B074', 'ICU', 'available', 1959.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(75, 'B075', 'Cabin', 'available', 1626.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(76, 'B076', 'Female Ward', 'available', 877.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(77, 'B077', 'Cabin', 'available', 1389.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(78, 'B078', 'Male Ward', 'available', 1476.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(79, 'B079', 'Cabin', 'available', 1090.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(80, 'B080', 'Male Ward', 'available', 1120.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(81, 'B081', 'Cabin', 'available', 879.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(82, 'B082', 'Emergency', 'available', 937.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(83, 'B083', 'Male Ward', 'available', 1415.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(84, 'B084', 'ICU', 'available', 1589.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(85, 'B085', 'Emergency', 'available', 1321.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(86, 'B086', 'ICU', 'available', 946.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(87, 'B087', 'Female Ward', 'available', 768.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(88, 'B088', 'Cabin', 'available', 1407.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(89, 'B089', 'Cabin', 'available', 1713.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(90, 'B090', 'Cabin', 'available', 903.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(91, 'B091', 'Emergency', 'available', 1437.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(92, 'B092', 'Male Ward', 'available', 1216.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(93, 'B093', 'Female Ward', 'available', 1685.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(94, 'B094', 'Emergency', 'available', 1334.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(95, 'B095', 'Female Ward', 'available', 1270.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(96, 'B096', 'Emergency', 'available', 773.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(97, 'B097', 'Cabin', 'available', 1142.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(98, 'B098', 'Emergency', 'available', 1687.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(99, 'B099', 'Female Ward', 'available', 945.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(100, 'B100', 'Cabin', 'available', 1603.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(101, 'B101', 'Cabin', 'available', 565.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(102, 'B102', 'ICU', 'available', 1102.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(103, 'B103', 'ICU', 'available', 1442.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(104, 'B104', 'Female Ward', 'available', 1700.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(105, 'B105', 'Male Ward', 'available', 841.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(106, 'B106', 'ICU', 'available', 611.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(107, 'B107', 'Female Ward', 'available', 989.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(108, 'B108', 'Emergency', 'available', 1299.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(109, 'B109', 'Male Ward', 'available', 679.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(110, 'B110', 'Emergency', 'available', 680.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(111, 'B111', 'Cabin', 'available', 1357.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(112, 'B112', 'Male Ward', 'available', 1020.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(113, 'B113', 'Cabin', 'available', 1565.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(114, 'B114', 'Female Ward', 'available', 1019.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(115, 'B115', 'Cabin', 'available', 1716.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(116, 'B116', 'Male Ward', 'available', 1498.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(117, 'B117', 'ICU', 'available', 1275.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(118, 'B118', 'ICU', 'available', 1602.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(119, 'B119', 'Emergency', 'available', 1254.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(120, 'B120', 'Male Ward', 'available', 1684.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(121, 'B121', 'Female Ward', 'available', 1140.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(122, 'B122', 'Male Ward', 'available', 1245.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(123, 'B123', 'Cabin', 'available', 836.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(124, 'B124', 'Cabin', 'available', 1861.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(125, 'B125', 'Cabin', 'available', 509.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(126, 'B126', 'Female Ward', 'available', 1768.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(127, 'B127', 'Cabin', 'available', 1079.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(128, 'B128', 'Female Ward', 'available', 1435.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(129, 'B129', 'Cabin', 'available', 1571.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(130, 'B130', 'Cabin', 'available', 1053.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(131, 'B131', 'Male Ward', 'available', 1324.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(132, 'B132', 'Cabin', 'available', 1789.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(133, 'B133', 'Male Ward', 'available', 1447.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(134, 'B134', 'Cabin', 'available', 554.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(135, 'B135', 'Male Ward', 'available', 911.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(136, 'B136', 'Cabin', 'available', 1176.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(137, 'B137', 'Female Ward', 'available', 1232.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(138, 'B138', 'Male Ward', 'available', 1012.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(139, 'B139', 'Cabin', 'available', 1349.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(140, 'B140', 'Cabin', 'available', 532.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(141, 'B141', 'Emergency', 'available', 1521.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(142, 'B142', 'Cabin', 'available', 1608.00, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(143, 'B143', 'Male Ward', 'available', 1667.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(144, 'B144', 'ICU', 'available', 1644.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(145, 'B145', 'Female Ward', 'available', 1781.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(146, 'B146', 'Emergency', 'available', 605.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(147, 'B147', 'Female Ward', 'available', 801.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(148, 'B148', 'Female Ward', 'available', 1253.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(149, 'B149', 'Emergency', 'available', 1834.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(150, 'B150', 'Male Ward', 'available', 1603.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(151, 'B151', 'Cabin', 'available', 1450.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(152, 'B152', 'Cabin', 'available', 1274.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(153, 'B153', 'Emergency', 'available', 1857.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(154, 'B154', 'Female Ward', 'available', 652.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(155, 'B155', 'Female Ward', 'available', 1866.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(156, 'B156', 'Cabin', 'available', 1944.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(157, 'B157', 'ICU', 'available', 1331.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(158, 'B158', 'Male Ward', 'available', 676.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(159, 'B159', 'Female Ward', 'available', 535.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(160, 'B160', 'Female Ward', 'available', 1520.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(161, 'B161', 'Emergency', 'available', 1124.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(162, 'B162', 'Male Ward', 'available', 1859.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(163, 'B163', 'Male Ward', 'available', 921.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(164, 'B164', 'Male Ward', 'available', 528.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(165, 'B165', 'ICU', 'available', 1587.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(166, 'B166', 'Female Ward', 'available', 1391.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(167, 'B167', 'Male Ward', 'available', 1068.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(168, 'B168', 'Female Ward', 'available', 748.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(169, 'B169', 'Cabin', 'available', 577.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(170, 'B170', 'ICU', 'available', 1946.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(171, 'B171', 'ICU', 'available', 1893.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(172, 'B172', 'Female Ward', 'available', 1292.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(173, 'B173', 'Female Ward', 'available', 1311.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(174, 'B174', 'Cabin', 'available', 1678.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(175, 'B175', 'Female Ward', 'available', 1926.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(176, 'B176', 'Female Ward', 'available', 1715.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(177, 'B177', 'Male Ward', 'available', 1423.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(178, 'B178', 'Emergency', 'available', 1028.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(179, 'B179', 'ICU', 'available', 934.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(180, 'B180', 'Female Ward', 'available', 1811.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(181, 'B181', 'ICU', 'available', 1283.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(182, 'B182', 'ICU', 'available', 1054.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(183, 'B183', 'Male Ward', 'available', 1524.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(184, 'B184', 'Male Ward', 'available', 1095.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(185, 'B185', 'Female Ward', 'available', 1543.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(186, 'B186', 'Cabin', 'available', 830.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(187, 'B187', 'Male Ward', 'available', 507.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(188, 'B188', 'Cabin', 'available', 1778.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(189, 'B189', 'Male Ward', 'available', 1351.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(190, 'B190', 'ICU', 'available', 534.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(191, 'B191', 'Emergency', 'available', 699.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(192, 'B192', 'Emergency', 'available', 836.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(193, 'B193', 'Cabin', 'available', 551.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(194, 'B194', 'Female Ward', 'available', 822.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(195, 'B195', 'ICU', 'available', 1315.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(196, 'B196', 'Male Ward', 'available', 996.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(197, 'B197', 'Emergency', 'available', 1037.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(198, 'B198', 'ICU', 'available', 1460.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(199, 'B199', 'ICU', 'available', 1173.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(200, 'B200', 'ICU', 'available', 1080.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(201, 'B201', 'Male Ward', 'available', 861.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(202, 'B202', 'Male Ward', 'available', 1099.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(203, 'B203', 'ICU', 'available', 1650.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(204, 'B204', 'Female Ward', 'available', 1806.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(205, 'B205', 'Female Ward', 'available', 1147.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(206, 'B206', 'Emergency', 'available', 900.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(207, 'B207', 'Emergency', 'available', 823.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(208, 'B208', 'Female Ward', 'available', 1749.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(209, 'B209', 'Female Ward', 'available', 1053.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(210, 'B210', 'Cabin', 'available', 1369.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(211, 'B211', 'ICU', 'available', 1834.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(212, 'B212', 'Female Ward', 'available', 855.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(213, 'B213', 'Male Ward', 'available', 1417.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(214, 'B214', 'Male Ward', 'available', 1384.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(215, 'B215', 'Female Ward', 'available', 1531.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(216, 'B216', 'Female Ward', 'available', 1506.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(217, 'B217', 'Female Ward', 'available', 1592.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(218, 'B218', 'ICU', 'available', 1742.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(219, 'B219', 'Cabin', 'available', 1813.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(220, 'B220', 'Female Ward', 'available', 734.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(221, 'B221', 'Cabin', 'available', 680.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(222, 'B222', 'ICU', 'available', 1204.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(223, 'B223', 'Cabin', 'available', 1772.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(224, 'B224', 'Male Ward', 'available', 911.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(225, 'B225', 'ICU', 'available', 1512.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(226, 'B226', 'Female Ward', 'available', 1669.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(227, 'B227', 'Cabin', 'available', 1897.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(228, 'B228', 'Male Ward', 'available', 1438.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(229, 'B229', 'Cabin', 'available', 1119.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(230, 'B230', 'ICU', 'available', 949.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(231, 'B231', 'Female Ward', 'available', 818.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(232, 'B232', 'ICU', 'available', 1428.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(233, 'B233', 'Cabin', 'available', 1007.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(234, 'B234', 'Female Ward', 'available', 1834.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(235, 'B235', 'ICU', 'available', 1607.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(236, 'B236', 'Cabin', 'available', 1657.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(237, 'B237', 'Cabin', 'available', 816.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(238, 'B238', 'ICU', 'available', 1270.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(239, 'B239', 'Cabin', 'available', 1925.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(240, 'B240', 'Male Ward', 'available', 1896.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(241, 'B241', 'Female Ward', 'available', 694.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(242, 'B242', 'Emergency', 'available', 1641.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(243, 'B243', 'Cabin', 'available', 1076.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(244, 'B244', 'Cabin', 'available', 1107.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(245, 'B245', 'Female Ward', 'available', 1616.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(246, 'B246', 'Cabin', 'available', 698.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(247, 'B247', 'ICU', 'available', 605.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(248, 'B248', 'Male Ward', 'available', 738.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(249, 'B249', 'Cabin', 'available', 769.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(250, 'B250', 'Cabin', 'available', 1293.00, '2025-10-26 10:07:30', '2025-10-26 10:07:30');

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
(1, 'Diabetes Mellitus', 'A metabolic disorder causing high blood sugar levels.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(2, 'Hypertension', 'High blood pressure condition.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(3, 'Asthma', 'A chronic lung disease causing breathing difficulty.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(4, 'Heart Disease', 'Conditions affecting the heart and blood vessels.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(5, 'Arthritis', 'Inflammation of the joints causing pain and stiffness.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(6, 'Migraine', 'Severe recurring headaches often with nausea.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(7, 'Tuberculosis', 'An infectious disease mainly affecting the lungs.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(8, 'Pneumonia', 'Infection that inflames the air sacs in one or both lungs.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(9, 'Covid-19', 'Respiratory illness caused by SARS-CoV-2 virus.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(10, 'Hepatitis B', 'A viral infection that affects the liver.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(11, 'Typhoid Fever', 'Bacterial infection caused by Salmonella typhi.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(12, 'Malaria', 'Mosquito-borne infectious disease affecting red blood cells.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(13, 'Dengue Fever', 'Viral infection spread by Aedes mosquitoes.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(14, 'Gastritis', 'Inflammation of the stomach lining.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(15, 'Ulcer', 'Open sores on the stomach or intestinal lining.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(16, 'Cancer', 'Abnormal cell growth that can spread to other parts of the body.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(17, 'Jaundice', 'Yellowing of the skin and eyes due to liver problems.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(18, 'Influenza', 'Common viral infection causing fever and sore throat.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(19, 'Kidney Stone', 'Hard deposits of minerals in the kidneys.', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(20, 'Anemia', 'Low red blood cell count causing fatigue.', '2025-10-26 10:07:30', '2025-10-26 10:07:30');

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
(1, 'Dr. John Smith', 'Cardiologist', '01710000001', 'john.smith@example.com', '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(2, 'Dr. Alice Johnson', 'Neurologist', '01710000002', 'alice.johnson@example.com', '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(3, 'Dr. Robert Brown', 'Pediatrician', '01710000003', 'robert.brown@example.com', '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(4, 'Dr. Emily Davis', 'Dermatologist', '01710000004', 'emily.davis@example.com', '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(5, 'Dr. Michael Wilson', 'Orthopedic', '01710000005', 'michael.wilson@example.com', '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(6, 'Dr. Sophia Taylor', 'Gynecologist', '01710000006', 'sophia.taylor@example.com', '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(7, 'Dr. William Martinez', 'ENT Specialist', '01710000007', 'william.martinez@example.com', '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(8, 'Dr. Olivia Anderson', 'Oncologist', '01710000008', 'olivia.anderson@example.com', '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(9, 'Dr. James Thomas', 'Radiologist', '01710000009', 'james.thomas@example.com', '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(10, 'Dr. Isabella Jackson', 'Endocrinologist', '01710000010', 'isabella.jackson@example.com', '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(11, 'Dr. Benjamin White', 'Urologist', '01710000011', 'benjamin.white@example.com', '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(12, 'Dr. Mia Harris', 'Gastroenterologist', '01710000012', 'mia.harris@example.com', '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(13, 'Dr. Daniel Clark', 'Pulmonologist', '01710000013', 'daniel.clark@example.com', '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(14, 'Dr. Charlotte Lewis', 'Nephrologist', '01710000014', 'charlotte.lewis@example.com', '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(15, 'Dr. Matthew Lee', 'Ophthalmologist', '01710000015', 'matthew.lee@example.com', '2025-10-26 10:07:29', '2025-10-26 10:07:29');

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
(1, 'Dr. Ayesha Karim', 'Cardiology', '01710000001', 'ayesha@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(2, 'Dr. Rahat Hossain', 'Orthopedics', '01710000002', 'rahat@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(3, 'Dr. Tanvir Alam', 'Neurology', '01710000003', 'tanvir@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(4, 'Dr. Nusrat Jahan', 'Gynecology', '01710000004', 'nusrat@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(5, 'Dr. Mamun Rahman', 'Medicine', '01710000005', 'mamun@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(6, 'Dr. Farhana Ahmed', 'Dermatology', '01710000006', 'farhana@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(7, 'Dr. Shahidul Islam', 'ENT', '01710000007', 'shahidul@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(8, 'Dr. Sabrina Akter', 'Cardiology', '01710000008', 'sabrina@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(9, 'Dr. Tareq Hasan', 'Urology', '01710000009', 'tareq@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(10, 'Dr. Rafiq Mahmud', 'Medicine', '01710000010', 'rafiq@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(11, 'Dr. Mahiya Sultana', 'Gynecology', '01710000011', 'mahiya@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(12, 'Dr. Hasan Chowdhury', 'Orthopedics', '01710000012', 'hasan@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(13, 'Dr. Sumaiya Rahman', 'Dermatology', '01710000013', 'sumaiya@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(14, 'Dr. Arif Mahmud', 'Cardiology', '01710000014', 'arif@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(15, 'Dr. Nayeem Islam', 'ENT', '01710000015', 'nayeem@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(16, 'Dr. Rima Akter', 'Neurology', '01710000016', 'rima@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(17, 'Dr. Omar Faruk', 'Medicine', '01710000017', 'omar@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(18, 'Dr. Sadiya Hossain', 'Gynecology', '01710000018', 'sadiya@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(19, 'Dr. Kamrul Hasan', 'Cardiology', '01710000019', 'kamrul@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(20, 'Dr. Rashedul Islam', 'Urology', '01710000020', 'rashed@example.com', '2025-10-26 10:07:30', '2025-10-26 10:07:30');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Paracetamol', NULL, '2025-10-22 16:57:39'),
(2, 'Amoxicillin', NULL, NULL),
(3, 'Ibuprofen', NULL, NULL),
(4, 'Metformin', NULL, NULL),
(5, 'Ciprofloxacin', NULL, NULL);

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
(1, 'Hematology', 'Blood related tests', '2025-10-26 10:07:28', '2025-10-26 10:07:28'),
(2, 'Biochemistry', 'Chemical analysis tests', '2025-10-26 10:07:28', '2025-10-26 10:07:28'),
(3, 'Microbiology', 'Bacteria and virus tests', '2025-10-26 10:07:28', '2025-10-26 10:07:28'),
(4, 'Immunology', 'Immune system tests', '2025-10-26 10:07:28', '2025-10-26 10:07:28');

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
(1, 'Routine', 'Routine tests', '2025-10-26 10:07:28', '2025-10-26 10:07:28'),
(2, 'Special', 'Special tests', '2025-10-26 10:07:28', '2025-10-26 10:07:28'),
(3, 'Emergency', 'Emergency tests', '2025-10-26 10:07:28', '2025-10-26 10:07:28');

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
(1, 'Blood', 'Venous blood sample', '2025-10-26 10:07:28', '2025-10-26 10:07:28'),
(2, 'Urine', 'Urine sample', '2025-10-26 10:07:28', '2025-10-26 10:07:28'),
(3, 'Saliva', 'Saliva sample', '2025-10-26 10:07:28', '2025-10-26 10:07:28'),
(4, 'Swab', 'Throat/nasal swab', '2025-10-26 10:07:29', '2025-10-26 10:07:29');

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
(1, 1, 'CBC', 'Complete Blood Count', '2025-10-26 10:07:28', '2025-10-26 10:07:28'),
(2, 1, 'ESR', 'Erythrocyte Sedimentation Rate', '2025-10-26 10:07:28', '2025-10-26 10:07:28'),
(3, 2, 'Liver Function Test', 'LFT panel', '2025-10-26 10:07:28', '2025-10-26 10:07:28'),
(4, 2, 'Kidney Function Test', 'KFT panel', '2025-10-26 10:07:28', '2025-10-26 10:07:28');

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
(1, 'CBC Test', 4, 1, 2, 3, 3485.00, 1953.00, 'Room 7', 'Eveniet vero odit veniam quod illo dignissimos ea.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(2, 'Thyroid Function Test', 1, 1, 2, 3, 4317.00, 3913.00, 'Room 9', 'Aut aut vel unde quod.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(3, 'Liver Function Test', 1, 1, 1, 2, 1127.00, 2975.00, 'Room 10', 'Sunt sit aut officia dolores quam et perspiciatis.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(4, 'Kidney Function Test', 2, 4, 1, 2, 2089.00, 4281.00, 'Room 1', 'Asperiores ut quod nisi et sit.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(5, 'Lipid Profile', 2, 3, 4, 1, 2975.00, 1904.00, 'Room 10', 'Omnis unde nulla et est qui rerum deserunt ut.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(6, 'Blood Sugar Test', 2, 2, 1, 3, 4833.00, 860.00, 'Room 4', 'Ipsum quo qui eveniet.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(7, 'Urine Routine Test', 4, 3, 1, 3, 2464.00, 333.00, 'Room 4', 'Velit sed est sed sit.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(8, 'Electrolyte Test', 1, 4, 2, 2, 2933.00, 421.00, 'Room 4', 'In aliquam ut accusantium in non placeat et a.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(9, 'Pulmonary Function Test', 2, 1, 1, 1, 2311.00, 1062.00, 'Room 3', 'Voluptatem rerum expedita id.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(10, 'ECG Test', 3, 2, 3, 3, 3970.00, 2357.00, 'Room 9', 'Earum sit suscipit atque sed omnis et.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(11, 'Eye Test', 4, 1, 2, 3, 3627.00, 846.00, 'Room 1', 'Quia optio earum occaecati vel nisi.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(12, 'Brain MRI', 3, 2, 4, 1, 1919.00, 1746.00, 'Room 10', 'Consequuntur recusandae et aut ipsa.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(13, 'Cardiac Enzyme Test', 2, 1, 4, 3, 3370.00, 4216.00, 'Room 3', 'Et officiis beatae molestias cum ipsa.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(14, 'Dengue Test', 2, 2, 4, 2, 3090.00, 1498.00, 'Room 5', 'Exercitationem quia nemo ut delectus voluptatem.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(15, 'Malaria Test', 1, 1, 1, 2, 1614.00, 3774.00, 'Room 4', 'Et tenetur optio itaque est rerum corporis nihil.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(16, 'Vitamin D Test', 1, 2, 4, 2, 4519.00, 2921.00, 'Room 9', 'Molestias aspernatur non dolorem est at aut quia.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(17, 'Vitamin B12 Test', 1, 4, 2, 2, 564.00, 1422.00, 'Room 7', 'Occaecati pariatur necessitatibus et voluptatem harum.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(18, 'Iron Test', 3, 2, 2, 1, 1459.00, 3120.00, 'Room 4', 'Reprehenderit quis voluptas eum sunt asperiores.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(19, 'Ferritin Test', 4, 2, 3, 2, 4592.00, 2679.00, 'Room 5', 'Possimus provident occaecati hic pariatur et quia.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(20, 'Uric Acid Test', 3, 4, 2, 3, 3207.00, 1261.00, 'Room 9', 'Impedit quis saepe laborum fuga.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(21, 'ESR Test', 2, 1, 1, 1, 1250.00, 372.00, 'Room 4', 'Architecto et eum id molestiae nam tenetur ipsa.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(22, 'RBC Count Test', 1, 1, 3, 1, 4832.00, 2740.00, 'Room 4', 'Iure amet qui et deleniti et sequi quibusdam.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(23, 'PCV Test', 3, 3, 1, 3, 3142.00, 3615.00, 'Room 3', 'Et labore sint eligendi non.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(24, 'MCH Test', 1, 4, 4, 2, 2963.00, 2457.00, 'Room 9', 'Nesciunt ex modi omnis ipsa voluptatum.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(25, 'MCHC Test', 3, 1, 2, 3, 1568.00, 3199.00, 'Room 10', 'Animi voluptate ea sed repellendus voluptatem quos.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(26, 'RDW Test', 1, 1, 4, 2, 3437.00, 1582.00, 'Room 7', 'Dolore dolor id natus odit architecto.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(27, 'Neutrophils Test', 1, 2, 1, 2, 4513.00, 1652.00, 'Room 2', 'Sapiente a consequatur nobis quam officiis.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(28, 'Lymphocytes Test', 2, 2, 2, 3, 2889.00, 4451.00, 'Room 10', 'Enim et dignissimos neque explicabo molestiae porro.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(29, 'Monocytes Test', 2, 2, 4, 2, 4548.00, 4246.00, 'Room 3', 'Et in a animi non vero.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(30, 'Eosinophils Test', 2, 3, 4, 1, 1051.00, 3991.00, 'Room 2', 'Ut illum numquam voluptatem repellendus eos.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(31, 'Basophils Test', 4, 2, 4, 1, 1488.00, 3843.00, 'Room 3', 'Similique voluptates nobis corporis excepturi.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(32, 'Prothrombin Time Test', 1, 1, 3, 1, 1206.00, 625.00, 'Room 6', 'Atque inventore itaque qui quia.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(33, 'INR Test', 3, 3, 2, 2, 2341.00, 3902.00, 'Room 7', 'At repellendus aut accusamus eos omnis enim nam quis.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(34, 'aPTT Test', 4, 3, 2, 1, 1019.00, 1375.00, 'Room 5', 'Hic quo quas aut.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(35, 'HIV 1 & 2 Test', 2, 2, 3, 3, 571.00, 1723.00, 'Room 3', 'Aperiam beatae facilis quam quaerat illo voluptas.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(36, 'HCV Antibody Test', 2, 1, 3, 3, 1722.00, 2070.00, 'Room 2', 'Qui consequatur ea doloribus tenetur.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(37, 'HbA1c Test', 4, 2, 4, 2, 3062.00, 2573.00, 'Room 6', 'Aut id consequatur culpa libero impedit.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(38, 'Blood Group Test', 4, 4, 1, 1, 2313.00, 716.00, 'Room 3', 'Doloribus quidem nihil molestias qui nihil eligendi et quo.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(39, 'Pregnancy Test', 1, 4, 2, 3, 1092.00, 1267.00, 'Room 10', 'Sit doloremque facilis sed eum laudantium culpa doloremque nostrum.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(40, 'Stool Occult Blood Test', 3, 1, 2, 2, 2520.00, 2682.00, 'Room 8', 'Aspernatur corporis esse at quisquam illum ipsam iusto.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(41, 'Amylase Test', 1, 3, 3, 3, 2271.00, 4465.00, 'Room 5', 'Exercitationem voluptatem iste aut in facere aut aspernatur.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(42, 'Lipase Test', 1, 3, 2, 2, 4270.00, 931.00, 'Room 4', 'At et eum exercitationem.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(43, 'LDH Test', 2, 2, 2, 2, 3116.00, 4370.00, 'Room 10', 'Itaque nihil repellendus sunt ut est.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(44, 'GGT Test', 2, 2, 2, 3, 4133.00, 4402.00, 'Room 4', 'Ducimus voluptate illum quis rerum id facilis.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(45, 'Phosphorus Test', 3, 2, 2, 2, 3304.00, 1055.00, 'Room 4', 'Qui consequatur voluptas delectus corporis.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(46, 'Magnesium Test', 4, 3, 2, 2, 2916.00, 3356.00, 'Room 7', 'Sequi dolores iste soluta tempora earum quidem veniam.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(47, 'Zinc Test', 2, 3, 1, 2, 4196.00, 3701.00, 'Room 1', 'Sed amet quia sunt voluptatem est.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(48, 'Copper Test', 1, 3, 4, 2, 2204.00, 3978.00, 'Room 5', 'Minus eos animi et nulla at.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(49, 'Insulin (Fasting) Test', 4, 4, 3, 1, 3161.00, 3962.00, 'Room 5', 'Et maxime voluptas vel quo dolorum.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(50, 'Cortisol (Morning) Test', 4, 3, 2, 1, 3510.00, 1419.00, 'Room 7', 'Cumque ullam enim aut asperiores facilis est.', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2025_10_16_060305_create_doctors_table', 1),
(7, '2025_10_16_060344_create_lab_materials_table', 1),
(8, '2025_10_16_061019_create_expenses_table', 1),
(9, '2025_10_16_062212_create_lab_categories_table', 1),
(10, '2025_10_16_062212_create_lab_groups_table', 1),
(11, '2025_10_16_062212_create_lab_specimens_table', 1),
(12, '2025_10_16_062212_create_lab_subcategories_table', 1),
(13, '2025_10_16_064353_create_lab_tests_table', 1),
(14, '2025_10_16_065015_create_admins_table', 1),
(15, '2025_10_16_065016_create_store_tests_table', 1),
(16, '2025_10_16_085053_create_references_table', 1),
(17, '2025_10_16_124831_create_payment_details_table', 1),
(18, '2025_10_17_044528_create_companies_table', 1),
(19, '2025_10_17_154807_create_beds_table', 1),
(20, '2025_10_17_162645_create_duty_doctors_table', 1),
(21, '2025_10_17_163136_create_diseases_table', 1),
(22, '2025_10_18_113032_create_admission_patients_table', 1),
(23, '2025_10_18_181954_create_admission_bill_summaries_table', 1),
(24, '2025_10_20_153826_create_test_report_details_table', 1),
(25, '2025_10_21_103401_create_patient_test_reports_table', 1),
(26, '2025_10_21_143623_create_units_table', 1),
(27, '2025_10_21_143701_create_generics_table', 1),
(28, '2025_10_21_143740_create_presentations_table', 1),
(29, '2025_10_21_143850_create_reagents_table', 1),
(30, '2025_10_23_114129_create_reagent_stocks_table', 1),
(31, '2025_10_23_115839_create_reagent_test_table', 1);

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
(4, 'LAB2025102611', '2025-10-26', 'John Doe', '1995-05-20', 'Male', '1762164746', 'Dhaka, Bangladesh', 1, 1, 7076, 50, 7026, 5000, 1, 2026, 0, 1, 1, '2025-10-26 11:57:35', '2025-10-26 11:57:35'),
(5, 'LAB2025102612', '2025-10-26', 'John Doe', '1995-05-20', 'Male', '1762164746', 'Dhaka, Bangladesh', 1, 1, 7455, 50, 7405, 5000, 1, 2405, 0, 1, 1, '2025-10-26 11:57:42', '2025-10-26 11:57:42'),
(6, 'LAB2025102711', '2025-10-27', 'John Doe', '1995-05-20', 'Male', '1762164746', 'Dhaka, Bangladesh', 1, 1, 8929, 50, 8879, 8000, 1, 879, 0, 1, 1, '2025-10-27 05:24:29', '2025-10-27 05:24:29');

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
(1, 'Tablet', NULL, '2025-10-22 17:00:20'),
(2, 'Capsule', NULL, NULL),
(3, 'Syrup', NULL, NULL),
(4, 'Injection', NULL, NULL),
(5, 'Powder', NULL, NULL);

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
(1, 'Acetone', 1, 1, 1, 437.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(2, 'Alcohol', 1, 1, 1, 202.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(3, 'Ammonia', 1, 1, 1, 71.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(4, 'Benzene', 1, 1, 1, 402.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(5, 'Calcium Chloride', 1, 1, 1, 70.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(6, 'Chloroform', 1, 1, 1, 474.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(7, 'Citric Acid', 1, 1, 1, 416.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(8, 'Copper Sulphate', 1, 1, 1, 232.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(9, 'Formaldehyde', 1, 1, 1, 362.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(10, 'Glucose', 1, 1, 1, 92.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(11, 'Glycerol', 1, 1, 1, 288.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(12, 'Hydrochloric Acid', 1, 1, 1, 114.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(13, 'Hydrogen Peroxide', 1, 1, 1, 221.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(14, 'Iodine', 1, 1, 1, 487.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(15, 'Iron Sulphate', 1, 1, 1, 60.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(16, 'Magnesium Sulphate', 1, 1, 1, 493.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(17, 'Methanol', 1, 1, 1, 493.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(18, 'Nitric Acid', 1, 1, 1, 303.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(19, 'Phenol', 1, 1, 1, 371.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(20, 'Potassium Chloride', 1, 1, 1, 425.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(21, 'Potassium Hydroxide', 1, 1, 1, 392.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(22, 'Sodium Bicarbonate', 1, 1, 1, 371.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(23, 'Sodium Carbonate', 1, 1, 1, 142.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(24, 'Sodium Chloride', 1, 1, 1, 447.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(25, 'Sodium Hydroxide', 1, 1, 1, 401.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(26, 'Sulfuric Acid', 1, 1, 1, 477.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(27, 'Toluene', 1, 1, 1, 365.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(28, 'Urea', 1, 1, 1, 227.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(29, 'Zinc Sulphate', 1, 1, 1, 303.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(30, 'Sodium Nitrate', 1, 1, 1, 435.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(31, 'Ammonium Chloride', 1, 1, 1, 63.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(32, 'Barium Sulphate', 1, 1, 1, 144.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(33, 'Ethyl Acetate', 1, 1, 1, 263.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(34, 'Formic Acid', 1, 1, 1, 320.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(35, 'Hydrazine', 1, 1, 1, 130.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(36, 'Lithium Carbonate', 1, 1, 1, 198.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(37, 'Magnesium Hydroxide', 1, 1, 1, 428.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(38, 'Manganese Sulphate', 1, 1, 1, 129.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(39, 'Nickel Sulphate', 1, 1, 1, 384.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(40, 'Phenolphthalein', 1, 1, 1, 426.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(41, 'Potassium Bromide', 1, 1, 1, 86.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(42, 'Silver Nitrate', 1, 1, 1, 284.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(43, 'Sodium Sulphate', 1, 1, 1, 453.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(44, 'Sulfur', 1, 1, 1, 450.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(45, 'Thymol', 1, 1, 1, 310.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(46, 'Triethanolamine', 1, 1, 1, 171.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(47, 'Xylene', 1, 1, 1, 444.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(48, 'Zinc Chloride', 1, 1, 1, 64.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30'),
(49, 'Aluminium Sulphate', 1, 1, 1, 267.00, 50, '2025-10-26 10:07:30', '2025-10-26 10:07:30');

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
(1, 'Mr. John Smith', 'Consultant', 'john@example.com', '01710000001', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(2, 'Ms. Alice Johnson', 'Lab Manager', 'alice@example.com', '01710000002', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(3, 'Dr. Robert Brown', 'Physician', 'robert@example.com', '01710000003', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(4, 'Dr. Emily Davis', 'Surgeon', 'emily@example.com', '01710000004', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(5, 'Mr. Michael Wilson', 'Technician', 'michael@example.com', '01710000005', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(6, 'Ms. Sophia Taylor', 'Nurse', 'sophia@example.com', '01710000006', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(7, 'Dr. William Martinez', 'Radiologist', 'william@example.com', '01710000007', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(8, 'Dr. Olivia Anderson', 'Oncologist', 'olivia@example.com', '01710000008', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(9, 'Dr. James Thomas', 'Endocrinologist', 'james@example.com', '01710000009', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(10, 'Dr. Isabella Jackson', 'Pediatrician', 'isabella@example.com', '01710000010', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(11, 'Dr. Benjamin White', 'Cardiologist', 'benjamin@example.com', '01710000011', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(12, 'Dr. Mia Harris', 'Neurologist', 'mia@example.com', '01710000012', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(13, 'Dr. Daniel Clark', 'Orthopedic', 'daniel@example.com', '01710000013', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(14, 'Dr. Charlotte Lewis', 'Dermatologist', 'charlotte@example.com', '01710000014', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29'),
(15, 'Dr. Matthew Lee', 'Ophthalmologist', 'matthew@example.com', '01710000015', 1, '2025-10-26 10:07:29', '2025-10-26 10:07:29');

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
(24, 'LAB2025102611', 1, 1, 3485.00, 1953.00, 4, 1, 2, 3, 'Room 7', 1, 0, '2025-10-26 10:46:48', '2025-10-26 10:46:48'),
(25, 'LAB2025102621', 2, 2, 4317.00, 3913.00, 1, 1, 2, 3, 'Room 9', 1, 0, '2025-10-26 10:46:58', '2025-10-26 10:46:58'),
(26, 'LAB2025102621', 2, 3, 1127.00, 2975.00, 1, 1, 1, 2, 'Room 10', 1, 0, '2025-10-26 10:46:58', '2025-10-26 10:46:58'),
(27, 'LAB2025102611', 1, 3, 1127.00, 2975.00, 1, 1, 1, 2, 'Room 10', 1, 0, '2025-10-26 10:47:04', '2025-10-26 10:47:04'),
(28, 'LAB2025102611', 1, 7, 2464.00, 333.00, 4, 3, 1, 3, 'Room 4', 1, 0, '2025-10-26 10:47:17', '2025-10-26 10:47:17'),
(31, 'LAB2025102612', 1, 1, 3485.00, 1953.00, 4, 1, 2, 3, 'Room 7', 1, 0, '2025-10-26 10:50:43', '2025-10-26 10:50:43'),
(32, 'LAB2025102612', 1, 10, 3970.00, 2357.00, 3, 2, 3, 3, 'Room 9', 1, 0, '2025-10-26 10:50:54', '2025-10-26 10:50:54'),
(33, 'LAB2025102711', 1, 1, 3485.00, 1953.00, 4, 1, 2, 3, 'Room 7', 1, 0, '2025-10-27 05:23:54', '2025-10-27 05:23:54'),
(34, 'LAB2025102711', 1, 2, 4317.00, 3913.00, 1, 1, 2, 3, 'Room 9', 1, 0, '2025-10-27 05:23:58', '2025-10-27 05:23:58'),
(35, 'LAB2025102711', 1, 3, 1127.00, 2975.00, 1, 1, 1, 2, 'Room 10', 1, 0, '2025-10-27 05:24:02', '2025-10-27 05:24:02'),
(39, 'LAB2025102712', 1, 1, 3485.00, 1953.00, 4, 1, 2, 3, 'Room 7', 1, 0, '2025-10-27 06:25:54', '2025-10-27 06:25:54'),
(40, 'LAB2025102712', 1, 2, 4317.00, 3913.00, 1, 1, 2, 3, 'Room 9', 1, 0, '2025-10-27 06:25:55', '2025-10-27 06:25:55');

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
(1, 'mg', NULL, NULL),
(2, 'ml', NULL, NULL),
(3, 'g', NULL, NULL),
(4, 'L', NULL, '2025-10-22 16:52:17'),
(5, 'tablet', NULL, NULL),
(6, 'capsule', NULL, NULL);

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
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `patient_test_reports`
--
ALTER TABLE `patient_test_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
