-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2024 at 07:31 AM
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
-- Database: `protracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('17af87570ffe041c9bbf1ddf6b33265088582ebe', '2024-05-28 04:52:37.410673', 4);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add uploaded file', 7, 'add_uploadedfile'),
(26, 'Can change uploaded file', 7, 'change_uploadedfile'),
(27, 'Can delete uploaded file', 7, 'delete_uploadedfile'),
(28, 'Can view uploaded file', 7, 'view_uploadedfile'),
(29, 'Can add Token', 8, 'add_token'),
(30, 'Can change Token', 8, 'change_token'),
(31, 'Can delete Token', 8, 'delete_token'),
(32, 'Can view Token', 8, 'view_token'),
(33, 'Can add Token', 9, 'add_tokenproxy'),
(34, 'Can change Token', 9, 'change_tokenproxy'),
(35, 'Can delete Token', 9, 'delete_tokenproxy'),
(36, 'Can view Token', 9, 'view_tokenproxy'),
(37, 'Can add file upload', 10, 'add_fileupload'),
(38, 'Can change file upload', 10, 'change_fileupload'),
(39, 'Can delete file upload', 10, 'delete_fileupload'),
(40, 'Can view file upload', 10, 'view_fileupload'),
(41, 'Can add data upload', 11, 'add_dataupload'),
(42, 'Can change data upload', 11, 'change_dataupload'),
(43, 'Can delete data upload', 11, 'delete_dataupload'),
(44, 'Can view data upload', 11, 'view_dataupload'),
(45, 'Can add prosthesis company frequency', 12, 'add_prosthesiscompanyfrequency'),
(46, 'Can change prosthesis company frequency', 12, 'change_prosthesiscompanyfrequency'),
(47, 'Can delete prosthesis company frequency', 12, 'delete_prosthesiscompanyfrequency'),
(48, 'Can view prosthesis company frequency', 12, 'view_prosthesiscompanyfrequency'),
(49, 'Can add age group', 13, 'add_agegroup'),
(50, 'Can change age group', 13, 'change_agegroup'),
(51, 'Can delete age group', 13, 'delete_agegroup'),
(52, 'Can view age group', 13, 'view_agegroup'),
(53, 'Can add complication', 14, 'add_complication'),
(54, 'Can change complication', 14, 'change_complication'),
(55, 'Can delete complication', 14, 'delete_complication'),
(56, 'Can view complication', 14, 'view_complication'),
(57, 'Can add indication', 15, 'add_indication'),
(58, 'Can change indication', 15, 'change_indication'),
(59, 'Can delete indication', 15, 'delete_indication'),
(60, 'Can view indication', 15, 'view_indication'),
(61, 'Can add sex', 16, 'add_sex'),
(62, 'Can change sex', 16, 'change_sex'),
(63, 'Can delete sex', 16, 'delete_sex'),
(64, 'Can view sex', 16, 'view_sex'),
(65, 'Can add prosthesis company frequency by indication', 17, 'add_prosthesiscompanyfrequencybyindication'),
(66, 'Can change prosthesis company frequency by indication', 17, 'change_prosthesiscompanyfrequencybyindication'),
(67, 'Can delete prosthesis company frequency by indication', 17, 'delete_prosthesiscompanyfrequencybyindication'),
(68, 'Can view prosthesis company frequency by indication', 17, 'view_prosthesiscompanyfrequencybyindication'),
(69, 'Can add revision rates of prosthesis company', 18, 'add_revisionratesofprosthesiscompany'),
(70, 'Can change revision rates of prosthesis company', 18, 'change_revisionratesofprosthesiscompany'),
(71, 'Can delete revision rates of prosthesis company', 18, 'delete_revisionratesofprosthesiscompany'),
(72, 'Can view revision rates of prosthesis company', 18, 'view_revisionratesofprosthesiscompany'),
(73, 'Can add hemiarthroplasty by indication', 19, 'add_hemiarthroplastybyindication'),
(74, 'Can change hemiarthroplasty by indication', 19, 'change_hemiarthroplastybyindication'),
(75, 'Can delete hemiarthroplasty by indication', 19, 'delete_hemiarthroplastybyindication'),
(76, 'Can view hemiarthroplasty by indication', 19, 'view_hemiarthroplastybyindication'),
(77, 'Can add anatomic total shoulder arthroplasty by indication', 20, 'add_anatomictotalshoulderarthroplastybyindication'),
(78, 'Can change anatomic total shoulder arthroplasty by indication', 20, 'change_anatomictotalshoulderarthroplastybyindication'),
(79, 'Can delete anatomic total shoulder arthroplasty by indication', 20, 'delete_anatomictotalshoulderarthroplastybyindication'),
(80, 'Can view anatomic total shoulder arthroplasty by indication', 20, 'view_anatomictotalshoulderarthroplastybyindication'),
(81, 'Can add reverse total shoulder arthroplasty by indication', 21, 'add_reversetotalshoulderarthroplastybyindication'),
(82, 'Can change reverse total shoulder arthroplasty by indication', 21, 'change_reversetotalshoulderarthroplastybyindication'),
(83, 'Can delete reverse total shoulder arthroplasty by indication', 21, 'delete_reversetotalshoulderarthroplastybyindication'),
(84, 'Can view reverse total shoulder arthroplasty by indication', 21, 'view_reversetotalshoulderarthroplastybyindication'),
(85, 'Can add shoulder arthroplasty by complication', 22, 'add_shoulderarthroplastybycomplication'),
(86, 'Can change shoulder arthroplasty by complication', 22, 'change_shoulderarthroplastybycomplication'),
(87, 'Can delete shoulder arthroplasty by complication', 22, 'delete_shoulderarthroplastybycomplication'),
(88, 'Can view shoulder arthroplasty by complication', 22, 'view_shoulderarthroplastybycomplication'),
(89, 'Can add shoulder arthroplasty revision rate by age', 23, 'add_shoulderarthroplastyrevisionratebyage'),
(90, 'Can change shoulder arthroplasty revision rate by age', 23, 'change_shoulderarthroplastyrevisionratebyage'),
(91, 'Can delete shoulder arthroplasty revision rate by age', 23, 'delete_shoulderarthroplastyrevisionratebyage'),
(92, 'Can view shoulder arthroplasty revision rate by age', 23, 'view_shoulderarthroplastyrevisionratebyage'),
(93, 'Can add shoulder arthroplasty by age', 24, 'add_shoulderarthroplastybyage'),
(94, 'Can change shoulder arthroplasty by age', 24, 'change_shoulderarthroplastybyage'),
(95, 'Can delete shoulder arthroplasty by age', 24, 'delete_shoulderarthroplastybyage'),
(96, 'Can view shoulder arthroplasty by age', 24, 'view_shoulderarthroplastybyage'),
(97, 'Can add anatomic total shoulder arthroplasty by age and sex', 25, 'add_anatomictotalshoulderarthroplastybyageandsex'),
(98, 'Can change anatomic total shoulder arthroplasty by age and sex', 25, 'change_anatomictotalshoulderarthroplastybyageandsex'),
(99, 'Can delete anatomic total shoulder arthroplasty by age and sex', 25, 'delete_anatomictotalshoulderarthroplastybyageandsex'),
(100, 'Can view anatomic total shoulder arthroplasty by age and sex', 25, 'view_anatomictotalshoulderarthroplastybyageandsex'),
(101, 'Can add shoulder arthroplasty revision rate by sex', 26, 'add_shoulderarthroplastyrevisionratebysex'),
(102, 'Can change shoulder arthroplasty revision rate by sex', 26, 'change_shoulderarthroplastyrevisionratebysex'),
(103, 'Can delete shoulder arthroplasty revision rate by sex', 26, 'delete_shoulderarthroplastyrevisionratebysex'),
(104, 'Can view shoulder arthroplasty revision rate by sex', 26, 'view_shoulderarthroplastyrevisionratebysex'),
(105, 'Can add hemiarthroplasty by age and sex', 27, 'add_hemiarthroplastybyageandsex'),
(106, 'Can change hemiarthroplasty by age and sex', 27, 'change_hemiarthroplastybyageandsex'),
(107, 'Can delete hemiarthroplasty by age and sex', 27, 'delete_hemiarthroplastybyageandsex'),
(108, 'Can view hemiarthroplasty by age and sex', 27, 'view_hemiarthroplastybyageandsex'),
(109, 'Can add prevalence of neer three or four_part proximal humeral fracture by age and sex', 28, 'add_prevalenceofneerthreeorfour_partproximalhumeralfracturebyageandsex'),
(110, 'Can change prevalence of neer three or four_part proximal humeral fracture by age and sex', 28, 'change_prevalenceofneerthreeorfour_partproximalhumeralfracturebyageandsex'),
(111, 'Can delete prevalence of neer three or four_part proximal humeral fracture by age and sex', 28, 'delete_prevalenceofneerthreeorfour_partproximalhumeralfracturebyageandsex'),
(112, 'Can view prevalence of neer three or four_part proximal humeral fracture by age and sex', 28, 'view_prevalenceofneerthreeorfour_partproximalhumeralfracturebyageandsex'),
(113, 'Can add reverse total shoulder arthroplasty by age and sex', 29, 'add_reversetotalshoulderarthroplastybyageandsex'),
(114, 'Can change reverse total shoulder arthroplasty by age and sex', 29, 'change_reversetotalshoulderarthroplastybyageandsex'),
(115, 'Can delete reverse total shoulder arthroplasty by age and sex', 29, 'delete_reversetotalshoulderarthroplastybyageandsex'),
(116, 'Can view reverse total shoulder arthroplasty by age and sex', 29, 'view_reversetotalshoulderarthroplastybyageandsex'),
(117, 'Can add shoulder arthroplasty by sex', 30, 'add_shoulderarthroplastybysex'),
(118, 'Can change shoulder arthroplasty by sex', 30, 'change_shoulderarthroplastybysex'),
(119, 'Can delete shoulder arthroplasty by sex', 30, 'delete_shoulderarthroplastybysex'),
(120, 'Can view shoulder arthroplasty by sex', 30, 'view_shoulderarthroplastybysex'),
(121, 'Can add prevalence of patients with rotatorcuff pathology with_ greater equal_1_comorbiditie by age and sex', 31, 'add_prevalenceofpatientswithrotatorcuffpathologywith_greaterequal_1_comorbiditiebyageandsex'),
(122, 'Can change prevalence of patients with rotatorcuff pathology with_ greater equal_1_comorbiditie by age and sex', 31, 'change_prevalenceofpatientswithrotatorcuffpathologywith_greaterequal_1_comorbiditiebyageandsex'),
(123, 'Can delete prevalence of patients with rotatorcuff pathology with_ greater equal_1_comorbiditie by age and sex', 31, 'delete_prevalenceofpatientswithrotatorcuffpathologywith_greaterequal_1_comorbiditiebyageandsex'),
(124, 'Can view prevalence of patients with rotatorcuff pathology with_ greater equal_1_comorbiditie by age and sex', 31, 'view_prevalenceofpatientswithrotatorcuffpathologywith_greaterequal_1_comorbiditiebyageandsex'),
(125, 'Can add rotator cuff pathology', 32, 'add_rotatorcuffpathology'),
(126, 'Can change rotator cuff pathology', 32, 'change_rotatorcuffpathology'),
(127, 'Can delete rotator cuff pathology', 32, 'delete_rotatorcuffpathology'),
(128, 'Can view rotator cuff pathology', 32, 'view_rotatorcuffpathology');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(4, 'pbkdf2_sha256$720000$lxo199KSmJ0Rf1fT3oI5dz$ky5HsG1rFXAwGjo5J/UZgqUiEItszlO8fbRHIQbc9qo=', NULL, 0, 'arslan', '', '', 'arslan@email.com', 0, 1, '2024-04-24 16:57:30.459905');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(8, 'authtoken', 'token'),
(9, 'authtoken', 'tokenproxy'),
(5, 'contenttypes', 'contenttype'),
(13, 'fileupload', 'agegroup'),
(25, 'fileupload', 'anatomictotalshoulderarthroplastybyageandsex'),
(20, 'fileupload', 'anatomictotalshoulderarthroplastybyindication'),
(14, 'fileupload', 'complication'),
(11, 'fileupload', 'dataupload'),
(10, 'fileupload', 'fileupload'),
(27, 'fileupload', 'hemiarthroplastybyageandsex'),
(19, 'fileupload', 'hemiarthroplastybyindication'),
(15, 'fileupload', 'indication'),
(28, 'fileupload', 'prevalenceofneerthreeorfour_partproximalhumeralfracturebyageandsex'),
(31, 'fileupload', 'prevalenceofpatientswithrotatorcuffpathologywith_greaterequal_1_comorbiditiebyageandsex'),
(12, 'fileupload', 'prosthesiscompanyfrequency'),
(17, 'fileupload', 'prosthesiscompanyfrequencybyindication'),
(29, 'fileupload', 'reversetotalshoulderarthroplastybyageandsex'),
(21, 'fileupload', 'reversetotalshoulderarthroplastybyindication'),
(18, 'fileupload', 'revisionratesofprosthesiscompany'),
(32, 'fileupload', 'rotatorcuffpathology'),
(16, 'fileupload', 'sex'),
(24, 'fileupload', 'shoulderarthroplastybyage'),
(22, 'fileupload', 'shoulderarthroplastybycomplication'),
(30, 'fileupload', 'shoulderarthroplastybysex'),
(23, 'fileupload', 'shoulderarthroplastyrevisionratebyage'),
(26, 'fileupload', 'shoulderarthroplastyrevisionratebysex'),
(7, 'fileupload', 'uploadedfile'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-04-24 09:43:35.825687'),
(2, 'auth', '0001_initial', '2024-04-24 09:43:36.354740'),
(3, 'admin', '0001_initial', '2024-04-24 09:43:36.475437'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-04-24 09:43:36.495919'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-24 09:43:36.510984'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-04-24 09:43:36.595817'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-04-24 09:43:36.675470'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-04-24 09:43:36.768991'),
(9, 'auth', '0004_alter_user_username_opts', '2024-04-24 09:43:36.775877'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-04-24 09:43:36.828561'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-04-24 09:43:36.843362'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-04-24 09:43:36.844370'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-04-24 09:43:36.874706'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-04-24 09:43:36.895081'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-04-24 09:43:36.913942'),
(16, 'auth', '0011_update_proxy_permissions', '2024-04-24 09:43:36.927628'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-04-24 09:43:36.949282'),
(18, 'sessions', '0001_initial', '2024-04-24 09:43:36.991313'),
(19, 'fileupload', '0001_initial', '2024-04-24 10:41:10.319017'),
(20, 'authtoken', '0001_initial', '2024-04-24 15:07:52.709808'),
(21, 'authtoken', '0002_auto_20160226_1747', '2024-04-24 15:07:52.755267'),
(22, 'authtoken', '0003_tokenproxy', '2024-04-24 15:07:52.761040'),
(23, 'authtoken', '0004_alter_tokenproxy_options', '2024-04-24 15:07:52.772064'),
(24, 'fileupload', '0002_rename_user_id_fileupload_user', '2024-04-24 16:46:47.237865'),
(25, 'fileupload', '0003_dataupload', '2024-04-25 05:08:54.840432'),
(27, 'fileupload', '0004_agegroup_prosthesiscompanyfrequency', '2024-05-16 04:30:07.439311'),
(28, 'fileupload', '0005_remove_prosthesiscompanyfrequency_age_group_and_more', '2024-05-16 04:33:18.395517'),
(29, 'fileupload', '0004_agegroup', '2024-05-16 04:35:10.861178'),
(30, 'fileupload', '0005_prosthesiscompanyfrequency', '2024-05-16 04:36:09.566748'),
(31, 'fileupload', '0006_complication_indication_sex', '2024-05-16 05:33:31.714430'),
(32, 'fileupload', '0007_prosthesiscompanyfrequencybyindication_and_more', '2024-05-16 05:36:29.771660'),
(33, 'fileupload', '0008_prosthesiscompanyfrequency_uploaded_at_and_more', '2024-05-16 05:40:09.544903'),
(34, 'fileupload', '0009_alter_prosthesiscompanyfrequency_options_and_more', '2024-05-16 05:43:39.196642'),
(35, 'fileupload', '0010_anatomictotalshoulderarthroplastybyageandsex_and_more', '2024-05-21 08:36:40.868750'),
(36, 'fileupload', '0011_rotatorcuffpathology', '2024-05-22 04:32:16.569993'),
(37, 'fileupload', '0012_rename_name_agegroup_agegroup', '2024-05-24 05:37:50.674265');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('gx2umk6l2p44ktbtmiv5jr3d4rdeafg0', '.eJxVjDsOwjAQBe_iGlneEP8o6XMGy7vrxQHkSPlUiLtDpBTQvpl5L5Xytta0LWVOI6uLAnX63TDTo7Qd8D2326Rpaus8ot4VfdBFDxOX5_Vw_w5qXuq3Fi7YoWcQF71lb4MBEiPBnsECYnSeqJO-F-Q-InsjDqgwdQAsJaj3B_3fOMs:1rzZCQ:fct1hy2oDPaDR_wFKu5ei6vp33YK0T9CD3Vavrxwfqk', '2024-05-08 09:45:58.659655');

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_agegroup`
--

