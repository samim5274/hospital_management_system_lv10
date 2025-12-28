-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 28, 2025 at 10:52 AM
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
(2, 'Akib Hossain', 'akib@gmail.com', '$2y$12$XpSO9YALOs7vC.N5uXb.0OJyd5V2kBcnMpM/qUQvWDjF33mPFKsru', 'Admin', 'jSPfQ1rBQIGa5n2chjx2mtXfGWlwyl3Srsg5dd0wAxdUNgo6hlrPSyGGok20', '2025-10-25 18:00:59', '2025-10-25 18:00:59'),
(3, 'Akib Hossain', 'akib2@gmail.com', '$2y$12$nk8MgzG7.Ggnnclyokz0v.V0uEFjK05mJbq75MfBQv0LnSuwMhRKO', 'Admin', NULL, '2025-10-25 18:14:41', '2025-10-25 18:14:41');

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
(1, 2, 1876.00, 15000.00, 15000.00, 1500.00, 1500.00, 1500.00, 1500.00, 480000.00, 517876.00, 5876.00, 20000.00, 492000.00, 12000.00, 480000.00, 'IND-2025110412', '2025-11-04', 1, 'Advance Pay date of 04-Nov-2025, Received by : SAMIM, Bill modified by SAMIM, Modify date : 04-Nov-2025. , Patient Discharge by SAMIM, Discharge date : 04-Nov-2025. ', '2025-11-03 22:36:33', '2025-11-03 22:37:37'),
(2, 10, 1423.00, 5000.00, 4500.00, 3500.00, 4000.00, 1500.00, 1500.00, 40000.00, 61423.00, 423.00, 20000.00, 41000.00, 1000.00, 40000.00, 'IND-20251106110', '2025-11-06', 1, 'Advance Pay date of 06-Nov-2025, Received by : SAMIM, Bill modified by SAMIM, Modify date : 06-Nov-2025. , Patient Discharge by SAMIM, Discharge date : 06-Nov-2025. ', '2025-11-06 04:36:55', '2025-11-06 04:38:49'),
(3, 9, 1143.00, 1500.00, 1500.00, 1500.00, 1500.00, 1500.00, 1500.00, 40000.00, 50143.00, 2143.00, 0.00, 48000.00, 8000.00, 40000.00, 'IND-2025110619', '2025-11-06', 1, 'Bill prepared by SAMIM, Prepared date : 06-Nov-2025, Bill modified by SAMIM, Modify date : 06-Nov-2025. , Patient Discharge by SAMIM, Discharge date : 06-Nov-2025. ', '2025-11-06 04:38:20', '2025-11-06 04:39:36'),
(4, 14, 1143.00, 1500.00, 1500.00, 1500.00, 1500.00, 1500.00, 1500.00, 40000.00, 50143.00, 0.00, 0.00, 50143.00, 0.00, 50143.00, 'IND-20251107114', '2025-11-07', 1, 'Bill prepared by SAMIM, Prepared date : 07-Nov-2025', '2025-11-06 23:43:19', '2025-11-06 23:43:19'),
(5, 15, 1143.00, 1500.00, 1500.00, 1500.00, 1500.00, 1500.00, 1500.00, 0.00, 10143.00, 0.00, 0.00, 10143.00, 0.00, 10143.00, 'IND-20251107115', '2025-11-07', 1, 'Bill prepared by SAMIM, Prepared date : 07-Nov-2025', '2025-11-06 23:44:32', '2025-11-06 23:44:32'),
(6, 14, 1423.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 40000.00, 0.00, 0.00, 20000.00, 0.00, 0.00, 0.00, 'IND-20251107114', '2025-11-07', 1, 'Advance Pay date of 07-Nov-2025, Received by : SAMIM', '2025-11-07 02:33:00', '2025-11-07 02:33:00'),
(7, 14, 1423.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 40000.00, 0.00, 0.00, 20000.00, 0.00, 0.00, 0.00, 'IND-20251107114', '2025-11-07', 1, 'Advance Pay date of 07-Nov-2025, Received by : SAMIM', '2025-11-07 02:33:02', '2025-11-07 02:33:02'),
(15, 16, 1704.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50000.00, 0.00, 0.00, 20000.00, 0.00, 0.00, 0.00, 'IND-20251107116', '2025-11-07', 1, 'Advance Pay date of 07-Nov-2025, Received by : SAMIM', '2025-11-07 04:24:38', '2025-11-07 04:24:38');

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
(1, 'IND-2025110311', 'Shamim Hossain', '2001-12-31', 'Male', '01762164746', 'Jamsher Ali', 'Jamsher Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '568974312', 'Contract', 25000.00, 'Conservative', 'NonPackage', 15, 15, 20, 20, 'Mr. Sabrina Akter', '2025-11-03', 22, 1394.00, 1, 1, 'N/A', '2025-11-03 01:40:39', '2025-11-03 01:40:39'),
(2, 'IND-2025110412', 'Shamim Hossain', '2001-12-31', 'Male', '01762164746', 'Jamsher Ali', 'Jamsher Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '568974312', 'Contract', 480000.00, 'Conservative', 'NonPackage', 15, 15, 20, 20, 'Mr. Sabrina Akter', '2025-11-04', 24, 1876.00, 1, 2, 'Patient discharged. Date of :04-Nov-2025', '2025-11-03 22:35:52', '2025-11-03 22:37:37'),
(3, 'IND-2025110413', 'Akbor Hossain', '2001-12-31', 'Male', '01762164746', 'Mohammad Ali', 'Mohammad Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '956234718', 'Contract', 40000.00, 'Conservative', 'NonPackage', 5, 4, 7, 18, NULL, '2025-11-10', 15, 1200.00, 1, 1, 'N/A', '2025-11-04 00:12:21', '2025-11-04 00:12:21'),
(4, 'IND-2025110414', 'Akbor Hossain', '2001-12-31', 'Male', '01762164746', 'Mohammad Ali', 'Mohammad Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '956234718', 'Contract', 40000.00, 'Conservative', 'NonPackage', 5, 4, 7, 18, NULL, '2025-11-10', 15, 1200.00, 1, 1, 'N/A', '2025-11-04 00:12:24', '2025-11-04 00:12:24'),
(5, 'IND-2025110415', 'Akbor Hossain', '2001-12-31', 'Male', '01762164746', 'Mohammad Ali', 'Mohammad Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '956234718', 'Contract', 40000.00, 'Conservative', 'NonPackage', 5, 4, 7, 18, NULL, '2025-11-10', 15, 1200.00, 1, 1, 'N/A', '2025-11-04 00:12:25', '2025-11-04 00:12:25'),
(6, 'IND-2025110416', 'Akbor Hossain', '2001-12-31', 'Male', '01762164746', 'Mohammad Ali', 'Mohammad Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '956234718', 'Contract', 40000.00, 'Conservative', 'NonPackage', 5, 4, 7, 18, 'Sabina Akter', '2025-11-10', 15, 1200.00, 1, 1, 'N/A', '2025-11-04 00:24:52', '2025-11-04 00:24:52'),
(7, 'IND-2025110417', 'Akbor Hossain', '2001-12-31', 'Male', '01762164746', 'Mohammad Ali', 'Mohammad Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '956234718', 'Contract', 40000.00, 'Conservative', 'Package', 5, 4, 7, 18, 'Sabina Akter', '2025-11-10', 1, 1423.00, 1, 1, 'Modified by SAMIM', '2025-11-04 00:25:42', '2025-11-04 00:59:14'),
(8, 'IND-2025110418', 'Faruk Mia', '2001-12-31', 'Male', '01762164746', 'Mohammad Ali', 'Mohammad Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '956234718', 'Contract', 40000.00, 'Conservative', 'NonPackage', 5, 4, 7, 18, 'Sabina Akter', '2025-11-10', 15, 1423.00, 1, 1, 'N/A', '2025-11-04 01:13:41', '2025-11-04 01:13:41'),
(9, 'IND-2025110619', 'Faruk Mia', '2001-12-31', 'Male', '01762164746', 'Mohammad Ali', 'Mohammad Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '956234718', 'Contract', 40000.00, 'Conservative', 'NonPackage', 5, 4, 7, 18, 'Sabina Akter', '2025-11-10', 15, 1423.00, 1, 2, 'Patient discharged. Date of :06-Nov-2025', '2025-11-06 04:34:43', '2025-11-06 04:39:36'),
(10, 'IND-20251106110', 'Abir Mia', '2001-12-31', 'Male', '01762164746', 'Mohammad Ali', 'Mohammad Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '956234718', 'Contract', 40000.00, 'Conservative', 'Package', 5, 4, 7, 18, 'Sabina Akter', '2025-11-10', 1, 1423.00, 1, 2, 'Patient discharged. Date of :06-Nov-2025', '2025-11-06 04:35:05', '2025-11-06 04:38:49'),
(11, 'IND-20251106111', 'Abir Mia', '2001-12-31', 'Male', '01762164746', 'Mohammad Ali', 'Mohammad Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '956234718', 'Contract', 40000.00, 'Conservative', 'NonPackage', 5, 4, 7, 18, 'Sabina Akter', '2025-11-10', 15, 1423.00, 1, 1, 'N/A', '2025-11-06 04:40:21', '2025-11-06 04:40:21'),
(12, 'IND-20251106112', 'Iqbal Hossain', '2001-12-31', 'Male', '01762164746', 'Jamsher Ali', 'Jamsher Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '568974312', 'NonContract', 0.00, 'Operative', 'Package', 15, 15, 20, 20, 'Mr. Sabrina Akter', '2025-11-06', 23, 846.00, 1, 1, 'N/A', '2025-11-06 04:58:14', '2025-11-06 04:58:14'),
(13, 'IND-20251106113', 'Sabbir Mia', '2001-12-31', 'Male', '01762164746', 'Mohammad Ali', 'Mohammad Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '956234718', 'Contract', 40000.00, 'Conservative', 'NonPackage', 5, 4, 7, 18, 'Sabina Akter', '2025-11-10', 15, 1423.00, 1, 1, 'N/A', '2025-11-06 07:01:27', '2025-11-06 07:01:27'),
(14, 'IND-20251107114', 'Abir Mia', '2001-12-31', 'Male', '01762164746', 'Mohammad Ali', 'Mohammad Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '956234718', 'Contract', 40000.00, 'Conservative', 'NonPackage', 5, 4, 7, 18, 'Sabina Akter', '2025-11-10', 15, 1423.00, 1, 1, 'N/A', '2025-11-06 23:42:27', '2025-11-06 23:42:27'),
(15, 'IND-20251107115', 'Rahim Mia', '2001-12-31', 'Male', '01762164746', 'Mohammad Ali', 'Mohammad Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '956234718', 'NonContract', 0.00, 'Conservative', 'NonPackage', 5, 4, 7, 18, 'Sabina Akter', '2025-11-10', 15, 1423.00, 1, 1, 'N/A', '2025-11-06 23:44:16', '2025-11-06 23:44:16'),
(16, 'IND-20251107116', 'Akram Hossain', '2001-12-31', 'Male', '01762164746', 'Jamsher Ali', 'Jamsher Ali', 'Kaliakair, Gazipur, Dhaka-1750', 'Islam', '568974312', 'Contract', 50000.00, 'Operative', 'NonPackage', 15, 15, 20, 20, 'Mr. Sabrina Akter', '2025-11-07', 26, 1704.00, 1, 1, 'N/A', '2025-11-07 02:34:17', '2025-11-07 02:34:17');

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
(1, 'B001', 'Cabin', 'available', 1423.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(2, 'B002', 'Cabin', 'available', 1138.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(3, 'B003', 'Emergency', 'available', 1609.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(4, 'B004', 'Cabin', 'available', 1695.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(5, 'B005', 'Emergency', 'available', 1765.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(6, 'B006', 'ICU', 'available', 1634.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(7, 'B007', 'Emergency', 'available', 704.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(8, 'B008', 'Cabin', 'available', 1312.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(9, 'B009', 'Cabin', 'available', 837.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(10, 'B010', 'Female Ward', 'available', 1323.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(11, 'B011', 'Emergency', 'available', 849.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(12, 'B012', 'Emergency', 'available', 1903.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(13, 'B013', 'Male Ward', 'available', 964.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(14, 'B014', 'ICU', 'available', 1335.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(15, 'B015', 'Cabin', 'booked', 1143.00, '2025-10-31 22:42:29', '2025-11-04 00:12:21'),
(16, 'B016', 'Male Ward', 'available', 1314.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(17, 'B017', 'Female Ward', 'available', 1371.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(18, 'B018', 'ICU', 'available', 1877.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(19, 'B019', 'Female Ward', 'available', 1927.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(20, 'B020', 'Cabin', 'available', 1635.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(21, 'B021', 'Male Ward', 'available', 1975.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(22, 'B022', 'Emergency', 'booked', 1394.00, '2025-10-31 22:42:29', '2025-11-03 01:40:39'),
(23, 'B023', 'Female Ward', 'booked', 846.00, '2025-10-31 22:42:29', '2025-11-06 04:58:14'),
(24, 'B024', 'Cabin', 'booked', 1876.00, '2025-10-31 22:42:29', '2025-11-03 22:35:52'),
(25, 'B025', 'Male Ward', 'available', 1551.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(26, 'B026', 'ICU', 'booked', 1704.00, '2025-10-31 22:42:29', '2025-11-07 02:34:17'),
(27, 'B027', 'Female Ward', 'available', 1139.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(28, 'B028', 'Male Ward', 'available', 1321.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(29, 'B029', 'Cabin', 'available', 554.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(30, 'B030', 'Male Ward', 'available', 1673.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(31, 'B031', 'Emergency', 'available', 1681.00, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(32, 'B032', 'Male Ward', 'available', 1564.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(33, 'B033', 'ICU', 'available', 1392.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(34, 'B034', 'Female Ward', 'available', 1257.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(35, 'B035', 'Emergency', 'available', 759.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(36, 'B036', 'Female Ward', 'available', 786.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(37, 'B037', 'Female Ward', 'available', 1483.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(38, 'B038', 'Cabin', 'available', 1190.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(39, 'B039', 'Female Ward', 'available', 782.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(40, 'B040', 'Cabin', 'available', 1009.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(41, 'B041', 'Male Ward', 'available', 1408.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(42, 'B042', 'ICU', 'available', 1700.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(43, 'B043', 'Cabin', 'available', 1362.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(44, 'B044', 'Cabin', 'available', 655.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(45, 'B045', 'ICU', 'available', 951.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(46, 'B046', 'Emergency', 'available', 1133.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(47, 'B047', 'ICU', 'available', 980.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(48, 'B048', 'Male Ward', 'available', 814.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(49, 'B049', 'Female Ward', 'available', 1127.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(50, 'B050', 'ICU', 'available', 530.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(51, 'B051', 'ICU', 'available', 880.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(52, 'B052', 'Male Ward', 'available', 1102.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(53, 'B053', 'Cabin', 'available', 1126.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(54, 'B054', 'Emergency', 'available', 1698.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(55, 'B055', 'Female Ward', 'available', 1496.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(56, 'B056', 'ICU', 'available', 1789.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(57, 'B057', 'Cabin', 'available', 1757.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(58, 'B058', 'Female Ward', 'available', 844.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(59, 'B059', 'Male Ward', 'available', 1002.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(60, 'B060', 'Male Ward', 'available', 637.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(61, 'B061', 'Emergency', 'available', 1738.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(62, 'B062', 'ICU', 'available', 966.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(63, 'B063', 'Cabin', 'available', 1295.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(64, 'B064', 'Male Ward', 'available', 561.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(65, 'B065', 'Male Ward', 'available', 1644.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(66, 'B066', 'ICU', 'available', 1740.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(67, 'B067', 'Emergency', 'available', 829.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(68, 'B068', 'Emergency', 'available', 1195.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(69, 'B069', 'Cabin', 'available', 809.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(70, 'B070', 'Female Ward', 'available', 1351.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(71, 'B071', 'Female Ward', 'available', 1621.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(72, 'B072', 'ICU', 'available', 1151.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(73, 'B073', 'Cabin', 'available', 1294.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(74, 'B074', 'Female Ward', 'available', 590.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(75, 'B075', 'Male Ward', 'available', 1069.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(76, 'B076', 'Cabin', 'available', 1543.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(77, 'B077', 'Cabin', 'available', 763.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(78, 'B078', 'Female Ward', 'available', 1974.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(79, 'B079', 'Female Ward', 'available', 1142.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(80, 'B080', 'Emergency', 'available', 1081.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(81, 'B081', 'Cabin', 'available', 1632.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(82, 'B082', 'Cabin', 'available', 874.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(83, 'B083', 'ICU', 'available', 1706.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(84, 'B084', 'Emergency', 'available', 1328.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(85, 'B085', 'Female Ward', 'available', 1006.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(86, 'B086', 'ICU', 'available', 723.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(87, 'B087', 'Female Ward', 'available', 554.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(88, 'B088', 'Female Ward', 'available', 1261.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(89, 'B089', 'Male Ward', 'available', 872.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(90, 'B090', 'Male Ward', 'available', 1522.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(91, 'B091', 'Cabin', 'available', 556.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(92, 'B092', 'Female Ward', 'available', 715.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(93, 'B093', 'Emergency', 'available', 576.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(94, 'B094', 'Female Ward', 'available', 1958.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(95, 'B095', 'Cabin', 'available', 1578.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(96, 'B096', 'Female Ward', 'available', 1756.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(97, 'B097', 'Male Ward', 'available', 549.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(98, 'B098', 'Female Ward', 'available', 1806.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(99, 'B099', 'Male Ward', 'available', 1314.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(100, 'B100', 'Female Ward', 'available', 1245.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(101, 'B101', 'Male Ward', 'available', 1838.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(102, 'B102', 'Emergency', 'available', 1021.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(103, 'B103', 'Emergency', 'available', 565.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(104, 'B104', 'Emergency', 'available', 1327.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(105, 'B105', 'Emergency', 'available', 956.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(106, 'B106', 'Cabin', 'available', 1509.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(107, 'B107', 'ICU', 'available', 1287.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(108, 'B108', 'Male Ward', 'available', 655.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(109, 'B109', 'Female Ward', 'available', 1995.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(110, 'B110', 'ICU', 'available', 1284.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(111, 'B111', 'Female Ward', 'available', 1644.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(112, 'B112', 'Cabin', 'available', 1466.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(113, 'B113', 'Emergency', 'available', 1004.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(114, 'B114', 'Male Ward', 'available', 901.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(115, 'B115', 'Male Ward', 'available', 541.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(116, 'B116', 'Female Ward', 'available', 1948.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(117, 'B117', 'Cabin', 'available', 1878.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(118, 'B118', 'Male Ward', 'available', 1827.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(119, 'B119', 'Female Ward', 'available', 1445.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(120, 'B120', 'Cabin', 'available', 1499.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(121, 'B121', 'Emergency', 'available', 1895.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(122, 'B122', 'Male Ward', 'available', 1119.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(123, 'B123', 'Emergency', 'available', 1003.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(124, 'B124', 'Male Ward', 'available', 1935.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(125, 'B125', 'Male Ward', 'available', 570.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(126, 'B126', 'ICU', 'available', 1508.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(127, 'B127', 'Female Ward', 'available', 1836.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(128, 'B128', 'ICU', 'available', 632.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(129, 'B129', 'Emergency', 'available', 1169.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(130, 'B130', 'Cabin', 'available', 1834.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(131, 'B131', 'Female Ward', 'available', 955.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(132, 'B132', 'Male Ward', 'available', 1693.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(133, 'B133', 'Emergency', 'available', 1364.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(134, 'B134', 'Male Ward', 'available', 526.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(135, 'B135', 'Emergency', 'available', 1356.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(136, 'B136', 'Male Ward', 'available', 661.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(137, 'B137', 'Emergency', 'available', 1079.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(138, 'B138', 'Male Ward', 'available', 1986.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(139, 'B139', 'ICU', 'available', 1460.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(140, 'B140', 'Female Ward', 'available', 681.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(141, 'B141', 'Male Ward', 'available', 827.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(142, 'B142', 'ICU', 'available', 1665.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(143, 'B143', 'Female Ward', 'available', 1868.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(144, 'B144', 'ICU', 'available', 923.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(145, 'B145', 'Cabin', 'available', 1200.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(146, 'B146', 'Emergency', 'available', 1641.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(147, 'B147', 'Cabin', 'available', 738.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(148, 'B148', 'Cabin', 'available', 1938.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(149, 'B149', 'Female Ward', 'available', 774.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(150, 'B150', 'Female Ward', 'available', 614.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(151, 'B151', 'Cabin', 'available', 633.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(152, 'B152', 'Cabin', 'available', 1331.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(153, 'B153', 'Cabin', 'available', 1982.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(154, 'B154', 'ICU', 'available', 1429.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(155, 'B155', 'Male Ward', 'available', 1100.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(156, 'B156', 'ICU', 'available', 1166.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(157, 'B157', 'Male Ward', 'available', 842.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(158, 'B158', 'ICU', 'available', 1313.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(159, 'B159', 'Emergency', 'available', 1505.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(160, 'B160', 'Cabin', 'available', 1009.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(161, 'B161', 'Emergency', 'available', 736.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(162, 'B162', 'Female Ward', 'available', 1924.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(163, 'B163', 'Cabin', 'available', 1458.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(164, 'B164', 'Female Ward', 'available', 1323.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(165, 'B165', 'Male Ward', 'available', 1645.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(166, 'B166', 'Male Ward', 'available', 1208.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(167, 'B167', 'ICU', 'available', 1820.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(168, 'B168', 'ICU', 'available', 1377.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(169, 'B169', 'Emergency', 'available', 1363.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(170, 'B170', 'Male Ward', 'available', 733.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(171, 'B171', 'ICU', 'available', 583.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(172, 'B172', 'Emergency', 'available', 1445.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(173, 'B173', 'Female Ward', 'available', 800.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(174, 'B174', 'Male Ward', 'available', 1879.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(175, 'B175', 'Cabin', 'available', 1120.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(176, 'B176', 'Female Ward', 'available', 912.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(177, 'B177', 'Emergency', 'available', 1963.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(178, 'B178', 'ICU', 'available', 614.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(179, 'B179', 'Emergency', 'available', 1152.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(180, 'B180', 'Male Ward', 'available', 534.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(181, 'B181', 'Emergency', 'available', 788.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(182, 'B182', 'Cabin', 'available', 1370.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(183, 'B183', 'Female Ward', 'available', 1365.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(184, 'B184', 'Cabin', 'available', 732.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(185, 'B185', 'Emergency', 'available', 869.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(186, 'B186', 'Cabin', 'available', 1603.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(187, 'B187', 'Female Ward', 'available', 1064.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(188, 'B188', 'Male Ward', 'available', 1828.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(189, 'B189', 'Cabin', 'available', 914.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(190, 'B190', 'Male Ward', 'available', 1461.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(191, 'B191', 'ICU', 'available', 1285.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(192, 'B192', 'Emergency', 'available', 1114.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(193, 'B193', 'Female Ward', 'available', 1740.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(194, 'B194', 'Emergency', 'available', 1080.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(195, 'B195', 'Female Ward', 'available', 577.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(196, 'B196', 'Emergency', 'available', 1562.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(197, 'B197', 'Female Ward', 'available', 1620.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(198, 'B198', 'Male Ward', 'available', 1180.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(199, 'B199', 'Male Ward', 'available', 1599.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(200, 'B200', 'Female Ward', 'available', 907.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(201, 'B201', 'Cabin', 'available', 515.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(202, 'B202', 'ICU', 'available', 1499.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(203, 'B203', 'ICU', 'available', 1387.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(204, 'B204', 'Male Ward', 'available', 1536.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(205, 'B205', 'Male Ward', 'available', 1393.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(206, 'B206', 'Female Ward', 'available', 1767.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(207, 'B207', 'Cabin', 'available', 1166.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(208, 'B208', 'Male Ward', 'available', 1602.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(209, 'B209', 'Female Ward', 'available', 976.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(210, 'B210', 'ICU', 'available', 591.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(211, 'B211', 'ICU', 'available', 1859.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(212, 'B212', 'ICU', 'available', 612.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(213, 'B213', 'Cabin', 'available', 1230.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(214, 'B214', 'Emergency', 'available', 1232.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(215, 'B215', 'Emergency', 'available', 1968.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(216, 'B216', 'Female Ward', 'available', 505.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(217, 'B217', 'Cabin', 'available', 1309.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(218, 'B218', 'Emergency', 'available', 1255.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(219, 'B219', 'Male Ward', 'available', 589.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(220, 'B220', 'Emergency', 'available', 1511.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(221, 'B221', 'ICU', 'available', 632.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(222, 'B222', 'Female Ward', 'available', 1413.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(223, 'B223', 'ICU', 'available', 1950.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(224, 'B224', 'Female Ward', 'available', 1817.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(225, 'B225', 'Cabin', 'available', 1303.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(226, 'B226', 'Cabin', 'available', 1951.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(227, 'B227', 'Male Ward', 'available', 958.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(228, 'B228', 'Female Ward', 'available', 1634.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(229, 'B229', 'Cabin', 'available', 572.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(230, 'B230', 'Emergency', 'available', 1394.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(231, 'B231', 'Cabin', 'available', 1451.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(232, 'B232', 'Emergency', 'available', 1942.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(233, 'B233', 'Cabin', 'available', 1949.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(234, 'B234', 'Female Ward', 'available', 846.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(235, 'B235', 'Emergency', 'available', 1975.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(236, 'B236', 'Emergency', 'available', 1641.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(237, 'B237', 'Male Ward', 'available', 1797.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(238, 'B238', 'Female Ward', 'available', 591.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(239, 'B239', 'ICU', 'available', 976.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(240, 'B240', 'Male Ward', 'available', 1330.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(241, 'B241', 'Male Ward', 'available', 1702.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(242, 'B242', 'Emergency', 'available', 788.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(243, 'B243', 'Emergency', 'available', 1210.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(244, 'B244', 'Male Ward', 'available', 1843.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(245, 'B245', 'ICU', 'available', 1630.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(246, 'B246', 'Cabin', 'available', 667.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(247, 'B247', 'Female Ward', 'available', 1956.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(248, 'B248', 'Emergency', 'available', 1992.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(249, 'B249', 'Cabin', 'available', 1232.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(250, 'B250', 'Emergency', 'available', 1501.00, '2025-10-31 22:42:30', '2025-10-31 22:42:30');

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
(1, 'Bangladesh Diabetic & Diagnostic Care ltd', 'Dhaka, Bangladesh', 'alnur@gmail.com', '1762164746', 'www.bddcltd.com', NULL, NULL);

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
(1, 'Diabetes Mellitus', 'A metabolic disorder causing high blood sugar levels.', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(2, 'Hypertension', 'High blood pressure condition.', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(3, 'Asthma', 'A chronic lung disease causing breathing difficulty.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(4, 'Heart Disease', 'Conditions affecting the heart and blood vessels.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(5, 'Arthritis', 'Inflammation of the joints causing pain and stiffness.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(6, 'Migraine', 'Severe recurring headaches often with nausea.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(7, 'Tuberculosis', 'An infectious disease mainly affecting the lungs.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(8, 'Pneumonia', 'Infection that inflames the air sacs in one or both lungs.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(9, 'Covid-19', 'Respiratory illness caused by SARS-CoV-2 virus.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(10, 'Hepatitis B', 'A viral infection that affects the liver.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(11, 'Typhoid Fever', 'Bacterial infection caused by Salmonella typhi.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(12, 'Malaria', 'Mosquito-borne infectious disease affecting red blood cells.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(13, 'Dengue Fever', 'Viral infection spread by Aedes mosquitoes.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(14, 'Gastritis', 'Inflammation of the stomach lining.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(15, 'Ulcer', 'Open sores on the stomach or intestinal lining.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(16, 'Cancer', 'Abnormal cell growth that can spread to other parts of the body.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(17, 'Jaundice', 'Yellowing of the skin and eyes due to liver problems.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(18, 'Influenza', 'Common viral infection causing fever and sore throat.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(19, 'Kidney Stone', 'Hard deposits of minerals in the kidneys.', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(20, 'Anemia', 'Low red blood cell count causing fatigue.', '2025-10-31 22:42:31', '2025-10-31 22:42:31');

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
(1, 'Dr. John Smith', 'Cardiologist', '01710000001', 'john.smith@example.com', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(2, 'Dr. Alice Johnson', 'Neurologist', '01710000002', 'alice.johnson@example.com', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(3, 'Dr. Robert Brown', 'Pediatrician', '01710000003', 'robert.brown@example.com', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(4, 'Dr. Emily Davis', 'Dermatologist', '01710000004', 'emily.davis@example.com', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(5, 'Dr. Michael Wilson', 'Orthopedic', '01710000005', 'michael.wilson@example.com', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(6, 'Dr. Sophia Taylor', 'Gynecologist', '01710000006', 'sophia.taylor@example.com', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(7, 'Dr. William Martinez', 'ENT Specialist', '01710000007', 'william.martinez@example.com', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(8, 'Dr. Olivia Anderson', 'Oncologist', '01710000008', 'olivia.anderson@example.com', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(9, 'Dr. James Thomas', 'Radiologist', '01710000009', 'james.thomas@example.com', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(10, 'Dr. Isabella Jackson', 'Endocrinologist', '01710000010', 'isabella.jackson@example.com', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(11, 'Dr. Benjamin White', 'Urologist', '01710000011', 'benjamin.white@example.com', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(12, 'Dr. Mia Harris', 'Gastroenterologist', '01710000012', 'mia.harris@example.com', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(13, 'Dr. Daniel Clark', 'Pulmonologist', '01710000013', 'daniel.clark@example.com', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(14, 'Dr. Charlotte Lewis', 'Nephrologist', '01710000014', 'charlotte.lewis@example.com', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(15, 'Dr. Matthew Lee', 'Ophthalmologist', '01710000015', 'matthew.lee@example.com', '2025-10-31 22:42:29', '2025-10-31 22:42:29');

-- --------------------------------------------------------

--
-- Table structure for table `due_collections`
--

CREATE TABLE `due_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reg` varchar(255) DEFAULT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `discount` decimal(12,2) DEFAULT NULL,
  `due` decimal(12,2) DEFAULT NULL,
  `pay` decimal(12,2) DEFAULT NULL,
  `payment_date` date NOT NULL DEFAULT '2025-11-01',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `note` varchar(255) NOT NULL DEFAULT 'N/A',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `due_collections`
--

INSERT INTO `due_collections` (`id`, `reg`, `total`, `discount`, `due`, `pay`, `payment_date`, `user_id`, `note`, `created_at`, `updated_at`) VALUES
(1, 'LAB2025110116', 4275.00, 4000.00, 0.00, 275.00, '2025-11-01', 1, 'N/A', '2025-11-01 02:47:39', '2025-11-01 02:47:39'),
(6, 'LAB2025110115', 10007.00, 1507.00, 0.00, 4000.00, '2025-11-01', 1, 'N/A', '2025-11-01 04:57:26', '2025-11-01 04:57:26'),
(7, 'LAB2025110117', 9646.00, 854.00, 0.00, 2500.00, '2025-11-01', 1, 'N/A', '2025-11-01 05:50:17', '2025-11-01 05:50:17'),
(8, 'LAB2025110118', 6072.00, 1572.00, 0.00, 3500.00, '2025-11-01', 1, 'N/A', '2025-11-01 05:51:41', '2025-11-01 05:51:41'),
(9, 'LAB2025110119', 5165.00, 1500.00, 0.00, 2500.00, '2025-11-01', 1, 'N/A', '2025-11-01 05:53:31', '2025-11-01 05:53:31'),
(10, 'LAB20251101110', 9646.00, 1500.00, 0.00, 3500.00, '2025-11-01', 1, 'N/A', '2025-11-01 06:00:37', '2025-11-01 06:00:37'),
(11, 'LAB20251101111', 9219.00, 1000.00, 0.00, 4000.00, '2025-11-01', 1, 'N/A', '2025-11-01 06:03:35', '2025-11-01 06:03:35'),
(12, 'LAB20251101112', 4275.00, 275.00, 0.00, 4000.00, '2025-11-01', 1, 'N/A', '2025-11-01 06:04:24', '2025-11-01 06:04:24'),
(13, 'LAB20251101113', 30413.00, 1500.00, 0.00, 1500.00, '2025-11-01', 1, 'N/A', '2025-11-01 06:11:58', '2025-11-01 06:11:58'),
(14, 'LAB20251101114', 8895.00, 1500.00, 0.00, 5500.00, '2025-11-01', 1, 'N/A', '2025-11-01 06:15:01', '2025-11-01 06:15:01'),
(15, 'LAB20251101115', 2000.00, 553.00, 0.00, 2000.00, '2025-11-01', 1, 'N/A', '2025-11-01 06:19:29', '2025-11-01 06:19:29'),
(16, 'LAB20251101116', 8895.00, 895.00, 0.00, 8000.00, '2025-11-01', 1, 'N/A', '2025-11-01 06:21:13', '2025-11-01 06:21:13'),
(17, 'LAB2025110311', 14000.00, 3000.00, 0.00, 7000.00, '2025-11-03', 1, 'N/A', '2025-11-02 23:45:15', '2025-11-02 23:45:15'),
(18, 'LAB2025110312', 16000.00, 4000.00, 0.00, 8000.00, '2025-11-03', 1, 'N/A', '2025-11-03 00:13:13', '2025-11-03 00:13:13'),
(19, 'LAB2025110313', 9000.00, 4000.00, 0.00, 3000.00, '2025-11-03', 1, 'N/A', '2025-11-03 01:10:37', '2025-11-03 01:10:37'),
(20, 'LAB2025110411', 19000.00, 1000.00, 0.00, 3000.00, '2025-11-04', 1, 'N/A', '2025-11-03 22:38:35', '2025-11-03 22:38:35');

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
(1, 'Dr. Ayesha Karim', 'Cardiology', '01710000001', 'ayesha@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(2, 'Dr. Rahat Hossain', 'Orthopedics', '01710000002', 'rahat@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(3, 'Dr. Tanvir Alam', 'Neurology', '01710000003', 'tanvir@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(4, 'Dr. Nusrat Jahan', 'Gynecology', '01710000004', 'nusrat@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(5, 'Dr. Mamun Rahman', 'Medicine', '01710000005', 'mamun@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(6, 'Dr. Farhana Ahmed', 'Dermatology', '01710000006', 'farhana@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(7, 'Dr. Shahidul Islam', 'ENT', '01710000007', 'shahidul@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(8, 'Dr. Sabrina Akter', 'Cardiology', '01710000008', 'sabrina@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(9, 'Dr. Tareq Hasan', 'Urology', '01710000009', 'tareq@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(10, 'Dr. Rafiq Mahmud', 'Medicine', '01710000010', 'rafiq@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(11, 'Dr. Mahiya Sultana', 'Gynecology', '01710000011', 'mahiya@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(12, 'Dr. Hasan Chowdhury', 'Orthopedics', '01710000012', 'hasan@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(13, 'Dr. Sumaiya Rahman', 'Dermatology', '01710000013', 'sumaiya@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(14, 'Dr. Arif Mahmud', 'Cardiology', '01710000014', 'arif@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(15, 'Dr. Nayeem Islam', 'ENT', '01710000015', 'nayeem@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(16, 'Dr. Rima Akter', 'Neurology', '01710000016', 'rima@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(17, 'Dr. Omar Faruk', 'Medicine', '01710000017', 'omar@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(18, 'Dr. Sadiya Hossain', 'Gynecology', '01710000018', 'sadiya@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(19, 'Dr. Kamrul Hasan', 'Cardiology', '01710000019', 'kamrul@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30'),
(20, 'Dr. Rashedul Islam', 'Urology', '01710000020', 'rashed@example.com', '2025-10-31 22:42:30', '2025-10-31 22:42:30');

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
(1, 'Paracetamol', '2025-10-31 22:42:31', '2025-10-22 10:57:39'),
(2, 'Amoxicillin', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(3, 'Ibuprofen', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(4, 'Metformin', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(5, 'Ciprofloxacin', '2025-10-31 22:42:31', '2025-10-31 22:42:31');

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
(1, 'Hematology', 'Blood related tests', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(2, 'Biochemistry', 'Chemical analysis tests', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(3, 'Microbiology', 'Bacteria and virus tests', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(4, 'Immunology', 'Immune system tests', '2025-10-31 22:42:29', '2025-10-31 22:42:29');

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
(1, 'Routine', 'Routine tests', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(2, 'Special', 'Special tests', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(3, 'Emergency', 'Emergency tests', '2025-10-31 22:42:29', '2025-10-31 22:42:29');

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
(1, 'Blood', 'Venous blood sample', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(2, 'Urine', 'Urine sample', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(3, 'Saliva', 'Saliva sample', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(4, 'Swab', 'Throat/nasal swab', '2025-10-31 22:42:29', '2025-10-31 22:42:29');

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
(1, 1, 'CBC', 'Complete Blood Count', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(2, 1, 'ESR', 'Erythrocyte Sedimentation Rate', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(3, 2, 'Liver Function Test', 'LFT panel', '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(4, 2, 'Kidney Function Test', 'KFT panel', '2025-10-31 22:42:29', '2025-10-31 22:42:29');

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
(1, 'CBC Test', 4, 3, 3, 2, 4275.00, 4289.00, 'Room 7', 'Doloribus iste id aliquid aspernatur.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(2, 'Thyroid Function Test', 3, 3, 2, 3, 2067.00, 2055.00, 'Room 10', 'Corporis velit odio unde in cumque quia.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(3, 'Liver Function Test', 4, 4, 4, 3, 2553.00, 1183.00, 'Room 10', 'Nostrum in quasi tempore in.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(4, 'Kidney Function Test', 1, 4, 1, 2, 1452.00, 3395.00, 'Room 8', 'Nesciunt eligendi perferendis sunt.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(5, 'Lipid Profile', 3, 2, 4, 1, 2149.00, 588.00, 'Room 3', 'Aspernatur eligendi commodi ea sed qui.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(6, 'Blood Sugar Test', 4, 3, 2, 3, 3492.00, 2046.00, 'Room 7', 'Hic sunt enim placeat modi.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(7, 'Urine Routine Test', 4, 2, 1, 2, 3578.00, 443.00, 'Room 7', 'Itaque et atque dolore qui.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(8, 'Electrolyte Test', 2, 3, 3, 1, 1587.00, 3344.00, 'Room 10', 'Et saepe molestiae soluta.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(9, 'Pulmonary Function Test', 1, 3, 4, 3, 2538.00, 2302.00, 'Room 4', 'Et tenetur ut tenetur veniam voluptatem voluptatem est voluptatum.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(10, 'ECG Test', 1, 3, 2, 2, 3665.00, 1334.00, 'Room 8', 'Et vero ut ea id voluptas.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(11, 'Eye Test', 4, 2, 2, 3, 2129.00, 1598.00, 'Room 7', 'Sed porro repudiandae aut dolor et sunt distinctio rem.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(12, 'Brain MRI', 4, 2, 2, 1, 3339.00, 856.00, 'Room 6', 'Consectetur impedit vitae qui deleniti magnam ut.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(13, 'Cardiac Enzyme Test', 2, 2, 2, 2, 4674.00, 1186.00, 'Room 10', 'Doloremque consequatur rerum temporibus qui.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(14, 'Dengue Test', 1, 1, 2, 3, 3016.00, 2942.00, 'Room 10', 'Molestiae eius sunt et ut placeat illum.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(15, 'Malaria Test', 2, 3, 1, 1, 1814.00, 2388.00, 'Room 4', 'Et sint et eum sunt.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(16, 'Vitamin D Test', 4, 2, 1, 1, 4972.00, 3035.00, 'Room 2', 'Quam reiciendis eius officiis vero magni.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(17, 'Vitamin B12 Test', 1, 1, 2, 2, 4643.00, 4133.00, 'Room 2', 'Occaecati et quo minima magni aspernatur.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(18, 'Iron Test', 4, 4, 1, 2, 2145.00, 3308.00, 'Room 7', 'Officia eum natus illo deleniti culpa quis.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(19, 'Ferritin Test', 2, 4, 4, 3, 3736.00, 1769.00, 'Room 4', 'Eum maxime illum facilis.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(20, 'Uric Acid Test', 2, 2, 3, 2, 2143.00, 3238.00, 'Room 10', 'Velit velit veniam non illo harum.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(21, 'ESR Test', 1, 2, 1, 2, 551.00, 3914.00, 'Room 2', 'Reiciendis vel autem et pariatur quaerat animi minus.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(22, 'RBC Count Test', 3, 4, 2, 3, 3413.00, 1489.00, 'Room 3', 'At aut suscipit est minus magni suscipit.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(23, 'PCV Test', 3, 1, 4, 3, 1092.00, 754.00, 'Room 3', 'Nostrum explicabo est quidem aliquam.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(24, 'MCH Test', 2, 2, 3, 3, 4920.00, 1139.00, 'Room 7', 'Aperiam doloremque ipsam eaque delectus consequatur sunt.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(25, 'MCHC Test', 1, 4, 1, 2, 2302.00, 2341.00, 'Room 5', 'Distinctio et consectetur explicabo iure aliquam sapiente recusandae.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(26, 'RDW Test', 1, 1, 1, 3, 1316.00, 2258.00, 'Room 6', 'Occaecati totam perferendis quia tempore qui natus.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(27, 'Neutrophils Test', 2, 2, 4, 1, 2733.00, 2255.00, 'Room 5', 'Earum at culpa aut dolor consectetur ut consequuntur.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(28, 'Lymphocytes Test', 1, 4, 2, 3, 3138.00, 1808.00, 'Room 7', 'Assumenda magni beatae aliquid tempore veritatis.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(29, 'Monocytes Test', 3, 3, 1, 2, 3947.00, 3702.00, 'Room 4', 'Qui velit sed saepe placeat doloribus in.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(30, 'Eosinophils Test', 4, 1, 4, 1, 2045.00, 2631.00, 'Room 8', 'Delectus eveniet beatae occaecati.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(31, 'Basophils Test', 4, 2, 2, 1, 3052.00, 4235.00, 'Room 9', 'Harum perspiciatis officiis eligendi eum sed velit non facere.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(32, 'Prothrombin Time Test', 2, 2, 4, 2, 1803.00, 4002.00, 'Room 7', 'Quisquam facilis nostrum cum earum perferendis nobis.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(33, 'INR Test', 3, 3, 3, 3, 2682.00, 1077.00, 'Room 7', 'Alias totam et vero vitae occaecati.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(34, 'aPTT Test', 3, 2, 1, 2, 2680.00, 4282.00, 'Room 6', 'Dolore neque ut quisquam.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(35, 'HIV 1 & 2 Test', 2, 4, 4, 2, 2478.00, 3477.00, 'Room 7', 'Earum doloremque ad minima mollitia laborum.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(36, 'HCV Antibody Test', 4, 3, 3, 3, 1921.00, 2630.00, 'Room 10', 'Natus officia velit ex veniam sunt eos.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(37, 'HbA1c Test', 1, 3, 2, 1, 1830.00, 3160.00, 'Room 7', 'Hic in sunt quibusdam corrupti aliquam.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(38, 'Blood Group Test', 4, 4, 3, 3, 3926.00, 3856.00, 'Room 9', 'Animi facilis quo quos magnam perferendis.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(39, 'Pregnancy Test', 3, 3, 1, 2, 2176.00, 3222.00, 'Room 2', 'Tempore dolores sint necessitatibus.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(40, 'Stool Occult Blood Test', 3, 4, 3, 2, 1975.00, 1868.00, 'Room 8', 'Incidunt iure minus atque illum.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(41, 'Amylase Test', 3, 1, 1, 2, 1120.00, 2191.00, 'Room 2', 'Nihil corporis voluptas cum ea aut harum.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(42, 'Lipase Test', 4, 2, 3, 1, 2333.00, 2231.00, 'Room 2', 'Quo hic voluptate fuga nihil.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(43, 'LDH Test', 1, 4, 2, 2, 545.00, 1460.00, 'Room 8', 'Eius fugiat omnis et odio voluptatum.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(44, 'GGT Test', 3, 1, 2, 3, 1579.00, 1618.00, 'Room 2', 'Quo totam non repellendus rem optio dolores.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(45, 'Phosphorus Test', 2, 1, 4, 3, 3516.00, 2462.00, 'Room 6', 'Rem illo quia nam deleniti dignissimos ex et non.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(46, 'Magnesium Test', 3, 1, 1, 3, 981.00, 1189.00, 'Room 7', 'Eius porro optio saepe velit deleniti quis.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(47, 'Zinc Test', 4, 1, 3, 3, 3386.00, 3474.00, 'Room 7', 'Tempora quia ipsa impedit praesentium.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(48, 'Copper Test', 1, 2, 2, 3, 4537.00, 2208.00, 'Room 2', 'Explicabo dolore impedit voluptate neque et consequatur.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(49, 'Insulin (Fasting) Test', 1, 4, 1, 2, 3069.00, 790.00, 'Room 1', 'Et vel aut dicta in.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(50, 'Cortisol (Morning) Test', 1, 2, 4, 1, 1601.00, 1146.00, 'Room 9', 'Similique voluptas consequatur illo reiciendis illum sint.', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29');

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
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(7, '2016_06_01_000004_create_oauth_clients_table', 1),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2025_10_16_060305_create_doctors_table', 1),
(12, '2025_10_16_060344_create_lab_materials_table', 1),
(13, '2025_10_16_061019_create_expenses_table', 1),
(14, '2025_10_16_062212_create_lab_categories_table', 1),
(15, '2025_10_16_062212_create_lab_groups_table', 1),
(16, '2025_10_16_062212_create_lab_specimens_table', 1),
(17, '2025_10_16_062212_create_lab_subcategories_table', 1),
(18, '2025_10_16_064353_create_lab_tests_table', 1),
(19, '2025_10_16_065015_create_admins_table', 1),
(20, '2025_10_16_065016_create_store_tests_table', 1),
(21, '2025_10_16_085053_create_references_table', 1),
(22, '2025_10_16_124831_create_payment_details_table', 1),
(23, '2025_10_17_044528_create_companies_table', 1),
(24, '2025_10_17_154807_create_beds_table', 1),
(25, '2025_10_17_162645_create_duty_doctors_table', 1),
(26, '2025_10_17_163136_create_diseases_table', 1),
(27, '2025_10_18_113032_create_admission_patients_table', 1),
(28, '2025_10_18_181954_create_admission_bill_summaries_table', 1),
(29, '2025_10_20_153826_create_test_report_details_table', 1),
(30, '2025_10_21_103401_create_patient_test_reports_table', 1),
(31, '2025_10_21_143623_create_units_table', 1),
(32, '2025_10_21_143701_create_generics_table', 1),
(33, '2025_10_21_143740_create_presentations_table', 1),
(34, '2025_10_21_143850_create_reagents_table', 1),
(35, '2025_10_23_114129_create_reagent_stocks_table', 1),
(36, '2025_10_23_115839_create_reagent_test_table', 1),
(38, '2025_11_01_065855_create_due_collections_table', 2);

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

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('01c94eb3744e7770810091fac8ed798b8e11e2ff89aaecb54cbf822ace4f670ebefcbc5d26445b30', 1, 1, 'LaravelApp', '[]', 0, '2025-10-31 23:16:03', '2025-10-31 23:16:03', '2026-11-01 05:16:03'),
('2b52f8af9021324d80c1714d5923cdacf2d7735dd44ff5bdee81823a0b8e109cd6670fd650cb9cb5', 1, 1, 'LaravelApp', '[]', 0, '2025-10-31 22:48:25', '2025-10-31 22:48:25', '2026-11-01 04:48:25'),
('4b980471914f26bf5ecc4d6292010eaf609c47d3abc4d786dba7af495ff082bf5a4c916b69b2f61e', 1, 1, 'LaravelApp', '[]', 0, '2025-11-02 23:43:09', '2025-11-02 23:43:09', '2026-11-03 05:43:09'),
('80efb682402cc900a51ae0d684b6fa2a7a712986ca875067bbd5bdf688906a3e3f72e53469b23069', 1, 1, 'LaravelApp', '[]', 0, '2025-11-02 23:06:26', '2025-11-02 23:06:26', '2026-11-03 05:06:26');

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

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '8XKKuaefIFjqpAd4b1SaqovWINpS23bGK0xeudwW', NULL, 'http://localhost', 1, 0, 0, '2025-10-31 22:48:17', '2025-10-31 22:48:17'),
(2, NULL, 'Laravel Password Grant Client', 'U5yQ9i8AXD3nX0mRhGXfm9SUPGULVvMLF39dXo0k', 'users', 'http://localhost', 0, 1, 0, '2025-10-31 22:48:17', '2025-10-31 22:48:17');

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

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-10-31 22:48:17', '2025-10-31 22:48:17');

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
(10, 'LAB2025110314', 20, 1, 'Hemoglobin', '14.2', 'g/dL', '13.0 - 17.0', '17.0', NULL, '2025-11-03 02:48:45', '2025-11-03 02:57:38'),
(11, 'LAB2025110314', 20, 1, 'WBC Count', '6.5', '×10³/µL', '4.0 - 11.0', NULL, NULL, '2025-11-03 02:48:45', '2025-11-03 02:48:45'),
(12, 'LAB2025110314', 20, 1, 'Platelet Count', '230', '×10³/µL', '150 - 400', NULL, NULL, '2025-11-03 02:48:45', '2025-11-03 02:48:45'),
(13, 'LAB2025110314', 20, 2, 'T3', '1.3', 'ng/mL', '0.8 - 2.0', 'Normal thyroid function', NULL, '2025-11-03 02:48:45', '2025-11-03 02:48:45'),
(14, 'LAB2025110314', 20, 2, 'T4', '8.2', 'µg/dL', '5.0 - 12.0', 'Normal thyroid function', NULL, '2025-11-03 02:48:45', '2025-11-03 02:48:45'),
(15, 'LAB2025110314', 20, 2, 'TSH', '2.7', 'µIU/mL', '0.4 - 4.0', 'Normal thyroid function', NULL, '2025-11-03 02:48:45', '2025-11-03 02:48:45'),
(16, 'LAB2025110314', 20, 3, 'SGPT (ALT)', '32', 'U/L', '0 - 45', NULL, NULL, '2025-11-03 02:48:45', '2025-11-03 02:48:45'),
(17, 'LAB2025110314', 20, 3, 'SGOT (AST)', '28', 'U/L', '0 - 40', NULL, NULL, '2025-11-03 02:48:45', '2025-11-03 02:48:45'),
(18, 'LAB2025110314', 20, 3, 'Bilirubin Total', '0.8', 'mg/dL', '0.2 - 1.2', NULL, NULL, '2025-11-03 02:48:45', '2025-11-03 02:48:45'),
(19, 'LAB2025110313', 19, 7, 'pH', '6.5', NULL, '4.5 - 8.0', NULL, NULL, '2025-11-03 02:48:57', '2025-11-03 02:48:57'),
(20, 'LAB2025110313', 19, 7, 'Protein', 'Negative', NULL, 'Negative', NULL, NULL, '2025-11-03 02:48:57', '2025-11-03 02:48:57'),
(21, 'LAB2025110313', 19, 7, 'Glucose', 'Negative', NULL, 'Negative', NULL, NULL, '2025-11-03 02:48:57', '2025-11-03 02:48:57'),
(22, 'LAB2025110313', 19, 6, 'Fasting Blood Sugar', '92', 'mg/dL', '70 - 100', NULL, NULL, '2025-11-03 02:48:57', '2025-11-03 02:48:57'),
(23, 'LAB2025110313', 19, 6, 'Postprandial Blood Sugar', '128', 'mg/dL', '<140', NULL, NULL, '2025-11-03 02:48:57', '2025-11-03 02:48:57'),
(24, 'LAB2025110313', 19, 5, 'Cholesterol Total', '180', 'mg/dL', '<200', NULL, NULL, '2025-11-03 02:48:57', '2025-11-03 02:48:57'),
(25, 'LAB2025110313', 19, 5, 'HDL', '52', 'mg/dL', '>40', NULL, NULL, '2025-11-03 02:48:57', '2025-11-03 02:48:57'),
(26, 'LAB2025110313', 19, 5, 'LDL', '110', 'mg/dL', '<130', NULL, NULL, '2025-11-03 02:48:57', '2025-11-03 02:48:57'),
(27, 'LAB2025110313', 19, 5, 'Triglycerides', '145', 'mg/dL', '<150', NULL, NULL, '2025-11-03 02:48:57', '2025-11-03 02:48:57'),
(28, 'LAB2025110411', 21, 1, 'Hemoglobin', '14.2', 'g/dL', '13.0 - 17.0', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(29, 'LAB2025110411', 21, 1, 'WBC Count', '6.5', '×10³/µL', '4.0 - 11.0', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(30, 'LAB2025110411', 21, 1, 'Platelet Count', '230', '×10³/µL', '150 - 400', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(31, 'LAB2025110411', 21, 2, 'T3', '1.3', 'ng/mL', '0.8 - 2.0', 'Normal thyroid function', NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(32, 'LAB2025110411', 21, 2, 'T4', '8.2', 'µg/dL', '5.0 - 12.0', 'Normal thyroid function', NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(33, 'LAB2025110411', 21, 2, 'TSH', '2.7', 'µIU/mL', '0.4 - 4.0', 'Normal thyroid function', NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(34, 'LAB2025110411', 21, 3, 'SGPT (ALT)', '32', 'U/L', '0 - 45', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(35, 'LAB2025110411', 21, 3, 'SGOT (AST)', '28', 'U/L', '0 - 40', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(36, 'LAB2025110411', 21, 3, 'Bilirubin Total', '0.8', 'mg/dL', '0.2 - 1.2', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(37, 'LAB2025110411', 21, 4, 'Urea', '35', 'mg/dL', '15 - 45', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(38, 'LAB2025110411', 21, 4, 'Creatinine', '1.1', 'mg/dL', '0.7 - 1.4', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(39, 'LAB2025110411', 21, 5, 'Cholesterol Total', '180', 'mg/dL', '<200', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(40, 'LAB2025110411', 21, 5, 'HDL', '52', 'mg/dL', '>40', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(41, 'LAB2025110411', 21, 5, 'LDL', '110', 'mg/dL', '<130', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(42, 'LAB2025110411', 21, 5, 'Triglycerides', '145', 'mg/dL', '<150', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(43, 'LAB2025110411', 21, 6, 'Fasting Blood Sugar', '92', 'mg/dL', '70 - 100', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(44, 'LAB2025110411', 21, 6, 'Postprandial Blood Sugar', '128', 'mg/dL', '<140', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(45, 'LAB2025110411', 21, 7, 'pH', '6.5', NULL, '4.5 - 8.0', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(46, 'LAB2025110411', 21, 7, 'Protein', 'Negative', NULL, 'Negative', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47'),
(47, 'LAB2025110411', 21, 7, 'Glucose', 'Negative', NULL, 'Negative', NULL, NULL, '2025-11-03 22:38:47', '2025-11-03 22:38:47');

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
(1, 'LAB2025110111', '2025-11-01', 'Shamim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 14, 13, 8895, 0, 8895, 8895, 0, 0, 0, 1, 1, '2025-10-31 22:43:41', '2025-10-31 22:43:41'),
(2, 'LAB2025110112', '2025-11-01', 'Shamim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 2, 1, 9920, 4000, 5920, 5000, 1, 920, 0, 1, 1, '2025-10-31 23:42:24', '2025-10-31 23:42:24'),
(3, 'LAB2025110113', '2025-11-01', 'John Doe', '1998-12-31', 'Male', '1762164746', 'Dhaka, Bangladesh', 1, 5, 7940, 3500, 4440, 4440, 0, 0, 0, 1, 1, '2025-10-31 23:44:59', '2025-10-31 23:44:59'),
(4, 'LAB2025110114', '2025-11-01', 'John Doe', '1998-12-31', 'Male', '1762164746', 'Dhaka, Bangladesh', 1, 5, 10007, 3500, 6507, 6507, 0, 0, 0, 1, 1, '2025-11-01 00:31:45', '2025-11-01 00:31:45'),
(5, 'LAB2025110115', '2025-11-01', 'John Doe', '1998-12-31', 'Male', '1762164746', 'Dhaka, Bangladesh', 1, 5, 10007, 3500, 6507, 1000, 0, 5507, 0, 1, 1, '2025-11-01 00:32:08', '2025-11-01 04:57:26'),
(6, 'LAB2025110116', '2025-11-01', 'Shamim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 15, 15, 4275, 0, 4275, 0, 0, 4275, 0, 1, 1, '2025-11-01 02:43:51', '2025-11-01 02:47:39'),
(7, 'LAB2025110117', '2025-11-01', 'Fahim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 13, 11, 9646, 646, 9000, 5000, 0, 4000, 0, 1, 1, '2025-11-01 05:50:04', '2025-11-01 05:50:17'),
(8, 'LAB2025110118', '2025-11-01', 'Riayd Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 14, 10, 6072, 72, 6000, 1000, 0, 5000, 0, 1, 1, '2025-11-01 05:51:28', '2025-11-01 05:51:41'),
(9, 'LAB2025110119', '2025-11-01', 'Akbor Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 15, 13, 5165, 165, 5000, 1000, 0, 4000, 0, 1, 1, '2025-11-01 05:53:16', '2025-11-01 05:53:31'),
(10, 'LAB20251101110', '2025-11-01', 'Kobir Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 11, 4, 9646, 646, 9000, 4000, 0, 5000, 0, 1, 1, '2025-11-01 06:00:18', '2025-11-01 06:00:37'),
(11, 'LAB20251101111', '2025-11-01', 'Hamza Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 14, 14, 9219, 219, 9000, 4000, 0, 5000, 0, 1, 1, '2025-11-01 06:02:58', '2025-11-01 06:03:35'),
(12, 'LAB20251101112', '2025-11-01', 'Shamim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 11, 12, 4275, 0, 4275, 0, 0, 4275, 0, 1, 1, '2025-11-01 06:04:12', '2025-11-01 06:04:24'),
(13, 'LAB20251101113', '2025-11-01', 'Rashed Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 9, 10, 30413, 12413, 18000, 15000, 0, 3000, 0, 1, 1, '2025-11-01 06:11:38', '2025-11-01 06:11:58'),
(14, 'LAB20251101114', '2025-11-01', 'Rafiq Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 14, 9, 8895, 895, 8000, 1000, 0, 7000, 0, 1, 1, '2025-11-01 06:14:46', '2025-11-01 06:15:01'),
(15, 'LAB20251101115', '2025-11-01', 'Rafiya Hossain', '2001-12-31', 'Female', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 14, 14, 2553, 0, 2553, 0, 0, 2553, 0, 1, 1, '2025-11-01 06:19:14', '2025-11-01 06:19:29'),
(16, 'LAB20251101116', '2025-11-01', 'Karim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 13, 9, 8895, 0, 8895, 0, 0, 8895, 0, 1, 1, '2025-11-01 06:20:59', '2025-11-01 06:21:13'),
(17, 'LAB2025110311', '2025-11-03', 'Fahim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 15, 14, 14012, 12, 14000, 4000, 0, 10000, 0, 1, 1, '2025-11-02 23:07:32', '2025-11-02 23:45:15'),
(18, 'LAB2025110312', '2025-11-03', 'Kalam Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 14, 13, 16701, 701, 16000, 4000, 0, 12000, 0, 1, 1, '2025-11-02 23:45:53', '2025-11-03 00:13:13'),
(19, 'LAB2025110313', '2025-11-03', 'Sumon Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 14, 12, 9219, 219, 9000, 2000, 0, 7000, 0, 1, 1, '2025-11-03 01:10:12', '2025-11-03 01:10:37'),
(20, 'LAB2025110314', '2025-11-03', 'Dipjol Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 15, 15, 8895, 500, 8395, 8395, 0, 0, 0, 1, 1, '2025-11-03 02:26:23', '2025-11-03 02:26:23'),
(21, 'LAB2025110411', '2025-11-04', 'Rakibul Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 7, 4, 19566, 566, 19000, 15000, 0, 4000, 0, 1, 1, '2025-11-03 22:38:20', '2025-11-03 22:38:35');

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
(1, 'Tablet', '2025-10-31 22:42:31', '2025-10-22 11:00:20'),
(2, 'Capsule', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(3, 'Syrup', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(4, 'Injection', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(5, 'Powder', '2025-10-31 22:42:31', '2025-10-31 22:42:31');

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
(1, 'Acetone', 1, 1, 1, 301.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(2, 'Alcohol', 1, 1, 1, 78.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(3, 'Ammonia', 1, 1, 1, 333.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(4, 'Benzene', 1, 1, 1, 50.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(5, 'Calcium Chloride', 1, 1, 1, 72.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(6, 'Chloroform', 1, 1, 1, 254.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(7, 'Citric Acid', 1, 1, 1, 244.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(8, 'Copper Sulphate', 1, 1, 1, 500.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(9, 'Formaldehyde', 1, 1, 1, 330.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(10, 'Glucose', 1, 1, 1, 483.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(11, 'Glycerol', 1, 1, 1, 288.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(12, 'Hydrochloric Acid', 1, 1, 1, 257.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(13, 'Hydrogen Peroxide', 1, 1, 1, 262.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(14, 'Iodine', 1, 1, 1, 126.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(15, 'Iron Sulphate', 1, 1, 1, 409.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(16, 'Magnesium Sulphate', 1, 1, 1, 101.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(17, 'Methanol', 1, 1, 1, 159.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(18, 'Nitric Acid', 1, 1, 1, 262.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(19, 'Phenol', 1, 1, 1, 402.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(20, 'Potassium Chloride', 1, 1, 1, 55.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(21, 'Potassium Hydroxide', 1, 1, 1, 126.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(22, 'Sodium Bicarbonate', 1, 1, 1, 459.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(23, 'Sodium Carbonate', 1, 1, 1, 194.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(24, 'Sodium Chloride', 1, 1, 1, 154.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(25, 'Sodium Hydroxide', 1, 1, 1, 205.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(26, 'Sulfuric Acid', 1, 1, 1, 225.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(27, 'Toluene', 1, 1, 1, 482.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(28, 'Urea', 1, 1, 1, 215.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(29, 'Zinc Sulphate', 1, 1, 1, 137.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(30, 'Sodium Nitrate', 1, 1, 1, 367.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(31, 'Ammonium Chloride', 1, 1, 1, 484.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(32, 'Barium Sulphate', 1, 1, 1, 95.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(33, 'Ethyl Acetate', 1, 1, 1, 441.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(34, 'Formic Acid', 1, 1, 1, 56.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(35, 'Hydrazine', 1, 1, 1, 349.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(36, 'Lithium Carbonate', 1, 1, 1, 89.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(37, 'Magnesium Hydroxide', 1, 1, 1, 286.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(38, 'Manganese Sulphate', 1, 1, 1, 369.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(39, 'Nickel Sulphate', 1, 1, 1, 365.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(40, 'Phenolphthalein', 1, 1, 1, 364.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(41, 'Potassium Bromide', 1, 1, 1, 489.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(42, 'Silver Nitrate', 1, 1, 1, 87.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(43, 'Sodium Sulphate', 1, 1, 1, 251.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(44, 'Sulfur', 1, 1, 1, 207.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(45, 'Thymol', 1, 1, 1, 420.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(46, 'Triethanolamine', 1, 1, 1, 356.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(47, 'Xylene', 1, 1, 1, 408.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(48, 'Zinc Chloride', 1, 1, 1, 225.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(49, 'Aluminium Sulphate', 1, 1, 1, 51.00, 50, '2025-10-31 22:42:31', '2025-10-31 22:42:31');

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
(1, 1, 19, 10.00, '2025-11-03 01:44:42', '2025-11-03 01:44:42'),
(2, 5, 15, 150.00, '2025-11-03 02:29:36', '2025-11-03 02:29:36'),
(3, 2, 19, 12.50, '2025-11-03 02:29:44', '2025-11-03 02:29:44');

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
(1, 'Mr. John Smith', 'Consultant', 'john@example.com', '01710000001', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(2, 'Ms. Alice Johnson', 'Lab Manager', 'alice@example.com', '01710000002', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(3, 'Dr. Robert Brown', 'Physician', 'robert@example.com', '01710000003', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(4, 'Dr. Emily Davis', 'Surgeon', 'emily@example.com', '01710000004', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(5, 'Mr. Michael Wilson', 'Technician', 'michael@example.com', '01710000005', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(6, 'Ms. Sophia Taylor', 'Nurse', 'sophia@example.com', '01710000006', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(7, 'Dr. William Martinez', 'Radiologist', 'william@example.com', '01710000007', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(8, 'Dr. Olivia Anderson', 'Oncologist', 'olivia@example.com', '01710000008', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(9, 'Dr. James Thomas', 'Endocrinologist', 'james@example.com', '01710000009', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(10, 'Dr. Isabella Jackson', 'Pediatrician', 'isabella@example.com', '01710000010', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(11, 'Dr. Benjamin White', 'Cardiologist', 'benjamin@example.com', '01710000011', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(12, 'Dr. Mia Harris', 'Neurologist', 'mia@example.com', '01710000012', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(13, 'Dr. Daniel Clark', 'Orthopedic', 'daniel@example.com', '01710000013', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(14, 'Dr. Charlotte Lewis', 'Dermatologist', 'charlotte@example.com', '01710000014', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29'),
(15, 'Dr. Matthew Lee', 'Ophthalmologist', 'matthew@example.com', '01710000015', 1, '2025-10-31 22:42:29', '2025-10-31 22:42:29');

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
(1, 'LAB2025110111', 1, 1, 4275.00, 4289.00, 4, 3, 3, 2, 'Room 7', 1, 0, '2025-10-31 22:43:26', '2025-10-31 22:43:26'),
(2, 'LAB2025110111', 1, 2, 2067.00, 2055.00, 3, 3, 2, 3, 'Room 10', 1, 0, '2025-10-31 22:43:26', '2025-10-31 22:43:26'),
(3, 'LAB2025110111', 1, 3, 2553.00, 1183.00, 4, 4, 4, 3, 'Room 10', 1, 0, '2025-10-31 22:43:26', '2025-10-31 22:43:26'),
(4, 'LAB2025110112', 1, 1, 4275.00, 4289.00, 4, 3, 3, 2, 'Room 7', 1, 0, '2025-10-31 23:16:27', '2025-10-31 23:16:27'),
(5, 'LAB2025110112', 1, 2, 2067.00, 2055.00, 3, 3, 2, 3, 'Room 10', 1, 0, '2025-10-31 23:25:17', '2025-10-31 23:25:17'),
(6, 'LAB2025110112', 1, 7, 3578.00, 443.00, 4, 2, 1, 2, 'Room 7', 1, 0, '2025-10-31 23:25:45', '2025-10-31 23:25:45'),
(7, 'LAB2025110113', 1, 1, 4275.00, 4289.00, 4, 3, 3, 2, 'Room 7', 1, 0, '2025-10-31 23:44:52', '2025-10-31 23:44:52'),
(8, 'LAB2025110113', 1, 10, 3665.00, 1334.00, 1, 3, 2, 2, 'Room 8', 1, 0, '2025-10-31 23:44:55', '2025-10-31 23:44:55'),
(9, 'LAB2025110114', 1, 10, 3665.00, 1334.00, 1, 3, 2, 2, 'Room 8', 1, 0, '2025-11-01 00:31:33', '2025-11-01 00:31:33'),
(10, 'LAB2025110114', 1, 1, 4275.00, 4289.00, 4, 3, 3, 2, 'Room 7', 1, 0, '2025-11-01 00:31:36', '2025-11-01 00:31:36'),
(11, 'LAB2025110114', 1, 2, 2067.00, 2055.00, 3, 3, 2, 3, 'Room 10', 1, 0, '2025-11-01 00:31:39', '2025-11-01 00:31:39'),
(12, 'LAB2025110115', 1, 2, 2067.00, 2055.00, 3, 3, 2, 3, 'Room 10', 1, 0, '2025-11-01 00:31:59', '2025-11-01 00:31:59'),
(13, 'LAB2025110115', 1, 1, 4275.00, 4289.00, 4, 3, 3, 2, 'Room 7', 1, 0, '2025-11-01 00:32:01', '2025-11-01 00:32:01'),
(14, 'LAB2025110115', 1, 10, 3665.00, 1334.00, 1, 3, 2, 2, 'Room 8', 1, 0, '2025-11-01 00:32:04', '2025-11-01 00:32:04'),
(15, 'LAB2025110116', 1, 1, 4275.00, 4289.00, 4, 3, 3, 2, 'Room 7', 1, 0, '2025-11-01 02:43:44', '2025-11-01 02:43:44'),
(16, 'LAB2025110117', 1, 3, 2553.00, 1183.00, 4, 4, 4, 3, 'Room 10', 1, 0, '2025-11-01 05:49:51', '2025-11-01 05:49:51'),
(17, 'LAB2025110117', 1, 4, 1452.00, 3395.00, 1, 4, 1, 2, 'Room 8', 1, 0, '2025-11-01 05:49:51', '2025-11-01 05:49:51'),
(18, 'LAB2025110117', 1, 5, 2149.00, 588.00, 3, 2, 4, 1, 'Room 3', 1, 0, '2025-11-01 05:49:51', '2025-11-01 05:49:51'),
(19, 'LAB2025110117', 1, 6, 3492.00, 2046.00, 4, 3, 2, 3, 'Room 7', 1, 0, '2025-11-01 05:49:52', '2025-11-01 05:49:52'),
(20, 'LAB2025110118', 1, 2, 2067.00, 2055.00, 3, 3, 2, 3, 'Room 10', 1, 0, '2025-11-01 05:51:15', '2025-11-01 05:51:15'),
(21, 'LAB2025110118', 1, 3, 2553.00, 1183.00, 4, 4, 4, 3, 'Room 10', 1, 0, '2025-11-01 05:51:15', '2025-11-01 05:51:15'),
(22, 'LAB2025110118', 1, 4, 1452.00, 3395.00, 1, 4, 1, 2, 'Room 8', 1, 0, '2025-11-01 05:51:15', '2025-11-01 05:51:15'),
(23, 'LAB2025110119', 1, 7, 3578.00, 443.00, 4, 2, 1, 2, 'Room 7', 1, 0, '2025-11-01 05:52:59', '2025-11-01 05:52:59'),
(24, 'LAB2025110119', 1, 8, 1587.00, 3344.00, 2, 3, 3, 1, 'Room 10', 1, 0, '2025-11-01 05:53:00', '2025-11-01 05:53:00'),
(25, 'LAB20251101110', 1, 3, 2553.00, 1183.00, 4, 4, 4, 3, 'Room 10', 1, 0, '2025-11-01 05:59:59', '2025-11-01 05:59:59'),
(26, 'LAB20251101110', 1, 4, 1452.00, 3395.00, 1, 4, 1, 2, 'Room 8', 1, 0, '2025-11-01 06:00:00', '2025-11-01 06:00:00'),
(27, 'LAB20251101110', 1, 5, 2149.00, 588.00, 3, 2, 4, 1, 'Room 3', 1, 0, '2025-11-01 06:00:00', '2025-11-01 06:00:00'),
(28, 'LAB20251101110', 1, 6, 3492.00, 2046.00, 4, 3, 2, 3, 'Room 7', 1, 0, '2025-11-01 06:00:00', '2025-11-01 06:00:00'),
(29, 'LAB20251101111', 1, 5, 2149.00, 588.00, 3, 2, 4, 1, 'Room 3', 1, 0, '2025-11-01 06:02:41', '2025-11-01 06:02:41'),
(30, 'LAB20251101111', 1, 6, 3492.00, 2046.00, 4, 3, 2, 3, 'Room 7', 1, 0, '2025-11-01 06:02:41', '2025-11-01 06:02:41'),
(31, 'LAB20251101111', 1, 7, 3578.00, 443.00, 4, 2, 1, 2, 'Room 7', 1, 0, '2025-11-01 06:02:42', '2025-11-01 06:02:42'),
(32, 'LAB20251101112', 1, 1, 4275.00, 4289.00, 4, 3, 3, 2, 'Room 7', 1, 0, '2025-11-01 06:04:07', '2025-11-01 06:04:07'),
(33, 'LAB20251101113', 1, 7, 3578.00, 443.00, 4, 2, 1, 2, 'Room 7', 1, 0, '2025-11-01 06:11:07', '2025-11-01 06:11:07'),
(34, 'LAB20251101113', 1, 6, 3492.00, 2046.00, 4, 3, 2, 3, 'Room 7', 1, 0, '2025-11-01 06:11:07', '2025-11-01 06:11:07'),
(35, 'LAB20251101113', 1, 5, 2149.00, 588.00, 3, 2, 4, 1, 'Room 3', 1, 0, '2025-11-01 06:11:08', '2025-11-01 06:11:08'),
(36, 'LAB20251101113', 1, 4, 1452.00, 3395.00, 1, 4, 1, 2, 'Room 8', 1, 0, '2025-11-01 06:11:08', '2025-11-01 06:11:08'),
(37, 'LAB20251101113', 1, 3, 2553.00, 1183.00, 4, 4, 4, 3, 'Room 10', 1, 0, '2025-11-01 06:11:08', '2025-11-01 06:11:08'),
(38, 'LAB20251101113', 1, 2, 2067.00, 2055.00, 3, 3, 2, 3, 'Room 10', 1, 0, '2025-11-01 06:11:09', '2025-11-01 06:11:09'),
(39, 'LAB20251101113', 1, 1, 4275.00, 4289.00, 4, 3, 3, 2, 'Room 7', 1, 0, '2025-11-01 06:11:09', '2025-11-01 06:11:09'),
(40, 'LAB20251101113', 1, 29, 3947.00, 3702.00, 3, 3, 1, 2, 'Room 4', 1, 0, '2025-11-01 06:11:10', '2025-11-01 06:11:10'),
(41, 'LAB20251101113', 1, 30, 2045.00, 2631.00, 4, 1, 4, 1, 'Room 8', 1, 0, '2025-11-01 06:11:10', '2025-11-01 06:11:10'),
(42, 'LAB20251101113', 1, 31, 3052.00, 4235.00, 4, 2, 2, 1, 'Room 9', 1, 0, '2025-11-01 06:11:11', '2025-11-01 06:11:11'),
(43, 'LAB20251101113', 1, 32, 1803.00, 4002.00, 2, 2, 4, 2, 'Room 7', 1, 0, '2025-11-01 06:11:11', '2025-11-01 06:11:11'),
(44, 'LAB20251101114', 1, 3, 2553.00, 1183.00, 4, 4, 4, 3, 'Room 10', 1, 0, '2025-11-01 06:14:25', '2025-11-01 06:14:25'),
(45, 'LAB20251101114', 1, 2, 2067.00, 2055.00, 3, 3, 2, 3, 'Room 10', 1, 0, '2025-11-01 06:14:26', '2025-11-01 06:14:26'),
(46, 'LAB20251101114', 1, 1, 4275.00, 4289.00, 4, 3, 3, 2, 'Room 7', 1, 0, '2025-11-01 06:14:26', '2025-11-01 06:14:26'),
(47, 'LAB20251101115', 1, 3, 2553.00, 1183.00, 4, 4, 4, 3, 'Room 10', 1, 0, '2025-11-01 06:19:04', '2025-11-01 06:19:04'),
(48, 'LAB20251101116', 1, 3, 2553.00, 1183.00, 4, 4, 4, 3, 'Room 10', 1, 0, '2025-11-01 06:20:47', '2025-11-01 06:20:47'),
(49, 'LAB20251101116', 1, 2, 2067.00, 2055.00, 3, 3, 2, 3, 'Room 10', 1, 0, '2025-11-01 06:20:48', '2025-11-01 06:20:48'),
(50, 'LAB20251101116', 1, 1, 4275.00, 4289.00, 4, 3, 3, 2, 'Room 7', 1, 0, '2025-11-01 06:20:48', '2025-11-01 06:20:48'),
(51, 'LAB2025110311', 1, 1, 4275.00, 4289.00, 4, 3, 3, 2, 'Room 7', 1, 0, '2025-11-02 23:06:57', '2025-11-02 23:06:57'),
(52, 'LAB2025110311', 1, 2, 2067.00, 2055.00, 3, 3, 2, 3, 'Room 10', 1, 0, '2025-11-02 23:07:01', '2025-11-02 23:07:01'),
(53, 'LAB2025110311', 1, 3, 2553.00, 1183.00, 4, 4, 4, 3, 'Room 10', 1, 0, '2025-11-02 23:07:04', '2025-11-02 23:07:04'),
(54, 'LAB2025110311', 1, 4, 1452.00, 3395.00, 1, 4, 1, 2, 'Room 8', 1, 0, '2025-11-02 23:07:07', '2025-11-02 23:07:07'),
(55, 'LAB2025110311', 1, 10, 3665.00, 1334.00, 1, 3, 2, 2, 'Room 8', 1, 0, '2025-11-02 23:07:12', '2025-11-02 23:07:12'),
(56, 'LAB2025110312', 1, 1, 4275.00, 4289.00, 4, 3, 3, 2, 'Room 7', 1, 0, '2025-11-02 23:45:31', '2025-11-02 23:45:31'),
(57, 'LAB2025110312', 1, 3, 2553.00, 1183.00, 4, 4, 4, 3, 'Room 10', 1, 0, '2025-11-02 23:45:32', '2025-11-02 23:45:32'),
(58, 'LAB2025110312', 1, 4, 1452.00, 3395.00, 1, 4, 1, 2, 'Room 8', 1, 0, '2025-11-02 23:45:32', '2025-11-02 23:45:32'),
(59, 'LAB2025110312', 1, 5, 2149.00, 588.00, 3, 2, 4, 1, 'Room 3', 1, 0, '2025-11-02 23:45:32', '2025-11-02 23:45:32'),
(60, 'LAB2025110312', 1, 7, 3578.00, 443.00, 4, 2, 1, 2, 'Room 7', 1, 0, '2025-11-02 23:45:33', '2025-11-02 23:45:33'),
(61, 'LAB2025110312', 1, 20, 2143.00, 3238.00, 2, 2, 3, 2, 'Room 10', 1, 0, '2025-11-02 23:45:35', '2025-11-02 23:45:35'),
(62, 'LAB2025110312', 1, 21, 551.00, 3914.00, 1, 2, 1, 2, 'Room 2', 1, 0, '2025-11-02 23:45:35', '2025-11-02 23:45:35'),
(63, 'LAB2025110313', 1, 7, 3578.00, 443.00, 4, 2, 1, 2, 'Room 7', 1, 0, '2025-11-03 01:09:41', '2025-11-03 01:09:41'),
(64, 'LAB2025110313', 1, 6, 3492.00, 2046.00, 4, 3, 2, 3, 'Room 7', 1, 0, '2025-11-03 01:09:41', '2025-11-03 01:09:41'),
(65, 'LAB2025110313', 1, 5, 2149.00, 588.00, 3, 2, 4, 1, 'Room 3', 1, 0, '2025-11-03 01:09:42', '2025-11-03 01:09:42'),
(66, 'LAB2025110314', 1, 1, 4275.00, 4289.00, 4, 3, 3, 2, 'Room 7', 1, 0, '2025-11-03 02:26:00', '2025-11-03 02:26:00'),
(67, 'LAB2025110314', 1, 2, 2067.00, 2055.00, 3, 3, 2, 3, 'Room 10', 1, 0, '2025-11-03 02:26:03', '2025-11-03 02:26:03'),
(68, 'LAB2025110314', 1, 3, 2553.00, 1183.00, 4, 4, 4, 3, 'Room 10', 1, 0, '2025-11-03 02:26:04', '2025-11-03 02:26:04'),
(69, 'LAB2025110411', 1, 1, 4275.00, 4289.00, 4, 3, 3, 2, 'Room 7', 1, 0, '2025-11-03 22:38:02', '2025-11-03 22:38:02'),
(70, 'LAB2025110411', 1, 2, 2067.00, 2055.00, 3, 3, 2, 3, 'Room 10', 1, 0, '2025-11-03 22:38:02', '2025-11-03 22:38:02'),
(71, 'LAB2025110411', 1, 3, 2553.00, 1183.00, 4, 4, 4, 3, 'Room 10', 1, 0, '2025-11-03 22:38:02', '2025-11-03 22:38:02'),
(72, 'LAB2025110411', 1, 4, 1452.00, 3395.00, 1, 4, 1, 2, 'Room 8', 1, 0, '2025-11-03 22:38:03', '2025-11-03 22:38:03'),
(73, 'LAB2025110411', 1, 5, 2149.00, 588.00, 3, 2, 4, 1, 'Room 3', 1, 0, '2025-11-03 22:38:03', '2025-11-03 22:38:03'),
(74, 'LAB2025110411', 1, 6, 3492.00, 2046.00, 4, 3, 2, 3, 'Room 7', 1, 0, '2025-11-03 22:38:04', '2025-11-03 22:38:04'),
(75, 'LAB2025110411', 1, 7, 3578.00, 443.00, 4, 2, 1, 2, 'Room 7', 1, 0, '2025-11-03 22:38:05', '2025-11-03 22:38:05');

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
(1, 'mg', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(2, 'ml', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(3, 'g', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(4, 'L', '2025-10-31 22:42:31', '2025-10-22 10:52:17'),
(5, 'tablet', '2025-10-31 22:42:31', '2025-10-31 22:42:31'),
(6, 'capsule', '2025-10-31 22:42:31', '2025-10-31 22:42:31');

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
-- Indexes for table `due_collections`
--
ALTER TABLE `due_collections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `due_collections_user_id_foreign` (`user_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `admission_patients`
--
ALTER TABLE `admission_patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
-- AUTO_INCREMENT for table `due_collections`
--
ALTER TABLE `due_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient_test_reports`
--
ALTER TABLE `patient_test_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

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
-- Constraints for table `due_collections`
--
ALTER TABLE `due_collections`
  ADD CONSTRAINT `due_collections_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`);

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
