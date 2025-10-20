-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 20, 2025 at 01:37 PM
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
(1, 'SAMIM', 'samim@gmail.com', '$2y$12$MCADF4zAqdJJ4EDlDG4MTuIivOTeDvdW2Tr7tACjjX1xFi3KtJCam', 'admin', 'LywL4kvyEO8dap00itYF9oZgh0ebMtTOkbH0D1BSJ5XTVnRjZwr3j7isOaC9', NULL, NULL);

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

--
-- Dumping data for table `admission_bill_summaries`
--

INSERT INTO `admission_bill_summaries` (`id`, `patient_id`, `general_bed`, `cabin_fee`, `doctor_fee`, `service_charge`, `ot_medicine`, `oral_medicine`, `others`, `contract_amount`, `total_cost`, `discount`, `advance_paid`, `payable_amount`, `paid_amount`, `remaining_due`, `reg`, `billing_date`, `user_id`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 1, 1643.00, 1500.00, 1500.00, 1000.00, 1500.00, 1500.00, 1500.00, 10000.00, 20143.00, 143.00, 5000.00, 15000.00, 5000.00, 10000.00, 'IND-2025102011', '2025-10-20', 1, 'Advance Pay date of 20-Oct-2025, Received by : SAMIM, Bill modified by SAMIM, Modify date : 20-Oct-2025. , Patient Discharge by SAMIM, Discharge date : 20-Oct-2025. ', '2025-10-20 11:36:32', '2025-10-20 11:37:09');

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

--
-- Dumping data for table `admission_patients`
--