CREATE TABLE `fileupload_agegroup` (
  `id` bigint(20) NOT NULL,
  `agegroup` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_agegroup`
--

INSERT INTO `fileupload_agegroup` (`id`, `agegroup`) VALUES
(1, '0-19'),
(2, '20-39'),
(3, '40-59'),
(4, '60-79'),
(5, '?80');

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_anatomictotalshoulderarthroplastybyageandsex`
--

CREATE TABLE `fileupload_anatomictotalshoulderarthroplastybyageandsex` (
  `id` bigint(20) NOT NULL,
  `zero_19` int(11) NOT NULL,
  `twenty_39` int(11) NOT NULL,
  `forty_59` int(11) NOT NULL,
  `sixty_79` int(11) NOT NULL,
  `greaterThan_80` int(11) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `sex_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_anatomictotalshoulderarthroplastybyageandsex`
--

INSERT INTO `fileupload_anatomictotalshoulderarthroplastybyageandsex` (`id`, `zero_19`, `twenty_39`, `forty_59`, `sixty_79`, `greaterThan_80`, `uploaded_at`, `sex_id`) VALUES
(1, 50, 75, 125, 250, 500, '2024-05-28 05:01:33.860990', 1),
(2, 125, 250, 500, 1000, 2000, '2024-05-28 05:01:34.015440', 2),
(3, 50, 75, 125, 250, 500, '2024-05-28 05:01:38.768523', 1),
(4, 125, 250, 500, 1000, 2000, '2024-05-28 05:01:38.795775', 2);

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_anatomictotalshoulderarthroplastybyindication`
--

CREATE TABLE `fileupload_anatomictotalshoulderarthroplastybyindication` (
  `id` bigint(20) NOT NULL,
  `number` int(11) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `indication_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_anatomictotalshoulderarthroplastybyindication`
--

INSERT INTO `fileupload_anatomictotalshoulderarthroplastybyindication` (`id`, `number`, `uploaded_at`, `indication_id`) VALUES
(1, 500, '2024-05-24 04:49:06.051664', 1),
(2, 250, '2024-05-24 04:49:06.530632', 2),
(3, 125, '2024-05-24 04:49:06.621605', 3),
(4, 63, '2024-05-24 04:49:06.637861', 4),
(5, 500, '2024-05-24 04:49:14.542193', 1),
(6, 250, '2024-05-24 04:49:14.546493', 2),
(7, 125, '2024-05-24 04:49:14.550032', 3),
(8, 63, '2024-05-24 04:49:14.553068', 4);

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_complication`
--

CREATE TABLE `fileupload_complication` (
  `id` bigint(20) NOT NULL,
  `complication` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_complication`
--

INSERT INTO `fileupload_complication` (`id`, `complication`) VALUES
(1, 'Osteoarthritis or glenoid arthrosis'),
(2, 'Glenoid loosening'),
(3, 'Roator cuff tear, arthropathy, deficiency'),
(4, 'Humeral loosening'),
(5, 'Infection'),
(6, 'Instability'),
(7, 'Fracture or malnunion'),
(8, 'Material or mechanical failure'),
(9, 'Glenoid bone loss or erosion'),
(10, 'Subscapularis insuficiency'),
(11, 'Scapular notching'),
(12, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_dataupload`
--

CREATE TABLE `fileupload_dataupload` (
  `id` bigint(20) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `indications` varchar(255) NOT NULL,
  `prothesis_type` varchar(255) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `file_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_dataupload`
--

INSERT INTO `fileupload_dataupload` (`id`, `sex`, `age`, `indications`, `prothesis_type`, `uploaded_at`, `file_id`) VALUES
(47, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.239704', 71),
(48, 'M', '53', 'Osteoarthritis', 'Resurfacing', '2024-04-25 10:48:37.259446', 71),
(49, 'F', '68', 'Infection', 'InterSpace Shou', '2024-04-25 10:48:37.291449', 71),
(50, 'M', '72', 'PHF', 'Reverse Fractur', '2024-04-25 10:48:37.309220', 71),
(51, 'F', '89', 'Othe', 'Resurfacing', '2024-04-25 10:48:37.342014', 71),
(52, 'M', '90', 'Rotator cuff', 'Reverse izqu', '2024-04-25 10:48:37.369465', 71),
(53, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.387544', 71),
(54, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.408799', 71),
(55, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.424511', 71),
(56, 'M', '99', 'PHF', 'Reverse Fractur', '2024-04-25 10:48:37.440766', 71),
(57, 'F', '85', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.457422', 71),
(58, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.474597', 71),
(59, 'F', '83', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.490681', 71),
(60, 'M', '90', 'PHF', 'Reverse Fractur', '2024-04-25 10:48:37.507307', 71),
(61, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.524097', 71),
(62, 'M', '53', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.541098', 71),
(63, 'F', '68', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.557301', 71),
(64, 'M', '72', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.572413', 71),
(65, 'F', '89', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.575816', 71),
(66, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.604046', 71),
(67, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.607443', 71),
(68, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.624432', 71),
(69, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.640821', 71),
(70, 'M', '99', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.657267', 71),
(71, 'F', '85', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.685122', 71),
(72, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.702532', 71),
(73, 'F', '83', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.707371', 71),
(74, 'M', '90', 'Osteoarthritis', 'TSA', '2024-04-25 10:48:37.724204', 71),
(75, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.751859', 71),
(76, 'M', '53', 'PHF', 'Reverse Fractur', '2024-04-25 10:48:37.769254', 71),
(77, 'F', '68', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.774215', 71),
(78, 'M', '72', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.895663', 71),
(79, 'F', '89', 'Osteoarthritis', 'TSA', '2024-04-25 10:48:37.907323', 71),
(80, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.924298', 71),
(81, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:37.962420', 71),
(82, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:38.007563', 71),
(83, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:38.024226', 71),
(84, 'M', '99', 'PHF', 'Reverse Fractur', '2024-04-25 10:48:38.041103', 71),
(85, 'F', '85', 'PHF', 'Placa de Hombro', '2024-04-25 10:48:38.057790', 71),
(86, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:38.074461', 71),
(87, 'F', '83', 'Exploratory', 'Recon Humeral', '2024-04-25 10:48:38.106733', 71),
(88, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-25 10:48:38.124411', 71),
(89, 'F', '65', 'PHF', 'Reverse Fractur', '2024-04-25 10:48:38.157534', 71),
(90, 'M', '53', 'Revision', 'Revision Revers', '2024-04-25 10:48:38.174379', 71),
(91, 'F', '68', 'Revison', 'Revision Revers', '2024-04-25 10:48:38.190846', 71),
(92, 'M', '72', 'PHF', 'Reverse Fractur', '2024-04-25 10:48:38.205160', 71),
(93, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.539495', 72),
(94, 'M', '53', 'Osteoarthritis', 'Resurfacing', '2024-04-27 06:21:09.544361', 72),
(95, 'F', '68', 'Infection', 'InterSpace Shou', '2024-04-27 06:21:09.548351', 72),
(96, 'M', '72', 'PHF', 'Reverse Fractur', '2024-04-27 06:21:09.550386', 72),
(97, 'F', '89', 'Othe', 'Resurfacing', '2024-04-27 06:21:09.557369', 72),
(98, 'M', '90', 'Rotator cuff', 'Reverse izqu', '2024-04-27 06:21:09.560318', 72),
(99, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.564324', 72),
(100, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.569297', 72),
(101, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.571331', 72),
(102, 'M', '99', 'PHF', 'Reverse Fractur', '2024-04-27 06:21:09.574282', 72),
(103, 'F', '85', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.576290', 72),
(104, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.580268', 72),
(105, 'F', '83', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.588243', 72),
(106, 'M', '90', 'PHF', 'Reverse Fractur', '2024-04-27 06:21:09.593231', 72),
(107, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.597223', 72),
(108, 'M', '53', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.601217', 72),
(109, 'F', '68', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.605199', 72),
(110, 'M', '72', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.608203', 72),
(111, 'F', '89', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.613185', 72),
(112, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.617167', 72),
(113, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.621157', 72),
(114, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.624147', 72),
(115, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.627139', 72),
(116, 'M', '99', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.631129', 72),
(117, 'F', '85', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.637113', 72),
(118, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.642099', 72),
(119, 'F', '83', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.646090', 72),
(120, 'M', '90', 'Osteoarthritis', 'TSA', '2024-04-27 06:21:09.651076', 72),
(121, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.654068', 72),
(122, 'M', '53', 'PHF', 'Reverse Fractur', '2024-04-27 06:21:09.658056', 72),
(123, 'F', '68', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.661049', 72),
(124, 'M', '72', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.665038', 72),
(125, 'F', '89', 'Osteoarthritis', 'TSA', '2024-04-27 06:21:09.668037', 72),
(126, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.671023', 72),
(127, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.673016', 72),
(128, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.676009', 72),
(129, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.679001', 72),
(130, 'M', '99', 'PHF', 'Reverse Fractur', '2024-04-27 06:21:09.682992', 72),
(131, 'F', '85', 'PHF', 'Placa de Hombro', '2024-04-27 06:21:09.684984', 72),
(132, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.687312', 72),
(133, 'F', '83', 'Exploratory', 'Recon Humeral', '2024-04-27 06:21:09.689309', 72),
(134, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-27 06:21:09.691176', 72),
(135, 'F', '65', 'PHF', 'Reverse Fractur', '2024-04-27 06:21:09.693200', 72),
(136, 'M', '53', 'Revision', 'Revision Revers', '2024-04-27 06:21:09.697341', 72),
(137, 'F', '68', 'Revison', 'Revision Revers', '2024-04-27 06:21:09.700368', 72),
(138, 'M', '72', 'PHF', 'Reverse Fractur', '2024-04-27 06:21:09.702326', 72),
(139, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.752130', 73),
(140, 'M', '53', 'Osteoarthritis', 'Resurfacing', '2024-04-27 06:22:16.752130', 73),
(141, 'F', '68', 'Infection', 'InterSpace Shou', '2024-04-27 06:22:16.752130', 73),
(142, 'M', '72', 'PHF', 'Reverse Fractur', '2024-04-27 06:22:16.752130', 73),
(143, 'F', '89', 'Othe', 'Resurfacing', '2024-04-27 06:22:16.767751', 73),
(144, 'M', '90', 'Rotator cuff', 'Reverse izqu', '2024-04-27 06:22:16.771088', 73),
(145, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.774667', 73),
(146, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.774667', 73),
(147, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.780190', 73),
(148, 'M', '99', 'PHF', 'Reverse Fractur', '2024-04-27 06:22:16.780190', 73),
(149, 'F', '85', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.780190', 73),
(150, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.780190', 73),
(151, 'F', '83', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.780190', 73),
(152, 'M', '90', 'PHF', 'Reverse Fractur', '2024-04-27 06:22:16.795613', 73),
(153, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.798605', 73),
(154, 'M', '53', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.800599', 73),
(155, 'F', '68', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.803591', 73),
(156, 'M', '72', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.805586', 73),
(157, 'F', '89', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.808578', 73),
(158, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.810573', 73),
(159, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.814669', 73),
(160, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.817659', 73),
(161, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.819656', 73),
(162, 'M', '99', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.822499', 73),
(163, 'F', '85', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.827963', 73),
(164, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.828764', 73),
(165, 'F', '83', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.828764', 73),
(166, 'M', '90', 'Osteoarthritis', 'TSA', '2024-04-27 06:22:16.828764', 73),
(167, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.828764', 73),
(168, 'M', '53', 'PHF', 'Reverse Fractur', '2024-04-27 06:22:16.828764', 73),
(169, 'F', '68', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.828764', 73),
(170, 'M', '72', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.844546', 73),
(171, 'F', '89', 'Osteoarthritis', 'TSA', '2024-04-27 06:22:16.845385', 73),
(172, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.845385', 73),
(173, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.845385', 73),
(174, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.845385', 73),
(175, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.845385', 73),
(176, 'M', '99', 'PHF', 'Reverse Fractur', '2024-04-27 06:22:16.861234', 73),
(177, 'F', '85', 'PHF', 'Placa de Hombro', '2024-04-27 06:22:16.865228', 73),
(178, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.867221', 73),
(179, 'F', '83', 'Exploratory', 'Recon Humeral', '2024-04-27 06:22:16.869217', 73),
(180, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-27 06:22:16.871212', 73),
(181, 'F', '65', 'PHF', 'Reverse Fractur', '2024-04-27 06:22:16.873206', 73),
(182, 'M', '53', 'Revision', 'Revision Revers', '2024-04-27 06:22:16.875246', 73),
(183, 'F', '68', 'Revison', 'Revision Revers', '2024-04-27 06:22:16.877230', 73),
(184, 'M', '72', 'PHF', 'Reverse Fractur', '2024-04-27 06:22:16.880408', 73),
(185, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.638758', 74),
(186, 'M', '53', 'Osteoarthritis', 'Resurfacing', '2024-04-29 12:51:05.653092', 74),
(187, 'F', '68', 'Infection', 'InterSpace Shou', '2024-04-29 12:51:05.661106', 74),
(188, 'M', '72', 'PHF', 'Reverse Fractur', '2024-04-29 12:51:05.673999', 74),
(189, 'F', '89', 'Othe', 'Resurfacing', '2024-04-29 12:51:05.685665', 74),
(190, 'M', '90', 'Rotator cuff', 'Reverse izqu', '2024-04-29 12:51:05.695191', 74),
(191, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.705536', 74),
(192, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.710917', 74),
(193, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.725242', 74),
(194, 'M', '99', 'PHF', 'Reverse Fractur', '2024-04-29 12:51:05.733640', 74),
(195, 'F', '85', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.743720', 74),
(196, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.753481', 74),
(197, 'F', '83', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.763378', 74),
(198, 'M', '90', 'PHF', 'Reverse Fractur', '2024-04-29 12:51:05.768608', 74),
(199, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.776725', 74),
(200, 'M', '53', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.790766', 74),
(201, 'F', '68', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.801430', 74),
(202, 'M', '72', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.810447', 74),
(203, 'F', '89', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.822312', 74),
(204, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.826223', 74),
(205, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.843715', 74),
(206, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.857392', 74),
(207, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.870721', 74),
(208, 'M', '99', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.874713', 74),
(209, 'F', '85', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.900702', 74),
(210, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.911519', 74),
(211, 'F', '83', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.918996', 74),
(212, 'M', '90', 'Osteoarthritis', 'TSA', '2024-04-29 12:51:05.926223', 74),
(213, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.939961', 74),
(214, 'M', '53', 'PHF', 'Reverse Fractur', '2024-04-29 12:51:05.947542', 74),
(215, 'F', '68', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.956025', 74),
(216, 'M', '72', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.964105', 74),
(217, 'F', '89', 'Osteoarthritis', 'TSA', '2024-04-29 12:51:05.974793', 74),
(218, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.980590', 74),
(219, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:05.993608', 74),
(220, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:06.003304', 74),
(221, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:06.013876', 74),
(222, 'M', '99', 'PHF', 'Reverse Fractur', '2024-04-29 12:51:06.031037', 74),
(223, 'F', '85', 'PHF', 'Placa de Hombro', '2024-04-29 12:51:06.053951', 74),
(224, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:06.070011', 74),
(225, 'F', '83', 'Exploratory', 'Recon Humeral', '2024-04-29 12:51:06.079413', 74),
(226, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-29 12:51:06.097991', 74),
(227, 'F', '65', 'PHF', 'Reverse Fractur', '2024-04-29 12:51:06.107570', 74),
(228, 'M', '53', 'Revision', 'Revision Revers', '2024-04-29 12:51:06.118199', 74),
(229, 'F', '68', 'Revison', 'Revision Revers', '2024-04-29 12:51:06.120756', 74),
(230, 'M', '72', 'PHF', 'Reverse Fractur', '2024-04-29 12:51:06.127771', 74),
(231, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.828941', 75),
(232, 'M', '53', 'Osteoarthritis', 'Resurfacing', '2024-04-29 12:52:42.836709', 75),
(233, 'F', '68', 'Infection', 'InterSpace Shou', '2024-04-29 12:52:42.841116', 75),
(234, 'M', '72', 'PHF', 'Reverse Fractur', '2024-04-29 12:52:42.845199', 75),
(235, 'F', '89', 'Othe', 'Resurfacing', '2024-04-29 12:52:42.847441', 75),
(236, 'M', '90', 'Rotator cuff', 'Reverse izqu', '2024-04-29 12:52:42.853090', 75),
(237, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.854595', 75),
(238, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.854595', 75),
(239, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.854595', 75),
(240, 'M', '99', 'PHF', 'Reverse Fractur', '2024-04-29 12:52:42.868755', 75),
(241, 'F', '85', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.870040', 75),
(242, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.870040', 75),
(243, 'F', '83', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.875493', 75),
(244, 'M', '90', 'PHF', 'Reverse Fractur', '2024-04-29 12:52:42.881462', 75),
(245, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.884820', 75),
(246, 'M', '53', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.892685', 75),
(247, 'F', '68', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.896016', 75),
(248, 'M', '72', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.899296', 75),
(249, 'F', '89', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.900699', 75),
(250, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.907244', 75),
(251, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.908902', 75),
(252, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.915302', 75),
(253, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.919313', 75),
(254, 'M', '99', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.925851', 75),
(255, 'F', '85', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.927371', 75),
(256, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.934842', 75),
(257, 'F', '83', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.940691', 75),
(258, 'M', '90', 'Osteoarthritis', 'TSA', '2024-04-29 12:52:42.944686', 75),
(259, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.949877', 75),
(260, 'M', '53', 'PHF', 'Reverse Fractur', '2024-04-29 12:52:42.952241', 75),
(261, 'F', '68', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.955867', 75),
(262, 'M', '72', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.962833', 75),
(263, 'F', '89', 'Osteoarthritis', 'TSA', '2024-04-29 12:52:42.968501', 75),
(264, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.976646', 75),
(265, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.984094', 75),
(266, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:42.991133', 75),
(267, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:43.001523', 75),
(268, 'M', '99', 'PHF', 'Reverse Fractur', '2024-04-29 12:52:43.011970', 75),
(269, 'F', '85', 'PHF', 'Placa de Hombro', '2024-04-29 12:52:43.015035', 75),
(270, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:43.023623', 75),
(271, 'F', '83', 'Exploratory', 'Recon Humeral', '2024-04-29 12:52:43.032090', 75),
(272, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-29 12:52:43.041804', 75),
(273, 'F', '65', 'PHF', 'Reverse Fractur', '2024-04-29 12:52:43.054937', 75),
(274, 'M', '53', 'Revision', 'Revision Revers', '2024-04-29 12:52:43.067209', 75),
(275, 'F', '68', 'Revison', 'Revision Revers', '2024-04-29 12:52:43.079139', 75),
(276, 'M', '72', 'PHF', 'Reverse Fractur', '2024-04-29 12:52:43.087980', 75),
(277, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.640764', 76),
(278, 'M', '53', 'Osteoarthritis', 'Resurfacing', '2024-04-29 12:53:53.640764', 76),
(279, 'F', '68', 'Infection', 'InterSpace Shou', '2024-04-29 12:53:53.656407', 76),
(280, 'M', '72', 'PHF', 'Reverse Fractur', '2024-04-29 12:53:53.656407', 76),
(281, 'F', '89', 'Othe', 'Resurfacing', '2024-04-29 12:53:53.672032', 76),
(282, 'M', '90', 'Rotator cuff', 'Reverse izqu', '2024-04-29 12:53:53.672032', 76),
(283, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.688788', 76),
(284, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.688788', 76),
(285, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.705480', 76),
(286, 'M', '99', 'PHF', 'Reverse Fractur', '2024-04-29 12:53:53.705480', 76),
(287, 'F', '85', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.723406', 76),
(288, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.723988', 76),
(289, 'F', '83', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.735014', 76),
(290, 'M', '90', 'PHF', 'Reverse Fractur', '2024-04-29 12:53:53.735014', 76),
(291, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.735014', 76),
(292, 'M', '53', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.750645', 76),
(293, 'F', '68', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.750645', 76),
(294, 'M', '72', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.750645', 76),
(295, 'F', '89', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.750645', 76),
(296, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.766635', 76),
(297, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.769561', 76),
(298, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.771595', 76),
(299, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.771595', 76),
(300, 'M', '99', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.771595', 76),
(301, 'F', '85', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.782602', 76),
(302, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.782602', 76),
(303, 'F', '83', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.782602', 76),
(304, 'M', '90', 'Osteoarthritis', 'TSA', '2024-04-29 12:53:53.782602', 76),
(305, 'F', '65', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.782602', 76),
(306, 'M', '53', 'PHF', 'Reverse Fractur', '2024-04-29 12:53:53.799101', 76),
(307, 'F', '68', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.800154', 76),
(308, 'M', '72', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.800154', 76),
(309, 'F', '89', 'Osteoarthritis', 'TSA', '2024-04-29 12:53:53.806664', 76),
(310, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.806664', 76),
(311, 'F', '88', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.811447', 76),
(312, 'M', '77', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.815039', 76),
(313, 'F', '66', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.816518', 76),
(314, 'M', '99', 'PHF', 'Reverse Fractur', '2024-04-29 12:53:53.820221', 76),
(315, 'F', '85', 'PHF', 'Placa de Hombro', '2024-04-29 12:53:53.824576', 76),
(316, 'M', '52', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.826847', 76),
(317, 'F', '83', 'Exploratory', 'Recon Humeral', '2024-04-29 12:53:53.829669', 76),
(318, 'M', '90', 'Rotator cuff', 'Reverse', '2024-04-29 12:53:53.833618', 76),
(319, 'F', '65', 'PHF', 'Reverse Fractur', '2024-04-29 12:53:53.834774', 76),
(320, 'M', '53', 'Revision', 'Revision Revers', '2024-04-29 12:53:53.839122', 76),
(321, 'F', '68', 'Revison', 'Revision Revers', '2024-04-29 12:53:53.841717', 76),
(322, 'M', '72', 'PHF', 'Reverse Fractur', '2024-04-29 12:53:53.845683', 76),
(323, 'F', '65', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.168428', 77),
(324, 'M', '53', 'Osteoarthritis', 'Resurfacing', '2024-05-09 05:07:01.174413', 77),
(325, 'F', '68', 'Infection', 'InterSpace Shou', '2024-05-09 05:07:01.178402', 77),
(326, 'M', '72', 'PHF', 'Reverse Fractur', '2024-05-09 05:07:01.182390', 77),
(327, 'F', '89', 'Othe', 'Resurfacing', '2024-05-09 05:07:01.189373', 77),
(328, 'M', '90', 'Rotator cuff', 'Reverse izqu', '2024-05-09 05:07:01.194357', 77),
(329, 'F', '88', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.197587', 77),
(330, 'M', '77', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.199812', 77),
(331, 'F', '66', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.203803', 77),
(332, 'M', '99', 'PHF', 'Reverse Fractur', '2024-05-09 05:07:01.210783', 77),
(333, 'F', '85', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.219250', 77),
(334, 'M', '52', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.224236', 77),
(335, 'F', '83', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.227244', 77),
(336, 'M', '90', 'PHF', 'Reverse Fractur', '2024-05-09 05:07:01.230339', 77),
(337, 'F', '65', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.233241', 77),
(338, 'M', '53', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.236235', 77),
(339, 'F', '68', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.240230', 77),
(340, 'M', '72', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.244078', 77),
(341, 'F', '89', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.246112', 77),
(342, 'M', '90', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.250064', 77),
(343, 'F', '88', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.255049', 77),
(344, 'M', '77', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.259040', 77),
(345, 'F', '66', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.261033', 77),
(346, 'M', '99', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.263070', 77),
(347, 'F', '85', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.267066', 77),
(348, 'M', '52', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.271042', 77),
(349, 'F', '83', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.273998', 77),
(350, 'M', '90', 'Osteoarthritis', 'TSA', '2024-05-09 05:07:01.277990', 77),
(351, 'F', '65', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.282979', 77),
(352, 'M', '53', 'PHF', 'Reverse Fractur', '2024-05-09 05:07:01.286963', 77),
(353, 'F', '68', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.290953', 77),
(354, 'M', '72', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.292947', 77),
(355, 'F', '89', 'Osteoarthritis', 'TSA', '2024-05-09 05:07:01.294942', 77),
(356, 'M', '90', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.297934', 77),
(357, 'F', '88', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.301925', 77),
(358, 'M', '77', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.304915', 77),
(359, 'F', '66', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.308905', 77),
(360, 'M', '99', 'PHF', 'Reverse Fractur', '2024-05-09 05:07:01.314889', 77),
(361, 'F', '85', 'PHF', 'Placa de Hombro', '2024-05-09 05:07:01.319876', 77),
(362, 'M', '52', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.324862', 77),
(363, 'F', '83', 'Exploratory', 'Recon Humeral', '2024-05-09 05:07:01.327854', 77),
(364, 'M', '90', 'Rotator cuff', 'Reverse', '2024-05-09 05:07:01.331843', 77),
(365, 'F', '65', 'PHF', 'Reverse Fractur', '2024-05-09 05:07:01.334836', 77),
(366, 'M', '53', 'Revision', 'Revision Revers', '2024-05-09 05:07:01.340821', 77),
(367, 'F', '68', 'Revison', 'Revision Revers', '2024-05-09 05:07:01.343813', 77),
(368, 'M', '72', 'PHF', 'Reverse Fractur', '2024-05-09 05:07:01.346805', 77);

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_fileupload`
--

CREATE TABLE `fileupload_fileupload` (
  `id` bigint(20) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `file_path` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_fileupload`
--

INSERT INTO `fileupload_fileupload` (`id`, `filename`, `file_path`, `uploaded_at`, `user_id`) VALUES
(64, 'test', 'uploads/Example_Data_IK8H5xn.csv', '2024-04-25 10:07:22.140035', 4),
(65, 'test', 'uploads/Example_Data_DM21GL3.csv', '2024-04-25 10:08:42.685087', 4),
(66, 'test', 'uploads/Example_Data_70mrzny.csv', '2024-04-25 10:09:55.642287', 4),
(67, 'test', 'uploads/Example_Data_ZKwJHfb.csv', '2024-04-25 10:13:12.624670', 4),
(68, 'test', 'uploads/Example_Data_pJLJufv.csv', '2024-04-25 10:14:42.613886', 4),
(69, 'test', 'uploads/Example_Data_VPd8iDw.csv', '2024-04-25 10:18:49.698743', 4),
(71, 'test', 'uploads/Example_Data_zR3hbNu.csv', '2024-04-25 10:48:37.200267', 4),
(72, 'test', 'uploads/Example_Data_cWBSBoh.csv', '2024-04-27 06:21:09.522587', 4),
(73, 'test', 'uploads/Example_Data_KEcTliU.csv', '2024-04-27 06:22:16.752130', 4),
(74, 'test new', 'uploads/Example_Data_kcJQayc.csv', '2024-04-29 12:51:05.611423', 4),
(75, 'asd', 'uploads/Example_Data_1.csv', '2024-04-29 12:52:42.812902', 4),
(76, 'asf', 'uploads/Example_Data_1_ngZulvD.csv', '2024-04-29 12:53:53.628689', 4),
(77, 'test new', 'uploads/Example_Data_vB4gLba.csv', '2024-05-09 05:07:01.159222', 4),
(78, 'test', 'uploads/rotatorcuffpathology.csv', '2024-05-22 10:39:20.712758', 4),
(79, 'test', 'uploads/rotatorcuffpathology_IL6b9qQ.csv', '2024-05-22 11:16:40.558896', 4),
(80, 'test', 'uploads/rotatorcuffpathology_b9M0VsU.csv', '2024-05-22 11:21:51.303189', 4),
(81, 'test', 'uploads/rotatorcuffpathology_U5M1tkA.csv', '2024-05-22 11:23:36.875906', 4),
(82, 'test', 'uploads/rotatorcuffpathology_a0jW665.csv', '2024-05-22 11:25:09.782213', 4),
(83, 'test', 'uploads/rotatorcuffpathology_eAxOA6M.csv', '2024-05-22 11:29:34.232297', 4),
(84, 'test', 'uploads/rotatorcuffpathology_cLnnxja.csv', '2024-05-22 11:30:20.822723', 4),
(85, 'test', 'uploads/rotatorcuffpathology_47LRqHV.csv', '2024-05-23 03:57:15.277774', 4),
(86, 'test', 'uploads/rotatorcuffpathology_deYhzIS.csv', '2024-05-23 03:58:55.946607', 4),
(87, 'test1', 'uploads/rotatorcuffpathology_LZemBj7.csv', '2024-05-23 04:06:02.362416', 4),
(88, 'test2', 'uploads/rotatorcuffpathology_omRzBvg.csv', '2024-05-23 04:06:53.907763', 4),
(89, 'test2', 'uploads/rotatorcuffpathology_Gz0Kzhc.csv', '2024-05-23 04:09:29.480130', 4),
(90, 'test new', 'uploads/prevalence_of_neer_3.csv', '2024-05-23 15:58:13.875946', 4),
(91, 'test new', 'uploads/prevalence_of_neer_3_i1i4w98.csv', '2024-05-23 16:00:19.423550', 4),
(92, 'test new', 'uploads/prevalence_of_neer_3_G7um4jP.csv', '2024-05-23 16:01:09.088207', 4),
(93, 'test new', 'uploads/prevalence_of_neer_3_ybINw15.csv', '2024-05-23 16:02:40.538689', 4),
(94, 'test new', 'uploads/prevalence_of_neer_3_RHJVHHZ.csv', '2024-05-23 16:29:53.468145', 4),
(95, 'test new', 'uploads/prevalence_of_neer_3_l4mqCFV.csv', '2024-05-23 16:31:54.850423', 4),
(96, 'test new', 'uploads/shoulderarthoplastybyindication.csv', '2024-05-24 04:49:05.817855', 4),
(97, 'test new', 'uploads/shoulderarthoplastybyindication_Spusxu3.csv', '2024-05-24 04:49:14.538254', 4),
(98, 'test new', 'uploads/shoulderarthoplastybycomplication.csv', '2024-05-24 05:02:43.922181', 4),
(99, 'test new', 'uploads/shoulderarthoplastybycomplication_UF7WL09.csv', '2024-05-24 05:05:39.012246', 4),
(100, 'test new', 'uploads/shoulderarthoplastybycomplication_qqvwTnA.csv', '2024-05-24 05:05:44.631609', 4),
(101, 'test new', 'uploads/shoulder_arthoplasty_by_sex.csv', '2024-05-24 05:12:27.138140', 4),
(102, 'test new', 'uploads/shoulder_arthoplasty_by_sex_d22fP9P.csv', '2024-05-24 05:12:32.157197', 4),
(103, 'test new', 'uploads/shoulder_arthoplasty_by_age.csv', '2024-05-24 05:33:41.202678', 4),
(104, 'test new', 'uploads/shoulder_arthoplasty_by_age_cyxGayN.csv', '2024-05-24 05:38:42.524061', 4),
(105, 'test new', 'uploads/shoulder_arthoplasty_by_age_9QOlFDH.csv', '2024-05-24 05:41:40.151339', 4),
(106, 'test new', 'uploads/shoulder_arthoplasty_by_age_zbHA7Vy.csv', '2024-05-24 05:44:30.109904', 4),
(107, 'test new', 'uploads/shoulder_arthoplasty_by_age_FAT9lgd.csv', '2024-05-24 05:46:37.764347', 4),
(108, 'test new', 'uploads/shoulder_arthoplasty_by_age_LYi0Kzo.csv', '2024-05-24 05:49:03.358113', 4),
(109, 'test new', 'uploads/shoulder_arthoplasty_by_age_hzp4hQ2.csv', '2024-05-24 05:53:36.777197', 4),
(110, 'test new', 'uploads/shoulder_arthoplasty_by_age_aMjAkTf.csv', '2024-05-24 06:31:37.524437', 4),
(111, 'test new', 'uploads/shoulder_arthoplasty_by_age_fiL8HNM.csv', '2024-05-24 06:32:36.621380', 4),
(112, 'test new', 'uploads/shoulder_arthoplasty_by_age_v1yaEh3.csv', '2024-05-24 06:34:06.456834', 4),
(113, 'test new', 'uploads/shoulder_arthoplasty_by_age_Mp04OUW.csv', '2024-05-24 06:34:34.965873', 4),
(114, 'test new', 'uploads/shoulder_arthoplasty_by_age_1.csv', '2024-05-24 06:43:33.338897', 4),
(115, 'test new', 'uploads/shoulder_arthoplasty_by_age_1_T1fsVT4.csv', '2024-05-24 06:43:37.630031', 4),
(116, 'test new', 'uploads/shoulder_arthoplasty_by_age_vtq6CCm.csv', '2024-05-24 06:52:41.148829', 4),
(117, 'test new', 'uploads/shoulder_arthoplasty_by_age_59zryVA.csv', '2024-05-24 06:52:45.607135', 4),
(118, 'test new', 'uploads/reverse_shoulderarthoplastybyindication.csv', '2024-05-24 07:03:51.284826', 4),
(119, 'test new', 'uploads/reverse_shoulderarthoplastybyindication_8yARz4H.csv', '2024-05-24 07:07:09.924885', 4),
(120, 'test new', 'uploads/reverse_shoulderarthoplastybyindication_YDFsD9N.csv', '2024-05-24 07:09:15.500983', 4),
(121, 'test new', 'uploads/reverse_shoulderarthoplastybyindication_lExfzvk.csv', '2024-05-24 07:09:19.462675', 4),
(122, 'test new', 'uploads/Hemiarthoplasty_by_sex_YULxQod.csv', '2024-05-28 04:53:18.727543', 4),
(123, 'test new', 'uploads/Hemiarthoplasty_by_sex_XwERAKC.csv', '2024-05-28 04:53:28.785844', 4),
(124, 'test new', 'uploads/anatomiz_shoulder_artho_by_sex.csv', '2024-05-28 05:00:29.775284', 4),
(125, 'test new', 'uploads/anatomiz_shoulder_artho_by_sex_XS4GZ1d.csv', '2024-05-28 05:01:33.847981', 4),
(126, 'test new', 'uploads/anatomiz_shoulder_artho_by_sex_IzLRgaY.csv', '2024-05-28 05:01:38.753773', 4),
(127, 'test new', 'uploads/reverse_shoulder_artho_by_sex.csv', '2024-05-28 05:09:43.617211', 4),
(128, 'test new', 'uploads/reverse_shoulder_artho_by_sex_ekW9syS.csv', '2024-05-28 05:09:51.606223', 4),
(129, 'test new', 'uploads/greater_than_1_comobitiy.csv', '2024-05-28 05:43:17.403817', 4),
(130, 'test new', 'uploads/hemiarthoplasty_by_indication.csv', '2024-05-28 05:55:33.841556', 4),
(131, 'test new', 'uploads/prosthesis_company_by_age.csv', '2024-05-29 07:41:53.260250', 4),
(132, 'test new', 'uploads/prosthesis_company_by_age_cHb6Hsy.csv', '2024-05-29 07:43:13.470488', 4),
(133, 'test new', 'uploads/prosthesis_company_by_age_bCwoDC3.csv', '2024-05-29 07:43:24.902735', 4),
(134, 'test new', 'uploads/prosthesis_company_by_age_hR375Kv.csv', '2024-05-29 07:43:45.013457', 4),
(135, 'test new', 'uploads/prosthesis_company_by_age_ereMQq3.csv', '2024-05-29 07:47:12.268139', 4),
(136, 'test new', 'uploads/prosthesis_company_by_age_Z0t0I3U.csv', '2024-05-29 07:47:54.872933', 4),
(137, 'test new', 'uploads/prosthesis_company_by_age_KvT7v99.csv', '2024-05-29 07:50:28.056791', 4),
(138, 'test new', 'uploads/prosthesis_company_by_age_lZJNwEG.csv', '2024-05-29 07:51:14.135396', 4),
(139, 'test new', 'uploads/prosthesis_company_by_age_8kJkls2.csv', '2024-05-29 08:04:18.524927', 4),
(140, 'test new', 'uploads/prosthesis_company_by_age_Fnx5qky.csv', '2024-05-29 08:06:17.343802', 4),
(141, 'test new', 'uploads/PCF_by_indication.csv', '2024-05-29 08:30:45.017666', 4),
(142, 'test new', 'uploads/revesion_rate_of_prosthesis_by_indication.csv', '2024-05-29 08:37:21.705829', 4);

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_hemiarthroplastybyageandsex`
--

CREATE TABLE `fileupload_hemiarthroplastybyageandsex` (
  `id` bigint(20) NOT NULL,
  `zero_19` int(11) NOT NULL,
  `twenty_39` int(11) NOT NULL,
  `forty_59` int(11) NOT NULL,
  `sixty_79` int(11) NOT NULL,
  `greaterThan_80` int(11) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `sex_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_hemiarthroplastybyageandsex`
--

INSERT INTO `fileupload_hemiarthroplastybyageandsex` (`id`, `zero_19`, `twenty_39`, `forty_59`, `sixty_79`, `greaterThan_80`, `uploaded_at`, `sex_id`) VALUES
(1, 50, 75, 125, 250, 500, '2024-05-28 04:53:18.743543', 1),
(2, 125, 250, 500, 1000, 2000, '2024-05-28 04:53:18.776753', 2),
(3, 50, 75, 125, 250, 500, '2024-05-28 04:53:28.802573', 1),
(4, 125, 250, 500, 1000, 2000, '2024-05-28 04:53:28.812726', 2);

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_hemiarthroplastybyindication`
--

CREATE TABLE `fileupload_hemiarthroplastybyindication` (
  `id` bigint(20) NOT NULL,
  `number` int(11) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `indication_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_hemiarthroplastybyindication`
--

INSERT INTO `fileupload_hemiarthroplastybyindication` (`id`, `number`, `uploaded_at`, `indication_id`) VALUES
(1, 1000, '2024-05-28 05:55:33.966290', 7),
(2, 500, '2024-05-28 05:55:34.233595', 10),
(3, 250, '2024-05-28 05:55:34.330500', 11),
(4, 125, '2024-05-28 05:55:34.354639', 12),
(5, 64, '2024-05-28 05:55:34.354639', 13),
(6, 32, '2024-05-28 05:55:34.402384', 14),
(7, 16, '2024-05-28 05:55:34.404392', 15);

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_indication`
--

CREATE TABLE `fileupload_indication` (
  `id` bigint(20) NOT NULL,
  `indication` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_indication`
--

INSERT INTO `fileupload_indication` (`id`, `indication`) VALUES
(1, 'Osteoarthritis'),
(2, 'Inflammatory arthritis'),
(3, 'Revision of failed partial replacement'),
(4, 'Advanced avascular necrosis with secondary osteoarthritis'),
(5, 'Pseudoparalysis'),
(6, 'Rotator Cuff Arthropathy'),
(7, 'Three- or Four-part PHF'),
(8, 'Failed aTSA caused by irreperable rotator cuff tear'),
(9, 'Reconstruction after tumor resection'),
(10, 'Avascular Necrosis without glenoid involvement'),
(11, 'Osteoarthritis of Humeral Head with preserved glenoid surface'),
(12, 'Osteoarthritis with poor glenoid bone stock'),
(13, 'Hill-Sachs fracture'),
(14, 'Malunion of PHF'),
(15, 'Osteochondral injuries'),
(16, 'Osteoarthritis or glenoid arthrosis'),
(17, 'Fracture or malnunion'),
(18, 'Traumatic or Post-Traumatic Arthritis'),
(19, 'Roator cuff tear, arthropathy, deficiency'),
(20, 'Instability'),
(21, 'Avascular osteonecrosis'),
(22, 'Other'),
(23, 'Glenoid loosening'),
(24, 'Humeral loosening'),
(25, 'Infection'),
(26, 'Material or mechanical failure'),
(27, 'Glenoid bone loss or erosion'),
(28, 'Subscapularis insuficiency'),
(29, 'Scapular notching');

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_prevalenceofneerthreeorfour_partproximalhumeralfr9336`
--

CREATE TABLE `fileupload_prevalenceofneerthreeorfour_partproximalhumeralfr9336` (
  `id` bigint(20) NOT NULL,
  `zero_19` int(11) NOT NULL,
  `twenty_39` int(11) NOT NULL,
  `forty_59` int(11) NOT NULL,
  `sixty_79` int(11) NOT NULL,
  `greaterThan_80` int(11) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `sex_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_prevalenceofneerthreeorfour_partproximalhumeralfr9336`
--

INSERT INTO `fileupload_prevalenceofneerthreeorfour_partproximalhumeralfr9336` (`id`, `zero_19`, `twenty_39`, `forty_59`, `sixty_79`, `greaterThan_80`, `uploaded_at`, `sex_id`) VALUES
(1, 30, 200, 700, 2000, 3500, '2024-05-23 16:31:54.966137', 1),
(2, 50, 300, 800, 2000, 5000, '2024-05-23 16:31:55.082218', 2);

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_prevalenceofpatientswithrotatorcuffpathologywith_f3bc`
--

CREATE TABLE `fileupload_prevalenceofpatientswithrotatorcuffpathologywith_f3bc` (
  `id` bigint(20) NOT NULL,
  `zero_19` int(11) NOT NULL,
  `twenty_39` int(11) NOT NULL,
  `forty_59` int(11) NOT NULL,
  `sixty_79` int(11) NOT NULL,
  `greaterThan_80` int(11) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `sex_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_prevalenceofpatientswithrotatorcuffpathologywith_f3bc`
--

INSERT INTO `fileupload_prevalenceofpatientswithrotatorcuffpathologywith_f3bc` (`id`, `zero_19`, `twenty_39`, `forty_59`, `sixty_79`, `greaterThan_80`, `uploaded_at`, `sex_id`) VALUES
(1, 30, 200, 700, 2000, 3500, '2024-05-28 05:43:17.476987', 1),
(2, 50, 300, 800, 2000, 5000, '2024-05-28 05:43:17.770466', 2),
(3, 80, 500, 1500, 4000, 8500, '2024-05-28 05:43:17.811184', 3);

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_prosthesiscompanyfrequency`
--

CREATE TABLE `fileupload_prosthesiscompanyfrequency` (
  `id` bigint(20) NOT NULL,
  `arthrex` int(11) NOT NULL,
  `depuy_synthes` int(11) NOT NULL,
  `smith_nephew` int(11) NOT NULL,
  `stryker` int(11) NOT NULL,
  `zimmer_biomet` int(11) NOT NULL,
  `exacthech` int(11) NOT NULL,
  `lima` int(11) NOT NULL,
  `age_group_id` bigint(20) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_prosthesiscompanyfrequency`
--

INSERT INTO `fileupload_prosthesiscompanyfrequency` (`id`, `arthrex`, `depuy_synthes`, `smith_nephew`, `stryker`, `zimmer_biomet`, `exacthech`, `lima`, `age_group_id`, `uploaded_at`) VALUES
(1, 4, 8, 10, 20, 36, 30, 25, 1, '2024-05-29 08:06:17.354609'),
(2, 8, 16, 20, 40, 72, 60, 50, 2, '2024-05-29 08:06:17.425965'),
(3, 16, 32, 40, 80, 144, 120, 100, 3, '2024-05-29 08:06:17.440546'),
(4, 90, 80, 69, 120, 250, 240, 200, 4, '2024-05-29 08:06:17.447527'),
(5, 250, 1000, 800, 700, 1200, 600, 200, 5, '2024-05-29 08:06:17.457732');

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_prosthesiscompanyfrequencybyindication`
--

CREATE TABLE `fileupload_prosthesiscompanyfrequencybyindication` (
  `id` bigint(20) NOT NULL,
  `arthrex` int(11) NOT NULL,
  `depuy_synthes` int(11) NOT NULL,
  `smith_nephew` int(11) NOT NULL,
  `stryker` int(11) NOT NULL,
  `zimmer_biomet` int(11) NOT NULL,
  `exacthech` int(11) NOT NULL,
  `lima` int(11) NOT NULL,
  `indication_id` bigint(20) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_prosthesiscompanyfrequencybyindication`
--

INSERT INTO `fileupload_prosthesiscompanyfrequencybyindication` (`id`, `arthrex`, `depuy_synthes`, `smith_nephew`, `stryker`, `zimmer_biomet`, `exacthech`, `lima`, `indication_id`, `uploaded_at`) VALUES
(1, 1000, 2000, 3000, 4000, 3000, 2000, 1000, 16, '2024-05-29 08:30:45.036097'),
(2, 500, 1000, 1500, 2000, 1500, 1000, 500, 17, '2024-05-29 08:30:45.122515'),
(3, 250, 500, 750, 1000, 750, 500, 250, 18, '2024-05-29 08:30:45.122515'),
(4, 125, 250, 375, 500, 375, 250, 125, 19, '2024-05-29 08:30:45.138141'),
(5, 75, 125, 188, 250, 188, 125, 75, 20, '2024-05-29 08:30:45.138141'),
(6, 32, 75, 100, 175, 100, 75, 32, 2, '2024-05-29 08:30:45.138141'),
(7, 16, 32, 50, 100, 50, 32, 16, 21, '2024-05-29 08:30:45.138141'),
(8, 8, 16, 25, 50, 25, 16, 8, 22, '2024-05-29 08:30:45.153758');

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_reversetotalshoulderarthroplastybyageandsex`
--

CREATE TABLE `fileupload_reversetotalshoulderarthroplastybyageandsex` (
  `id` bigint(20) NOT NULL,
  `zero_19` int(11) NOT NULL,
  `twenty_39` int(11) NOT NULL,
  `forty_59` int(11) NOT NULL,
  `sixty_79` int(11) NOT NULL,
  `greaterThan_80` int(11) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `sex_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_reversetotalshoulderarthroplastybyageandsex`
--

INSERT INTO `fileupload_reversetotalshoulderarthroplastybyageandsex` (`id`, `zero_19`, `twenty_39`, `forty_59`, `sixty_79`, `greaterThan_80`, `uploaded_at`, `sex_id`) VALUES
(1, 50, 75, 125, 250, 500, '2024-05-28 05:09:43.641655', 1),
(2, 125, 250, 500, 1000, 2000, '2024-05-28 05:09:43.751005', 2),
(3, 50, 75, 125, 250, 500, '2024-05-28 05:09:51.614724', 1),
(4, 125, 250, 500, 1000, 2000, '2024-05-28 05:09:51.622733', 2);

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_reversetotalshoulderarthroplastybyindication`
--

CREATE TABLE `fileupload_reversetotalshoulderarthroplastybyindication` (
  `id` bigint(20) NOT NULL,
  `number` int(11) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `indication_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_reversetotalshoulderarthroplastybyindication`
--

INSERT INTO `fileupload_reversetotalshoulderarthroplastybyindication` (`id`, `number`, `uploaded_at`, `indication_id`) VALUES
(1, 2000, '2024-05-24 07:09:15.816025', 5),
(2, 1000, '2024-05-24 07:09:16.031305', 6),
(3, 500, '2024-05-24 07:09:16.101047', 7),
(4, 250, '2024-05-24 07:09:16.138709', 8),
(5, 125, '2024-05-24 07:09:16.206891', 9),
(6, 2000, '2024-05-24 07:09:19.468658', 5),
(7, 1000, '2024-05-24 07:09:19.472647', 6),
(8, 500, '2024-05-24 07:09:19.476155', 7),
(9, 250, '2024-05-24 07:09:19.480144', 8),
(10, 125, '2024-05-24 07:09:19.483136', 9);

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_revisionratesofprosthesiscompany`
--

CREATE TABLE `fileupload_revisionratesofprosthesiscompany` (
  `id` bigint(20) NOT NULL,
  `arthrex` int(11) NOT NULL,
  `depuy_synthes` int(11) NOT NULL,
  `smith_nephew` int(11) NOT NULL,
  `stryker` int(11) NOT NULL,
  `zimmer_biomet` int(11) NOT NULL,
  `exacthech` int(11) NOT NULL,
  `lima` int(11) NOT NULL,
  `indication_id` bigint(20) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_revisionratesofprosthesiscompany`
--

INSERT INTO `fileupload_revisionratesofprosthesiscompany` (`id`, `arthrex`, `depuy_synthes`, `smith_nephew`, `stryker`, `zimmer_biomet`, `exacthech`, `lima`, `indication_id`, `uploaded_at`) VALUES
(1, 1000, 2000, 3000, 4000, 3000, 2000, 1000, 16, '2024-05-29 08:37:21.714443'),
(2, 500, 1000, 1500, 2000, 1500, 1000, 500, 23, '2024-05-29 08:37:21.737500'),
(3, 250, 500, 750, 1000, 750, 500, 250, 19, '2024-05-29 08:37:21.745655'),
(4, 125, 250, 375, 500, 375, 250, 125, 24, '2024-05-29 08:37:21.751816'),
(5, 75, 125, 188, 250, 188, 125, 75, 25, '2024-05-29 08:37:21.758386'),
(6, 32, 75, 100, 188, 100, 75, 32, 20, '2024-05-29 08:37:21.760350'),
(7, 16, 32, 50, 100, 50, 32, 16, 17, '2024-05-29 08:37:21.763980'),
(8, 8, 16, 25, 50, 25, 16, 8, 26, '2024-05-29 08:37:21.769810'),
(9, 4, 8, 12, 25, 12, 8, 4, 27, '2024-05-29 08:37:21.777825'),
(10, 2, 4, 6, 12, 6, 4, 2, 22, '2024-05-29 08:37:21.780782'),
(11, 1, 2, 3, 6, 3, 2, 1, 28, '2024-05-29 08:37:21.785771'),
(12, 1, 1, 2, 3, 2, 1, 1, 29, '2024-05-29 08:37:21.792750');

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_rotatorcuffpathology`
--

CREATE TABLE `fileupload_rotatorcuffpathology` (
  `id` bigint(20) NOT NULL,
  `pathologies` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_rotatorcuffpathology`
--

INSERT INTO `fileupload_rotatorcuffpathology` (`id`, `pathologies`, `count`, `uploaded_at`) VALUES
(1, 'Supraspinatus pathology', 300, '2024-05-22 11:29:34.330740'),
(2, 'Infraspinatus pathology', 200, '2024-05-22 11:29:35.116021'),
(3, 'Subscapularis pathology', 100, '2024-05-22 11:29:35.124007'),
(4, 'Teres minor', 50, '2024-05-22 11:29:35.252595'),
(5, 'Supraspinatus pathology', 300, '2024-05-22 11:30:20.822723'),
(6, 'Infraspinatus pathology', 200, '2024-05-22 11:30:20.872670'),
(7, 'Subscapularis pathology', 100, '2024-05-22 11:30:20.875322'),
(8, 'Teres minor', 50, '2024-05-22 11:30:20.880990'),
(9, 'Supraspinatus pathology', 300, '2024-05-23 03:57:15.277774'),
(10, 'Infraspinatus pathology', 200, '2024-05-23 03:57:15.446957'),
(11, 'Subscapularis pathology', 100, '2024-05-23 03:57:15.446957'),
(12, 'Teres minor', 50, '2024-05-23 03:57:15.462574'),
(13, 'Supraspinatus pathology', 300, '2024-05-23 03:58:55.955926'),
(14, 'Infraspinatus pathology', 200, '2024-05-23 03:58:56.010291'),
(15, 'Subscapularis pathology', 100, '2024-05-23 03:58:56.013632'),
(16, 'Teres minor', 50, '2024-05-23 03:58:56.015862'),
(17, 'Supraspinatus pathology', 300, '2024-05-23 04:06:53.916740'),
(18, 'Infraspinatus pathology', 200, '2024-05-23 04:06:53.940676'),
(19, 'Subscapularis pathology', 100, '2024-05-23 04:06:53.943668'),
(20, 'Teres minor', 50, '2024-05-23 04:06:53.945664'),
(21, 'Supraspinatus pathology', 300, '2024-05-23 04:09:29.480130'),
(22, 'Infraspinatus pathology', 200, '2024-05-23 04:09:29.516150'),
(23, 'Subscapularis pathology', 100, '2024-05-23 04:09:29.519141'),
(24, 'Teres minor', 50, '2024-05-23 04:09:29.522134');

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_sex`
--

CREATE TABLE `fileupload_sex` (
  `id` bigint(20) NOT NULL,
  `sex` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_sex`
--

INSERT INTO `fileupload_sex` (`id`, `sex`) VALUES
(1, 'Male'),
(2, 'Female'),
(3, 'Male+Femal');

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_shoulderarthroplastybyage`
--

CREATE TABLE `fileupload_shoulderarthroplastybyage` (
  `id` bigint(20) NOT NULL,
  `Hemiarthroplasty` int(11) NOT NULL,
  `AnatomicTotalShoulderArthroplasty` int(11) NOT NULL,
  `ReverseTotalShoulderArthroplasty` int(11) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `age_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_shoulderarthroplastybyage`
--

INSERT INTO `fileupload_shoulderarthroplastybyage` (`id`, `Hemiarthroplasty`, `AnatomicTotalShoulderArthroplasty`, `ReverseTotalShoulderArthroplasty`, `uploaded_at`, `age_id`) VALUES
(1, 50, 75, 125, '2024-05-24 06:52:41.174783', 1),
(2, 75, 125, 250, '2024-05-24 06:52:41.201775', 2),
(3, 125, 250, 500, '2024-05-24 06:52:41.259285', 3),
(4, 250, 500, 1000, '2024-05-24 06:52:41.345049', 4),
(5, 500, 1000, 2000, '2024-05-24 06:52:41.348080', 5),
(6, 50, 75, 125, '2024-05-24 06:52:45.660615', 1),
(7, 75, 125, 250, '2024-05-24 06:52:45.662777', 2),
(8, 125, 250, 500, '2024-05-24 06:52:45.758959', 3),
(9, 250, 500, 1000, '2024-05-24 06:52:45.760914', 4),
(10, 500, 1000, 2000, '2024-05-24 06:52:45.763315', 5);

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_shoulderarthroplastybycomplication`
--

CREATE TABLE `fileupload_shoulderarthroplastybycomplication` (
  `id` bigint(20) NOT NULL,
  `Hemiarthroplasty` int(11) NOT NULL,
  `AnatomicTotalShoulderArthroplasty` int(11) NOT NULL,
  `ReverseTotalShoulderArthroplasty` int(11) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `complication_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_shoulderarthroplastybycomplication`
--

INSERT INTO `fileupload_shoulderarthroplastybycomplication` (`id`, `Hemiarthroplasty`, `AnatomicTotalShoulderArthroplasty`, `ReverseTotalShoulderArthroplasty`, `uploaded_at`, `complication_id`) VALUES
(1, 4000, 3000, 2000, '2024-05-24 05:05:39.173256', 1),
(2, 2000, 1500, 1000, '2024-05-24 05:05:39.418201', 2),
(3, 1000, 750, 500, '2024-05-24 05:05:39.428131', 3),
(4, 500, 375, 250, '2024-05-24 05:05:39.428131', 4),
(5, 250, 188, 125, '2024-05-24 05:05:39.443767', 5),
(6, 188, 100, 75, '2024-05-24 05:05:39.453748', 6),
(7, 100, 50, 32, '2024-05-24 05:05:39.460409', 7),
(8, 50, 25, 16, '2024-05-24 05:05:39.476489', 8),
(9, 25, 12, 8, '2024-05-24 05:05:39.492108', 9),
(10, 6, 3, 2, '2024-05-24 05:05:39.512394', 10),
(11, 3, 2, 1, '2024-05-24 05:05:39.528370', 11),
(12, 12, 6, 4, '2024-05-24 05:05:39.576413', 12),
(13, 4000, 3000, 2000, '2024-05-24 05:05:44.637593', 1),
(14, 2000, 1500, 1000, '2024-05-24 05:05:44.640585', 2),
(15, 1000, 750, 500, '2024-05-24 05:05:44.645619', 3),
(16, 500, 375, 250, '2024-05-24 05:05:44.650602', 4),
(17, 250, 188, 125, '2024-05-24 05:05:44.653594', 5),
(18, 188, 100, 75, '2024-05-24 05:05:44.656586', 6),
(19, 100, 50, 32, '2024-05-24 05:05:44.690011', 7),
(20, 50, 25, 16, '2024-05-24 05:05:44.693187', 8),
(21, 25, 12, 8, '2024-05-24 05:05:44.696927', 9),
(22, 6, 3, 2, '2024-05-24 05:05:44.700915', 10),
(23, 3, 2, 1, '2024-05-24 05:05:44.702910', 11),
(24, 12, 6, 4, '2024-05-24 05:05:44.705902', 12);

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_shoulderarthroplastybysex`
--

CREATE TABLE `fileupload_shoulderarthroplastybysex` (
  `id` bigint(20) NOT NULL,
  `Hemiarthroplasty` int(11) NOT NULL,
  `AnatomicTotalShoulderArthroplasty` int(11) NOT NULL,
  `ReverseTotalShoulderArthroplasty` int(11) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `sex_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_shoulderarthroplastybysex`
--

INSERT INTO `fileupload_shoulderarthroplastybysex` (`id`, `Hemiarthroplasty`, `AnatomicTotalShoulderArthroplasty`, `ReverseTotalShoulderArthroplasty`, `uploaded_at`, `sex_id`) VALUES
(1, 1000, 2000, 2500, '2024-05-24 06:43:33.412817', 1),
(2, 2000, 4000, 5000, '2024-05-24 06:43:33.474263', 2),
(3, 1000, 2000, 2500, '2024-05-24 06:43:37.634136', 1),
(4, 2000, 4000, 5000, '2024-05-24 06:43:37.638365', 2);

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_shoulderarthroplastyrevisionratebyage`
--

CREATE TABLE `fileupload_shoulderarthroplastyrevisionratebyage` (
  `id` bigint(20) NOT NULL,
  `Hemiarthroplasty` int(11) NOT NULL,
  `AnatomicTotalShoulderArthroplasty` int(11) NOT NULL,
  `ReverseTotalShoulderArthroplasty` int(11) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `age_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_shoulderarthroplastyrevisionratebyage`
--

INSERT INTO `fileupload_shoulderarthroplastyrevisionratebyage` (`id`, `Hemiarthroplasty`, `AnatomicTotalShoulderArthroplasty`, `ReverseTotalShoulderArthroplasty`, `uploaded_at`, `age_id`) VALUES
(1, 50, 75, 125, '2024-05-24 06:34:34.975614', 1),
(2, 75, 125, 250, '2024-05-24 06:34:35.219132', 2),
(3, 125, 250, 500, '2024-05-24 06:34:35.225230', 3),
(4, 250, 500, 1000, '2024-05-24 06:34:35.392217', 4),
(5, 500, 1000, 2000, '2024-05-24 06:34:35.396206', 5);

-- --------------------------------------------------------

--
-- Table structure for table `fileupload_shoulderarthroplastyrevisionratebysex`
--

CREATE TABLE `fileupload_shoulderarthroplastyrevisionratebysex` (
  `id` bigint(20) NOT NULL,
  `Hemiarthroplasty` int(11) NOT NULL,
  `AnatomicTotalShoulderArthroplasty` int(11) NOT NULL,
  `ReverseTotalShoulderArthroplasty` int(11) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `sex_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload_shoulderarthroplastyrevisionratebysex`
--

INSERT INTO `fileupload_shoulderarthroplastyrevisionratebysex` (`id`, `Hemiarthroplasty`, `AnatomicTotalShoulderArthroplasty`, `ReverseTotalShoulderArthroplasty`, `uploaded_at`, `sex_id`) VALUES
(1, 1000, 2000, 2500, '2024-05-24 05:12:27.194988', 1),
(2, 2000, 4000, 5000, '2024-05-24 05:12:27.264330', 2),
(3, 1000, 2000, 2500, '2024-05-24 05:12:32.165177', 1),
(4, 2000, 4000, 5000, '2024-05-24 05:12:32.381800', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `fileupload_agegroup`
--
ALTER TABLE `fileupload_agegroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fileupload_anatomictotalshoulderarthroplastybyageandsex`
--
ALTER TABLE `fileupload_anatomictotalshoulderarthroplastybyageandsex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_anatomict_sex_id_8075b265_fk_fileuploa` (`sex_id`);

--
-- Indexes for table `fileupload_anatomictotalshoulderarthroplastybyindication`
--
ALTER TABLE `fileupload_anatomictotalshoulderarthroplastybyindication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_anatomict_indication_id_cec02189_fk_fileuploa` (`indication_id`);

--
-- Indexes for table `fileupload_complication`
--
ALTER TABLE `fileupload_complication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fileupload_dataupload`
--
ALTER TABLE `fileupload_dataupload`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_datauploa_file_id_b93bdd39_fk_fileuploa` (`file_id`);

--
-- Indexes for table `fileupload_fileupload`
--
ALTER TABLE `fileupload_fileupload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fileupload_hemiarthroplastybyageandsex`
--
ALTER TABLE `fileupload_hemiarthroplastybyageandsex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_hemiarthr_sex_id_b1c0b48b_fk_fileuploa` (`sex_id`);

--
-- Indexes for table `fileupload_hemiarthroplastybyindication`
--
ALTER TABLE `fileupload_hemiarthroplastybyindication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_hemiarthr_indication_id_abcbf408_fk_fileuploa` (`indication_id`);

--
-- Indexes for table `fileupload_indication`
--
ALTER TABLE `fileupload_indication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fileupload_prevalenceofneerthreeorfour_partproximalhumeralfr9336`
--
ALTER TABLE `fileupload_prevalenceofneerthreeorfour_partproximalhumeralfr9336`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_prevalenc_sex_id_0cca1d1e_fk_fileuploa` (`sex_id`);

--
-- Indexes for table `fileupload_prevalenceofpatientswithrotatorcuffpathologywith_f3bc`
--
ALTER TABLE `fileupload_prevalenceofpatientswithrotatorcuffpathologywith_f3bc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_prevalenc_sex_id_af38c528_fk_fileuploa` (`sex_id`);

--
-- Indexes for table `fileupload_prosthesiscompanyfrequency`
--
ALTER TABLE `fileupload_prosthesiscompanyfrequency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_prosthesi_age_group_id_8e87bb80_fk_fileuploa` (`age_group_id`);

--
-- Indexes for table `fileupload_prosthesiscompanyfrequencybyindication`
--
ALTER TABLE `fileupload_prosthesiscompanyfrequencybyindication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_prosthesi_indication_id_5322babc_fk_fileuploa` (`indication_id`);

--
-- Indexes for table `fileupload_reversetotalshoulderarthroplastybyageandsex`
--
ALTER TABLE `fileupload_reversetotalshoulderarthroplastybyageandsex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_reverseto_sex_id_6c464c72_fk_fileuploa` (`sex_id`);

--
-- Indexes for table `fileupload_reversetotalshoulderarthroplastybyindication`
--
ALTER TABLE `fileupload_reversetotalshoulderarthroplastybyindication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_reverseto_indication_id_1c7636c2_fk_fileuploa` (`indication_id`);

--
-- Indexes for table `fileupload_revisionratesofprosthesiscompany`
--
ALTER TABLE `fileupload_revisionratesofprosthesiscompany`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_revisionr_indication_id_fac31244_fk_fileuploa` (`indication_id`);

--
-- Indexes for table `fileupload_rotatorcuffpathology`
--
ALTER TABLE `fileupload_rotatorcuffpathology`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fileupload_sex`
--
ALTER TABLE `fileupload_sex`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fileupload_shoulderarthroplastybyage`
--
ALTER TABLE `fileupload_shoulderarthroplastybyage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_shouldera_age_id_7aab7d76_fk_fileuploa` (`age_id`);

--
-- Indexes for table `fileupload_shoulderarthroplastybycomplication`
--
ALTER TABLE `fileupload_shoulderarthroplastybycomplication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_shouldera_complication_id_6d44ba77_fk_fileuploa` (`complication_id`);

--
-- Indexes for table `fileupload_shoulderarthroplastybysex`
--
ALTER TABLE `fileupload_shoulderarthroplastybysex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_shouldera_sex_id_8eea5c02_fk_fileuploa` (`sex_id`);

--
-- Indexes for table `fileupload_shoulderarthroplastyrevisionratebyage`
--
ALTER TABLE `fileupload_shoulderarthroplastyrevisionratebyage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_shouldera_age_id_8b4b251b_fk_fileuploa` (`age_id`);

--
-- Indexes for table `fileupload_shoulderarthroplastyrevisionratebysex`
--
ALTER TABLE `fileupload_shoulderarthroplastyrevisionratebysex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fileupload_shouldera_sex_id_839e2cd4_fk_fileuploa` (`sex_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `fileupload_agegroup`
--
ALTER TABLE `fileupload_agegroup`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fileupload_anatomictotalshoulderarthroplastybyageandsex`
--
ALTER TABLE `fileupload_anatomictotalshoulderarthroplastybyageandsex`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fileupload_anatomictotalshoulderarthroplastybyindication`
--
ALTER TABLE `fileupload_anatomictotalshoulderarthroplastybyindication`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fileupload_complication`
--
ALTER TABLE `fileupload_complication`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fileupload_dataupload`
--
ALTER TABLE `fileupload_dataupload`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=369;

--
-- AUTO_INCREMENT for table `fileupload_fileupload`
--
ALTER TABLE `fileupload_fileupload`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `fileupload_hemiarthroplastybyageandsex`
--
ALTER TABLE `fileupload_hemiarthroplastybyageandsex`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fileupload_hemiarthroplastybyindication`
--
ALTER TABLE `fileupload_hemiarthroplastybyindication`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fileupload_indication`
--
ALTER TABLE `fileupload_indication`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `fileupload_prevalenceofneerthreeorfour_partproximalhumeralfr9336`
--
ALTER TABLE `fileupload_prevalenceofneerthreeorfour_partproximalhumeralfr9336`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fileupload_prevalenceofpatientswithrotatorcuffpathologywith_f3bc`
--
ALTER TABLE `fileupload_prevalenceofpatientswithrotatorcuffpathologywith_f3bc`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fileupload_prosthesiscompanyfrequency`
--
ALTER TABLE `fileupload_prosthesiscompanyfrequency`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fileupload_prosthesiscompanyfrequencybyindication`
--
ALTER TABLE `fileupload_prosthesiscompanyfrequencybyindication`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fileupload_reversetotalshoulderarthroplastybyageandsex`
--
ALTER TABLE `fileupload_reversetotalshoulderarthroplastybyageandsex`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fileupload_reversetotalshoulderarthroplastybyindication`
--
ALTER TABLE `fileupload_reversetotalshoulderarthroplastybyindication`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fileupload_revisionratesofprosthesiscompany`
--
ALTER TABLE `fileupload_revisionratesofprosthesiscompany`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fileupload_rotatorcuffpathology`
--
ALTER TABLE `fileupload_rotatorcuffpathology`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `fileupload_sex`
--
ALTER TABLE `fileupload_sex`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fileupload_shoulderarthroplastybyage`
--
ALTER TABLE `fileupload_shoulderarthroplastybyage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fileupload_shoulderarthroplastybycomplication`
--
ALTER TABLE `fileupload_shoulderarthroplastybycomplication`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `fileupload_shoulderarthroplastybysex`
--
ALTER TABLE `fileupload_shoulderarthroplastybysex`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fileupload_shoulderarthroplastyrevisionratebyage`
--
ALTER TABLE `fileupload_shoulderarthroplastyrevisionratebyage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fileupload_shoulderarthroplastyrevisionratebysex`
--
ALTER TABLE `fileupload_shoulderarthroplastyrevisionratebysex`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `fileupload_anatomictotalshoulderarthroplastybyageandsex`
--
ALTER TABLE `fileupload_anatomictotalshoulderarthroplastybyageandsex`
  ADD CONSTRAINT `fileupload_anatomict_sex_id_8075b265_fk_fileuploa` FOREIGN KEY (`sex_id`) REFERENCES `fileupload_sex` (`id`);

--
-- Constraints for table `fileupload_anatomictotalshoulderarthroplastybyindication`
--
ALTER TABLE `fileupload_anatomictotalshoulderarthroplastybyindication`
  ADD CONSTRAINT `fileupload_anatomict_indication_id_cec02189_fk_fileuploa` FOREIGN KEY (`indication_id`) REFERENCES `fileupload_indication` (`id`);

--
-- Constraints for table `fileupload_dataupload`
--
ALTER TABLE `fileupload_dataupload`
  ADD CONSTRAINT `fileupload_datauploa_file_id_b93bdd39_fk_fileuploa` FOREIGN KEY (`file_id`) REFERENCES `fileupload_fileupload` (`id`);

--
-- Constraints for table `fileupload_hemiarthroplastybyageandsex`
--
ALTER TABLE `fileupload_hemiarthroplastybyageandsex`
  ADD CONSTRAINT `fileupload_hemiarthr_sex_id_b1c0b48b_fk_fileuploa` FOREIGN KEY (`sex_id`) REFERENCES `fileupload_sex` (`id`);

--
-- Constraints for table `fileupload_hemiarthroplastybyindication`
--
ALTER TABLE `fileupload_hemiarthroplastybyindication`
  ADD CONSTRAINT `fileupload_hemiarthr_indication_id_abcbf408_fk_fileuploa` FOREIGN KEY (`indication_id`) REFERENCES `fileupload_indication` (`id`);

--
-- Constraints for table `fileupload_prevalenceofneerthreeorfour_partproximalhumeralfr9336`
--
ALTER TABLE `fileupload_prevalenceofneerthreeorfour_partproximalhumeralfr9336`
  ADD CONSTRAINT `fileupload_prevalenc_sex_id_0cca1d1e_fk_fileuploa` FOREIGN KEY (`sex_id`) REFERENCES `fileupload_sex` (`id`);

--
-- Constraints for table `fileupload_prevalenceofpatientswithrotatorcuffpathologywith_f3bc`
--
ALTER TABLE `fileupload_prevalenceofpatientswithrotatorcuffpathologywith_f3bc`
  ADD CONSTRAINT `fileupload_prevalenc_sex_id_af38c528_fk_fileuploa` FOREIGN KEY (`sex_id`) REFERENCES `fileupload_sex` (`id`);

--
-- Constraints for table `fileupload_prosthesiscompanyfrequency`
--
ALTER TABLE `fileupload_prosthesiscompanyfrequency`
  ADD CONSTRAINT `fileupload_prosthesi_age_group_id_8e87bb80_fk_fileuploa` FOREIGN KEY (`age_group_id`) REFERENCES `fileupload_agegroup` (`id`);

--
-- Constraints for table `fileupload_prosthesiscompanyfrequencybyindication`
--
ALTER TABLE `fileupload_prosthesiscompanyfrequencybyindication`
  ADD CONSTRAINT `fileupload_prosthesi_indication_id_5322babc_fk_fileuploa` FOREIGN KEY (`indication_id`) REFERENCES `fileupload_indication` (`id`);

--
-- Constraints for table `fileupload_reversetotalshoulderarthroplastybyageandsex`
--
ALTER TABLE `fileupload_reversetotalshoulderarthroplastybyageandsex`
  ADD CONSTRAINT `fileupload_reverseto_sex_id_6c464c72_fk_fileuploa` FOREIGN KEY (`sex_id`) REFERENCES `fileupload_sex` (`id`);

--
-- Constraints for table `fileupload_reversetotalshoulderarthroplastybyindication`
--
ALTER TABLE `fileupload_reversetotalshoulderarthroplastybyindication`
  ADD CONSTRAINT `fileupload_reverseto_indication_id_1c7636c2_fk_fileuploa` FOREIGN KEY (`indication_id`) REFERENCES `fileupload_indication` (`id`);

--
-- Constraints for table `fileupload_revisionratesofprosthesiscompany`
--
ALTER TABLE `fileupload_revisionratesofprosthesiscompany`
  ADD CONSTRAINT `fileupload_revisionr_indication_id_fac31244_fk_fileuploa` FOREIGN KEY (`indication_id`) REFERENCES `fileupload_indication` (`id`);

--
-- Constraints for table `fileupload_shoulderarthroplastybyage`
--
ALTER TABLE `fileupload_shoulderarthroplastybyage`
  ADD CONSTRAINT `fileupload_shouldera_age_id_7aab7d76_fk_fileuploa` FOREIGN KEY (`age_id`) REFERENCES `fileupload_agegroup` (`id`);

--
-- Constraints for table `fileupload_shoulderarthroplastybycomplication`
--
ALTER TABLE `fileupload_shoulderarthroplastybycomplication`
  ADD CONSTRAINT `fileupload_shouldera_complication_id_6d44ba77_fk_fileuploa` FOREIGN KEY (`complication_id`) REFERENCES `fileupload_complication` (`id`);

--
-- Constraints for table `fileupload_shoulderarthroplastybysex`
--
ALTER TABLE `fileupload_shoulderarthroplastybysex`
  ADD CONSTRAINT `fileupload_shouldera_sex_id_8eea5c02_fk_fileuploa` FOREIGN KEY (`sex_id`) REFERENCES `fileupload_sex` (`id`);

--
-- Constraints for table `fileupload_shoulderarthroplastyrevisionratebyage`
--
ALTER TABLE `fileupload_shoulderarthroplastyrevisionratebyage`
  ADD CONSTRAINT `fileupload_shouldera_age_id_8b4b251b_fk_fileuploa` FOREIGN KEY (`age_id`) REFERENCES `fileupload_agegroup` (`id`);

--
-- Constraints for table `fileupload_shoulderarthroplastyrevisionratebysex`
--
ALTER TABLE `fileupload_shoulderarthroplastyrevisionratebysex`
  ADD CONSTRAINT `fileupload_shouldera_sex_id_839e2cd4_fk_fileuploa` FOREIGN KEY (`sex_id`) REFERENCES `fileupload_sex` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
