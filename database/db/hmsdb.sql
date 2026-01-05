-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 05, 2026 at 01:31 PM
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
  `role` varchar(255) NOT NULL DEFAULT 'staff',
  `address1` text DEFAULT NULL,
  `address2` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `national_id` varchar(255) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `father_profession` varchar(255) DEFAULT NULL,
  `father_contact` varchar(20) DEFAULT NULL,
  `father_email` varchar(255) DEFAULT NULL,
  `father_nid` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `mother_profession` varchar(255) DEFAULT NULL,
  `mother_contact` varchar(20) DEFAULT NULL,
  `mother_email` varchar(255) DEFAULT NULL,
  `mother_nid` varchar(255) DEFAULT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `guardian_contact` varchar(20) DEFAULT NULL,
  `guardian_email` varchar(255) DEFAULT NULL,
  `guardian_nid` varchar(255) DEFAULT NULL,
  `guardian_relationship` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `father_photo` varchar(255) DEFAULT NULL,
  `mother_photo` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `remark` varchar(255) DEFAULT NULL,
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

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `role`, `address1`, `address2`, `dob`, `gender`, `blood_group`, `religion`, `nationality`, `national_id`, `contact_number`, `father_name`, `father_profession`, `father_contact`, `father_email`, `father_nid`, `mother_name`, `mother_profession`, `mother_contact`, `mother_email`, `mother_nid`, `guardian_name`, `guardian_contact`, `guardian_email`, `guardian_nid`, `guardian_relationship`, `photo`, `father_photo`, `mother_photo`, `status`, `remark`, `otp`, `otp_expires_at`, `email_verified_at`, `last_login_at`, `last_login_ip`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rahim Uddin', 'rahim@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'staff', 'Dhaka', NULL, '1995-05-12', 'Male', 'A+', 'Islam', 'Bangladeshi', '1234567890', '+8801710000001', 'Karim Uddin', NULL, '+8801810000001', NULL, NULL, 'Ayesha Begum', NULL, '+8801910000001', NULL, NULL, 'Karim Uddin', '+8801810000001', NULL, 'GDN001', 'Father', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03 23:42:12', '2026-01-03 23:42:12'),
(2, 'Hasan Ali', 'hasan@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'manager', 'Chattogram', NULL, '1993-03-20', 'Male', 'B+', 'Islam', 'Bangladeshi', '1234567891', '+8801710000002', 'Jamal Ali', NULL, '+8801810000002', NULL, NULL, 'Rokeya Begum', NULL, '+8801910000002', NULL, NULL, 'Jamal Ali', '+8801810000002', NULL, 'GDN002', 'Father', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03 23:42:12', '2026-01-03 23:42:12'),
(3, 'Sumaiya Akter', 'sumaiya@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'staff', 'Sylhet', NULL, '1998-07-15', 'Female', 'O+', 'Islam', 'Bangladeshi', '1234567892', '+8801710000003', 'Abdul Mannan', NULL, '+8801810000003', NULL, NULL, 'Salma Begum', NULL, '+8801910000003', NULL, NULL, 'Abdul Mannan', '+8801810000003', NULL, 'GDN003', 'Father', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03 23:42:12', '2026-01-03 23:42:12'),
(4, 'Tanvir Ahmed', 'tanvir@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 'Rajshahi', NULL, '1990-11-02', 'Male', 'AB+', 'Islam', 'Bangladeshi', '1234567893', '+8801710000004', 'Habib Ahmed', NULL, '+8801810000004', NULL, NULL, 'Nasrin Begum', NULL, '+8801910000004', NULL, NULL, 'Habib Ahmed', '+8801810000004', NULL, 'GDN004', 'Father', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03 23:42:12', '2026-01-03 23:42:12'),
(5, 'Nusrat Jahan', 'nusrat@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'staff', 'Khulna', NULL, '1997-01-10', 'Female', 'A-', 'Islam', 'Bangladeshi', '1234567894', '+8801710000005', 'Shahidul Islam', NULL, '+8801810000005', NULL, NULL, 'Farida Begum', NULL, '+8801910000005', NULL, NULL, 'Shahidul Islam', '+8801810000005', NULL, 'GDN005', 'Father', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03 23:42:12', '2026-01-03 23:42:12'),
(6, 'Imran Hossain', 'imran@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'manager', 'Barishal', NULL, '1994-09-18', 'Male', 'O-', 'Islam', 'Bangladeshi', '1234567895', '+8801710000006', 'Selim Hossain', NULL, '+8801810000006', NULL, NULL, 'Lipi Begum', NULL, '+8801910000006', NULL, NULL, 'Selim Hossain', '+8801810000006', NULL, 'GDN006', 'Father', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03 23:42:12', '2026-01-03 23:42:12'),
(7, 'Sharmin Sultana', 'sharmin@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'staff', 'Rangpur', NULL, '1999-12-25', 'Female', 'B-', 'Islam', 'Bangladeshi', '1234567896', '+8801710000007', 'Nazrul Islam', NULL, '+8801810000007', NULL, NULL, 'Rehana Begum', NULL, '+8801910000007', NULL, NULL, 'Nazrul Islam', '+8801810000007', NULL, 'GDN007', 'Father', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03 23:42:12', '2026-01-03 23:42:12'),
(8, 'Arif Khan', 'arif@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'staff', 'Cumilla', NULL, '1996-06-08', 'Male', 'A+', 'Islam', 'Bangladeshi', '1234567897', '+8801710000008', 'Rafiq Khan', NULL, '+8801810000008', NULL, NULL, 'Hasina Begum', NULL, '+8801910000008', NULL, NULL, 'Rafiq Khan', '+8801810000008', NULL, 'GDN008', 'Father', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03 23:42:12', '2026-01-03 23:42:12'),
(9, 'Mithila Roy', 'mithila@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'staff', 'Mymensingh', NULL, '2000-02-14', 'Female', 'O+', 'Hindu', 'Bangladeshi', '1234567898', '+8801710000009', 'Anil Roy', NULL, '+8801810000009', NULL, NULL, 'Kakoli Roy', NULL, '+8801910000009', NULL, NULL, 'Anil Roy', '+8801810000009', NULL, 'GDN009', 'Father', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03 23:42:12', '2026-01-03 23:42:12'),
(10, 'Sabbir Ahmed', 'sabbir@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'superadmin', 'Dhaka', 'Kaliakair, Gazipur, Dhaka, Bangladesh', NULL, 'Male', 'AB-', 'Islam', 'Bangladeshi', '1234567899', '+8801710000010', 'Abdul Jalil', 'Farmer', '+8801810000010', 'father@gamil.com', '321654987', 'Sufia Begum', 'House Wife', '+8801910000010', 'mother@gmail.com', '32146574987', 'Abdul Jalil', '+8801810000010', 'jalil@gamil.com', 'GDN010', 'Father', 'staff-10-1767592067.jpg', 'father-10-1767592127.jpg', 'mother-10-1767592127.jpg', 1, 'N/A', NULL, NULL, NULL, '2026-01-05 07:52:28', '127.0.0.1', 'bKPLeMwK1HwF5bUHmYC99S2Ojy5nazbbOMUw6QDC9DRKd6McvW4hY9HZWyGV', '2026-01-03 23:42:12', '2026-01-05 07:52:28'),
(11, 'Fahim Ahmed', 'fahim@gmail.com', '$2y$12$lo4zOT3KkPbV5iVVMLrSGeNTlwMGTEihIYhFSfIuWG8scNhYnLnMO', 'staff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01745215486', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03 23:42:23', '2026-01-03 23:42:23'),
(12, 'Robert Brown', 'admin@admin.com', '$2y$12$IcntpwnSk6KBZXMIJXzRnOs6NPSeZqPIXCcefF2/0gtQ6vOio4acq', 'staff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01478523695', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-03 23:44:31', '2026-01-03 23:44:31');

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
(1, 'B001', 'Cabin', 'available', 1912.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(2, 'B002', 'Emergency', 'available', 671.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(3, 'B003', 'Cabin', 'available', 862.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(4, 'B004', 'ICU', 'available', 547.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(5, 'B005', 'ICU', 'available', 1931.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(6, 'B006', 'Male Ward', 'available', 1977.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(7, 'B007', 'Male Ward', 'available', 1807.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(8, 'B008', 'Emergency', 'available', 1148.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(9, 'B009', 'ICU', 'available', 1897.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(10, 'B010', 'ICU', 'available', 1208.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(11, 'B011', 'Cabin', 'available', 515.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(12, 'B012', 'ICU', 'available', 792.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(13, 'B013', 'Male Ward', 'available', 967.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(14, 'B014', 'ICU', 'available', 884.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(15, 'B015', 'Cabin', 'available', 635.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(16, 'B016', 'Emergency', 'available', 839.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(17, 'B017', 'Male Ward', 'available', 831.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(18, 'B018', 'ICU', 'available', 503.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(19, 'B019', 'Female Ward', 'available', 866.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(20, 'B020', 'Male Ward', 'available', 798.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(21, 'B021', 'Female Ward', 'available', 1859.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(22, 'B022', 'Cabin', 'available', 1520.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(23, 'B023', 'Cabin', 'available', 736.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(24, 'B024', 'Emergency', 'available', 1788.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(25, 'B025', 'Emergency', 'available', 1266.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(26, 'B026', 'ICU', 'available', 1016.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(27, 'B027', 'Male Ward', 'available', 1228.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(28, 'B028', 'Male Ward', 'available', 1383.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(29, 'B029', 'ICU', 'available', 525.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(30, 'B030', 'Cabin', 'available', 1423.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(31, 'B031', 'Male Ward', 'available', 1915.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(32, 'B032', 'Female Ward', 'available', 1434.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(33, 'B033', 'ICU', 'available', 518.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(34, 'B034', 'Female Ward', 'available', 1422.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(35, 'B035', 'Cabin', 'available', 1465.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(36, 'B036', 'Cabin', 'available', 1510.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(37, 'B037', 'Male Ward', 'available', 1480.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(38, 'B038', 'Emergency', 'available', 1419.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(39, 'B039', 'Male Ward', 'available', 660.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(40, 'B040', 'Female Ward', 'available', 895.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(41, 'B041', 'Cabin', 'available', 1551.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(42, 'B042', 'ICU', 'available', 1655.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(43, 'B043', 'ICU', 'available', 776.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(44, 'B044', 'Cabin', 'available', 524.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(45, 'B045', 'Male Ward', 'available', 1454.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(46, 'B046', 'ICU', 'available', 1497.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(47, 'B047', 'Cabin', 'available', 1883.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(48, 'B048', 'Emergency', 'available', 1248.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(49, 'B049', 'Female Ward', 'available', 926.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(50, 'B050', 'ICU', 'available', 1274.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(51, 'B051', 'ICU', 'available', 1726.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(52, 'B052', 'Male Ward', 'available', 1551.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(53, 'B053', 'Emergency', 'available', 1528.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(54, 'B054', 'Emergency', 'available', 1816.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(55, 'B055', 'Emergency', 'available', 761.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(56, 'B056', 'Cabin', 'available', 1693.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(57, 'B057', 'ICU', 'available', 1026.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(58, 'B058', 'ICU', 'available', 1548.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(59, 'B059', 'Female Ward', 'available', 702.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(60, 'B060', 'ICU', 'available', 1826.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(61, 'B061', 'Female Ward', 'available', 1885.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(62, 'B062', 'Emergency', 'available', 672.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(63, 'B063', 'Cabin', 'available', 1431.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(64, 'B064', 'ICU', 'available', 1313.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(65, 'B065', 'Emergency', 'available', 1468.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(66, 'B066', 'ICU', 'available', 1879.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(67, 'B067', 'Male Ward', 'available', 1661.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(68, 'B068', 'Female Ward', 'available', 1699.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(69, 'B069', 'Male Ward', 'available', 1043.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(70, 'B070', 'ICU', 'available', 1886.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(71, 'B071', 'Emergency', 'available', 728.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(72, 'B072', 'Male Ward', 'available', 614.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(73, 'B073', 'Emergency', 'available', 769.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(74, 'B074', 'Emergency', 'available', 1906.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(75, 'B075', 'ICU', 'available', 1699.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(76, 'B076', 'ICU', 'available', 878.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(77, 'B077', 'Emergency', 'available', 1984.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(78, 'B078', 'Male Ward', 'available', 1348.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(79, 'B079', 'Emergency', 'available', 911.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(80, 'B080', 'Cabin', 'available', 962.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(81, 'B081', 'ICU', 'available', 1598.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(82, 'B082', 'Female Ward', 'available', 1414.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(83, 'B083', 'Emergency', 'available', 1470.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(84, 'B084', 'Emergency', 'available', 1350.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(85, 'B085', 'Cabin', 'available', 676.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(86, 'B086', 'Cabin', 'available', 1088.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(87, 'B087', 'Emergency', 'available', 1768.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(88, 'B088', 'Cabin', 'available', 526.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(89, 'B089', 'ICU', 'available', 740.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(90, 'B090', 'Cabin', 'available', 1366.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(91, 'B091', 'Cabin', 'available', 1045.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(92, 'B092', 'Male Ward', 'available', 1782.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(93, 'B093', 'ICU', 'available', 1391.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(94, 'B094', 'Female Ward', 'available', 1106.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(95, 'B095', 'Male Ward', 'available', 781.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(96, 'B096', 'ICU', 'available', 782.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(97, 'B097', 'Emergency', 'available', 1500.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(98, 'B098', 'ICU', 'available', 1800.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(99, 'B099', 'ICU', 'available', 1106.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(100, 'B100', 'ICU', 'available', 1140.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(101, 'B101', 'Emergency', 'available', 1308.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(102, 'B102', 'Emergency', 'available', 1214.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(103, 'B103', 'ICU', 'available', 887.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(104, 'B104', 'Female Ward', 'available', 1342.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(105, 'B105', 'Cabin', 'available', 1255.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(106, 'B106', 'Male Ward', 'available', 1675.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(107, 'B107', 'Emergency', 'available', 1862.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(108, 'B108', 'Emergency', 'available', 1747.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(109, 'B109', 'Male Ward', 'available', 1944.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(110, 'B110', 'Male Ward', 'available', 1302.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(111, 'B111', 'Cabin', 'available', 1772.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(112, 'B112', 'Male Ward', 'available', 1694.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(113, 'B113', 'Emergency', 'available', 1677.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(114, 'B114', 'ICU', 'available', 829.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(115, 'B115', 'ICU', 'available', 994.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(116, 'B116', 'ICU', 'available', 808.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(117, 'B117', 'ICU', 'available', 826.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(118, 'B118', 'Cabin', 'available', 1577.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(119, 'B119', 'Emergency', 'available', 1523.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(120, 'B120', 'ICU', 'available', 535.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(121, 'B121', 'Cabin', 'available', 918.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(122, 'B122', 'ICU', 'available', 866.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(123, 'B123', 'ICU', 'available', 722.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(124, 'B124', 'Cabin', 'available', 1272.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(125, 'B125', 'ICU', 'available', 1739.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(126, 'B126', 'Cabin', 'available', 1617.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(127, 'B127', 'Emergency', 'available', 885.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(128, 'B128', 'Male Ward', 'available', 908.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(129, 'B129', 'Male Ward', 'available', 1360.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(130, 'B130', 'Female Ward', 'available', 644.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(131, 'B131', 'ICU', 'available', 647.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(132, 'B132', 'Female Ward', 'available', 1870.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(133, 'B133', 'Cabin', 'available', 1323.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(134, 'B134', 'Cabin', 'available', 957.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(135, 'B135', 'Cabin', 'available', 1617.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(136, 'B136', 'Emergency', 'available', 694.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(137, 'B137', 'Male Ward', 'available', 1861.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(138, 'B138', 'Emergency', 'available', 1545.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(139, 'B139', 'Emergency', 'available', 743.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(140, 'B140', 'ICU', 'available', 1375.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(141, 'B141', 'Male Ward', 'available', 672.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(142, 'B142', 'ICU', 'available', 507.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(143, 'B143', 'ICU', 'available', 1047.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(144, 'B144', 'ICU', 'available', 1917.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(145, 'B145', 'ICU', 'available', 1510.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(146, 'B146', 'ICU', 'available', 906.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(147, 'B147', 'ICU', 'available', 1176.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(148, 'B148', 'ICU', 'available', 863.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(149, 'B149', 'Male Ward', 'available', 556.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(150, 'B150', 'Emergency', 'available', 1328.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(151, 'B151', 'Emergency', 'available', 657.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(152, 'B152', 'Cabin', 'available', 899.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(153, 'B153', 'ICU', 'available', 623.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(154, 'B154', 'Emergency', 'available', 1443.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(155, 'B155', 'Female Ward', 'available', 642.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(156, 'B156', 'Male Ward', 'available', 1368.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(157, 'B157', 'ICU', 'available', 1225.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(158, 'B158', 'ICU', 'available', 888.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(159, 'B159', 'Female Ward', 'available', 1564.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(160, 'B160', 'Cabin', 'available', 1100.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(161, 'B161', 'Male Ward', 'available', 1890.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(162, 'B162', 'Female Ward', 'available', 1335.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(163, 'B163', 'Male Ward', 'available', 1051.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(164, 'B164', 'Emergency', 'available', 957.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(165, 'B165', 'ICU', 'available', 1782.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(166, 'B166', 'Cabin', 'available', 795.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(167, 'B167', 'Emergency', 'available', 1825.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(168, 'B168', 'Male Ward', 'available', 1814.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(169, 'B169', 'Female Ward', 'available', 1043.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(170, 'B170', 'Male Ward', 'available', 1617.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(171, 'B171', 'Female Ward', 'available', 1603.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(172, 'B172', 'ICU', 'available', 1597.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(173, 'B173', 'Emergency', 'available', 1180.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(174, 'B174', 'Male Ward', 'available', 1348.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(175, 'B175', 'Male Ward', 'available', 1413.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(176, 'B176', 'Emergency', 'available', 1435.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(177, 'B177', 'Male Ward', 'available', 1622.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(178, 'B178', 'Emergency', 'available', 1264.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(179, 'B179', 'Cabin', 'available', 1548.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(180, 'B180', 'Female Ward', 'available', 531.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(181, 'B181', 'ICU', 'available', 1823.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(182, 'B182', 'Emergency', 'available', 980.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(183, 'B183', 'Emergency', 'available', 1932.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(184, 'B184', 'Female Ward', 'available', 1270.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(185, 'B185', 'Cabin', 'available', 1644.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(186, 'B186', 'Emergency', 'available', 1714.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(187, 'B187', 'ICU', 'available', 1806.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(188, 'B188', 'Male Ward', 'available', 1958.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(189, 'B189', 'Cabin', 'available', 1555.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(190, 'B190', 'ICU', 'available', 1993.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(191, 'B191', 'Male Ward', 'available', 1807.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(192, 'B192', 'Cabin', 'available', 598.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(193, 'B193', 'Male Ward', 'available', 1925.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(194, 'B194', 'Male Ward', 'available', 1918.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(195, 'B195', 'Male Ward', 'available', 1626.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(196, 'B196', 'Emergency', 'available', 1885.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(197, 'B197', 'Emergency', 'available', 1833.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(198, 'B198', 'Male Ward', 'available', 1071.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(199, 'B199', 'ICU', 'available', 1622.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(200, 'B200', 'ICU', 'available', 1213.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(201, 'B201', 'Emergency', 'available', 751.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(202, 'B202', 'Emergency', 'available', 1893.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(203, 'B203', 'Female Ward', 'available', 945.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(204, 'B204', 'Emergency', 'available', 519.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(205, 'B205', 'Male Ward', 'available', 581.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(206, 'B206', 'Female Ward', 'available', 1257.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(207, 'B207', 'ICU', 'available', 1105.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(208, 'B208', 'Female Ward', 'available', 1975.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(209, 'B209', 'ICU', 'available', 1229.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(210, 'B210', 'ICU', 'available', 1384.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(211, 'B211', 'Male Ward', 'available', 620.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(212, 'B212', 'Female Ward', 'available', 799.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(213, 'B213', 'Emergency', 'available', 654.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(214, 'B214', 'Cabin', 'available', 988.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(215, 'B215', 'Emergency', 'available', 1916.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(216, 'B216', 'Cabin', 'available', 847.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(217, 'B217', 'ICU', 'available', 1659.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(218, 'B218', 'Cabin', 'available', 840.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(219, 'B219', 'Male Ward', 'available', 1347.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(220, 'B220', 'ICU', 'available', 644.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(221, 'B221', 'Female Ward', 'available', 1578.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(222, 'B222', 'Male Ward', 'available', 1447.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(223, 'B223', 'Male Ward', 'available', 1504.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(224, 'B224', 'Emergency', 'available', 1173.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(225, 'B225', 'ICU', 'available', 1896.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(226, 'B226', 'Cabin', 'available', 1528.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(227, 'B227', 'Male Ward', 'available', 1081.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(228, 'B228', 'Male Ward', 'available', 509.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(229, 'B229', 'Female Ward', 'available', 1987.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(230, 'B230', 'Male Ward', 'available', 652.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(231, 'B231', 'Cabin', 'available', 1563.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(232, 'B232', 'Emergency', 'available', 809.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(233, 'B233', 'Emergency', 'available', 1844.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(234, 'B234', 'Cabin', 'available', 1193.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(235, 'B235', 'Female Ward', 'available', 955.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(236, 'B236', 'Female Ward', 'available', 1533.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(237, 'B237', 'Cabin', 'available', 828.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(238, 'B238', 'Emergency', 'available', 1893.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(239, 'B239', 'Female Ward', 'available', 1159.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(240, 'B240', 'Female Ward', 'available', 1608.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(241, 'B241', 'ICU', 'available', 699.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(242, 'B242', 'Emergency', 'available', 1067.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(243, 'B243', 'Female Ward', 'available', 931.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(244, 'B244', 'Cabin', 'available', 1546.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(245, 'B245', 'Female Ward', 'available', 1074.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(246, 'B246', 'ICU', 'available', 1956.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(247, 'B247', 'Cabin', 'available', 699.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(248, 'B248', 'Female Ward', 'available', 1298.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(249, 'B249', 'ICU', 'available', 815.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(250, 'B250', 'ICU', 'available', 1020.00, '2026-01-05 04:42:28', '2026-01-05 04:42:28');

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
(1, 'Bangladesh Diabetic & Diagnostic Care ltd.', 'Dholibita, Dhamrai, Dhaka', 'info@bddcl.info', '01700000000', 'www.bddcl.info', '2025-11-30 10:00:59', '2025-11-30 10:00:59');

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
(1, 'Diabetes Mellitus', 'A metabolic disorder causing high blood sugar levels.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(2, 'Hypertension', 'High blood pressure condition.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(3, 'Asthma', 'A chronic lung disease causing breathing difficulty.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(4, 'Heart Disease', 'Conditions affecting the heart and blood vessels.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(5, 'Arthritis', 'Inflammation of the joints causing pain and stiffness.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(6, 'Migraine', 'Severe recurring headaches often with nausea.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(7, 'Tuberculosis', 'An infectious disease mainly affecting the lungs.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(8, 'Pneumonia', 'Infection that inflames the air sacs in one or both lungs.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(9, 'Covid-19', 'Respiratory illness caused by SARS-CoV-2 virus.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(10, 'Hepatitis B', 'A viral infection that affects the liver.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(11, 'Typhoid Fever', 'Bacterial infection caused by Salmonella typhi.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(12, 'Malaria', 'Mosquito-borne infectious disease affecting red blood cells.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(13, 'Dengue Fever', 'Viral infection spread by Aedes mosquitoes.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(14, 'Gastritis', 'Inflammation of the stomach lining.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(15, 'Ulcer', 'Open sores on the stomach or intestinal lining.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(16, 'Cancer', 'Abnormal cell growth that can spread to other parts of the body.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(17, 'Jaundice', 'Yellowing of the skin and eyes due to liver problems.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(18, 'Influenza', 'Common viral infection causing fever and sore throat.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(19, 'Kidney Stone', 'Hard deposits of minerals in the kidneys.', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(20, 'Anemia', 'Low red blood cell count causing fatigue.', '2026-01-05 04:42:28', '2026-01-05 04:42:28');

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
(1, 'Dr. John Smith', 'Cardiologist', '01710000001', 'john.smith@example.com', 1000.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(2, 'Dr. Alice Johnson', 'Neurologist', '01710000002', 'alice.johnson@example.com', 800.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(3, 'Dr. Robert Brown', 'Pediatrician', '01710000003', 'robert.brown@example.com', 500.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(4, 'Dr. Emily Davis', 'Dermatologist', '01710000004', 'emily.davis@example.com', 1000.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(5, 'Dr. Michael Wilson', 'Orthopedic', '01710000005', 'michael.wilson@example.com', 800.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(6, 'Dr. Sophia Taylor', 'Gynecologist', '01710000006', 'sophia.taylor@example.com', 1000.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(7, 'Dr. William Martinez', 'ENT Specialist', '01710000007', 'william.martinez@example.com', 1000.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(8, 'Dr. Olivia Anderson', 'Oncologist', '01710000008', 'olivia.anderson@example.com', 800.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(9, 'Dr. James Thomas', 'Radiologist', '01710000009', 'james.thomas@example.com', 700.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(10, 'Dr. Isabella Jackson', 'Endocrinologist', '01710000010', 'isabella.jackson@example.com', 1500.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(11, 'Dr. Benjamin White', 'Urologist', '01710000011', 'benjamin.white@example.com', 2000.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(12, 'Dr. Mia Harris', 'Gastroenterologist', '01710000012', 'mia.harris@example.com', 850.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(13, 'Dr. Daniel Clark', 'Pulmonologist', '01710000013', 'daniel.clark@example.com', 500.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(14, 'Dr. Charlotte Lewis', 'Nephrologist', '01710000014', 'charlotte.lewis@example.com', 1000.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(15, 'Dr. Matthew Lee', 'Ophthalmologist', '01710000015', 'matthew.lee@example.com', 1000.00, '2026-01-05 04:42:27', '2026-01-05 04:42:27');

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
(1, 'Dr. Ayesha Karim', 'Cardiology', '01710000001', 'ayesha@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(2, 'Dr. Rahat Hossain', 'Orthopedics', '01710000002', 'rahat@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(3, 'Dr. Tanvir Alam', 'Neurology', '01710000003', 'tanvir@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(4, 'Dr. Nusrat Jahan', 'Gynecology', '01710000004', 'nusrat@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(5, 'Dr. Mamun Rahman', 'Medicine', '01710000005', 'mamun@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(6, 'Dr. Farhana Ahmed', 'Dermatology', '01710000006', 'farhana@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(7, 'Dr. Shahidul Islam', 'ENT', '01710000007', 'shahidul@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(8, 'Dr. Sabrina Akter', 'Cardiology', '01710000008', 'sabrina@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(9, 'Dr. Tareq Hasan', 'Urology', '01710000009', 'tareq@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(10, 'Dr. Rafiq Mahmud', 'Medicine', '01710000010', 'rafiq@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(11, 'Dr. Mahiya Sultana', 'Gynecology', '01710000011', 'mahiya@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(12, 'Dr. Hasan Chowdhury', 'Orthopedics', '01710000012', 'hasan@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(13, 'Dr. Sumaiya Rahman', 'Dermatology', '01710000013', 'sumaiya@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(14, 'Dr. Arif Mahmud', 'Cardiology', '01710000014', 'arif@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(15, 'Dr. Nayeem Islam', 'ENT', '01710000015', 'nayeem@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(16, 'Dr. Rima Akter', 'Neurology', '01710000016', 'rima@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(17, 'Dr. Omar Faruk', 'Medicine', '01710000017', 'omar@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(18, 'Dr. Sadiya Hossain', 'Gynecology', '01710000018', 'sadiya@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(19, 'Dr. Kamrul Hasan', 'Cardiology', '01710000019', 'kamrul@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28'),
(20, 'Dr. Rashedul Islam', 'Urology', '01710000020', 'rashed@example.com', '2026-01-05 04:42:28', '2026-01-05 04:42:28');

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
(1, 'Salary', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(2, 'Utility', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(3, 'Maintenance', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(4, 'Academic', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(5, 'Transport', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(6, 'Event', '2026-01-05 04:42:29', '2026-01-05 04:42:29');

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
(1, 1, 'Teacher Salary', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(2, 1, 'Staff Salary', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(3, 1, 'Guest Teacher Salary', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(4, 2, 'Electricity Bill', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(5, 2, 'Water Bill', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(6, 2, 'Internet Bill', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(7, 3, 'Furniture Repair', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(8, 3, 'Building Repair', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(9, 3, 'Painting', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(10, 4, 'Books Purchase', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(11, 4, 'Lab Equipment', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(12, 4, 'Classroom Materials', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(13, 5, 'Bus Fuel', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(14, 5, 'Driver Salary', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(15, 5, 'Vehicle Repair', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(16, 6, 'Annual Program', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(17, 6, 'Sports Day', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(18, 6, 'Prize Giving Ceremony', '2026-01-05 04:42:29', '2026-01-05 04:42:29');

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
(1, 'Paracetamol', '2026-01-05 04:42:29', '2025-10-22 10:57:39'),
(2, 'Amoxicillin', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(3, 'Ibuprofen', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(4, 'Metformin', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(5, 'Ciprofloxacin', '2026-01-05 04:42:29', '2026-01-05 04:42:29');

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
(1, 'Tuition Fee', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(2, 'Donation', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(3, 'Library Fee', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(4, 'Transport Fee', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(5, 'Examination Fee', '2026-01-05 04:42:29', '2026-01-05 04:42:29');

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
(1, 1, 'Grade 1-5', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(2, 1, 'Grade 6-10', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(3, 1, 'Grade 11-12', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(4, 1, 'Pre-School', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(5, 2, 'Alumni Donation', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(6, 2, 'Sponsor Donation', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(7, 2, 'General Donation', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(8, 3, 'Book Fee', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(9, 3, 'Late Fee', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(10, 3, 'Library Membership Fee', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(11, 4, 'Bus Fee', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(12, 4, 'Van Fee', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(13, 4, 'Driver Allowance', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(14, 5, 'Monthly Test', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(15, 5, 'Final Exam', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(16, 5, 'Practical Exam', '2026-01-05 04:42:29', '2026-01-05 04:42:29');

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
(1, 'Hematology', 'Blood related tests', '2026-01-05 04:42:26', '2026-01-05 04:42:26'),
(2, 'Biochemistry', 'Chemical analysis tests', '2026-01-05 04:42:26', '2026-01-05 04:42:26'),
(3, 'Microbiology', 'Bacteria and virus tests', '2026-01-05 04:42:26', '2026-01-05 04:42:26'),
(4, 'Immunology', 'Immune system tests', '2026-01-05 04:42:26', '2026-01-05 04:42:26');

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
(1, 'Routine', 'Routine tests', '2026-01-05 04:42:26', '2026-01-05 04:42:26'),
(2, 'Special', 'Special tests', '2026-01-05 04:42:26', '2026-01-05 04:42:26'),
(3, 'Emergency', 'Emergency tests', '2026-01-05 04:42:26', '2026-01-05 04:42:26');

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
(1, 'Blood', 'Venous blood sample', '2026-01-05 04:42:26', '2026-01-05 04:42:26'),
(2, 'Urine', 'Urine sample', '2026-01-05 04:42:26', '2026-01-05 04:42:26'),
(3, 'Saliva', 'Saliva sample', '2026-01-05 04:42:26', '2026-01-05 04:42:26'),
(4, 'Swab', 'Throat/nasal swab', '2026-01-05 04:42:26', '2026-01-05 04:42:26');

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
(1, 1, 'CBC', 'Complete Blood Count', '2026-01-05 04:42:26', '2026-01-05 04:42:26'),
(2, 1, 'ESR', 'Erythrocyte Sedimentation Rate', '2026-01-05 04:42:26', '2026-01-05 04:42:26'),
(3, 2, 'Liver Function Test', 'LFT panel', '2026-01-05 04:42:26', '2026-01-05 04:42:26'),
(4, 2, 'Kidney Function Test', 'KFT panel', '2026-01-05 04:42:26', '2026-01-05 04:42:26');

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
(1, 'CBC Test', 2, 4, 4, 1, 2869.00, 647.00, 'Room 3', 'Inventore sapiente sunt quidem doloribus ab aut provident.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(2, 'Thyroid Function Test', 1, 3, 1, 1, 1706.00, 4034.00, 'Room 10', 'Tempora autem harum omnis consequuntur eos a.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(3, 'Liver Function Test', 4, 4, 2, 2, 1371.00, 3727.00, 'Room 8', 'In tempore ut consectetur ad eum.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(4, 'Kidney Function Test', 4, 1, 1, 2, 985.00, 3557.00, 'Room 2', 'Non qui placeat qui quas fugiat repudiandae.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(5, 'Lipid Profile', 2, 2, 1, 2, 1828.00, 3658.00, 'Room 8', 'Consequuntur debitis consectetur quasi et neque fuga.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(6, 'Blood Sugar Test', 4, 1, 1, 1, 2367.00, 4388.00, 'Room 3', 'Consequatur necessitatibus error quia dolorum provident.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(7, 'Urine Routine Test', 2, 3, 3, 2, 2798.00, 2780.00, 'Room 1', 'Distinctio est rem dicta quisquam.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(8, 'Electrolyte Test', 3, 3, 4, 2, 1943.00, 591.00, 'Room 4', 'Occaecati assumenda a natus nesciunt.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(9, 'Pulmonary Function Test', 1, 4, 3, 3, 3161.00, 2248.00, 'Room 5', 'Voluptatum ipsa molestias est culpa.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(10, 'ECG Test', 3, 1, 2, 2, 3912.00, 1241.00, 'Room 6', 'Aliquid nam sunt illo aut ut nam commodi.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(11, 'Eye Test', 4, 4, 4, 1, 4362.00, 3746.00, 'Room 8', 'Labore voluptatum sunt et blanditiis aut.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(12, 'Brain MRI', 1, 3, 4, 1, 3404.00, 2028.00, 'Room 6', 'Fugiat est aperiam et labore repellendus voluptatibus.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(13, 'Cardiac Enzyme Test', 4, 2, 4, 1, 3350.00, 3694.00, 'Room 1', 'Qui aut voluptas velit aut labore et consequatur.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(14, 'Dengue Test', 4, 4, 3, 3, 2699.00, 2953.00, 'Room 7', 'Pariatur consequuntur eos natus reprehenderit dignissimos.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(15, 'Malaria Test', 4, 2, 4, 3, 3219.00, 1145.00, 'Room 9', 'Enim dignissimos eos consequuntur consequuntur molestiae blanditiis.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(16, 'Vitamin D Test', 2, 1, 1, 3, 3787.00, 3065.00, 'Room 9', 'Veritatis et dolore molestias assumenda culpa quaerat.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(17, 'Vitamin B12 Test', 2, 1, 1, 1, 4501.00, 1072.00, 'Room 1', 'Eveniet eveniet nihil ullam officia repudiandae doloremque.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(18, 'Iron Test', 3, 4, 2, 3, 4295.00, 833.00, 'Room 10', 'Tempore suscipit non cumque eos iusto veritatis.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(19, 'Ferritin Test', 2, 2, 2, 2, 881.00, 4379.00, 'Room 8', 'Voluptate accusamus voluptatibus quos repellat soluta iste.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(20, 'Uric Acid Test', 4, 3, 1, 3, 3817.00, 969.00, 'Room 3', 'Nostrum ea voluptatem voluptatibus et ipsa sed.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(21, 'ESR Test', 4, 4, 2, 2, 1518.00, 1846.00, 'Room 10', 'Cumque sit suscipit cum doloribus et numquam.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(22, 'RBC Count Test', 4, 3, 1, 3, 2829.00, 3248.00, 'Room 8', 'Quibusdam iure numquam tempora corporis porro reiciendis.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(23, 'PCV Test', 3, 2, 4, 3, 3480.00, 3315.00, 'Room 5', 'Voluptas deleniti sed facere pariatur odit sunt.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(24, 'MCH Test', 4, 3, 4, 1, 4514.00, 3707.00, 'Room 1', 'Quaerat eum optio officiis accusamus.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(25, 'MCHC Test', 4, 1, 3, 1, 4798.00, 2113.00, 'Room 1', 'Accusantium et amet consectetur in voluptatum ad id quisquam.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(26, 'RDW Test', 2, 4, 1, 2, 2679.00, 3618.00, 'Room 3', 'Sint natus ullam cum ipsum rerum.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(27, 'Neutrophils Test', 4, 3, 2, 2, 645.00, 3489.00, 'Room 6', 'Praesentium rem nesciunt quas.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(28, 'Lymphocytes Test', 3, 1, 4, 2, 4590.00, 2570.00, 'Room 6', 'Consequatur deserunt enim voluptas molestiae velit quod quibusdam.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(29, 'Monocytes Test', 1, 2, 2, 3, 4104.00, 3178.00, 'Room 2', 'Expedita consectetur magnam tenetur.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(30, 'Eosinophils Test', 4, 2, 3, 2, 1720.00, 4497.00, 'Room 8', 'Vitae cumque dolor quisquam iste enim odit.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(31, 'Basophils Test', 4, 4, 1, 1, 3879.00, 3454.00, 'Room 5', 'Nobis exercitationem et nobis quis dolorum quia.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(32, 'Prothrombin Time Test', 4, 2, 1, 3, 2155.00, 2577.00, 'Room 4', 'Et cupiditate non et et aspernatur dolor ipsum.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(33, 'INR Test', 4, 4, 1, 3, 1967.00, 2952.00, 'Room 3', 'Veniam harum neque nam temporibus non.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(34, 'aPTT Test', 3, 1, 4, 3, 3678.00, 2696.00, 'Room 6', 'Aut esse rerum quam fugit saepe quos.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(35, 'HIV 1 & 2 Test', 1, 1, 2, 1, 1804.00, 1757.00, 'Room 8', 'Aut earum quia accusamus deserunt dolore provident consequatur.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(36, 'HCV Antibody Test', 2, 1, 2, 2, 1649.00, 1537.00, 'Room 9', 'Quam consequuntur voluptatem dolores voluptatem accusantium explicabo repudiandae.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(37, 'HbA1c Test', 3, 4, 2, 1, 4069.00, 2912.00, 'Room 8', 'Quasi porro soluta atque fugiat voluptatibus odio.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(38, 'Blood Group Test', 3, 3, 3, 1, 3479.00, 948.00, 'Room 6', 'Illo hic aliquid architecto dolorem.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(39, 'Pregnancy Test', 2, 3, 3, 2, 1338.00, 1129.00, 'Room 6', 'Nobis id similique facere deserunt.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(40, 'Stool Occult Blood Test', 4, 3, 1, 2, 1340.00, 2058.00, 'Room 9', 'Atque non asperiores non blanditiis dolores.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(41, 'Amylase Test', 3, 1, 2, 1, 4500.00, 1696.00, 'Room 5', 'Non eveniet eaque voluptatem est placeat sequi.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(42, 'Lipase Test', 2, 1, 1, 1, 4447.00, 3039.00, 'Room 4', 'Explicabo deserunt a quos dolor nam deserunt.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(43, 'LDH Test', 1, 2, 4, 3, 515.00, 2345.00, 'Room 2', 'Consectetur explicabo et autem et architecto.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(44, 'GGT Test', 1, 2, 3, 2, 4665.00, 3825.00, 'Room 6', 'Molestiae et iusto et ut unde.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(45, 'Phosphorus Test', 4, 1, 2, 1, 534.00, 4018.00, 'Room 9', 'Reiciendis fugiat ab ex.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(46, 'Magnesium Test', 4, 3, 2, 3, 2665.00, 4132.00, 'Room 1', 'Doloribus rerum ut dicta sed dolorem.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(47, 'Zinc Test', 4, 3, 3, 2, 2033.00, 1976.00, 'Room 9', 'Est quas maiores deleniti odit non quia sint.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(48, 'Copper Test', 4, 3, 3, 2, 4849.00, 958.00, 'Room 7', 'Qui et praesentium quo quam.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(49, 'Insulin (Fasting) Test', 1, 1, 1, 1, 1522.00, 2080.00, 'Room 5', 'Aut eum voluptas quia voluptatem.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(50, 'Cortisol (Morning) Test', 3, 4, 1, 1, 4894.00, 3659.00, 'Room 10', 'Tempora animi odit natus et.', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27');

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
(363, '2014_10_12_000000_create_users_table', 2),
(364, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(365, '2014_10_12_100000_create_password_resets_table', 2),
(366, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(367, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(368, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(369, '2016_06_01_000004_create_oauth_clients_table', 2),
(370, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(371, '2019_08_19_000000_create_failed_jobs_table', 2),
(372, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(373, '2025_10_16_060305_create_doctors_table', 2),
(374, '2025_10_16_060344_create_lab_materials_table', 2),
(375, '2025_10_16_062212_create_lab_categories_table', 2),
(376, '2025_10_16_062212_create_lab_groups_table', 2),
(377, '2025_10_16_062212_create_lab_specimens_table', 2),
(378, '2025_10_16_062212_create_lab_subcategories_table', 2),
(379, '2025_10_16_064353_create_lab_tests_table', 2),
(380, '2025_10_16_065015_create_admins_table', 2),
(381, '2025_10_16_065016_create_store_tests_table', 2),
(382, '2025_10_16_085053_create_references_table', 2),
(383, '2025_10_16_124831_create_payment_details_table', 2),
(384, '2025_10_17_044528_create_companies_table', 2),
(385, '2025_10_17_154807_create_beds_table', 2),
(386, '2025_10_17_162645_create_duty_doctors_table', 2),
(387, '2025_10_17_163136_create_diseases_table', 2),
(388, '2025_10_18_113032_create_admission_patients_table', 2),
(389, '2025_10_18_181954_create_admission_bill_summaries_table', 2),
(390, '2025_10_20_153826_create_test_report_details_table', 2),
(391, '2025_10_21_103401_create_patient_test_reports_table', 2),
(392, '2025_10_21_143623_create_units_table', 2),
(393, '2025_10_21_143701_create_generics_table', 2),
(394, '2025_10_21_143740_create_presentations_table', 2),
(395, '2025_10_21_143850_create_reagents_table', 2),
(396, '2025_10_23_114129_create_reagent_stocks_table', 2),
(397, '2025_10_23_115839_create_reagent_test_table', 2),
(398, '2025_12_29_105054_create_expenses_categories_table', 2),
(399, '2025_12_29_105102_create_expenses_sub_categories_table', 2),
(400, '2025_12_29_105112_create_expenses_details_table', 2),
(401, '2025_12_29_150117_create_income_categories_table', 2),
(402, '2025_12_29_150138_create_income_sub_categories_table', 2),
(403, '2025_12_29_150655_create_incomes_table', 2),
(404, '2026_01_01_114435_create_bank_details_table', 2),
(405, '2026_01_01_114446_create_bank_transection_details_table', 2),
(406, '2026_01_02_121227_create_ticket_sales_table', 2);

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
(1, 'LAB20260105101', '2026-01-05', 'Shamim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 14, 10, 15867.00, 500.00, 15367.00, 15000.00, 1, 367.00, 0.00, 1, 10, '2026-01-05 04:46:36', '2026-01-05 04:46:36'),
(2, 'LAB20260105102', '2026-01-05', 'Farjana Hossain', '2001-12-31', 'Female', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 4, 1, 9349.00, 400.00, 8949.00, 8949.00, 0, 0.00, 0.00, 1, 10, '2026-01-05 04:47:23', '2026-01-05 04:47:23'),
(3, 'LAB20260105103', '2026-01-05', 'Rahim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 10, 14, 6551.00, 500.00, 6051.00, 6000.00, 1, 51.00, 0.00, 1, 10, '2026-01-05 09:41:54', '2026-01-05 09:41:54'),
(4, 'LAB20260105104', '2026-01-05', 'Rahima Hossain', '2001-12-31', 'Female', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 5, 3, 16816.00, 0.00, 16816.00, 15000.00, 1, 1816.00, 0.00, 1, 10, '2026-01-05 09:42:14', '2026-01-05 09:42:14'),
(5, 'LAB20260105105', '2026-01-05', 'Murshed Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 3, 5, 9464.00, 400.00, 9064.00, 5000.00, 1, 4064.00, 0.00, 1, 10, '2026-01-05 09:42:38', '2026-01-05 09:42:38'),
(6, 'LAB20260105106', '2026-01-05', 'Shamim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 5, 3, 6931.00, 0.00, 6931.00, 6931.00, 0, 0.00, 0.00, 1, 10, '2026-01-05 12:08:26', '2026-01-05 12:08:26'),
(7, 'LAB20260105107', '2026-01-05', 'Shamim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 14, 15, 20614.00, 0.00, 20614.00, 20614.00, 0, 0.00, 0.00, 1, 10, '2026-01-05 12:08:40', '2026-01-05 12:08:40');

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
(1, 'Tablet', '2026-01-05 04:42:29', '2025-10-22 11:00:20'),
(2, 'Capsule', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(3, 'Syrup', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(4, 'Injection', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(5, 'Powder', '2026-01-05 04:42:29', '2026-01-05 04:42:29');

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
(1, 'Acetone', 1, 1, 1, 317.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(2, 'Alcohol', 1, 1, 1, 336.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(3, 'Ammonia', 1, 1, 1, 91.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(4, 'Benzene', 1, 1, 1, 377.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(5, 'Calcium Chloride', 1, 1, 1, 297.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(6, 'Chloroform', 1, 1, 1, 103.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(7, 'Citric Acid', 1, 1, 1, 376.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(8, 'Copper Sulphate', 1, 1, 1, 400.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(9, 'Formaldehyde', 1, 1, 1, 199.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(10, 'Glucose', 1, 1, 1, 439.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(11, 'Glycerol', 1, 1, 1, 173.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(12, 'Hydrochloric Acid', 1, 1, 1, 134.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(13, 'Hydrogen Peroxide', 1, 1, 1, 454.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(14, 'Iodine', 1, 1, 1, 183.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(15, 'Iron Sulphate', 1, 1, 1, 173.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(16, 'Magnesium Sulphate', 1, 1, 1, 94.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(17, 'Methanol', 1, 1, 1, 497.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(18, 'Nitric Acid', 1, 1, 1, 257.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(19, 'Phenol', 1, 1, 1, 128.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(20, 'Potassium Chloride', 1, 1, 1, 481.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(21, 'Potassium Hydroxide', 1, 1, 1, 189.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(22, 'Sodium Bicarbonate', 1, 1, 1, 363.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(23, 'Sodium Carbonate', 1, 1, 1, 295.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(24, 'Sodium Chloride', 1, 1, 1, 123.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(25, 'Sodium Hydroxide', 1, 1, 1, 375.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(26, 'Sulfuric Acid', 1, 1, 1, 370.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(27, 'Toluene', 1, 1, 1, 240.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(28, 'Urea', 1, 1, 1, 353.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(29, 'Zinc Sulphate', 1, 1, 1, 337.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(30, 'Sodium Nitrate', 1, 1, 1, 357.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(31, 'Ammonium Chloride', 1, 1, 1, 457.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(32, 'Barium Sulphate', 1, 1, 1, 302.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(33, 'Ethyl Acetate', 1, 1, 1, 372.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(34, 'Formic Acid', 1, 1, 1, 363.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(35, 'Hydrazine', 1, 1, 1, 81.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(36, 'Lithium Carbonate', 1, 1, 1, 240.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(37, 'Magnesium Hydroxide', 1, 1, 1, 322.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(38, 'Manganese Sulphate', 1, 1, 1, 100.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(39, 'Nickel Sulphate', 1, 1, 1, 438.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(40, 'Phenolphthalein', 1, 1, 1, 163.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(41, 'Potassium Bromide', 1, 1, 1, 257.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(42, 'Silver Nitrate', 1, 1, 1, 291.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(43, 'Sodium Sulphate', 1, 1, 1, 52.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(44, 'Sulfur', 1, 1, 1, 137.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(45, 'Thymol', 1, 1, 1, 442.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(46, 'Triethanolamine', 1, 1, 1, 364.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(47, 'Xylene', 1, 1, 1, 320.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(48, 'Zinc Chloride', 1, 1, 1, 152.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(49, 'Aluminium Sulphate', 1, 1, 1, 106.00, 50, '2026-01-05 04:42:29', '2026-01-05 04:42:29');

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
(1, 'Mr. John Smith', 'Consultant', 'john@example.com', '01710000001', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(2, 'Ms. Alice Johnson', 'Lab Manager', 'alice@example.com', '01710000002', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(3, 'Dr. Robert Brown', 'Physician', 'robert@example.com', '01710000003', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(4, 'Dr. Emily Davis', 'Surgeon', 'emily@example.com', '01710000004', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(5, 'Mr. Michael Wilson', 'Technician', 'michael@example.com', '01710000005', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(6, 'Ms. Sophia Taylor', 'Nurse', 'sophia@example.com', '01710000006', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(7, 'Dr. William Martinez', 'Radiologist', 'william@example.com', '01710000007', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(8, 'Dr. Olivia Anderson', 'Oncologist', 'olivia@example.com', '01710000008', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(9, 'Dr. James Thomas', 'Endocrinologist', 'james@example.com', '01710000009', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(10, 'Dr. Isabella Jackson', 'Pediatrician', 'isabella@example.com', '01710000010', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(11, 'Dr. Benjamin White', 'Cardiologist', 'benjamin@example.com', '01710000011', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(12, 'Dr. Mia Harris', 'Neurologist', 'mia@example.com', '01710000012', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(13, 'Dr. Daniel Clark', 'Orthopedic', 'daniel@example.com', '01710000013', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(14, 'Dr. Charlotte Lewis', 'Dermatologist', 'charlotte@example.com', '01710000014', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27'),
(15, 'Dr. Matthew Lee', 'Ophthalmologist', 'matthew@example.com', '01710000015', 1, '2026-01-05 04:42:27', '2026-01-05 04:42:27');

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
(1, 'LAB20260105101', 10, 1, 2869.00, 647.00, 2, 4, 4, 1, 'Room 3', 1, 0, '2026-01-05 04:46:22', '2026-01-05 04:46:22'),
(2, 'LAB20260105101', 10, 2, 1706.00, 4034.00, 1, 3, 1, 1, 'Room 10', 1, 0, '2026-01-05 04:46:22', '2026-01-05 04:46:22'),
(3, 'LAB20260105101', 10, 3, 1371.00, 3727.00, 4, 4, 2, 2, 'Room 8', 1, 0, '2026-01-05 04:46:23', '2026-01-05 04:46:23'),
(4, 'LAB20260105101', 10, 4, 985.00, 3557.00, 4, 1, 1, 2, 'Room 2', 1, 0, '2026-01-05 04:46:23', '2026-01-05 04:46:23'),
(5, 'LAB20260105101', 10, 5, 1828.00, 3658.00, 2, 2, 1, 2, 'Room 8', 1, 0, '2026-01-05 04:46:23', '2026-01-05 04:46:23'),
(6, 'LAB20260105101', 10, 6, 2367.00, 4388.00, 4, 1, 1, 1, 'Room 3', 1, 0, '2026-01-05 04:46:24', '2026-01-05 04:46:24'),
(7, 'LAB20260105101', 10, 7, 2798.00, 2780.00, 2, 3, 3, 2, 'Room 1', 1, 0, '2026-01-05 04:46:25', '2026-01-05 04:46:25'),
(8, 'LAB20260105101', 10, 8, 1943.00, 591.00, 3, 3, 4, 2, 'Room 4', 1, 0, '2026-01-05 04:46:26', '2026-01-05 04:46:26'),
(9, 'LAB20260105102', 10, 3, 1371.00, 3727.00, 4, 4, 2, 2, 'Room 8', 1, 0, '2026-01-05 04:47:05', '2026-01-05 04:47:05'),
(10, 'LAB20260105102', 10, 4, 985.00, 3557.00, 4, 1, 1, 2, 'Room 2', 1, 0, '2026-01-05 04:47:05', '2026-01-05 04:47:05'),
(11, 'LAB20260105102', 10, 5, 1828.00, 3658.00, 2, 2, 1, 2, 'Room 8', 1, 0, '2026-01-05 04:47:06', '2026-01-05 04:47:06'),
(12, 'LAB20260105102', 10, 6, 2367.00, 4388.00, 4, 1, 1, 1, 'Room 3', 1, 0, '2026-01-05 04:47:06', '2026-01-05 04:47:06'),
(13, 'LAB20260105102', 10, 7, 2798.00, 2780.00, 2, 3, 3, 2, 'Room 1', 1, 0, '2026-01-05 04:47:07', '2026-01-05 04:47:07'),
(14, 'LAB20260105103', 10, 3, 1371.00, 3727.00, 4, 4, 2, 2, 'Room 8', 1, 0, '2026-01-05 09:41:38', '2026-01-05 09:41:38'),
(15, 'LAB20260105103', 10, 4, 985.00, 3557.00, 4, 1, 1, 2, 'Room 2', 1, 0, '2026-01-05 09:41:39', '2026-01-05 09:41:39'),
(16, 'LAB20260105103', 10, 5, 1828.00, 3658.00, 2, 2, 1, 2, 'Room 8', 1, 0, '2026-01-05 09:41:39', '2026-01-05 09:41:39'),
(17, 'LAB20260105103', 10, 6, 2367.00, 4388.00, 4, 1, 1, 1, 'Room 3', 1, 0, '2026-01-05 09:41:39', '2026-01-05 09:41:39'),
(18, 'LAB20260105104', 10, 28, 4590.00, 2570.00, 3, 1, 4, 2, 'Room 6', 1, 0, '2026-01-05 09:41:58', '2026-01-05 09:41:58'),
(19, 'LAB20260105104', 10, 29, 4104.00, 3178.00, 1, 2, 2, 3, 'Room 2', 1, 0, '2026-01-05 09:41:59', '2026-01-05 09:41:59'),
(20, 'LAB20260105104', 10, 27, 645.00, 3489.00, 4, 3, 2, 2, 'Room 6', 1, 0, '2026-01-05 09:41:59', '2026-01-05 09:41:59'),
(21, 'LAB20260105104', 10, 26, 2679.00, 3618.00, 2, 4, 1, 2, 'Room 3', 1, 0, '2026-01-05 09:41:59', '2026-01-05 09:41:59'),
(22, 'LAB20260105104', 10, 25, 4798.00, 2113.00, 4, 1, 3, 1, 'Room 1', 1, 0, '2026-01-05 09:42:00', '2026-01-05 09:42:00'),
(23, 'LAB20260105105', 10, 3, 1371.00, 3727.00, 4, 4, 2, 2, 'Room 8', 1, 0, '2026-01-05 09:42:22', '2026-01-05 09:42:22'),
(24, 'LAB20260105105', 10, 4, 985.00, 3557.00, 4, 1, 1, 2, 'Room 2', 1, 0, '2026-01-05 09:42:23', '2026-01-05 09:42:23'),
(25, 'LAB20260105105', 10, 6, 2367.00, 4388.00, 4, 1, 1, 1, 'Room 3', 1, 0, '2026-01-05 09:42:24', '2026-01-05 09:42:24'),
(26, 'LAB20260105105', 10, 7, 2798.00, 2780.00, 2, 3, 3, 2, 'Room 1', 1, 0, '2026-01-05 09:42:24', '2026-01-05 09:42:24'),
(27, 'LAB20260105105', 10, 8, 1943.00, 591.00, 3, 3, 4, 2, 'Room 4', 1, 0, '2026-01-05 09:42:25', '2026-01-05 09:42:25'),
(28, 'LAB20260105106', 10, 1, 2869.00, 647.00, 2, 4, 4, 1, 'Room 3', 1, 0, '2026-01-05 12:08:18', '2026-01-05 12:08:18'),
(29, 'LAB20260105106', 10, 2, 1706.00, 4034.00, 1, 3, 1, 1, 'Room 10', 1, 0, '2026-01-05 12:08:18', '2026-01-05 12:08:18'),
(30, 'LAB20260105106', 10, 3, 1371.00, 3727.00, 4, 4, 2, 2, 'Room 8', 1, 0, '2026-01-05 12:08:19', '2026-01-05 12:08:19'),
(31, 'LAB20260105106', 10, 4, 985.00, 3557.00, 4, 1, 1, 2, 'Room 2', 1, 0, '2026-01-05 12:08:19', '2026-01-05 12:08:19'),
(32, 'LAB20260105107', 10, 5, 1828.00, 3658.00, 2, 2, 1, 2, 'Room 8', 1, 0, '2026-01-05 12:08:29', '2026-01-05 12:08:29'),
(33, 'LAB20260105107', 10, 6, 2367.00, 4388.00, 4, 1, 1, 1, 'Room 3', 1, 0, '2026-01-05 12:08:29', '2026-01-05 12:08:29'),
(34, 'LAB20260105107', 10, 7, 2798.00, 2780.00, 2, 3, 3, 2, 'Room 1', 1, 0, '2026-01-05 12:08:29', '2026-01-05 12:08:29'),
(35, 'LAB20260105107', 10, 8, 1943.00, 591.00, 3, 3, 4, 2, 'Room 4', 1, 0, '2026-01-05 12:08:30', '2026-01-05 12:08:30'),
(36, 'LAB20260105107', 10, 10, 3912.00, 1241.00, 3, 1, 2, 2, 'Room 6', 1, 0, '2026-01-05 12:08:31', '2026-01-05 12:08:31'),
(37, 'LAB20260105107', 10, 11, 4362.00, 3746.00, 4, 4, 4, 1, 'Room 8', 1, 0, '2026-01-05 12:08:31', '2026-01-05 12:08:31'),
(38, 'LAB20260105107', 10, 12, 3404.00, 2028.00, 1, 3, 4, 1, 'Room 6', 1, 0, '2026-01-05 12:08:32', '2026-01-05 12:08:32');

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
(1, 'S72IWGU8MCI0', '2026-01-05', 'Shamim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 15, 14, 1000.00, 0.00, 1000.00, 1000.00, 1, 0.00, 0.00, 1, 10, '2026-01-05 12:21:40', '2026-01-05 12:21:40'),
(2, 'ZZXP1VXQHIPE', '2026-01-05', 'Shamim Hossain', '2001-12-31', 'Male', '1762164746', 'Kaliakair, Gazipur, Dhaka, Bangladesh', 5, 1, 800.00, 0.00, 800.00, 500.00, 0, 300.00, 0.00, 1, 10, '2026-01-05 12:22:03', '2026-01-05 12:22:03');

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
(1, 'mg', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(2, 'ml', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(3, 'g', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(4, 'L', '2026-01-05 04:42:29', '2025-10-22 10:52:17'),
(5, 'tablet', '2026-01-05 04:42:29', '2026-01-05 04:42:29'),
(6, 'capsule', '2026-01-05 04:42:29', '2026-01-05 04:42:29');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=407;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `test_report_details`
--
ALTER TABLE `test_report_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `ticket_sales`
--
ALTER TABLE `ticket_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