INSERT INTO `admission_patients` (`id`, `reg`, `name`, `dob`, `gender`, `mobile`, `father_husband`, `guardian`, `address`, `religion`, `nid`, `contract_type`, `contract_amount`, `procedure_type`, `medicine_package`, `refer_id`, `treatment_under_id`, `duty_doctor_id`, `disease_id`, `duty_nurse`, `bed_booked_date`, `bed_id`, `bed_cost`, `user_id`, `status`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 'IND-2025102011', 'Shamim Hossain', '2001-12-31', 'Male', '01762164746', 'Jamsher Ali', 'Jamsher Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '568974312', 'Contract', 10000.00, 'Conservative', 'Package', 15, 15, 20, 20, 'Mr. Sabrina Akter', '2025-10-20', 19, 1643.00, 1, 2, 'Patient discharged. Date of :20-Oct-2025', '2025-10-20 11:36:18', '2025-10-20 11:37:09');

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
(1, 'B001', 'Female Ward', 'available', 539.00, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(2, 'B002', 'Emergency', 'available', 1533.00, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(3, 'B003', 'Emergency', 'available', 1731.00, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(4, 'B004', 'Emergency', 'available', 753.00, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(5, 'B005', 'Male Ward', 'available', 1297.00, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(6, 'B006', 'ICU', 'available', 1183.00, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(7, 'B007', 'Male Ward', 'available', 1251.00, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(8, 'B008', 'Male Ward', 'available', 794.00, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(9, 'B009', 'Emergency', 'available', 740.00, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(10, 'B010', 'Emergency', 'available', 1158.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(11, 'B011', 'ICU', 'available', 1660.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(12, 'B012', 'ICU', 'available', 1984.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(13, 'B013', 'Cabin', 'available', 1610.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(14, 'B014', 'Male Ward', 'available', 985.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(15, 'B015', 'Male Ward', 'available', 1033.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(16, 'B016', 'Emergency', 'available', 1828.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(17, 'B017', 'Emergency', 'available', 567.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(18, 'B018', 'Male Ward', 'available', 1858.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(19, 'B019', 'Male Ward', 'booked', 1643.00, '2025-10-20 11:35:07', '2025-10-20 11:36:18'),
(20, 'B020', 'ICU', 'available', 594.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(21, 'B021', 'Female Ward', 'available', 1136.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(22, 'B022', 'ICU', 'available', 1940.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(23, 'B023', 'Female Ward', 'available', 806.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(24, 'B024', 'Emergency', 'available', 1102.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(25, 'B025', 'Cabin', 'available', 1332.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(26, 'B026', 'ICU', 'available', 1009.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(27, 'B027', 'Male Ward', 'available', 901.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(28, 'B028', 'ICU', 'available', 1249.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(29, 'B029', 'Male Ward', 'available', 823.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(30, 'B030', 'Male Ward', 'available', 1100.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(31, 'B031', 'Cabin', 'available', 1641.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(32, 'B032', 'Male Ward', 'available', 1445.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(33, 'B033', 'ICU', 'available', 1924.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(34, 'B034', 'Cabin', 'available', 1064.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(35, 'B035', 'Female Ward', 'available', 897.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(36, 'B036', 'Emergency', 'available', 1732.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(37, 'B037', 'ICU', 'available', 1998.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(38, 'B038', 'Male Ward', 'available', 1792.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(39, 'B039', 'Cabin', 'available', 1827.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(40, 'B040', 'Female Ward', 'available', 1674.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(41, 'B041', 'Male Ward', 'available', 1266.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(42, 'B042', 'Male Ward', 'available', 601.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(43, 'B043', 'Female Ward', 'available', 1875.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(44, 'B044', 'Emergency', 'available', 1651.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(45, 'B045', 'Emergency', 'available', 694.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(46, 'B046', 'Male Ward', 'available', 693.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(47, 'B047', 'Male Ward', 'available', 1260.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(48, 'B048', 'ICU', 'available', 1938.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(49, 'B049', 'Male Ward', 'available', 1356.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(50, 'B050', 'Female Ward', 'available', 1025.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(51, 'B051', 'Female Ward', 'available', 1822.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(52, 'B052', 'Emergency', 'available', 799.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(53, 'B053', 'Male Ward', 'available', 701.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(54, 'B054', 'Female Ward', 'available', 1511.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(55, 'B055', 'ICU', 'available', 1730.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(56, 'B056', 'Female Ward', 'available', 863.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(57, 'B057', 'Cabin', 'available', 1009.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(58, 'B058', 'Emergency', 'available', 1569.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(59, 'B059', 'Male Ward', 'available', 1381.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(60, 'B060', 'Female Ward', 'available', 1111.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(61, 'B061', 'Male Ward', 'available', 1846.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(62, 'B062', 'Cabin', 'available', 1079.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(63, 'B063', 'Male Ward', 'available', 1570.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(64, 'B064', 'Female Ward', 'available', 1050.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(65, 'B065', 'Emergency', 'available', 1028.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(66, 'B066', 'Female Ward', 'available', 1917.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(67, 'B067', 'Female Ward', 'available', 1425.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(68, 'B068', 'Cabin', 'available', 1765.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(69, 'B069', 'Emergency', 'available', 915.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(70, 'B070', 'Cabin', 'available', 1500.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(71, 'B071', 'Emergency', 'available', 1186.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(72, 'B072', 'Cabin', 'available', 1816.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(73, 'B073', 'Cabin', 'available', 1368.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(74, 'B074', 'Male Ward', 'available', 698.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(75, 'B075', 'Female Ward', 'available', 1087.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(76, 'B076', 'Cabin', 'available', 1445.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(77, 'B077', 'ICU', 'available', 1351.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(78, 'B078', 'Female Ward', 'available', 1043.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(79, 'B079', 'Cabin', 'available', 1754.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(80, 'B080', 'Female Ward', 'available', 1027.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(81, 'B081', 'Emergency', 'available', 824.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(82, 'B082', 'Female Ward', 'available', 655.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(83, 'B083', 'Emergency', 'available', 1989.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(84, 'B084', 'Cabin', 'available', 640.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(85, 'B085', 'Female Ward', 'available', 1839.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(86, 'B086', 'ICU', 'available', 1807.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(87, 'B087', 'Cabin', 'available', 1745.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(88, 'B088', 'ICU', 'available', 1956.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(89, 'B089', 'Emergency', 'available', 1069.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(90, 'B090', 'Female Ward', 'available', 1696.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(91, 'B091', 'Cabin', 'available', 1210.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(92, 'B092', 'Female Ward', 'available', 1468.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(93, 'B093', 'Male Ward', 'available', 814.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(94, 'B094', 'Cabin', 'available', 1609.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(95, 'B095', 'ICU', 'available', 512.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(96, 'B096', 'Emergency', 'available', 1019.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(97, 'B097', 'ICU', 'available', 882.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(98, 'B098', 'Male Ward', 'available', 1224.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(99, 'B099', 'Female Ward', 'available', 592.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(100, 'B100', 'Emergency', 'available', 1214.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(101, 'B101', 'Cabin', 'available', 1378.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(102, 'B102', 'Emergency', 'available', 1098.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(103, 'B103', 'Female Ward', 'available', 1081.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(104, 'B104', 'Emergency', 'available', 1594.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(105, 'B105', 'Male Ward', 'available', 1840.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(106, 'B106', 'ICU', 'available', 917.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(107, 'B107', 'Male Ward', 'available', 1667.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(108, 'B108', 'Male Ward', 'available', 710.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(109, 'B109', 'Female Ward', 'available', 628.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(110, 'B110', 'Emergency', 'available', 1732.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(111, 'B111', 'Cabin', 'available', 584.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(112, 'B112', 'Female Ward', 'available', 542.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(113, 'B113', 'Female Ward', 'available', 1173.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(114, 'B114', 'Female Ward', 'available', 1918.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(115, 'B115', 'Male Ward', 'available', 1995.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(116, 'B116', 'Female Ward', 'available', 1420.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(117, 'B117', 'Emergency', 'available', 1682.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(118, 'B118', 'Female Ward', 'available', 1956.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(119, 'B119', 'Cabin', 'available', 905.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(120, 'B120', 'Cabin', 'available', 971.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(121, 'B121', 'ICU', 'available', 1369.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(122, 'B122', 'Cabin', 'available', 954.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(123, 'B123', 'Female Ward', 'available', 1923.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(124, 'B124', 'Female Ward', 'available', 1382.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(125, 'B125', 'Emergency', 'available', 880.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(126, 'B126', 'Male Ward', 'available', 612.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(127, 'B127', 'Male Ward', 'available', 969.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(128, 'B128', 'Male Ward', 'available', 1726.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(129, 'B129', 'ICU', 'available', 838.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(130, 'B130', 'Emergency', 'available', 1817.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(131, 'B131', 'ICU', 'available', 1112.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(132, 'B132', 'Female Ward', 'available', 775.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(133, 'B133', 'Cabin', 'available', 1110.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(134, 'B134', 'Female Ward', 'available', 924.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(135, 'B135', 'ICU', 'available', 1803.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(136, 'B136', 'Female Ward', 'available', 1023.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(137, 'B137', 'Male Ward', 'available', 762.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(138, 'B138', 'Cabin', 'available', 567.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(139, 'B139', 'Cabin', 'available', 1469.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(140, 'B140', 'Male Ward', 'available', 772.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(141, 'B141', 'Cabin', 'available', 840.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(142, 'B142', 'Emergency', 'available', 1993.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(143, 'B143', 'Female Ward', 'available', 1303.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(144, 'B144', 'Male Ward', 'available', 1791.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(145, 'B145', 'Female Ward', 'available', 1292.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(146, 'B146', 'Cabin', 'available', 1993.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(147, 'B147', 'Emergency', 'available', 1427.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(148, 'B148', 'Female Ward', 'available', 1354.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(149, 'B149', 'Cabin', 'available', 677.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(150, 'B150', 'Male Ward', 'available', 687.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(151, 'B151', 'Female Ward', 'available', 509.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(152, 'B152', 'Female Ward', 'available', 514.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(153, 'B153', 'Male Ward', 'available', 1707.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(154, 'B154', 'ICU', 'available', 1840.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(155, 'B155', 'Cabin', 'available', 1421.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(156, 'B156', 'Male Ward', 'available', 899.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(157, 'B157', 'Male Ward', 'available', 1297.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(158, 'B158', 'ICU', 'available', 1359.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(159, 'B159', 'Cabin', 'available', 503.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(160, 'B160', 'Female Ward', 'available', 558.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(161, 'B161', 'ICU', 'available', 1066.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(162, 'B162', 'Male Ward', 'available', 721.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(163, 'B163', 'ICU', 'available', 1603.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(164, 'B164', 'Emergency', 'available', 524.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(165, 'B165', 'Male Ward', 'available', 1398.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(166, 'B166', 'Emergency', 'available', 1144.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(167, 'B167', 'Male Ward', 'available', 1319.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(168, 'B168', 'Male Ward', 'available', 1703.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(169, 'B169', 'Cabin', 'available', 1037.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(170, 'B170', 'Female Ward', 'available', 1626.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(171, 'B171', 'Emergency', 'available', 1750.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(172, 'B172', 'Emergency', 'available', 1655.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(173, 'B173', 'ICU', 'available', 1555.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(174, 'B174', 'Male Ward', 'available', 1674.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(175, 'B175', 'Cabin', 'available', 1462.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(176, 'B176', 'Female Ward', 'available', 1305.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(177, 'B177', 'Cabin', 'available', 1196.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(178, 'B178', 'Male Ward', 'available', 1360.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(179, 'B179', 'Female Ward', 'available', 1780.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(180, 'B180', 'ICU', 'available', 511.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(181, 'B181', 'Cabin', 'available', 1873.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(182, 'B182', 'Female Ward', 'available', 1058.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(183, 'B183', 'ICU', 'available', 1081.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(184, 'B184', 'Female Ward', 'available', 1868.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(185, 'B185', 'Female Ward', 'available', 713.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(186, 'B186', 'ICU', 'available', 1658.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(187, 'B187', 'ICU', 'available', 643.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(188, 'B188', 'ICU', 'available', 1172.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(189, 'B189', 'Female Ward', 'available', 1070.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(190, 'B190', 'Emergency', 'available', 607.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(191, 'B191', 'Emergency', 'available', 967.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(192, 'B192', 'Cabin', 'available', 702.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(193, 'B193', 'Cabin', 'available', 733.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(194, 'B194', 'Female Ward', 'available', 1390.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(195, 'B195', 'ICU', 'available', 1382.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(196, 'B196', 'Emergency', 'available', 673.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(197, 'B197', 'Emergency', 'available', 1820.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(198, 'B198', 'Male Ward', 'available', 936.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(199, 'B199', 'Female Ward', 'available', 604.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(200, 'B200', 'Emergency', 'available', 677.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(201, 'B201', 'ICU', 'available', 1998.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(202, 'B202', 'Cabin', 'available', 1158.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(203, 'B203', 'Female Ward', 'available', 1290.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(204, 'B204', 'Female Ward', 'available', 750.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(205, 'B205', 'Cabin', 'available', 698.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(206, 'B206', 'Cabin', 'available', 665.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(207, 'B207', 'ICU', 'available', 600.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(208, 'B208', 'Emergency', 'available', 1575.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(209, 'B209', 'Emergency', 'available', 1128.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(210, 'B210', 'Female Ward', 'available', 751.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(211, 'B211', 'Cabin', 'available', 940.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(212, 'B212', 'ICU', 'available', 537.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(213, 'B213', 'Male Ward', 'available', 1718.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(214, 'B214', 'ICU', 'available', 1964.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(215, 'B215', 'Cabin', 'available', 1520.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(216, 'B216', 'Female Ward', 'available', 554.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(217, 'B217', 'Emergency', 'available', 1009.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(218, 'B218', 'Female Ward', 'available', 1542.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(219, 'B219', 'Male Ward', 'available', 1265.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(220, 'B220', 'Cabin', 'available', 1619.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(221, 'B221', 'Female Ward', 'available', 736.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(222, 'B222', 'Male Ward', 'available', 520.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(223, 'B223', 'Female Ward', 'available', 1743.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(224, 'B224', 'Male Ward', 'available', 1896.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(225, 'B225', 'Cabin', 'available', 1536.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(226, 'B226', 'Male Ward', 'available', 1616.00, '2025-10-20 11:35:07', '2025-10-20 11:35:07'),
(227, 'B227', 'Male Ward', 'available', 1398.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(228, 'B228', 'Emergency', 'available', 1932.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(229, 'B229', 'Emergency', 'available', 1074.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(230, 'B230', 'Female Ward', 'available', 1333.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(231, 'B231', 'Female Ward', 'available', 1785.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(232, 'B232', 'Female Ward', 'available', 507.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(233, 'B233', 'Cabin', 'available', 560.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(234, 'B234', 'Male Ward', 'available', 1133.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(235, 'B235', 'Cabin', 'available', 1018.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(236, 'B236', 'ICU', 'available', 1934.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(237, 'B237', 'ICU', 'available', 1682.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(238, 'B238', 'Cabin', 'available', 771.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(239, 'B239', 'Cabin', 'available', 583.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(240, 'B240', 'Cabin', 'available', 1059.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(241, 'B241', 'ICU', 'available', 1197.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(242, 'B242', 'Cabin', 'available', 1913.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(243, 'B243', 'Male Ward', 'available', 1163.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(244, 'B244', 'Male Ward', 'available', 1666.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(245, 'B245', 'Female Ward', 'available', 961.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(246, 'B246', 'Emergency', 'available', 1490.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(247, 'B247', 'Male Ward', 'available', 896.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(248, 'B248', 'ICU', 'available', 1976.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(249, 'B249', 'ICU', 'available', 1841.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(250, 'B250', 'Emergency', 'available', 1083.00, '2025-10-20 11:35:08', '2025-10-20 11:35:08');

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
(1, 'Diabetes Mellitus', 'A metabolic disorder causing high blood sugar levels.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(2, 'Hypertension', 'High blood pressure condition.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(3, 'Asthma', 'A chronic lung disease causing breathing difficulty.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(4, 'Heart Disease', 'Conditions affecting the heart and blood vessels.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(5, 'Arthritis', 'Inflammation of the joints causing pain and stiffness.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(6, 'Migraine', 'Severe recurring headaches often with nausea.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(7, 'Tuberculosis', 'An infectious disease mainly affecting the lungs.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(8, 'Pneumonia', 'Infection that inflames the air sacs in one or both lungs.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(9, 'Covid-19', 'Respiratory illness caused by SARS-CoV-2 virus.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(10, 'Hepatitis B', 'A viral infection that affects the liver.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(11, 'Typhoid Fever', 'Bacterial infection caused by Salmonella typhi.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(12, 'Malaria', 'Mosquito-borne infectious disease affecting red blood cells.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(13, 'Dengue Fever', 'Viral infection spread by Aedes mosquitoes.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(14, 'Gastritis', 'Inflammation of the stomach lining.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(15, 'Ulcer', 'Open sores on the stomach or intestinal lining.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(16, 'Cancer', 'Abnormal cell growth that can spread to other parts of the body.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(17, 'Jaundice', 'Yellowing of the skin and eyes due to liver problems.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(18, 'Influenza', 'Common viral infection causing fever and sore throat.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(19, 'Kidney Stone', 'Hard deposits of minerals in the kidneys.', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(20, 'Anemia', 'Low red blood cell count causing fatigue.', '2025-10-20 11:35:08', '2025-10-20 11:35:08');

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
(1, 'Dr. John Smith', 'Cardiologist', '01710000001', 'john.smith@example.com', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(2, 'Dr. Alice Johnson', 'Neurologist', '01710000002', 'alice.johnson@example.com', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(3, 'Dr. Robert Brown', 'Pediatrician', '01710000003', 'robert.brown@example.com', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(4, 'Dr. Emily Davis', 'Dermatologist', '01710000004', 'emily.davis@example.com', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(5, 'Dr. Michael Wilson', 'Orthopedic', '01710000005', 'michael.wilson@example.com', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(6, 'Dr. Sophia Taylor', 'Gynecologist', '01710000006', 'sophia.taylor@example.com', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(7, 'Dr. William Martinez', 'ENT Specialist', '01710000007', 'william.martinez@example.com', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(8, 'Dr. Olivia Anderson', 'Oncologist', '01710000008', 'olivia.anderson@example.com', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(9, 'Dr. James Thomas', 'Radiologist', '01710000009', 'james.thomas@example.com', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(10, 'Dr. Isabella Jackson', 'Endocrinologist', '01710000010', 'isabella.jackson@example.com', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(11, 'Dr. Benjamin White', 'Urologist', '01710000011', 'benjamin.white@example.com', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(12, 'Dr. Mia Harris', 'Gastroenterologist', '01710000012', 'mia.harris@example.com', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(13, 'Dr. Daniel Clark', 'Pulmonologist', '01710000013', 'daniel.clark@example.com', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(14, 'Dr. Charlotte Lewis', 'Nephrologist', '01710000014', 'charlotte.lewis@example.com', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(15, 'Dr. Matthew Lee', 'Ophthalmologist', '01710000015', 'matthew.lee@example.com', '2025-10-20 11:35:06', '2025-10-20 11:35:06');

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
(1, 'Dr. Ayesha Karim', 'Cardiology', '01710000001', 'ayesha@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(2, 'Dr. Rahat Hossain', 'Orthopedics', '01710000002', 'rahat@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(3, 'Dr. Tanvir Alam', 'Neurology', '01710000003', 'tanvir@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(4, 'Dr. Nusrat Jahan', 'Gynecology', '01710000004', 'nusrat@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(5, 'Dr. Mamun Rahman', 'Medicine', '01710000005', 'mamun@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(6, 'Dr. Farhana Ahmed', 'Dermatology', '01710000006', 'farhana@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(7, 'Dr. Shahidul Islam', 'ENT', '01710000007', 'shahidul@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(8, 'Dr. Sabrina Akter', 'Cardiology', '01710000008', 'sabrina@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(9, 'Dr. Tareq Hasan', 'Urology', '01710000009', 'tareq@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(10, 'Dr. Rafiq Mahmud', 'Medicine', '01710000010', 'rafiq@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(11, 'Dr. Mahiya Sultana', 'Gynecology', '01710000011', 'mahiya@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(12, 'Dr. Hasan Chowdhury', 'Orthopedics', '01710000012', 'hasan@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(13, 'Dr. Sumaiya Rahman', 'Dermatology', '01710000013', 'sumaiya@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(14, 'Dr. Arif Mahmud', 'Cardiology', '01710000014', 'arif@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(15, 'Dr. Nayeem Islam', 'ENT', '01710000015', 'nayeem@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(16, 'Dr. Rima Akter', 'Neurology', '01710000016', 'rima@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(17, 'Dr. Omar Faruk', 'Medicine', '01710000017', 'omar@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(18, 'Dr. Sadiya Hossain', 'Gynecology', '01710000018', 'sadiya@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(19, 'Dr. Kamrul Hasan', 'Cardiology', '01710000019', 'kamrul@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08'),
(20, 'Dr. Rashedul Islam', 'Urology', '01710000020', 'rashed@example.com', '2025-10-20 11:35:08', '2025-10-20 11:35:08');

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
(1, 'Hematology', 'Blood related tests', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(2, 'Biochemistry', 'Chemical analysis tests', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(3, 'Microbiology', 'Bacteria and virus tests', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(4, 'Immunology', 'Immune system tests', '2025-10-20 11:35:06', '2025-10-20 11:35:06');

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
(1, 'Routine', 'Routine tests', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(2, 'Special', 'Special tests', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(3, 'Emergency', 'Emergency tests', '2025-10-20 11:35:06', '2025-10-20 11:35:06');

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
(1, 'Blood', 'Venous blood sample', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(2, 'Urine', 'Urine sample', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(3, 'Saliva', 'Saliva sample', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(4, 'Swab', 'Throat/nasal swab', '2025-10-20 11:35:06', '2025-10-20 11:35:06');

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
(1, 1, 'CBC', 'Complete Blood Count', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(2, 1, 'ESR', 'Erythrocyte Sedimentation Rate', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(3, 2, 'Liver Function Test', 'LFT panel', '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(4, 2, 'Kidney Function Test', 'KFT panel', '2025-10-20 11:35:06', '2025-10-20 11:35:06');

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
(1, 'earum Test 1', 4, 1, 4, 2, 3604.00, 3348.00, 'Room 10', 'Maxime est vel ut sed qui quo cum.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(2, 'sint Test 2', 1, 4, 4, 2, 2690.00, 3704.00, 'Room 4', 'Magnam dolores ut laudantium quibusdam voluptatibus sit sed.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(3, 'aut Test 3', 1, 1, 3, 3, 3916.00, 890.00, 'Room 7', 'Suscipit consequatur ut qui voluptatum et praesentium.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(4, 'vitae Test 4', 1, 2, 3, 3, 2701.00, 2285.00, 'Room 4', 'Aperiam id voluptate ea consequatur.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(5, 'possimus Test 5', 2, 1, 2, 1, 2208.00, 1617.00, 'Room 7', 'Ducimus aspernatur ut incidunt quis voluptatum illo aliquid.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(6, 'ipsum Test 6', 1, 2, 2, 3, 3829.00, 3247.00, 'Room 1', 'Aut reprehenderit rerum ea quidem.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(7, 'aut Test 7', 3, 2, 4, 3, 3724.00, 3238.00, 'Room 6', 'Libero quia suscipit quia delectus.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(8, 'error Test 8', 3, 3, 4, 1, 632.00, 1938.00, 'Room 2', 'Minima ut dolore officia ea ipsam totam non.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(9, 'natus Test 9', 3, 1, 3, 3, 1480.00, 2017.00, 'Room 1', 'Magni quis et quia dolore eos nisi.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(10, 'ipsum Test 10', 1, 3, 1, 2, 607.00, 1521.00, 'Room 10', 'Doloremque nemo quo provident omnis architecto.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(11, 'et Test 11', 2, 1, 2, 1, 1401.00, 352.00, 'Room 3', 'Non dolores earum ullam animi est quae.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(12, 'magni Test 12', 4, 1, 2, 3, 4981.00, 3576.00, 'Room 1', 'Sapiente qui perspiciatis voluptatem non quaerat quasi ad.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(13, 'rerum Test 13', 1, 2, 2, 1, 1615.00, 2463.00, 'Room 7', 'Quis temporibus est id velit harum.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(14, 'porro Test 14', 4, 3, 4, 1, 2930.00, 1755.00, 'Room 4', 'Quae quidem neque quis.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(15, 'assumenda Test 15', 4, 3, 1, 3, 3326.00, 1972.00, 'Room 2', 'Eaque ut voluptates et aut.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(16, 'aliquam Test 16', 4, 2, 1, 2, 848.00, 575.00, 'Room 10', 'Distinctio ut id aspernatur animi dolorum.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(17, 'adipisci Test 17', 1, 4, 3, 2, 2448.00, 688.00, 'Room 1', 'Dolorem molestias ea aliquid veritatis deserunt unde tenetur.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(18, 'id Test 18', 3, 3, 1, 3, 2008.00, 4180.00, 'Room 1', 'Porro fugiat maxime nulla et.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(19, 'cum Test 19', 3, 4, 4, 1, 2463.00, 443.00, 'Room 1', 'Dolor est harum eius ab sed.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(20, 'voluptatem Test 20', 2, 3, 4, 1, 3662.00, 918.00, 'Room 2', 'Veniam officia animi occaecati ducimus consequatur aut provident.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(21, 'molestias Test 21', 3, 4, 2, 3, 3423.00, 717.00, 'Room 9', 'Saepe rerum in quas illo.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(22, 'aut Test 22', 1, 2, 2, 2, 3239.00, 2897.00, 'Room 6', 'Architecto delectus totam sunt dolores.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(23, 'placeat Test 23', 2, 2, 4, 2, 1942.00, 2055.00, 'Room 7', 'Dolorem exercitationem ratione aliquid natus.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(24, 'nihil Test 24', 2, 2, 1, 2, 4193.00, 4298.00, 'Room 4', 'Dolor et praesentium error et.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(25, 'dolores Test 25', 3, 3, 1, 2, 517.00, 872.00, 'Room 9', 'Voluptatibus quod quod maiores inventore earum beatae.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(26, 'et Test 26', 4, 2, 2, 1, 800.00, 1766.00, 'Room 4', 'Libero praesentium laborum sed.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(27, 'non Test 27', 2, 4, 1, 2, 1832.00, 745.00, 'Room 2', 'Aut aut laborum facere aut autem et aliquam.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(28, 'iusto Test 28', 3, 4, 3, 2, 655.00, 1273.00, 'Room 8', 'Autem repellat iste nihil ad.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(29, 'quia Test 29', 2, 1, 2, 1, 4600.00, 2891.00, 'Room 4', 'Omnis numquam occaecati dignissimos eaque adipisci necessitatibus.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(30, 'nihil Test 30', 1, 2, 2, 1, 4405.00, 2360.00, 'Room 8', 'Corrupti omnis similique non repellendus.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(31, 'ex Test 31', 1, 3, 2, 1, 1115.00, 4397.00, 'Room 8', 'Blanditiis omnis et in facere ut in.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(32, 'praesentium Test 32', 4, 2, 2, 1, 4387.00, 2047.00, 'Room 5', 'Eligendi veritatis qui iure facere vel.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(33, 'tempore Test 33', 3, 3, 1, 1, 2546.00, 3442.00, 'Room 1', 'Possimus consectetur sunt voluptas quasi.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(34, 'modi Test 34', 1, 3, 2, 2, 1730.00, 1903.00, 'Room 8', 'Iusto illo non mollitia ea architecto eligendi.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(35, 'pariatur Test 35', 4, 3, 1, 2, 3428.00, 4333.00, 'Room 6', 'Iusto culpa exercitationem vero est qui.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(36, 'autem Test 36', 3, 4, 3, 1, 4379.00, 1629.00, 'Room 5', 'Tempore quidem nulla cum eveniet.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(37, 'sunt Test 37', 2, 3, 4, 3, 3619.00, 3576.00, 'Room 7', 'Tempore nemo tempora illo.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(38, 'aut Test 38', 4, 3, 2, 2, 1443.00, 3994.00, 'Room 6', 'Quam non et animi.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(39, 'velit Test 39', 4, 2, 3, 3, 4383.00, 616.00, 'Room 3', 'Tenetur minus voluptatem et neque rerum vitae.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(40, 'nihil Test 40', 2, 4, 2, 2, 2185.00, 2974.00, 'Room 5', 'Qui esse quia fuga velit quia.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(41, 'harum Test 41', 2, 3, 4, 2, 1552.00, 1168.00, 'Room 5', 'Eveniet eum porro ratione veniam.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(42, 'similique Test 42', 2, 4, 2, 3, 1779.00, 3052.00, 'Room 6', 'Dolor ut dolorum dolorem sed.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(43, 'autem Test 43', 4, 1, 3, 2, 2417.00, 1703.00, 'Room 8', 'Sequi optio cum sed aspernatur.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(44, 'eum Test 44', 3, 1, 1, 3, 3052.00, 944.00, 'Room 10', 'Eligendi culpa odio ducimus ut quo in architecto rerum.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(45, 'aut Test 45', 4, 1, 4, 2, 3919.00, 2314.00, 'Room 7', 'Dicta reprehenderit odit assumenda ut sunt voluptas.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(46, 'dignissimos Test 46', 1, 4, 4, 3, 1162.00, 4081.00, 'Room 10', 'Fugit repellendus maiores eius quo.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(47, 'iure Test 47', 4, 1, 3, 1, 1001.00, 814.00, 'Room 6', 'Rerum necessitatibus distinctio quas quas fugit laudantium rerum.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(48, 'sed Test 48', 3, 1, 2, 3, 2267.00, 1835.00, 'Room 3', 'Et veritatis rerum ducimus aut.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(49, 'quas Test 49', 1, 2, 2, 3, 4430.00, 1894.00, 'Room 2', 'Libero et dicta tempora repellendus eligendi quas sint.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(50, 'iure Test 50', 2, 1, 2, 1, 3128.00, 2832.00, 'Room 5', 'Iure deleniti repellendus magnam incidunt ad dolorum.', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06');

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
(14, '2025_10_16_065016_create_store_tests_table', 1),
(15, '2025_10_16_085053_create_references_table', 1),
(16, '2025_10_16_124830_create_admins_table', 1),
(17, '2025_10_16_124831_create_payment_details_table', 1),
(18, '2025_10_17_044528_create_companies_table', 1),
(19, '2025_10_17_154807_create_beds_table', 1),
(20, '2025_10_17_162645_create_duty_doctors_table', 1),
(21, '2025_10_17_163136_create_diseases_table', 1),
(22, '2025_10_18_113032_create_admission_patients_table', 1),
(23, '2025_10_18_181954_create_admission_bill_summaries_table', 1),
(24, '2025_10_20_153826_create_test_report_details_table', 1);

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
(1, 'LAB2025102011', '2025-10-20', 'Shamim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 12, 12, 12911, 911, 12000, 10000, 1, 2000, 0, 1, 1, '2025-10-20 11:35:49', '2025-10-20 11:35:49');

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
(1, 'Mr. John Smith', 'Consultant', 'john@example.com', '01710000001', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(2, 'Ms. Alice Johnson', 'Lab Manager', 'alice@example.com', '01710000002', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(3, 'Dr. Robert Brown', 'Physician', 'robert@example.com', '01710000003', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(4, 'Dr. Emily Davis', 'Surgeon', 'emily@example.com', '01710000004', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(5, 'Mr. Michael Wilson', 'Technician', 'michael@example.com', '01710000005', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(6, 'Ms. Sophia Taylor', 'Nurse', 'sophia@example.com', '01710000006', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(7, 'Dr. William Martinez', 'Radiologist', 'william@example.com', '01710000007', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(8, 'Dr. Olivia Anderson', 'Oncologist', 'olivia@example.com', '01710000008', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(9, 'Dr. James Thomas', 'Endocrinologist', 'james@example.com', '01710000009', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(10, 'Dr. Isabella Jackson', 'Pediatrician', 'isabella@example.com', '01710000010', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(11, 'Dr. Benjamin White', 'Cardiologist', 'benjamin@example.com', '01710000011', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(12, 'Dr. Mia Harris', 'Neurologist', 'mia@example.com', '01710000012', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(13, 'Dr. Daniel Clark', 'Orthopedic', 'daniel@example.com', '01710000013', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(14, 'Dr. Charlotte Lewis', 'Dermatologist', 'charlotte@example.com', '01710000014', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06'),
(15, 'Dr. Matthew Lee', 'Ophthalmologist', 'matthew@example.com', '01710000015', 1, '2025-10-20 11:35:06', '2025-10-20 11:35:06');

-- --------------------------------------------------------

--
-- Table structure for table `store_tests`
--

CREATE TABLE `store_tests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `regNum` varchar(255) NOT NULL,
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

INSERT INTO `store_tests` (`id`, `regNum`, `testId`, `testprice`, `referprice`, `categoryId`, `subcategoryId`, `specimenId`, `groupId`, `room`, `status`, `reportstatus`, `created_at`, `updated_at`) VALUES
(1, 'LAB2025102011', 1, 3604.00, 3348.00, 4, 1, 4, 2, 'Room 10', 1, 0, '2025-10-20 11:35:36', '2025-10-20 11:35:36'),
(2, 'LAB2025102011', 2, 2690.00, 3704.00, 1, 4, 4, 2, 'Room 4', 1, 0, '2025-10-20 11:35:37', '2025-10-20 11:35:37'),
(3, 'LAB2025102011', 3, 3916.00, 890.00, 1, 1, 3, 3, 'Room 7', 1, 0, '2025-10-20 11:35:37', '2025-10-20 11:35:37'),
(4, 'LAB2025102011', 4, 2701.00, 2285.00, 1, 2, 3, 3, 'Room 4', 1, 0, '2025-10-20 11:35:38', '2025-10-20 11:35:38');

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
(9, 3, 'Bilirubin Total', '0.8', 'mg/dL', '0.2 - 1.2', NULL, NULL, NULL);

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
-- Indexes for table `references`
--
ALTER TABLE `references`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_tests`
--
ALTER TABLE `store_tests`
  ADD PRIMARY KEY (`id`),
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admission_bill_summaries`
--
ALTER TABLE `admission_bill_summaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admission_patients`
--
ALTER TABLE `admission_patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test_report_details`
--
ALTER TABLE `test_report_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_doctorid_foreign` FOREIGN KEY (`doctorId`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `payment_details_referid_foreign` FOREIGN KEY (`referId`) REFERENCES `references` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `payment_details_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `admins` (`id`);

--
-- Constraints for table `store_tests`
--
ALTER TABLE `store_tests`
  ADD CONSTRAINT `store_tests_categoryid_foreign` FOREIGN KEY (`categoryId`) REFERENCES `lab_categories` (`id`),
  ADD CONSTRAINT `store_tests_groupid_foreign` FOREIGN KEY (`groupId`) REFERENCES `lab_groups` (`id`),
  ADD CONSTRAINT `store_tests_specimenid_foreign` FOREIGN KEY (`specimenId`) REFERENCES `lab_specimens` (`id`),
  ADD CONSTRAINT `store_tests_subcategoryid_foreign` FOREIGN KEY (`subcategoryId`) REFERENCES `lab_subcategories` (`id`),
  ADD CONSTRAINT `store_tests_testid_foreign` FOREIGN KEY (`testId`) REFERENCES `lab_tests` (`id`);

--
-- Constraints for table `test_report_details`
--
ALTER TABLE `test_report_details`
  ADD CONSTRAINT `test_report_details_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `lab_tests` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
