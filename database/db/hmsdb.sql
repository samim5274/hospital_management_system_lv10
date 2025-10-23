-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 23, 2025 at 12:14 PM
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
(1, 'SAMIM', 'samim@gmail.com', '$2y$12$MCADF4zAqdJJ4EDlDG4MTuIivOTeDvdW2Tr7tACjjX1xFi3KtJCam', 'admin', 'FTDJRhXD2XC2HNTE4XQTVvITYZgO9fKQZI2LZA9Cy2F8m8YNAZT8rJrORJT4', NULL, NULL);

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
(1, 1, 1665.00, 1500.00, 1500.00, 1500.00, 1500.00, 1500.00, 1500.00, 15000.00, 25665.00, 1665.00, 5000.00, 19000.00, 4000.00, 15000.00, 'IND-2025102111', '2025-10-21', 1, 'Advance Pay date of 21-Oct-2025, Received by : SAMIM, Bill modified by SAMIM, Modify date : 21-Oct-2025. , Patient Discharge by SAMIM, Discharge date : 21-Oct-2025. ', '2025-10-21 06:51:57', '2025-10-21 06:53:00'),
(2, 2, 1285.00, 1500.00, 1500.00, 1500.00, 1500.00, 1500.00, 1500.00, 0.00, 10285.00, 500.00, 0.00, 9785.00, 9000.00, 785.00, 'IND-2025102112', '2025-10-21', 1, 'Bill prepared by SAMIM, Prepared date : 21-Oct-2025', '2025-10-21 06:55:18', '2025-10-21 06:55:18'),
(3, 3, 696.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5000.00, 0.00, 0.00, 2500.00, 0.00, 0.00, 0.00, 'IND-2025102113', '2025-10-21', 1, 'Advance Pay date of 21-Oct-2025, Received by : SAMIM', '2025-10-21 07:00:43', '2025-10-21 07:00:43'),
(4, 4, 898.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50000.00, 0.00, 0.00, 20000.00, 0.00, 0.00, 0.00, 'IND-2025102114', '2025-10-21', 1, 'Advance Pay date of 21-Oct-2025, Received by : SAMIM', '2025-10-21 07:05:58', '2025-10-21 07:05:58'),
(5, 5, 560.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20000.00, 0.00, 0.00, 5000.00, 0.00, 0.00, 0.00, 'IND-2025102115', '2025-10-21', 1, 'Advance Pay date of 21-Oct-2025, Received by : SAMIM', '2025-10-21 07:07:38', '2025-10-21 07:07:38'),
(6, 6, 715.00, 15000.00, 15000.00, 15000.00, 15000.00, 15000.00, 15000.00, 100000.00, 190715.00, 5000.00, 5000.00, 180715.00, 80000.00, 100715.00, 'IND-2025102116', '2025-10-21', 1, 'Advance Pay date of 21-Oct-2025, Received by : SAMIM, Bill modified by SAMIM, Modify date : 21-Oct-2025. , Bill modified by SAMIM, Modify date : 21-Oct-2025. , Bill modified by SAMIM, Modify date : 21-Oct-2025. , Bill modified by SAMIM, Modify date : 21-Oct-2025. , Bill modified by SAMIM, Modify date : 21-Oct-2025. ', '2025-10-21 07:08:28', '2025-10-21 07:21:18');

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
(1, 'IND-2025102111', 'Shamim Hossain', '2001-12-31', 'Male', '01762164746', 'Jamsher Ali', 'Jamsher Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '568974312', 'Contract', 15000.00, 'Conservative', 'NonPackage', 15, 15, 20, 20, 'Mr. Sabrina Akter', '2025-10-21', 21, 1665.00, 1, 2, 'Patient discharged. Date of :21-Oct-2025', '2025-10-21 06:51:43', '2025-10-21 06:53:00'),
(2, 'IND-2025102112', 'Farjana Hossain', '2001-12-31', 'Female', '01762164746', 'Jamsher Ali', 'Jamsher Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '568974312', 'NonContract', 0.00, 'Conservative', 'NonPackage', 15, 15, 20, 20, 'Mr. Sabrina Akter', '2025-10-21', 6, 1285.00, 1, 1, 'N/A', '2025-10-21 06:54:37', '2025-10-21 06:54:37'),
(3, 'IND-2025102113', 'Rafic Hossain', '2001-12-31', 'Male', '01762164746', 'Jamsher Ali', 'Jamsher Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '568974312', 'Contract', 5000.00, 'Operative', 'Package', 15, 15, 20, 20, 'Mr. Sabrina Akter', '2025-10-21', 27, 696.00, 1, 1, 'N/A', '2025-10-21 07:00:15', '2025-10-21 07:00:15'),
(4, 'IND-2025102114', 'Rahim', '2001-12-31', 'Male', '01762164746', 'Jamsher Ali', 'Jamsher Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '568974312', 'Contract', 50000.00, 'Operative', 'Package', 15, 15, 20, 20, 'Mr. Sabrina Akter', '2025-10-21', 23, 898.00, 1, 1, 'N/A', '2025-10-21 07:05:45', '2025-10-21 07:05:45'),
(5, 'IND-2025102115', 'Emran', '2001-12-31', 'Male', '01762164746', 'Jamsher Ali', 'Jamsher Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '568974312', 'Contract', 20000.00, 'Operative', 'Package', 15, 15, 20, 20, 'Mr. Sabrina Akter', '2025-10-21', 32, 560.00, 1, 1, 'N/A', '2025-10-21 07:07:28', '2025-10-21 07:07:28'),
(6, 'IND-2025102116', 'Moen', '2001-12-31', 'Male', '01762164746', 'Jamsher Ali', 'Jamsher Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '568974312', 'Contract', 100000.00, 'Operative', 'Package', 15, 15, 20, 20, 'Mr. Sabrina Akter', '2025-10-21', 33, 715.00, 1, 1, 'N/A', '2025-10-21 07:08:14', '2025-10-21 07:08:14');

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
(1, 'B001', 'Female Ward', 'available', 1483.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(2, 'B002', 'Male Ward', 'available', 730.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(3, 'B003', 'Female Ward', 'available', 1550.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(4, 'B004', 'Female Ward', 'available', 1996.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(5, 'B005', 'Cabin', 'available', 1064.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(6, 'B006', 'Cabin', 'booked', 1285.00, '2025-10-21 05:29:48', '2025-10-21 06:54:37'),
(7, 'B007', 'Female Ward', 'available', 1245.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(8, 'B008', 'Emergency', 'available', 1842.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(9, 'B009', 'Emergency', 'available', 1900.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(10, 'B010', 'Female Ward', 'available', 1377.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(11, 'B011', 'Female Ward', 'available', 1146.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(12, 'B012', 'Female Ward', 'available', 1813.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(13, 'B013', 'Emergency', 'available', 1133.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(14, 'B014', 'Cabin', 'available', 1010.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(15, 'B015', 'ICU', 'available', 576.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(16, 'B016', 'Male Ward', 'available', 1444.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(17, 'B017', 'Emergency', 'available', 1069.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(18, 'B018', 'ICU', 'available', 1956.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(19, 'B019', 'Female Ward', 'available', 1558.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(20, 'B020', 'ICU', 'available', 967.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(21, 'B021', 'Female Ward', 'booked', 1665.00, '2025-10-21 05:29:48', '2025-10-21 06:51:43'),
(22, 'B022', 'ICU', 'available', 1537.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(23, 'B023', 'Emergency', 'booked', 898.00, '2025-10-21 05:29:48', '2025-10-21 07:05:45'),
(24, 'B024', 'Male Ward', 'available', 1457.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(25, 'B025', 'Cabin', 'available', 1459.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(26, 'B026', 'Cabin', 'available', 1815.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(27, 'B027', 'Female Ward', 'booked', 696.00, '2025-10-21 05:29:48', '2025-10-21 07:00:15'),
(28, 'B028', 'Male Ward', 'available', 1297.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(29, 'B029', 'Male Ward', 'available', 657.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(30, 'B030', 'Cabin', 'available', 1940.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(31, 'B031', 'Emergency', 'available', 1775.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(32, 'B032', 'Emergency', 'booked', 560.00, '2025-10-21 05:29:48', '2025-10-21 07:07:28'),
(33, 'B033', 'Cabin', 'booked', 715.00, '2025-10-21 05:29:48', '2025-10-21 07:08:14'),
(34, 'B034', 'Cabin', 'available', 1871.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(35, 'B035', 'Male Ward', 'available', 887.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(36, 'B036', 'Cabin', 'available', 1789.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(37, 'B037', 'ICU', 'available', 1650.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(38, 'B038', 'Emergency', 'available', 1098.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(39, 'B039', 'Emergency', 'available', 672.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(40, 'B040', 'ICU', 'available', 1500.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(41, 'B041', 'Cabin', 'available', 1264.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(42, 'B042', 'Male Ward', 'available', 1241.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(43, 'B043', 'Male Ward', 'available', 1148.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(44, 'B044', 'Male Ward', 'available', 1770.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(45, 'B045', 'Cabin', 'available', 676.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(46, 'B046', 'Male Ward', 'available', 1707.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(47, 'B047', 'Male Ward', 'available', 1833.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(48, 'B048', 'ICU', 'available', 642.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(49, 'B049', 'Female Ward', 'available', 1987.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(50, 'B050', 'Emergency', 'available', 1324.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(51, 'B051', 'Female Ward', 'available', 1609.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(52, 'B052', 'Cabin', 'available', 1132.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(53, 'B053', 'Emergency', 'available', 1270.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(54, 'B054', 'Cabin', 'available', 1557.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(55, 'B055', 'Cabin', 'available', 1765.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(56, 'B056', 'Emergency', 'available', 966.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(57, 'B057', 'ICU', 'available', 1257.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(58, 'B058', 'ICU', 'available', 587.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(59, 'B059', 'Cabin', 'available', 726.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(60, 'B060', 'Male Ward', 'available', 1945.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(61, 'B061', 'Female Ward', 'available', 656.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(62, 'B062', 'Female Ward', 'available', 1068.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(63, 'B063', 'Male Ward', 'available', 1894.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(64, 'B064', 'Cabin', 'available', 886.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(65, 'B065', 'Cabin', 'available', 756.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(66, 'B066', 'Male Ward', 'available', 1769.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(67, 'B067', 'Female Ward', 'available', 1626.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(68, 'B068', 'Emergency', 'available', 1214.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(69, 'B069', 'ICU', 'available', 1404.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(70, 'B070', 'Emergency', 'available', 701.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(71, 'B071', 'Cabin', 'available', 786.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(72, 'B072', 'Male Ward', 'available', 1341.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(73, 'B073', 'Male Ward', 'available', 1653.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(74, 'B074', 'ICU', 'available', 711.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(75, 'B075', 'Male Ward', 'available', 1035.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(76, 'B076', 'Male Ward', 'available', 956.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(77, 'B077', 'Female Ward', 'available', 1430.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(78, 'B078', 'Male Ward', 'available', 593.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(79, 'B079', 'Female Ward', 'available', 1126.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(80, 'B080', 'Emergency', 'available', 1136.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(81, 'B081', 'ICU', 'available', 1286.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(82, 'B082', 'Female Ward', 'available', 1180.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(83, 'B083', 'Emergency', 'available', 1743.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(84, 'B084', 'ICU', 'available', 1022.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(85, 'B085', 'Male Ward', 'available', 1538.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(86, 'B086', 'Emergency', 'available', 773.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(87, 'B087', 'Emergency', 'available', 790.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(88, 'B088', 'ICU', 'available', 1942.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(89, 'B089', 'Male Ward', 'available', 1969.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(90, 'B090', 'ICU', 'available', 1948.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(91, 'B091', 'Cabin', 'available', 651.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(92, 'B092', 'ICU', 'available', 503.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(93, 'B093', 'Cabin', 'available', 1244.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(94, 'B094', 'Male Ward', 'available', 1149.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(95, 'B095', 'Female Ward', 'available', 654.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(96, 'B096', 'Cabin', 'available', 1984.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(97, 'B097', 'Emergency', 'available', 1683.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(98, 'B098', 'Cabin', 'available', 1348.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(99, 'B099', 'Cabin', 'available', 1760.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(100, 'B100', 'Emergency', 'available', 786.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(101, 'B101', 'ICU', 'available', 1367.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(102, 'B102', 'Emergency', 'available', 577.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(103, 'B103', 'Male Ward', 'available', 1024.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(104, 'B104', 'Emergency', 'available', 1356.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(105, 'B105', 'Emergency', 'available', 1883.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(106, 'B106', 'ICU', 'available', 713.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(107, 'B107', 'Female Ward', 'available', 1100.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(108, 'B108', 'Male Ward', 'available', 792.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(109, 'B109', 'Emergency', 'available', 1655.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(110, 'B110', 'Male Ward', 'available', 1269.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(111, 'B111', 'Female Ward', 'available', 1478.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(112, 'B112', 'Emergency', 'available', 1108.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(113, 'B113', 'Male Ward', 'available', 825.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(114, 'B114', 'Female Ward', 'available', 1899.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(115, 'B115', 'Cabin', 'available', 1452.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(116, 'B116', 'Female Ward', 'available', 727.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(117, 'B117', 'ICU', 'available', 581.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(118, 'B118', 'Emergency', 'available', 924.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(119, 'B119', 'Emergency', 'available', 927.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(120, 'B120', 'Female Ward', 'available', 1350.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(121, 'B121', 'Emergency', 'available', 1571.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(122, 'B122', 'ICU', 'available', 770.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(123, 'B123', 'Female Ward', 'available', 1085.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(124, 'B124', 'Male Ward', 'available', 1069.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(125, 'B125', 'Cabin', 'available', 1946.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(126, 'B126', 'Cabin', 'available', 652.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(127, 'B127', 'Cabin', 'available', 1191.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(128, 'B128', 'Cabin', 'available', 1550.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(129, 'B129', 'ICU', 'available', 936.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(130, 'B130', 'Cabin', 'available', 1051.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(131, 'B131', 'Emergency', 'available', 1978.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(132, 'B132', 'Cabin', 'available', 564.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(133, 'B133', 'Female Ward', 'available', 1241.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(134, 'B134', 'Female Ward', 'available', 1930.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(135, 'B135', 'Cabin', 'available', 1423.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(136, 'B136', 'Male Ward', 'available', 559.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(137, 'B137', 'Female Ward', 'available', 1154.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(138, 'B138', 'ICU', 'available', 1521.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(139, 'B139', 'ICU', 'available', 541.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(140, 'B140', 'Cabin', 'available', 1846.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(141, 'B141', 'Cabin', 'available', 1548.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(142, 'B142', 'Emergency', 'available', 1033.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(143, 'B143', 'Male Ward', 'available', 1252.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(144, 'B144', 'Male Ward', 'available', 1658.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(145, 'B145', 'Male Ward', 'available', 1816.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(146, 'B146', 'Emergency', 'available', 1557.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(147, 'B147', 'Male Ward', 'available', 1253.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(148, 'B148', 'Cabin', 'available', 614.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(149, 'B149', 'Male Ward', 'available', 752.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(150, 'B150', 'ICU', 'available', 977.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(151, 'B151', 'Emergency', 'available', 1926.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(152, 'B152', 'Male Ward', 'available', 1106.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(153, 'B153', 'ICU', 'available', 1259.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(154, 'B154', 'Emergency', 'available', 1624.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(155, 'B155', 'Female Ward', 'available', 1062.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(156, 'B156', 'Male Ward', 'available', 1423.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(157, 'B157', 'Cabin', 'available', 1275.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(158, 'B158', 'Emergency', 'available', 1731.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(159, 'B159', 'Female Ward', 'available', 1099.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(160, 'B160', 'Emergency', 'available', 687.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(161, 'B161', 'ICU', 'available', 1306.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(162, 'B162', 'Emergency', 'available', 1516.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(163, 'B163', 'ICU', 'available', 622.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(164, 'B164', 'ICU', 'available', 772.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(165, 'B165', 'Female Ward', 'available', 906.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(166, 'B166', 'Female Ward', 'available', 611.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(167, 'B167', 'Emergency', 'available', 1750.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(168, 'B168', 'Male Ward', 'available', 1789.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(169, 'B169', 'Emergency', 'available', 1842.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(170, 'B170', 'Male Ward', 'available', 1238.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(171, 'B171', 'Male Ward', 'available', 649.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(172, 'B172', 'ICU', 'available', 618.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(173, 'B173', 'Emergency', 'available', 1467.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(174, 'B174', 'ICU', 'available', 1334.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(175, 'B175', 'ICU', 'available', 1409.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(176, 'B176', 'Male Ward', 'available', 616.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(177, 'B177', 'Female Ward', 'available', 1770.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(178, 'B178', 'Cabin', 'available', 1406.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(179, 'B179', 'Emergency', 'available', 1776.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(180, 'B180', 'ICU', 'available', 706.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(181, 'B181', 'Female Ward', 'available', 535.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(182, 'B182', 'Female Ward', 'available', 1454.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(183, 'B183', 'Male Ward', 'available', 740.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(184, 'B184', 'Cabin', 'available', 1776.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(185, 'B185', 'Emergency', 'available', 1135.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(186, 'B186', 'ICU', 'available', 1705.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(187, 'B187', 'Female Ward', 'available', 611.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(188, 'B188', 'Female Ward', 'available', 1776.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(189, 'B189', 'Cabin', 'available', 1321.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(190, 'B190', 'ICU', 'available', 1493.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(191, 'B191', 'Cabin', 'available', 887.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(192, 'B192', 'Female Ward', 'available', 1669.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(193, 'B193', 'ICU', 'available', 1290.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(194, 'B194', 'Male Ward', 'available', 1381.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(195, 'B195', 'ICU', 'available', 884.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(196, 'B196', 'Male Ward', 'available', 1379.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(197, 'B197', 'Emergency', 'available', 1685.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(198, 'B198', 'Emergency', 'available', 1520.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(199, 'B199', 'Male Ward', 'available', 1981.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(200, 'B200', 'Female Ward', 'available', 1826.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(201, 'B201', 'Male Ward', 'available', 1129.00, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(202, 'B202', 'ICU', 'available', 990.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(203, 'B203', 'Cabin', 'available', 1630.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(204, 'B204', 'Female Ward', 'available', 1119.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(205, 'B205', 'Male Ward', 'available', 981.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(206, 'B206', 'Female Ward', 'available', 1062.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(207, 'B207', 'ICU', 'available', 1883.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(208, 'B208', 'Cabin', 'available', 1296.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(209, 'B209', 'Emergency', 'available', 1036.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(210, 'B210', 'Cabin', 'available', 1763.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(211, 'B211', 'Cabin', 'available', 944.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(212, 'B212', 'Emergency', 'available', 733.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(213, 'B213', 'Cabin', 'available', 1897.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(214, 'B214', 'Female Ward', 'available', 1193.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(215, 'B215', 'Female Ward', 'available', 1875.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(216, 'B216', 'Emergency', 'available', 1521.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(217, 'B217', 'Female Ward', 'available', 1646.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(218, 'B218', 'Female Ward', 'available', 850.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(219, 'B219', 'Male Ward', 'available', 854.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(220, 'B220', 'ICU', 'available', 625.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(221, 'B221', 'Male Ward', 'available', 1099.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(222, 'B222', 'Emergency', 'available', 1280.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(223, 'B223', 'ICU', 'available', 878.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(224, 'B224', 'Male Ward', 'available', 777.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(225, 'B225', 'Cabin', 'available', 1921.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(226, 'B226', 'Cabin', 'available', 1939.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(227, 'B227', 'Female Ward', 'available', 1538.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(228, 'B228', 'ICU', 'available', 982.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(229, 'B229', 'ICU', 'available', 1621.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(230, 'B230', 'ICU', 'available', 920.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(231, 'B231', 'Emergency', 'available', 800.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(232, 'B232', 'Emergency', 'available', 754.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(233, 'B233', 'ICU', 'available', 1018.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(234, 'B234', 'Emergency', 'available', 1384.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(235, 'B235', 'Cabin', 'available', 1350.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(236, 'B236', 'Cabin', 'available', 1149.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(237, 'B237', 'Female Ward', 'available', 1639.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(238, 'B238', 'ICU', 'available', 641.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(239, 'B239', 'Emergency', 'available', 841.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(240, 'B240', 'Cabin', 'available', 1937.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(241, 'B241', 'ICU', 'available', 1171.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(242, 'B242', 'Female Ward', 'available', 1878.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(243, 'B243', 'Emergency', 'available', 1599.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(244, 'B244', 'ICU', 'available', 1550.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(245, 'B245', 'Cabin', 'available', 1231.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(246, 'B246', 'Male Ward', 'available', 1638.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(247, 'B247', 'Emergency', 'available', 1153.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(248, 'B248', 'Female Ward', 'available', 1408.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(249, 'B249', 'ICU', 'available', 639.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(250, 'B250', 'Male Ward', 'available', 1723.00, '2025-10-21 05:29:49', '2025-10-21 05:29:49');

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
(1, 'Al-Nur Genarel Hospital', 'Kaliakair, Gazipur, Dhaka-1750', 'alnur@gmail.com', '01762174746', 'www.alnurhospital.com', '2025-10-18 23:08:01', '2025-10-18 23:08:01');

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
(1, 'Diabetes Mellitus', 'A metabolic disorder causing high blood sugar levels.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(2, 'Hypertension', 'High blood pressure condition.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(3, 'Asthma', 'A chronic lung disease causing breathing difficulty.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(4, 'Heart Disease', 'Conditions affecting the heart and blood vessels.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(5, 'Arthritis', 'Inflammation of the joints causing pain and stiffness.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(6, 'Migraine', 'Severe recurring headaches often with nausea.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(7, 'Tuberculosis', 'An infectious disease mainly affecting the lungs.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(8, 'Pneumonia', 'Infection that inflames the air sacs in one or both lungs.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(9, 'Covid-19', 'Respiratory illness caused by SARS-CoV-2 virus.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(10, 'Hepatitis B', 'A viral infection that affects the liver.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(11, 'Typhoid Fever', 'Bacterial infection caused by Salmonella typhi.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(12, 'Malaria', 'Mosquito-borne infectious disease affecting red blood cells.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(13, 'Dengue Fever', 'Viral infection spread by Aedes mosquitoes.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(14, 'Gastritis', 'Inflammation of the stomach lining.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(15, 'Ulcer', 'Open sores on the stomach or intestinal lining.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(16, 'Cancer', 'Abnormal cell growth that can spread to other parts of the body.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(17, 'Jaundice', 'Yellowing of the skin and eyes due to liver problems.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(18, 'Influenza', 'Common viral infection causing fever and sore throat.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(19, 'Kidney Stone', 'Hard deposits of minerals in the kidneys.', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(20, 'Anemia', 'Low red blood cell count causing fatigue.', '2025-10-21 05:29:49', '2025-10-21 05:29:49');

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
(1, 'Dr. John Smith', 'Cardiologist', '01710000001', 'john.smith@example.com', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(2, 'Dr. Alice Johnson', 'Neurologist', '01710000002', 'alice.johnson@example.com', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(3, 'Dr. Robert Brown', 'Pediatrician', '01710000003', 'robert.brown@example.com', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(4, 'Dr. Emily Davis', 'Dermatologist', '01710000004', 'emily.davis@example.com', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(5, 'Dr. Michael Wilson', 'Orthopedic', '01710000005', 'michael.wilson@example.com', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(6, 'Dr. Sophia Taylor', 'Gynecologist', '01710000006', 'sophia.taylor@example.com', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(7, 'Dr. William Martinez', 'ENT Specialist', '01710000007', 'william.martinez@example.com', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(8, 'Dr. Olivia Anderson', 'Oncologist', '01710000008', 'olivia.anderson@example.com', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(9, 'Dr. James Thomas', 'Radiologist', '01710000009', 'james.thomas@example.com', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(10, 'Dr. Isabella Jackson', 'Endocrinologist', '01710000010', 'isabella.jackson@example.com', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(11, 'Dr. Benjamin White', 'Urologist', '01710000011', 'benjamin.white@example.com', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(12, 'Dr. Mia Harris', 'Gastroenterologist', '01710000012', 'mia.harris@example.com', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(13, 'Dr. Daniel Clark', 'Pulmonologist', '01710000013', 'daniel.clark@example.com', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(14, 'Dr. Charlotte Lewis', 'Nephrologist', '01710000014', 'charlotte.lewis@example.com', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(15, 'Dr. Matthew Lee', 'Ophthalmologist', '01710000015', 'matthew.lee@example.com', '2025-10-21 05:29:47', '2025-10-21 05:29:47');

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
(1, 'Dr. Ayesha Karim', 'Cardiology', '01710000001', 'ayesha@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(2, 'Dr. Rahat Hossain', 'Orthopedics', '01710000002', 'rahat@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(3, 'Dr. Tanvir Alam', 'Neurology', '01710000003', 'tanvir@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(4, 'Dr. Nusrat Jahan', 'Gynecology', '01710000004', 'nusrat@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(5, 'Dr. Mamun Rahman', 'Medicine', '01710000005', 'mamun@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(6, 'Dr. Farhana Ahmed', 'Dermatology', '01710000006', 'farhana@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(7, 'Dr. Shahidul Islam', 'ENT', '01710000007', 'shahidul@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(8, 'Dr. Sabrina Akter', 'Cardiology', '01710000008', 'sabrina@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(9, 'Dr. Tareq Hasan', 'Urology', '01710000009', 'tareq@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(10, 'Dr. Rafiq Mahmud', 'Medicine', '01710000010', 'rafiq@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(11, 'Dr. Mahiya Sultana', 'Gynecology', '01710000011', 'mahiya@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(12, 'Dr. Hasan Chowdhury', 'Orthopedics', '01710000012', 'hasan@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(13, 'Dr. Sumaiya Rahman', 'Dermatology', '01710000013', 'sumaiya@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(14, 'Dr. Arif Mahmud', 'Cardiology', '01710000014', 'arif@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(15, 'Dr. Nayeem Islam', 'ENT', '01710000015', 'nayeem@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(16, 'Dr. Rima Akter', 'Neurology', '01710000016', 'rima@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(17, 'Dr. Omar Faruk', 'Medicine', '01710000017', 'omar@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(18, 'Dr. Sadiya Hossain', 'Gynecology', '01710000018', 'sadiya@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(19, 'Dr. Kamrul Hasan', 'Cardiology', '01710000019', 'kamrul@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49'),
(20, 'Dr. Rashedul Islam', 'Urology', '01710000020', 'rashed@example.com', '2025-10-21 05:29:49', '2025-10-21 05:29:49');

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
(1, 'Paracetamol', NULL, '2025-10-22 22:57:39'),
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
(1, 'Hematology', 'Blood related tests', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(2, 'Biochemistry', 'Chemical analysis tests', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(3, 'Microbiology', 'Bacteria and virus tests', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(4, 'Immunology', 'Immune system tests', '2025-10-21 05:29:47', '2025-10-21 05:29:47');

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
(1, 'Routine', 'Routine tests', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(2, 'Special', 'Special tests', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(3, 'Emergency', 'Emergency tests', '2025-10-21 05:29:47', '2025-10-21 05:29:47');

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
(1, 'Blood', 'Venous blood sample', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(2, 'Urine', 'Urine sample', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(3, 'Saliva', 'Saliva sample', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(4, 'Swab', 'Throat/nasal swab', '2025-10-21 05:29:47', '2025-10-21 05:29:47');

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
(1, 1, 'CBC', 'Complete Blood Count', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(2, 1, 'ESR', 'Erythrocyte Sedimentation Rate', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(3, 2, 'Liver Function Test', 'LFT panel', '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(4, 2, 'Kidney Function Test', 'KFT panel', '2025-10-21 05:29:47', '2025-10-21 05:29:47');

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
(1, 'CBC Test', 4, 4, 4, 3, 650.00, 3040.00, 'Room 2', 'Nihil aut voluptatem est esse.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(2, 'Thyroid Function Test', 1, 3, 4, 1, 1577.00, 2134.00, 'Room 1', 'Qui quia rerum laudantium sunt est omnis praesentium.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(3, 'Liver Function Test', 1, 3, 1, 3, 839.00, 653.00, 'Room 5', 'Reprehenderit deleniti molestiae rem neque alias inventore blanditiis.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(4, 'Kidney Function Test', 2, 2, 1, 2, 2432.00, 2112.00, 'Room 5', 'Tempora quia sed quia suscipit sunt et.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(5, 'Lipid Profile', 2, 3, 4, 1, 1644.00, 2470.00, 'Room 3', 'Ut sit consectetur aut ea unde alias.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(6, 'Blood Sugar Test', 2, 4, 2, 1, 3666.00, 4095.00, 'Room 9', 'Vel et quod optio magnam ipsam quam.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(7, 'Urine Routine Test', 2, 2, 4, 2, 2225.00, 3094.00, 'Room 3', 'Illum voluptas odit sit et ad maxime alias.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(8, 'Electrolyte Test', 1, 4, 2, 2, 1648.00, 1618.00, 'Room 3', 'Perferendis praesentium iusto iure atque.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(9, 'Pulmonary Function Test', 1, 4, 4, 1, 4364.00, 1694.00, 'Room 3', 'Ducimus id voluptatum beatae qui cumque.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(10, 'ECG Test', 1, 1, 4, 1, 4493.00, 4344.00, 'Room 1', 'Porro ut voluptatum voluptates vero ipsum fugit provident.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(11, 'Eye Test', 2, 1, 3, 2, 2672.00, 2903.00, 'Room 4', 'Pariatur sed eos illum quasi consequatur accusamus.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(12, 'Brain MRI', 1, 1, 2, 2, 4060.00, 1587.00, 'Room 4', 'Sunt voluptas optio et quam dicta.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(13, 'Cardiac Enzyme Test', 1, 2, 1, 3, 4306.00, 3635.00, 'Room 10', 'Et quibusdam corporis ab.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(14, 'Dengue Test', 4, 1, 4, 2, 3169.00, 3538.00, 'Room 1', 'Ipsum impedit qui possimus nemo ut nesciunt deserunt.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(15, 'Malaria Test', 4, 1, 4, 3, 4045.00, 493.00, 'Room 7', 'Iusto molestias inventore omnis excepturi autem excepturi.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(16, 'Vitamin D Test', 4, 2, 1, 3, 2736.00, 1342.00, 'Room 5', 'Laudantium alias id dicta saepe qui enim ea.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(17, 'Vitamin B12 Test', 4, 1, 4, 3, 3073.00, 4457.00, 'Room 2', 'Consectetur at maxime et laborum quia voluptatibus et et.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(18, 'Iron Test', 1, 2, 4, 2, 3174.00, 3956.00, 'Room 4', 'Quae distinctio repellendus consequatur consequuntur dolorem quae officia.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(19, 'Ferritin Test', 2, 3, 2, 1, 4418.00, 3113.00, 'Room 2', 'Qui sint quibusdam ut quia.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(20, 'Uric Acid Test', 2, 2, 4, 3, 3340.00, 2501.00, 'Room 9', 'Eos consequatur consequuntur eaque eligendi sequi magnam velit.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(21, 'ESR Test', 1, 4, 4, 3, 2329.00, 1025.00, 'Room 7', 'Incidunt velit recusandae aut.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(22, 'RBC Count Test', 1, 2, 2, 1, 2024.00, 2525.00, 'Room 7', 'Dolorem et sed voluptates error nobis quam.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(23, 'PCV Test', 3, 4, 1, 3, 3692.00, 3405.00, 'Room 4', 'Rem facere et blanditiis vero nam quasi accusamus.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(24, 'MCH Test', 4, 1, 3, 2, 1074.00, 4060.00, 'Room 5', 'Quia facilis velit sit unde id.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(25, 'MCHC Test', 2, 2, 1, 1, 602.00, 1556.00, 'Room 8', 'Et dolorem recusandae earum corrupti ut.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(26, 'RDW Test', 3, 3, 1, 2, 2384.00, 974.00, 'Room 1', 'Distinctio aut sed deleniti mollitia.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(27, 'Neutrophils Test', 2, 1, 4, 2, 763.00, 4445.00, 'Room 7', 'Aut eligendi fugit facilis enim.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(28, 'Lymphocytes Test', 3, 4, 3, 3, 2602.00, 3710.00, 'Room 4', 'Ea aperiam autem ex voluptatem repellendus.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(29, 'Monocytes Test', 2, 4, 4, 2, 1489.00, 3812.00, 'Room 1', 'Illum quasi voluptatem perferendis nemo perferendis.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(30, 'Eosinophils Test', 1, 2, 1, 3, 3075.00, 3693.00, 'Room 5', 'Ipsam qui fugiat beatae ad.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(31, 'Basophils Test', 2, 1, 4, 1, 1367.00, 3029.00, 'Room 5', 'Reiciendis est esse iusto nisi enim sunt sunt.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(32, 'Prothrombin Time Test', 3, 3, 1, 1, 1826.00, 3467.00, 'Room 7', 'Magnam debitis tempore esse sunt.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(33, 'INR Test', 1, 4, 1, 2, 4200.00, 3579.00, 'Room 2', 'Ut molestias voluptatem ratione.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(34, 'aPTT Test', 3, 2, 1, 1, 2623.00, 523.00, 'Room 4', 'Odio minus repudiandae quo.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(35, 'HIV 1 & 2 Test', 2, 4, 3, 3, 4057.00, 817.00, 'Room 10', 'Voluptas sint quia voluptatibus tempore qui.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(36, 'HCV Antibody Test', 2, 3, 4, 1, 3780.00, 498.00, 'Room 2', 'Ut id placeat voluptatum necessitatibus eaque.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(37, 'HbA1c Test', 1, 1, 2, 1, 3050.00, 4162.00, 'Room 9', 'Fuga molestias ipsum corporis unde optio minus.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(38, 'Blood Group Test', 3, 1, 4, 1, 3337.00, 4496.00, 'Room 5', 'Quos eos voluptas consequatur laboriosam est dolor suscipit.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(39, 'Pregnancy Test', 1, 2, 3, 3, 4246.00, 1278.00, 'Room 2', 'Non voluptates atque deleniti aut.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(40, 'Stool Occult Blood Test', 3, 4, 4, 1, 3153.00, 324.00, 'Room 6', 'Exercitationem atque doloribus fugiat vel nulla quis.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(41, 'Amylase Test', 1, 2, 1, 1, 675.00, 4475.00, 'Room 2', 'Atque est et et ratione.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(42, 'Lipase Test', 3, 1, 3, 3, 4840.00, 3737.00, 'Room 3', 'Velit laborum et accusamus inventore.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(43, 'LDH Test', 3, 3, 4, 3, 4576.00, 2821.00, 'Room 3', 'Nam quidem culpa exercitationem sed dolor.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(44, 'GGT Test', 4, 1, 2, 1, 4055.00, 4269.00, 'Room 2', 'Velit autem quae quidem explicabo consequatur voluptatem.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(45, 'Phosphorus Test', 4, 3, 4, 2, 4837.00, 3105.00, 'Room 2', 'Quisquam voluptatum dolor ipsa ducimus.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(46, 'Magnesium Test', 4, 4, 4, 3, 969.00, 2418.00, 'Room 6', 'Impedit nobis et laudantium fugiat ut officia.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(47, 'Zinc Test', 2, 2, 4, 2, 3293.00, 4489.00, 'Room 5', 'Enim enim veritatis pariatur repudiandae tenetur quo.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(48, 'Copper Test', 4, 4, 1, 3, 3889.00, 2407.00, 'Room 1', 'Assumenda repellendus eius voluptate excepturi iste odio.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(49, 'Insulin (Fasting) Test', 1, 2, 4, 1, 1547.00, 2885.00, 'Room 10', 'Cupiditate nulla ipsa ipsam in non adipisci nulla.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(50, 'Cortisol (Morning) Test', 4, 1, 3, 2, 3894.00, 3755.00, 'Room 5', 'At architecto maxime qui.', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47');

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
(24, '2025_10_20_153826_create_test_report_details_table', 1),
(25, '2025_10_21_103401_create_patient_test_reports_table', 1),
(34, '2025_10_21_143623_create_units_table', 2),
(35, '2025_10_21_143701_create_generics_table', 2),
(36, '2025_10_21_143740_create_presentations_table', 2),
(37, '2025_10_21_143850_create_reagents_table', 2),
(38, '2025_10_23_114129_create_reagent_stocks_table', 2),
(39, '2025_10_23_115839_create_reagent_test_table', 2);

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
(30, 'LAB2025102111', 1, 1, 'Hemoglobin', '14.2', 'g/dL', '13.0 - 17.0', NULL, NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(31, 'LAB2025102111', 1, 1, 'WBC Count', '6.5', '×10³/µL', '4.0 - 11.0', NULL, NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(32, 'LAB2025102111', 1, 1, 'Platelet Count', '230', '×10³/µL', '150 - 400', NULL, NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(33, 'LAB2025102111', 1, 2, 'T3', '1.3', 'ng/mL', '0.8 - 2.0', 'Normal thyroid function', NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(34, 'LAB2025102111', 1, 2, 'T4', '8.2', 'µg/dL', '5.0 - 12.0', 'Normal thyroid function', NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(35, 'LAB2025102111', 1, 2, 'TSH', '2.7', 'µIU/mL', '0.4 - 4.0', 'Normal thyroid function', NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(36, 'LAB2025102111', 1, 3, 'SGPT (ALT)', '32', 'U/L', '0 - 45', NULL, NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(37, 'LAB2025102111', 1, 3, 'SGOT (AST)', '28', 'U/L', '0 - 40', NULL, NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(38, 'LAB2025102111', 1, 3, 'Bilirubin Total', '0.8', 'mg/dL', '0.2 - 1.2', NULL, NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(39, 'LAB2025102111', 1, 4, 'Urea', '35', 'mg/dL', '15 - 45', NULL, NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(40, 'LAB2025102111', 1, 4, 'Creatinine', '1.1', 'mg/dL', '0.7 - 1.4', NULL, NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(41, 'LAB2025102111', 1, 5, 'Cholesterol Total', '180', 'mg/dL', '<200', NULL, NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(42, 'LAB2025102111', 1, 5, 'HDL', '52', 'mg/dL', '>40', NULL, NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(43, 'LAB2025102111', 1, 5, 'LDL', '110', 'mg/dL', '<130', NULL, NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(44, 'LAB2025102111', 1, 5, 'Triglycerides', '145', 'mg/dL', '<150', NULL, NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(45, 'LAB2025102111', 1, 6, 'Fasting Blood Sugar', '92', 'mg/dL', '70 - 100', NULL, NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(46, 'LAB2025102111', 1, 6, 'Postprandial Blood Sugar', '128', 'mg/dL', '<140', NULL, NULL, '2025-10-21 05:34:57', '2025-10-21 05:34:57'),
(47, 'LAB2025102112', 2, 7, 'pH', '6.5', NULL, '4.5 - 8.0', NULL, NULL, '2025-10-21 05:35:00', '2025-10-21 05:35:00'),
(48, 'LAB2025102112', 2, 7, 'Protein', 'Negative', NULL, 'Negative', NULL, 'G/D', '2025-10-21 05:35:00', '2025-10-21 06:45:20'),
(49, 'LAB2025102112', 2, 7, 'Glucose', 'Negative', NULL, 'Negative', NULL, NULL, '2025-10-21 05:35:00', '2025-10-21 05:35:00'),
(50, 'LAB2025102112', 2, 8, 'Sodium', '138', 'mmol/L', '135 - 145', NULL, NULL, '2025-10-21 05:35:00', '2025-10-21 05:35:00'),
(51, 'LAB2025102112', 2, 8, 'Potassium', '4.2', 'mmol/L', '3.5 - 5.1', NULL, NULL, '2025-10-21 05:35:00', '2025-10-21 05:35:00'),
(52, 'LAB2025102112', 2, 8, 'Chloride', '103', 'mmol/L', '98 - 107', NULL, NULL, '2025-10-21 05:35:00', '2025-10-21 05:35:00'),
(53, 'LAB2025102112', 2, 9, 'FEV1', '3.6', 'L', '>2.5', '2.5', 'Normal', '2025-10-21 05:35:00', '2025-10-21 06:10:09'),
(54, 'LAB2025102112', 2, 9, 'FVC', '2.9', 'L', '>3.0', NULL, 'Normal', '2025-10-21 05:35:00', '2025-10-21 06:09:55'),
(55, 'LAB2025102112', 2, 10, 'Heart Rate', '78', 'bpm', '60 - 100', NULL, NULL, '2025-10-21 05:35:00', '2025-10-21 05:35:00'),
(56, 'LAB2025102112', 2, 10, 'QRS Duration', '85', 'ms', '70 - 110', NULL, NULL, '2025-10-21 05:35:00', '2025-10-21 05:35:00'),
(57, 'LAB2025102112', 2, 11, 'Vision (Left)', '6/6', NULL, '6/6', NULL, NULL, '2025-10-21 05:35:00', '2025-10-21 05:35:00'),
(58, 'LAB2025102112', 2, 11, 'Vision (Right)', '6/6', NULL, '6/6', NULL, NULL, '2025-10-21 05:35:00', '2025-10-21 05:35:00'),
(59, 'LAB2025102311', 3, 25, 'MCHC', '33', 'g/dL', '32 - 36', '35', 'Negative', '2025-10-23 06:12:58', '2025-10-23 06:13:18');

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
(1, 'LAB2025102111', '2025-10-21', 'Shamim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 13, 14, 10808, 2000, 8808, 8000, 1, 808, 0, 1, 1, '2025-10-21 05:30:35', '2025-10-21 05:30:35'),
(2, 'LAB2025102112', '2025-10-21', 'Farjana Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 13, 12, 12945, 2000, 10945, 10000, 1, 945, 0, 1, 1, '2025-10-21 05:30:54', '2025-10-21 05:30:54'),
(3, 'LAB2025102311', '2025-10-23', 'Shamim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 14, 14, 650, 50, 600, 600, 0, 0, 0, 1, 1, '2025-10-23 06:12:41', '2025-10-23 06:12:41');

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
(1, 'Tablet', NULL, '2025-10-22 23:00:20'),
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
(1, 'Acetone', 1, 1, 1, 87.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(2, 'Alcohol', 1, 1, 1, 82.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(3, 'Ammonia', 1, 1, 1, 246.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(4, 'Benzene', 1, 1, 1, 272.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(5, 'Calcium Chloride', 1, 1, 1, 365.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(6, 'Chloroform', 1, 1, 1, 74.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(7, 'Citric Acid', 1, 1, 1, 485.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(8, 'Copper Sulphate', 1, 1, 1, 76.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(9, 'Formaldehyde', 1, 1, 1, 468.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(10, 'Glucose', 1, 1, 1, 136.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(11, 'Glycerol', 1, 1, 1, 251.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(12, 'Hydrochloric Acid', 1, 1, 1, 482.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(13, 'Hydrogen Peroxide', 1, 1, 1, 476.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(14, 'Iodine', 1, 1, 1, 432.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(15, 'Iron Sulphate', 1, 1, 1, 275.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(16, 'Magnesium Sulphate', 1, 1, 1, 190.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(17, 'Methanol', 1, 1, 1, 292.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(18, 'Nitric Acid', 1, 1, 1, 119.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(19, 'Phenol', 1, 1, 1, 91.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(20, 'Potassium Chloride', 1, 1, 1, 396.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(21, 'Potassium Hydroxide', 1, 1, 1, 344.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(22, 'Sodium Bicarbonate', 1, 1, 1, 465.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(23, 'Sodium Carbonate', 1, 1, 1, 329.00, 50, '2025-10-23 09:07:52', '2025-10-23 09:07:52'),
(24, 'Sodium Chloride', 1, 1, 1, 260.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(25, 'Sodium Hydroxide', 1, 1, 1, 54.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(26, 'Sulfuric Acid', 1, 1, 1, 456.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(27, 'Toluene', 1, 1, 1, 324.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(28, 'Urea', 1, 1, 1, 51.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(29, 'Zinc Sulphate', 1, 1, 1, 381.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(30, 'Sodium Nitrate', 1, 1, 1, 386.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(31, 'Ammonium Chloride', 1, 1, 1, 386.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(32, 'Barium Sulphate', 1, 1, 1, 468.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(33, 'Ethyl Acetate', 1, 1, 1, 51.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(34, 'Formic Acid', 1, 1, 1, 435.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(35, 'Hydrazine', 1, 1, 1, 343.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(36, 'Lithium Carbonate', 1, 1, 1, 332.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(37, 'Magnesium Hydroxide', 1, 1, 1, 457.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(38, 'Manganese Sulphate', 1, 1, 1, 360.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(39, 'Nickel Sulphate', 1, 1, 1, 346.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(40, 'Phenolphthalein', 1, 1, 1, 272.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(41, 'Potassium Bromide', 1, 1, 1, 353.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(42, 'Silver Nitrate', 1, 1, 1, 422.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(43, 'Sodium Sulphate', 1, 1, 1, 199.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(44, 'Sulfur', 1, 1, 1, 288.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(45, 'Thymol', 1, 1, 1, 359.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(46, 'Triethanolamine', 1, 1, 1, 350.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(47, 'Xylene', 1, 1, 1, 406.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(48, 'Zinc Chloride', 1, 1, 1, 95.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53'),
(49, 'Aluminium Sulphate', 1, 1, 1, 414.00, 50, '2025-10-23 09:07:53', '2025-10-23 09:07:53');

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
(1, 1, 1, 10.00, '2025-10-23 09:08:04', '2025-10-23 09:08:04'),
(3, 1, 2, 10.00, '2025-10-23 09:08:15', '2025-10-23 09:08:15'),
(4, 1, 3, 2.00, '2025-10-23 09:26:46', '2025-10-23 09:26:46'),
(5, 2, 1, 1.30, '2025-10-23 09:36:54', '2025-10-23 09:36:54'),
(6, 2, 3, 5.10, '2025-10-23 09:37:02', '2025-10-23 09:37:02'),
(7, 3, 20, 3.00, '2025-10-23 09:41:59', '2025-10-23 09:41:59'),
(8, 6, 19, 2.30, '2025-10-23 09:42:05', '2025-10-23 09:42:05'),
(9, 6, 17, 1.30, '2025-10-23 09:42:12', '2025-10-23 09:42:12'),
(10, 3, 15, 6.00, '2025-10-23 09:42:46', '2025-10-23 09:42:46'),
(11, 8, 48, 1.20, '2025-10-23 09:43:08', '2025-10-23 09:43:08'),
(12, 50, 19, 10.50, '2025-10-23 09:43:36', '2025-10-23 10:09:47'),
(13, 6, 20, 6.30, '2025-10-23 10:11:00', '2025-10-23 10:11:00');

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
(1, 'Mr. John Smith', 'Consultant', 'john@example.com', '01710000001', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(2, 'Ms. Alice Johnson', 'Lab Manager', 'alice@example.com', '01710000002', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(3, 'Dr. Robert Brown', 'Physician', 'robert@example.com', '01710000003', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(4, 'Dr. Emily Davis', 'Surgeon', 'emily@example.com', '01710000004', 1, '2025-10-21 05:29:47', '2025-10-21 05:29:47'),
(5, 'Mr. Michael Wilson', 'Technician', 'michael@example.com', '01710000005', 1, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(6, 'Ms. Sophia Taylor', 'Nurse', 'sophia@example.com', '01710000006', 1, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(7, 'Dr. William Martinez', 'Radiologist', 'william@example.com', '01710000007', 1, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(8, 'Dr. Olivia Anderson', 'Oncologist', 'olivia@example.com', '01710000008', 1, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(9, 'Dr. James Thomas', 'Endocrinologist', 'james@example.com', '01710000009', 1, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(10, 'Dr. Isabella Jackson', 'Pediatrician', 'isabella@example.com', '01710000010', 1, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(11, 'Dr. Benjamin White', 'Cardiologist', 'benjamin@example.com', '01710000011', 1, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(12, 'Dr. Mia Harris', 'Neurologist', 'mia@example.com', '01710000012', 1, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(13, 'Dr. Daniel Clark', 'Orthopedic', 'daniel@example.com', '01710000013', 1, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(14, 'Dr. Charlotte Lewis', 'Dermatologist', 'charlotte@example.com', '01710000014', 1, '2025-10-21 05:29:48', '2025-10-21 05:29:48'),
(15, 'Dr. Matthew Lee', 'Ophthalmologist', 'matthew@example.com', '01710000015', 1, '2025-10-21 05:29:48', '2025-10-21 05:29:48');

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
(1, 'LAB2025102111', 1, 650.00, 3040.00, 4, 4, 4, 3, 'Room 2', 1, 0, '2025-10-21 05:30:12', '2025-10-21 05:30:12'),
(2, 'LAB2025102111', 2, 1577.00, 2134.00, 1, 3, 4, 1, 'Room 1', 1, 0, '2025-10-21 05:30:19', '2025-10-21 05:30:19'),
(3, 'LAB2025102111', 3, 839.00, 653.00, 1, 3, 1, 3, 'Room 5', 1, 0, '2025-10-21 05:30:20', '2025-10-21 05:30:20'),
(4, 'LAB2025102111', 4, 2432.00, 2112.00, 2, 2, 1, 2, 'Room 5', 1, 0, '2025-10-21 05:30:20', '2025-10-21 05:30:20'),
(5, 'LAB2025102111', 5, 1644.00, 2470.00, 2, 3, 4, 1, 'Room 3', 1, 0, '2025-10-21 05:30:21', '2025-10-21 05:30:21'),
(6, 'LAB2025102111', 6, 3666.00, 4095.00, 2, 4, 2, 1, 'Room 9', 1, 0, '2025-10-21 05:30:21', '2025-10-21 05:30:21'),
(7, 'LAB2025102112', 3, 839.00, 653.00, 1, 3, 1, 3, 'Room 5', 1, 0, '2025-10-21 05:30:40', '2025-10-21 05:30:40'),
(8, 'LAB2025102112', 6, 3666.00, 4095.00, 2, 4, 2, 1, 'Room 9', 1, 0, '2025-10-21 05:30:40', '2025-10-21 05:30:40'),
(9, 'LAB2025102112', 5, 1644.00, 2470.00, 2, 3, 4, 1, 'Room 3', 1, 0, '2025-10-21 05:30:40', '2025-10-21 05:30:40'),
(10, 'LAB2025102112', 4, 2432.00, 2112.00, 2, 2, 1, 2, 'Room 5', 1, 0, '2025-10-21 05:30:41', '2025-10-21 05:30:41'),
(11, 'LAB2025102112', 9, 4364.00, 1694.00, 1, 4, 4, 1, 'Room 3', 1, 0, '2025-10-21 05:30:41', '2025-10-21 05:30:41'),
(25, 'LAB2025102311', 1, 650.00, 3040.00, 4, 4, 4, 3, 'Room 2', 1, 0, '2025-10-23 06:12:11', '2025-10-23 06:12:11');

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
(4, 'L', NULL, '2025-10-22 22:52:17'),
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admission_bill_summaries`
--
ALTER TABLE `admission_bill_summaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admission_patients`
--
ALTER TABLE `admission_patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `patient_test_reports`
--
ALTER TABLE `patient_test_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `references`
--
ALTER TABLE `references`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `store_tests`
--
ALTER TABLE `store_tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
