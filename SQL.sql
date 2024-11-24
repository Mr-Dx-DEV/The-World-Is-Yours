-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for worldisyours
CREATE DATABASE IF NOT EXISTS `worldisyours` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `worldisyours`;

-- Dumping structure for table worldisyours.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.apartments: ~0 rows (approximately)

-- Dumping structure for table worldisyours.ap_addonapplications
CREATE TABLE IF NOT EXISTS `ap_addonapplications` (
  `applicationID` varchar(50) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.ap_addonapplications: ~0 rows (approximately)

-- Dumping structure for table worldisyours.ap_addonjob
CREATE TABLE IF NOT EXISTS `ap_addonjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enable` varchar(50) DEFAULT NULL,
  `job` varchar(100) DEFAULT NULL,
  `boss_rank` varchar(50) DEFAULT NULL,
  `coords` longtext DEFAULT '[]',
  `ped` varchar(50) DEFAULT NULL,
  `webhook` varchar(200) DEFAULT NULL,
  `management` longtext DEFAULT '[]',
  `appointments` longtext DEFAULT '[]',
  `applications` longtext DEFAULT '[]',
  `template` longtext DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.ap_addonjob: ~0 rows (approximately)

-- Dumping structure for table worldisyours.ap_appointments
CREATE TABLE IF NOT EXISTS `ap_appointments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) DEFAULT NULL,
  `name` tinytext DEFAULT NULL,
  `appData` longtext DEFAULT NULL,
  `type` varchar(60) DEFAULT NULL,
  `state` int(11) DEFAULT 0,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.ap_appointments: ~1 rows (approximately)
INSERT INTO `ap_appointments` (`id`, `identifier`, `name`, `appData`, `type`, `state`) VALUES
	(1, 'UMV88168', 'Andy Murphy', NULL, 'mayor', 0);

-- Dumping structure for table worldisyours.ap_bar
CREATE TABLE IF NOT EXISTS `ap_bar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(100) NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Name',
  `mobile` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Phone Number',
  `job` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Job',
  `bar_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0000000',
  `bar_date` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '01 JAN 2022',
  `bar_r_reason` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Reason',
  `bar_state` int(11) NOT NULL DEFAULT 0,
  `app_state` int(11) NOT NULL DEFAULT 0,
  `app_reason` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Reason',
  `app_date` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Date',
  `jury_state` int(11) NOT NULL DEFAULT 0,
  `jury_pay` int(11) NOT NULL DEFAULT 0,
  `jury_case` int(11) NOT NULL DEFAULT 0,
  `jury_v_state` int(11) NOT NULL DEFAULT 0,
  `jury_case_date` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Court Date',
  `jury_removal` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Removal Reason',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ap_bar: ~1 rows (approximately)
INSERT INTO `ap_bar` (`id`, `owner`, `name`, `mobile`, `job`, `bar_id`, `bar_date`, `bar_r_reason`, `bar_state`, `app_state`, `app_reason`, `app_date`, `jury_state`, `jury_pay`, `jury_case`, `jury_v_state`, `jury_case_date`, `jury_removal`) VALUES
	(2, 'UMV88168', 'Andy Murphy', '1451740235', 'Mosley Motor Works', '0000000', '01 JAN 2022', 'Reason', 1, 0, 'Reason', 'Date', 0, 0, 0, 0, 'Court Date', 'Removal Reason');

-- Dumping structure for table worldisyours.ap_cases
CREATE TABLE IF NOT EXISTS `ap_cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judgeid` varchar(100) NOT NULL DEFAULT 'Judge ID',
  `judgen` varchar(35) NOT NULL DEFAULT 'Add To Case',
  `defendantid` varchar(100) NOT NULL DEFAULT 'Defendant ID',
  `defendantn` varchar(35) NOT NULL DEFAULT 'Add To Case',
  `defenseid` varchar(100) NOT NULL DEFAULT 'Defense ID',
  `defensen` varchar(35) NOT NULL DEFAULT 'Add To Case',
  `casename` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Case Name',
  `job_request` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Job Name',
  `courtfees` int(11) DEFAULT 0,
  `courtdate` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Date & Time',
  `outcome` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Court Outcome',
  `guilty` int(11) DEFAULT 0,
  `not_guilty` int(11) DEFAULT 0,
  `no_show_state` int(11) DEFAULT 0,
  `settlement_state` int(11) DEFAULT 0,
  `state` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ap_cases: ~0 rows (approximately)

-- Dumping structure for table worldisyours.ap_criminalarchives
CREATE TABLE IF NOT EXISTS `ap_criminalarchives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ap_criminalarchives: ~0 rows (approximately)

-- Dumping structure for table worldisyours.ap_dlcsettings
CREATE TABLE IF NOT EXISTS `ap_dlcsettings` (
  `script` varchar(60) DEFAULT 'SCRIPT',
  `settings` longtext DEFAULT '{}',
  `other` longtext DEFAULT '{}',
  `id_storage` longtext NOT NULL DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ap_dlcsettings: ~0 rows (approximately)

-- Dumping structure for table worldisyours.ap_documents
CREATE TABLE IF NOT EXISTS `ap_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documentid` varchar(50) DEFAULT NULL,
  `identifier` varchar(100) DEFAULT NULL,
  `document` longtext DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `catergory` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.ap_documents: ~0 rows (approximately)

-- Dumping structure for table worldisyours.ap_judgeexam
CREATE TABLE IF NOT EXISTS `ap_judgeexam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` longtext DEFAULT 'Question',
  `a` longtext DEFAULT 'Answer A',
  `b` longtext DEFAULT 'Answer B',
  `c` longtext DEFAULT 'Answer C',
  `d` longtext DEFAULT 'Answer D',
  `answer` longtext DEFAULT 'Correct Answer',
  `last_changed_by` varchar(70) DEFAULT 'Judge Name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ap_judgeexam: ~0 rows (approximately)

-- Dumping structure for table worldisyours.ap_lawvoting
CREATE TABLE IF NOT EXISTS `ap_lawvoting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fors` int(11) DEFAULT NULL,
  `against` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `storage` longtext DEFAULT '{}',
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.ap_lawvoting: ~0 rows (approximately)

-- Dumping structure for table worldisyours.ap_tax
CREATE TABLE IF NOT EXISTS `ap_tax` (
  `business` varchar(60) DEFAULT 'JOB NAME',
  `label` varchar(60) DEFAULT 'JOB LABEL',
  `amount_owed` int(11) DEFAULT 0,
  `total_tax_paid` int(11) DEFAULT 0,
  `pay_timer` int(11) DEFAULT 0,
  `owner` varchar(60) DEFAULT 'COMPANY OWNER',
  `base_tax` int(11) DEFAULT NULL,
  `grants` longtext DEFAULT 'nil'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ap_tax: ~0 rows (approximately)

-- Dumping structure for table worldisyours.ap_voting
CREATE TABLE IF NOT EXISTS `ap_voting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `name` varchar(70) DEFAULT NULL,
  `age` text DEFAULT NULL,
  `shortDescription` mediumtext DEFAULT NULL,
  `whyDoYouWantToBeACandidate` longtext DEFAULT NULL,
  `WhatYoullBringToTheCity` longtext DEFAULT NULL,
  `denied` longtext DEFAULT 'N/A',
  `votes` int(10) DEFAULT NULL,
  `state` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ap_voting: ~0 rows (approximately)

-- Dumping structure for table worldisyours.av_items
CREATE TABLE IF NOT EXISTS `av_items` (
  `job` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `ingredients` longtext DEFAULT NULL,
  `prop` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `job` (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.av_items: ~0 rows (approximately)

-- Dumping structure for table worldisyours.av_restaurants
CREATE TABLE IF NOT EXISTS `av_restaurants` (
  `name` varchar(50) NOT NULL,
  `job` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.av_restaurants: ~0 rows (approximately)

-- Dumping structure for table worldisyours.av_society
CREATE TABLE IF NOT EXISTS `av_society` (
  `job` varchar(50) DEFAULT NULL,
  `money` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.av_society: ~0 rows (approximately)

-- Dumping structure for table worldisyours.banking_accounts
CREATE TABLE IF NOT EXISTS `banking_accounts` (
  `account` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `label` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores account data for jobs and gangs';

-- Dumping data for table worldisyours.banking_accounts: ~47 rows (approximately)
INSERT INTO `banking_accounts` (`account`, `amount`, `label`) VALUES
	('airdealership', 0, 'Air Vehicle Dealer'),
	('ambulance', 90000, 'EMS'),
	('ballas', 0, 'Ballas'),
	('bcso', 0, 'BCSO'),
	('beeker', 0, 'Beeker\'s Garage'),
	('bennys', 0, 'Benny\'s Original Motor Works'),
	('bestbuds', 0, 'Best Buds'),
	('billiards', 0, 'billiards'),
	('boatdealership', 0, 'Boat Vehicle Dealer'),
	('burgershot', 4500, 'BurgerShot'),
	('cardealer', 0, 'Vehicle Dealer'),
	('cartel', 0, 'Cartel'),
	('casino', 0, 'Casino'),
	('catcafe', 450, 'Cat Cafe'),
	('cityhall', 0, 'CityHall'),
	('dealership', 0, 'Vehicle Dealer'),
	('dhs', 0, 'DHS'),
	('diver', 0, 'Diving'),
	('emergencydealership', 203000, 'Emergency Vehicle Dealer'),
	('families', 0, 'Families'),
	('fbi', 0, 'FBI'),
	('firefighter', 0, 'Fire Fighter'),
	('jobresetelectrician', 0, 'etelectrician'),
	('jobresetgardener', 0, 'gardener'),
	('kittys', 0, 'Kittys Motor Works'),
	('lostmc', 0, 'The Lost MC'),
	('lspd', 0, 'LSPD'),
	('lsso', 0, 'LSSO'),
	('mechanic', 4200, 'LS Customs'),
	('mechanic2', 0, 'LS Customs'),
	('mechanic3', 0, 'LS Customs'),
	('mosleys', 810, 'Mosley Motor Works'),
	('pdm', 0, 'PDM Vehicle Dealer'),
	('police', 0, 'Law Enforcement'),
	('realestate', 0, 'Real Estate'),
	('sadoc', 0, 'SADOC'),
	('safw', 0, 'SAFW'),
	('sahp', 0, 'SAHP'),
	('ss', 0, 'SS'),
	('taxi', 0, 'Taxi'),
	('tobacco', 0, 'Tobacco Farmer'),
	('triads', 0, 'Triads'),
	('truckdealership', 0, 'Truck Vehicle Dealer'),
	('usms', 0, 'USMS'),
	('vagos', 0, 'Vagos'),
	('whitewidow', 0, 'White Widow'),
	('wiydealership', 250000, 'WIY Vehicle Dealer');

-- Dumping structure for table worldisyours.banking_loans
CREATE TABLE IF NOT EXISTS `banking_loans` (
  `id` varchar(50) NOT NULL,
  `player_id` varchar(100) NOT NULL COMMENT 'Loan created by',
  `amount` int(11) NOT NULL DEFAULT 0,
  `interest` int(11) NOT NULL DEFAULT 0,
  `start_date` datetime NOT NULL DEFAULT current_timestamp(),
  `end_date` datetime NOT NULL,
  `other_player_id` varchar(100) NOT NULL COMMENT 'Loan borrowed by',
  `is_accepted` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `loan_closed` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Contains all the information of all the loans';

-- Dumping data for table worldisyours.banking_loans: ~0 rows (approximately)

-- Dumping structure for table worldisyours.banking_loan_transactions
CREATE TABLE IF NOT EXISTS `banking_loan_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_id` varchar(50) DEFAULT NULL,
  `amount_paid` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_banking_loan_transactions_banking_loans` (`loan_id`),
  CONSTRAINT `FK_banking_loan_transactions_banking_loans` FOREIGN KEY (`loan_id`) REFERENCES `banking_loans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Holds the transactions for all the loans';

-- Dumping data for table worldisyours.banking_loan_transactions: ~0 rows (approximately)

-- Dumping structure for table worldisyours.banking_management
CREATE TABLE IF NOT EXISTS `banking_management` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `status` enum('flagged','frozen','unflagged','unfrozen') NOT NULL,
  `reason` longtext NOT NULL,
  `managed_by` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.banking_management: ~0 rows (approximately)

-- Dumping structure for table worldisyours.banking_transactions
CREATE TABLE IF NOT EXISTS `banking_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(100) NOT NULL,
  `job_player_id` varchar(100) DEFAULT NULL,
  `transaction_type` enum('withdraw','deposit','transfer') NOT NULL,
  `transferred_to` varchar(100) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `memo` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK__players` (`unique_id`) USING BTREE,
  CONSTRAINT `FK_banking_transactions_banking_users` FOREIGN KEY (`unique_id`) REFERENCES `banking_users` (`unique_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Holds all the transactions';

-- Dumping data for table worldisyours.banking_transactions: ~29 rows (approximately)
INSERT INTO `banking_transactions` (`id`, `unique_id`, `job_player_id`, `transaction_type`, `transferred_to`, `amount`, `memo`, `created_at`) VALUES
	(160, '1045', NULL, 'deposit', NULL, 1, '2', '2024-11-02 08:17:06'),
	(161, '1023', 'HOU41578', 'deposit', NULL, 250000, 'test', '2024-11-02 13:12:03'),
	(162, '1004', 'HOU41578', 'deposit', NULL, 250000, 'test', '2024-11-02 13:17:06'),
	(163, '1004', 'HOU41578', 'withdraw', NULL, 250000, 'test done', '2024-11-02 21:23:16'),
	(164, '1004', 'HOU41578', 'deposit', NULL, 81000, 'cars', '2024-11-06 15:49:48'),
	(165, '1050', NULL, 'withdraw', NULL, 8500, '1', '2024-11-06 17:46:25'),
	(166, '1050', NULL, 'deposit', NULL, 87000, '2', '2024-11-06 18:59:17'),
	(167, '1050', NULL, 'withdraw', NULL, 5000, '2', '2024-11-06 19:04:26'),
	(168, '1004', 'HOU41578', 'deposit', NULL, 90000, 'replacement', '2024-11-08 20:50:19'),
	(169, '1053', NULL, 'withdraw', NULL, 12000, 'ATM', '2024-11-08 21:11:13'),
	(170, '1053', NULL, 'withdraw', NULL, 500, 'ATM', '2024-11-08 21:18:17'),
	(171, '1053', NULL, 'withdraw', NULL, 2000, 'ATM', '2024-11-08 22:21:54'),
	(172, '1055', NULL, 'deposit', NULL, 70000, 'Car Money', '2024-11-08 22:52:26'),
	(173, '1053', NULL, 'withdraw', NULL, 10000, 'ATM', '2024-11-09 10:48:59'),
	(174, '1053', NULL, 'withdraw', NULL, 85000, 'Load Out - PD', '2024-11-09 16:00:52'),
	(175, '1050', NULL, 'withdraw', NULL, 2500, '3', '2024-11-09 21:14:36'),
	(176, '1050', NULL, 'withdraw', NULL, 33800, 'car', '2024-11-09 21:54:51'),
	(177, '1050', NULL, 'withdraw', NULL, 28000, '1', '2024-11-09 23:25:04'),
	(178, '1050', NULL, 'deposit', NULL, 10000, '1', '2024-11-09 23:51:08'),
	(179, '1049', NULL, 'deposit', NULL, 5000, 'tttt', '2024-11-10 12:20:43'),
	(180, '1049', NULL, 'deposit', NULL, 10000, 'test', '2024-11-10 14:12:56'),
	(181, '1050', NULL, 'withdraw', NULL, 25000, '1', '2024-11-10 16:52:15'),
	(182, '1049', NULL, 'withdraw', NULL, 1000, 'ATM', '2024-11-10 17:35:08'),
	(183, '1060', NULL, 'withdraw', NULL, 1500, 'first withdrawal', '2024-11-10 18:50:12'),
	(184, '1060', NULL, 'deposit', NULL, 5000, 'ATM', '2024-11-10 20:54:33'),
	(185, '1053', NULL, 'withdraw', NULL, 30000, 'ATM', '2024-11-11 10:45:57'),
	(186, '1053', NULL, 'withdraw', NULL, 9000, 'ATM', '2024-11-11 11:48:30'),
	(187, '1046', NULL, 'withdraw', NULL, 93718, 'test', '2024-11-20 02:19:37'),
	(188, '1052', NULL, 'withdraw', NULL, 1000, 'a', '2024-11-23 23:50:16');

-- Dumping structure for table worldisyours.banking_users
CREATE TABLE IF NOT EXISTS `banking_users` (
  `identifier` varchar(100) NOT NULL,
  `unique_id` varchar(100) NOT NULL,
  `deleted_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `type` enum('jobgang','personal') NOT NULL,
  PRIMARY KEY (`unique_id`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.banking_users: ~63 rows (approximately)
INSERT INTO `banking_users` (`identifier`, `unique_id`, `deleted_at`, `type`) VALUES
	('firefighter', '1001', NULL, 'jobgang'),
	('police', '1002', NULL, 'jobgang'),
	('ambulance', '1003', NULL, 'jobgang'),
	('emergencydealership', '1004', NULL, 'jobgang'),
	('tobacco', '1005', NULL, 'jobgang'),
	('mosleys', '1006', NULL, 'jobgang'),
	('cardealer', '1007', NULL, 'jobgang'),
	('lspd', '1008', NULL, 'jobgang'),
	('kittys', '1009', NULL, 'jobgang'),
	('usms', '1010', NULL, 'jobgang'),
	('sahp', '1011', NULL, 'jobgang'),
	('catcafe', '1012', NULL, 'jobgang'),
	('mechanic2', '1013', NULL, 'jobgang'),
	('lsso', '1014', NULL, 'jobgang'),
	('bennys', '1015', NULL, 'jobgang'),
	('taxi', '1016', NULL, 'jobgang'),
	('mechanic3', '1017', NULL, 'jobgang'),
	('whitewidow', '1018', NULL, 'jobgang'),
	('sadoc', '1019', NULL, 'jobgang'),
	('bestbuds', '1020', NULL, 'jobgang'),
	('dealership', '1021', NULL, 'jobgang'),
	('dhs', '1022', NULL, 'jobgang'),
	('wiydealership', '1023', NULL, 'jobgang'),
	('bcso', '1024', NULL, 'jobgang'),
	('pdm', '1025', NULL, 'jobgang'),
	('beeker', '1026', NULL, 'jobgang'),
	('safw', '1027', NULL, 'jobgang'),
	('airdealership', '1028', NULL, 'jobgang'),
	('burgershot', '1029', NULL, 'jobgang'),
	('fbi', '1030', NULL, 'jobgang'),
	('ss', '1031', NULL, 'jobgang'),
	('realestate', '1032', NULL, 'jobgang'),
	('boatdealership', '1033', NULL, 'jobgang'),
	('billiards', '1034', NULL, 'jobgang'),
	('cityhall', '1035', NULL, 'jobgang'),
	('truckdealership', '1036', NULL, 'jobgang'),
	('casino', '1037', NULL, 'jobgang'),
	('mechanic', '1038', NULL, 'jobgang'),
	('triads', '1039', NULL, 'jobgang'),
	('families', '1040', NULL, 'jobgang'),
	('ballas', '1041', NULL, 'jobgang'),
	('lostmc', '1042', NULL, 'jobgang'),
	('vagos', '1043', NULL, 'jobgang'),
	('cartel', '1044', NULL, 'jobgang'),
	('CWY62276', '1045', NULL, 'personal'),
	('HOU41578', '1046', NULL, 'personal'),
	('RDT43347', '1047', NULL, 'personal'),
	('RZY43875', '1048', NULL, 'personal'),
	('STG67749', '1049', NULL, 'personal'),
	('YDT13754', '1050', NULL, 'personal'),
	('VIU66597', '1051', NULL, 'personal'),
	('HEU60167', '1052', NULL, 'personal'),
	('UMV88168', '1053', NULL, 'personal'),
	('XVQ84862', '1054', NULL, 'personal'),
	('EBT98762', '1055', NULL, 'personal'),
	('LKQ99821', '1056', NULL, 'personal'),
	('diver', '1057', NULL, 'jobgang'),
	('jobresetelectrician', '1058', NULL, 'jobgang'),
	('jobresetgardener', '1059', NULL, 'jobgang'),
	('ETF72063', '1060', NULL, 'personal'),
	('VYV31546', '1061', NULL, 'personal'),
	('AEZ52818', '1062', NULL, 'personal'),
	('UYN60276', '1063', NULL, 'personal');

-- Dumping structure for table worldisyours.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `account_balance` int(11) NOT NULL DEFAULT 0,
  `account_type` enum('shared','job','gang') NOT NULL,
  `users` longtext DEFAULT '[]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.bank_accounts: ~2 rows (approximately)
INSERT INTO `bank_accounts` (`id`, `citizenid`, `account_name`, `account_balance`, `account_type`, `users`) VALUES
	(1, NULL, 'catcafe', 0, 'job', '[]'),
	(2, NULL, 'police', 0, 'job', '[]'),
	(3, NULL, 'billiards', 0, 'job', '[]'),
	(4, NULL, 'sahp', 0, 'job', '[]'),
	(5, NULL, 'wiydealership', 0, 'job', '[]');

-- Dumping structure for table worldisyours.bank_accounts_new
CREATE TABLE IF NOT EXISTS `bank_accounts_new` (
  `id` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  `auth` longtext DEFAULT '[]',
  `isFrozen` int(11) DEFAULT 0,
  `creator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.bank_accounts_new: ~49 rows (approximately)
INSERT INTO `bank_accounts_new` (`id`, `amount`, `transactions`, `auth`, `isFrozen`, `creator`) VALUES
	('airdealership', 0, '[]', '[]', 0, NULL),
	('ambulance', 0, '[]', '[]', 0, NULL),
	('ballas', 0, '[]', '[]', 0, NULL),
	('bcso', 0, '[]', '[]', 0, NULL),
	('beeker', 0, '[]', '[]', 0, NULL),
	('bennys', 0, '[]', '[]', 0, NULL),
	('bestbuds', 0, '[]', '[]', 0, NULL),
	('billiards', 0, '[]', '[]', 0, NULL),
	('boatdealership', 0, '[]', '[]', 0, NULL),
	('burgershot', 5000, '[{"time":1730352765,"receiver":"burgershot","trans_id":"2790d63a-4612-4f27-b8b4-8f68783cca87","message":"Ryan Rich has deposited $5000","trans_type":"deposit","title":"Personal Account / burgershot","issuer":"Ryan Rich","amount":5000}]', '[]', 0, NULL),
	('bus', 0, '[]', '[]', 0, NULL),
	('cardealer', 0, '[]', '[]', 0, NULL),
	('cartel', 0, '[]', '[]', 0, NULL),
	('casino', 0, '[]', '[]', 0, NULL),
	('catcafe', 0, '[]', '[]', 0, NULL),
	('cityhall', 0, '[]', '[]', 0, NULL),
	('dealership', 0, '[]', '[]', 0, NULL),
	('dhs', 0, '[]', '[]', 0, NULL),
	('emergencydealership', 0, '[]', '[]', 0, NULL),
	('families', 0, '[]', '[]', 0, NULL),
	('fbi', 0, '[]', '[]', 0, NULL),
	('firefighter', 0, '[]', '[]', 0, NULL),
	('garbage', 0, '[]', '[]', 0, NULL),
	('hotdog', 0, '[]', '[]', 0, NULL),
	('judge', 0, '[]', '[]', 0, NULL),
	('kittys', 0, '[]', '[]', 0, NULL),
	('lawyer', 0, '[]', '[]', 0, NULL),
	('lostmc', 0, '[]', '[]', 0, NULL),
	('lspd', 0, '[]', '[]', 0, NULL),
	('lsso', 0, '[]', '[]', 0, NULL),
	('mechanic', 0, '[]', '[]', 0, NULL),
	('mechanic2', 0, '[]', '[]', 0, NULL),
	('mechanic3', 0, '[]', '[]', 0, NULL),
	('mosleys', 0, '[]', '[]', 0, NULL),
	('none', 0, '[]', '[]', 0, NULL),
	('pdm', 0, '[]', '[]', 0, NULL),
	('police', 0, '[]', '[]', 0, NULL),
	('realestate', 0, '[]', '[]', 0, NULL),
	('reporter', 0, '[]', '[]', 0, NULL),
	('sadoc', 0, '[]', '[]', 0, NULL),
	('safw', 0, '[]', '[]', 0, NULL),
	('sahp', 0, '[]', '[]', 0, NULL),
	('ss', 0, '[]', '[]', 0, NULL),
	('taxi', 0, '[]', '[]', 0, NULL),
	('tobacco', 0, '[]', '[]', 0, NULL),
	('tow', 0, '[]', '[]', 0, NULL),
	('triads', 0, '[]', '[]', 0, NULL),
	('truckdealership', 0, '[]', '[]', 0, NULL),
	('trucker', 0, '[]', '[]', 0, NULL),
	('unemployed', 0, '[]', '[]', 0, NULL),
	('usms', 0, '[]', '[]', 0, NULL),
	('vagos', 0, '[]', '[]', 0, NULL),
	('vineyard', 0, '[]', '[]', 0, NULL),
	('whitewidow', 0, '[]', '[]', 0, NULL),
	('wiydealership', 0, '[{"receiver":"Demons Test","trans_type":"withdraw","issuer":"wiydealership","time":1730531615,"amount":250000,"trans_id":"a14929fe-18c3-4a7f-8855-2120c633be2a","message":"Demons Test has withdrawed $250000","title":"Personal Account / wiydealership"},{"message":"Demons Test has deposited $250000","issuer":"Demons Test","trans_type":"deposit","time":1730394841,"amount":250000,"trans_id":"533e4d6e-2ace-4f5f-be4d-465da34a0529","receiver":"wiydealership","title":"Personal Account / wiydealership"},{"message":"Demons Test has withdrawed $500100","trans_type":"withdraw","receiver":"Demons Test","time":1730393540,"amount":500100,"trans_id":"d7faeacd-f4ba-4dd2-bc86-6e24124ab230","issuer":"wiydealership","title":"Personal Account / wiydealership"},{"message":"Ryan Rich has deposited $500100","trans_type":"deposit","receiver":"wiydealership","time":1730352706,"amount":500100,"trans_id":"0f8c3e5d-bdd1-4cd6-80bd-985ab2b17b4f","issuer":"Ryan Rich","title":"Personal Account / wiydealership"},{"message":"Ryan Rich has withdrawed $500100","trans_type":"withdraw","receiver":"Ryan Rich","time":1730352667,"amount":500100,"trans_id":"00bf0919-2d95-41b9-b58c-31214a902a61","issuer":"wiydealership","title":"Personal Account / wiydealership"},{"message":"Ryan Rich has deposited $100","trans_type":"deposit","receiver":"wiydealership","time":1730352517,"amount":100,"trans_id":"2f48071b-e9b5-49eb-bbb1-050cef36280e","issuer":"Ryan Rich","title":"Personal Account / wiydealership"},{"message":"Ryan Rich has deposited $500000","trans_type":"deposit","receiver":"wiydealership","time":1730352058,"amount":500000,"trans_id":"b2d0bf55-197d-45d6-8f09-9ad011f8c41a","issuer":"Ryan Rich","title":"Personal Account / wiydealership"}]', '[]', 0, NULL);

-- Dumping structure for table worldisyours.bank_statements
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT 'checking',
  `amount` int(11) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `statement_type` enum('deposit','withdraw') DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.bank_statements: ~0 rows (approximately)

-- Dumping structure for table worldisyours.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.bans: ~0 rows (approximately)

-- Dumping structure for table worldisyours.car_boosting
CREATE TABLE IF NOT EXISTS `car_boosting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `value` double NOT NULL,
  `success` int(11) NOT NULL,
  `enemy_killed` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.car_boosting: ~0 rows (approximately)

-- Dumping structure for table worldisyours.car_boosting_messages
CREATE TABLE IF NOT EXISTS `car_boosting_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.car_boosting_messages: ~0 rows (approximately)

-- Dumping structure for table worldisyours.casino_cache
CREATE TABLE IF NOT EXISTS `casino_cache` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_slovak_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.casino_cache: ~0 rows (approximately)
INSERT INTO `casino_cache` (`ID`, `Settings`) VALUES
	(1, '{"PodiumPriceProps":{"engineHealth":1,"modFender":-1,"modBackWheels":-1,"modEngine":3,"fuelLevel":1,"color1":111,"color2":111,"modFrontBumper":1,"neonEnabled":[false,false,false,false],"modDial":-1,"modShifterLeavers":-1,"modXenon":1,"modVanityPlate":-1,"modTank":-1,"xenonColor":12,"modTrimB":-1,"modSeats":-1,"modDoorSpeaker":-1,"podiumName":"SHEAVA","modAirFilter":-1,"modTurbo":1,"modPlateHolder":-1,"modRoof":2,"extras":{"1":false},"modSpeakers":-1,"modArchCover":-1,"modEngineBlock":-1,"modLivery":1,"modBrakes":2,"modExhaust":0,"dirtLevel":1,"modStruts":-1,"wheels":5,"modDashboard":-1,"modSpoilers":3,"modFrame":-1,"modTransmission":2,"modTrunk":-1,"modSideSkirt":-1,"modRearBumper":0,"model":819197656,"modSuspension":-1,"wheelColor":111,"bodyHealth":1,"tyreSmokeColor":[1,1,1],"tankHealth":1,"modSmokeEnabled":1,"plateIndex":0,"modArmor":4,"modOrnaments":-1,"modHood":0,"modAPlate":-1,"pearlescentColor":111,"modFrontWheels":-1,"modWindows":-1,"modHydrolic":-1,"neonColor":[255,0,255],"windowTint":6,"modTrimA":-1,"modHorns":57,"modRightFender":-1,"modAerials":-1,"modGrille":-1,"modSteeringWheel":-1}}');

-- Dumping structure for table worldisyours.casino_players
CREATE TABLE IF NOT EXISTS `casino_players` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(128) NOT NULL,
  `properties` longtext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.casino_players: ~6 rows (approximately)
INSERT INTO `casino_players` (`ID`, `identifier`, `properties`) VALUES
	(45, 'HEU60167', '{"activeTime":2301679,"firstTime":false,"vipUntil":0,"lastSave":4116443,"chips":0,"logins":1}'),
	(46, 'HOU41578', '{"luckyWheelCooldownUntil":1731021129,"activeTime":9948282,"vipUntil":0,"chips":0,"firstTime":false,"logins":4,"lastSave":13569951}'),
	(47, 'RDT43347', '{"luckyWheelCooldownUntil":1731021228,"activeTime":10133846,"vipUntil":0,"chips":0,"firstTime":false,"logins":2,"lastSave":13750072}'),
	(48, 'YDT13754', '{"lastDailyBonus":"11/06/24","luckyWheelCooldownUntil":1731021167,"firstTime":false,"vipUntil":0,"chips":0,"activeTime":9902834,"logins":1,"lastSave":13509917}'),
	(49, 'RZY43875', '{"activeTime":9927028,"luckyWheelCooldownUntil":1731021086,"firstTime":false,"vipUntil":0,"chips":0,"freeDrinksUntil":1731021106,"logins":1,"lastSave":13539928}'),
	(50, 'UMV88168', '{"vipUntil":0,"activeTime":38558973,"lastDailyBonus":"11/10/24","luckyWheelCooldownUntil":1731426200,"firstTime":false,"freeDrinksUntil":1731207623,"lastSave":42173446,"logins":4,"chips":0}');

-- Dumping structure for table worldisyours.cdev_dynamic_settings
CREATE TABLE IF NOT EXISTS `cdev_dynamic_settings` (
  `name` varchar(100) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.cdev_dynamic_settings: ~0 rows (approximately)

-- Dumping structure for table worldisyours.cdev_pets
CREATE TABLE IF NOT EXISTS `cdev_pets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `name` text NOT NULL,
  `stamina` int(11) NOT NULL DEFAULT 100,
  `loyalty` int(11) NOT NULL DEFAULT 100,
  `happiness` int(11) NOT NULL DEFAULT 100,
  `hunger` int(11) NOT NULL DEFAULT 100,
  `health` int(11) NOT NULL DEFAULT 100,
  `thirst` int(11) NOT NULL DEFAULT 100,
  `sniff` int(11) NOT NULL DEFAULT 0,
  `resistance` int(11) NOT NULL DEFAULT 0,
  `agility` int(11) NOT NULL DEFAULT 0,
  `attack` int(11) NOT NULL DEFAULT 0,
  `customization` longtext DEFAULT '{}',
  `props` longtext DEFAULT '{}',
  `escaped` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.cdev_pets: ~0 rows (approximately)

-- Dumping structure for table worldisyours.cdev_pets_inventory
CREATE TABLE IF NOT EXISTS `cdev_pets_inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inventory` bigint(20) NOT NULL,
  `item` varchar(100) NOT NULL,
  `slot` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `metadata` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.cdev_pets_inventory: ~0 rows (approximately)

-- Dumping structure for table worldisyours.cdev_pets_petshops
CREATE TABLE IF NOT EXISTS `cdev_pets_petshops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `blip` int(11) NOT NULL DEFAULT 0,
  `blipSize` float DEFAULT NULL,
  `blipColor` int(11) NOT NULL DEFAULT 0,
  `blipLocation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `petsellersLocation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `sellersLocation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `management` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `logo` varchar(255) NOT NULL DEFAULT '',
  `vault` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table worldisyours.cdev_pets_petshops: ~0 rows (approximately)

-- Dumping structure for table worldisyours.cdev_pets_petshops_employees
CREATE TABLE IF NOT EXISTS `cdev_pets_petshops_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.cdev_pets_petshops_employees: ~0 rows (approximately)

-- Dumping structure for table worldisyours.cdev_pets_petshops_sales
CREATE TABLE IF NOT EXISTS `cdev_pets_petshops_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `items` longtext DEFAULT '{}',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.cdev_pets_petshops_sales: ~0 rows (approximately)

-- Dumping structure for table worldisyours.cdev_pets_petshops_sell_prices
CREATE TABLE IF NOT EXISTS `cdev_pets_petshops_sell_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.cdev_pets_petshops_sell_prices: ~0 rows (approximately)

-- Dumping structure for table worldisyours.cdev_pets_petshops_stock
CREATE TABLE IF NOT EXISTS `cdev_pets_petshops_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.cdev_pets_petshops_stock: ~0 rows (approximately)

-- Dumping structure for table worldisyours.cd_dispatch
CREATE TABLE IF NOT EXISTS `cd_dispatch` (
  `identifier` varchar(50) DEFAULT NULL,
  `callsign` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.cd_dispatch: ~0 rows (approximately)
INSERT INTO `cd_dispatch` (`identifier`, `callsign`) VALUES
	('RZY43875', 'C-1');

-- Dumping structure for table worldisyours.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.crypto: ~0 rows (approximately)

-- Dumping structure for table worldisyours.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.crypto_transactions: ~0 rows (approximately)

-- Dumping structure for table worldisyours.darkchat_messages
CREATE TABLE IF NOT EXISTS `darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` text NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.darkchat_messages: ~0 rows (approximately)

-- Dumping structure for table worldisyours.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext DEFAULT NULL,
  `time` longtext DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.dealers: ~0 rows (approximately)

-- Dumping structure for table worldisyours.dealership_imports
CREATE TABLE IF NOT EXISTS `dealership_imports` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` longtext DEFAULT NULL,
  `job` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.dealership_imports: ~7 rows (approximately)
INSERT INTO `dealership_imports` (`id`, `description`, `job`) VALUES
	(1, '{"vehicle":"Dodge Demon","workerName":"Demons Test","date":"02/11/2024 - 15:48:39","price":0}', 'wiydealership'),
	(2, '{"vehicle":"Van Vanz Hycade","workerName":"Demons Test","date":"02/11/2024 - 15:52:26","price":0}', 'wiydealership'),
	(3, '{"price":0,"vehicle":"Lamborghini Urus Stretch 6","date":"03/11/2024 - 08:30:48","workerName":"Demons Test"}', 'wiydealership'),
	(4, '{"date":"06/11/2024 - 15:57:36","workerName":"Demons Test","vehicle":"RAM Ram Legacy","price":30000}', 'emergencydealership'),
	(5, '{"date":"06/11/2024 - 18:58:12","workerName":"Demons Test","vehicle":"Dodge Dodge Charger Hellcat","price":40000}', 'emergencydealership'),
	(6, '{"workerName":"Andy Murphy","date":"08/11/2024 - 20:58:21","price":60000,"vehicle":"Mercedes AMG GTR Police"}', 'emergencydealership'),
	(7, '{"workerName":"Andy Murphy","date":"08/11/2024 - 22:51:18","price":35000,"vehicle":"Dodge Dodge Challenger R/T"}', 'emergencydealership');

-- Dumping structure for table worldisyours.dealership_sells
CREATE TABLE IF NOT EXISTS `dealership_sells` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` longtext DEFAULT NULL,
  `job` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.dealership_sells: ~5 rows (approximately)
INSERT INTO `dealership_sells` (`id`, `description`, `job`) VALUES
	(1, '{"sellerName":"Demons Test","vehicle":"RAM Ram Legacy","price":60000,"buyerName":"John McClane","date":"06/11/2024 - 16:00:59"}', 'emergencydealership'),
	(2, '{"sellerName":"Demons Test","vehicle":"Dodge Dodge Charger Hellcat","price":80000,"buyerName":"jason Borune","date":"06/11/2024 - 18:59:39"}', 'emergencydealership'),
	(3, '{"buyerName":"Andy Murphy","vehicle":"Mercedes AMG GTR Police","sellerName":"Andy Murphy","date":"08/11/2024 - 20:59:40","price":120000}', 'emergencydealership'),
	(4, '{"buyerName":"Chris Ray","vehicle":"Dodge Dodge Challenger R/T","sellerName":"Andy Murphy","date":"08/11/2024 - 22:52:39","price":70000}', 'emergencydealership'),
	(5, '{"date":"09/11/2024 - 23:41:41","buyerName":"Ryan Rich","price":1,"sellerName":"Ryan Rich","vehicle":"Van Vanz Hycade"}', 'wiydealership');

-- Dumping structure for table worldisyours.dealership_showroom
CREATE TABLE IF NOT EXISTS `dealership_showroom` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vehicleID` longtext DEFAULT NULL,
  `vehicle` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.dealership_showroom: ~0 rows (approximately)
INSERT INTO `dealership_showroom` (`id`, `vehicleID`, `vehicle`) VALUES
	(1, 'EmergencyVehicle', 'pd_amggtr');

-- Dumping structure for table worldisyours.dealership_stock
CREATE TABLE IF NOT EXISTS `dealership_stock` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `model` mediumtext DEFAULT NULL,
  `stock` int(10) DEFAULT 0,
  `job` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.dealership_stock: ~6 rows (approximately)
INSERT INTO `dealership_stock` (`id`, `model`, `stock`, `job`) VALUES
	(1, 'demon', 1, 'wiydealership'),
	(2, 'vanzhycade', 0, 'wiydealership'),
	(3, 'Urus_Stretch_6', 1, 'wiydealership'),
	(4, 'ramleg', 0, 'emergencydealership'),
	(5, 'hellcatum', 0, 'emergencydealership'),
	(6, 'pd_amggtr', 1, 'emergencydealership'),
	(7, 'challengerum', 0, 'emergencydealership');

-- Dumping structure for table worldisyours.dispatch_draws
CREATE TABLE IF NOT EXISTS `dispatch_draws` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.dispatch_draws: ~0 rows (approximately)

-- Dumping structure for table worldisyours.dispatch_stats_table
CREATE TABLE IF NOT EXISTS `dispatch_stats_table` (
  `date` date NOT NULL,
  `alerts` int(11) DEFAULT NULL,
  `car_robberies` int(11) DEFAULT NULL,
  `bank_robberies` int(11) DEFAULT NULL,
  `shop_robberies` int(11) DEFAULT NULL,
  `alert_coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`alert_coords`)),
  `radar_coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`radar_coords`)),
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.dispatch_stats_table: ~8 rows (approximately)
INSERT INTO `dispatch_stats_table` (`date`, `alerts`, `car_robberies`, `bank_robberies`, `shop_robberies`, `alert_coords`, `radar_coords`) VALUES
	('2024-11-17', 0, 0, 0, 0, '[]', '[]'),
	('2024-11-18', 0, 0, 0, 0, '[]', '[]'),
	('2024-11-19', 0, 0, 0, 0, '[]', '[]'),
	('2024-11-20', 11, 0, 0, 0, '[{"x":8.54415607452392,"z":29.28615570068359,"y":-1354.557373046875},{"x":8.54415607452392,"z":29.28615570068359,"y":-1354.557373046875},{"x":8.54415607452392,"z":29.28615570068359,"y":-1354.557373046875},{"x":8.54415607452392,"z":29.28615570068359,"y":-1354.557373046875},{"x":8.54415607452392,"z":29.28615570068359,"y":-1354.557373046875},{"x":8.54415607452392,"z":29.28615570068359,"y":-1354.557373046875},{"x":8.54415607452392,"z":29.28615570068359,"y":-1354.557373046875},{"x":8.54415607452392,"z":29.28615570068359,"y":-1354.557373046875},{"x":8.54415607452392,"z":29.28615570068359,"y":-1354.557373046875},{"x":8.54415607452392,"z":29.28615570068359,"y":-1354.557373046875},{"x":8.54415607452392,"z":29.28615570068359,"y":-1354.557373046875}]', '[]'),
	('2024-11-21', 0, 0, 0, 0, '[]', '[]'),
	('2024-11-22', 0, 0, 0, 0, '[]', '[]'),
	('2024-11-23', 0, 0, 0, 0, '[]', '[]'),
	('2024-11-24', 0, 0, 0, 0, '[]', '[]');

-- Dumping structure for table worldisyours.dpkeybinds
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table worldisyours.dpkeybinds: ~0 rows (approximately)

-- Dumping structure for table worldisyours.drx_mdw_evidence
CREATE TABLE IF NOT EXISTS `drx_mdw_evidence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `tags` longtext NOT NULL,
  `timeStamp` longtext NOT NULL,
  `createdBy` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.drx_mdw_evidence: ~0 rows (approximately)

-- Dumping structure for table worldisyours.drx_mdw_extra
CREATE TABLE IF NOT EXISTS `drx_mdw_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageofday` longtext DEFAULT NULL,
  `announcements` longtext DEFAULT NULL,
  `chat` longtext DEFAULT NULL,
  `academySheet` longtext DEFAULT NULL,
  `disciplinary` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.drx_mdw_extra: ~0 rows (approximately)
INSERT INTO `drx_mdw_extra` (`id`, `messageofday`, `announcements`, `chat`, `academySheet`, `disciplinary`) VALUES
	(1, '[]', NULL, NULL, NULL, NULL);

-- Dumping structure for table worldisyours.drx_mdw_incidents
CREATE TABLE IF NOT EXISTS `drx_mdw_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `details` longtext NOT NULL,
  `evidence` longtext DEFAULT NULL,
  `officers` longtext NOT NULL,
  `persons` longtext NOT NULL,
  `tags` longtext NOT NULL,
  `addedCrims` longtext NOT NULL,
  `timeStamp` longtext NOT NULL,
  `createdBy` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.drx_mdw_incidents: ~0 rows (approximately)

-- Dumping structure for table worldisyours.drx_mdw_legislation
CREATE TABLE IF NOT EXISTS `drx_mdw_legislation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext DEFAULT NULL,
  `details` longtext DEFAULT '[]',
  `tags` longtext DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.drx_mdw_legislation: ~0 rows (approximately)

-- Dumping structure for table worldisyours.drx_mdw_officers
CREATE TABLE IF NOT EXISTS `drx_mdw_officers` (
  `citizenid` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `callsign` int(11) NOT NULL DEFAULT 0,
  `alias` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `rank` varchar(255) DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `roles` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.drx_mdw_officers: ~3 rows (approximately)
INSERT INTO `drx_mdw_officers` (`citizenid`, `firstname`, `lastname`, `callsign`, `alias`, `phone`, `department`, `rank`, `image`, `roles`, `data`) VALUES
	('EBT98762', 'Chris', 'Ray', 201, 'B-1', '5203155123', 'BCSO', 'Sheriff', ' ', '[{"id":0,"role":"Full Access","access":true},{"id":1,"role":"Edit Profiles","access":true},{"id":2,"role":"Edit Incidents","access":true},{"id":3,"role":"Create Incidents","access":true},{"id":4,"role":"Delete Incidents","access":true},{"id":5,"role":"Edit Reports","access":true},{"id":6,"role":"Create Reports","access":true},{"id":7,"role":"Delete Reports","access":true},{"id":8,"role":"Edit Evidence","access":true},{"id":9,"role":"Create Evidence","access":true},{"id":10,"role":"Delete Evidence","access":true},{"id":11,"role":"Edit Vehicles","access":true},{"id":12,"role":"Staff Employees","access":true},{"id":13,"role":"Academy Sheet","access":true},{"id":14,"role":"Disciplinary Database","access":true},{"id":15,"role":"Legislation","access":true}]', NULL),
	('RZY43875', 'Doc', 'Office', 100, 'Doc', '2741547302', 'SASP', 'Deputy Commissioner', 'https://i.imgur.com/PDJ3oiB.png', '[{"role":"Full Access","id":0,"access":true}]', NULL),
	('UMV88168', 'Anders', 'Murphy', 101, 'L-1', '2057042489', 'LSPD', 'Chief', ' ', '[{"id":0,"role":"Full Access","access":true},{"id":1,"role":"Edit Profiles","access":true},{"id":2,"role":"Edit Incidents","access":true},{"id":4,"role":"Delete Incidents","access":true},{"id":3,"role":"Create Incidents","access":true},{"id":5,"role":"Edit Reports","access":true},{"id":6,"role":"Create Reports","access":true},{"id":7,"role":"Delete Reports","access":true},{"id":8,"role":"Edit Evidence","access":true},{"id":9,"role":"Create Evidence","access":true},{"id":10,"role":"Delete Evidence","access":true},{"id":11,"role":"Edit Vehicles","access":true},{"id":12,"role":"Staff Employees","access":true},{"id":13,"role":"Academy Sheet","access":true},{"id":14,"role":"Disciplinary Database","access":true}]', '[{"apu":true,"mc":true,"air":true,"fto":true,"responsibilities":"LSPD ","strikes":0,"k9":true}]'),
	('YDT13754', 'Jason', 'Borune', 401, 'H-1', ' ', 'SAHP', 'Colonel (Chief)', ' ', '[{"role":"Full Access","access":true,"id":0},{"role":"Edit Profiles","access":true,"id":1},{"role":"Edit Incidents","access":true,"id":2},{"role":"Create Incidents","access":true,"id":3},{"role":"Delete Incidents","access":true,"id":4},{"role":"Edit Reports","access":true,"id":5},{"role":"Create Reports","access":true,"id":6},{"role":"Delete Reports","access":true,"id":7},{"role":"Edit Evidence","access":true,"id":8},{"role":"Create Evidence","access":true,"id":9},{"role":"Delete Evidence","access":true,"id":10},{"role":"Edit Vehicles","access":true,"id":11},{"role":"Staff Employees","access":true,"id":12},{"role":"Academy Sheet","access":true,"id":13},{"role":"Disciplinary Database","access":true,"id":14}]', NULL);

-- Dumping structure for table worldisyours.drx_mdw_reports
CREATE TABLE IF NOT EXISTS `drx_mdw_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `desc` longtext NOT NULL,
  `tags` longtext NOT NULL,
  `evidence` longtext NOT NULL,
  `officers` longtext NOT NULL,
  `persons` longtext NOT NULL,
  `timeStamp` longtext NOT NULL,
  `createdBy` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.drx_mdw_reports: ~0 rows (approximately)

-- Dumping structure for table worldisyours.ems_mdt_announcements
CREATE TABLE IF NOT EXISTS `ems_mdt_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ems_mdt_announcements: ~0 rows (approximately)

-- Dumping structure for table worldisyours.ems_mdt_cases
CREATE TABLE IF NOT EXISTS `ems_mdt_cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `citizens` text DEFAULT NULL,
  `doctors` text DEFAULT NULL,
  `injuries` text DEFAULT NULL,
  `edited_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `edited_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ems_mdt_cases: ~0 rows (approximately)

-- Dumping structure for table worldisyours.ems_mdt_notes
CREATE TABLE IF NOT EXISTS `ems_mdt_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `citizens` text NOT NULL,
  `doctors` text NOT NULL,
  `cases` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `edited_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `edited_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ems_mdt_notes: ~0 rows (approximately)
INSERT INTO `ems_mdt_notes` (`id`, `title`, `description`, `citizens`, `doctors`, `cases`, `author`, `created_at`, `edited_at`, `edited_by`) VALUES
	(18, 'Need extraction', 'help proctology', '["CWY62276"]', '["HOU41578"]', '[]', 'RZY43875', '2024-11-05 02:13:16', NULL, NULL);

-- Dumping structure for table worldisyours.envi-chopshop
CREATE TABLE IF NOT EXISTS `envi-chopshop` (
  `shop` varchar(60) DEFAULT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `ownerName` varchar(60) DEFAULT NULL,
  `funds` int(60) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.envi-chopshop: ~0 rows (approximately)

-- Dumping structure for table worldisyours.ev_identifiers
CREATE TABLE IF NOT EXISTS `ev_identifiers` (
  `identifier` varchar(255) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `bloodtype` varchar(50) NOT NULL,
  `fingerprint` varchar(50) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ev_identifiers: ~0 rows (approximately)

-- Dumping structure for table worldisyours.farminglights
CREATE TABLE IF NOT EXISTS `farminglights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext NOT NULL CHECK (json_valid(`coords`)),
  `rot` longtext NOT NULL CHECK (json_valid(`rot`)),
  `model` varchar(45) NOT NULL,
  `bucket` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=725 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.farminglights: ~0 rows (approximately)

-- Dumping structure for table worldisyours.farmingpots
CREATE TABLE IF NOT EXISTS `farmingpots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext NOT NULL CHECK (json_valid(`coords`)),
  `rot` longtext NOT NULL CHECK (json_valid(`rot`)),
  `model` varchar(45) NOT NULL,
  `bucket` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `slots` longtext DEFAULT '[]',
  `light` int(11) DEFAULT 0,
  `coverage` float DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=751 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.farmingpots: ~0 rows (approximately)

-- Dumping structure for table worldisyours.farmingtools
CREATE TABLE IF NOT EXISTS `farmingtools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext NOT NULL CHECK (json_valid(`coords`)),
  `rot` longtext NOT NULL CHECK (json_valid(`rot`)),
  `model` varchar(45) NOT NULL,
  `bucket` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.farmingtools: ~0 rows (approximately)

-- Dumping structure for table worldisyours.gympass
CREATE TABLE IF NOT EXISTS `gympass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(500) NOT NULL,
  `gymid` int(11) NOT NULL,
  `gymtime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table worldisyours.gympass: ~1 rows (approximately)
INSERT INTO `gympass` (`id`, `identifier`, `gymid`, `gymtime`) VALUES
	(12, 'RZY43875', 2, 1733247299),
	(13, 'UMV88168', 2, 1733845022);

-- Dumping structure for table worldisyours.gymstats
CREATE TABLE IF NOT EXISTS `gymstats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(500) NOT NULL,
  `stats` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table worldisyours.gymstats: ~19 rows (approximately)
INSERT INTO `gymstats` (`id`, `identifier`, `stats`) VALUES
	(39, 'CWY62276', '{"energy":100,"condition":3.59999999999999,"swimming":0.0,"hygiene":55.0,"strenght":0.0}'),
	(40, 'HEU60167', '{"energy":100,"condition":4.3,"hygiene":75.0,"strenght":0.0,"swimming":0.0}'),
	(41, 'YFB89595', '{"energy":100.0,"strenght":0.0,"condition":0.0,"hygiene":100.0,"swimming":0.0}'),
	(42, 'AIM07751', '{"swimming":0.0,"strenght":0.0,"condition":0.0,"hygiene":100.0,"energy":100.0}'),
	(43, 'RZY43875', '{"energy":100,"condition":31.20999999999993,"hygiene":0,"strenght":21.88999999999998,"swimming":18.23999999999997}'),
	(44, 'HOU41578', '{"strenght":0.0,"swimming":0.0,"energy":100,"hygiene":0,"condition":47.31999999999994}'),
	(45, 'YWD50221', '{"hygiene":100.0,"strenght":0.0,"condition":0.0,"energy":100.0,"swimming":0.0}'),
	(46, 'VYV31546', '{"energy":100.0,"swimming":0.0,"hygiene":100.0,"condition":0.0,"strenght":0.0}'),
	(47, 'RDT43347', '{"strenght":0.0,"energy":100,"hygiene":0,"condition":30.15999999999999,"swimming":2.5}'),
	(48, 'STG67749', '{"strenght":0.0,"swimming":26.39999999999996,"hygiene":12.5,"condition":10.82999999999998,"energy":100}'),
	(49, 'YDT13754', '{"condition":8.4,"energy":100,"strenght":0.0,"swimming":21.59999999999998,"hygiene":0}'),
	(50, 'VIU66597', '{"hygiene":90.0,"swimming":0.0,"energy":100,"strenght":0.0,"condition":0.8}'),
	(51, 'UMV88168', '{"energy":100,"condition":50.50000000000009,"swimming":64.89999999999995,"hygiene":0,"strenght":20.09999999999998}'),
	(52, 'XVQ84862', '{"condition":0.0,"swimming":0.0,"hygiene":100.0,"strenght":0.0,"energy":100.0}'),
	(53, 'EBT98762', '{"swimming":0.0,"energy":100,"condition":0.4,"strenght":0.0,"hygiene":95.0}'),
	(54, 'LKQ99821', '{"swimming":0.0,"strenght":0.0,"energy":100,"hygiene":65.0,"condition":2.8}'),
	(55, 'ETF72063', '{"condition":0.2,"energy":100,"swimming":0.0,"strenght":0.0,"hygiene":97.5}'),
	(56, 'AEZ52818', '{"condition":0.4,"swimming":0.0,"energy":100,"strenght":0.0,"hygiene":90.0}'),
	(57, 'UYN60276', '{"energy":100.0,"swimming":0.0,"strenght":0.0,"condition":0.0,"hygiene":100.0}');

-- Dumping structure for table worldisyours.harmony_cooldown
CREATE TABLE IF NOT EXISTS `harmony_cooldown` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(25) NOT NULL,
  `metadata` text NOT NULL,
  PRIMARY KEY (`serial`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.harmony_cooldown: ~0 rows (approximately)

-- Dumping structure for table worldisyours.hastakayit
CREATE TABLE IF NOT EXISTS `hastakayit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `hasta` varchar(250) NOT NULL,
  `aciklama` varchar(250) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.hastakayit: ~0 rows (approximately)

-- Dumping structure for table worldisyours.hotel_rooms
CREATE TABLE IF NOT EXISTS `hotel_rooms` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `expire` datetime DEFAULT (current_timestamp() + interval 1 day),
  `roomlabel` varchar(45) DEFAULT NULL,
  `cardnumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.hotel_rooms: ~210 rows (approximately)
INSERT INTO `hotel_rooms` (`id`, `citizenid`, `name`, `password`, `expire`, `roomlabel`, `cardnumber`) VALUES
	(1, NULL, NULL, NULL, '2024-09-27 00:21:49', '101', NULL),
	(2, NULL, NULL, NULL, '2024-09-22 00:20:17', '102', NULL),
	(3, NULL, NULL, NULL, '2022-10-13 21:03:00', '103', NULL),
	(4, NULL, NULL, NULL, '2022-10-13 21:03:00', '104', NULL),
	(5, NULL, NULL, NULL, '2022-10-13 21:03:00', '105', NULL),
	(6, NULL, NULL, NULL, '2022-10-13 21:03:00', '106', NULL),
	(7, NULL, NULL, NULL, '2022-10-13 21:03:00', '107', NULL),
	(8, NULL, NULL, NULL, '2024-09-21 00:23:32', '108', NULL),
	(9, NULL, NULL, NULL, '2022-10-13 21:03:00', '109', NULL),
	(10, NULL, NULL, NULL, '2022-10-13 21:03:00', '110', NULL),
	(11, '', '', '', '2024-10-02 22:54:14', '111', ''),
	(12, NULL, NULL, NULL, '2022-10-13 21:03:00', '112', NULL),
	(13, NULL, NULL, NULL, '2022-10-13 21:03:00', '113', NULL),
	(14, NULL, NULL, NULL, '2022-10-13 21:03:00', '114', NULL),
	(15, NULL, NULL, NULL, '2022-10-13 21:03:00', '115', NULL),
	(16, NULL, NULL, NULL, '2022-10-13 21:03:00', '116', NULL),
	(17, NULL, NULL, NULL, '2022-10-13 21:03:00', '117', NULL),
	(18, NULL, NULL, NULL, '2022-10-13 21:03:00', '118', NULL),
	(19, NULL, NULL, NULL, '2022-10-13 21:03:00', '119', NULL),
	(20, NULL, NULL, NULL, '2022-10-13 21:03:00', '120', NULL),
	(21, NULL, NULL, NULL, '2022-10-13 21:03:00', '121', NULL),
	(22, NULL, NULL, NULL, '2022-10-13 21:03:00', '122', NULL),
	(23, NULL, NULL, NULL, '2022-10-13 21:03:00', '123', NULL),
	(24, NULL, NULL, NULL, '2022-10-13 21:03:00', '124', NULL),
	(25, NULL, NULL, NULL, '2022-10-13 21:03:00', '125', NULL),
	(26, NULL, NULL, NULL, '2022-10-13 21:03:00', '126', NULL),
	(27, NULL, NULL, NULL, '2022-10-13 21:03:00', '127', NULL),
	(28, NULL, NULL, NULL, '2022-10-13 21:03:00', '128', NULL),
	(29, NULL, NULL, NULL, '2022-10-13 21:03:00', '129', NULL),
	(30, NULL, NULL, NULL, '2022-10-13 21:03:00', '130', NULL),
	(31, NULL, NULL, NULL, '2024-09-30 00:05:54', '201', NULL),
	(32, NULL, NULL, NULL, '2022-10-13 21:03:00', '202', NULL),
	(33, NULL, NULL, NULL, '2022-10-13 21:03:00', '203', NULL),
	(34, NULL, NULL, NULL, '2022-10-13 21:03:00', '204', NULL),
	(35, NULL, NULL, NULL, '2022-10-13 21:03:00', '205', NULL),
	(36, NULL, NULL, NULL, '2022-10-13 21:03:00', '206', NULL),
	(37, NULL, NULL, NULL, '2022-10-13 21:03:00', '207', NULL),
	(38, NULL, NULL, NULL, '2022-10-13 21:03:00', '208', NULL),
	(39, NULL, NULL, NULL, '2022-10-13 21:03:00', '209', NULL),
	(40, NULL, NULL, NULL, '2022-10-13 21:03:00', '210', NULL),
	(41, NULL, NULL, NULL, '2022-10-13 21:03:00', '211', NULL),
	(42, NULL, NULL, NULL, '2022-10-13 21:03:00', '212', NULL),
	(43, NULL, NULL, NULL, '2022-10-13 21:03:00', '213', NULL),
	(44, NULL, NULL, NULL, '2022-10-13 21:03:00', '214', NULL),
	(45, NULL, NULL, NULL, '2022-10-13 21:03:00', '215', NULL),
	(46, NULL, NULL, NULL, '2022-10-13 21:03:00', '216', NULL),
	(47, NULL, NULL, NULL, '2022-10-13 21:03:00', '217', NULL),
	(48, NULL, NULL, NULL, '2022-10-13 21:03:00', '218', NULL),
	(49, NULL, NULL, NULL, '2022-10-13 21:03:00', '219', NULL),
	(50, NULL, NULL, NULL, '2022-10-13 21:03:00', '220', NULL),
	(51, NULL, NULL, NULL, '2022-10-13 21:03:00', '221', NULL),
	(52, NULL, NULL, NULL, '2022-10-13 21:03:00', '222', NULL),
	(53, NULL, NULL, NULL, '2022-10-13 21:03:00', '223', NULL),
	(54, NULL, NULL, NULL, '2022-10-13 21:03:00', '224', NULL),
	(55, NULL, NULL, NULL, '2022-10-13 21:03:00', '225', NULL),
	(56, NULL, NULL, NULL, '2022-10-13 21:03:00', '226', NULL),
	(57, NULL, NULL, NULL, '2022-10-13 21:03:00', '227', NULL),
	(58, NULL, NULL, NULL, '2022-10-13 21:03:00', '228', NULL),
	(59, NULL, NULL, NULL, '2022-10-13 21:03:00', '229', NULL),
	(60, NULL, NULL, NULL, '2022-10-13 21:03:00', '230', NULL),
	(61, NULL, NULL, NULL, '2022-10-13 21:03:00', '301', NULL),
	(62, NULL, NULL, NULL, '2022-10-13 21:03:00', '302', NULL),
	(63, NULL, NULL, NULL, '2022-10-13 21:03:00', '303', NULL),
	(64, NULL, NULL, NULL, '2022-10-13 21:03:00', '304', NULL),
	(65, NULL, NULL, NULL, '2022-10-13 21:03:00', '305', NULL),
	(66, NULL, NULL, NULL, '2022-10-13 21:03:00', '306', NULL),
	(67, NULL, NULL, NULL, '2022-10-13 21:03:00', '307', NULL),
	(68, NULL, NULL, NULL, '2022-10-13 21:03:00', '308', NULL),
	(69, NULL, NULL, NULL, '2022-10-13 21:03:00', '309', NULL),
	(70, NULL, NULL, NULL, '2022-10-13 21:03:00', '310', NULL),
	(71, NULL, NULL, NULL, '2022-10-13 21:03:00', '311', NULL),
	(72, NULL, NULL, NULL, '2022-10-13 21:03:00', '312', NULL),
	(73, NULL, NULL, NULL, '2022-10-13 21:03:00', '313', NULL),
	(74, NULL, NULL, NULL, '2022-10-13 21:03:00', '314', NULL),
	(75, NULL, NULL, NULL, '2022-10-13 21:03:00', '315', NULL),
	(76, NULL, NULL, NULL, '2022-10-13 21:03:00', '316', NULL),
	(77, NULL, NULL, NULL, '2022-10-13 21:03:00', '317', NULL),
	(78, NULL, NULL, NULL, '2022-10-13 21:03:00', '318', NULL),
	(79, NULL, NULL, NULL, '2022-10-13 21:03:00', '319', NULL),
	(80, NULL, NULL, NULL, '2022-10-13 21:03:00', '320', NULL),
	(81, NULL, NULL, NULL, '2022-10-13 21:03:00', '321', NULL),
	(82, NULL, NULL, NULL, '2022-10-13 21:03:00', '322', NULL),
	(83, NULL, NULL, NULL, '2022-10-13 21:03:00', '323', NULL),
	(84, NULL, NULL, NULL, '2022-10-13 21:03:00', '324', NULL),
	(85, NULL, NULL, NULL, '2022-10-13 21:03:00', '325', NULL),
	(86, NULL, NULL, NULL, '2022-10-13 21:03:00', '326', NULL),
	(87, NULL, NULL, NULL, '2022-10-13 21:03:00', '327', NULL),
	(88, NULL, NULL, NULL, '2022-10-13 21:03:00', '328', NULL),
	(89, NULL, NULL, NULL, '2022-10-13 21:03:00', '329', NULL),
	(90, NULL, NULL, NULL, '2022-10-13 21:03:00', '330', NULL),
	(91, NULL, NULL, NULL, '2022-10-13 21:03:00', '401', NULL),
	(92, NULL, NULL, NULL, '2022-10-13 21:03:00', '402', NULL),
	(93, NULL, NULL, NULL, '2022-10-13 21:03:00', '403', NULL),
	(94, NULL, NULL, NULL, '2022-10-13 21:03:00', '404', NULL),
	(95, NULL, NULL, NULL, '2022-10-13 21:03:00', '405', NULL),
	(96, NULL, NULL, NULL, '2022-10-13 21:03:00', '406', NULL),
	(97, NULL, NULL, NULL, '2022-10-13 21:03:00', '407', NULL),
	(98, NULL, NULL, NULL, '2022-10-13 21:03:00', '408', NULL),
	(99, NULL, NULL, NULL, '2022-10-13 21:03:00', '409', NULL),
	(100, NULL, NULL, NULL, '2022-10-13 21:03:00', '410', NULL),
	(101, NULL, NULL, NULL, '2022-10-13 21:03:00', '411', NULL),
	(102, NULL, NULL, NULL, '2022-10-13 21:03:00', '412', NULL),
	(103, NULL, NULL, NULL, '2022-10-13 21:03:00', '413', NULL),
	(104, NULL, NULL, NULL, '2022-10-13 21:03:00', '414', NULL),
	(105, NULL, NULL, NULL, '2022-10-13 21:03:00', '415', NULL),
	(106, NULL, NULL, NULL, '2022-10-13 21:03:00', '416', NULL),
	(107, NULL, NULL, NULL, '2022-10-13 21:03:00', '417', NULL),
	(108, NULL, NULL, NULL, '2022-10-13 21:03:00', '418', NULL),
	(109, NULL, NULL, NULL, '2022-10-13 21:03:00', '419', NULL),
	(110, NULL, NULL, NULL, '2022-10-13 21:03:00', '420', NULL),
	(111, NULL, NULL, NULL, '2022-10-13 21:03:00', '421', NULL),
	(112, NULL, NULL, NULL, '2022-10-13 21:03:00', '422', NULL),
	(113, NULL, NULL, NULL, '2022-10-13 21:03:00', '423', NULL),
	(114, NULL, NULL, NULL, '2022-10-13 21:03:00', '424', NULL),
	(115, NULL, NULL, NULL, '2022-10-13 21:03:00', '425', NULL),
	(116, NULL, NULL, NULL, '2022-10-13 21:03:00', '426', NULL),
	(117, NULL, NULL, NULL, '2022-10-13 21:03:00', '427', NULL),
	(118, NULL, NULL, NULL, '2022-10-13 21:03:00', '428', NULL),
	(119, NULL, NULL, NULL, '2022-10-13 21:03:00', '429', NULL),
	(120, NULL, NULL, NULL, '2022-10-13 21:03:00', '430', NULL),
	(121, NULL, NULL, NULL, '2022-10-13 21:03:00', '501', NULL),
	(122, NULL, NULL, NULL, '2022-10-13 21:03:00', '502', NULL),
	(123, NULL, NULL, NULL, '2022-10-13 21:03:00', '503', NULL),
	(124, NULL, NULL, NULL, '2022-10-13 21:03:00', '504', NULL),
	(125, NULL, NULL, NULL, '2022-10-13 21:03:00', '505', NULL),
	(126, NULL, NULL, NULL, '2022-10-13 21:03:00', '506', NULL),
	(127, NULL, NULL, NULL, '2022-10-13 21:03:00', '507', NULL),
	(128, NULL, NULL, NULL, '2022-10-13 21:03:00', '508', NULL),
	(129, NULL, NULL, NULL, '2022-10-13 21:03:00', '509', NULL),
	(130, NULL, NULL, NULL, '2022-10-13 21:03:00', '510', NULL),
	(131, NULL, NULL, NULL, '2022-10-13 21:03:00', '511', NULL),
	(132, NULL, NULL, NULL, '2022-10-13 21:03:00', '512', NULL),
	(133, NULL, NULL, NULL, '2022-10-13 21:03:00', '513', NULL),
	(134, NULL, NULL, NULL, '2022-10-13 21:03:00', '514', NULL),
	(135, NULL, NULL, NULL, '2022-10-13 21:03:00', '515', NULL),
	(136, NULL, NULL, NULL, '2022-10-13 21:03:00', '516', NULL),
	(137, NULL, NULL, NULL, '2022-10-13 21:03:00', '517', NULL),
	(138, NULL, NULL, NULL, '2022-10-13 21:03:00', '518', NULL),
	(139, NULL, NULL, NULL, '2022-10-13 21:03:00', '519', NULL),
	(140, NULL, NULL, NULL, '2022-10-13 21:03:00', '520', NULL),
	(141, NULL, NULL, NULL, '2022-10-13 21:03:00', '521', NULL),
	(142, NULL, NULL, NULL, '2022-10-13 21:03:00', '522', NULL),
	(143, NULL, NULL, NULL, '2022-10-13 21:03:00', '523', NULL),
	(144, NULL, NULL, NULL, '2022-10-13 21:03:00', '524', NULL),
	(145, NULL, NULL, NULL, '2022-10-13 21:03:00', '525', NULL),
	(146, NULL, NULL, NULL, '2022-10-13 21:03:00', '526', NULL),
	(147, NULL, NULL, NULL, '2022-10-13 21:03:00', '527', NULL),
	(148, NULL, NULL, NULL, '2022-10-13 21:03:00', '528', NULL),
	(149, NULL, NULL, NULL, '2022-10-13 21:03:00', '529', NULL),
	(150, NULL, NULL, NULL, '2022-10-13 21:03:00', '530', NULL),
	(151, NULL, NULL, NULL, '2022-10-13 21:03:00', '601', NULL),
	(152, NULL, NULL, NULL, '2022-10-13 21:03:00', '602', NULL),
	(153, NULL, NULL, NULL, '2022-10-13 21:03:00', '603', NULL),
	(154, NULL, NULL, NULL, '2022-10-13 21:03:00', '604', NULL),
	(155, NULL, NULL, NULL, '2022-10-13 21:03:00', '605', NULL),
	(156, NULL, NULL, NULL, '2022-10-13 21:03:00', '606', NULL),
	(157, NULL, NULL, NULL, '2022-10-13 21:03:00', '607', NULL),
	(158, NULL, NULL, NULL, '2022-10-13 21:03:00', '608', NULL),
	(159, NULL, NULL, NULL, '2022-10-13 21:03:00', '609', NULL),
	(160, NULL, NULL, NULL, '2022-10-13 21:03:00', '610', NULL),
	(161, NULL, NULL, NULL, '2022-10-13 21:03:00', '611', NULL),
	(162, NULL, NULL, NULL, '2022-10-13 21:03:00', '612', NULL),
	(163, NULL, NULL, NULL, '2022-10-13 21:03:00', '613', NULL),
	(164, NULL, NULL, NULL, '2022-10-13 21:03:00', '614', NULL),
	(165, NULL, NULL, NULL, '2022-10-13 21:03:00', '615', NULL),
	(166, NULL, NULL, NULL, '2022-10-13 21:03:00', '616', NULL),
	(167, NULL, NULL, NULL, '2022-10-13 21:03:00', '617', NULL),
	(168, NULL, NULL, NULL, '2022-10-13 21:03:00', '618', NULL),
	(169, NULL, NULL, NULL, '2022-10-13 21:03:00', '619', NULL),
	(170, NULL, NULL, NULL, '2022-10-13 21:03:00', '620', NULL),
	(171, NULL, NULL, NULL, '2022-10-13 21:03:00', '621', NULL),
	(172, NULL, NULL, NULL, '2022-10-13 21:03:00', '622', NULL),
	(173, NULL, NULL, NULL, '2022-10-13 21:03:00', '623', NULL),
	(174, NULL, NULL, NULL, '2022-10-13 21:03:00', '624', NULL),
	(175, NULL, NULL, NULL, '2022-10-13 21:03:00', '625', NULL),
	(176, NULL, NULL, NULL, '2022-10-13 21:03:00', '626', NULL),
	(177, NULL, NULL, NULL, '2022-10-13 21:03:00', '627', NULL),
	(178, NULL, NULL, NULL, '2022-10-13 21:03:00', '628', NULL),
	(179, NULL, NULL, NULL, '2022-10-13 21:03:00', '629', NULL),
	(180, NULL, NULL, NULL, '2022-10-13 21:03:00', '630', NULL),
	(181, NULL, NULL, NULL, '2024-10-01 06:48:33', '701', NULL),
	(182, NULL, NULL, NULL, '2022-10-13 21:03:00', '702', NULL),
	(183, NULL, NULL, NULL, '2022-10-13 21:03:00', '703', NULL),
	(184, NULL, NULL, NULL, '2022-10-13 21:03:00', '704', NULL),
	(185, NULL, NULL, NULL, '2022-10-13 21:03:00', '705', NULL),
	(186, NULL, NULL, NULL, '2022-10-13 21:03:00', '706', NULL),
	(187, NULL, NULL, NULL, '2022-10-13 21:03:00', '707', NULL),
	(188, NULL, NULL, NULL, '2022-10-13 21:03:00', '708', NULL),
	(189, NULL, NULL, NULL, '2022-10-13 21:03:00', '709', NULL),
	(190, NULL, NULL, NULL, '2022-10-13 21:03:00', '710', NULL),
	(191, NULL, NULL, NULL, '2022-10-13 21:03:00', '711', NULL),
	(192, NULL, NULL, NULL, '2022-10-13 21:03:00', '712', NULL),
	(193, NULL, NULL, NULL, '2022-10-13 21:03:00', '713', NULL),
	(194, NULL, NULL, NULL, '2022-10-13 21:03:00', '714', NULL),
	(195, NULL, NULL, NULL, '2022-10-13 21:03:00', '715', NULL),
	(196, NULL, NULL, NULL, '2022-10-13 21:03:00', '716', NULL),
	(197, NULL, NULL, NULL, '2022-10-13 21:03:00', '717', NULL),
	(198, NULL, NULL, NULL, '2022-10-13 21:03:00', '718', NULL),
	(199, NULL, NULL, NULL, '2022-10-13 21:03:00', '719', NULL),
	(200, NULL, NULL, NULL, '2022-10-13 21:03:00', '720', NULL),
	(201, NULL, NULL, NULL, '2022-10-13 21:03:00', '721', NULL),
	(202, NULL, NULL, NULL, '2022-10-13 21:03:00', '722', NULL),
	(203, NULL, NULL, NULL, '2022-10-13 21:03:00', '723', NULL),
	(204, NULL, NULL, NULL, '2022-10-13 21:03:00', '724', NULL),
	(205, NULL, NULL, NULL, '2022-10-13 21:03:00', '725', NULL),
	(206, NULL, NULL, NULL, '2022-10-13 21:03:00', '726', NULL),
	(207, NULL, NULL, NULL, '2022-10-13 21:03:00', '727', NULL),
	(208, NULL, NULL, NULL, '2022-10-13 21:03:00', '728', NULL),
	(209, NULL, NULL, NULL, '2022-10-13 21:03:00', '729', NULL),
	(210, NULL, NULL, NULL, '2022-10-13 21:03:00', '730', NULL);

-- Dumping structure for table worldisyours.hottubs
CREATE TABLE IF NOT EXISTS `hottubs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `coords` varchar(255) NOT NULL,
  `rotation` varchar(255) NOT NULL,
  `stairs` tinyint(1) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table worldisyours.hottubs: ~0 rows (approximately)

-- Dumping structure for table worldisyours.houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(2) DEFAULT NULL,
  `houseID` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` text DEFAULT NULL,
  `garage` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `mlo` text DEFAULT NULL,
  `ipl` text DEFAULT NULL,
  `garageShell` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.houselocations: ~1 rows (approximately)

-- Dumping structure for table worldisyours.house_objects
CREATE TABLE IF NOT EXISTS `house_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) NOT NULL DEFAULT '0',
  `coords` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table worldisyours.house_objects: ~0 rows (approximately)

-- Dumping structure for table worldisyours.house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB AUTO_INCREMENT=7123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.house_plants: ~0 rows (approximately)

-- Dumping structure for table worldisyours.house_rents
CREATE TABLE IF NOT EXISTS `house_rents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL DEFAULT '',
  `identifier` varchar(80) NOT NULL DEFAULT '',
  `payed` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.house_rents: ~0 rows (approximately)

-- Dumping structure for table worldisyours.instagram_account
CREATE TABLE IF NOT EXISTS `instagram_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.instagram_account: ~0 rows (approximately)

-- Dumping structure for table worldisyours.instagram_followers
CREATE TABLE IF NOT EXISTS `instagram_followers` (
  `username` varchar(50) NOT NULL,
  `followed` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.instagram_followers: ~0 rows (approximately)

-- Dumping structure for table worldisyours.instagram_posts
CREATE TABLE IF NOT EXISTS `instagram_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `location` varchar(50) NOT NULL DEFAULT 'Los Santos',
  `filter` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.instagram_posts: ~0 rows (approximately)

-- Dumping structure for table worldisyours.instagram_stories
CREATE TABLE IF NOT EXISTS `instagram_stories` (
  `owner` varchar(50) NOT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table worldisyours.instagram_stories: ~0 rows (approximately)

-- Dumping structure for table worldisyours.insta_stories
CREATE TABLE IF NOT EXISTS `insta_stories` (
  `username` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.insta_stories: ~0 rows (approximately)

-- Dumping structure for table worldisyours.inventories
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `items` longtext DEFAULT '[]',
  PRIMARY KEY (`identifier`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.inventories: ~0 rows (approximately)

-- Dumping structure for table worldisyours.keep_bags_retrieval
CREATE TABLE IF NOT EXISTS `keep_bags_retrieval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `characterId` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `available_at` datetime NOT NULL,
  `expire_at` datetime NOT NULL,
  `metadata` text DEFAULT NULL,
  `claimed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `characterId` (`characterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.keep_bags_retrieval: ~0 rows (approximately)

-- Dumping structure for table worldisyours.kq_extra
CREATE TABLE IF NOT EXISTS `kq_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(256) DEFAULT '0',
  `tag` varchar(50) DEFAULT '0',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.kq_extra: ~0 rows (approximately)

-- Dumping structure for table worldisyours.lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.lapraces: ~0 rows (approximately)

-- Dumping structure for table worldisyours.lation_detecting
CREATE TABLE IF NOT EXISTS `lation_detecting` (
  `identifier` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `experience` int(11) NOT NULL,
  `items_found` int(11) NOT NULL,
  `money_earned` int(11) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.lation_detecting: ~1 rows (approximately)
INSERT INTO `lation_detecting` (`identifier`, `level`, `experience`, `items_found`, `money_earned`) VALUES
	('HEU60167', 1, 0, 0, 0);

-- Dumping structure for table worldisyours.lunar_contracts
CREATE TABLE IF NOT EXISTS `lunar_contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext DEFAULT NULL,
  `extra_data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.lunar_contracts: ~0 rows (approximately)

-- Dumping structure for table worldisyours.lunar_contracts_profiles
CREATE TABLE IF NOT EXISTS `lunar_contracts_profiles` (
  `identifier` varchar(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `firstLogin` int(11) DEFAULT NULL,
  `completedContracts` int(11) DEFAULT NULL,
  `lastActive` int(11) DEFAULT NULL,
  `crypto` int(11) DEFAULT NULL,
  `xp` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.lunar_contracts_profiles: ~3 rows (approximately)
INSERT INTO `lunar_contracts_profiles` (`identifier`, `username`, `image`, `firstLogin`, `completedContracts`, `lastActive`, `crypto`, `xp`) VALUES
	('CWY62276', 'Mr_Dx', NULL, 1730351453, 0, 1730994809, 80, 0),
	('HEU60167', 'Anonymous #76710', NULL, 1730349527, 0, 1730349527, 100, 0),
	('HOU41578', 'Anonymous #67580', NULL, 1730426690, 2, 1730581756, 87, 250),
	('RDT43347', 'Anonymous #57554', NULL, 1730542530, 2, 1730581756, 137, 250);

-- Dumping structure for table worldisyours.multijobs
CREATE TABLE IF NOT EXISTS `multijobs` (
  `citizenid` varchar(100) NOT NULL,
  `jobdata` text DEFAULT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.multijobs: ~11 rows (approximately)
INSERT INTO `multijobs` (`citizenid`, `jobdata`) VALUES
	('CWY62276', '{"ambulance":4,"police":1,"wiydealership":4}'),
	('EBT98762', '{"police":0,"kittys":0,"bcso":10}'),
	('ETF72063', '{"garbage":0,"trucker":0}'),
	('HEU60167', '{"wiydealership":4,"kittys":5,"burgershot":4}'),
	('HOU41578', '{"emergencydealership":4,"kittys":3,"wiydealership":4}'),
	('RDT43347', '{"kittys":4,"lspd":3,"wiydealership":4}'),
	('RZY43875', '{"ss":10}'),
	('STG67749', '{"wiydealership":4}'),
	('UMV88168', '{"lspd":10,"mosleys":4,"emergencydealership":4}'),
	('XVQ84862', '{"kittys":5}'),
	('YDT13754', '{"sahp":10,"police":0}');

-- Dumping structure for table worldisyours.m_insurance_health
CREATE TABLE IF NOT EXISTS `m_insurance_health` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `creation_date` datetime NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.m_insurance_health: ~0 rows (approximately)

-- Dumping structure for table worldisyours.m_insurance_home
CREATE TABLE IF NOT EXISTS `m_insurance_home` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `creation_date` datetime NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.m_insurance_home: ~0 rows (approximately)

-- Dumping structure for table worldisyours.m_insurance_registration
CREATE TABLE IF NOT EXISTS `m_insurance_registration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plate` varchar(20) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `registration` int(11) NOT NULL DEFAULT 0,
  `citizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.m_insurance_registration: ~7 rows (approximately)
INSERT INTO `m_insurance_registration` (`id`, `plate`, `model`, `registration`, `citizenid`) VALUES
	(10, '69IUD384', 'polheli', 1, 'RZY43875'),
	(11, 'RC12HY34', 'ramleg', 1, 'RZY43875'),
	(12, 'XU01NT15', 'DChargerUM', 1, 'YDT13754'),
	(13, '87NJN938', 'Mercedes-Be', 1, 'UMV88168'),
	(14, 'RZ56TS15', 'vanzhycade', 1, 'HEU60167'),
	(15, '47JEN328', 'FROGGER', 1, 'STG67749'),
	(16, '83UUL306', 'ramtrx6x6', 1, 'STG67749');

-- Dumping structure for table worldisyours.m_insurance_vehicles
CREATE TABLE IF NOT EXISTS `m_insurance_vehicles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plate` varchar(20) NOT NULL,
  `creation_date` datetime NOT NULL,
  `expire_date` datetime NOT NULL,
  `model` varchar(50) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.m_insurance_vehicles: ~7 rows (approximately)
INSERT INTO `m_insurance_vehicles` (`id`, `plate`, `creation_date`, `expire_date`, `model`, `citizenid`) VALUES
	(9, '69IUD384', '2024-11-02 18:25:30', '2025-01-31 17:25:30', 'polheli', 'RZY43875'),
	(10, 'RC12HY34', '2024-11-06 19:03:32', '2025-02-04 19:03:32', 'ramleg', 'RZY43875'),
	(11, 'XU01NT15', '2024-11-06 19:05:29', '2025-02-04 19:05:29', 'DChargerUM', 'YDT13754'),
	(12, '87NJN938', '2024-11-08 21:05:41', '2025-02-06 21:05:41', 'Mercedes-Be', 'UMV88168'),
	(13, 'RZ56TS15', '2024-11-10 09:46:26', '2025-02-08 09:46:26', 'vanzhycade', 'HEU60167'),
	(14, '47JEN328', '2024-11-10 10:47:11', '2025-02-08 10:47:11', 'FROGGER', 'STG67749'),
	(15, '83UUL306', '2024-11-10 22:48:27', '2025-02-08 22:48:27', 'ramtrx6x6', 'STG67749');

-- Dumping structure for table worldisyours.objects
CREATE TABLE IF NOT EXISTS `objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.objects: ~2 rows (approximately)
INSERT INTO `objects` (`id`, `list`) VALUES
	(1, '[]'),
	(2, 'ignore');

-- Dumping structure for table worldisyours.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.occasion_vehicles: ~1 rows (approximately)

-- Dumping structure for table worldisyours.okokbanking_societies
CREATE TABLE IF NOT EXISTS `okokbanking_societies` (
  `society` varchar(255) DEFAULT NULL,
  `society_name` varchar(255) DEFAULT NULL,
  `value` int(50) DEFAULT NULL,
  `iban` varchar(255) NOT NULL,
  `is_withdrawing` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.okokbanking_societies: ~0 rows (approximately)

-- Dumping structure for table worldisyours.okokbanking_transactions
CREATE TABLE IF NOT EXISTS `okokbanking_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_identifier` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `sender_identifier` varchar(255) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `value` int(50) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.okokbanking_transactions: ~0 rows (approximately)

-- Dumping structure for table worldisyours.outdoor_plants
CREATE TABLE IF NOT EXISTS `outdoor_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL,
  `strain` varchar(255) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `hunger` double NOT NULL,
  `thirst` double NOT NULL,
  `quality` double NOT NULL,
  `growth` double NOT NULL,
  `growthrate` int(11) NOT NULL,
  `degrade` int(11) NOT NULL,
  `coords` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.outdoor_plants: ~0 rows (approximately)

-- Dumping structure for table worldisyours.owned_gyms
CREATE TABLE IF NOT EXISTS `owned_gyms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(500) NOT NULL,
  `gymid` int(11) NOT NULL,
  `gymprice` int(11) NOT NULL,
  `gymbalance` int(11) NOT NULL,
  `gymvisitorsdata` longtext NOT NULL,
  `gymclosed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table worldisyours.owned_gyms: ~0 rows (approximately)

-- Dumping structure for table worldisyours.ox_doorlock
CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=884 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ox_doorlock: ~56 rows (approximately)
INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
	(1, 'jewellery_stores jewellery-citymain', '{"coords":{"x":-631.19091796875,"y":-237.38540649414063,"z":38.2065315246582},"state":1,"doors":[{"model":9467943,"heading":306,"coords":{"x":-630.426513671875,"y":-238.4375457763672,"z":38.2065315246582}},{"model":1425919976,"heading":306,"coords":{"x":-631.9553833007813,"y":-236.33326721191407,"z":38.2065315246582}}],"groups":{"police":0},"maxDistance":2}'),
	(2, 'jewellery_stores jewellery-citysec', '{"coords":{"x":-629.1338500976563,"y":-230.15170288085938,"z":38.20658493041992},"state":1,"doors":false,"heading":36,"model":1335309163,"groups":{"police":0},"maxDistance":2}'),
	(3, 'jewellery_stores jewellery-grapemain', '{"coords":{"x":1653.470458984375,"y":4882.861328125,"z":42.30984497070312},"state":1,"doors":[{"model":9467943,"heading":98,"coords":{"x":1653.2855224609376,"y":4884.1484375,"z":42.30984497070312}},{"model":1425919976,"heading":98,"coords":{"x":1653.655517578125,"y":4881.57373046875,"z":42.30984497070312}}],"groups":{"police":0},"maxDistance":2}'),
	(4, 'jewellery_stores jewellery-grapesec', '{"coords":{"x":1648.27490234375,"y":4877.42333984375,"z":42.30989837646484},"state":1,"doors":false,"heading":188,"model":1335309163,"groups":{"police":0},"maxDistance":2}'),
	(5, 'jewellery_stores jewellery-palmain', '{"coords":{"x":-382.9197692871094,"y":6043.1376953125,"z":31.65892028808593},"state":1,"doors":[{"model":9467943,"heading":315,"coords":{"x":-382.0016174316406,"y":6042.216796875,"z":31.65892028808593}},{"model":1425919976,"heading":315,"coords":{"x":-383.8379211425781,"y":6044.05908203125,"z":31.65892028808593}}],"groups":{"police":0},"maxDistance":2}'),
	(6, 'jewellery_stores jewellery-palsec', '{"coords":{"x":-382.0077209472656,"y":6050.60302734375,"z":31.65897369384765},"state":1,"doors":false,"heading":45,"model":1335309163,"groups":{"police":0},"maxDistance":2}'),
	(32, 'PD_1', '{"maxDistance":2,"doorRate":1.1,"doors":[{"model":-1547307588,"heading":90,"coords":{"x":434.74444580078127,"y":-983.078125,"z":30.81530380249023}},{"model":-1547307588,"heading":270,"coords":{"x":434.74444580078127,"y":-980.7555541992188,"z":30.81530380249023}}],"state":1,"coords":{"x":434.74444580078127,"y":-981.9168701171875,"z":30.81530380249023},"groups":{"police":0,"ambulance":0}}'),
	(33, 'PD_2', '{"maxDistance":2,"model":-96679321,"doors":false,"state":1,"coords":{"x":440.52008056640627,"y":-986.2334594726563,"z":30.82319259643554},"heading":180,"groups":{"police":0,"ambulance":0}}'),
	(34, 'PD_3', '{"maxDistance":2,"model":-1406685646,"doors":false,"state":1,"coords":{"x":440.52008056640627,"y":-977.60107421875,"z":30.82319259643554},"heading":0,"groups":{"police":0,"ambulance":0}}'),
	(35, 'PD_4', '{"maxDistance":2,"doors":[{"model":-288803980,"heading":90,"coords":{"x":469.44061279296877,"y":-987.4376831054688,"z":30.82319259643554}},{"model":-288803980,"heading":270,"coords":{"x":469.44061279296877,"y":-985.0313110351563,"z":30.82319259643554}}],"state":1,"coords":{"x":469.44061279296877,"y":-986.2344970703125,"z":30.82319259643554},"groups":{"police":0}}'),
	(36, 'PD_5', '{"maxDistance":2,"model":-692649124,"doors":false,"state":1,"coords":{"x":479.750732421875,"y":-999.6290283203125,"z":30.7891674041748},"heading":90,"groups":{"police":0}}'),
	(37, 'PD_6', '{"maxDistance":2,"doors":[{"model":-1547307588,"heading":180,"coords":{"x":458.208740234375,"y":-972.2542724609375,"z":30.8153076171875}},{"model":-1547307588,"heading":0,"coords":{"x":455.88616943359377,"y":-972.2542724609375,"z":30.8153076171875}}],"state":1,"coords":{"x":457.0474548339844,"y":-972.2542724609375,"z":30.8153076171875},"groups":{"police":0}}'),
	(38, 'PD_7', '{"maxDistance":2,"model":1830360419,"doors":false,"state":1,"coords":{"x":464.1590576171875,"y":-974.6655883789063,"z":26.3707046508789},"heading":270,"groups":{"police":0}}'),
	(39, 'PD_8', '{"maxDistance":2,"model":1830360419,"doors":false,"state":1,"coords":{"x":464.15655517578127,"y":-997.50927734375,"z":26.3707046508789},"heading":90,"groups":{"police":0}}'),
	(40, 'PD_9', '{"maxDistance":3,"doors":[{"model":-692649124,"heading":0,"coords":{"x":467.3686218261719,"y":-1014.406005859375,"z":26.48381614685058}},{"model":-692649124,"heading":180,"coords":{"x":469.7742614746094,"y":-1014.406005859375,"z":26.48381614685058}}],"state":1,"coords":{"x":468.5714416503906,"y":-1014.406005859375,"z":26.48381614685058},"groups":{"police":0}}'),
	(41, 'PD_10', '{"maxDistance":1.5,"doors":[{"model":149284793,"heading":90,"coords":{"x":471.3758239746094,"y":-1010.1978759765625,"z":26.40548324584961}},{"model":149284793,"heading":270,"coords":{"x":471.36785888671877,"y":-1007.7933959960938,"z":26.40548324584961}}],"state":1,"coords":{"x":471.371826171875,"y":-1008.99560546875,"z":26.40548324584961},"groups":{"police":0}}'),
	(42, 'PD_11', '{"maxDistance":1.5,"model":-53345114,"doors":false,"state":1,"coords":{"x":476.6156921386719,"y":-1008.8754272460938,"z":26.48005485534668},"heading":270,"groups":{"police":0}}'),
	(43, 'cell1', '{"maxDistance":1,"model":-53345114,"doors":false,"state":1,"coords":{"x":481.00836181640627,"y":-1004.1179809570313,"z":26.48005485534668},"heading":180,"groups":{"police":0}}'),
	(44, 'cell2', '{"maxDistance":1,"model":-53345114,"doors":false,"state":1,"coords":{"x":484.1764221191406,"y":-1007.734375,"z":26.48005485534668},"heading":180,"groups":{"police":0}}'),
	(45, 'cell3', '{"maxDistance":2,"model":-53345114,"auto":true,"doors":false,"state":1,"coords":{"x":486.9131164550781,"y":-1012.1886596679688,"z":26.48005485534668},"heading":0,"groups":{"police":0}}'),
	(46, 'cell4', '{"maxDistance":1.5,"model":-53345114,"auto":true,"doors":false,"state":1,"coords":{"x":483.9127197265625,"y":-1012.1886596679688,"z":26.48005485534668},"heading":0,"groups":{"police":0}}'),
	(47, 'cell5', '{"maxDistance":1,"model":-53345114,"doors":false,"state":1,"coords":{"x":480.9128112792969,"y":-1012.1886596679688,"z":26.48005485534668},"heading":0,"groups":{"police":0}}'),
	(48, 'cell6', '{"maxDistance":1,"model":-53345114,"doors":false,"state":1,"coords":{"x":477.91259765625,"y":-1012.1886596679688,"z":26.48005485534668},"heading":0,"groups":{"police":0}}'),
	(49, 'garage1', '{"maxDistance":7,"model":2130672747,"auto":true,"doors":false,"state":1,"coords":{"x":452.3005065917969,"y":-1000.7716674804688,"z":26.69660949707031},"heading":0,"groups":{"police":0}}'),
	(50, 'garage2', '{"maxDistance":7,"model":2130672747,"auto":true,"doors":false,"state":1,"coords":{"x":431.41192626953127,"y":-1000.7716674804688,"z":26.69660949707031},"heading":0,"groups":{"police":0}}'),
	(51, 'front1', '{"maxDistance":5,"model":-1868050792,"doors":false,"state":1,"coords":{"x":410.0257873535156,"y":-1024.2259521484376,"z":29.2202205657959},"heading":270,"groups":{"police":0}}'),
	(52, 'frontgate2', '{"maxDistance":5,"model":-1635161509,"doors":false,"state":1,"coords":{"x":410.0257873535156,"y":-1024.219970703125,"z":29.22019958496093},"heading":270,"groups":{"police":0}}'),
	(53, 'backgarage', '{"maxDistance":7,"model":-1603817716,"doors":false,"state":1,"coords":{"x":488.8948059082031,"y":-1017.2119750976563,"z":27.14934921264648},"heading":90,"groups":{"police":0}}'),
	(61, 'pilbox1', '{"coords":{"x":-440.6439208984375,"y":-321.7954406738281,"z":35.06683349609375},"doorRate":1,"heading":293,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(63, 'ems3', '{"coords":{"x":-442.5889892578125,"y":-317.0564270019531,"z":35.06619262695312},"doorRate":1,"heading":112,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(64, 'ems4', '{"coords":{"x":-448.6458435058594,"y":-316.0326232910156,"z":35.06632232666015},"doorRate":1,"heading":292,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(65, 'ems5', '{"coords":{"x":-449.22491455078127,"y":-314.634033203125,"z":35.06632232666015},"doorRate":1,"heading":112,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(66, 'ems6', '{"coords":{"x":-451.474609375,"y":-309.0658264160156,"z":35.06632232666015},"doorRate":1,"heading":112,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(67, 'ems7', '{"coords":{"x":-447.341796875,"y":-305.49908447265627,"z":35.07070922851562},"doorRate":1,"heading":292,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(68, 'ems8', '{"coords":{"x":-452.70513916015627,"y":-306.0628967285156,"z":35.06632232666015},"doorRate":1,"heading":112,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(69, 'ems9', '{"coords":{"x":-449.6571960449219,"y":-299.8382873535156,"z":35.07070922851562},"doorRate":1,"heading":292,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(70, 'ems10', '{"coords":{"x":-454.9653015136719,"y":-300.55145263671877,"z":35.06632232666015},"doorRate":1,"heading":112,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(71, 'ems11', '{"coords":{"x":-453.0472106933594,"y":-291.5856018066406,"z":35.06544494628906},"doorRate":1,"heading":292,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(72, 'ems11', '{"coords":{"x":-457.1219787597656,"y":-295.3081970214844,"z":35.06632232666015},"doorRate":1,"heading":112,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(73, 'ems11', '{"coords":{"x":-457.01513671875,"y":-288.7811279296875,"z":35.06948852539062},"doorRate":2,"groups":{"police":0,"ambulance":0},"doors":[{"model":665455406,"heading":202,"coords":{"x":-455.8128356933594,"y":-288.2953796386719,"z":35.06948852539062}},{"model":665455406,"heading":22,"coords":{"x":-458.2174072265625,"y":-289.26690673828127,"z":35.06948852539062}}],"state":0,"maxDistance":2}'),
	(74, 'ems12', '{"coords":{"x":-500.5936279296875,"y":-325.24713134765627,"z":42.46982955932617},"doorRate":2,"groups":{"ambulance":0},"doors":[{"model":873979204,"heading":185,"coords":{"x":-499.2977294921875,"y":-325.1405944824219,"z":42.46982955932617}},{"model":873979204,"heading":5,"coords":{"x":-501.8894958496094,"y":-325.3536682128906,"z":42.46982955932617}}],"state":1,"maxDistance":2}'),
	(75, 'ems13', '{"coords":{"x":-495.837646484375,"y":-333.49407958984377,"z":69.67925262451172},"doorRate":2,"groups":{"ambulance":0},"doors":[{"model":665455406,"heading":262,"coords":{"x":-495.6571350097656,"y":-332.2098693847656,"z":69.67925262451172}},{"model":665455406,"heading":82,"coords":{"x":-496.01812744140627,"y":-334.7782897949219,"z":69.67925262451172}}],"state":1,"maxDistance":2}'),
	(76, 'pd_12', '{"coords":{"x":441.9004821777344,"y":-998.7462158203125,"z":30.81530380249023},"state":1,"maxDistance":2,"doorRate":3,"groups":{"police":0},"doors":[{"coords":{"x":443.061767578125,"y":-998.7462158203125,"z":30.81530380249023},"heading":180,"model":-1547307588},{"coords":{"x":440.73919677734377,"y":-998.7462158203125,"z":30.81530380249023},"heading":0,"model":-1547307588}]}'),
	(864, 'catcafe1', '{"doors":[{"coords":{"x":-580.361083984375,"y":-1069.627197265625,"z":22.48974800109863},"model":-69331849,"heading":0},{"coords":{"x":-581.6677856445313,"y":-1069.627197265625,"z":22.48974800109863},"model":526179188,"heading":0}],"maxDistance":2,"coords":{"x":-581.014404296875,"y":-1069.627197265625,"z":22.48974800109863},"groups":{"catcafe":0},"state":1,"doorRate":2}'),
	(865, 'catcafe2', '{"doors":false,"maxDistance":2,"model":-1283712428,"coords":{"x":-587.3400268554688,"y":-1051.8994140625,"z":22.41300582885742},"groups":{"catcafe":0},"heading":90,"state":1,"doorRate":1}'),
	(866, 'catcafe3', '{"doors":false,"maxDistance":2,"model":1099436502,"coords":{"x":-600.8886108398438,"y":-1055.1314697265626,"z":22.71302795410156},"groups":{"catcafe":0},"heading":270,"state":1,"doorRate":1}'),
	(867, 'catcafe4', '{"doors":false,"maxDistance":2,"model":522844070,"coords":{"x":-600.9105834960938,"y":-1059.2176513671876,"z":21.72143173217773},"groups":{"catcafe":0},"heading":270,"state":1,"doorRate":2}'),
	(868, 'burgershot2', '{"doors":false,"maxDistance":2,"model":2010236044,"coords":{"x":-1188.0657958984376,"y":-896.6784057617188,"z":13.90556144714355},"groups":{"burgershot":0},"heading":304,"state":1,"doorRate":1.5}'),
	(869, 'burgershot3', '{"doors":false,"maxDistance":2,"model":1465287574,"coords":{"x":-1197.09912109375,"y":-903.9393920898438,"z":14.03526592254638},"groups":{"burgershot":0},"heading":214,"state":1,"doorRate":1.5}'),
	(870, 'burgershot', '{"doors":[{"coords":{"x":-1180.728515625,"y":-887.4773559570313,"z":14.09526920318603},"model":-1890974902,"heading":124},{"coords":{"x":-1182.182861328125,"y":-885.330810546875,"z":14.09526920318603},"model":1143532813,"heading":304}],"maxDistance":2,"coords":{"x":-1181.4556884765626,"y":-886.404052734375,"z":14.09526920318603},"groups":{"burgershot":0},"state":1,"doorRate":2}'),
	(877, 'Owner_Dealership', '{"state":1,"coords":{"x":-68.70983123779297,"y":64.26311492919922,"z":72.13197326660156},"doors":[{"coords":{"x":-67.94718933105469,"y":63.82220458984375,"z":72.13197326660156},"model":925993716,"heading":330},{"coords":{"x":-69.47247314453125,"y":64.70402526855469,"z":72.13196563720703},"model":-1869234749,"heading":330}],"groups":{"wiydealership":0},"maxDistance":2}'),
	(878, 'Owner_Dealership2', '{"state":1,"coords":{"x":-79.49440002441406,"y":78.28821563720703,"z":72.15385437011719},"groups":{"cardealer":0},"doors":false,"model":1630015542,"characters":["HEU60167","HOU41578"],"maxDistance":2,"heading":240}'),
	(879, 'Owner_Dealership3', '{"state":1,"coords":{"x":-73.16222381591797,"y":80.21231842041016,"z":71.7396011352539},"groups":{"cardealer":0},"doors":false,"model":-801051034,"characters":["HEU60167","HOU41578"],"maxDistance":2,"heading":155}'),
	(880, 'Owner_Dealership4', '{"state":1,"coords":{"x":-62.28510284423828,"y":79.84893798828125,"z":72.30963134765625},"groups":{"cardealer":0},"doors":false,"model":-1797916783,"characters":["HEU60167","HOU41578"],"maxDistance":2,"heading":247}'),
	(881, 'Owner_Dealership5', '{"state":1,"coords":{"x":-63.74546432495117,"y":76.86322021484375,"z":71.81355285644531},"groups":{"cardealer":0},"doors":false,"model":-1655830399,"characters":["HEU60167","HOU41578"],"maxDistance":2,"heading":247}');

-- Dumping structure for table worldisyours.ox_inventory
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ox_inventory: ~26 rows (approximately)
INSERT INTO `ox_inventory` (`owner`, `name`, `data`, `lastupdated`) VALUES
	('', '[weedshop(1)]', '[{"slot":1,"count":23105,"name":"zatbluelight"},{"slot":2,"count":22427,"name":"zatceilinglight"},{"slot":3,"count":21288,"name":"zatfan01"},{"slot":4,"count":22247,"name":"zatheater"},{"slot":5,"count":23135,"name":"zatpatioheater"},{"slot":6,"count":20036,"name":"zatplanter"},{"slot":7,"count":21634,"name":"zatresfan"},{"slot":8,"count":21292,"name":"zatrollingpaper"},{"slot":9,"count":22351,"name":"zatwallfan"},{"slot":10,"count":22366,"name":"zatwaterbottleempty"},{"slot":11,"count":21490,"name":"zatwatersetup"},{"slot":12,"count":19807,"name":"zatweednutrition"},{"slot":13,"count":22025,"name":"zatweedracks"},{"slot":14,"count":22771,"name":"zatweedrackxs"},{"slot":15,"count":20455,"name":"zatweedseed"},{"slot":16,"count":20044,"name":"zatweedtable"},{"slot":17,"count":105869,"name":"joint"},{"slot":18,"count":20597,"name":"sodiumcarbonate"},{"slot":19,"count":19610,"name":"sodiumbicarbonate"},{"slot":20,"count":20659,"name":"acetone"},{"slot":21,"count":18725,"name":"dimethylformamide"},{"slot":22,"count":21666,"name":"scales"},{"slot":23,"count":18645,"name":"heroinprocessingtable"},{"slot":24,"count":19477,"name":"ketprocessingtable"},{"slot":25,"count":20551,"name":"processingtable"},{"slot":26,"count":20192,"name":"cokeprocessingtable"},{"slot":27,"count":18530,"name":"emptybaggies"}]', '2024-11-24 05:05:00'),
	('', 'Public Cocaine Lab', '[{"slot":1,"count":96,"name":"bakingsoda"},{"slot":2,"count":94,"name":"rawcocaine"},{"slot":3,"count":4,"name":"cutcocaine"}]', '2024-09-02 23:10:00'),
	('', 'mechanicSafe', '[{"name":"copper","slot":1,"count":26},{"name":"oxy","slot":15,"count":3},{"name":"iron","slot":16,"count":5},{"name":"aluminum","slot":17,"count":25},{"name":"painkillers","slot":20,"count":10},{"name":"bottle","slot":22,"count":11},{"name":"diving_gear","slot":25,"count":1},{"name":"rubber","slot":11,"count":3},{"name":"can","slot":6,"count":1}]', '2024-09-15 16:46:35'),
	('', 'BSTray3', NULL, '2024-10-10 04:10:00'),
	('', 'BSFridge', '[{"count":10,"slot":1,"name":"burgermeat"},{"count":200,"slot":7,"name":"chickenwrap"},{"count":200,"slot":8,"name":"torpedo"},{"count":19,"slot":11,"name":"bscoffee"},{"count":20,"slot":12,"name":"bscoke"},{"count":200,"slot":6,"name":"cheesewrap"},{"count":6,"slot":13,"name":"bleeder"}]', '2024-09-23 17:25:00'),
	('', 'kittysSafe', '[{"slot":1,"name":"plastic","count":70},{"slot":2,"name":"glass","count":6},{"slot":3,"name":"metalscrap","count":67},{"slot":4,"name":"aluminum","count":33},{"slot":5,"name":"rubber","count":66},{"slot":6,"name":"iron","count":7},{"slot":7,"name":"copper","count":103},{"slot":8,"name":"steel","count":15},{"slot":9,"name":"internals","count":1},{"slot":10,"name":"seat","count":1},{"slot":11,"name":"engine5","count":4},{"slot":12,"name":"turbo","count":1},{"slot":13,"name":"engine3","count":1},{"slot":14,"name":"toolbox","count":24},{"slot":15,"name":"livery","count":2},{"slot":16,"name":"transmission4","count":3},{"slot":17,"name":"sparkplugs","count":9},{"slot":18,"name":"antilag","count":3},{"slot":19,"name":"nos","count":10000},{"slot":20,"name":"headlights","count":2},{"slot":21,"name":"newoil","count":8},{"slot":22,"name":"sparetire","count":4},{"slot":23,"name":"axleparts","count":9},{"slot":24,"name":"carbattery","count":9},{"slot":25,"name":"fuel_pump","count":2},{"slot":26,"name":"suspension5","count":2},{"slot":27,"name":"tint_supplies","count":1},{"slot":28,"name":"engine1","count":1},{"slot":29,"name":"nos","count":2},{"metadata":{"password":"1234","id":"1ae5ec4e8bbc12_33Y220r251"},"slot":30,"name":"briefcase","count":1},{"slot":31,"name":"chain_v","count":1},{"slot":32,"name":"rolex","count":2},{"slot":33,"name":"md_needle","count":1},{"slot":34,"name":"md_rustyscissors","count":1},{"slot":35,"name":"md_rustynails","count":1},{"slot":36,"name":"md_quarter","count":1},{"slot":37,"name":"copperore","count":12},{"slot":38,"name":"md_paperclip","count":3},{"slot":39,"name":"md_rustypliers","count":1},{"slot":40,"name":"md_halfdollar","count":1},{"slot":41,"name":"md_rustyjunk","count":1},{"slot":42,"name":"md_brokenjunk","count":1},{"slot":43,"name":"md_rustyironball","count":1},{"slot":44,"name":"md_golddollar","count":1},{"slot":45,"name":"md_nails","count":1},{"slot":46,"name":"md_crushedcan","count":1},{"slot":47,"name":"kq_expensive_sneakers","count":2},{"slot":48,"name":"bottle","count":12},{"slot":49,"name":"can","count":7},{"slot":50,"name":"kq_expensive_watch","count":5}]', '2024-11-10 02:15:00'),
	('', 'BSShelf', '[{"slot":1,"count":57,"name":"bscoffee"},{"slot":2,"count":71,"name":"bscoke"},{"slot":3,"count":77,"name":"milkshake"},{"slot":4,"count":20,"name":"water_bottle"},{"slot":6,"count":33,"name":"heartstopper"},{"slot":7,"count":87,"name":"bleeder"},{"slot":8,"count":87,"name":"moneyshot"},{"slot":9,"count":100,"name":"torpedo"},{"slot":10,"count":100,"name":"meatfree"},{"slot":11,"count":87,"name":"shotrings"},{"slot":12,"count":72,"name":"shotfries"},{"slot":13,"count":107,"name":"shotnuggets"},{"slot":14,"count":100,"name":"chickenwrap"},{"slot":15,"count":100,"name":"cheesewrap"},{"slot":16,"count":100,"name":"creampie"},{"slot":17,"count":90,"name":"rimjob"}]', '2024-11-10 16:40:00'),
	('', 'policestash_QNC46912', '[{"metadata":{"durability":100,"ammo":0,"registered":"Andy Murphy","serial":"929360POL208274","components":[]},"slot":1,"count":1,"name":"WEAPON_HEAVYSNIPER_MK2"},{"metadata":{"durability":100,"ammo":0,"serial":"298448POL815333","registered":"Andy Murphy","components":[],"latentprints":{"dv704g47QVg1927":{"evidenceId":578841,"integrity":100}}},"slot":2,"count":1,"name":"WEAPON_PDM700"},{"metadata":{"durability":99.8,"ammo":30,"components":[],"registered":"Andy Murphy","latentprints":{"dv704g47QVg1927":{"evidenceId":485878,"integrity":100}},"serial":"399316POL244382"},"slot":3,"count":1,"name":"WEAPON_HK417"},{"metadata":{"durability":100,"ammo":0,"serial":"645579POL165506","registered":"Andy Murphy","latentprints":{"dv704g47QVg1927":{"evidenceId":434385,"integrity":100}},"components":[]},"slot":4,"count":1,"name":"WEAPON_PDC7"},{"metadata":{"durability":99.5,"ammo":0,"components":[],"registered":"Andy Murphy","latentprints":{"dv704g47QVg1927":{"evidenceId":913007,"integrity":100}},"serial":"755888POL914072"},"slot":5,"count":1,"name":"WEAPON_PD870"},{"metadata":{"durability":100,"latentblood":{"41494d3037373531":{"evidenceId":883369,"bloodtype":"A-"}},"serial":"POL","registered":true,"latentprints":{"dv704g47QVg1927":{"evidenceId":517406,"integrity":100}},"components":[]},"slot":6,"count":1,"name":"WEAPON_BTASER"},{"metadata":{"durability":99.2,"ammo":10,"serial":"913053POL207165","registered":"Andy Murphy","components":[],"latentprints":{"dv704g47QVg1927":{"evidenceId":473711,"integrity":100}}},"slot":7,"count":1,"name":"WEAPON_PDHKUSP"},{"metadata":{"durability":99.9,"ammo":15,"serial":"887336POL666142","registered":"Andy Murphy","components":[],"latentprints":{"dv704g47QVg1927":{"evidenceId":628297,"integrity":100}}},"slot":8,"count":1,"name":"WEAPON_PDG22"},{"slot":9,"count":1,"name":"electronic_cuffs"},{"metadata":{"serial":"POL","registered":true},"slot":10,"count":1,"name":"handcuffs"},{"slot":11,"count":1,"name":"protein"},{"slot":12,"count":1,"name":"preworkout"},{"metadata":{"serial":"POL","registered":true},"slot":13,"count":1,"name":"handcuffs"},{"slot":14,"count":100,"name":"sniper_ammo"},{"slot":15,"count":132,"name":"pistol_ammo"},{"slot":16,"count":471,"name":"recyclablematerial"},{"metadata":{"durability":100,"registered":true,"components":[],"serial":"POL"},"slot":17,"count":1,"name":"WEAPON_FLASHLIGHT"},{"metadata":{"durability":97.90000000000008,"serial":"POL","registered":true,"components":[],"latentprints":{"xQ358t79KXL2469":{"evidenceId":157936,"integrity":100},"Tb417Q82gdh1058":{"evidenceId":109120,"integrity":100},"dv704g47QVg1927":{"evidenceId":858729,"integrity":100}}},"slot":18,"count":1,"name":"WEAPON_FLASHLIGHT"},{"slot":19,"count":10,"name":"painkillers"},{"slot":20,"count":7,"name":"oxy"},{"slot":21,"count":35,"name":"taser_cartridge"},{"slot":22,"count":12,"name":"drillbit"},{"slot":23,"count":1,"name":"mininglaser"},{"metadata":{"type":"Class C Driver License","lastname":"Murphy","birthdate":"10.03.1999","firstname":"Andy"},"slot":24,"count":1,"name":"driver_license"},{"metadata":{"gender":0,"firstname":"Andy","nationality":"United Kingdom","citizenid":"QNC46912","birthdate":"10.03.1999","lastname":"Murphy"},"slot":25,"count":1,"name":"id_card"}]', '2024-10-15 21:00:00'),
	('', 'BSTray4', NULL, '2024-10-10 04:10:00'),
	('', 'Bag_1ae61dbfa3e9c9_8BB0tq258b', '[{"slot":1,"count":1,"name":"tvremote"},{"slot":2,"count":18,"name":"cokebaggy"},{"slot":3,"count":1,"name":"kq_expensive_bag"},{"slot":4,"count":2,"name":"kq_expensive_watch"},{"slot":5,"count":1,"name":"kq_expensive_laptop"},{"slot":6,"count":2,"name":"kq_expensive_sneakers"},{"slot":7,"count":1,"name":"gunrepairkit"},{"slot":8,"count":1,"name":"gunrepairkit"},{"slot":9,"count":1,"name":"gunrepairkit"},{"slot":10,"count":1,"name":"chain_v"},{"metadata":{"worth":387},"slot":11,"count":1,"name":"markedbills"},{"slot":12,"count":1,"name":"bobby_pin"},{"slot":13,"count":11,"name":"zatweednutrition"},{"metadata":{"purity":25,"genetics":"WGWHXX","drylevel":100},"slot":14,"count":2,"name":"zatpackedweed"},{"slot":15,"count":1,"name":"at_clip_100_pistol"},{"slot":16,"count":2,"name":"zatwaterbottleempty"},{"slot":17,"count":17,"name":"zatweedseed"}]', '2024-10-17 05:40:00'),
	('', '2 | Drawer 999', '[{"slot":1,"count":1,"name":"pistol_ammo"}]', '2024-10-15 21:05:00'),
	('', '[blackmarket(1)]', '[{"slot":1,"count":4432,"name":"bobby_pin"}]', '2024-11-24 05:05:00'),
	('', 'RackDryer_13', NULL, '2024-10-17 00:30:00'),
	('', 'RackDryer_16', NULL, '2024-10-17 03:25:00'),
	('', 'RackDryer_18', NULL, '2024-10-23 18:35:00'),
	('', 'Vinewood_QNC46912', '[{"slot":1,"count":1,"name":"md_shovel"},{"slot":2,"count":1,"name":"blue_metaldetector"},{"slot":3,"count":1,"name":"defib"},{"slot":4,"count":1,"name":"WEAPON_PDHK33","metadata":{"ammo":26,"durability":64.4000000000001,"registered":"Andy Murphy","serial":"317393POL754157","latentprints":{"dv704g47QVg1927":{"integrity":100,"evidenceId":208302}},"components":[]}}]', '2024-10-21 21:40:00'),
	('', '[contract(1)]', '[{"name":"contract","count":1,"slot":1,"metadata":{"qty":31}},{"name":"contract","count":1,"slot":2,"metadata":{"qty":207}},{"name":"contract","count":1,"slot":3,"metadata":{"qty":153}},{"name":"contract","count":1,"slot":4,"metadata":{"qty":20}},{"name":"contract","count":1,"slot":5,"metadata":{"qty":78}},{"name":"contract","count":1,"slot":6,"metadata":{"qty":246}},{"name":"contract","count":1,"slot":7,"metadata":{"qty":133}},{"name":"contract","count":1,"slot":8,"metadata":{"qty":94}},{"name":"contract","count":1,"slot":9,"metadata":{"qty":194}},{"name":"contract","count":1,"slot":10,"metadata":{"qty":235}},{"name":"contract","count":1,"slot":11,"metadata":{"qty":180}},{"name":"contract","count":1,"slot":12,"metadata":{"qty":179}},{"name":"contract","count":1,"slot":13,"metadata":{"qty":238}},{"name":"contract","count":1,"slot":14,"metadata":{"qty":152}},{"name":"contract","count":1,"slot":15,"metadata":{"qty":168}},{"name":"contract","count":1,"slot":16,"metadata":{"qty":180}},{"name":"contract","count":1,"slot":17,"metadata":{"qty":15}},{"name":"contract","count":1,"slot":18,"metadata":{"qty":37}},{"name":"contract","count":1,"slot":19,"metadata":{"qty":104}},{"name":"contract","count":1,"slot":20,"metadata":{"qty":208}},{"name":"contract","count":1,"slot":21,"metadata":{"qty":114}},{"name":"contract","count":1,"slot":22,"metadata":{"qty":45}},{"name":"contract","count":1,"slot":23,"metadata":{"qty":244}},{"name":"contract","count":1,"slot":24,"metadata":{"qty":204}},{"name":"contract","count":1,"slot":25,"metadata":{"qty":8}},{"name":"contract","count":1,"slot":26,"metadata":{"qty":227}},{"name":"contract","count":1,"slot":27,"metadata":{"qty":93}},{"name":"contract","count":1,"slot":28,"metadata":{"qty":69}},{"name":"contract","count":1,"slot":29,"metadata":{"qty":224}},{"name":"contract","count":1,"slot":30,"metadata":{"qty":187}},{"name":"contract","count":1,"slot":31,"metadata":{"qty":48}},{"name":"contract","count":1,"slot":32,"metadata":{"qty":56}},{"name":"contract","count":1,"slot":33,"metadata":{"qty":165}},{"name":"contract","count":1,"slot":34,"metadata":{"qty":151}},{"name":"contract","count":1,"slot":35,"metadata":{"qty":11}},{"name":"contract","count":1,"slot":36,"metadata":{"qty":197}},{"name":"contract","count":1,"slot":37,"metadata":{"qty":245}},{"name":"contract","count":1,"slot":38,"metadata":{"qty":129}},{"name":"contract","count":1,"slot":39,"metadata":{"qty":244}},{"name":"contract","count":1,"slot":40,"metadata":{"qty":134}},{"name":"contract","count":1,"slot":41,"metadata":{"qty":239}},{"name":"contract","count":1,"slot":42,"metadata":{"qty":162}},{"name":"contract","count":1,"slot":43,"metadata":{"qty":23}},{"name":"contract","count":1,"slot":44,"metadata":{"qty":134}},{"name":"contract","count":1,"slot":45,"metadata":{"qty":237}},{"name":"contract","count":1,"slot":46,"metadata":{"qty":29}},{"name":"contract","count":1,"slot":47,"metadata":{"qty":246}},{"name":"contract","count":1,"slot":48,"metadata":{"qty":232}},{"name":"contract","count":1,"slot":49,"metadata":{"qty":182}},{"name":"contract","count":1,"slot":50,"metadata":{"qty":103}},{"name":"contract","count":1,"slot":51,"metadata":{"qty":87}},{"name":"contract","count":1,"slot":52,"metadata":{"qty":10}},{"name":"contract","count":1,"slot":53,"metadata":{"qty":202}},{"name":"contract","count":1,"slot":54,"metadata":{"qty":29}},{"name":"contract","count":1,"slot":55,"metadata":{"qty":82}},{"name":"contract","count":1,"slot":56,"metadata":{"qty":247}},{"name":"contract","count":1,"slot":57,"metadata":{"qty":216}},{"name":"contract","count":1,"slot":58,"metadata":{"qty":69}},{"name":"contract","count":1,"slot":59,"metadata":{"qty":118}},{"name":"contract","count":1,"slot":60,"metadata":{"qty":147}},{"name":"contract","count":1,"slot":61,"metadata":{"qty":29}},{"name":"contract","count":1,"slot":62,"metadata":{"qty":88}},{"name":"contract","count":1,"slot":63,"metadata":{"qty":17}},{"name":"contract","count":1,"slot":64,"metadata":{"qty":167}},{"name":"contract","count":1,"slot":65,"metadata":{"qty":213}},{"name":"contract","count":1,"slot":66,"metadata":{"qty":56}},{"name":"contract","count":1,"slot":67,"metadata":{"qty":165}},{"name":"contract","count":1,"slot":68,"metadata":{"qty":215}},{"name":"contract","count":1,"slot":69,"metadata":{"qty":95}},{"name":"contract","count":1,"slot":70,"metadata":{"qty":138}},{"name":"contract","count":1,"slot":71,"metadata":{"qty":92}},{"name":"contract","count":1,"slot":72,"metadata":{"qty":68}},{"name":"contract","count":1,"slot":73,"metadata":{"qty":178}},{"name":"contract","count":1,"slot":74,"metadata":{"qty":81}},{"name":"contract","count":1,"slot":75,"metadata":{"qty":209}},{"name":"contract","count":1,"slot":76,"metadata":{"qty":250}},{"name":"contract","count":1,"slot":77,"metadata":{"qty":115}},{"name":"contract","count":1,"slot":78,"metadata":{"qty":15}},{"name":"contract","count":1,"slot":79,"metadata":{"qty":244}},{"name":"contract","count":1,"slot":80,"metadata":{"qty":76}},{"name":"contract","count":1,"slot":81,"metadata":{"qty":53}},{"name":"contract","count":1,"slot":82,"metadata":{"qty":72}},{"name":"contract","count":1,"slot":83,"metadata":{"qty":108}},{"name":"contract","count":1,"slot":84,"metadata":{"qty":171}},{"name":"contract","count":1,"slot":85,"metadata":{"qty":160}},{"name":"contract","count":1,"slot":86,"metadata":{"qty":33}},{"name":"contract","count":1,"slot":87,"metadata":{"qty":89}},{"name":"contract","count":1,"slot":88,"metadata":{"qty":23}},{"name":"contract","count":1,"slot":89,"metadata":{"qty":245}},{"name":"contract","count":1,"slot":90,"metadata":{"qty":95}},{"name":"contract","count":1,"slot":91,"metadata":{"qty":24}},{"name":"contract","count":1,"slot":92,"metadata":{"qty":198}},{"name":"contract","count":1,"slot":93,"metadata":{"qty":162}},{"name":"contract","count":1,"slot":94,"metadata":{"qty":153}},{"name":"contract","count":1,"slot":95,"metadata":{"qty":102}},{"name":"contract","count":1,"slot":96,"metadata":{"qty":213}},{"name":"contract","count":1,"slot":97,"metadata":{"qty":115}},{"name":"contract","count":1,"slot":98,"metadata":{"qty":211}},{"name":"contract","count":1,"slot":99,"metadata":{"qty":165}},{"name":"contract","count":1,"slot":100,"metadata":{"qty":176}}]', '2024-11-06 14:28:22'),
	('', 'Bag_1ae62f50db59cd_433970a3ck', '[{"count":1,"slot":1,"name":"accesstool"}]', '2024-10-26 10:55:00'),
	('', 'Bag_1ae58f22e694a0_8391n9Pf06', NULL, '2024-10-22 07:05:00'),
	('', 'Vinewood_AIM07751', '[{"name":"blue_metaldetector","count":1,"slot":1},{"name":"md_shovel","count":1,"slot":2},{"name":"fitbit","count":1,"slot":3},{"name":"gpstracker","count":1,"slot":4}]', '2024-10-22 13:35:00'),
	('', '[dealershop(1)]', '[{"slot":1,"count":21341,"name":"pickaxe"},{"slot":2,"count":21623,"name":"painkillers"},{"slot":3,"count":19206,"name":"citricacid"},{"slot":4,"count":20408,"name":"steviapowder"},{"slot":5,"count":19847,"name":"butane_gas"},{"slot":6,"count":19630,"name":"plasticjerrycan"},{"slot":7,"count":19364,"name":"pressurecooker"},{"slot":8,"count":20264,"name":"mortarpestle"},{"slot":9,"count":21671,"name":"ketprocessingtable"}]', '2024-11-24 05:05:00'),
	('', '[policeshop(1)]', '[{"count":1,"name":"gps_tracker","slot":1,"metadata":{"qty":21}},{"count":1,"name":"gps_tracker","slot":2,"metadata":{"qty":2}},{"count":1,"name":"gps_tracker","slot":3,"metadata":{"qty":48}},{"count":1,"name":"gps_tracker","slot":4,"metadata":{"qty":6}},{"count":1,"name":"gps_tracker","slot":5,"metadata":{"qty":24}},{"count":1,"name":"gps_tracker","slot":6,"metadata":{"qty":43}},{"count":1,"name":"gps_tracker","slot":7,"metadata":{"qty":14}},{"count":1,"name":"gps_tracker","slot":8,"metadata":{"qty":26}},{"count":1,"name":"gps_tracker","slot":9,"metadata":{"qty":40}},{"count":1,"name":"gps_tracker","slot":10,"metadata":{"qty":15}},{"count":1,"name":"gps_tracker","slot":11,"metadata":{"qty":14}},{"count":1,"name":"gps_tracker","slot":12,"metadata":{"qty":3}},{"count":1,"name":"gps_tracker","slot":13,"metadata":{"qty":44}},{"count":1,"name":"gps_tracker","slot":14,"metadata":{"qty":21}},{"count":1,"name":"gps_tracker","slot":15,"metadata":{"qty":38}},{"count":1,"name":"gps_tracker","slot":16,"metadata":{"qty":24}},{"count":1,"name":"gps_tracker","slot":17,"metadata":{"qty":50}},{"count":1,"name":"gps_tracker","slot":18,"metadata":{"qty":36}},{"count":1,"name":"gps_tracker","slot":19,"metadata":{"qty":30}},{"count":1,"name":"gps_tracker","slot":20,"metadata":{"qty":38}},{"count":1,"name":"gps_tracker","slot":21,"metadata":{"qty":18}},{"count":1,"name":"gps_tracker","slot":22,"metadata":{"qty":14}},{"count":1,"name":"gps_tracker","slot":23,"metadata":{"qty":29}},{"count":1,"name":"gps_tracker","slot":24,"metadata":{"qty":12}},{"count":1,"name":"gps_tracker","slot":25,"metadata":{"qty":36}},{"count":1,"name":"gps_tracker","slot":26,"metadata":{"qty":47}},{"count":1,"name":"gps_tracker","slot":27,"metadata":{"qty":46}},{"count":1,"name":"gps_tracker","slot":28,"metadata":{"qty":12}},{"count":1,"name":"gps_tracker","slot":29,"metadata":{"qty":34}},{"count":1,"name":"gps_tracker","slot":30,"metadata":{"qty":42}},{"count":1,"name":"gps_tracker","slot":31,"metadata":{"qty":36}},{"count":1,"name":"gps_tracker","slot":32,"metadata":{"qty":21}},{"count":1,"name":"gps_tracker","slot":33,"metadata":{"qty":16}},{"count":1,"name":"gps_tracker","slot":34,"metadata":{"qty":47}},{"count":1,"name":"gps_tracker","slot":35,"metadata":{"qty":40}},{"count":1,"name":"gps_tracker","slot":36,"metadata":{"qty":47}},{"count":1,"name":"gps_tracker","slot":37,"metadata":{"qty":34}},{"count":1,"name":"gps_tracker","slot":38,"metadata":{"qty":35}},{"count":1,"name":"gps_tracker","slot":39,"metadata":{"qty":13}},{"count":1,"name":"gps_tracker","slot":40,"metadata":{"qty":34}},{"count":1,"name":"gps_tracker","slot":41,"metadata":{"qty":38}},{"count":1,"name":"gps_tracker","slot":42,"metadata":{"qty":20}},{"count":1,"name":"gps_tracker","slot":43,"metadata":{"qty":16}},{"count":1,"name":"gps_tracker","slot":44,"metadata":{"qty":22}},{"count":1,"name":"gps_tracker","slot":45,"metadata":{"qty":36}},{"count":1,"name":"gps_tracker","slot":46,"metadata":{"qty":48}},{"count":1,"name":"gps_tracker","slot":47,"metadata":{"qty":36}},{"count":1,"name":"gps_tracker","slot":48,"metadata":{"qty":15}},{"count":1,"name":"gps_tracker","slot":49,"metadata":{"qty":24}},{"count":1,"name":"gps_tracker","slot":50,"metadata":{"qty":20}},{"count":1,"name":"gps_tracker","slot":51,"metadata":{"qty":25}},{"count":1,"name":"gps_tracker","slot":52,"metadata":{"qty":38}},{"count":1,"name":"gps_tracker","slot":53,"metadata":{"qty":22}},{"count":1,"name":"gps_tracker","slot":54,"metadata":{"qty":20}},{"count":1,"name":"gps_tracker","slot":55,"metadata":{"qty":33}},{"count":1,"name":"gps_tracker","slot":56,"metadata":{"qty":18}},{"count":1,"name":"gps_tracker","slot":57,"metadata":{"qty":31}},{"count":1,"name":"gps_tracker","slot":58,"metadata":{"qty":43}},{"count":1,"name":"gps_tracker","slot":59,"metadata":{"qty":34}},{"count":1,"name":"gps_tracker","slot":60,"metadata":{"qty":36}},{"count":1,"name":"gps_tracker","slot":61,"metadata":{"qty":4}},{"count":1,"name":"gps_tracker","slot":62,"metadata":{"qty":23}},{"count":1,"name":"gps_tracker","slot":63,"metadata":{"qty":9}},{"count":1,"name":"gps_tracker","slot":64,"metadata":{"qty":14}},{"count":1,"name":"gps_tracker","slot":65,"metadata":{"qty":35}},{"count":1,"name":"gps_tracker","slot":66,"metadata":{"qty":29}},{"count":1,"name":"gps_tracker","slot":67,"metadata":{"qty":16}},{"count":1,"name":"gps_tracker","slot":68,"metadata":{"qty":42}},{"count":1,"name":"gps_tracker","slot":69,"metadata":{"qty":3}},{"count":1,"name":"gps_tracker","slot":70,"metadata":{"qty":49}},{"count":1,"name":"gps_tracker","slot":71,"metadata":{"qty":8}},{"count":1,"name":"gps_tracker","slot":72,"metadata":{"qty":22}},{"count":1,"name":"gps_tracker","slot":73,"metadata":{"qty":34}},{"count":1,"name":"gps_tracker","slot":74,"metadata":{"qty":19}},{"count":1,"name":"gps_tracker","slot":75,"metadata":{"qty":23}},{"count":1,"name":"gps_tracker","slot":76,"metadata":{"qty":41}},{"count":1,"name":"gps_tracker","slot":77,"metadata":{"qty":21}},{"count":1,"name":"gps_tracker","slot":78,"metadata":{"qty":47}},{"count":1,"name":"gps_tracker","slot":79,"metadata":{"qty":11}},{"count":1,"name":"gps_tracker","slot":80,"metadata":{"qty":25}},{"count":1,"name":"gps_tracker","slot":81,"metadata":{"qty":17}},{"count":1,"name":"gps_tracker","slot":82,"metadata":{"qty":9}},{"count":1,"name":"gps_tracker","slot":83,"metadata":{"qty":10}},{"count":1,"name":"gps_tracker","slot":84,"metadata":{"qty":43}},{"count":1,"name":"gps_tracker","slot":85,"metadata":{"qty":25}},{"count":1,"name":"gps_tracker","slot":86,"metadata":{"qty":4}},{"count":1,"name":"gps_tracker","slot":87,"metadata":{"qty":6}},{"count":1,"name":"gps_tracker","slot":88,"metadata":{"qty":41}},{"count":1,"name":"gps_tracker","slot":89,"metadata":{"qty":11}},{"count":1,"name":"gps_tracker","slot":90,"metadata":{"qty":1}},{"count":1,"name":"gps_tracker","slot":91,"metadata":{"qty":36}},{"count":1,"name":"gps_tracker","slot":92,"metadata":{"qty":38}},{"count":1,"name":"gps_tracker","slot":93,"metadata":{"qty":12}},{"count":1,"name":"gps_tracker","slot":94,"metadata":{"qty":20}},{"count":1,"name":"gps_tracker","slot":95,"metadata":{"qty":29}},{"count":1,"name":"gps_tracker","slot":96,"metadata":{"qty":7}},{"count":1,"name":"gps_tracker","slot":97,"metadata":{"qty":13}},{"count":1,"name":"gps_tracker","slot":98,"metadata":{"qty":21}},{"count":1,"name":"gps_tracker","slot":99,"metadata":{"qty":28}},{"count":1,"name":"gps_tracker","slot":100,"metadata":{"qty":18}}]', '2024-11-06 17:05:00'),
	('', '[emsshop(1)]', '[{"count":1,"name":"gps_tracker","slot":1,"metadata":{"qty":43}},{"count":1,"name":"gps_tracker","slot":2,"metadata":{"qty":19}},{"count":1,"name":"gps_tracker","slot":3,"metadata":{"qty":20}},{"count":1,"name":"gps_tracker","slot":4,"metadata":{"qty":35}},{"count":1,"name":"gps_tracker","slot":5,"metadata":{"qty":2}},{"count":1,"name":"gps_tracker","slot":6,"metadata":{"qty":44}},{"count":1,"name":"gps_tracker","slot":7,"metadata":{"qty":49}},{"count":1,"name":"gps_tracker","slot":8,"metadata":{"qty":26}},{"count":1,"name":"gps_tracker","slot":9,"metadata":{"qty":26}},{"count":1,"name":"gps_tracker","slot":10,"metadata":{"qty":17}},{"count":1,"name":"gps_tracker","slot":11,"metadata":{"qty":40}},{"count":1,"name":"gps_tracker","slot":12,"metadata":{"qty":18}},{"count":1,"name":"gps_tracker","slot":13,"metadata":{"qty":36}},{"count":1,"name":"gps_tracker","slot":14,"metadata":{"qty":47}},{"count":1,"name":"gps_tracker","slot":15,"metadata":{"qty":36}},{"count":1,"name":"gps_tracker","slot":16,"metadata":{"qty":50}},{"count":1,"name":"gps_tracker","slot":17,"metadata":{"qty":24}},{"count":1,"name":"gps_tracker","slot":18,"metadata":{"qty":20}},{"count":1,"name":"gps_tracker","slot":19,"metadata":{"qty":11}},{"count":1,"name":"gps_tracker","slot":20,"metadata":{"qty":34}},{"count":1,"name":"gps_tracker","slot":21,"metadata":{"qty":16}},{"count":1,"name":"gps_tracker","slot":22,"metadata":{"qty":16}},{"count":1,"name":"gps_tracker","slot":23,"metadata":{"qty":6}},{"count":1,"name":"gps_tracker","slot":24,"metadata":{"qty":23}},{"count":1,"name":"gps_tracker","slot":25,"metadata":{"qty":9}},{"count":1,"name":"gps_tracker","slot":26,"metadata":{"qty":50}},{"count":1,"name":"gps_tracker","slot":27,"metadata":{"qty":1}},{"count":1,"name":"gps_tracker","slot":28,"metadata":{"qty":50}},{"count":1,"name":"gps_tracker","slot":29,"metadata":{"qty":12}},{"count":1,"name":"gps_tracker","slot":30,"metadata":{"qty":12}},{"count":1,"name":"gps_tracker","slot":31,"metadata":{"qty":14}},{"count":1,"name":"gps_tracker","slot":32,"metadata":{"qty":18}},{"count":1,"name":"gps_tracker","slot":33,"metadata":{"qty":38}},{"count":1,"name":"gps_tracker","slot":34,"metadata":{"qty":31}},{"count":1,"name":"gps_tracker","slot":35,"metadata":{"qty":15}},{"count":1,"name":"gps_tracker","slot":36,"metadata":{"qty":14}},{"count":1,"name":"gps_tracker","slot":37,"metadata":{"qty":45}},{"count":1,"name":"gps_tracker","slot":38,"metadata":{"qty":10}},{"count":1,"name":"gps_tracker","slot":39,"metadata":{"qty":4}},{"count":1,"name":"gps_tracker","slot":40,"metadata":{"qty":18}},{"count":1,"name":"gps_tracker","slot":41,"metadata":{"qty":1}},{"count":1,"name":"gps_tracker","slot":42,"metadata":{"qty":32}},{"count":1,"name":"gps_tracker","slot":43,"metadata":{"qty":6}},{"count":1,"name":"gps_tracker","slot":44,"metadata":{"qty":16}},{"count":1,"name":"gps_tracker","slot":45,"metadata":{"qty":7}},{"count":1,"name":"gps_tracker","slot":46,"metadata":{"qty":37}},{"count":1,"name":"gps_tracker","slot":47,"metadata":{"qty":15}},{"count":1,"name":"gps_tracker","slot":48,"metadata":{"qty":17}},{"count":1,"name":"gps_tracker","slot":49,"metadata":{"qty":41}},{"count":1,"name":"gps_tracker","slot":50,"metadata":{"qty":11}},{"count":1,"name":"gps_tracker","slot":51,"metadata":{"qty":33}},{"count":1,"name":"gps_tracker","slot":52,"metadata":{"qty":42}},{"count":1,"name":"gps_tracker","slot":53,"metadata":{"qty":3}},{"count":1,"name":"gps_tracker","slot":54,"metadata":{"qty":16}},{"count":1,"name":"gps_tracker","slot":55,"metadata":{"qty":41}},{"count":1,"name":"gps_tracker","slot":56,"metadata":{"qty":41}},{"count":1,"name":"gps_tracker","slot":57,"metadata":{"qty":24}},{"count":1,"name":"gps_tracker","slot":58,"metadata":{"qty":7}},{"count":1,"name":"gps_tracker","slot":59,"metadata":{"qty":9}},{"count":1,"name":"gps_tracker","slot":60,"metadata":{"qty":50}},{"count":1,"name":"gps_tracker","slot":61,"metadata":{"qty":32}},{"count":1,"name":"gps_tracker","slot":62,"metadata":{"qty":39}},{"count":1,"name":"gps_tracker","slot":63,"metadata":{"qty":13}},{"count":1,"name":"gps_tracker","slot":64,"metadata":{"qty":40}},{"count":1,"name":"gps_tracker","slot":65,"metadata":{"qty":49}},{"count":1,"name":"gps_tracker","slot":66,"metadata":{"qty":38}},{"count":1,"name":"gps_tracker","slot":67,"metadata":{"qty":47}},{"count":1,"name":"gps_tracker","slot":68,"metadata":{"qty":31}},{"count":1,"name":"gps_tracker","slot":69,"metadata":{"qty":34}},{"count":1,"name":"gps_tracker","slot":70,"metadata":{"qty":10}},{"count":1,"name":"gps_tracker","slot":71,"metadata":{"qty":42}},{"count":1,"name":"gps_tracker","slot":72,"metadata":{"qty":19}},{"count":1,"name":"gps_tracker","slot":73,"metadata":{"qty":50}},{"count":1,"name":"gps_tracker","slot":74,"metadata":{"qty":3}},{"count":1,"name":"gps_tracker","slot":75,"metadata":{"qty":21}},{"count":1,"name":"gps_tracker","slot":76,"metadata":{"qty":35}},{"count":1,"name":"gps_tracker","slot":77,"metadata":{"qty":21}},{"count":1,"name":"gps_tracker","slot":78,"metadata":{"qty":32}},{"count":1,"name":"gps_tracker","slot":79,"metadata":{"qty":12}},{"count":1,"name":"gps_tracker","slot":80,"metadata":{"qty":18}},{"count":1,"name":"gps_tracker","slot":81,"metadata":{"qty":48}},{"count":1,"name":"gps_tracker","slot":82,"metadata":{"qty":31}},{"count":1,"name":"gps_tracker","slot":83,"metadata":{"qty":12}},{"count":1,"name":"gps_tracker","slot":84,"metadata":{"qty":15}},{"count":1,"name":"gps_tracker","slot":85,"metadata":{"qty":18}},{"count":1,"name":"gps_tracker","slot":86,"metadata":{"qty":23}},{"count":1,"name":"gps_tracker","slot":87,"metadata":{"qty":18}},{"count":1,"name":"gps_tracker","slot":88,"metadata":{"qty":4}},{"count":1,"name":"gps_tracker","slot":89,"metadata":{"qty":45}},{"count":1,"name":"gps_tracker","slot":90,"metadata":{"qty":7}},{"count":1,"name":"gps_tracker","slot":91,"metadata":{"qty":18}},{"count":1,"name":"gps_tracker","slot":92,"metadata":{"qty":44}},{"count":1,"name":"gps_tracker","slot":93,"metadata":{"qty":17}},{"count":1,"name":"gps_tracker","slot":94,"metadata":{"qty":26}},{"count":1,"name":"gps_tracker","slot":95,"metadata":{"qty":15}},{"count":1,"name":"gps_tracker","slot":96,"metadata":{"qty":38}},{"count":1,"name":"gps_tracker","slot":97,"metadata":{"qty":16}},{"count":1,"name":"gps_tracker","slot":98,"metadata":{"qty":13}},{"count":1,"name":"gps_tracker","slot":99,"metadata":{"qty":22}},{"count":1,"name":"gps_tracker","slot":100,"metadata":{"qty":19}}]', '2024-11-06 17:05:00'),
	('', 'mosleysSafe', '[{"name":"iron","count":697,"slot":1},{"name":"plastic","count":500,"slot":2},{"name":"aluminum","count":345,"slot":3},{"name":"steel","count":384,"slot":4},{"name":"glass","count":544,"slot":5},{"name":"metalscrap","count":468,"slot":6},{"name":"rubber","count":458,"slot":7},{"name":"copper","count":438,"slot":8},{"name":"bottle","count":507,"slot":9},{"name":"can","count":342,"slot":10},{"name":"recyclablematerial","count":45,"slot":17},{"name":"turbo","count":1,"slot":18}]', '2024-11-11 16:55:00'),
	('', 'Bag_1ae656e183cdec_7aE062275K', '[{"metadata":{"components":[],"registered":true,"latentprints":{"Sd832S76hyL3818":{"integrity":100,"evidenceId":858175}},"serial":"POL","durability":100},"name":"WEAPON_PEPPERSPRAY","count":1,"slot":1},{"name":"gunrepairkit","count":1,"slot":2},{"name":"electronic_cuffs","count":1,"slot":3},{"metadata":{"components":[],"registered":true,"serial":"POL","durability":100},"name":"WEAPON_ANTIDOTE","count":1,"slot":4},{"name":"shotgun_ammo","count":75,"slot":5},{"name":"sniper_ammo","count":70,"slot":6},{"name":"sdcard","count":1,"slot":7},{"name":"nikon","count":1,"slot":8},{"metadata":{"components":[],"registered":"Andy Murphy","latentprints":{"Sd832S76hyL3818":{"integrity":100,"evidenceId":161090}},"serial":"749409POL851155","ammo":0,"durability":100},"name":"WEAPON_PUMPSHOTGUN","count":1,"slot":9},{"metadata":{"components":[],"registered":"Andy Murphy","latentprints":{"Sd832S76hyL3818":{"integrity":100,"evidenceId":224148}},"serial":"972567JMW734090","ammo":4,"durability":99.8},"name":"WEAPON_PDM700","count":1,"slot":10},{"name":"accesstool","count":1,"slot":11},{"name":"advancedlockpick","count":10,"slot":12}]', '2024-11-11 15:40:00'),
	('', 'Bag_1ae67bd8935d5a_jT7bAVp6J2', '[{"name":"rifle_ammo","count":200,"slot":1},{"name":"pistol_ammo","count":200,"slot":2},{"name":"shotgun_ammo","count":200,"slot":3},{"name":"crack_baggy","count":2,"slot":9},{"name":"meth","count":1,"slot":10},{"name":"emptybaggies","count":1,"slot":11},{"name":"firework3","count":1,"slot":12},{"name":"defib","count":1,"slot":6},{"name":"goldchain","count":1,"slot":5}]', '2024-11-10 04:35:00'),
	('', 'BSTray1', '[{"slot":6,"count":10,"name":"tosti"},{"slot":10,"count":14,"name":"water_bottle"}]', '2024-11-10 16:35:00');

-- Dumping structure for table worldisyours.paintball_outfits
CREATE TABLE IF NOT EXISTS `paintball_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `readoutfit` text DEFAULT NULL,
  `blueoutfit` text DEFAULT NULL,
  `main` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.paintball_outfits: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_accounts
CREATE TABLE IF NOT EXISTS `phone_accounts` (
  `app` varchar(50) NOT NULL,
  `id` varchar(80) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `birthdate` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `interested` text NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.phone_accounts: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_alertjobs
CREATE TABLE IF NOT EXISTS `phone_alertjobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(255) NOT NULL,
  `alerts` longtext DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `job` (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.phone_alertjobs: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_backups
CREATE TABLE IF NOT EXISTS `phone_backups` (
  `id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`id`,`phone_number`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_backups_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_backups: ~12 rows (approximately)
INSERT INTO `phone_backups` (`id`, `phone_number`) VALUES
	('CWY62276', '2059488312'),
	('EBT98762', '5203155123'),
	('ETF72063', '2051567158'),
	('HEU60167', '6023367331'),
	('HOU41578', '5204960215'),
	('RDT43347', '4809315005'),
	('RZY43875', '5207830775'),
	('STG67749', '4802596427'),
	('UMV88168', '2057042489'),
	('UMV88168', '6021638057'),
	('YDT13754', '6029973306'),
	('YFB89595', '9072660558');

-- Dumping structure for table worldisyours.phone_chats
CREATE TABLE IF NOT EXISTS `phone_chats` (
  `app` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.phone_chats: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_clock_alarms
CREATE TABLE IF NOT EXISTS `phone_clock_alarms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `hours` int(2) NOT NULL DEFAULT 0,
  `minutes` int(2) NOT NULL DEFAULT 0,
  `label` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`,`phone_number`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_clock_alarms_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_clock_alarms: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_crypto
CREATE TABLE IF NOT EXISTS `phone_crypto` (
  `id` varchar(100) NOT NULL,
  `coin` varchar(15) NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `invested` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`,`coin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_crypto: ~0 rows (approximately)
INSERT INTO `phone_crypto` (`id`, `coin`, `amount`, `invested`) VALUES
	('CWY62276', 'bitcoin', 0.008309213532939107, 600);

-- Dumping structure for table worldisyours.phone_darkchat_accounts
CREATE TABLE IF NOT EXISTS `phone_darkchat_accounts` (
  `phone_number` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_darkchat_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_darkchat_accounts: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_darkchat_channels
CREATE TABLE IF NOT EXISTS `phone_darkchat_channels` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_darkchat_channels: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_darkchat_members
CREATE TABLE IF NOT EXISTS `phone_darkchat_members` (
  `channel_name` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`channel_name`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `phone_darkchat_members_ibfk_1` FOREIGN KEY (`channel_name`) REFERENCES `phone_darkchat_channels` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_darkchat_members_ibfk_2` FOREIGN KEY (`username`) REFERENCES `phone_darkchat_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_darkchat_members: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_darkchat_messages
CREATE TABLE IF NOT EXISTS `phone_darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(50) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `channel` (`channel`),
  KEY `sender` (`sender`),
  CONSTRAINT `phone_darkchat_messages_ibfk_1` FOREIGN KEY (`channel`) REFERENCES `phone_darkchat_channels` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_darkchat_messages_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `phone_darkchat_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_darkchat_messages: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.phone_gallery: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_instagram_accounts
CREATE TABLE IF NOT EXISTS `phone_instagram_accounts` (
  `display_name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profile_image` varchar(500) DEFAULT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `post_count` int(11) NOT NULL DEFAULT 0,
  `story_count` int(11) NOT NULL DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `phone_number` varchar(15) NOT NULL,
  `private` tinyint(1) DEFAULT 0,
  `verified` tinyint(1) DEFAULT 0,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_instagram_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_instagram_accounts: ~1 rows (approximately)
INSERT INTO `phone_instagram_accounts` (`display_name`, `username`, `password`, `profile_image`, `bio`, `post_count`, `story_count`, `follower_count`, `following_count`, `phone_number`, `private`, `verified`, `date_joined`) VALUES
	('anders', 'anders', '$2a$11$yDy69ASGXCIjsfzzwZcIPeOykKj9Ty46sFAyebdM3VzrJiIzRCTXa', NULL, NULL, 0, 0, 0, 0, '2057042489', 0, 0, '2024-11-09 03:34:18'),
	('That Big Plug', 'thaplug', '$2a$11$qi4b77AD.FU2b.ucbJlOU.9j0RPWhTNqTtK/dqi28HGtwyHY1ShCK', 'https://r2.fivemanage.com/images/WwP8z6IbUBw6.webp', 'Need Shit Hit Me Up I Got All The Goods', 0, 0, 0, 0, '6023367331', 0, 0, '2024-11-10 04:54:09');

-- Dumping structure for table worldisyours.phone_instagram_comments
CREATE TABLE IF NOT EXISTS `phone_instagram_comments` (
  `id` varchar(10) NOT NULL,
  `post_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `comment` varchar(500) NOT NULL DEFAULT '',
  `like_count` int(11) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `username` (`username`),
  CONSTRAINT `phone_instagram_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `phone_instagram_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `phone_instagram_comments_ibfk_2` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_instagram_comments: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_instagram_follows
CREATE TABLE IF NOT EXISTS `phone_instagram_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  PRIMARY KEY (`followed`,`follower`),
  KEY `follower` (`follower`),
  CONSTRAINT `phone_instagram_follows_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_instagram_follows_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_instagram_follows: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_instagram_follow_requests
CREATE TABLE IF NOT EXISTS `phone_instagram_follow_requests` (
  `requester` varchar(20) NOT NULL,
  `requestee` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`requester`,`requestee`),
  KEY `requestee` (`requestee`),
  CONSTRAINT `phone_instagram_follow_requests_ibfk_1` FOREIGN KEY (`requester`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_instagram_follow_requests_ibfk_2` FOREIGN KEY (`requestee`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_instagram_follow_requests: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_instagram_likes
CREATE TABLE IF NOT EXISTS `phone_instagram_likes` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `is_comment` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `phone_instagram_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_instagram_likes: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_instagram_messages
CREATE TABLE IF NOT EXISTS `phone_instagram_messages` (
  `id` varchar(10) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `recipient` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `recipient` (`recipient`),
  CONSTRAINT `phone_instagram_messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_instagram_messages_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_instagram_messages: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_instagram_notifications
CREATE TABLE IF NOT EXISTS `phone_instagram_notifications` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `post_id` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `from` (`from`),
  CONSTRAINT `phone_instagram_notifications_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_instagram_notifications_ibfk_2` FOREIGN KEY (`from`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_instagram_notifications: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_instagram_posts
CREATE TABLE IF NOT EXISTS `phone_instagram_posts` (
  `id` varchar(10) NOT NULL,
  `media` text DEFAULT NULL,
  `caption` varchar(500) NOT NULL DEFAULT '',
  `location` varchar(50) DEFAULT NULL,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `comment_count` int(11) NOT NULL DEFAULT 0,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `phone_instagram_posts_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_instagram_posts: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_instagram_stories
CREATE TABLE IF NOT EXISTS `phone_instagram_stories` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `image` varchar(500) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `phone_instagram_stories_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_instagram_stories: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_instagram_stories_views
CREATE TABLE IF NOT EXISTS `phone_instagram_stories_views` (
  `story_id` varchar(50) NOT NULL,
  `viewer` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`story_id`,`viewer`),
  KEY `viewer` (`viewer`),
  CONSTRAINT `phone_instagram_stories_views_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `phone_instagram_stories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `phone_instagram_stories_views_ibfk_2` FOREIGN KEY (`viewer`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_instagram_stories_views: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.phone_invoices: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_last_phone
CREATE TABLE IF NOT EXISTS `phone_last_phone` (
  `id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_last_phone_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_last_phone: ~9 rows (approximately)
INSERT INTO `phone_last_phone` (`id`, `phone_number`) VALUES
	('ETF72063', '2051567158'),
	('UMV88168', '2057042489'),
	('CWY62276', '2059488312'),
	('EBT98762', '5203155123'),
	('HOU41578', '5204960215'),
	('RZY43875', '5207830775'),
	('HEU60167', '6023367331'),
	('YDT13754', '6029973306'),
	('YFB89595', '9072660558');

-- Dumping structure for table worldisyours.phone_logged_in_accounts
CREATE TABLE IF NOT EXISTS `phone_logged_in_accounts` (
  `phone_number` varchar(15) NOT NULL,
  `app` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`phone_number`,`app`,`username`),
  CONSTRAINT `phone_logged_in_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_logged_in_accounts: ~8 rows (approximately)
INSERT INTO `phone_logged_in_accounts` (`phone_number`, `app`, `username`, `active`) VALUES
	('2057042489', 'Instagram', 'anders', 1),
	('2057042489', 'Mail', 'anders@world.com', 1),
	('2057042489', 'TikTok', 'anders', 1),
	('2057042489', 'Twitter', 'murphy', 1),
	('6023367331', 'Instagram', 'thaplug', 1),
	('6023367331', 'Mail', 'thaplug@world.com', 1),
	('6023367331', 'Twitter', 'bihplug', 1),
	('6029973306', 'Twitter', 'col.bourne', 1);

-- Dumping structure for table worldisyours.phone_mail_accounts
CREATE TABLE IF NOT EXISTS `phone_mail_accounts` (
  `address` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_mail_accounts: ~2 rows (approximately)
INSERT INTO `phone_mail_accounts` (`address`, `password`) VALUES
	('anders@world.com', '$2a$11$WTtva3gxJL.VSBTlqNd2C.FdlSwwgocvEehteAUis7Q0S/7GMagx2'),
	('thaplug@world.com', '$2a$11$rDIiVNKMFaetFAevwFoL3Om4Zj72CPfq5qJzsZzea7hJljjewW9ju');

-- Dumping structure for table worldisyours.phone_mail_deleted
CREATE TABLE IF NOT EXISTS `phone_mail_deleted` (
  `message_id` int(10) unsigned NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`message_id`,`address`),
  KEY `address` (`address`),
  CONSTRAINT `phone_mail_deleted_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `phone_mail_messages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `phone_mail_deleted_ibfk_2` FOREIGN KEY (`address`) REFERENCES `phone_mail_accounts` (`address`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_mail_deleted: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_mail_messages
CREATE TABLE IF NOT EXISTS `phone_mail_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipient` varchar(100) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `attachments` longtext DEFAULT NULL,
  `actions` longtext DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_mail_messages: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_maps_locations
CREATE TABLE IF NOT EXISTS `phone_maps_locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `x_pos` float NOT NULL,
  `y_pos` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_maps_locations_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_maps_locations: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_marketplace_posts
CREATE TABLE IF NOT EXISTS `phone_marketplace_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `attachments` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_marketplace_posts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_marketplace_posts: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(46) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `number` varchar(50) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `messages` text NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `read` int(11) DEFAULT NULL,
  `created` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.phone_messages: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_message_channels
CREATE TABLE IF NOT EXISTS `phone_message_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_group` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `last_message` varchar(50) NOT NULL DEFAULT '',
  `last_message_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_message_channels: ~1 rows (approximately)
INSERT INTO `phone_message_channels` (`id`, `is_group`, `name`, `last_message`, `last_message_timestamp`) VALUES
	(1, 0, NULL, 'Im starving to death need foor OPEN Burger SHot AS', '2024-11-10 15:58:07');

-- Dumping structure for table worldisyours.phone_message_members
CREATE TABLE IF NOT EXISTS `phone_message_members` (
  `channel_id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `is_owner` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `unread` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`channel_id`,`phone_number`),
  CONSTRAINT `phone_message_members_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_message_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_message_members: ~2 rows (approximately)
INSERT INTO `phone_message_members` (`channel_id`, `phone_number`, `is_owner`, `deleted`, `unread`) VALUES
	(1, '4802596427', 0, 0, 0),
	(1, '6023367331', 0, 0, 0);

-- Dumping structure for table worldisyours.phone_message_messages
CREATE TABLE IF NOT EXISTS `phone_message_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `sender` varchar(15) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`),
  CONSTRAINT `phone_message_messages_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_message_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_message_messages: ~2 rows (approximately)
INSERT INTO `phone_message_messages` (`id`, `channel_id`, `sender`, `content`, `attachments`, `timestamp`) VALUES
	(1, 1, '4802596427', '<!CALL-NO-ANSWER!>', NULL, '2024-11-10 15:57:29'),
	(2, 1, '4802596427', 'Im starving to death need foor OPEN Burger SHot ASAP Please', NULL, '2024-11-10 15:58:07');

-- Dumping structure for table worldisyours.phone_music_playlists
CREATE TABLE IF NOT EXISTS `phone_music_playlists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cover` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_music_playlists_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_music_playlists: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_music_saved_playlists
CREATE TABLE IF NOT EXISTS `phone_music_saved_playlists` (
  `playlist_id` int(10) unsigned NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`playlist_id`,`phone_number`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_music_saved_playlists_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `phone_music_playlists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `phone_music_saved_playlists_ibfk_2` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_music_saved_playlists: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_music_songs
CREATE TABLE IF NOT EXISTS `phone_music_songs` (
  `song_id` varchar(100) NOT NULL,
  `playlist_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`song_id`,`playlist_id`),
  KEY `playlist_id` (`playlist_id`),
  CONSTRAINT `phone_music_songs_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `phone_music_playlists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_music_songs: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_news
CREATE TABLE IF NOT EXISTS `phone_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_news: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_notes
CREATE TABLE IF NOT EXISTS `phone_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` longtext DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_notes_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_notes: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_notifications
CREATE TABLE IF NOT EXISTS `phone_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `app` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `thumbnail` varchar(500) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `show_avatar` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_notifications_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_notifications: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_notifies
CREATE TABLE IF NOT EXISTS `phone_notifies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `msg_content` text NOT NULL,
  `msg_head` varchar(50) NOT NULL DEFAULT '',
  `app_name` text NOT NULL,
  `msg_time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.phone_notifies: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_numbers
CREATE TABLE IF NOT EXISTS `phone_numbers` (
  `identifier` varchar(200) NOT NULL DEFAULT '',
  `data` text DEFAULT NULL,
  `defaultNumber` varchar(50) NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.phone_numbers: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_phones
CREATE TABLE IF NOT EXISTS `phone_phones` (
  `id` varchar(100) NOT NULL,
  `owner_id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pin` varchar(4) DEFAULT NULL,
  `face_id` varchar(100) DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `is_setup` tinyint(1) DEFAULT 0,
  `assigned` tinyint(1) DEFAULT 0,
  `battery` int(11) NOT NULL DEFAULT 100,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_phones: ~12 rows (approximately)
INSERT INTO `phone_phones` (`id`, `owner_id`, `phone_number`, `name`, `pin`, `face_id`, `settings`, `is_setup`, `assigned`, `battery`) VALUES
	('3so99', 'STG67749', '4802596427', 'J.D. \'s Phone', '6122', NULL, '{"locale":"en","doNotDisturb":false,"lockscreen":{"color":"gradient","fontStyle":1,"layout":1},"time":{"twelveHourClock":false},"weather":{"celcius":false},"latestVersion":"2.1.4","airplaneMode":false,"wallpaper":{"background":"cloud8","blur":false},"phone":{"showCallerId":true},"notifications":[],"version":"2.1.2","apps":[["Phone","Messages","Camera","Photos"],["Settings","AppStore","Clock","Mail","Weather","Wallet","Garage","Home","Maps","Notes","Calculator","VoiceMemo","Music","Services"]],"name":"J.D. \'s Phone","storage":{"used":8576331,"total":128000000},"display":{"size":0.7,"brightness":1,"theme":"dark","automatic":false},"security":{"pinCode":true,"faceId":false},"sound":{"volume":0.5,"texttone":"default","silent":false,"ringtone":"default"},"streamerMode":false}', 1, 1, 100),
	('542rL', 'YFB89595', '9072660558', 'Kitty\'s Phone', '9791', 'YFB89595', '{"notifications":[],"wallpaper":{"background":"cloud8","blur":false},"security":{"faceId":true,"pinCode":true},"name":"Kitty\'s Phone","phone":{"showCallerId":true},"time":{"twelveHourClock":false},"doNotDisturb":false,"display":{"automatic":false,"brightness":1,"size":0.7,"theme":"light"},"version":"2.1.2","latestVersion":"2.1.4","weather":{"celcius":false},"airplaneMode":false,"storage":{"used":8576331,"total":128000000},"lockscreen":{"fontStyle":1,"color":"gradient","layout":1},"apps":[["Phone","Messages","Camera","Photos"],["Settings","AppStore","Clock","Mail","Weather","Wallet","Garage","Home","Maps","Notes","Calculator","VoiceMemo","Music","Services"]],"streamerMode":false,"sound":{"ringtone":"default","silent":false,"volume":0.5,"texttone":"default"},"locale":"en"}', 1, 1, 100),
	('7662w', 'HEU60167', '6023367331', 'ThaPlug', NULL, NULL, '{"phone":{"showCallerId":true},"locale":"en","latestVersion":"2.1.4","wallpaper":{"blur":false,"background":"cloud8"},"streamerMode":false,"version":"2.1.2","storage":{"total":128000000,"used":8747135.52},"sound":{"ringtone":"default","texttone":"default","volume":0.5,"silent":false},"time":{"twelveHourClock":false},"display":{"theme":"dark","brightness":1,"size":0.7,"automatic":false},"notifications":[],"weather":{"celcius":false},"security":{"faceId":false,"pinCode":false},"lockscreen":{"layout":1,"fontStyle":1,"color":"gradient"},"doNotDisturb":false,"apps":[["Phone","Messages","Camera","Photos"],["Settings","AppStore","Clock","Mail","Weather","Wallet","Garage","Home","Maps","Notes","Calculator","VoiceMemo","Music","Services","Crypto","Instagram","TikTok","Twitter","MarketPlace","YellowPages","DarkChat"]],"airplaneMode":false,"name":"ThaPlug"}', 1, 1, 100),
	('7eBFU', 'UMV88168', '6021638057', 'Andy\'s Phone', NULL, NULL, '{"streamerMode":false,"version":"2.1.2","time":{"twelveHourClock":false},"sound":{"volume":0.5,"texttone":"default","ringtone":"default","silent":false},"doNotDisturb":false,"storage":{"total":128000000,"used":8576331},"notifications":[],"latestVersion":"2.1.4","apps":[["Phone","Messages","Camera","Photos"],["Settings","AppStore","Clock","Mail","Weather","Wallet","Garage","Home","Maps","Notes","Calculator","VoiceMemo","Music","Services"]],"display":{"automatic":false,"size":0.7,"brightness":1,"theme":"dark"},"phone":{"showCallerId":true},"wallpaper":{"blur":false,"background":"cloud8"},"lockscreen":{"fontStyle":1,"color":"gradient","layout":1},"security":{"faceId":false,"pinCode":false},"airplaneMode":false,"locale":"en","name":"Andy\'s Phone","weather":{"celcius":false}}', 1, 1, 100),
	('8Vx93', 'EBT98762', '5203155123', 'Chris Ray', NULL, NULL, '{"sound":{"silent":false,"texttone":"default","ringtone":"default","volume":0.5},"security":{"pinCode":false,"faceId":false},"version":"2.1.2","doNotDisturb":false,"airplaneMode":false,"weather":{"celcius":false},"apps":[["Phone","Messages","Camera","Photos"],["Settings","AppStore","Clock","Mail","Weather","Wallet","Garage","Home","Maps","Notes","Calculator","VoiceMemo","Music","Services"]],"time":{"twelveHourClock":false},"name":"Chris Ray","storage":{"used":8576331,"total":128000000},"display":{"automatic":false,"theme":"dark","size":0.7,"brightness":1},"streamerMode":false,"notifications":[],"phone":{"showCallerId":true},"wallpaper":{"background":"cloud8","blur":false},"latestVersion":"2.1.4","lockscreen":{"layout":1,"color":"gradient","fontStyle":1},"locale":"en"}', 1, 1, 100),
	('919Gw', 'YDT13754', '6029973306', 'jason\'s Phone', NULL, NULL, '{"storage":{"total":128000000,"used":8576331},"name":"jason\'s Phone","streamerMode":false,"airplaneMode":false,"version":"2.1.2","sound":{"texttone":"default","volume":0.5,"silent":false,"ringtone":"default"},"display":{"theme":"light","brightness":1,"automatic":false,"size":0.7},"security":{"pinCode":false,"faceId":false},"doNotDisturb":false,"lockscreen":{"fontStyle":1,"color":"gradient","layout":1},"latestVersion":"2.1.4","wallpaper":{"blur":false,"background":"cloud8"},"time":{"twelveHourClock":false},"apps":[["Phone","Messages","Camera","Photos"],["Settings","AppStore","Clock","Mail","Weather","Wallet","Garage","Home","Maps","Notes","Calculator","VoiceMemo","Music","Services","Twitter","Crypto","DarkChat","TikTok","YellowPages","Instagram","MarketPlace","Tinder"]],"phone":{"showCallerId":true},"locale":"en","weather":{"celcius":false},"notifications":[]}', 1, 1, 100),
	('A85o1', 'HOU41578', '5204960215', 'Demons\'s Phone', NULL, NULL, '{"latestVersion":"2.1.4","weather":{"celcius":false},"display":{"size":0.7,"theme":"dark","brightness":1,"automatic":false},"sound":{"volume":0.5,"ringtone":"default","silent":false,"texttone":"default"},"streamerMode":false,"lockscreen":{"fontStyle":1,"layout":1,"color":"gradient"},"storage":{"total":128000000,"used":8576331},"name":"Demons\'s Phone","wallpaper":{"blur":false,"background":"cloud8"},"security":{"pinCode":false,"faceId":false},"phone":{"showCallerId":true},"notifications":[],"apps":[["Phone","Messages","Camera","Photos"],["Settings","AppStore","Clock","Mail","Weather","Wallet","Garage","Home","Maps","Notes","Calculator","VoiceMemo","Music","Services"]],"version":"2.1.2","locale":"en","airplaneMode":false,"time":{"twelveHourClock":false},"doNotDisturb":false}', 1, 1, 100),
	('h58x6', 'CWY62276', '2059488312', 'Mr\'s Phone', NULL, NULL, '{"locale":"en","phone":{"showCallerId":true},"wallpaper":{"background":"cloud8","blur":false},"doNotDisturb":false,"storage":{"total":128000000,"used":8576331},"time":{"twelveHourClock":false},"latestVersion":"2.1.4","lockscreen":{"layout":1,"fontStyle":1,"color":"gradient"},"notifications":[],"airplaneMode":false,"weather":{"celcius":false},"sound":{"volume":0.5,"silent":false,"ringtone":"default","texttone":"default"},"version":"2.1.2","security":{"pinCode":false,"faceId":false},"streamerMode":false,"name":"Mr\'s Phone","display":{"brightness":1,"theme":"dark","automatic":false,"size":0.7},"apps":[["Phone","Messages","Camera","Photos"],["Settings","AppStore","Clock","Mail","Weather","Wallet","Garage","Home","Maps","Notes","Calculator","VoiceMemo","Music","Services","Crypto"]]}', 1, 1, 100),
	('o2265', 'RDT43347', '4809315005', 'Test\'s Phone', '1234', 'RDT43347', '{"lockscreen":{"layout":1,"color":"gradient","fontStyle":1},"weather":{"celcius":false},"notifications":[],"name":"Test\'s Phone","locale":"en","version":"2.1.2","phone":{"showCallerId":true},"wallpaper":{"blur":false,"background":"cloud8"},"sound":{"ringtone":"default","silent":false,"volume":0.5,"texttone":"default"},"doNotDisturb":false,"streamerMode":false,"security":{"pinCode":true,"faceId":true},"latestVersion":"2.1.4","storage":{"used":8577334.94,"total":128000000},"time":{"twelveHourClock":false},"apps":[["Phone","Messages","Camera","Photos"],["Settings","AppStore","Clock","Mail","Weather","Wallet","Garage","Home","Maps","Notes","Calculator","VoiceMemo","Music","Services"]],"display":{"theme":"light","brightness":1,"size":0.7,"automatic":false},"airplaneMode":false}', 1, 1, 100),
	('rsBsc', 'RZY43875', '5207830775', 'John\'s Phone', '6122', NULL, '{"phone":{"showCallerId":true},"locale":"en","latestVersion":"2.1.4","wallpaper":{"blur":false,"background":"cloud8"},"security":{"pinCode":true,"faceId":false},"version":"2.1.2","storage":{"used":8576331,"total":128000000},"sound":{"ringtone":"default","texttone":"default","silent":false,"volume":0.5},"name":"John\'s Phone","display":{"theme":"dark","brightness":1,"size":0.7,"automatic":false},"notifications":[],"airplaneMode":false,"weather":{"celcius":false},"lockscreen":{"layout":1,"fontStyle":1,"color":"gradient"},"doNotDisturb":false,"apps":[["Phone","Messages","Camera","Photos"],["Settings","AppStore","Clock","Mail","Weather","Wallet","Garage","Home","Maps","Notes","Calculator","VoiceMemo","Music","Services"]],"streamerMode":false,"time":{"twelveHourClock":false}}', 1, 1, 100),
	('T3p51', 'UMV88168', '2057042489', 'Andy\'s Phone', '4008', 'UMV88168', '{"security":{"pinCode":true,"faceId":true},"latestVersion":"2.1.4","notifications":[],"version":"2.1.2","storage":{"used":8576331,"total":128000000},"lockscreen":{"fontStyle":1,"layout":1,"color":"gradient"},"doNotDisturb":false,"apps":[["Phone","Messages","Camera","Photos"],["Settings","AppStore","Clock","Mail","Weather","Wallet","Garage","Home","Maps","Notes","Calculator","VoiceMemo","Music","Services","Crypto","Twitter","YellowPages","MarketPlace","TikTok","Tinder","Instagram","DarkChat"]],"wallpaper":{"background":"cloud8","blur":false},"locale":"en","weather":{"celcius":false},"streamerMode":false,"airplaneMode":false,"display":{"brightness":1,"size":0.7,"automatic":false,"theme":"dark"},"sound":{"silent":false,"ringtone":"default","texttone":"default","volume":0.5},"phone":{"showCallerId":true},"time":{"twelveHourClock":false},"name":"Andy\'s Phone"}', 1, 1, 100),
	('u8138', 'ETF72063', '2051567158', 'David\'s Phone', '5150', 'ETF72063', '{"notifications":[],"name":"David\'s Phone","streamerMode":false,"airplaneMode":false,"version":"2.1.2","sound":{"texttone":"default","silent":false,"volume":0.5,"ringtone":"default"},"display":{"theme":"dark","brightness":1,"automatic":false,"size":0.7},"security":{"pinCode":true,"faceId":true},"doNotDisturb":false,"lockscreen":{"fontStyle":1,"color":"gradient","layout":1},"latestVersion":"2.1.4","wallpaper":{"blur":false,"background":"cloud8"},"phone":{"showCallerId":true},"weather":{"celcius":false},"locale":"en","time":{"twelveHourClock":false},"apps":[["Phone","Messages","Camera","Photos"],["Settings","AppStore","Clock","Mail","Weather","Wallet","Garage","Home","Maps","Notes","Calculator","VoiceMemo","Music","Services","Twitter","Instagram","YellowPages","MarketPlace"]],"storage":{"used":9056031,"total":128000000}}', 1, 1, 100);

-- Dumping structure for table worldisyours.phone_phone_blocked_numbers
CREATE TABLE IF NOT EXISTS `phone_phone_blocked_numbers` (
  `phone_number` varchar(15) NOT NULL,
  `blocked_number` varchar(15) NOT NULL,
  PRIMARY KEY (`phone_number`,`blocked_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_phone_blocked_numbers: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_phone_calls
CREATE TABLE IF NOT EXISTS `phone_phone_calls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `caller` varchar(15) NOT NULL,
  `callee` varchar(15) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `answered` tinyint(1) DEFAULT 0,
  `hide_caller_id` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_phone_calls: ~7 rows (approximately)
INSERT INTO `phone_phone_calls` (`id`, `caller`, `callee`, `duration`, `answered`, `hide_caller_id`, `timestamp`) VALUES
	(7, '4802596427', '911', 0, 0, 0, '2024-11-10 15:04:27'),
	(8, '4802596427', '911', 0, 0, 0, '2024-11-10 15:55:10'),
	(9, '4802596427', '6023367331', 20, 0, 0, '2024-11-10 15:57:29'),
	(10, '2057042489', '7334318274', 0, 0, 0, '2024-11-10 16:47:39'),
	(11, '2057042489', '7334318274', 0, 0, 0, '2024-11-10 16:50:12'),
	(12, '2057042489', '7334318274', 0, 0, 0, '2024-11-10 16:53:09'),
	(13, '2057042489', '7334318274', 0, 0, 0, '2024-11-10 17:24:48');

-- Dumping structure for table worldisyours.phone_phone_contacts
CREATE TABLE IF NOT EXISTS `phone_phone_contacts` (
  `contact_phone_number` varchar(15) NOT NULL,
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `profile_image` varchar(500) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `favourite` tinyint(1) DEFAULT 0,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`contact_phone_number`,`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_phone_contacts: ~7 rows (approximately)
INSERT INTO `phone_phone_contacts` (`contact_phone_number`, `firstname`, `lastname`, `profile_image`, `email`, `address`, `favourite`, `phone_number`) VALUES
	('2057042489', 'Andy\'s Phone', '', NULL, NULL, NULL, 0, '4802596427'),
	('4802596427', 'J.D. \'s Phone', '', NULL, NULL, NULL, 0, '2057042489'),
	('4802596427', 'J.D. \'s Phone', '', NULL, NULL, NULL, 0, '6023367331'),
	('4802596427', 'J.D. \'s Phone', '', NULL, NULL, NULL, 0, '6029973306'),
	('6023367331', 'ThaPlug', '', NULL, NULL, NULL, 1, '4802596427'),
	('6023367331', 'ThaPlug', '', NULL, NULL, NULL, 0, '4809315005'),
	('6029973306', 'jason\'s Phone', '', NULL, NULL, NULL, 0, '4802596427');

-- Dumping structure for table worldisyours.phone_phone_voicemail
CREATE TABLE IF NOT EXISTS `phone_phone_voicemail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `caller` varchar(15) NOT NULL,
  `callee` varchar(15) NOT NULL,
  `url` varchar(500) NOT NULL,
  `duration` int(11) NOT NULL,
  `hide_caller_id` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_phone_voicemail: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_photos
CREATE TABLE IF NOT EXISTS `phone_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `link` varchar(500) NOT NULL,
  `is_video` tinyint(1) DEFAULT 0,
  `size` float NOT NULL DEFAULT 0,
  `metadata` varchar(20) DEFAULT NULL,
  `is_favourite` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_photos_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_photos: ~8 rows (approximately)
INSERT INTO `phone_photos` (`id`, `phone_number`, `link`, `is_video`, `size`, `metadata`, `is_favourite`, `timestamp`) VALUES
	(25, '6023367331', 'https://r2.fivemanage.com/images/sbnyugR89gRQ.webp', 0, 171.68, 'selfie', 0, '2024-11-10 04:39:30'),
	(26, '4809315005', 'https://r2.fivemanage.com/images/HbTJs5pCJsi3.webp', 0, 289.82, NULL, 0, '2024-11-10 04:48:30'),
	(27, '6023367331', 'https://r2.fivemanage.com/images/HbTJs5pCJsi3.webp', 0, 289.82, 'import', 0, '2024-11-10 04:49:43'),
	(28, '6023367331', 'https://r2.fivemanage.com/images/UuQzl5gPze5r.webp', 0, 239.36, NULL, 0, '2024-11-10 04:50:30'),
	(29, '6023367331', 'https://r2.fivemanage.com/images/0L04lwaDYgP1.webp', 0, 289.98, NULL, 0, '2024-11-10 04:51:02'),
	(30, '6023367331', 'https://r2.fivemanage.com/images/3OMTuUBI8Lk1.webp', 0, 299.56, NULL, 0, '2024-11-10 04:51:31'),
	(31, '4809315005', 'https://r2.fivemanage.com/images/WwP8z6IbUBw6.webp', 0, 714.12, NULL, 0, '2024-11-10 04:53:02'),
	(32, '6023367331', 'https://r2.fivemanage.com/images/WwP8z6IbUBw6.webp', 0, 714.12, 'import', 0, '2024-11-10 04:53:23');

-- Dumping structure for table worldisyours.phone_photo_albums
CREATE TABLE IF NOT EXISTS `phone_photo_albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_photo_albums_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_photo_albums: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_photo_album_photos
CREATE TABLE IF NOT EXISTS `phone_photo_album_photos` (
  `album_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  PRIMARY KEY (`album_id`,`photo_id`),
  KEY `photo_id` (`photo_id`),
  CONSTRAINT `phone_photo_album_photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `phone_photo_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_photo_album_photos_ibfk_2` FOREIGN KEY (`photo_id`) REFERENCES `phone_photos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_photo_album_photos: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_services_channels
CREATE TABLE IF NOT EXISTS `phone_services_channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `company` varchar(50) NOT NULL,
  `last_message` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_services_channels: ~10 rows (approximately)
INSERT INTO `phone_services_channels` (`id`, `phone_number`, `company`, `last_message`, `timestamp`) VALUES
	(1, '4809128140', 'ambulance', '<!SENT-LOCATION-X=-8.70Y=-1667.41!>', '2024-10-22 17:55:18'),
	(2, '4809128140', 'police', '<!SENT-LOCATION-X=-8.70Y=-1667.41!>', '2024-10-22 17:55:18'),
	(3, '4804115400', 'ambulance', '<!SENT-LOCATION-X=-107.32Y=-801.22!>', '2024-10-27 21:23:55'),
	(4, '4804115400', 'police', '<!SENT-LOCATION-X=-107.51Y=-801.44!>', '2024-10-27 21:23:55'),
	(5, '6026476804', 'ambulance', '<!SENT-LOCATION-X=47.22Y=-737.65!>', '2024-10-24 22:47:56'),
	(6, '6026476804', 'police', '<!SENT-LOCATION-X=47.22Y=-737.65!>', '2024-10-24 22:47:57'),
	(7, '6029973306', 'ambulance', '<!SENT-LOCATION-X=-27.04Y=-1659.81!>', '2024-11-06 23:55:55'),
	(8, '6029973306', 'police', '<!SENT-LOCATION-X=-27.04Y=-1659.81!>', '2024-11-06 23:55:55'),
	(9, '4809315005', 'ambulance', '<!SENT-LOCATION-X=-47.43Y=-1659.71!>', '2024-11-06 23:21:43'),
	(10, '4809315005', 'police', '<!SENT-LOCATION-X=-47.43Y=-1659.71!>', '2024-11-06 23:21:43');

-- Dumping structure for table worldisyours.phone_services_messages
CREATE TABLE IF NOT EXISTS `phone_services_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL,
  `sender` varchar(15) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `x_pos` int(11) DEFAULT NULL,
  `y_pos` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`),
  CONSTRAINT `phone_services_messages_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_services_channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_services_messages: ~18 rows (approximately)
INSERT INTO `phone_services_messages` (`id`, `channel_id`, `sender`, `message`, `x_pos`, `y_pos`, `timestamp`) VALUES
	(49, 7, '6029973306', 'Unconscious person', 346, -705, '2024-11-06 23:07:37'),
	(50, 7, '6029973306', '<!SENT-LOCATION-X=346.45Y=-704.97!>', 346, -705, '2024-11-06 23:07:38'),
	(51, 8, '6029973306', 'Unconscious person', 346, -705, '2024-11-06 23:07:38'),
	(52, 8, '6029973306', '<!SENT-LOCATION-X=346.45Y=-704.97!>', 346, -705, '2024-11-06 23:07:38'),
	(53, 7, '6029973306', 'Unconscious person', 1, -1641, '2024-11-06 23:21:01'),
	(54, 7, '6029973306', '<!SENT-LOCATION-X=1.22Y=-1641.27!>', 1, -1641, '2024-11-06 23:21:02'),
	(55, 8, '6029973306', 'Unconscious person', 1, -1641, '2024-11-06 23:21:02'),
	(56, 8, '6029973306', '<!SENT-LOCATION-X=1.22Y=-1641.27!>', 1, -1641, '2024-11-06 23:21:02'),
	(57, 9, '4809315005', 'Unconscious person', -47, -1660, '2024-11-06 23:21:43'),
	(58, 9, '4809315005', '<!SENT-LOCATION-X=-47.43Y=-1659.71!>', -47, -1660, '2024-11-06 23:21:43'),
	(59, 10, '4809315005', 'Unconscious person', -47, -1660, '2024-11-06 23:21:43'),
	(60, 10, '4809315005', '<!SENT-LOCATION-X=-47.43Y=-1659.71!>', -47, -1660, '2024-11-06 23:21:43'),
	(61, 7, '6029973306', 'Unconscious person', 79, -1023, '2024-11-06 23:33:03'),
	(62, 7, '6029973306', '<!SENT-LOCATION-X=78.67Y=-1022.56!>', 79, -1023, '2024-11-06 23:33:03'),
	(63, 8, '6029973306', 'Unconscious person', 79, -1023, '2024-11-06 23:33:04'),
	(64, 8, '6029973306', '<!SENT-LOCATION-X=78.65Y=-1022.55!>', 79, -1023, '2024-11-06 23:33:04'),
	(65, 7, '6029973306', 'Unconscious person', -27, -1660, '2024-11-06 23:55:55'),
	(66, 7, '6029973306', '<!SENT-LOCATION-X=-27.04Y=-1659.81!>', -27, -1660, '2024-11-06 23:55:55'),
	(67, 8, '6029973306', 'Unconscious person', -27, -1660, '2024-11-06 23:55:55'),
	(68, 8, '6029973306', '<!SENT-LOCATION-X=-27.04Y=-1659.81!>', -27, -1660, '2024-11-06 23:55:55');

-- Dumping structure for table worldisyours.phone_tiktok_accounts
CREATE TABLE IF NOT EXISTS `phone_tiktok_accounts` (
  `name` varchar(30) NOT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `video_count` int(11) NOT NULL DEFAULT 0,
  `twitter` varchar(20) DEFAULT NULL,
  `instagram` varchar(20) DEFAULT NULL,
  `show_likes` tinyint(1) DEFAULT 1,
  `phone_number` varchar(15) NOT NULL,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_tiktok_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tiktok_accounts: ~0 rows (approximately)
INSERT INTO `phone_tiktok_accounts` (`name`, `bio`, `avatar`, `username`, `password`, `verified`, `follower_count`, `following_count`, `like_count`, `video_count`, `twitter`, `instagram`, `show_likes`, `phone_number`, `date_joined`) VALUES
	('anders', NULL, NULL, 'anders', '$2a$11$xZZvsEFKnweFWj6jzWU5FO94DL9T6JdzPMvgOYt8QYhyTcjUqqFXa', 0, 0, 0, 0, 0, NULL, NULL, 1, '2057042489', '2024-11-09 03:33:59');

-- Dumping structure for table worldisyours.phone_tiktok_channels
CREATE TABLE IF NOT EXISTS `phone_tiktok_channels` (
  `id` varchar(10) NOT NULL,
  `last_message` varchar(50) NOT NULL,
  `member_1` varchar(20) NOT NULL,
  `member_2` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_1` (`member_1`,`member_2`),
  KEY `member_2` (`member_2`),
  CONSTRAINT `phone_tiktok_channels_ibfk_1` FOREIGN KEY (`member_1`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_channels_ibfk_2` FOREIGN KEY (`member_2`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tiktok_channels: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_tiktok_comments
CREATE TABLE IF NOT EXISTS `phone_tiktok_comments` (
  `id` varchar(10) NOT NULL,
  `reply_to` varchar(10) DEFAULT NULL,
  `video_id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `comment` varchar(550) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `replies` int(11) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `video_id` (`video_id`),
  KEY `username` (`username`),
  KEY `reply_to` (`reply_to`),
  CONSTRAINT `phone_tiktok_comments_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_comments_ibfk_2` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_comments_ibfk_3` FOREIGN KEY (`reply_to`) REFERENCES `phone_tiktok_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tiktok_comments: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_tiktok_comments_likes
CREATE TABLE IF NOT EXISTS `phone_tiktok_comments_likes` (
  `username` varchar(20) NOT NULL,
  `comment_id` varchar(10) NOT NULL,
  PRIMARY KEY (`username`,`comment_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `phone_tiktok_comments_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_comments_likes_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `phone_tiktok_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tiktok_comments_likes: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_tiktok_follows
CREATE TABLE IF NOT EXISTS `phone_tiktok_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  PRIMARY KEY (`followed`,`follower`),
  KEY `follower` (`follower`),
  CONSTRAINT `phone_tiktok_follows_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_follows_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tiktok_follows: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_tiktok_likes
CREATE TABLE IF NOT EXISTS `phone_tiktok_likes` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL,
  PRIMARY KEY (`username`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `phone_tiktok_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_likes_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tiktok_likes: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_tiktok_messages
CREATE TABLE IF NOT EXISTS `phone_tiktok_messages` (
  `id` varchar(10) NOT NULL,
  `channel_id` varchar(10) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`),
  KEY `sender` (`sender`),
  CONSTRAINT `phone_tiktok_messages_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_tiktok_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_messages_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tiktok_messages: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_tiktok_notifications
CREATE TABLE IF NOT EXISTS `phone_tiktok_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `video_id` varchar(10) DEFAULT NULL,
  `comment_id` varchar(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `from` (`from`),
  KEY `video_id` (`video_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `phone_tiktok_notifications_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_notifications_ibfk_2` FOREIGN KEY (`from`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_notifications_ibfk_3` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_notifications_ibfk_4` FOREIGN KEY (`comment_id`) REFERENCES `phone_tiktok_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tiktok_notifications: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_tiktok_pinned_videos
CREATE TABLE IF NOT EXISTS `phone_tiktok_pinned_videos` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL,
  PRIMARY KEY (`username`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `phone_tiktok_pinned_videos_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_pinned_videos_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tiktok_pinned_videos: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_tiktok_saves
CREATE TABLE IF NOT EXISTS `phone_tiktok_saves` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL,
  PRIMARY KEY (`username`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `phone_tiktok_saves_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_saves_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tiktok_saves: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_tiktok_unread_messages
CREATE TABLE IF NOT EXISTS `phone_tiktok_unread_messages` (
  `username` varchar(20) NOT NULL,
  `channel_id` varchar(10) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`username`,`channel_id`),
  KEY `channel_id` (`channel_id`),
  CONSTRAINT `phone_tiktok_unread_messages_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_unread_messages_ibfk_2` FOREIGN KEY (`channel_id`) REFERENCES `phone_tiktok_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tiktok_unread_messages: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_tiktok_videos
CREATE TABLE IF NOT EXISTS `phone_tiktok_videos` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `src` varchar(500) NOT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `music` text DEFAULT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `comments` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `saves` int(11) NOT NULL DEFAULT 0,
  `pinned_comment` varchar(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `phone_tiktok_videos_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tiktok_videos: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_tiktok_views
CREATE TABLE IF NOT EXISTS `phone_tiktok_views` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL,
  PRIMARY KEY (`username`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `phone_tiktok_views_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tiktok_views_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tiktok_views: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_tinder_accounts
CREATE TABLE IF NOT EXISTS `phone_tinder_accounts` (
  `name` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `photos` text DEFAULT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `dob` date NOT NULL,
  `is_male` tinyint(1) NOT NULL,
  `interested_men` tinyint(1) NOT NULL,
  `interested_women` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`phone_number`),
  CONSTRAINT `phone_tinder_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tinder_accounts: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_tinder_matches
CREATE TABLE IF NOT EXISTS `phone_tinder_matches` (
  `phone_number_1` varchar(15) NOT NULL,
  `phone_number_2` varchar(15) NOT NULL,
  `latest_message` varchar(1000) DEFAULT NULL,
  `latest_message_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`phone_number_1`,`phone_number_2`),
  KEY `phone_number_2` (`phone_number_2`),
  CONSTRAINT `phone_tinder_matches_ibfk_1` FOREIGN KEY (`phone_number_1`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tinder_matches_ibfk_2` FOREIGN KEY (`phone_number_2`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tinder_matches: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_tinder_messages
CREATE TABLE IF NOT EXISTS `phone_tinder_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(15) NOT NULL,
  `recipient` varchar(15) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `recipient` (`recipient`),
  CONSTRAINT `phone_tinder_messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tinder_messages_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tinder_messages: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_tinder_swipes
CREATE TABLE IF NOT EXISTS `phone_tinder_swipes` (
  `swiper` varchar(15) NOT NULL,
  `swipee` varchar(15) NOT NULL,
  `liked` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`swiper`,`swipee`),
  KEY `swipee` (`swipee`),
  CONSTRAINT `phone_tinder_swipes_ibfk_1` FOREIGN KEY (`swiper`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_tinder_swipes_ibfk_2` FOREIGN KEY (`swipee`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_tinder_swipes: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` varchar(512) DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.phone_tweets: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_twitter_accounts
CREATE TABLE IF NOT EXISTS `phone_twitter_accounts` (
  `display_name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `profile_image` varchar(500) DEFAULT NULL,
  `profile_header` varchar(500) DEFAULT NULL,
  `pinned_tweet` varchar(50) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `private` tinyint(1) DEFAULT 0,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_twitter_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_twitter_accounts: ~3 rows (approximately)
INSERT INTO `phone_twitter_accounts` (`display_name`, `username`, `password`, `phone_number`, `bio`, `profile_image`, `profile_header`, `pinned_tweet`, `verified`, `follower_count`, `following_count`, `private`, `date_joined`) VALUES
	('Plug', 'bihplug', '$2a$11$EzEn0H0gSdo0nrs0O3M3veMvzjCsEIoACt1nhZg9nsEgakrHo3qTi', '6023367331', 'Need Shit Hit Me Up I Got All The Goods', 'https://r2.fivemanage.com/images/sbnyugR89gRQ.webp', 'https://r2.fivemanage.com/images/WwP8z6IbUBw6.webp', NULL, 0, 0, 0, 0, '2024-11-10 04:38:45'),
	('jason bourne', 'col.bourne', '$2a$11$PstGa/jmakH4PeLeAaL6KeatDWDQlOzPPfxDiCGb.uKal7uHmVVHi', '6029973306', NULL, NULL, NULL, NULL, 0, 0, 0, 0, '2024-11-10 02:19:25'),
	('anders', 'murphy', '$2a$11$lSD6klhiPv8qWLD6x9.Ti.jKTjCUGbO2cJ/g.AVe6Z1vsRYAKrUQK', '2057042489', NULL, NULL, NULL, NULL, 0, 0, 0, 0, '2024-11-09 03:33:42');

-- Dumping structure for table worldisyours.phone_twitter_follows
CREATE TABLE IF NOT EXISTS `phone_twitter_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  `notifications` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`followed`,`follower`),
  KEY `follower` (`follower`),
  CONSTRAINT `phone_twitter_follows_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_twitter_follows_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_twitter_follows: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_twitter_follow_requests
CREATE TABLE IF NOT EXISTS `phone_twitter_follow_requests` (
  `requester` varchar(20) NOT NULL,
  `requestee` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`requester`,`requestee`),
  KEY `requestee` (`requestee`),
  CONSTRAINT `phone_twitter_follow_requests_ibfk_1` FOREIGN KEY (`requester`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_twitter_follow_requests_ibfk_2` FOREIGN KEY (`requestee`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_twitter_follow_requests: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_twitter_hashtags
CREATE TABLE IF NOT EXISTS `phone_twitter_hashtags` (
  `hashtag` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `last_used` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`hashtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_twitter_hashtags: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_twitter_likes
CREATE TABLE IF NOT EXISTS `phone_twitter_likes` (
  `tweet_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`tweet_id`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `phone_twitter_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_twitter_likes: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_twitter_messages
CREATE TABLE IF NOT EXISTS `phone_twitter_messages` (
  `id` varchar(10) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `recipient` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `recipient` (`recipient`),
  CONSTRAINT `phone_twitter_messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_twitter_messages_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_twitter_messages: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_twitter_notifications
CREATE TABLE IF NOT EXISTS `phone_twitter_notifications` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `tweet_id` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `from` (`from`),
  CONSTRAINT `phone_twitter_notifications_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_twitter_notifications_ibfk_2` FOREIGN KEY (`from`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_twitter_notifications: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_twitter_promoted
CREATE TABLE IF NOT EXISTS `phone_twitter_promoted` (
  `tweet_id` varchar(50) NOT NULL,
  `promotions` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tweet_id`),
  CONSTRAINT `phone_twitter_promoted_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `phone_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_twitter_promoted: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_twitter_retweets
CREATE TABLE IF NOT EXISTS `phone_twitter_retweets` (
  `tweet_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`tweet_id`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `phone_twitter_retweets_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_twitter_retweets: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_twitter_tweets
CREATE TABLE IF NOT EXISTS `phone_twitter_tweets` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `content` varchar(280) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `reply_to` varchar(50) DEFAULT NULL,
  `like_count` int(11) DEFAULT 0,
  `reply_count` int(11) DEFAULT 0,
  `retweet_count` int(11) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `phone_twitter_tweets_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_twitter_tweets: ~1 rows (approximately)
INSERT INTO `phone_twitter_tweets` (`id`, `username`, `content`, `attachments`, `reply_to`, `like_count`, `reply_count`, `retweet_count`, `timestamp`) VALUES
	('yz78T', 'bihplug', '', '["https://r2.fivemanage.com/images/WwP8z6IbUBw6.webp"]', NULL, 0, 0, 0, '2024-11-10 15:33:23');

-- Dumping structure for table worldisyours.phone_voice_memos_recordings
CREATE TABLE IF NOT EXISTS `phone_voice_memos_recordings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_url` varchar(500) NOT NULL,
  `file_length` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_voice_memos_recordings_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_voice_memos_recordings: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_wallet_transactions
CREATE TABLE IF NOT EXISTS `phone_wallet_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `amount` int(11) NOT NULL,
  `company` varchar(50) NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `phone_wallet_transactions_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_wallet_transactions: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_yellow_pages_posts
CREATE TABLE IF NOT EXISTS `phone_yellow_pages_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `attachment` varchar(500) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.phone_yellow_pages_posts: ~0 rows (approximately)

-- Dumping structure for table worldisyours.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `apps` text DEFAULT NULL,
  `widget` text DEFAULT NULL,
  `bt` text DEFAULT NULL,
  `cryptocurrency` longtext DEFAULT NULL,
  `cryptocurrencytransfers` text DEFAULT NULL,
  `phonePos` text DEFAULT NULL,
  `spotify` text DEFAULT NULL,
  `ringtone` text DEFAULT NULL,
  `first_screen_showed` int(11) DEFAULT NULL,
  `xp` longtext DEFAULT NULL,
  `okokcrafts` longtext DEFAULT NULL,
  `inside` varchar(50) DEFAULT '',
  `note` longtext DEFAULT NULL,
  `tags` longtext DEFAULT '[]',
  `points` int(11) DEFAULT 0,
  `wanted` int(11) DEFAULT 0,
  `image` text DEFAULT NULL,
  `iban` varchar(255) DEFAULT NULL,
  `pincode` int(50) DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=18027 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.players: ~16 rows (approximately)
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `apps`, `widget`, `bt`, `cryptocurrency`, `cryptocurrencytransfers`, `phonePos`, `spotify`, `ringtone`, `first_screen_showed`, `xp`, `okokcrafts`, `inside`, `note`, `tags`, `points`, `wanted`, `image`, `iban`, `pincode`) VALUES
	(17302, 'AEZ52818', 1, 'license:98e0b2e1815d54cc17f2b2fa2ab4192ac0ec52a4', 'TooLITMafia', '{"crypto":0,"cash":500,"bank":5000}', '{"birthdate":"14.11.2012","nationality":"South Africa","lastname":"Soul","account":"US09QBCore6744418166","firstname":"Trey","gender":0,"phone":"9333157425"}', '{"name":"unemployed","payment":10,"type":"none","grade":{"level":0,"isboss":false,"name":"Freelancer"},"label":"Civilian","isboss":false,"onduty":false}', '{"label":"No Gang","name":"none","isboss":false,"grade":{"level":0,"isboss":false,"name":"Unaffiliated"}}', '{"x":164.24176025390626,"y":-1009.4505615234375,"z":29.4820556640625}', '{"licences":{"business":false,"driver":true,"weapon":false},"status":[],"drugxp":0,"phone":[],"hunger":74.79999999999999,"callsign":"NO CALLSIGN","injail":0,"tracker":false,"ishandcuffed":false,"criminalrecord":{"hasRecord":false},"jailitems":[],"overdosexp":0,"bloodtype":"O-","isdead":false,"thirst":77.20000000000002,"walletid":"QB-29934633","phonedata":{"SerialNumber":90785510,"InstalledApps":[]},"inside":{"apartment":[]},"rep":[],"inlaststand":false,"stress":0,"fingerprint":"Or042X42Ybb3135","armor":0,"oxyxp":0}', '[{"count":500,"slot":1,"name":"money"},{"metadata":{"lastname":"Soul","firstname":"Trey","birthdate":"14.11.2012","type":"Class C Driver License"},"count":1,"slot":2,"name":"driver_license"},{"metadata":{"citizenid":"AEZ52818","birthdate":"14.11.2012","gender":0,"nationality":"South Africa","lastname":"Soul","firstname":"Trey"},"count":1,"slot":3,"name":"id_card"}]', '2024-11-21 00:35:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(14034, 'CWY62276', 1, 'license:a045ed84bc7b147ab67442c4be4c70a4bb7d0ad5', 'DEV Dx', '{"cash":5440,"crypto":0,"bank":9626}', '{"nationality":"Bangladesh","firstname":"Mr","gender":0,"birthdate":"01.10.2012","account":"US06QBCore3767689621","phone":"3546227272","lastname":"Dx"}', '{"name":"catcafe","onduty":false,"isboss":true,"grade":{"name":"Manager","level":4,"payment":150,"isboss":true},"type":"none","payment":150,"label":"Cat Cafe"}', '{"label":"No Gang","grade":{"isboss":false,"name":"Unaffiliated","level":0},"name":"none","isboss":false}', '{"x":-34.23296356201172,"y":20.83516693115234,"z":71.994140625}', '{"rep":[],"phone":[],"drugxp":0,"armor":0,"thirst":92.4,"inside":{"apartment":[]},"fingerprint":"kw761Z45fBp0891","hunger":91.6,"phonedata":{"SerialNumber":89582164,"InstalledApps":[]},"status":[],"tracker":false,"licences":{"weapon":false,"driver":true,"business":false},"bloodtype":"AB-","inlaststand":false,"walletid":"QB-72758983","criminalrecord":{"hasRecord":false},"injail":0,"stress":2.4,"oxyxp":0,"overdosexp":0,"isdead":false,"jailitems":[],"ishandcuffed":false,"callsign":"NO CALLSIGN"}', '[{"count":1,"name":"WEAPON_FLAREGUN","slot":1,"metadata":{"components":[],"registered":"Mr Dx","durability":100,"serial":"437044RZH620144","latentblood":{"5944543133373534":{"evidenceId":290714,"bloodtype":"B-"}},"ammo":0}},{"count":8,"name":"handcuffs","slot":2},{"count":1,"name":"id_card","slot":3,"metadata":{"lastname":"Dx","birthdate":"01.10.2012","firstname":"Mr","nationality":"Bangladesh","citizenid":"CWY62276","gender":0}},{"count":1,"name":"phone","slot":4,"metadata":{"lbPhoneName":"Mr\'s Phone","lbPhoneNumber":"2059488312","lbFormattedNumber":"(205) 948-8312"}},{"count":1,"name":"contracts_tablet","slot":5},{"count":5440,"name":"money","slot":6},{"count":1,"name":"driver_license","slot":7,"metadata":{"lastname":"Dx","type":"Class C Driver License","birthdate":"01.10.2012","firstname":"Mr"}},{"count":1,"name":"markedbills","slot":8,"metadata":{"worth":264}},{"count":1,"name":"markedbills","slot":9,"metadata":{"worth":267}},{"count":1,"name":"screwdriver","slot":10},{"count":1,"name":"advancedlockpick","slot":11},{"count":1,"name":"WEAPON_DIGISCANNER","slot":12,"metadata":{"durability":100,"components":[]}},{"count":1,"name":"jerry_can","slot":13},{"count":1,"name":"fuel_pump","slot":14},{"count":1,"name":"jerrycan","slot":15},{"count":1,"name":"radiocar_blue","slot":16},{"count":2,"name":"plastic","slot":18},{"count":1,"name":"thermite","slot":19},{"count":1,"name":"lockpick","slot":20},{"count":1,"name":"payticket","slot":21}]', '2024-11-23 05:46:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(16079, 'EBT98762', 4, 'license:f90cd271ae404268c3728c7b32d31095b7092b5b', 'SBDemon', '{"crypto":0,"cash":500,"bank":41050}', '{"lastname":"Ray","nationality":"United States","firstname":"Chris","phone":"7069054278","gender":0,"birthdate":"19.11.1995","account":"US04QBCore3805431422"}', '{"payment":3500,"label":"BCSO","isboss":true,"onduty":true,"type":"leo","name":"bcso","grade":{"name":"Sheriff","isboss":true,"payment":3500,"level":10}}', '{"name":"none","grade":{"level":0,"name":"Unaffiliated","isboss":false},"label":"No Gang","isboss":false}', '{"x":1836.883544921875,"y":3686.874755859375,"z":35.2615966796875}', '{"oxyxp":0,"bloodtype":"A+","drugxp":0,"injail":0,"hunger":100,"isdead":false,"ishandcuffed":false,"overdosexp":0,"phonedata":{"SerialNumber":95262873,"InstalledApps":[]},"jailitems":[],"criminalrecord":{"hasRecord":false},"walletid":"QB-90017377","armor":0,"inside":{"apartment":[]},"licences":{"business":false,"driver":true,"weapon":true},"stress":0,"status":[],"fingerprint":"Xg238g31qEI6745","thirst":100,"phone":[],"inlaststand":false,"rep":[],"tracker":false,"callsign":"NO CALLSIGN"}', '[{"slot":1,"name":"vehicle_manual","count":1},{"metadata":{"nationality":"United States","birthdate":"19.11.1995","lastname":"Ray","gender":0,"firstname":"Chris","citizenid":"EBT98762"},"slot":63,"name":"id_card","count":1},{"metadata":{"lastname":"Ray","firstname":"Chris","type":"Class C Driver License","birthdate":"19.11.1995"},"slot":64,"name":"driver_license","count":1},{"metadata":{"lbPhoneNumber":"5203155123","lbFormattedNumber":"(520) 315-5123","lbPhoneName":"Chris Ray"},"slot":62,"name":"phone","count":1},{"slot":61,"name":"money","count":500}]', '2024-11-10 01:57:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(16711, 'ETF72063', 1, 'license:6420bf4bfdea4c3827bd7e58537da2979425ce83', 'Dave', '{"cash":1756.0,"bank":9274,"crypto":0}', '{"account":"US03QBCore9944799966","nationality":"United States","gender":0,"firstname":"David","phone":"4761254552","lastname":"Kurgen","birthdate":"10.12.1982"}', '{"type":"none","onduty":true,"name":"garbage","grade":{"level":0,"payment":50,"name":"Collector","isboss":false},"payment":50,"label":"Garbage","isboss":false}', '{"label":"No Gang","isboss":false,"name":"none","grade":{"isboss":false,"name":"Unaffiliated","level":0}}', '{"x":1031.6702880859376,"y":-768.2373657226563,"z":58.160400390625}', '{"injail":0,"licences":{"driver":true,"business":false,"weapon":false},"inlaststand":false,"fingerprint":"ml138z34Hhe8906","jailitems":[],"overdosexp":0,"callsign":"NO CALLSIGN","stress":0.5,"armor":0,"hunger":86.99999999999987,"isdead":false,"walletid":"QB-48625752","rep":[],"phone":[],"bloodtype":"O-","tracker":false,"status":[],"drugxp":0,"inside":{"apartment":[]},"ishandcuffed":false,"phonedata":{"InstalledApps":[],"SerialNumber":60038531},"thirst":81.20000000000005,"oxyxp":0,"criminalrecord":{"hasRecord":false}}', '[{"count":1756,"slot":1,"name":"money"},{"metadata":{"type":"Class C Driver License","lastname":"Kurgen","firstname":"David","birthdate":"10.12.1982"},"count":1,"slot":2,"name":"driver_license"},{"metadata":{"gender":0,"firstname":"David","birthdate":"10.12.1982","citizenid":"ETF72063","nationality":"United States","lastname":"Kurgen"},"count":1,"slot":3,"name":"id_card"},{"count":9,"slot":4,"name":"sandwich"},{"count":8,"slot":5,"name":"water_bottle"},{"count":6,"slot":6,"name":"recyclablematerial"},{"metadata":{"lbPhoneName":"David\'s Phone","lbPhoneNumber":"2051567158","lbFormattedNumber":"(205) 156-7158"},"count":1,"slot":7,"name":"phone"},{"metadata":{"gender":0,"nationality":"United States","birthdate":"10.12.1982","type":"Class C Driver License","citizenid":"ETF72063","firstname":"David","lastname":"Kurgen"},"count":1,"slot":9,"name":"driver_license"}]', '2024-11-11 04:46:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(14035, 'HEU60167', 1, 'license:f90cd271ae404268c3728c7b32d31095b7092b5b', 'SBDemon', '{"crypto":0,"bank":9282.1,"cash":850}', '{"nationality":"United States","account":"US09QBCore7023982375","gender":0,"phone":"9558680257","lastname":"Rich","firstname":"Ryan","birthdate":"19.10.1998"}', '{"onduty":false,"isboss":true,"name":"burgershot","grade":{"level":4,"name":"Manager","isboss":true,"payment":150},"payment":150,"type":"none","label":"BurgerShot"}', '{"grade":{"name":"Unaffiliated","isboss":false,"level":0},"name":"none","isboss":false,"label":"No Gang"}', '{"x":-1304.7032470703126,"y":-1369.81982421875,"z":4.4937744140625}', '{"thirst":92.4,"jailitems":[],"licences":{"driver":true,"business":false,"weapon":true},"isdead":false,"callsign":"NO CALLSIGN","hunger":91.6,"overdosexp":0,"phonedata":{"InstalledApps":[],"SerialNumber":40795532},"rep":[],"injail":0,"bloodtype":"AB+","oxyxp":0,"criminalrecord":{"hasRecord":false},"inlaststand":false,"walletid":"QB-66779526","drugxp":0,"fingerprint":"Yn330Y96wMj5636","tracker":false,"inside":{"apartment":[]},"armor":0,"phone":[],"stress":0,"ishandcuffed":false,"status":[]}', '[{"slot":6,"metadata":{"durability":100,"ammo":0,"components":[],"registered":"Ryan Rich","serial":"282182DOR461188"},"count":1,"name":"WEAPON_BMGLOCK"},{"slot":7,"count":9,"name":"milkshake"},{"slot":8,"count":8,"name":"bleeder"},{"slot":9,"count":1,"name":"md_shovel"},{"slot":10,"count":1,"name":"toolbox"},{"slot":11,"count":1,"name":"mechanic_tools"},{"slot":63,"metadata":{"firstname":"Ryan","birthdate":"19.10.1998","lastname":"Rich","type":"Class C Driver License"},"count":1,"name":"driver_license"},{"slot":64,"metadata":{"lbPhoneName":"ThaPlug","lbPhoneNumber":"6023367331","lbFormattedNumber":"(602) 336-7331"},"count":1,"name":"phone"},{"slot":60,"count":17,"name":"perc30"},{"slot":61,"count":850,"name":"money"},{"slot":62,"metadata":{"firstname":"Ryan","birthdate":"19.10.1998","nationality":"United States","lastname":"Rich","gender":0,"citizenid":"HEU60167"},"count":1,"name":"id_card"},{"slot":26,"count":1,"name":"blue_metaldetector"}]', '2024-11-24 05:55:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(14125, 'HOU41578', 5, 'license:f90cd271ae404268c3728c7b32d31095b7092b5b', 'SBDemon', '{"crypto":0,"bank":5650.0,"cash":0}', '{"lastname":"Test","phone":"5913063326","nationality":"United States","firstname":"Demons","account":"US08QBCore6956600225","gender":0,"birthdate":"11.10.1947"}', '{"payment":150,"type":"none","name":"emergencydealership","isboss":true,"onduty":true,"label":"Emergency Vehicle Dealer","grade":{"payment":150,"isboss":true,"name":"Manager","level":4}}', '{"isboss":false,"name":"none","label":"No Gang","grade":{"isboss":false,"name":"Unaffiliated","level":0}}', '{"x":423.6131896972656,"y":-806.2153930664063,"z":29.4820556640625}', '{"licences":{"business":false,"driver":true,"weapon":true},"walletid":"QB-66036789","oxyxp":0,"status":[],"callsign":"NO CALLSIGN","fingerprint":"Oy606o21qGD5727","inside":{"apartment":[]},"injail":0,"drugxp":0,"tracker":false,"phone":[],"inlaststand":false,"thirst":39.20000000000004,"stress":0,"isdead":false,"bloodtype":"B-","overdosexp":0,"jailitems":[],"phonedata":{"SerialNumber":88328986,"InstalledApps":[]},"ishandcuffed":false,"hunger":32.79999999999995,"armor":0,"rep":[],"criminalrecord":{"hasRecord":false}}', '[{"name":"WEAPON_BAR15","metadata":{"ammo":0,"registered":"Demons Test","serial":"773314EEF160065","latentprints":{"Oy606o21qGD5727":{"integrity":100,"evidenceId":764748}},"components":[],"durability":100},"count":1,"slot":1},{"name":"WEAPON_BLUEGLOCKS","metadata":{"ammo":0,"registered":"Demons Test","serial":"704393CNB485212","latentprints":{"Oy606o21qGD5727":{"integrity":100,"evidenceId":593947}},"components":[],"durability":100},"count":1,"slot":2},{"name":"advancedlockpick","count":60,"slot":3},{"name":"phone","count":1,"slot":4},{"name":"id_card","metadata":{"nationality":"United States","birthdate":"11.10.1947","citizenid":"HOU41578","lastname":"Test","gender":0,"firstname":"Demons"},"count":1,"slot":63},{"name":"driver_license","metadata":{"type":"Class C Driver License","birthdate":"11.10.1947","firstname":"Demons","lastname":"Test"},"count":1,"slot":64},{"name":"mechanic_tools","count":1,"slot":59},{"name":"toolbox","count":1,"slot":60},{"name":"oxy","count":23,"slot":61},{"name":"phone","metadata":{"lbFormattedNumber":"(520) 496-0215","lbPhoneNumber":"5204960215","lbPhoneName":"Demons\'s Phone"},"count":1,"slot":62}]', '2024-11-21 03:17:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(16093, 'LKQ99821', 1, 'license:2de3c12da9320869ee4e5f2314ded8e70490d4d8', 'Puppystomper', '{"bank":5000,"cash":500,"crypto":0}', '{"nationality":"United States","birthdate":"01.12.1990","account":"US09QBCore9775864359","phone":"8806901815","firstname":"Maxwell","lastname":"Bentley","gender":0}', '{"grade":{"level":0,"name":"Freelancer"},"isboss":false,"label":"Civilian","payment":50,"onduty":false,"type":"none","name":"unemployed"}', '{"grade":{"level":0,"name":"none"},"label":"No Gang Affiliation","isboss":false,"name":"none"}', '{"x":77.9736328125,"y":-226.3120880126953,"z":54.6724853515625}', '{"hunger":57.99999999999997,"jailitems":[],"phonedata":{"SerialNumber":33888313,"InstalledApps":[]},"callsign":"NO CALLSIGN","bloodtype":"O-","licences":{"driver":true,"business":false,"weapon":false},"rep":[],"inlaststand":false,"tracker":false,"thirst":62.00000000000003,"criminalrecord":{"hasRecord":false},"isdead":false,"injail":0,"walletid":"QB-89142198","oxyxp":0,"armor":0,"overdosexp":0,"fingerprint":"HL070y39udx0329","status":[],"stress":0.6,"phone":[],"inside":{"apartment":[]},"drugxp":0,"ishandcuffed":false}', '[{"count":500,"slot":1,"name":"money"},{"count":1,"metadata":{"birthdate":"01.12.1990","lastname":"Bentley","firstname":"Maxwell","type":"Class C Driver License"},"slot":2,"name":"driver_license"},{"count":1,"metadata":{"gender":0,"citizenid":"LKQ99821","birthdate":"01.12.1990","lastname":"Bentley","nationality":"United States","firstname":"Maxwell"},"slot":3,"name":"id_card"}]', '2024-11-09 04:38:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(14214, 'RDT43347', 5, 'license:53d63cef03bd84bee2778d19ae409b18c859187a', 'DemonsAngel90', '{"crypto":0,"cash":12019,"bank":52000}', '{"lastname":"Testina","nationality":"United States","firstname":"Test","account":"US05QBCore4812688425","birthdate":"18.02.1990","phone":"2393404225","gender":1}', '{"type":"mechanic","label":"Kittys Motor Works","name":"kittys","isboss":true,"onduty":true,"grade":{"isboss":true,"name":"Manager","level":4,"payment":150},"payment":150}', '{"isboss":false,"grade":{"level":0,"isboss":false,"name":"Unaffiliated"},"label":"No Gang","name":"none"}', '{"x":76.74725341796875,"y":-1390.3516845703126,"z":29.3641357421875}', '{"licences":{"driver":true,"weapon":true,"business":false},"walletid":"QB-56921983","jailitems":[],"fingerprint":"Zs206l77JzZ7113","thirst":20.20000000000004,"stress":0.99999999999999,"isdead":false,"status":[],"inlaststand":false,"rep":[],"inside":{"apartment":[]},"armor":0,"injail":0,"ishandcuffed":false,"criminalrecord":{"hasRecord":false},"hunger":11.79999999999995,"oxyxp":0,"drugxp":0,"phone":[],"phonedata":{"InstalledApps":[],"SerialNumber":11451501},"tracker":false,"bloodtype":"O-","callsign":"NO CALLSIGN","overdosexp":0}', '[{"name":"scuba_gear","count":1,"slot":1},{"name":"advancedlockpick","count":16,"slot":2},{"metadata":{"components":[],"registered":"Test Testina","latentprints":{"Zs206l77JzZ7113":{"integrity":100,"evidenceId":913389}},"serial":"639139QPB814902","ammo":0,"durability":89.4},"name":"WEAPON_BLUEGLOCKS","count":1,"slot":3},{"metadata":{"components":[],"durability":98.2799999999996},"name":"WEAPON_GOLFCLUB","count":1,"slot":4},{"name":"lockpick","count":40,"slot":5},{"name":"copper","count":4,"slot":6},{"name":"steel","count":6,"slot":7},{"name":"meth","count":1,"slot":8},{"name":"crack_baggy","count":2,"slot":9},{"name":"goldchain_mining","count":1,"slot":10},{"name":"goldchain","count":1,"slot":11},{"name":"lighter","count":2,"slot":12},{"name":"weed_bag","count":4,"slot":13},{"name":"glass","count":1,"slot":14},{"name":"weed_package","count":4,"slot":15},{"name":"emptybaggies","count":5,"slot":16},{"name":"rollingpaper","count":2,"slot":17},{"name":"zatrollingpaper","count":2,"slot":18},{"name":"joint","count":2,"slot":19},{"name":"firework3","count":3,"slot":20},{"name":"underglow_controller","count":1,"slot":21},{"name":"mechanic_tools","count":1,"slot":22},{"name":"toolbox","count":1,"slot":23},{"metadata":{"lastname":"Testina","type":"Class C Driver License","firstname":"Test","birthdate":"18.02.1990"},"name":"driver_license","count":1,"slot":24},{"name":"wire_cutter","count":1,"slot":25},{"name":"screwdriverset","count":3,"slot":26},{"name":"money","count":12019,"slot":27},{"name":"gold_ring","count":1,"slot":28},{"metadata":{"birthdate":"18.02.1990","firstname":"Test","lastname":"Testina","citizenid":"RDT43347","nationality":"United States","gender":1},"name":"id_card","count":1,"slot":29},{"metadata":{"lbFormattedNumber":"(480) 931-5005","lbPhoneName":"Test\'s Phone","lbPhoneNumber":"4809315005"},"name":"phone","count":1,"slot":30},{"name":"kq_expensive_sneakers","count":1,"slot":31},{"name":"firework4","count":1,"slot":32},{"name":"emptybottle","count":1,"slot":33},{"name":"sparetire","count":4,"slot":34},{"name":"contracts_tablet","count":1,"slot":35},{"name":"rifle_ammo","count":1,"slot":36},{"metadata":{"worth":416},"name":"markedbills","count":1,"slot":37},{"name":"pliers","count":1,"slot":39},{"name":"impact_driver","count":1,"slot":40},{"name":"screwdriver","count":1,"slot":44},{"name":"spanner","count":1,"slot":45},{"metadata":{"worth":373},"name":"markedbills","count":1,"slot":46},{"metadata":{"worth":416},"name":"markedbills","count":1,"slot":47},{"metadata":{"worth":373},"name":"markedbills","count":1,"slot":48},{"metadata":{"worth":416},"name":"markedbills","count":1,"slot":49},{"metadata":{"worth":336},"name":"markedbills","count":1,"slot":50},{"metadata":{"worth":361},"name":"markedbills","count":1,"slot":51},{"metadata":{"worth":361},"name":"markedbills","count":1,"slot":52},{"metadata":{"worth":373},"name":"markedbills","count":1,"slot":53},{"metadata":{"worth":390},"name":"markedbills","count":1,"slot":54},{"metadata":{"worth":390},"name":"markedbills","count":1,"slot":55},{"metadata":{"worth":390},"name":"markedbills","count":1,"slot":56},{"metadata":{"worth":424},"name":"markedbills","count":1,"slot":57},{"metadata":{"worth":424},"name":"markedbills","count":1,"slot":58},{"metadata":{"worth":436},"name":"markedbills","count":1,"slot":59},{"metadata":{"worth":302},"name":"markedbills","count":1,"slot":60},{"metadata":{"worth":356},"name":"markedbills","count":1,"slot":61},{"metadata":{"worth":302},"name":"markedbills","count":1,"slot":62},{"metadata":{"worth":302},"name":"markedbills","count":1,"slot":63},{"metadata":{"worth":436},"name":"markedbills","count":1,"slot":64}]', '2024-11-11 16:24:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(14114, 'RZY43875', 2, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'DocJay69', '{"crypto":0,"bank":2222297.0,"cash":1600}', '{"nationality":"United States","account":"US08QBCore8885870246","firstname":"John","phone":"2741547302","lastname":"McClane","gender":0,"birthdate":"28.09.1977"}', '{"onduty":true,"isboss":true,"name":"ss","grade":{"level":10,"name":"Director","isboss":true,"payment":3500},"payment":3500,"type":"leo","label":"SS"}', '{"grade":{"name":"Unaffiliated","isboss":false,"level":0},"name":"none","isboss":false,"label":"No Gang"}', '{"x":-1605.5472412109376,"y":-1438.25927734375,"z":1.6966552734375}', '{"thirst":50.60000000000004,"jailitems":[],"licences":{"driver":true,"business":false,"weapon":true},"isdead":false,"callsign":"NO CALLSIGN","hunger":45.39999999999996,"overdosexp":0,"phonedata":{"InstalledApps":[],"SerialNumber":65357822},"rep":[],"injail":0,"bloodtype":"O+","oxyxp":0,"criminalrecord":{"hasRecord":false},"inlaststand":false,"walletid":"QB-74142011","drugxp":0,"fingerprint":"Rp853d77viJ0456","tracker":false,"inside":{"apartment":[]},"armor":0,"phone":[],"stress":3.9,"ishandcuffed":false,"status":[]}', '[{"slot":1,"metadata":{"components":[],"registered":"Demons Test","ammo":14,"latentblood":{"484f553431353738":{"evidenceId":199390,"bloodtype":"B-"},"5244543433333437":{"evidenceId":579804,"bloodtype":"O-"}},"durability":10.00000000000056,"latentprints":{"Oy606o21qGD5727":{"evidenceId":522553,"integrity":100},"Rp853d77viJ0456":{"evidenceId":738153,"integrity":100}},"serial":"281081TMP612077"},"count":1,"name":"WEAPON_PDHKUSP"},{"slot":2,"metadata":{"durability":100,"components":[]},"count":1,"name":"WEAPON_KNIFE"},{"slot":3,"metadata":{"components":[],"registered":"John McClane","ammo":8,"durability":77.50000000000043,"latentprints":{"Rp853d77viJ0456":{"evidenceId":588584,"integrity":100}},"serial":"343899HQW718389"},"count":1,"name":"WEAPON_T1911"},{"slot":4,"metadata":{"components":[],"registered":"Demons Test","ammo":30,"durability":49.50000000000016,"latentprints":{"Oy606o21qGD5727":{"evidenceId":854845,"integrity":100},"Rp853d77viJ0456":{"evidenceId":245425,"integrity":100}},"serial":"775245RGU619718"},"count":1,"name":"WEAPON_PDHK33"},{"slot":5,"metadata":{"durability":96.90000000000012,"ammo":5,"registered":"John McClane","latentblood":{"5944543133373534":{"evidenceId":826184,"bloodtype":"B-"},"554d563838313638":{"evidenceId":610506,"bloodtype":"O-"}},"components":[],"latentprints":{"Rp853d77viJ0456":{"evidenceId":764313,"integrity":100}},"serial":"849395WIW357455"},"count":1,"name":"WEAPON_PDM700"},{"slot":6,"count":6,"name":"advancedlockpick"},{"slot":7,"count":454,"name":"pistol_ammo"},{"slot":8,"count":365,"name":"rifle_ammo"},{"slot":9,"count":14,"name":"sniper_ammo"},{"slot":10,"metadata":{"lbPhoneName":"John\'s Phone","lbPhoneNumber":"5207830775","lbFormattedNumber":"(520) 783-0775"},"count":1,"name":"phone"},{"slot":11,"metadata":{"components":[],"ammo":0,"registered":"John McClane","durability":100,"latentprints":{"Rp853d77viJ0456":{"evidenceId":849668,"integrity":100}},"serial":"220773POL940230"},"count":1,"name":"WEAPON_PUMPSHOTGUN"},{"slot":12,"metadata":{"durability":100,"latentprints":{"Rp853d77viJ0456":{"evidenceId":218523,"integrity":100}},"components":[],"registered":"John McClane","serial":"251406POL152684"},"count":1,"name":"WEAPON_STUNGUN"},{"slot":13,"metadata":{"components":[],"ammo":0,"registered":"Demons Test","durability":100,"latentprints":{"Oy606o21qGD5727":{"evidenceId":207092,"integrity":100},"Rp853d77viJ0456":{"evidenceId":996991,"integrity":100}},"serial":"864178NQK207812"},"count":1,"name":"WEAPON_PDHK45"},{"slot":14,"metadata":{"durability":100,"latentprints":{"Rp853d77viJ0456":{"evidenceId":107651,"integrity":100}},"components":[],"registered":true,"serial":"POL"},"count":1,"name":"WEAPON_PEPPERSPRAY"},{"slot":15,"metadata":{"durability":100,"latentprints":{"Rp853d77viJ0456":{"evidenceId":848996,"integrity":100}},"components":[],"registered":true,"serial":"POL"},"count":1,"name":"WEAPON_ANTIDOTE"},{"slot":16,"count":1,"name":"dnatestkit"},{"slot":17,"count":1,"name":"drugtestkit"},{"slot":18,"count":1,"name":"gsrtestkit"},{"slot":19,"count":1,"name":"mikrosil"},{"slot":20,"count":1,"name":"fingerprinttape"},{"slot":21,"count":20,"name":"empty_evidence_bag"},{"slot":22,"count":1,"name":"fingerprintkit"},{"slot":23,"count":1,"name":"fingerprintreader"},{"slot":24,"count":1,"name":"breathalyzer"},{"slot":25,"metadata":{"uses":19},"count":1,"name":"accesstool"},{"slot":26,"metadata":{"durability":88.90000000000056,"latentprints":{"Rp853d77viJ0456":{"evidenceId":695191,"integrity":100}},"components":[],"registered":true,"serial":"POL"},"count":1,"name":"WEAPON_PDBATON"},{"slot":27,"count":2,"name":"handcuffs"},{"slot":28,"count":1,"name":"radio"},{"slot":29,"count":1,"name":"gpstracker"},{"slot":30,"count":1,"name":"electronic_cuffs"},{"slot":31,"metadata":{"id":"1ae63d0c27dcf5_hs21qs65F0"},"count":1,"name":"policepouches"},{"slot":32,"metadata":{"id":"1ae63d0c27dcf5_4F6G3Po5K9"},"count":1,"name":"policepouches1"},{"slot":33,"count":1,"name":"kq_outfitbag"},{"slot":34,"count":1,"name":"nikon"},{"slot":35,"count":1,"name":"sdcard"},{"slot":36,"count":8,"name":"ifaks"},{"slot":37,"count":1,"name":"defib"},{"slot":38,"count":1,"name":"medbag"},{"slot":39,"count":1,"name":"microfibercloth"},{"slot":40,"count":1,"name":"blox"},{"slot":41,"count":1,"name":"scuba_gear"},{"slot":42,"count":3,"name":"taser_cartridge"},{"slot":43,"count":100,"name":"shotgun_ammo"},{"slot":44,"count":1,"name":"gunrepairkit"},{"slot":45,"metadata":{"durability":100,"components":[],"registered":true,"serial":"POL"},"count":1,"name":"WEAPON_FLASHLIGHT"},{"slot":49,"metadata":{"durability":100,"components":[],"registered":true,"serial":"POL"},"count":1,"name":"WEAPON_BTASER"},{"slot":50,"metadata":{"durability":100,"components":[],"registered":true,"serial":"POL"},"count":1,"name":"WEAPON_YTASER"},{"slot":54,"count":8,"name":"hide_stingray"},{"slot":55,"count":3,"name":"meat_stingray"},{"slot":56,"metadata":{"description":"Name: John McClane   \\nPlate: 69IUD384   \\nModel: polheli"},"count":1,"name":"car_registration"},{"slot":57,"metadata":{"description":"Name: John McClane   \\nPlate: 69IUD384   \\nModel: polheli   \\nDate: 2024-11-02   \\nExpire: 2025-01-31"},"count":1,"name":"insurance"},{"slot":58,"metadata":{"description":"Name: John McClane   \\nPlate: RC12HY34   \\nModel: ramleg"},"count":1,"name":"car_registration"},{"slot":59,"metadata":{"description":"Name: John McClane   \\nPlate: RC12HY34   \\nModel: ramleg   \\nDate: 2024-11-06   \\nExpire: 2025-02-04"},"count":1,"name":"insurance"},{"slot":60,"count":2000,"name":"dirtymoney"},{"slot":61,"metadata":{"firstname":"John","birthdate":"28.09.1977","lastname":"McClane","type":"Class C Driver License"},"count":1,"name":"driver_license"},{"slot":62,"metadata":{"firstname":"John","birthdate":"28.09.1977","nationality":"United States","lastname":"McClane","gender":0,"citizenid":"RZY43875"},"count":1,"name":"id_card"},{"slot":63,"metadata":{"firstname":"John","birthdate":"28.09.1977","nationality":"United States","lastname":"McClane","gender":0,"citizenid":"RZY43875","type":"Class One Weapon License"},"count":1,"name":"weaponlicense"},{"slot":64,"count":1600,"name":"money"}]', '2024-11-24 05:53:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(14867, 'STG67749', 1, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'DocJay69', '{"bank":28622.0,"cash":7480,"crypto":0}', '{"firstname":"John","lastname":"Dutton","account":"US09QBCore1662997634","gender":0,"nationality":"United States","phone":"7334318274","birthdate":"28.09.1977"}', '{"label":"WIY Vehicle Dealer","payment":150,"type":"none","grade":{"isboss":true,"payment":150,"level":4,"name":"Manager"},"onduty":true,"isboss":true,"name":"wiydealership"}', '{"grade":{"isboss":false,"level":0,"name":"Unaffiliated"},"label":"No Gang","isboss":false,"name":"none"}', '{"x":-477.25714111328127,"y":-375.6000061035156,"z":34.5369873046875}', '{"status":[],"stress":0,"drugxp":0,"injail":0,"criminalrecord":{"hasRecord":false},"walletid":"QB-44604746","ishandcuffed":false,"phonedata":{"InstalledApps":[],"SerialNumber":34321182},"callsign":"NO CALLSIGN","licences":{"driver":true,"weapon":true,"business":false},"inlaststand":false,"hunger":24.39999999999995,"armor":0,"fingerprint":"iX361N76kAR7753","inside":{"apartment":[]},"jailitems":[],"rep":[],"thirst":31.60000000000004,"isdead":false,"overdosexp":0,"oxyxp":0,"bloodtype":"B+","phone":[],"tracker":false}', '[{"name":"WEAPON_T1911","slot":1,"metadata":{"serial":"685592ZAQ275520","durability":99.10000000000005,"latentprints":{"iX361N76kAR7753":{"integrity":100,"evidenceId":109379}},"components":[],"ammo":8,"registered":"John Dutton"},"count":1},{"name":"WEAPON_KNIFE","slot":2,"metadata":{"components":[],"durability":99.5399999999998},"count":1},{"name":"WEAPON_BAT","slot":3,"metadata":{"components":[],"durability":99.15999999999973},"count":1},{"name":"WEAPON_PDM700","slot":5,"metadata":{"serial":"377983LOV169592","durability":92.20000000000026,"latentprints":{"iX361N76kAR7753":{"integrity":100,"evidenceId":487440}},"components":[],"ammo":5,"registered":"John Dutton"},"count":1},{"name":"money","slot":6,"count":7480},{"name":"scuba_gear","slot":7,"count":1},{"name":"scuba_gear","slot":8,"count":1},{"name":"parachute","slot":9,"count":1},{"name":"armor","slot":10,"count":1},{"name":"heartstopper","slot":11,"count":15},{"name":"bscoffee","slot":12,"count":14},{"name":"scuba_gear","slot":13,"count":1},{"name":"phone","slot":14,"metadata":{"lbFormattedNumber":"(480) 259-6427","lbPhoneNumber":"4802596427","lbPhoneName":"J.D. \'s Phone"},"count":1},{"name":"vehicle_manual","slot":15,"count":1},{"name":"sniper_ammo","slot":16,"count":267},{"name":"huntinglicense","slot":63,"count":1},{"name":"weaponlicense","slot":64,"metadata":{"citizenid":"STG67749","birthdate":"28.09.1977","nationality":"United States","gender":0,"firstname":"John","type":"Class One Weapon License","lastname":"Dutton"},"count":1},{"name":"pistol_ammo","slot":17,"count":123},{"name":"driver_license","slot":61,"metadata":{"firstname":"John","birthdate":"28.09.1977","type":"Class C Driver License","lastname":"Dutton"},"count":1},{"name":"id_card","slot":62,"metadata":{"citizenid":"STG67749","birthdate":"28.09.1977","nationality":"United States","gender":0,"firstname":"John","lastname":"Dutton"},"count":1},{"name":"meth","slot":20,"count":1}]', '2024-11-16 22:52:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(15925, 'UMV88168', 1, 'license:6c71ff5df10586f8d960d0fa1d9d981cb823f338', 'Mub', '{"crypto":0,"cash":5776,"bank":114859.0}', '{"phone":"1451740235","firstname":"Andy","account":"US01QBCore7591519245","gender":0,"lastname":"Murphy","birthdate":"01.03.1996","nationality":"United Kingdom"}', '{"grade":{"level":10,"name":"Chief","payment":3500,"isboss":true},"label":"LSPD","isboss":true,"name":"lspd","type":"leo","onduty":true}', '{"isboss":false,"name":"none","grade":{"isboss":false,"name":"Unaffiliated","level":0},"label":"No Gang"}', '{"x":-37.29230499267578,"y":-1648.1142578125,"z":29.2799072265625}', '{"phone":[],"jailitems":[],"oxyxp":0,"licences":{"weapon":true,"business":false,"driver":true},"hunger":95.8,"criminalrecord":{"hasRecord":false},"armor":0,"overdosexp":0,"injail":0,"callsign":"NO CALLSIGN","bloodtype":"O-","stress":11.59999999999995,"status":[],"fingerprint":"Sd832S76hyL3818","isdead":false,"rep":[],"inside":{"apartment":[]},"thirst":81.20000000000005,"drugxp":0,"walletid":"QB-63086249","phonedata":{"InstalledApps":[],"SerialNumber":49787557},"inlaststand":false,"tracker":false,"ishandcuffed":false}', '[{"count":1,"metadata":{"latentprints":{"Sd832S76hyL3818":{"evidenceId":311726,"integrity":100}},"components":[],"durability":98.60000000000005,"ammo":30,"registered":"Andy Murphy","serial":"190066POL469749"},"slot":1,"name":"WEAPON_PDHK33"},{"count":1,"metadata":{"latentprints":{"Sd832S76hyL3818":{"evidenceId":440999,"integrity":100}},"components":[],"durability":100,"ammo":15,"registered":"Andy Murphy","serial":"386101POL182023"},"slot":2,"name":"WEAPON_PDHKUSP"},{"count":1,"slot":3,"name":"mechanic_tools"},{"count":6,"slot":4,"name":"heartstopper"},{"count":7,"slot":5,"name":"bscoke"},{"count":1,"metadata":{"id":"1ae656e183cdec_7aE062275K"},"slot":6,"name":"policepouches1"},{"count":2,"metadata":{"registered":true,"serial":"POL"},"slot":7,"name":"handcuffs"},{"count":1,"metadata":{"registered":true,"durability":100,"components":[],"serial":"POL"},"slot":8,"name":"WEAPON_PDBATON"},{"count":1,"metadata":{"registered":true,"durability":100,"components":[],"serial":"POL"},"slot":9,"name":"WEAPON_FLASHLIGHT"},{"count":2,"slot":10,"name":"heavyarmor"},{"count":200,"slot":11,"name":"pistol_ammo"},{"count":186,"slot":12,"name":"rifle_ammo"},{"count":5,"slot":13,"name":"taser_cartridge"},{"count":1,"metadata":{"latentprints":{"Sd832S76hyL3818":{"evidenceId":452427,"integrity":100}},"components":[],"registered":"Andy Murphy","durability":100,"serial":"232212POL448815"},"slot":16,"name":"WEAPON_STUNGUN"},{"count":1,"metadata":{"type":"Class C Driver License","birthdate":"01.03.1996","lastname":"Murphy","firstname":"Andy"},"slot":62,"name":"driver_license"},{"count":1,"metadata":{"nationality":"United Kingdom","citizenid":"UMV88168","firstname":"Andy","type":"Class D Driver\'s License","birthdate":"01.03.1996","gender":0,"lastname":"Murphy"},"slot":63,"name":"id_card"},{"count":5776,"slot":64,"name":"money"},{"count":10,"slot":46,"name":"blox"},{"count":5,"slot":47,"name":"microfibercloth"},{"count":20,"slot":48,"name":"gsrtestkit"},{"count":1,"slot":49,"name":"gpstracker"},{"count":1,"slot":50,"name":"fingerprintkit"},{"count":20,"slot":51,"name":"dnatestkit"},{"count":5,"slot":52,"name":"drugtestkit"},{"count":10,"slot":53,"name":"mikrosil"},{"count":20,"slot":54,"name":"fingerprinttape"},{"count":50,"slot":55,"name":"empty_evidence_bag"},{"count":1,"slot":56,"name":"medbag"},{"count":10,"slot":57,"name":"ifaks"},{"count":1,"slot":58,"name":"breathalyzer"},{"count":1,"slot":59,"name":"fingerprintreader"},{"count":1,"metadata":{"lbPhoneName":"Andy\'s Phone","lbFormattedNumber":"(205) 704-2489","lbPhoneNumber":"2057042489"},"slot":60,"name":"phone"},{"count":1,"metadata":{"nationality":"United Kingdom","citizenid":"UMV88168","firstname":"Andy","type":"Class One Weapon License","birthdate":"01.03.1996","gender":0,"lastname":"Murphy"},"slot":61,"name":"weaponlicense"}]', '2024-11-24 01:07:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"general2":0}', '[]', '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(17860, 'UYN60276', 3, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'DocJay69', '{"crypto":0,"cash":500,"bank":5000}', '{"nationality":"United States","gender":1,"lastname":"Dutton","phone":"6079993238","account":"US05QBCore6133139344","firstname":"Beth","birthdate":"20.09.1979"}', '{"onduty":false,"grade":{"name":"Freelancer","level":0},"payment":50,"label":"Civilian","name":"unemployed","isboss":false,"type":"none"}', '{"label":"No Gang Affiliation","name":"none","grade":{"name":"none","level":0},"isboss":false}', '{"x":-3093.62646484375,"y":1205.103271484375,"z":19.776611328125}', '{"callsign":"NO CALLSIGN","criminalrecord":{"hasRecord":false},"thirst":81.00000000000002,"inside":{"apartment":[]},"overdosexp":0,"ishandcuffed":false,"injail":0,"hunger":78.99999999999999,"tracker":false,"rep":[],"fingerprint":"hM859E69xsN3401","licences":{"business":false,"driver":true,"weapon":false},"isdead":false,"walletid":"QB-11991879","armor":0,"inlaststand":false,"drugxp":0,"stress":1.3,"bloodtype":"B+","jailitems":[],"phone":[],"oxyxp":0,"status":[],"phonedata":{"SerialNumber":43304350,"InstalledApps":[]}}', '[{"name":"money","slot":1,"count":500},{"slot":2,"name":"id_card","metadata":{"firstname":"Beth","lastname":"Dutton","birthdate":"20.09.1979","nationality":"United States","citizenid":"UYN60276","gender":1},"count":1},{"slot":3,"name":"driver_license","metadata":{"firstname":"Beth","lastname":"Dutton","type":"Class C Driver License","birthdate":"20.09.1979"},"count":1},{"name":"policecard","slot":4,"count":1}]', '2024-11-23 04:13:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(15515, 'VIU66597', 1, 'license:340e13c7d15e0f07ff7ed5e66a62423ae74f5915', 'TamerWaves', '{"bank":5000,"cash":500,"crypto":0}', '{"firstname":"Shelby","birthdate":"19.01.1978","nationality":"United States","gender":0,"account":"US09QBCore1990373950","phone":"6513263288","lastname":"Lutz"}', '{"payment":10,"isboss":false,"onduty":false,"grade":{"isboss":false,"level":0,"name":"Freelancer"},"type":"none","label":"Civilian","name":"unemployed"}', '{"isboss":false,"grade":{"isboss":false,"level":0,"name":"Unaffiliated"},"name":"none","label":"No Gang"}', '{"x":380.3736267089844,"y":-768.09228515625,"z":29.2799072265625}', '{"stress":0,"thirst":84.80000000000001,"criminalrecord":{"hasRecord":false},"injail":0,"overdosexp":0,"armor":0,"tracker":false,"rep":[],"drugxp":0,"inside":{"apartment":[]},"inlaststand":false,"status":[],"licences":{"driver":true,"business":false,"weapon":false},"fingerprint":"TF593O03SVs4525","phone":[],"phonedata":{"SerialNumber":37283303,"InstalledApps":[]},"walletid":"QB-69433457","hunger":83.19999999999999,"isdead":false,"bloodtype":"AB-","oxyxp":0,"ishandcuffed":false,"callsign":"NO CALLSIGN","jailitems":[]}', '[{"slot":1,"name":"money","count":500},{"slot":2,"count":1,"name":"driver_license","metadata":{"firstname":"Shelby","lastname":"Lutz","type":"Class C Driver License","birthdate":"19.01.1978"}},{"slot":3,"count":1,"name":"id_card","metadata":{"nationality":"United States","firstname":"Shelby","citizenid":"VIU66597","lastname":"Lutz","birthdate":"19.01.1978","gender":0}},{"slot":4,"name":"can","count":3},{"slot":5,"name":"bottle","count":1}]', '2024-11-06 22:52:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(14172, 'VYV31546', 1, 'license:53d63cef03bd84bee2778d19ae409b18c859187a', 'DemonsAngel90', '{"crypto":0,"cash":500,"bank":5000}', '{"lastname":"Testina","nationality":"United States","phone":"3998807552","account":"US05QBCore1245590194","birthdate":"18.02.1990","firstname":"Test","gender":1}', '{"type":"none","grade":{"isboss":false,"level":0,"name":"Freelancer"},"name":"unemployed","isboss":false,"onduty":false,"label":"Civilian","payment":10}', '{"isboss":false,"label":"No Gang","grade":{"isboss":false,"level":0,"name":"Unaffiliated"},"name":"none"}', '{"x":-827.4593505859375,"y":-730.1934204101563,"z":108.2886962890625}', '{"inside":{"apartment":[]},"walletid":"QB-48800263","jailitems":[],"injail":0,"thirst":92.4,"tracker":false,"isdead":false,"status":[],"phonedata":{"InstalledApps":[],"SerialNumber":53230769},"rep":[],"licences":{"driver":true,"weapon":false,"business":false},"stress":0,"phone":[],"ishandcuffed":false,"criminalrecord":{"hasRecord":false},"hunger":91.6,"oxyxp":0,"drugxp":0,"inlaststand":false,"overdosexp":0,"armor":0,"bloodtype":"O-","callsign":"NO CALLSIGN","fingerprint":"ns100h37uDI2777"}', '[{"name":"money","count":500,"slot":1},{"metadata":{"birthdate":"18.02.1990","nationality":"United States","citizenid":"VYV31546","firstname":"Test","lastname":"Testina","gender":1},"name":"id_card","count":1,"slot":2},{"metadata":{"type":"Class C Driver License","birthdate":"18.02.1990","firstname":"Test","lastname":"Testina"},"name":"driver_license","count":1,"slot":3}]', '2024-11-11 14:55:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(15943, 'XVQ84862', 2, 'license:53d63cef03bd84bee2778d19ae409b18c859187a', 'DemonsAngel90', '{"crypto":0,"bank":6800,"cash":500}', '{"lastname":"Rich","nationality":"United States","firstname":"Kitty","account":"US01QBCore6416602773","birthdate":"18.02.1990","phone":"1197537870","gender":1}', '{"type":"mechanic","payment":300,"name":"kittys","isboss":true,"onduty":false,"label":"Kittys Motor Works","grade":{"level":5,"payment":300,"isboss":true,"name":"Owner"}}', '{"isboss":false,"label":"No Gang","grade":{"isboss":false,"level":0,"name":"Unaffiliated"},"name":"none"}', '{"x":-67.29230499267578,"y":73.84615325927735,"z":71.6065673828125}', '{"licences":{"driver":true,"weapon":false,"business":false},"walletid":"QB-16217437","jailitems":[],"fingerprint":"yZ580Y99Bei4854","thirst":65.80000000000003,"tracker":false,"isdead":false,"status":[],"phonedata":{"InstalledApps":[],"SerialNumber":41070109},"rep":[],"injail":0,"callsign":"NO CALLSIGN","stress":0,"ishandcuffed":false,"criminalrecord":{"hasRecord":false},"hunger":62.19999999999997,"oxyxp":0,"drugxp":0,"overdosexp":0,"phone":[],"inside":{"apartment":[]},"bloodtype":"AB+","armor":0,"inlaststand":false}', '[{"metadata":{"birthdate":"18.02.1990","nationality":"United States","lastname":"Rich","citizenid":"XVQ84862","firstname":"Kitty","gender":1},"name":"id_card","count":1,"slot":15},{"metadata":{"type":"Class C Driver License","lastname":"Rich","firstname":"Kitty","birthdate":"18.02.1990"},"name":"driver_license","count":1,"slot":10},{"name":"money","count":500,"slot":6}]', '2024-11-11 16:31:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(15488, 'YDT13754', 1, 'license:c5f1341b9e5627f52c1a19fd6d2a98c978e4681a', 'ReloadTales', '{"crypto":0,"bank":25500,"cash":1578}', '{"account":"US05QBCore9000570556","nationality":"United States","gender":0,"firstname":"jason","phone":"5911166810","lastname":"Borune","birthdate":"22.06.1998"}', '{"type":"leo","onduty":true,"name":"sahp","grade":{"isboss":true,"payment":3500,"name":"Colonel","level":10},"isboss":true,"label":"SAHP"}', '{"name":"none","isboss":false,"label":"No Gang","grade":{"isboss":false,"name":"Unaffiliated","level":0}}', '{"x":213.96923828125,"y":-801.9560546875,"z":30.79638671875}', '{"injail":0,"licences":{"driver":true,"business":false,"weapon":true},"inlaststand":false,"fingerprint":"FP187N33fKV5242","rep":[],"phone":[],"overdosexp":0,"status":[],"jailitems":[],"hunger":95.8,"isdead":false,"walletid":"QB-70451576","criminalrecord":{"hasRecord":false},"tracker":false,"bloodtype":"B-","callsign":"NO CALLSIGN","stress":1.8,"drugxp":0,"inside":{"apartment":[]},"ishandcuffed":false,"phonedata":{"InstalledApps":[],"SerialNumber":94383714},"thirst":96.2,"oxyxp":0,"armor":0}', '[{"count":3,"slot":1,"name":"medikit"},{"metadata":{"latentblood":{"4357593632323736":{"evidenceId":872030,"bloodtype":"AB-"}},"serial":"209474POL529592","registered":"jason Borune","durability":82.20000000000043,"ammo":11,"components":[]},"count":1,"slot":2,"name":"WEAPON_PDHKUSP"},{"metadata":{"serial":"766248POL920116","registered":"jason Borune","durability":86.7000000000001,"ammo":30,"components":[]},"count":1,"slot":3,"name":"WEAPON_HK417"},{"metadata":{"components":[],"serial":"374011POL235205","durability":100,"registered":"jason Borune"},"count":1,"slot":4,"name":"WEAPON_STUNGUN"},{"metadata":{"serial":"690604POL873582","registered":"jason Borune","durability":99.10000000000005,"ammo":8,"components":[]},"count":1,"slot":5,"name":"WEAPON_PUMPSHOTGUN"},{"count":86,"slot":6,"name":"pistol_ammo"},{"count":336,"slot":7,"name":"rifle_ammo"},{"count":84,"slot":8,"name":"shotgun_ammo"},{"metadata":{"id":"1ae67bd8935d5a_jT7bAVp6J2"},"count":1,"slot":9,"name":"policepouches1"},{"metadata":{"gender":0,"firstname":"jason","birthdate":"22.06.1998","citizenid":"YDT13754","nationality":"United States","lastname":"Borune"},"count":1,"slot":10,"name":"id_card"},{"count":1,"slot":11,"name":"medbag"},{"count":3,"slot":12,"name":"handcuffs"},{"count":1,"slot":13,"name":"emptybaggies"},{"count":2,"slot":14,"name":"goldbar"},{"metadata":{"type":"Class C Driver License","birthdate":"22.06.1998","firstname":"jason","lastname":"Borune"},"count":1,"slot":15,"name":"driver_license"},{"count":1,"slot":20,"name":"radio"},{"count":1,"slot":21,"name":"scuba_gear"},{"metadata":{"lbFormattedNumber":"(602) 997-3306","lbPhoneNumber":"6029973306","lbPhoneName":"jason\'s Phone"},"count":1,"slot":25,"name":"phone"},{"metadata":{"uses":18},"count":1,"slot":26,"name":"accesstool"},{"count":2,"slot":27,"name":"advancedlockpick"},{"count":2,"slot":28,"name":"armor"},{"count":1578,"slot":64,"name":"money"}]', '2024-11-10 22:53:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL);

-- Dumping structure for table worldisyours.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=495 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.playerskins: ~16 rows (approximately)
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(350, 'YFB89595', 'mp_f_freemode_01', '{"t-shirt":{"defaultTexture":0,"item":16,"defaultItem":1,"texture":0},"decals":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_4":{"defaultTexture":0,"item":-2.9,"defaultItem":0},"eyebrows":{"defaultTexture":1,"item":12,"opacity":0.65137979485738,"highlight":0,"defaultItem":-1,"texture":3},"torso2":{"defaultTexture":0,"item":18,"defaultItem":0,"texture":12},"eye_color":{"defaultTexture":0,"item":3,"defaultItem":-1,"texture":0},"nose_3":{"defaultTexture":0,"item":-1.9,"defaultItem":0},"chimp_bone_width":{"defaultTexture":0,"item":-2.1,"defaultItem":0},"skinMom":25,"nose_2":{"defaultTexture":0,"item":3.59999999999999,"defaultItem":0},"ageing":{"defaultTexture":0,"item":-1,"opacity":0.62,"highlight":0,"defaultItem":-1,"texture":0},"makeup":{"defaultTexture":1,"item":0,"opacity":0.52296613741745,"highlight":37,"defaultItem":-1,"texture":37},"bag":{"defaultTexture":0,"item":40,"defaultItem":0,"texture":4},"cheek_3":{"defaultTexture":0,"item":-3.7,"defaultItem":0},"cheek_2":{"defaultTexture":0,"item":-4.69999999999999,"defaultItem":0},"bracelet":{"defaultTexture":0,"item":30,"defaultItem":-1,"texture":0},"eye_opening":{"defaultTexture":0,"item":-2.5,"defaultItem":0},"nose_1":{"defaultTexture":0,"item":4.9,"defaultItem":0},"chimp_hole":{"defaultTexture":0,"item":0.2,"defaultItem":0},"watch":{"defaultTexture":0,"item":24,"defaultItem":-1,"texture":0},"chimp_bone_lenght":{"defaultTexture":0,"item":0.7,"defaultItem":0},"jaw_bone_back_lenght":{"defaultTexture":0,"item":-2.3,"defaultItem":0},"bodyb":{"defaultTexture":0,"item":0,"opacity":0.15,"highlight":0,"defaultItem":0,"texture":0},"eyebrown_forward":{"defaultTexture":0,"item":2.6,"defaultItem":0},"pants":{"defaultTexture":0,"item":24,"defaultItem":0,"texture":0},"moles":{"defaultTexture":0,"item":-1,"opacity":0.46,"highlight":0,"defaultItem":-1,"texture":0},"mask":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"item":2.5,"defaultItem":0},"facemix":{"shapeMix":0.99,"skinMix":0.72765432098765},"glass":{"defaultTexture":-1,"item":-1,"defaultItem":-1,"texture":0},"face2":{"defaultTexture":0,"item":21,"defaultItem":0,"texture":21},"face":{"defaultTexture":0,"item":6,"defaultItem":0,"texture":6},"skinDad":40,"shoes":{"defaultTexture":0,"item":18,"defaultItem":1,"texture":0},"ear":{"defaultTexture":0,"item":33,"defaultItem":-1,"texture":0},"complexion":{"defaultTexture":0,"item":-1,"opacity":0.47386679780806,"highlight":0,"defaultItem":0,"texture":0},"arms":{"defaultTexture":0,"item":4,"defaultItem":0,"texture":0},"cheek_1":{"defaultTexture":0,"item":-2.5,"defaultItem":0},"sun_damage":{"defaultTexture":0,"item":0,"opacity":0.05,"highlight":0,"defaultItem":0,"texture":0},"accessory":{"defaultTexture":0,"item":18,"defaultItem":0,"texture":1},"lips_thickness":{"defaultTexture":0,"item":-5.35478431923563,"defaultItem":0},"neck_thikness":{"defaultTexture":0,"item":-3.2,"defaultItem":0},"hair":{"defaultTexture":0,"item":165,"style":0,"highlight":37,"defaultItem":0,"texture":37},"tattoos":[],"lipstick":{"defaultTexture":1,"item":1,"opacity":0.52674300969509,"highlight":0,"defaultItem":-1,"texture":53},"jaw_bone_width":{"defaultTexture":0,"item":-2.4,"defaultItem":0},"eyebrown_high":{"defaultTexture":0,"item":1.1,"defaultItem":0},"blush":{"defaultTexture":1,"item":1,"opacity":0.19437824926232,"highlight":0,"defaultItem":-1,"texture":34},"vest":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_5":{"defaultTexture":0,"item":4.0,"defaultItem":0}}', 1),
	(397, 'CWY62276', 'mp_m_freemode_01', '{"vest":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"watch":{"item":-1,"defaultTexture":0,"texture":-1,"defaultItem":-1},"skinMom":0,"bracelet":{"item":-1,"defaultTexture":0,"texture":-1,"defaultItem":-1},"cheek_3":{"item":0.0,"defaultTexture":0,"defaultItem":0},"tattoos":[],"nose_4":{"item":0.0,"defaultTexture":0,"defaultItem":0},"shoes":{"item":4,"defaultTexture":0,"texture":0,"defaultItem":1},"eyebrows":{"defaultItem":-1,"highlight":0,"item":255,"defaultTexture":1,"texture":0,"opacity":1.0},"eye_color":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"sun_damage":{"defaultItem":0,"highlight":0,"item":255,"defaultTexture":0,"texture":0,"opacity":1.0},"chimp_bone_lenght":{"item":0.0,"defaultTexture":0,"defaultItem":0},"complexion":{"defaultItem":0,"highlight":0,"item":255,"defaultTexture":0,"texture":0,"opacity":1.0},"pants":{"item":35,"defaultTexture":0,"texture":0,"defaultItem":0},"face2":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"torso2":{"item":34,"defaultTexture":0,"texture":0,"defaultItem":0},"chimp_bone_width":{"item":0.0,"defaultTexture":0,"defaultItem":0},"nose_0":{"item":0.0,"defaultTexture":0,"defaultItem":0},"chimp_bone_lowering":{"item":0.0,"defaultTexture":0,"defaultItem":0},"chest":{"defaultItem":0,"highlight":0,"item":255,"defaultTexture":0,"texture":0,"opacity":1.0},"bodyb":{"defaultItem":0,"highlight":0,"item":255,"defaultTexture":0,"texture":0,"opacity":1.0},"eye_opening":{"item":0.0,"defaultTexture":0,"defaultItem":0},"lips_thickness":{"item":0.0,"defaultTexture":0,"defaultItem":0},"chimp_hole":{"item":0.0,"defaultTexture":0,"defaultItem":0},"eyebrown_forward":{"item":0.0,"defaultTexture":0,"defaultItem":0},"nose_1":{"item":0.0,"defaultTexture":0,"defaultItem":0},"cheek_1":{"item":0.0,"defaultTexture":0,"defaultItem":0},"accessory":{"item":0,"defaultTexture":0,"texture":1,"defaultItem":0},"nose_5":{"item":0.0,"defaultTexture":0,"defaultItem":0},"makeup":{"defaultItem":-1,"highlight":0,"item":255,"defaultTexture":1,"texture":0,"opacity":1.0},"jaw_bone_back_lenght":{"item":0.0,"defaultTexture":0,"defaultItem":0},"cheek_2":{"item":0.0,"defaultTexture":0,"defaultItem":0},"mask":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"jaw_bone_width":{"item":0.0,"defaultTexture":0,"defaultItem":0},"moles":{"defaultItem":-1,"highlight":0,"item":255,"defaultTexture":0,"texture":0,"opacity":1.0},"eyebrown_high":{"item":0.0,"defaultTexture":0,"defaultItem":0},"arms":{"item":103,"defaultTexture":0,"texture":9,"defaultItem":0},"neck_thikness":{"item":0.0,"defaultTexture":0,"defaultItem":0},"lipstick":{"defaultItem":-1,"highlight":0,"item":255,"defaultTexture":1,"texture":0,"opacity":1.0},"t-shirt":{"item":15,"defaultTexture":0,"texture":0,"defaultItem":1},"nose_2":{"item":0.0,"defaultTexture":0,"defaultItem":0},"nose_3":{"item":0.0,"defaultTexture":0,"defaultItem":0},"ear":{"item":-1,"defaultTexture":0,"texture":-1,"defaultItem":-1},"ageing":{"defaultItem":-1,"highlight":0,"item":255,"defaultTexture":0,"texture":0,"opacity":1.0},"hair":{"defaultItem":0,"highlight":255,"item":140,"defaultTexture":0,"style":0,"texture":255},"facemix":{"shapeMix":0.5,"skinMix":0.5},"hat":{"item":-1,"defaultTexture":0,"texture":-1,"defaultItem":-1},"face":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"beard":{"defaultItem":-1,"highlight":0,"item":255,"defaultTexture":1,"texture":0,"opacity":1.0},"skinDad":0,"blush":{"defaultItem":-1,"highlight":0,"item":255,"defaultTexture":1,"texture":0,"opacity":1.0},"decals":{"item":50,"defaultTexture":0,"texture":12,"defaultItem":0},"glass":{"item":-1,"defaultTexture":-1,"texture":-1,"defaultItem":-1},"bag":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0}}', 1),
	(405, 'VIU66597', 'mp_m_freemode_01', '{"neck_thikness":{"defaultItem":0,"item":0.0,"defaultTexture":0},"nose_4":{"defaultItem":0,"item":0.0,"defaultTexture":0},"face2":{"defaultItem":0,"item":21,"texture":21,"defaultTexture":0},"lips_thickness":{"defaultItem":0,"item":-1.00000001490116,"defaultTexture":0},"bodyb":{"opacity":1.0,"defaultTexture":0,"defaultItem":0,"item":255,"texture":0,"highlight":0},"lipstick":{"opacity":1.0,"defaultTexture":1,"defaultItem":-1,"item":255,"texture":0,"highlight":0},"sun_damage":{"opacity":0.41999998688697,"defaultTexture":0,"defaultItem":0,"item":5,"texture":0,"highlight":0},"torso2":{"defaultItem":0,"item":193,"texture":0,"defaultTexture":0},"tattoos":[],"chimp_bone_width":{"defaultItem":0,"item":-1.40000000596046,"defaultTexture":0},"moles":{"opacity":0.66000002622604,"defaultTexture":0,"defaultItem":-1,"item":10,"texture":0,"highlight":0},"eyebrows":{"opacity":0.46000000834465,"defaultTexture":1,"defaultItem":-1,"item":20,"texture":0,"highlight":0},"ear":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":0},"jaw_bone_back_lenght":{"defaultItem":0,"item":-1.09999999403953,"defaultTexture":0},"nose_1":{"defaultItem":0,"item":1.50000005960464,"defaultTexture":0},"complexion":{"opacity":0.20999999344348,"defaultTexture":0,"defaultItem":0,"item":5,"texture":0,"highlight":0},"facemix":{"shapeMix":0.59333333333333,"skinMix":0.60123456790123},"chest":{"opacity":1.0,"defaultTexture":0,"defaultItem":0,"item":255,"texture":0,"highlight":0},"bracelet":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":0},"cheek_2":{"defaultItem":0,"item":-1.29999995231628,"defaultTexture":0},"eye_opening":{"defaultItem":0,"item":-0.09999999776482,"defaultTexture":0},"bag":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"hair":{"style":0,"defaultTexture":0,"defaultItem":0,"item":150,"texture":1,"highlight":1},"shoes":{"defaultItem":1,"item":7,"texture":0,"defaultTexture":0},"chimp_bone_lowering":{"defaultItem":0,"item":-4.30000007152557,"defaultTexture":0},"nose_3":{"defaultItem":0,"item":-0.59999998658895,"defaultTexture":0},"eyebrown_high":{"defaultItem":0,"item":3.49999994039535,"defaultTexture":0},"chimp_hole":{"defaultItem":0,"item":0.0,"defaultTexture":0},"mask":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"jaw_bone_width":{"defaultItem":0,"item":4.19999986886978,"defaultTexture":0},"cheek_1":{"defaultItem":0,"item":4.39999997615814,"defaultTexture":0},"accessory":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"t-shirt":{"defaultItem":1,"item":15,"texture":0,"defaultTexture":0},"cheek_3":{"defaultItem":0,"item":-0.90000003576278,"defaultTexture":0},"watch":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":0},"beard":{"opacity":1.0,"defaultTexture":1,"defaultItem":-1,"item":255,"texture":0,"highlight":0},"chimp_bone_lenght":{"defaultItem":0,"item":-4.39999997615814,"defaultTexture":0},"vest":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"eye_color":{"defaultItem":-1,"item":1,"texture":0,"defaultTexture":0},"nose_0":{"defaultItem":0,"item":0.0,"defaultTexture":0},"pants":{"defaultItem":0,"item":28,"texture":0,"defaultTexture":0},"nose_2":{"defaultItem":0,"item":-2.89999991655349,"defaultTexture":0},"arms":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"blush":{"opacity":1.0,"defaultTexture":1,"defaultItem":-1,"item":255,"texture":0,"highlight":0},"face":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"decals":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"skinDad":0,"hat":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":0},"glass":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":-1},"eyebrown_forward":{"defaultItem":0,"item":-2.5,"defaultTexture":0},"skinMom":0,"makeup":{"opacity":1.0,"defaultTexture":1,"defaultItem":-1,"item":255,"texture":0,"highlight":0},"ageing":{"opacity":0.15999999642372,"defaultTexture":0,"defaultItem":-1,"item":0,"texture":0,"highlight":0},"nose_5":{"defaultItem":0,"item":-0.19999999552965,"defaultTexture":0}}', 1),
	(414, 'RDT43347', 'mp_f_freemode_01', '{"cheek_3":{"item":0.0,"defaultItem":0,"defaultTexture":0},"decals":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"ear":{"defaultTexture":0,"texture":-1,"defaultItem":-1,"item":-1},"chimp_bone_lenght":{"item":0.0,"defaultItem":0,"defaultTexture":0},"nose_0":{"item":0.0,"defaultItem":0,"defaultTexture":0},"eye_color":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":1},"nose_3":{"item":0.0,"defaultItem":0,"defaultTexture":0},"lipstick":{"highlight":0,"opacity":0.60983419418334,"defaultItem":-1,"defaultTexture":1,"item":0,"texture":53},"chimp_bone_lowering":{"item":0.0,"defaultItem":0,"defaultTexture":0},"hair":{"style":0,"texture":61,"defaultItem":0,"defaultTexture":0,"highlight":1,"item":54},"beard":{"highlight":0,"opacity":1.0,"defaultItem":-1,"defaultTexture":1,"item":255,"texture":0},"t-shirt":{"defaultTexture":0,"texture":0,"defaultItem":1,"item":2},"mask":{"defaultTexture":0,"texture":12,"defaultItem":0,"item":105},"vest":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":171},"bracelet":{"defaultTexture":0,"texture":-1,"defaultItem":-1,"item":-1},"nose_1":{"item":0.0,"defaultItem":0,"defaultTexture":0},"nose_5":{"item":0.0,"defaultItem":0,"defaultTexture":0},"nose_4":{"item":0.0,"defaultItem":0,"defaultTexture":0},"eyebrows":{"highlight":0,"opacity":0.23999999463558,"defaultItem":-1,"defaultTexture":1,"item":13,"texture":0},"accessory":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"eye_opening":{"item":0.0,"defaultItem":0,"defaultTexture":0},"bodyb":{"highlight":0,"opacity":1.0,"defaultItem":0,"defaultTexture":0,"item":255,"texture":0},"ageing":{"highlight":0,"opacity":0.15999999642372,"defaultItem":-1,"defaultTexture":0,"item":8,"texture":0},"makeup":{"highlight":0,"opacity":1.0,"defaultItem":-1,"defaultTexture":1,"item":255,"texture":0},"eyebrown_forward":{"item":0.0,"defaultItem":0,"defaultTexture":0},"chimp_bone_width":{"item":0.0,"defaultItem":0,"defaultTexture":0},"blush":{"highlight":0,"opacity":0.2699156999588,"defaultItem":-1,"defaultTexture":1,"item":1,"texture":34},"arms":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":9},"skinDad":1,"pants":{"defaultTexture":0,"texture":7,"defaultItem":0,"item":97},"skinMom":6,"neck_thikness":{"item":0.0,"defaultItem":0,"defaultTexture":0},"tattoos":[],"watch":{"defaultTexture":0,"texture":-1,"defaultItem":-1,"item":-1},"chimp_hole":{"item":0.0,"defaultItem":0,"defaultTexture":0},"glass":{"defaultTexture":-1,"texture":-1,"defaultItem":-1,"item":-1},"hat":{"defaultTexture":0,"texture":-1,"defaultItem":-1,"item":-1},"bag":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"nose_2":{"item":0.0,"defaultItem":0,"defaultTexture":0},"moles":{"highlight":0,"opacity":0.5,"defaultItem":-1,"defaultTexture":0,"item":255,"texture":0},"lips_thickness":{"item":0.0,"defaultItem":0,"defaultTexture":0},"sun_damage":{"highlight":0,"opacity":0.73000001907348,"defaultItem":0,"defaultTexture":0,"item":255,"texture":0},"jaw_bone_width":{"item":0.0,"defaultItem":0,"defaultTexture":0},"cheek_2":{"item":0.0,"defaultItem":0,"defaultTexture":0},"cheek_1":{"item":0.0,"defaultItem":0,"defaultTexture":0},"face2":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"face":{"defaultTexture":0,"texture":21,"defaultItem":0,"item":21},"eyebrown_high":{"item":0.0,"defaultItem":0,"defaultTexture":0},"complexion":{"highlight":0,"opacity":0.0,"defaultItem":0,"defaultTexture":0,"item":255,"texture":0},"chest":{"highlight":0,"opacity":1.0,"defaultItem":0,"defaultTexture":0,"item":255,"texture":0},"facemix":{"skinMix":0.19277295470237,"shapeMix":0.0},"jaw_bone_back_lenght":{"item":0.0,"defaultItem":0,"defaultTexture":0},"shoes":{"defaultTexture":0,"texture":1,"defaultItem":1,"item":297},"torso2":{"defaultTexture":0,"texture":5,"defaultItem":0,"item":262}}', 1),
	(415, 'XVQ84862', 'mp_f_freemode_01', '{"cheek_3":{"item":-3.36799213151608,"defaultItem":0,"defaultTexture":0},"decals":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"ear":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":13},"nose_2":{"item":-0.5,"defaultItem":0,"defaultTexture":0},"nose_0":{"item":-1.47955599269355,"defaultItem":0,"defaultTexture":0},"eye_color":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":5},"nose_3":{"item":-4.0,"defaultItem":0,"defaultTexture":0},"lipstick":{"highlight":0,"opacity":0.62494168891386,"defaultItem":-1,"defaultTexture":1,"item":5,"texture":52},"nose_4":{"item":-0.89999999999999,"defaultItem":0,"defaultTexture":0},"hair":{"style":0,"texture":36,"defaultItem":0,"defaultTexture":0,"highlight":37,"item":53},"t-shirt":{"defaultTexture":0,"texture":0,"defaultItem":1,"item":2},"mask":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"vest":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"accessory":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":123},"eye_opening":{"item":2.2,"defaultItem":0,"defaultTexture":0},"cheek_2":{"item":-0.7,"defaultItem":0,"defaultTexture":0},"sun_damage":{"highlight":0,"opacity":0.0,"defaultItem":0,"defaultTexture":0,"item":7,"texture":0},"makeup":{"highlight":36,"opacity":0.53051988197274,"defaultItem":-1,"defaultTexture":1,"item":4,"texture":36},"eyebrown_forward":{"item":0.31895461570886,"defaultItem":0,"defaultTexture":0},"chimp_bone_width":{"item":0.22902908528874,"defaultItem":0,"defaultTexture":0},"blush":{"highlight":0,"opacity":0.251031333427,"defaultItem":-1,"defaultTexture":1,"item":2,"texture":34},"arms":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":6},"skinDad":6,"pants":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":213},"skinMom":26,"neck_thikness":{"item":-4.3,"defaultItem":0,"defaultTexture":0},"tattoos":[],"watch":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":-1},"moles":{"highlight":0,"opacity":0.23,"defaultItem":-1,"defaultTexture":0,"item":-1,"texture":0},"nose_1":{"item":4.3,"defaultItem":0,"defaultTexture":0},"bag":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"chimp_hole":{"item":0.0,"defaultItem":0,"defaultTexture":0},"shoes":{"defaultTexture":0,"texture":3,"defaultItem":1,"item":211},"eyebrows":{"highlight":0,"opacity":0.56451173247154,"defaultItem":-1,"defaultTexture":1,"item":0,"texture":3},"ageing":{"highlight":0,"opacity":0.38,"defaultItem":-1,"defaultTexture":0,"item":-1,"texture":0},"chimp_bone_lowering":{"item":2.7,"defaultItem":0,"defaultTexture":0},"face2":{"defaultTexture":0,"texture":21,"defaultItem":0,"item":21},"cheek_1":{"item":-1.83925811437403,"defaultItem":0,"defaultTexture":0},"eyebrown_high":{"item":-1.47955599269355,"defaultItem":0,"defaultTexture":0},"chimp_bone_lenght":{"item":-2.7,"defaultItem":0,"defaultTexture":0},"jaw_bone_back_lenght":{"item":-4.2,"defaultItem":0,"defaultTexture":0},"torso2":{"defaultTexture":0,"texture":14,"defaultItem":0,"item":441},"complexion":{"highlight":0,"opacity":0.42854433047632,"defaultItem":0,"defaultTexture":0,"item":5,"texture":0},"nose_5":{"item":4.3,"defaultItem":0,"defaultTexture":0},"facemix":{"skinMix":0.32469135802469,"shapeMix":0.99},"jaw_bone_width":{"item":-0.89999999999999,"defaultItem":0,"defaultTexture":0},"face":{"defaultTexture":0,"texture":6,"defaultItem":0,"item":6},"lips_thickness":{"item":-4.3656034846143,"defaultItem":0,"defaultTexture":0}}', 1),
	(416, 'EBT98762', 'mp_m_freemode_01', '{"eye_color":{"item":4,"defaultItem":-1,"texture":0,"defaultTexture":0},"eyebrown_high":{"item":-1.56950667500495,"defaultItem":0,"defaultTexture":0},"chimp_hole":{"item":0.19999999552965,"defaultItem":0,"defaultTexture":0},"vest":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"skinDad":0,"nose_2":{"item":-0.7999999821186,"defaultItem":0,"defaultTexture":0},"t-shirt":{"item":71,"defaultItem":1,"texture":0,"defaultTexture":0},"makeup":{"item":255,"defaultItem":-1,"defaultTexture":1,"texture":0,"highlight":0,"opacity":1.0},"bodyb":{"item":255,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"opacity":1.0},"torso2":{"item":564,"defaultItem":0,"texture":0,"defaultTexture":0},"ear":{"item":-1,"defaultItem":-1,"texture":-1,"defaultTexture":0},"tattoos":[],"hair":{"item":91,"defaultItem":0,"defaultTexture":0,"texture":3,"highlight":3,"style":0},"nose_0":{"item":0.0,"defaultItem":0,"defaultTexture":0},"facemix":{"shapeMix":0.03077177517116,"skinMix":0.33140845070422},"watch":{"item":-1,"defaultItem":-1,"texture":-1,"defaultTexture":0},"cheek_2":{"item":2.09999993443489,"defaultItem":0,"defaultTexture":0},"moles":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0,"highlight":0,"opacity":0.28000000119209},"bag":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"arms":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"chimp_bone_lenght":{"item":-0.50000000745058,"defaultItem":0,"defaultTexture":0},"lipstick":{"item":255,"defaultItem":-1,"defaultTexture":1,"texture":0,"highlight":0,"opacity":1.0},"neck_thikness":{"item":5.06726443767547,"defaultItem":0,"defaultTexture":0},"lips_thickness":{"item":10.0,"defaultItem":0,"defaultTexture":0},"jaw_bone_back_lenght":{"item":0.04484305158257,"defaultItem":0,"defaultTexture":0},"chimp_bone_lowering":{"item":-0.7999999821186,"defaultItem":0,"defaultTexture":0},"nose_1":{"item":-4.39999997615814,"defaultItem":0,"defaultTexture":0},"nose_5":{"item":0.09999999776482,"defaultItem":0,"defaultTexture":0},"nose_3":{"item":-4.19999986886978,"defaultItem":0,"defaultTexture":0},"blush":{"item":255,"defaultItem":-1,"defaultTexture":1,"texture":0,"highlight":0,"opacity":1.0},"bracelet":{"item":-1,"defaultItem":-1,"texture":-1,"defaultTexture":0},"chest":{"item":255,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"opacity":1.0},"chimp_bone_width":{"item":0.90000003576278,"defaultItem":0,"defaultTexture":0},"decals":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"beard":{"item":12,"defaultItem":-1,"defaultTexture":1,"texture":3,"highlight":0,"opacity":0.99000000953674},"ageing":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0,"highlight":0,"opacity":0.69999998807907},"face2":{"item":21,"defaultItem":0,"texture":21,"defaultTexture":0},"glass":{"item":-1,"defaultItem":-1,"texture":-1,"defaultTexture":-1},"sun_damage":{"item":-1,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"opacity":0.72000002861022},"jaw_bone_width":{"item":-10.0,"defaultItem":0,"defaultTexture":0},"shoes":{"item":191,"defaultItem":1,"texture":0,"defaultTexture":0},"pants":{"item":252,"defaultItem":0,"texture":0,"defaultTexture":0},"cheek_1":{"item":-4.19999986886978,"defaultItem":0,"defaultTexture":0},"nose_4":{"item":-4.39999997615814,"defaultItem":0,"defaultTexture":0},"eye_opening":{"item":0.50000000745058,"defaultItem":0,"defaultTexture":0},"accessory":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"mask":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"eyebrows":{"item":12,"defaultItem":-1,"defaultTexture":1,"texture":3,"highlight":0,"opacity":0.50408071279525},"complexion":{"item":11,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"opacity":0.0},"eyebrown_forward":{"item":-2.0179371535778,"defaultItem":0,"defaultTexture":0},"cheek_3":{"item":-1.00000001490116,"defaultItem":0,"defaultTexture":0},"hat":{"item":-1,"defaultItem":-1,"texture":-1,"defaultTexture":0},"face":{"item":2,"defaultItem":0,"texture":2,"defaultTexture":0},"skinMom":17}', 1),
	(418, 'LKQ99821', 'mp_m_freemode_01', '{"eye_color":{"texture":0,"defaultItem":-1,"item":1,"defaultTexture":0},"eyebrown_high":{"item":1.29999995231628,"defaultItem":0,"defaultTexture":0},"hat":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"vest":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"skinDad":1,"tattoos":[],"lipstick":{"item":255,"defaultItem":-1,"defaultTexture":1,"texture":0,"highlight":0,"opacity":1.0},"makeup":{"item":-1,"defaultItem":-1,"defaultTexture":1,"texture":0,"highlight":0,"opacity":1.0},"nose_0":{"item":0.0,"defaultItem":0,"defaultTexture":0},"face":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"mask":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"chimp_hole":{"item":0.0,"defaultItem":0,"defaultTexture":0},"nose_4":{"item":3.70000004768371,"defaultItem":0,"defaultTexture":0},"ear":{"texture":-1,"defaultItem":-1,"item":-1,"defaultTexture":0},"facemix":{"shapeMix":0.16271604938271,"skinMix":0.13384678959846},"watch":{"texture":-1,"defaultItem":-1,"item":-1,"defaultTexture":0},"torso2":{"texture":0,"defaultItem":0,"item":382,"defaultTexture":0},"moles":{"item":17,"defaultItem":-1,"defaultTexture":0,"texture":0,"highlight":0,"opacity":0.27000001072883},"chimp_bone_width":{"item":3.40000003576278,"defaultItem":0,"defaultTexture":0},"arms":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"chimp_bone_lenght":{"item":4.90000009536743,"defaultItem":0,"defaultTexture":0},"t-shirt":{"texture":0,"defaultItem":1,"item":35,"defaultTexture":0},"neck_thikness":{"item":2.59999990463256,"defaultItem":0,"defaultTexture":0},"lips_thickness":{"item":-2.02753969369116,"defaultItem":0,"defaultTexture":0},"hair":{"item":151,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"style":0},"chimp_bone_lowering":{"item":-3.70000004768371,"defaultItem":0,"defaultTexture":0},"nose_1":{"item":1.59999996423721,"defaultItem":0,"defaultTexture":0},"nose_5":{"item":4.00000005960464,"defaultItem":0,"defaultTexture":0},"nose_3":{"item":0.09999999776482,"defaultItem":0,"defaultTexture":0},"eye_opening":{"item":-3.10000002384185,"defaultItem":0,"defaultTexture":0},"bracelet":{"texture":-1,"defaultItem":-1,"item":-1,"defaultTexture":0},"beard":{"item":8,"defaultItem":-1,"defaultTexture":1,"texture":0,"highlight":0,"opacity":1.0},"chest":{"item":16,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"opacity":1.0},"decals":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"bodyb":{"item":-1,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"opacity":1.0},"nose_2":{"item":-0.29999999329447,"defaultItem":0,"defaultTexture":0},"accessory":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"glass":{"texture":0,"defaultItem":-1,"item":7,"defaultTexture":-1},"sun_damage":{"item":3,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"opacity":0.18999999761581},"jaw_bone_width":{"item":2.19999998807907,"defaultItem":0,"defaultTexture":0},"shoes":{"texture":0,"defaultItem":1,"item":18,"defaultTexture":0},"pants":{"texture":0,"defaultItem":0,"item":125,"defaultTexture":0},"cheek_1":{"item":0.13910355486862,"defaultItem":0,"defaultTexture":0},"cheek_2":{"item":-3.89999985694885,"defaultItem":0,"defaultTexture":0},"face2":{"texture":29,"defaultItem":0,"item":29,"defaultTexture":0},"jaw_bone_back_lenght":{"item":-1.29999995231628,"defaultItem":0,"defaultTexture":0},"ageing":{"item":7,"defaultItem":-1,"defaultTexture":0,"texture":0,"highlight":0,"opacity":0.23970071659407},"eyebrows":{"item":30,"defaultItem":-1,"defaultTexture":1,"texture":1,"highlight":0,"opacity":0.41999998688697},"complexion":{"item":3,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"opacity":0.31999999284744},"bag":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"cheek_3":{"item":-0.3999999910593,"defaultItem":0,"defaultTexture":0},"eyebrown_forward":{"item":-4.30000007152557,"defaultItem":0,"defaultTexture":0},"blush":{"item":255,"defaultItem":-1,"defaultTexture":1,"texture":0,"highlight":0,"opacity":1.0},"skinMom":5}', 1),
	(422, 'YDT13754', 'mp_m_freemode_01', '{"beard":{"highlight":0,"opacity":0.99000000953674,"defaultItem":-1,"texture":0,"item":2,"defaultTexture":1},"nose_1":{"defaultItem":0,"item":0.0,"defaultTexture":0},"jaw_bone_back_lenght":{"defaultItem":0,"item":0.0,"defaultTexture":0},"nose_0":{"defaultItem":0,"item":0.0,"defaultTexture":0},"ear":{"item":-1,"texture":-1,"defaultItem":-1,"defaultTexture":0},"bodyb":{"highlight":0,"opacity":1.0,"defaultItem":0,"texture":0,"item":255,"defaultTexture":0},"eyebrows":{"highlight":0,"opacity":0.15999999642372,"defaultItem":-1,"texture":0,"item":33,"defaultTexture":1},"facemix":{"skinMix":0.19037036597728,"shapeMix":0.0},"skinMom":32,"nose_4":{"defaultItem":0,"item":0.0,"defaultTexture":0},"chest":{"highlight":0,"opacity":1.0,"defaultItem":0,"texture":0,"item":255,"defaultTexture":0},"chimp_bone_lowering":{"defaultItem":0,"item":0.0,"defaultTexture":0},"tattoos":[],"nose_2":{"defaultItem":0,"item":0.0,"defaultTexture":0},"neck_thikness":{"defaultItem":0,"item":0.0,"defaultTexture":0},"watch":{"item":-1,"texture":-1,"defaultItem":-1,"defaultTexture":0},"cheek_3":{"defaultItem":0,"item":0.0,"defaultTexture":0},"complexion":{"highlight":0,"opacity":0.0,"defaultItem":0,"texture":0,"item":255,"defaultTexture":0},"eye_opening":{"defaultItem":0,"item":0.0,"defaultTexture":0},"moles":{"highlight":0,"opacity":0.18000000715255,"defaultItem":-1,"texture":0,"item":15,"defaultTexture":0},"torso2":{"item":404,"texture":7,"defaultItem":0,"defaultTexture":0},"eyebrown_high":{"defaultItem":0,"item":0.0,"defaultTexture":0},"sun_damage":{"highlight":0,"opacity":0.68000000715255,"defaultItem":0,"texture":0,"item":1,"defaultTexture":0},"eyebrown_forward":{"defaultItem":0,"item":0.0,"defaultTexture":0},"cheek_1":{"defaultItem":0,"item":0.0,"defaultTexture":0},"blush":{"highlight":0,"opacity":1.0,"defaultItem":-1,"texture":0,"item":255,"defaultTexture":1},"ageing":{"highlight":0,"opacity":0.57999998331069,"defaultItem":-1,"texture":0,"item":11,"defaultTexture":0},"glass":{"item":65,"texture":9,"defaultItem":-1,"defaultTexture":-1},"t-shirt":{"item":89,"texture":0,"defaultItem":1,"defaultTexture":0},"bracelet":{"item":-1,"texture":-1,"defaultItem":-1,"defaultTexture":0},"hair":{"highlight":1,"defaultItem":0,"style":0,"texture":0,"item":135,"defaultTexture":0},"mask":{"item":91,"texture":3,"defaultItem":0,"defaultTexture":0},"decals":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"pants":{"item":261,"texture":1,"defaultItem":0,"defaultTexture":0},"chimp_bone_width":{"defaultItem":0,"item":0.0,"defaultTexture":0},"eye_color":{"item":1,"defaultItem":-1,"texture":0,"defaultTexture":0},"face2":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"lipstick":{"highlight":0,"opacity":1.0,"defaultItem":-1,"texture":0,"item":255,"defaultTexture":1},"jaw_bone_width":{"defaultItem":0,"item":0.0,"defaultTexture":0},"arms":{"item":22,"texture":0,"defaultItem":0,"defaultTexture":0},"lips_thickness":{"defaultItem":0,"item":0.0,"defaultTexture":0},"bag":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"accessory":{"item":147,"texture":0,"defaultItem":0,"defaultTexture":0},"vest":{"item":105,"texture":3,"defaultItem":0,"defaultTexture":0},"nose_5":{"defaultItem":0,"item":0.0,"defaultTexture":0},"chimp_bone_lenght":{"defaultItem":0,"item":0.0,"defaultTexture":0},"nose_3":{"defaultItem":0,"item":0.0,"defaultTexture":0},"makeup":{"highlight":0,"opacity":1.0,"defaultItem":-1,"texture":0,"item":255,"defaultTexture":1},"hat":{"item":216,"texture":8,"defaultItem":-1,"defaultTexture":0},"face":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"chimp_hole":{"defaultItem":0,"item":0.0,"defaultTexture":0},"shoes":{"item":175,"texture":0,"defaultItem":1,"defaultTexture":0},"cheek_2":{"defaultItem":0,"item":0.0,"defaultTexture":0},"skinDad":10}', 1),
	(447, 'ETF72063', 'mp_m_freemode_01', '{"cheek_3":{"item":0.76858226780947,"defaultTexture":0,"defaultItem":0},"mask":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"chimp_bone_width":{"item":4.63538007587466,"defaultTexture":0,"defaultItem":0},"eyebrows":{"item":6,"highlight":0,"defaultTexture":1,"defaultItem":-1,"texture":1,"opacity":0.64760292257973},"watch":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"neck_thikness":{"item":5.71448644091611,"defaultTexture":0,"defaultItem":0},"eye_opening":{"item":5.43627933117886,"defaultTexture":0,"defaultItem":0},"nose_0":{"item":5.17493325839539,"defaultTexture":0,"defaultItem":0},"skinMom":31,"glass":{"item":20,"defaultTexture":-1,"texture":0,"defaultItem":-1},"torso2":{"item":6,"defaultTexture":0,"texture":0,"defaultItem":0},"face2":{"item":25,"defaultTexture":0,"texture":25,"defaultItem":0},"vest":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"bag":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"hair":{"item":125,"highlight":29,"style":0,"defaultItem":0,"texture":29,"defaultTexture":0},"t-shirt":{"item":15,"defaultTexture":0,"texture":0,"defaultItem":1},"facemix":{"skinMix":0.15,"shapeMix":0.55382716049382},"eye_color":{"item":2,"defaultTexture":0,"texture":0,"defaultItem":-1},"moles":{"item":1,"highlight":0,"defaultTexture":0,"defaultItem":-1,"texture":0,"opacity":0.24},"eyebrown_forward":{"item":2.5,"defaultTexture":0,"defaultItem":0},"eyebrown_high":{"item":3.1,"defaultTexture":0,"defaultItem":0},"sun_damage":{"item":10,"highlight":0,"defaultTexture":0,"defaultItem":0,"texture":0,"opacity":0.32},"lips_thickness":{"item":0.2,"defaultTexture":0,"defaultItem":0},"nose_2":{"item":-2.4,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":3.5,"defaultTexture":0,"defaultItem":0},"chimp_hole":{"item":4.54545454545454,"defaultTexture":0,"defaultItem":0},"complexion":{"item":11,"highlight":0,"defaultTexture":0,"defaultItem":0,"texture":0,"opacity":0.02},"nose_3":{"item":-2.5,"defaultTexture":0,"defaultItem":0},"skinDad":21,"cheek_2":{"item":6.25403962343684,"defaultTexture":0,"defaultItem":0},"face":{"item":12,"defaultTexture":0,"texture":12,"defaultItem":0},"ageing":{"item":7,"highlight":0,"defaultTexture":0,"defaultItem":-1,"texture":0,"opacity":0.42},"arms":{"item":1,"defaultTexture":0,"texture":0,"defaultItem":0},"accessory":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"jaw_bone_width":{"item":-0.22059856681185,"defaultTexture":0,"defaultItem":0},"shoes":{"item":16,"defaultTexture":0,"texture":6,"defaultItem":1},"cheek_1":{"item":-1.29970493185331,"defaultTexture":0,"defaultItem":0},"tattoos":[],"chimp_bone_lenght":{"item":0.58873120696922,"defaultTexture":0,"defaultItem":0},"chimp_bone_lowering":{"item":4.09582689335394,"defaultTexture":0,"defaultItem":0},"jaw_bone_back_lenght":{"item":2.92679499789237,"defaultTexture":0,"defaultItem":0},"nose_1":{"item":-0.5,"defaultTexture":0,"defaultItem":0},"decals":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"nose_5":{"item":-3.0,"defaultTexture":0,"defaultItem":0},"pants":{"item":144,"defaultTexture":0,"texture":0,"defaultItem":0},"bracelet":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"beard":{"item":8,"highlight":0,"defaultTexture":1,"defaultItem":-1,"texture":26,"opacity":0.99}}', 1),
	(450, 'AEZ52818', 'mp_m_freemode_01', '{"nose_5":{"defaultItem":0,"item":0.0,"defaultTexture":0},"vest":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"nose_4":{"defaultItem":0,"item":1.79999999999999,"defaultTexture":0},"shoes":{"texture":7,"defaultItem":1,"item":146,"defaultTexture":0},"lips_thickness":{"defaultItem":0,"item":10.0,"defaultTexture":0},"chimp_bone_width":{"defaultItem":0,"item":3.59999999999999,"defaultTexture":0},"neck_thikness":{"defaultItem":0,"item":-2.0,"defaultTexture":0},"torso2":{"texture":0,"defaultItem":0,"item":659,"defaultTexture":0},"t-shirt":{"texture":0,"defaultItem":1,"item":15,"defaultTexture":0},"eyebrows":{"highlight":0,"item":2,"opacity":0.94219896023605,"defaultTexture":1,"texture":0,"defaultItem":-1},"nose_3":{"defaultItem":0,"item":3.3,"defaultTexture":0},"sun_damage":{"highlight":0,"item":1,"opacity":0.1,"defaultTexture":0,"texture":0,"defaultItem":0},"eye_color":{"texture":0,"item":19,"defaultItem":-1,"defaultTexture":0},"complexion":{"highlight":0,"item":-1,"opacity":0.99,"defaultTexture":0,"texture":0,"defaultItem":0},"facemix":{"skinMix":0.22075716849499,"shapeMix":0.22987654320987},"face2":{"texture":21,"item":21,"defaultItem":0,"defaultTexture":0},"skinMom":3,"cheek_1":{"defaultItem":0,"item":-1.3,"defaultTexture":0},"chimp_bone_lowering":{"defaultItem":0,"item":1.0,"defaultTexture":0},"nose_1":{"defaultItem":0,"item":3.2,"defaultTexture":0},"chimp_hole":{"defaultItem":0,"item":-2.5,"defaultTexture":0},"decals":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"lipstick":{"highlight":0,"item":0,"opacity":0.15,"defaultTexture":1,"texture":0,"defaultItem":-1},"tattoos":[],"eye_opening":{"defaultItem":0,"item":1.11985387101306,"defaultTexture":0},"ageing":{"highlight":0,"item":-1,"opacity":0.25,"defaultTexture":0,"texture":0,"defaultItem":-1},"hair":{"highlight":0,"item":84,"texture":19,"style":0,"defaultTexture":0,"defaultItem":0},"cheek_3":{"defaultItem":0,"item":-3.59999999999999,"defaultTexture":0},"arms":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"eyebrown_forward":{"defaultItem":0,"item":-1.7,"defaultTexture":0},"jaw_bone_width":{"defaultItem":0,"item":-4.6,"defaultTexture":0},"pants":{"texture":3,"defaultItem":0,"item":220,"defaultTexture":0},"moles":{"highlight":0,"item":14,"opacity":0.42,"defaultTexture":0,"texture":0,"defaultItem":-1},"jaw_bone_back_lenght":{"defaultItem":0,"item":-4.2,"defaultTexture":0},"beard":{"highlight":0,"item":1,"opacity":0.99,"defaultTexture":1,"texture":0,"defaultItem":-1},"skinDad":8,"chimp_bone_lenght":{"defaultItem":0,"item":0.3,"defaultTexture":0},"nose_2":{"defaultItem":0,"item":-0.2,"defaultTexture":0},"mask":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"cheek_2":{"defaultItem":0,"item":-2.5,"defaultTexture":0},"accessory":{"texture":0,"defaultItem":0,"item":159,"defaultTexture":0},"bag":{"texture":0,"defaultItem":0,"item":141,"defaultTexture":0},"eyebrown_high":{"defaultItem":0,"item":3.37642264999297,"defaultTexture":0},"glass":{"texture":7,"defaultItem":-1,"item":13,"defaultTexture":-1},"face":{"texture":8,"item":8,"defaultItem":0,"defaultTexture":0}}', 1),
	(460, 'STG67749', 'mp_m_freemode_01', '{"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":2.70000010728836},"arms":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":1},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":-0.22059855982661},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":-1.38963043689727},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":1.75776302814483},"sun_damage":{"texture":0,"defaultItem":0,"item":8,"defaultTexture":0,"opacity":0.40999999642372,"highlight":0},"face":{"texture":1,"defaultTexture":0,"defaultItem":0,"item":1},"vest":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":7.15329468250274},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":-3.19657146930694},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":-2.19999998807907},"mask":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"complexion":{"texture":0,"defaultItem":0,"item":6,"defaultTexture":0,"opacity":0.31999999284744,"highlight":0},"skinDad":9,"glass":{"texture":-1,"defaultTexture":-1,"defaultItem":-1,"item":-1},"watch":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"blush":{"texture":0,"defaultItem":-1,"item":255,"defaultTexture":1,"opacity":1.0,"highlight":0},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":-0.09999999776482},"face2":{"texture":21,"defaultTexture":0,"defaultItem":0,"item":21},"bracelet":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0.0},"torso2":{"texture":3,"defaultTexture":0,"defaultItem":0,"item":485},"hair":{"texture":26,"defaultItem":0,"item":12,"defaultTexture":0,"style":0,"highlight":28},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":3.49999994039535},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":3.49999994039535},"tattoos":[],"hat":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":220},"facemix":{"skinMix":0.33302634954452,"shapeMix":0.66602420806884},"eye_color":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":5},"ageing":{"texture":0,"defaultItem":-1,"item":255,"defaultTexture":0,"opacity":0.0,"highlight":0},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":1.03835888206958},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":6.88351809978485},"pants":{"texture":5,"defaultTexture":0,"defaultItem":0,"item":218},"eyebrows":{"texture":26,"defaultItem":-1,"item":21,"defaultTexture":1,"opacity":0.99000000953674,"highlight":0},"bag":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"skinMom":17,"decals":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"accessory":{"texture":8,"defaultTexture":0,"defaultItem":0,"item":0},"moles":{"texture":0,"defaultItem":-1,"item":3,"defaultTexture":0,"opacity":0.5,"highlight":0},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":2.39999994635581},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":-0.67022621631622},"ear":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"beard":{"texture":2,"defaultItem":-1,"item":10,"defaultTexture":1,"opacity":0.54185050725936,"highlight":0},"shoes":{"texture":2,"defaultTexture":0,"defaultItem":1,"item":135},"bodyb":{"texture":0,"defaultItem":0,"item":255,"defaultTexture":0,"opacity":1.0,"highlight":0},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":4.90000009536743},"makeup":{"texture":0,"defaultItem":-1,"item":255,"defaultTexture":1,"opacity":1.0,"highlight":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":7.69284784793853},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":0.0},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":-4.30000007152557},"lipstick":{"texture":0,"defaultItem":-1,"item":255,"defaultTexture":1,"opacity":1.0,"highlight":0},"chest":{"texture":0,"defaultItem":0,"item":255,"defaultTexture":0,"opacity":1.0,"highlight":0},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":-2.59999990463256},"t-shirt":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":46}}', 1),
	(471, 'HOU41578', 'mp_m_freemode_01', '{"torso2":{"item":437,"defaultItem":0,"defaultTexture":0,"texture":13},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":-0.7999999821186},"chest":{"item":255,"highlight":0,"texture":0,"defaultItem":0,"opacity":1.0,"defaultTexture":0},"glass":{"item":-1,"defaultItem":-1,"defaultTexture":-1,"texture":-1},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":-2.19999998807907},"beard":{"item":255,"highlight":0,"texture":0,"defaultItem":-1,"opacity":1.0,"defaultTexture":1},"moles":{"item":9,"highlight":0,"texture":0,"defaultItem":-1,"opacity":0.31000000238418,"defaultTexture":0},"face2":{"item":21,"defaultItem":0,"defaultTexture":0,"texture":21},"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":-1.09999999403953},"watch":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":-1},"shoes":{"item":-1,"defaultItem":1,"defaultTexture":0,"texture":0},"facemix":{"skinMix":0.55619716644287,"shapeMix":0.60746479034423},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":0.0},"bodyb":{"item":255,"highlight":0,"texture":0,"defaultItem":0,"opacity":1.0,"defaultTexture":0},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":5.0},"nose_3":{"defaultItem":0,"defaultTexture":0,"item":1.59999996423721},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":2.80000001192092},"nose_0":{"defaultItem":0,"defaultTexture":0,"item":0.0},"skinMom":0,"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":1.09999999403953},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":0.70000000298023},"sun_damage":{"item":2,"highlight":0,"texture":0,"defaultItem":0,"opacity":0.56000000238418,"defaultTexture":0},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":0.59999998658895},"ear":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":-1},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":-2.70000010728836},"face":{"item":40,"defaultItem":0,"defaultTexture":0,"texture":40},"eye_color":{"item":1,"defaultItem":-1,"defaultTexture":0,"texture":0},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":1.59999996423721},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":4.69999998807907},"accessory":{"item":104,"defaultItem":0,"defaultTexture":0,"texture":0},"hat":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":-1},"t-shirt":{"item":15,"defaultItem":1,"defaultTexture":0,"texture":0},"decals":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":0.0},"skinDad":10,"hair":{"style":0,"item":13,"highlight":1,"defaultItem":0,"defaultTexture":0,"texture":1},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":3.30000013113021},"vest":{"item":96,"defaultItem":0,"defaultTexture":0,"texture":0},"bag":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"eyebrows":{"item":9,"highlight":0,"texture":0,"defaultItem":-1,"opacity":0.23999999463558,"defaultTexture":1},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":4.19999986886978},"mask":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"makeup":{"item":255,"highlight":0,"texture":0,"defaultItem":-1,"opacity":1.0,"defaultTexture":1},"lipstick":{"item":255,"highlight":0,"texture":0,"defaultItem":-1,"opacity":1.0,"defaultTexture":1},"pants":{"item":-1,"defaultItem":0,"defaultTexture":0,"texture":0},"blush":{"item":255,"highlight":0,"texture":0,"defaultItem":-1,"opacity":1.0,"defaultTexture":1},"bracelet":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":-1},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":-1.89999997615814},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":0.70000000298023},"complexion":{"item":9,"highlight":0,"texture":0,"defaultItem":0,"opacity":0.10999999940395,"defaultTexture":0},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":-1.80000007152557},"ageing":{"item":5,"highlight":0,"texture":0,"defaultItem":-1,"opacity":0.25999999046325,"defaultTexture":0},"arms":{"item":1,"defaultItem":0,"defaultTexture":0,"texture":0},"tattoos":[]}', 1),
	(488, 'UYN60276', 'mp_f_freemode_01', '{"ear":{"texture":0,"defaultItem":-1,"defaultTexture":0,"item":5},"moles":{"defaultItem":-1,"defaultTexture":0,"opacity":0.12999999523162,"texture":0,"highlight":0,"item":255},"facemix":{"skinMix":0.49456790123456,"shapeMix":0.43925925925925},"eyebrows":{"defaultItem":-1,"defaultTexture":1,"opacity":0.27000001072883,"texture":0,"highlight":0,"item":30},"tattoos":[],"lipstick":{"defaultItem":-1,"defaultTexture":1,"opacity":0.0,"texture":35,"highlight":0,"item":255},"ageing":{"defaultItem":-1,"defaultTexture":0,"opacity":0.31999999284744,"texture":0,"highlight":0,"item":-1},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":5.0},"makeup":{"defaultItem":-1,"defaultTexture":1,"opacity":0.45498243641983,"texture":35,"highlight":35,"item":-1},"nose_0":{"defaultItem":0,"defaultTexture":0,"item":0.0},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":-3.40000003576278},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":-2.09999993443489},"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":3.00000011920928},"hat":{"texture":-1,"defaultItem":-1,"defaultTexture":0,"item":-1},"face":{"texture":6,"defaultItem":0,"defaultTexture":0,"item":6},"skinMom":37,"nose_3":{"defaultItem":0,"defaultTexture":0,"item":0.59999998658895},"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":-1.80000007152557},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":-4.90000009536743},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":4.30000007152557},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":2.19999998807907},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":-0.70000000298023},"blush":{"defaultItem":-1,"defaultTexture":1,"opacity":0.36433750391006,"texture":34,"highlight":0,"item":0},"sun_damage":{"defaultItem":0,"defaultTexture":0,"opacity":0.0,"texture":0,"highlight":0,"item":255},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":-3.70000004768371},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":-1.50000005960464},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":0.0},"hair":{"defaultItem":0,"defaultTexture":0,"texture":29,"highlight":14,"item":85,"style":0},"pants":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":23},"chest":{"defaultItem":0,"defaultTexture":0,"opacity":0.4096599817276,"texture":15,"highlight":0,"item":-1},"face2":{"texture":21,"defaultItem":0,"defaultTexture":0,"item":21},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":-2.38724181537164},"accessory":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":167},"arms":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":5},"mask":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"glass":{"texture":2,"defaultItem":-1,"defaultTexture":-1,"item":18},"bracelet":{"texture":-1,"defaultItem":-1,"defaultTexture":0,"item":-1},"decals":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"shoes":{"texture":0,"defaultItem":1,"defaultTexture":0,"item":8},"watch":{"texture":-1,"defaultItem":-1,"defaultTexture":0,"item":-1},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":-3.60000014305114},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":-4.69999998807907},"torso2":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":24},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":1.89999997615814},"beard":{"defaultItem":-1,"defaultTexture":1,"opacity":1.0,"texture":0,"highlight":0,"item":255},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":-0.09999999776482},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":-4.39999997615814},"vest":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"t-shirt":{"texture":0,"defaultItem":1,"defaultTexture":0,"item":15},"skinDad":28,"complexion":{"defaultItem":0,"defaultTexture":0,"opacity":0.23214697203878,"texture":0,"highlight":0,"item":255},"bag":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"bodyb":{"defaultItem":0,"defaultTexture":0,"opacity":0.45120556414219,"texture":0,"highlight":0,"item":255},"eye_color":{"texture":0,"defaultItem":-1,"defaultTexture":0,"item":4}}', 1),
	(490, 'RZY43875', 'mp_m_freemode_01', '{"skinMom":0,"glass":{"item":5,"defaultItem":-1,"defaultTexture":-1,"texture":6},"tattoos":[],"facemix":{"shapeMix":0.27333334088325,"skinMix":0.35629630088806},"bracelet":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":-1},"eyebrown_forward":{"item":-3.90754520893096,"defaultItem":0,"defaultTexture":0},"torso2":{"item":4,"defaultItem":0,"defaultTexture":0,"texture":0},"cheek_2":{"item":8.14247548580169,"defaultItem":0,"defaultTexture":0},"nose_4":{"item":-3.01672041416168,"defaultItem":0,"defaultTexture":0},"jaw_bone_back_lenght":{"item":3.6461991071701,"defaultItem":0,"defaultTexture":0},"lipstick":{"highlight":0,"opacity":1.0,"texture":0,"item":255,"defaultItem":-1,"defaultTexture":1},"chimp_hole":{"item":0.0,"defaultItem":0,"defaultTexture":0},"nose_3":{"item":-2.37881124019622,"defaultItem":0,"defaultTexture":0},"neck_thikness":{"item":5.98426282405853,"defaultItem":0,"defaultTexture":0},"hat":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0},"hair":{"highlight":29,"texture":2,"item":37,"defaultItem":0,"style":0,"defaultTexture":0},"chimp_bone_lenght":{"item":-4.00000005960464,"defaultItem":0,"defaultTexture":0},"nose_2":{"item":-2.92679488658905,"defaultItem":0,"defaultTexture":0},"makeup":{"highlight":0,"opacity":1.0,"texture":0,"item":255,"defaultItem":-1,"defaultTexture":1},"mask":{"item":121,"defaultItem":0,"defaultTexture":0,"texture":0},"blush":{"highlight":0,"opacity":1.0,"texture":0,"item":255,"defaultItem":-1,"defaultTexture":1},"pants":{"item":10,"defaultItem":0,"defaultTexture":0,"texture":0},"cheek_1":{"item":1.75776302814483,"defaultItem":0,"defaultTexture":0},"watch":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0},"skinDad":19,"chimp_bone_width":{"item":0.50000000745058,"defaultItem":0,"defaultTexture":0},"sun_damage":{"highlight":0,"opacity":0.23000000417232,"texture":0,"item":9,"defaultItem":0,"defaultTexture":0},"chest":{"highlight":0,"opacity":1.0,"texture":0,"item":255,"defaultItem":0,"defaultTexture":0},"ear":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":-1},"complexion":{"highlight":0,"opacity":0.6700000166893,"texture":0,"item":6,"defaultItem":0,"defaultTexture":0},"bodyb":{"highlight":0,"opacity":1.0,"texture":0,"item":255,"defaultItem":0,"defaultTexture":0},"lips_thickness":{"item":3.19999992847442,"defaultItem":0,"defaultTexture":0},"decals":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"arms":{"item":4,"defaultItem":0,"defaultTexture":0,"texture":0},"eyebrows":{"highlight":0,"opacity":0.77979344129562,"texture":2,"item":10,"defaultItem":-1,"defaultTexture":1},"eye_opening":{"item":2.0191091299057,"defaultItem":0,"defaultTexture":0},"t-shirt":{"item":31,"defaultItem":1,"defaultTexture":0,"texture":0},"beard":{"highlight":0,"opacity":0.57584232091903,"texture":2,"item":16,"defaultItem":-1,"defaultTexture":1},"eye_color":{"defaultTexture":0,"defaultItem":-1,"item":3,"texture":0},"jaw_bone_width":{"item":-2.73851335048675,"defaultItem":0,"defaultTexture":0},"moles":{"highlight":0,"opacity":0.14000000059604,"texture":0,"item":14,"defaultItem":-1,"defaultTexture":0},"chimp_bone_lowering":{"item":-0.70000000298023,"defaultItem":0,"defaultTexture":0},"nose_1":{"item":0.04074750468134,"defaultItem":0,"defaultTexture":0},"face":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"ageing":{"highlight":0,"opacity":0.43987494707107,"texture":0,"item":2,"defaultItem":-1,"defaultTexture":0},"nose_5":{"item":1.6678375005722,"defaultItem":0,"defaultTexture":0},"accessory":{"item":164,"defaultItem":0,"defaultTexture":0,"texture":0},"bag":{"item":134,"defaultItem":0,"defaultTexture":0,"texture":0},"eyebrown_high":{"item":0.67865677177906,"defaultItem":0,"defaultTexture":0},"shoes":{"item":245,"defaultItem":1,"defaultTexture":0,"texture":0},"face2":{"defaultTexture":0,"defaultItem":0,"item":34,"texture":34},"cheek_3":{"item":-7.32471525669097,"defaultItem":0,"defaultTexture":0},"nose_0":{"item":1.48798644542694,"defaultItem":0,"defaultTexture":0},"vest":{"item":72,"defaultItem":0,"defaultTexture":0,"texture":3}}', 1),
	(492, 'UMV88168', 'mp_m_freemode_01', '{"skinMom":6,"glass":{"defaultTexture":-1,"defaultItem":-1,"item":7,"texture":0},"tattoos":[],"facemix":{"shapeMix":0.61140847206115,"skinMix":0.57591551542282},"bracelet":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":-1},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":-5.33632278442382},"vest":{"defaultTexture":0,"defaultItem":0,"item":63,"texture":0},"moles":{"highlight":0,"opacity":0.0,"texture":0,"defaultTexture":0,"defaultItem":-1,"item":255},"decals":{"defaultTexture":0,"defaultItem":0,"item":179,"texture":0},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":-8.20627808570861},"face2":{"defaultTexture":0,"defaultItem":0,"item":38,"texture":38},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":0.0},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":-2.46636778116226},"sun_damage":{"highlight":0,"opacity":0.4699999988079,"texture":0,"defaultTexture":0,"defaultItem":0,"item":7},"hat":{"defaultTexture":0,"defaultItem":-1,"item":288,"texture":0},"hair":{"style":0,"texture":61,"defaultTexture":0,"defaultItem":0,"item":48,"highlight":62},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":10.0},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":-0.76233185827732},"makeup":{"highlight":0,"opacity":1.0,"texture":0,"defaultTexture":1,"defaultItem":-1,"item":255},"mask":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":6.41255617141723},"pants":{"defaultTexture":0,"defaultItem":0,"item":286,"texture":0},"blush":{"highlight":0,"opacity":1.0,"texture":0,"defaultTexture":1,"defaultItem":-1,"item":255},"watch":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":-1},"skinDad":1,"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0.31390134245157},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":-8.47533643245697},"accessory":{"defaultTexture":0,"defaultItem":0,"item":147,"texture":0},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":0.49327354878187},"complexion":{"highlight":0,"opacity":0.12999999523162,"texture":0,"defaultTexture":0,"defaultItem":0,"item":255},"bodyb":{"highlight":0,"opacity":1.0,"texture":0,"defaultTexture":0,"defaultItem":0,"item":255},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":10.0},"lipstick":{"highlight":0,"opacity":0.15000000596046,"texture":0,"defaultTexture":1,"defaultItem":-1,"item":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":8.11659216880798},"eyebrows":{"highlight":0,"opacity":0.99000000953674,"texture":61,"defaultTexture":1,"defaultItem":-1,"item":12},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":-6.05381190776824},"t-shirt":{"defaultTexture":0,"defaultItem":1,"item":302,"texture":1},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":0.50000000745058},"ear":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":-1},"eye_color":{"defaultTexture":0,"defaultItem":-1,"item":4,"texture":0},"beard":{"highlight":0,"opacity":0.99000000953674,"texture":61,"defaultTexture":1,"defaultItem":-1,"item":8},"arms":{"defaultTexture":0,"defaultItem":0,"item":1,"texture":0},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":2.3766815662384},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":10.0},"ageing":{"highlight":0,"opacity":0.60000002384185,"texture":0,"defaultTexture":0,"defaultItem":-1,"item":0},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":4.52914804220199},"chest":{"highlight":0,"opacity":1.0,"texture":0,"defaultTexture":0,"defaultItem":0,"item":255},"bag":{"defaultTexture":0,"defaultItem":0,"item":214,"texture":0},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":5.69506704807281},"shoes":{"defaultTexture":0,"defaultItem":1,"item":25,"texture":0},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":3.99103134870529},"face":{"defaultTexture":0,"defaultItem":0,"item":14,"texture":14},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0.22421523928642},"torso2":{"defaultTexture":0,"defaultItem":0,"item":604,"texture":2}}', 1),
	(494, 'HEU60167', 'mp_m_freemode_01', '{"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":0.90000003576278},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":-4.00000005960464},"eye_color":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":3},"makeup":{"texture":0,"defaultItem":-1,"opacity":1.0,"highlight":0,"defaultTexture":1,"item":255},"lipstick":{"texture":0,"defaultItem":-1,"opacity":1.0,"highlight":0,"defaultTexture":1,"item":255},"bracelet":{"texture":-1,"defaultItem":-1,"defaultTexture":0,"item":-1},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":-2.19999998807907},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":-3.49999994039535},"face2":{"texture":21,"defaultTexture":0,"defaultItem":0,"item":21},"nose_0":{"defaultItem":0,"defaultTexture":0,"item":0.0},"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":0.22421523928642},"glass":{"texture":0,"defaultItem":-1,"defaultTexture":-1,"item":50},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":-0.49327354878187},"ear":{"texture":-1,"defaultItem":-1,"defaultTexture":0,"item":-1},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":0.0},"bodyb":{"texture":0,"defaultItem":0,"opacity":1.0,"highlight":0,"defaultTexture":0,"item":255},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":2.89999991655349},"torso2":{"texture":13,"defaultItem":0,"defaultTexture":0,"item":437},"facemix":{"shapeMix":0.5640845298767,"skinMix":0.55225354433059},"complexion":{"texture":0,"defaultItem":0,"opacity":0.56999999284744,"highlight":0,"defaultTexture":0,"item":8},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":-0.90000003576278},"accessory":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"sun_damage":{"texture":0,"defaultItem":0,"opacity":0.76999998092651,"highlight":0,"defaultTexture":0,"item":6},"pants":{"texture":3,"defaultItem":0,"defaultTexture":0,"item":155},"hair":{"texture":3,"defaultItem":0,"highlight":1,"style":0,"defaultTexture":0,"item":1},"chest":{"texture":0,"defaultItem":0,"opacity":1.0,"highlight":0,"defaultTexture":0,"item":255},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":0.0},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":0.04484305158257},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":-4.79999989271163},"skinMom":9,"beard":{"texture":3,"defaultItem":-1,"opacity":0.99000000953674,"highlight":0,"defaultTexture":1,"item":13},"moles":{"texture":0,"defaultItem":-1,"opacity":0.40999999642372,"highlight":0,"defaultTexture":0,"item":0},"face":{"texture":2,"defaultTexture":0,"defaultItem":0,"item":2},"eyebrows":{"texture":3,"defaultItem":-1,"opacity":0.76775783300399,"highlight":0,"defaultTexture":1,"item":15},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":4.49999988079071},"ageing":{"texture":0,"defaultItem":-1,"opacity":0.18999999761581,"highlight":0,"defaultTexture":0,"item":0},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":-0.90000003576278},"watch":{"texture":-1,"defaultItem":-1,"defaultTexture":0,"item":-1},"shoes":{"texture":3,"defaultItem":1,"defaultTexture":0,"item":220},"arms":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":22},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":-2.09999993443489},"skinDad":15,"t-shirt":{"texture":2,"defaultItem":1,"defaultTexture":0,"item":348},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":3.60000014305114},"hat":{"texture":-1,"defaultItem":-1,"defaultTexture":0,"item":-1},"bag":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"mask":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":-0.13452914543449},"blush":{"texture":0,"defaultItem":-1,"opacity":1.0,"highlight":0,"defaultTexture":1,"item":255},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":0.70000000298023},"nose_3":{"defaultItem":0,"defaultTexture":0,"item":-2.19999998807907},"vest":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"decals":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"tattoos":[]}', 1);

-- Dumping structure for table worldisyours.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  `display` varchar(50) DEFAULT NULL,
  `note` text NOT NULL,
  `pp` text NOT NULL,
  `isBlocked` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.player_contacts: ~0 rows (approximately)

-- Dumping structure for table worldisyours.player_gallery
CREATE TABLE IF NOT EXISTS `player_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `resim` text NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.player_gallery: ~0 rows (approximately)

-- Dumping structure for table worldisyours.player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `insideId` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` longtext DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `houseID` varchar(50) DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  `decorateStash` text DEFAULT NULL,
  `charge` text DEFAULT NULL,
  `credit` varchar(50) DEFAULT NULL,
  `creditPrice` varchar(50) DEFAULT NULL,
  `timer` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.player_houses: ~0 rows (approximately)

-- Dumping structure for table worldisyours.player_licences
CREATE TABLE IF NOT EXISTS `player_licences` (
  `citizenid` varchar(50) NOT NULL,
  `licences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}' CHECK (json_valid(`licences`)),
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.player_licences: ~0 rows (approximately)

-- Dumping structure for table worldisyours.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT NULL,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.player_mails: ~0 rows (approximately)

-- Dumping structure for table worldisyours.player_notes
CREATE TABLE IF NOT EXISTS `player_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `baslik` text NOT NULL,
  `aciklama` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.player_notes: ~0 rows (approximately)

-- Dumping structure for table worldisyours.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.player_outfits: ~24 rows (approximately)
INSERT INTO `player_outfits` (`id`, `citizenid`, `outfitname`, `model`, `skin`, `outfitId`) VALUES
	(57, 'CWY62276', 'Starting Outfit', 'mp_m_freemode_01', '{"nose_5":{"item":-3.4,"defaultItem":0,"defaultTexture":0},"nose_4":{"item":1.7,"defaultItem":0,"defaultTexture":0},"jaw_bone_width":{"item":-4.0,"defaultItem":0,"defaultTexture":0},"cheek_3":{"item":-4.6,"defaultItem":0,"defaultTexture":0},"decals":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"lips_thickness":{"item":-3.4,"defaultItem":0,"defaultTexture":0},"eyebrows":{"opacity":0.01,"highlight":0,"defaultTexture":1,"texture":0,"defaultItem":-1,"item":7},"hair":{"highlight":1,"defaultTexture":0,"texture":0,"item":118,"defaultItem":0,"style":0},"eyebrown_high":{"item":-4.3,"defaultItem":0,"defaultTexture":0},"nose_2":{"item":2.2,"defaultItem":0,"defaultTexture":0},"chimp_bone_lenght":{"item":0.1,"defaultItem":0,"defaultTexture":0},"ageing":{"opacity":0.41,"highlight":0,"defaultTexture":0,"texture":0,"defaultItem":-1,"item":4},"chimp_bone_width":{"item":-3.7,"defaultItem":0,"defaultTexture":0},"t-shirt":{"item":4,"defaultItem":1,"defaultTexture":0,"texture":6},"mask":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"face2":{"item":21,"defaultItem":0,"defaultTexture":0,"texture":21},"chimp_bone_lowering":{"item":-4.0,"defaultItem":0,"defaultTexture":0},"moles":{"opacity":0.47,"highlight":0,"defaultTexture":0,"texture":0,"defaultItem":-1,"item":11},"shoes":{"item":13,"defaultItem":1,"defaultTexture":0,"texture":3},"arms":{"item":4,"defaultItem":0,"defaultTexture":0,"texture":0},"accessory":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"nose_3":{"item":4.8,"defaultItem":0,"defaultTexture":0},"pants":{"item":26,"defaultItem":0,"defaultTexture":0,"texture":6},"face":{"item":12,"defaultItem":0,"defaultTexture":0,"texture":12},"skinMom":27,"jaw_bone_back_lenght":{"item":3.9,"defaultItem":0,"defaultTexture":0},"complexion":{"opacity":0.67,"highlight":0,"defaultTexture":0,"texture":0,"defaultItem":0,"item":9},"neck_thikness":{"item":-10.0,"defaultItem":0,"defaultTexture":0},"tattoos":[],"chimp_hole":{"item":4.2,"defaultItem":0,"defaultTexture":0},"nose_1":{"item":3.3,"defaultItem":0,"defaultTexture":0},"eye_opening":{"item":4.4,"defaultItem":0,"defaultTexture":0},"torso2":{"item":15,"defaultItem":0,"defaultTexture":0,"texture":0},"facemix":{"skinMix":0.26817213302273,"shapeMix":0.19035032083752},"eye_color":{"item":1,"defaultItem":-1,"defaultTexture":0,"texture":0},"bag":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"vest":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"eyebrown_forward":{"item":0.5,"defaultItem":0,"defaultTexture":0},"sun_damage":{"opacity":0.25,"highlight":0,"defaultTexture":0,"texture":0,"defaultItem":0,"item":1},"cheek_2":{"item":-3.1,"defaultItem":0,"defaultTexture":0},"skinDad":9,"cheek_1":{"item":-0.3,"defaultItem":0,"defaultTexture":0}}', 'outfit-5-6553'),
	(58, 'HEU60167', 'Starting Outfit', 'mp_m_freemode_01', '{"nose_5":{"defaultItem":0,"item":-4.0,"defaultTexture":0},"nose_4":{"defaultItem":0,"item":-4.8,"defaultTexture":0},"jaw_bone_width":{"defaultItem":0,"item":0.04484304932735,"defaultTexture":0},"cheek_3":{"defaultItem":0,"item":-0.89999999999999,"defaultTexture":0},"decals":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"lips_thickness":{"defaultItem":0,"item":0.7,"defaultTexture":0},"arms":{"defaultTexture":0,"defaultItem":0,"item":24,"texture":0},"hair":{"highlight":1,"defaultTexture":0,"texture":3,"style":0,"defaultItem":0,"item":141},"eyebrown_high":{"defaultItem":0,"item":-0.49327354260089,"defaultTexture":0},"complexion":{"opacity":0.57,"highlight":0,"defaultTexture":0,"texture":0,"item":8,"defaultItem":0},"bag":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"ageing":{"opacity":0.19,"highlight":0,"defaultTexture":0,"texture":0,"item":0,"defaultItem":-1},"sun_damage":{"opacity":0.77,"highlight":0,"defaultTexture":0,"texture":0,"item":6,"defaultItem":0},"t-shirt":{"defaultTexture":0,"defaultItem":1,"item":243,"texture":2},"mask":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"face2":{"defaultItem":0,"defaultTexture":0,"item":21,"texture":21},"chimp_hole":{"defaultItem":0,"item":-1.1,"defaultTexture":0},"moles":{"opacity":0.41,"highlight":0,"defaultTexture":0,"texture":0,"item":0,"defaultItem":-1},"chimp_bone_lenght":{"defaultItem":0,"item":3.59999999999999,"defaultTexture":0},"shoes":{"defaultTexture":0,"defaultItem":1,"item":55,"texture":1},"eye_color":{"defaultItem":-1,"defaultTexture":0,"item":3,"texture":0},"accessory":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_3":{"defaultItem":0,"item":-2.2,"defaultTexture":0},"pants":{"defaultTexture":0,"defaultItem":0,"item":285,"texture":0},"face":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"skinMom":0,"eye_opening":{"defaultItem":0,"item":-0.89999999999999,"defaultTexture":0},"nose_2":{"defaultItem":0,"item":4.5,"defaultTexture":0},"skinDad":12,"tattoos":[],"beard":{"opacity":0.99,"highlight":0,"defaultTexture":1,"texture":3,"item":10,"defaultItem":-1},"nose_1":{"defaultItem":0,"item":-2.2,"defaultTexture":0},"chimp_bone_lowering":{"defaultItem":0,"item":-3.5,"defaultTexture":0},"cheek_2":{"defaultItem":0,"item":2.9,"defaultTexture":0},"torso2":{"defaultTexture":0,"defaultItem":0,"item":198,"texture":0},"neck_thikness":{"defaultItem":0,"item":-2.6,"defaultTexture":0},"chimp_bone_width":{"defaultItem":0,"item":0.89999999999999,"defaultTexture":0},"vest":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrown_forward":{"defaultItem":0,"item":0.22421524663677,"defaultTexture":0},"eyebrows":{"opacity":0.76775784753363,"highlight":0,"defaultTexture":1,"texture":3,"item":15,"defaultItem":-1},"jaw_bone_back_lenght":{"defaultItem":0,"item":-0.13452914798206,"defaultTexture":0},"facemix":{"shapeMix":0.52070422535211,"skinMix":0.60352112676056},"cheek_1":{"defaultItem":0,"item":-2.1,"defaultTexture":0}}', 'outfit-10-1140'),
	(59, 'YFB89595', 'Starting Outfit', 'mp_f_freemode_01', '{"t-shirt":{"defaultTexture":0,"item":16,"defaultItem":1,"texture":0},"decals":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_4":{"defaultTexture":0,"item":-2.9,"defaultItem":0},"eyebrows":{"defaultTexture":1,"item":12,"opacity":0.65137979485738,"highlight":0,"defaultItem":-1,"texture":3},"torso2":{"defaultTexture":0,"item":18,"defaultItem":0,"texture":12},"eye_color":{"defaultTexture":0,"item":3,"defaultItem":-1,"texture":0},"nose_3":{"defaultTexture":0,"item":-1.9,"defaultItem":0},"chimp_bone_width":{"defaultTexture":0,"item":-2.1,"defaultItem":0},"skinMom":25,"nose_2":{"defaultTexture":0,"item":3.59999999999999,"defaultItem":0},"ageing":{"defaultTexture":0,"item":-1,"opacity":0.62,"highlight":0,"defaultItem":-1,"texture":0},"makeup":{"defaultTexture":1,"item":0,"opacity":0.52296613741745,"highlight":37,"defaultItem":-1,"texture":37},"bag":{"defaultTexture":0,"item":40,"defaultItem":0,"texture":4},"cheek_3":{"defaultTexture":0,"item":-3.7,"defaultItem":0},"cheek_2":{"defaultTexture":0,"item":-4.69999999999999,"defaultItem":0},"bracelet":{"defaultTexture":0,"item":30,"defaultItem":-1,"texture":0},"eye_opening":{"defaultTexture":0,"item":-2.5,"defaultItem":0},"nose_1":{"defaultTexture":0,"item":4.9,"defaultItem":0},"chimp_hole":{"defaultTexture":0,"item":0.2,"defaultItem":0},"watch":{"defaultTexture":0,"item":24,"defaultItem":-1,"texture":0},"chimp_bone_lenght":{"defaultTexture":0,"item":0.7,"defaultItem":0},"jaw_bone_back_lenght":{"defaultTexture":0,"item":-2.3,"defaultItem":0},"bodyb":{"defaultTexture":0,"item":0,"opacity":0.15,"highlight":0,"defaultItem":0,"texture":0},"eyebrown_forward":{"defaultTexture":0,"item":2.6,"defaultItem":0},"pants":{"defaultTexture":0,"item":24,"defaultItem":0,"texture":0},"moles":{"defaultTexture":0,"item":-1,"opacity":0.46,"highlight":0,"defaultItem":-1,"texture":0},"mask":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"item":2.5,"defaultItem":0},"facemix":{"shapeMix":0.99,"skinMix":0.72765432098765},"glass":{"defaultTexture":-1,"item":-1,"defaultItem":-1,"texture":0},"face2":{"defaultTexture":0,"item":21,"defaultItem":0,"texture":21},"face":{"defaultTexture":0,"item":6,"defaultItem":0,"texture":6},"skinDad":40,"shoes":{"defaultTexture":0,"item":18,"defaultItem":1,"texture":0},"ear":{"defaultTexture":0,"item":33,"defaultItem":-1,"texture":0},"complexion":{"defaultTexture":0,"item":-1,"opacity":0.47386679780806,"highlight":0,"defaultItem":0,"texture":0},"arms":{"defaultTexture":0,"item":4,"defaultItem":0,"texture":0},"cheek_1":{"defaultTexture":0,"item":-2.5,"defaultItem":0},"sun_damage":{"defaultTexture":0,"item":0,"opacity":0.05,"highlight":0,"defaultItem":0,"texture":0},"accessory":{"defaultTexture":0,"item":18,"defaultItem":0,"texture":1},"lips_thickness":{"defaultTexture":0,"item":-5.35478431923563,"defaultItem":0},"neck_thikness":{"defaultTexture":0,"item":-3.2,"defaultItem":0},"hair":{"defaultTexture":0,"item":165,"style":0,"highlight":37,"defaultItem":0,"texture":37},"tattoos":[],"lipstick":{"defaultTexture":1,"item":1,"opacity":0.52674300969509,"highlight":0,"defaultItem":-1,"texture":53},"jaw_bone_width":{"defaultTexture":0,"item":-2.4,"defaultItem":0},"eyebrown_high":{"defaultTexture":0,"item":1.1,"defaultItem":0},"blush":{"defaultTexture":1,"item":1,"opacity":0.19437824926232,"highlight":0,"defaultItem":-1,"texture":34},"vest":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_5":{"defaultTexture":0,"item":4.0,"defaultItem":0}}', 'outfit-10-2101'),
	(61, 'HOU41578', 'Starting Outfit', 'mp_m_freemode_01', '{"accessory":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"watch":{"defaultItem":-1,"texture":-1,"defaultTexture":0,"item":-1},"hat":{"defaultItem":-1,"texture":-1,"defaultTexture":0,"item":-1},"chest":{"highlight":0,"opacity":1.0,"defaultItem":0,"texture":0,"defaultTexture":0,"item":255},"bodyb":{"highlight":0,"opacity":1.0,"defaultItem":0,"texture":0,"defaultTexture":0,"item":255},"blush":{"highlight":0,"opacity":1.0,"defaultItem":-1,"texture":0,"defaultTexture":1,"item":255},"face2":{"defaultItem":0,"texture":21,"defaultTexture":0,"item":21},"bag":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"torso2":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":86},"tattoos":[],"beard":{"highlight":0,"opacity":1.0,"defaultItem":-1,"texture":0,"defaultTexture":1,"item":255},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":-1.89999997615814},"ear":{"defaultItem":-1,"texture":-1,"defaultTexture":0,"item":-1},"eyebrows":{"highlight":0,"opacity":0.23999999463558,"defaultItem":-1,"texture":0,"defaultTexture":1,"item":9},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":0.0},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":-0.7999999821186},"complexion":{"highlight":0,"opacity":0.10999999940395,"defaultItem":0,"texture":0,"defaultTexture":0,"item":9},"facemix":{"skinMix":0.55619718309859,"shapeMix":0.60746478873239},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":0.70000000298023},"nose_0":{"defaultItem":0,"defaultTexture":0,"item":0.0},"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":1.09999999403953},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":4.69999998807907},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":-2.70000010728836},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":5.0},"moles":{"highlight":0,"opacity":0.31000000238418,"defaultItem":-1,"texture":0,"defaultTexture":0,"item":9},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":0.70000000298023},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":0.59999998658895},"eye_color":{"defaultItem":-1,"texture":0,"defaultTexture":0,"item":1},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":0.0},"nose_3":{"defaultItem":0,"defaultTexture":0,"item":1.59999996423721},"pants":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":69},"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":-1.09999999403953},"skinMom":0,"sun_damage":{"highlight":0,"opacity":0.56000000238418,"defaultItem":0,"texture":0,"defaultTexture":0,"item":2},"bracelet":{"defaultItem":-1,"texture":-1,"defaultTexture":0,"item":-1},"makeup":{"highlight":0,"opacity":1.0,"defaultItem":-1,"texture":0,"defaultTexture":1,"item":255},"shoes":{"defaultItem":1,"texture":0,"defaultTexture":0,"item":25},"hair":{"highlight":1,"defaultTexture":0,"defaultItem":0,"texture":1,"style":0,"item":13},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":-1.80000007152557},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":2.80000001192092},"t-shirt":{"defaultItem":1,"texture":0,"defaultTexture":0,"item":15},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":1.59999996423721},"vest":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":5},"lipstick":{"highlight":0,"opacity":1.0,"defaultItem":-1,"texture":0,"defaultTexture":1,"item":255},"face":{"defaultItem":0,"texture":40,"defaultTexture":0,"item":40},"glass":{"defaultItem":-1,"texture":-1,"defaultTexture":-1,"item":-1},"arms":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":4.19999986886978},"ageing":{"highlight":0,"opacity":0.25999999046325,"defaultItem":-1,"texture":0,"defaultTexture":0,"item":5},"mask":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":-2.19999998807907},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":3.30000013113021},"decals":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"skinDad":10}', 'outfit-10-9890'),
	(63, 'RDT43347', 'Starting Outfit', 'mp_f_freemode_01', '{"cheek_3":{"item":0.7,"defaultTexture":0,"defaultItem":0},"eyebrows":{"item":13,"opacity":0.24,"texture":0,"highlight":0,"defaultTexture":1,"defaultItem":-1},"hair":{"item":166,"highlight":1,"texture":1,"style":0,"defaultTexture":0,"defaultItem":0},"facemix":{"skinMix":0.19277295954664,"shapeMix":0.99},"nose_4":{"item":-4.1,"defaultTexture":0,"defaultItem":0},"eyebrown_high":{"item":-3.1,"defaultTexture":0,"defaultItem":0},"chimp_bone_lowering":{"item":1.4,"defaultTexture":0,"defaultItem":0},"shoes":{"texture":0,"item":23,"defaultTexture":0,"defaultItem":1},"tattoos":[],"chimp_hole":{"item":-1.6,"defaultTexture":0,"defaultItem":0},"pants":{"texture":0,"item":29,"defaultTexture":0,"defaultItem":0},"face":{"texture":6,"item":6,"defaultTexture":0,"defaultItem":0},"t-shirt":{"texture":0,"item":16,"defaultTexture":0,"defaultItem":1},"skinMom":26,"ageing":{"item":8,"opacity":0.16,"texture":0,"highlight":0,"defaultTexture":0,"defaultItem":-1},"nose_5":{"item":4.8,"defaultTexture":0,"defaultItem":0},"chimp_bone_lenght":{"item":-2.6,"defaultTexture":0,"defaultItem":0},"arms":{"texture":0,"item":15,"defaultTexture":0,"defaultItem":0},"jaw_bone_back_lenght":{"item":-4.4,"defaultTexture":0,"defaultItem":0},"nose_3":{"item":-3.59999999999999,"defaultTexture":0,"defaultItem":0},"eye_opening":{"item":0.2,"defaultTexture":0,"defaultItem":0},"nose_2":{"item":1.4,"defaultTexture":0,"defaultItem":0},"eyebrown_forward":{"item":2.3,"defaultTexture":0,"defaultItem":0},"torso2":{"texture":0,"item":15,"defaultTexture":0,"defaultItem":0},"nose_1":{"item":-1.0,"defaultTexture":0,"defaultItem":0},"accessory":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"complexion":{"item":7,"opacity":0.08,"texture":0,"highlight":0,"defaultTexture":0,"defaultItem":0},"face2":{"texture":21,"item":21,"defaultTexture":0,"defaultItem":0},"bag":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"mask":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"skinDad":6,"decals":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"sun_damage":{"item":6,"opacity":0.73,"texture":0,"highlight":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_width":{"item":4.8,"defaultTexture":0,"defaultItem":0},"neck_thikness":{"item":-1.2,"defaultTexture":0,"defaultItem":0},"eye_color":{"texture":0,"item":1,"defaultTexture":0,"defaultItem":-1},"moles":{"item":4,"opacity":0.5,"texture":0,"highlight":0,"defaultTexture":0,"defaultItem":-1},"cheek_2":{"item":0.0,"defaultTexture":0,"defaultItem":0},"lips_thickness":{"item":-4.6,"defaultTexture":0,"defaultItem":0},"vest":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"jaw_bone_width":{"item":-4.2,"defaultTexture":0,"defaultItem":0},"cheek_1":{"item":-1.4,"defaultTexture":0,"defaultItem":0}}', 'outfit-2-2191'),
	(68, 'STG67749', 'Starting Outfit', 'mp_m_freemode_01', '{"sun_damage":{"highlight":0,"defaultItem":0,"texture":0,"defaultTexture":0,"item":8,"opacity":0.41},"nose_4":{"defaultTexture":0,"item":-2.6,"defaultItem":0},"decals":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"jaw_bone_back_lenght":{"defaultTexture":0,"item":3.5,"defaultItem":0},"face":{"texture":1,"defaultTexture":0,"item":1,"defaultItem":0},"accessory":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"nose_3":{"defaultTexture":0,"item":4.9,"defaultItem":0},"eyebrown_forward":{"defaultTexture":0,"item":-4.9,"defaultItem":0},"nose_1":{"defaultTexture":0,"item":-4.3,"defaultItem":0},"eye_opening":{"defaultTexture":0,"item":0.4,"defaultItem":0},"eyebrown_high":{"defaultTexture":0,"item":2.0,"defaultItem":0},"chimp_hole":{"defaultTexture":0,"item":-1.3,"defaultItem":0},"complexion":{"highlight":0,"defaultItem":0,"texture":0,"defaultTexture":0,"item":6,"opacity":0.32},"nose_2":{"defaultTexture":0,"item":2.4,"defaultItem":0},"eyebrows":{"highlight":0,"defaultItem":-1,"texture":28,"defaultTexture":1,"item":27,"opacity":0.69},"shoes":{"texture":1,"defaultTexture":0,"item":132,"defaultItem":1},"chimp_bone_width":{"defaultTexture":0,"item":-0.22059856681185,"defaultItem":0},"chimp_bone_lenght":{"defaultTexture":0,"item":1.03835885906983,"defaultItem":0},"chimp_bone_lowering":{"defaultTexture":0,"item":7.69284811015877,"defaultItem":0},"arms":{"texture":0,"defaultTexture":0,"item":1,"defaultItem":0},"beard":{"highlight":0,"defaultItem":-1,"texture":2,"defaultTexture":1,"item":10,"opacity":0.53429675425038},"neck_thikness":{"defaultTexture":0,"item":2.7,"defaultItem":0},"ageing":{"highlight":0,"defaultItem":-1,"texture":0,"defaultTexture":0,"item":5,"opacity":0.0},"jaw_bone_width":{"defaultTexture":0,"item":-0.1,"defaultItem":0},"cheek_3":{"defaultTexture":0,"item":4.8,"defaultItem":0},"mask":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"skinDad":6,"pants":{"texture":0,"defaultTexture":0,"item":164,"defaultItem":0},"hair":{"highlight":28,"defaultItem":0,"style":0,"defaultTexture":0,"item":150,"texture":26},"cheek_1":{"defaultTexture":0,"item":5.0,"defaultItem":0},"eye_color":{"texture":0,"defaultTexture":0,"item":3,"defaultItem":-1},"t-shirt":{"texture":0,"defaultTexture":0,"item":56,"defaultItem":1},"lips_thickness":{"defaultTexture":0,"item":-2.2,"defaultItem":0},"hat":{"texture":0,"defaultTexture":0,"item":96,"defaultItem":-1},"bag":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"tattoos":[],"facemix":{"skinMix":0.33302636286213,"shapeMix":0.66602418570375},"cheek_2":{"defaultTexture":0,"item":1.3,"defaultItem":0},"vest":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"moles":{"highlight":0,"defaultItem":-1,"texture":0,"defaultTexture":0,"item":3,"opacity":0.5},"skinMom":22,"face2":{"texture":21,"defaultTexture":0,"item":21,"defaultItem":0},"torso2":{"texture":3,"defaultTexture":0,"item":181,"defaultItem":0},"nose_5":{"defaultTexture":0,"item":3.5,"defaultItem":0}}', 'outfit-3-7943'),
	(69, 'YDT13754', 'Starting Outfit', 'mp_m_freemode_01', '{"neck_thikness":{"defaultItem":0,"item":-3.8,"defaultTexture":0},"nose_4":{"defaultItem":0,"item":2.9,"defaultTexture":0},"torso2":{"texture":7,"item":404,"defaultItem":0,"defaultTexture":0},"lips_thickness":{"defaultItem":0,"item":-0.2,"defaultTexture":0},"chimp_bone_lowering":{"defaultItem":0,"item":3.59999999999999,"defaultTexture":0},"tattoos":[],"sun_damage":{"opacity":0.68,"defaultTexture":0,"texture":0,"item":1,"defaultItem":0,"highlight":0},"vest":{"texture":3,"item":105,"defaultItem":0,"defaultTexture":0},"moles":{"opacity":0.18,"defaultTexture":0,"texture":0,"item":15,"defaultItem":-1,"highlight":0},"eyebrows":{"opacity":0.16,"defaultTexture":1,"texture":0,"item":33,"defaultItem":-1,"highlight":0},"jaw_bone_back_lenght":{"defaultItem":0,"item":4.2,"defaultTexture":0},"arms":{"texture":0,"item":22,"defaultItem":0,"defaultTexture":0},"facemix":{"shapeMix":0.99,"skinMix":0.19037037037037},"hair":{"style":0,"defaultTexture":0,"texture":0,"item":135,"defaultItem":0,"highlight":1},"jaw_bone_width":{"defaultItem":0,"item":-3.4,"defaultTexture":0},"eye_opening":{"defaultItem":0,"item":-3.4,"defaultTexture":0},"chimp_bone_width":{"defaultItem":0,"item":-1.7,"defaultTexture":0},"pants":{"texture":1,"item":261,"defaultItem":0,"defaultTexture":0},"chimp_hole":{"defaultItem":0,"item":-0.5,"defaultTexture":0},"glass":{"texture":9,"item":65,"defaultItem":-1,"defaultTexture":-1},"nose_1":{"defaultItem":0,"item":3.5,"defaultTexture":0},"cheek_1":{"defaultItem":0,"item":-2.3,"defaultTexture":0},"face2":{"texture":23,"item":23,"defaultItem":0,"defaultTexture":0},"complexion":{"opacity":0.08,"defaultTexture":0,"texture":0,"item":9,"defaultItem":0,"highlight":0},"nose_3":{"defaultItem":0,"item":-0.1,"defaultTexture":0},"eyebrown_high":{"defaultItem":0,"item":-3.7,"defaultTexture":0},"beard":{"opacity":0.99,"defaultTexture":1,"texture":0,"item":2,"defaultItem":-1,"highlight":0},"chimp_bone_lenght":{"defaultItem":0,"item":-1.2,"defaultTexture":0},"cheek_3":{"defaultItem":0,"item":-4.8,"defaultTexture":0},"eye_color":{"texture":0,"item":1,"defaultItem":-1,"defaultTexture":0},"shoes":{"texture":0,"item":175,"defaultItem":1,"defaultTexture":0},"skinDad":10,"nose_2":{"defaultItem":0,"item":2.0,"defaultTexture":0},"mask":{"texture":3,"item":91,"defaultItem":0,"defaultTexture":0},"t-shirt":{"texture":0,"item":89,"defaultItem":1,"defaultTexture":0},"face":{"texture":42,"item":42,"defaultItem":0,"defaultTexture":0},"decals":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"accessory":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"skinMom":32,"hat":{"texture":5,"item":216,"defaultItem":-1,"defaultTexture":0},"bag":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"eyebrown_forward":{"defaultItem":0,"item":-4.1,"defaultTexture":0},"nose_5":{"defaultItem":0,"item":4.6,"defaultTexture":0},"ageing":{"opacity":0.58,"defaultTexture":0,"texture":0,"item":11,"defaultItem":-1,"highlight":0},"cheek_2":{"defaultItem":0,"item":4.9,"defaultTexture":0}}', 'outfit-9-2706'),
	(70, 'VIU66597', 'Starting Outfit', 'mp_m_freemode_01', '{"neck_thikness":{"defaultItem":0,"item":0.0,"defaultTexture":0},"nose_4":{"defaultItem":0,"item":0.0,"defaultTexture":0},"face2":{"defaultItem":0,"item":21,"texture":21,"defaultTexture":0},"lips_thickness":{"defaultItem":0,"item":-1.00000001490116,"defaultTexture":0},"bodyb":{"opacity":1.0,"defaultTexture":0,"defaultItem":0,"item":255,"texture":0,"highlight":0},"lipstick":{"opacity":1.0,"defaultTexture":1,"defaultItem":-1,"item":255,"texture":0,"highlight":0},"sun_damage":{"opacity":0.41999998688697,"defaultTexture":0,"defaultItem":0,"item":5,"texture":0,"highlight":0},"torso2":{"defaultItem":0,"item":193,"texture":0,"defaultTexture":0},"tattoos":[],"chimp_bone_width":{"defaultItem":0,"item":-1.40000000596046,"defaultTexture":0},"moles":{"opacity":0.66000002622604,"defaultTexture":0,"defaultItem":-1,"item":10,"texture":0,"highlight":0},"eyebrows":{"opacity":0.46000000834465,"defaultTexture":1,"defaultItem":-1,"item":20,"texture":0,"highlight":0},"ear":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":0},"jaw_bone_back_lenght":{"defaultItem":0,"item":-1.09999999403953,"defaultTexture":0},"nose_1":{"defaultItem":0,"item":1.50000005960464,"defaultTexture":0},"complexion":{"opacity":0.20999999344348,"defaultTexture":0,"defaultItem":0,"item":5,"texture":0,"highlight":0},"facemix":{"shapeMix":0.59333333333333,"skinMix":0.60123456790123},"chest":{"opacity":1.0,"defaultTexture":0,"defaultItem":0,"item":255,"texture":0,"highlight":0},"bracelet":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":0},"cheek_2":{"defaultItem":0,"item":-1.29999995231628,"defaultTexture":0},"eye_opening":{"defaultItem":0,"item":-0.09999999776482,"defaultTexture":0},"bag":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"hair":{"style":0,"defaultTexture":0,"defaultItem":0,"item":150,"texture":1,"highlight":1},"shoes":{"defaultItem":1,"item":7,"texture":0,"defaultTexture":0},"chimp_bone_lowering":{"defaultItem":0,"item":-4.30000007152557,"defaultTexture":0},"nose_3":{"defaultItem":0,"item":-0.59999998658895,"defaultTexture":0},"eyebrown_high":{"defaultItem":0,"item":3.49999994039535,"defaultTexture":0},"chimp_hole":{"defaultItem":0,"item":0.0,"defaultTexture":0},"mask":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"jaw_bone_width":{"defaultItem":0,"item":4.19999986886978,"defaultTexture":0},"cheek_1":{"defaultItem":0,"item":4.39999997615814,"defaultTexture":0},"accessory":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"t-shirt":{"defaultItem":1,"item":15,"texture":0,"defaultTexture":0},"cheek_3":{"defaultItem":0,"item":-0.90000003576278,"defaultTexture":0},"watch":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":0},"beard":{"opacity":1.0,"defaultTexture":1,"defaultItem":-1,"item":255,"texture":0,"highlight":0},"chimp_bone_lenght":{"defaultItem":0,"item":-4.39999997615814,"defaultTexture":0},"vest":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"eye_color":{"defaultItem":-1,"item":1,"texture":0,"defaultTexture":0},"nose_0":{"defaultItem":0,"item":0.0,"defaultTexture":0},"pants":{"defaultItem":0,"item":28,"texture":0,"defaultTexture":0},"nose_2":{"defaultItem":0,"item":-2.89999991655349,"defaultTexture":0},"arms":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"blush":{"opacity":1.0,"defaultTexture":1,"defaultItem":-1,"item":255,"texture":0,"highlight":0},"face":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"decals":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"skinDad":0,"hat":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":0},"glass":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":-1},"eyebrown_forward":{"defaultItem":0,"item":-2.5,"defaultTexture":0},"skinMom":0,"makeup":{"opacity":1.0,"defaultTexture":1,"defaultItem":-1,"item":255,"texture":0,"highlight":0},"ageing":{"opacity":0.15999999642372,"defaultTexture":0,"defaultItem":-1,"item":0,"texture":0,"highlight":0},"nose_5":{"defaultItem":0,"item":-0.19999999552965,"defaultTexture":0}}', 'outfit-6-3002'),
	(71, 'UMV88168', 'Starting Outfit', 'mp_m_freemode_01', '{"lipstick":{"texture":0,"defaultItem":-1,"highlight":0,"item":0,"defaultTexture":1,"opacity":0.15},"face":{"defaultItem":0,"defaultTexture":0,"texture":14,"item":14},"vest":{"defaultItem":0,"defaultTexture":0,"texture":1,"item":103},"hair":{"texture":61,"style":0,"highlight":62,"item":152,"defaultItem":0,"defaultTexture":0},"facemix":{"skinMix":0.57591549295774,"shapeMix":0.61140845070422},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":8.11659192825112},"glass":{"defaultItem":-1,"defaultTexture":-1,"texture":0,"item":7},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":-10.0},"beard":{"texture":61,"defaultItem":-1,"highlight":0,"item":8,"defaultTexture":1,"opacity":0.99},"moles":{"texture":0,"defaultItem":-1,"highlight":0,"item":15,"defaultTexture":0,"opacity":0.0},"sun_damage":{"texture":0,"defaultItem":0,"highlight":0,"item":7,"defaultTexture":0,"opacity":0.47},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0.31390134529148},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":6.41255605381165},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0.22421524663677},"eye_color":{"defaultItem":-1,"defaultTexture":0,"texture":0,"item":4},"complexion":{"texture":0,"defaultItem":0,"highlight":0,"item":-1,"defaultTexture":0,"opacity":0.13},"bag":{"defaultItem":0,"defaultTexture":0,"texture":0,"item":131},"tattoos":[],"skinMom":6,"nose_1":{"defaultTexture":0,"defaultItem":0,"item":2.37668161434977},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":-0.76233183856502},"mask":{"defaultItem":0,"defaultTexture":0,"texture":5,"item":248},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":4.52914798206278},"ageing":{"texture":0,"defaultItem":-1,"highlight":0,"item":0,"defaultTexture":0,"opacity":0.6},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":-5.33632286995515},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":0.5},"torso2":{"defaultItem":0,"defaultTexture":0,"texture":2,"item":556},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":10.0},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":10.0},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":-8.47533632286995},"ear":{"defaultItem":-1,"defaultTexture":0,"texture":0,"item":-1},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":-2.46636771300448},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":-8.20627802690583},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":3.99103139013452},"pants":{"defaultItem":0,"defaultTexture":0,"texture":3,"item":123},"face2":{"defaultItem":0,"defaultTexture":0,"texture":38,"item":38},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":-6.05381165919282},"t-shirt":{"defaultItem":1,"defaultTexture":0,"texture":1,"item":128},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":5.69506726457399},"shoes":{"defaultItem":1,"defaultTexture":0,"texture":0,"item":119},"arms":{"defaultItem":0,"defaultTexture":0,"texture":0,"item":1},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":10.0},"decals":{"defaultItem":0,"defaultTexture":0,"texture":0,"item":0},"skinDad":1,"accessory":{"defaultItem":0,"defaultTexture":0,"texture":0,"item":0},"eyebrows":{"texture":61,"defaultItem":-1,"highlight":0,"item":12,"defaultTexture":1,"opacity":0.99},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":0.49327354260089}}', 'outfit-10-5041'),
	(72, 'XVQ84862', 'Starting Outfit', 'mp_f_freemode_01', '{"cheek_3":{"item":-3.36799213151608,"defaultItem":0,"defaultTexture":0},"decals":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"ear":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":13},"nose_2":{"item":-0.5,"defaultItem":0,"defaultTexture":0},"nose_0":{"item":-1.47955599269355,"defaultItem":0,"defaultTexture":0},"eye_color":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":5},"nose_3":{"item":-4.0,"defaultItem":0,"defaultTexture":0},"lipstick":{"highlight":0,"opacity":0.62494168891386,"defaultItem":-1,"defaultTexture":1,"item":5,"texture":52},"nose_4":{"item":-0.89999999999999,"defaultItem":0,"defaultTexture":0},"hair":{"style":0,"texture":36,"defaultItem":0,"defaultTexture":0,"highlight":37,"item":53},"t-shirt":{"defaultTexture":0,"texture":0,"defaultItem":1,"item":2},"mask":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"vest":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"accessory":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":123},"eye_opening":{"item":2.2,"defaultItem":0,"defaultTexture":0},"cheek_2":{"item":-0.7,"defaultItem":0,"defaultTexture":0},"sun_damage":{"highlight":0,"opacity":0.0,"defaultItem":0,"defaultTexture":0,"item":7,"texture":0},"makeup":{"highlight":36,"opacity":0.53051988197274,"defaultItem":-1,"defaultTexture":1,"item":4,"texture":36},"eyebrown_forward":{"item":0.31895461570886,"defaultItem":0,"defaultTexture":0},"chimp_bone_width":{"item":0.22902908528874,"defaultItem":0,"defaultTexture":0},"blush":{"highlight":0,"opacity":0.251031333427,"defaultItem":-1,"defaultTexture":1,"item":2,"texture":34},"arms":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":6},"skinDad":6,"pants":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":213},"skinMom":26,"neck_thikness":{"item":-4.3,"defaultItem":0,"defaultTexture":0},"tattoos":[],"watch":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":-1},"moles":{"highlight":0,"opacity":0.23,"defaultItem":-1,"defaultTexture":0,"item":-1,"texture":0},"nose_1":{"item":4.3,"defaultItem":0,"defaultTexture":0},"bag":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"chimp_hole":{"item":0.0,"defaultItem":0,"defaultTexture":0},"shoes":{"defaultTexture":0,"texture":3,"defaultItem":1,"item":211},"eyebrows":{"highlight":0,"opacity":0.56451173247154,"defaultItem":-1,"defaultTexture":1,"item":0,"texture":3},"ageing":{"highlight":0,"opacity":0.38,"defaultItem":-1,"defaultTexture":0,"item":-1,"texture":0},"chimp_bone_lowering":{"item":2.7,"defaultItem":0,"defaultTexture":0},"face2":{"defaultTexture":0,"texture":21,"defaultItem":0,"item":21},"cheek_1":{"item":-1.83925811437403,"defaultItem":0,"defaultTexture":0},"eyebrown_high":{"item":-1.47955599269355,"defaultItem":0,"defaultTexture":0},"chimp_bone_lenght":{"item":-2.7,"defaultItem":0,"defaultTexture":0},"jaw_bone_back_lenght":{"item":-4.2,"defaultItem":0,"defaultTexture":0},"torso2":{"defaultTexture":0,"texture":14,"defaultItem":0,"item":441},"complexion":{"highlight":0,"opacity":0.42854433047632,"defaultItem":0,"defaultTexture":0,"item":5,"texture":0},"nose_5":{"item":4.3,"defaultItem":0,"defaultTexture":0},"facemix":{"skinMix":0.32469135802469,"shapeMix":0.99},"jaw_bone_width":{"item":-0.89999999999999,"defaultItem":0,"defaultTexture":0},"face":{"defaultTexture":0,"texture":6,"defaultItem":0,"item":6},"lips_thickness":{"item":-4.3656034846143,"defaultItem":0,"defaultTexture":0}}', 'outfit-8-1310'),
	(73, 'EBT98762', 'Starting Outfit', 'mp_m_freemode_01', '{"eye_color":{"item":4,"defaultItem":-1,"texture":0,"defaultTexture":0},"eyebrown_high":{"item":-1.56950667500495,"defaultItem":0,"defaultTexture":0},"chimp_hole":{"item":0.19999999552965,"defaultItem":0,"defaultTexture":0},"vest":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"skinDad":0,"nose_2":{"item":-0.7999999821186,"defaultItem":0,"defaultTexture":0},"t-shirt":{"item":71,"defaultItem":1,"texture":0,"defaultTexture":0},"makeup":{"item":255,"defaultItem":-1,"defaultTexture":1,"texture":0,"highlight":0,"opacity":1.0},"bodyb":{"item":255,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"opacity":1.0},"torso2":{"item":564,"defaultItem":0,"texture":0,"defaultTexture":0},"ear":{"item":-1,"defaultItem":-1,"texture":-1,"defaultTexture":0},"tattoos":[],"hair":{"item":91,"defaultItem":0,"defaultTexture":0,"texture":3,"highlight":3,"style":0},"nose_0":{"item":0.0,"defaultItem":0,"defaultTexture":0},"facemix":{"shapeMix":0.03077177517116,"skinMix":0.33140845070422},"watch":{"item":-1,"defaultItem":-1,"texture":-1,"defaultTexture":0},"cheek_2":{"item":2.09999993443489,"defaultItem":0,"defaultTexture":0},"moles":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0,"highlight":0,"opacity":0.28000000119209},"bag":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"arms":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"chimp_bone_lenght":{"item":-0.50000000745058,"defaultItem":0,"defaultTexture":0},"lipstick":{"item":255,"defaultItem":-1,"defaultTexture":1,"texture":0,"highlight":0,"opacity":1.0},"neck_thikness":{"item":5.06726443767547,"defaultItem":0,"defaultTexture":0},"lips_thickness":{"item":10.0,"defaultItem":0,"defaultTexture":0},"jaw_bone_back_lenght":{"item":0.04484305158257,"defaultItem":0,"defaultTexture":0},"chimp_bone_lowering":{"item":-0.7999999821186,"defaultItem":0,"defaultTexture":0},"nose_1":{"item":-4.39999997615814,"defaultItem":0,"defaultTexture":0},"nose_5":{"item":0.09999999776482,"defaultItem":0,"defaultTexture":0},"nose_3":{"item":-4.19999986886978,"defaultItem":0,"defaultTexture":0},"blush":{"item":255,"defaultItem":-1,"defaultTexture":1,"texture":0,"highlight":0,"opacity":1.0},"bracelet":{"item":-1,"defaultItem":-1,"texture":-1,"defaultTexture":0},"chest":{"item":255,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"opacity":1.0},"chimp_bone_width":{"item":0.90000003576278,"defaultItem":0,"defaultTexture":0},"decals":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"beard":{"item":12,"defaultItem":-1,"defaultTexture":1,"texture":3,"highlight":0,"opacity":0.99000000953674},"ageing":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0,"highlight":0,"opacity":0.69999998807907},"face2":{"item":21,"defaultItem":0,"texture":21,"defaultTexture":0},"glass":{"item":-1,"defaultItem":-1,"texture":-1,"defaultTexture":-1},"sun_damage":{"item":-1,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"opacity":0.72000002861022},"jaw_bone_width":{"item":-10.0,"defaultItem":0,"defaultTexture":0},"shoes":{"item":191,"defaultItem":1,"texture":0,"defaultTexture":0},"pants":{"item":252,"defaultItem":0,"texture":0,"defaultTexture":0},"cheek_1":{"item":-4.19999986886978,"defaultItem":0,"defaultTexture":0},"nose_4":{"item":-4.39999997615814,"defaultItem":0,"defaultTexture":0},"eye_opening":{"item":0.50000000745058,"defaultItem":0,"defaultTexture":0},"accessory":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"mask":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"eyebrows":{"item":12,"defaultItem":-1,"defaultTexture":1,"texture":3,"highlight":0,"opacity":0.50408071279525},"complexion":{"item":11,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"opacity":0.0},"eyebrown_forward":{"item":-2.0179371535778,"defaultItem":0,"defaultTexture":0},"cheek_3":{"item":-1.00000001490116,"defaultItem":0,"defaultTexture":0},"hat":{"item":-1,"defaultItem":-1,"texture":-1,"defaultTexture":0},"face":{"item":2,"defaultItem":0,"texture":2,"defaultTexture":0},"skinMom":17}', 'outfit-5-5301'),
	(75, 'LKQ99821', 'Starting Outfit', 'mp_m_freemode_01', '{"eye_color":{"texture":0,"defaultItem":-1,"item":1,"defaultTexture":0},"eyebrown_high":{"item":1.29999995231628,"defaultItem":0,"defaultTexture":0},"hat":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"vest":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"skinDad":1,"tattoos":[],"lipstick":{"item":255,"defaultItem":-1,"defaultTexture":1,"texture":0,"highlight":0,"opacity":1.0},"makeup":{"item":-1,"defaultItem":-1,"defaultTexture":1,"texture":0,"highlight":0,"opacity":1.0},"nose_0":{"item":0.0,"defaultItem":0,"defaultTexture":0},"face":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"mask":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"chimp_hole":{"item":0.0,"defaultItem":0,"defaultTexture":0},"nose_4":{"item":3.70000004768371,"defaultItem":0,"defaultTexture":0},"ear":{"texture":-1,"defaultItem":-1,"item":-1,"defaultTexture":0},"facemix":{"shapeMix":0.16271604938271,"skinMix":0.13384678959846},"watch":{"texture":-1,"defaultItem":-1,"item":-1,"defaultTexture":0},"torso2":{"texture":0,"defaultItem":0,"item":382,"defaultTexture":0},"moles":{"item":17,"defaultItem":-1,"defaultTexture":0,"texture":0,"highlight":0,"opacity":0.27000001072883},"chimp_bone_width":{"item":3.40000003576278,"defaultItem":0,"defaultTexture":0},"arms":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"chimp_bone_lenght":{"item":4.90000009536743,"defaultItem":0,"defaultTexture":0},"t-shirt":{"texture":0,"defaultItem":1,"item":35,"defaultTexture":0},"neck_thikness":{"item":2.59999990463256,"defaultItem":0,"defaultTexture":0},"lips_thickness":{"item":-2.02753969369116,"defaultItem":0,"defaultTexture":0},"hair":{"item":151,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"style":0},"chimp_bone_lowering":{"item":-3.70000004768371,"defaultItem":0,"defaultTexture":0},"nose_1":{"item":1.59999996423721,"defaultItem":0,"defaultTexture":0},"nose_5":{"item":4.00000005960464,"defaultItem":0,"defaultTexture":0},"nose_3":{"item":0.09999999776482,"defaultItem":0,"defaultTexture":0},"eye_opening":{"item":-3.10000002384185,"defaultItem":0,"defaultTexture":0},"bracelet":{"texture":-1,"defaultItem":-1,"item":-1,"defaultTexture":0},"beard":{"item":8,"defaultItem":-1,"defaultTexture":1,"texture":0,"highlight":0,"opacity":1.0},"chest":{"item":16,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"opacity":1.0},"decals":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"bodyb":{"item":-1,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"opacity":1.0},"nose_2":{"item":-0.29999999329447,"defaultItem":0,"defaultTexture":0},"accessory":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"glass":{"texture":0,"defaultItem":-1,"item":7,"defaultTexture":-1},"sun_damage":{"item":3,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"opacity":0.18999999761581},"jaw_bone_width":{"item":2.19999998807907,"defaultItem":0,"defaultTexture":0},"shoes":{"texture":0,"defaultItem":1,"item":18,"defaultTexture":0},"pants":{"texture":0,"defaultItem":0,"item":125,"defaultTexture":0},"cheek_1":{"item":0.13910355486862,"defaultItem":0,"defaultTexture":0},"cheek_2":{"item":-3.89999985694885,"defaultItem":0,"defaultTexture":0},"face2":{"texture":29,"defaultItem":0,"item":29,"defaultTexture":0},"jaw_bone_back_lenght":{"item":-1.29999995231628,"defaultItem":0,"defaultTexture":0},"ageing":{"item":7,"defaultItem":-1,"defaultTexture":0,"texture":0,"highlight":0,"opacity":0.23970071659407},"eyebrows":{"item":30,"defaultItem":-1,"defaultTexture":1,"texture":1,"highlight":0,"opacity":0.41999998688697},"complexion":{"item":3,"defaultItem":0,"defaultTexture":0,"texture":0,"highlight":0,"opacity":0.31999999284744},"bag":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"cheek_3":{"item":-0.3999999910593,"defaultItem":0,"defaultTexture":0},"eyebrown_forward":{"item":-4.30000007152557,"defaultItem":0,"defaultTexture":0},"blush":{"item":255,"defaultItem":-1,"defaultTexture":1,"texture":0,"highlight":0,"opacity":1.0},"skinMom":5}', 'outfit-3-2532'),
	(76, 'YDT13754', 'tac unit', 'mp_m_freemode_01', '{"beard":{"highlight":0,"opacity":0.99000000953674,"defaultItem":-1,"texture":0,"item":2,"defaultTexture":1},"nose_1":{"defaultItem":0,"item":0.0,"defaultTexture":0},"jaw_bone_back_lenght":{"defaultItem":0,"item":0.0,"defaultTexture":0},"nose_0":{"defaultItem":0,"item":0.0,"defaultTexture":0},"ear":{"item":-1,"texture":-1,"defaultItem":-1,"defaultTexture":0},"bodyb":{"highlight":0,"opacity":1.0,"defaultItem":0,"texture":0,"item":255,"defaultTexture":0},"eyebrows":{"highlight":0,"opacity":0.15999999642372,"defaultItem":-1,"texture":0,"item":33,"defaultTexture":1},"facemix":{"skinMix":0.19037036597728,"shapeMix":0.0},"skinMom":32,"nose_4":{"defaultItem":0,"item":0.0,"defaultTexture":0},"chest":{"highlight":0,"opacity":1.0,"defaultItem":0,"texture":0,"item":255,"defaultTexture":0},"chimp_bone_lowering":{"defaultItem":0,"item":0.0,"defaultTexture":0},"tattoos":[],"nose_2":{"defaultItem":0,"item":0.0,"defaultTexture":0},"neck_thikness":{"defaultItem":0,"item":0.0,"defaultTexture":0},"watch":{"item":-1,"texture":-1,"defaultItem":-1,"defaultTexture":0},"cheek_3":{"defaultItem":0,"item":0.0,"defaultTexture":0},"complexion":{"highlight":0,"opacity":0.0,"defaultItem":0,"texture":0,"item":255,"defaultTexture":0},"eye_opening":{"defaultItem":0,"item":0.0,"defaultTexture":0},"moles":{"highlight":0,"opacity":0.18000000715255,"defaultItem":-1,"texture":0,"item":15,"defaultTexture":0},"torso2":{"item":404,"texture":7,"defaultItem":0,"defaultTexture":0},"eyebrown_high":{"defaultItem":0,"item":0.0,"defaultTexture":0},"sun_damage":{"highlight":0,"opacity":0.68000000715255,"defaultItem":0,"texture":0,"item":1,"defaultTexture":0},"eyebrown_forward":{"defaultItem":0,"item":0.0,"defaultTexture":0},"cheek_1":{"defaultItem":0,"item":0.0,"defaultTexture":0},"blush":{"highlight":0,"opacity":1.0,"defaultItem":-1,"texture":0,"item":255,"defaultTexture":1},"ageing":{"highlight":0,"opacity":0.57999998331069,"defaultItem":-1,"texture":0,"item":11,"defaultTexture":0},"glass":{"item":65,"texture":9,"defaultItem":-1,"defaultTexture":-1},"t-shirt":{"item":89,"texture":0,"defaultItem":1,"defaultTexture":0},"bracelet":{"item":-1,"texture":-1,"defaultItem":-1,"defaultTexture":0},"hair":{"highlight":1,"defaultItem":0,"style":0,"texture":0,"item":135,"defaultTexture":0},"mask":{"item":91,"texture":3,"defaultItem":0,"defaultTexture":0},"decals":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"pants":{"item":261,"texture":1,"defaultItem":0,"defaultTexture":0},"chimp_bone_width":{"defaultItem":0,"item":0.0,"defaultTexture":0},"eye_color":{"item":1,"defaultItem":-1,"texture":0,"defaultTexture":0},"face2":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"lipstick":{"highlight":0,"opacity":1.0,"defaultItem":-1,"texture":0,"item":255,"defaultTexture":1},"jaw_bone_width":{"defaultItem":0,"item":0.0,"defaultTexture":0},"arms":{"item":22,"texture":0,"defaultItem":0,"defaultTexture":0},"lips_thickness":{"defaultItem":0,"item":0.0,"defaultTexture":0},"bag":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"accessory":{"item":147,"texture":0,"defaultItem":0,"defaultTexture":0},"vest":{"item":105,"texture":3,"defaultItem":0,"defaultTexture":0},"nose_5":{"defaultItem":0,"item":0.0,"defaultTexture":0},"chimp_bone_lenght":{"defaultItem":0,"item":0.0,"defaultTexture":0},"nose_3":{"defaultItem":0,"item":0.0,"defaultTexture":0},"makeup":{"highlight":0,"opacity":1.0,"defaultItem":-1,"texture":0,"item":255,"defaultTexture":1},"hat":{"item":216,"texture":8,"defaultItem":-1,"defaultTexture":0},"face":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"chimp_hole":{"defaultItem":0,"item":0.0,"defaultTexture":0},"shoes":{"item":175,"texture":0,"defaultItem":1,"defaultTexture":0},"cheek_2":{"defaultItem":0,"item":0.0,"defaultTexture":0},"skinDad":10}', 'outfit-8-2897'),
	(78, 'HEU60167', 'All Black', 'mp_m_freemode_01', '{"eye_opening":{"item":-0.90000003576278,"defaultTexture":0,"defaultItem":0},"face2":{"texture":21,"item":21,"defaultTexture":0,"defaultItem":0},"lipstick":{"texture":0,"defaultItem":-1,"item":255,"highlight":0,"defaultTexture":1,"opacity":1.0},"face":{"texture":2,"item":2,"defaultTexture":0,"defaultItem":0},"skinMom":9,"accessory":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"glass":{"texture":0,"item":12,"defaultTexture":-1,"defaultItem":-1},"shoes":{"texture":1,"item":55,"defaultTexture":0,"defaultItem":1},"chimp_bone_width":{"item":0.90000003576278,"defaultTexture":0,"defaultItem":0},"chimp_bone_lenght":{"item":3.60000014305114,"defaultTexture":0,"defaultItem":0},"hat":{"texture":-1,"item":-1,"defaultTexture":0,"defaultItem":-1},"bodyb":{"texture":0,"defaultItem":0,"item":255,"highlight":0,"defaultTexture":0,"opacity":1.0},"t-shirt":{"texture":2,"item":246,"defaultTexture":0,"defaultItem":1},"bracelet":{"texture":-1,"item":-1,"defaultTexture":0,"defaultItem":-1},"chimp_hole":{"item":0.0,"defaultTexture":0,"defaultItem":0},"torso2":{"texture":1,"item":147,"defaultTexture":0,"defaultItem":0},"chimp_bone_lowering":{"item":-3.49999994039535,"defaultTexture":0,"defaultItem":0},"lips_thickness":{"item":0.70000000298023,"defaultTexture":0,"defaultItem":0},"eyebrows":{"texture":3,"defaultItem":-1,"item":15,"highlight":0,"defaultTexture":1,"opacity":0.76775783300399},"ageing":{"texture":0,"defaultItem":-1,"item":0,"highlight":0,"defaultTexture":0,"opacity":0.18999999761581},"cheek_1":{"item":-2.09999993443489,"defaultTexture":0,"defaultItem":0},"skinDad":15,"nose_0":{"item":0.0,"defaultTexture":0,"defaultItem":0},"chest":{"texture":0,"defaultItem":0,"item":255,"highlight":0,"defaultTexture":0,"opacity":1.0},"blush":{"texture":0,"defaultItem":-1,"item":255,"highlight":0,"defaultTexture":1,"opacity":1.0},"nose_2":{"item":4.49999988079071,"defaultTexture":0,"defaultItem":0},"cheek_2":{"item":2.89999991655349,"defaultTexture":0,"defaultItem":0},"moles":{"texture":0,"defaultItem":-1,"item":0,"highlight":0,"defaultTexture":0,"opacity":0.40999999642372},"jaw_bone_back_lenght":{"item":-0.13452914543449,"defaultTexture":0,"defaultItem":0},"complexion":{"texture":0,"defaultItem":0,"item":8,"highlight":0,"defaultTexture":0,"opacity":0.56999999284744},"cheek_3":{"item":-0.90000003576278,"defaultTexture":0,"defaultItem":0},"pants":{"texture":1,"item":262,"defaultTexture":0,"defaultItem":0},"nose_3":{"item":-2.19999998807907,"defaultTexture":0,"defaultItem":0},"facemix":{"shapeMix":0.5640845298767,"skinMix":0.55225354433059},"sun_damage":{"texture":0,"defaultItem":0,"item":6,"highlight":0,"defaultTexture":0,"opacity":0.76999998092651},"arms":{"texture":0,"item":22,"defaultTexture":0,"defaultItem":0},"jaw_bone_width":{"item":0.04484305158257,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":-4.79999989271163,"defaultTexture":0,"defaultItem":0},"eyebrown_high":{"item":-0.49327354878187,"defaultTexture":0,"defaultItem":0},"eyebrown_forward":{"item":0.22421523928642,"defaultTexture":0,"defaultItem":0},"beard":{"texture":3,"defaultItem":-1,"item":10,"highlight":0,"defaultTexture":1,"opacity":0.99000000953674},"hair":{"texture":3,"defaultItem":0,"style":0,"highlight":1,"defaultTexture":0,"item":141},"neck_thikness":{"item":0.0,"defaultTexture":0,"defaultItem":0},"makeup":{"texture":0,"defaultItem":-1,"item":255,"highlight":0,"defaultTexture":1,"opacity":1.0},"mask":{"texture":0,"item":40,"defaultTexture":0,"defaultItem":0},"tattoos":[],"eye_color":{"texture":0,"item":3,"defaultTexture":0,"defaultItem":-1},"ear":{"texture":-1,"item":-1,"defaultTexture":0,"defaultItem":-1},"nose_5":{"item":-4.00000005960464,"defaultTexture":0,"defaultItem":0},"watch":{"texture":-1,"item":-1,"defaultTexture":0,"defaultItem":-1},"vest":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"bag":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"nose_1":{"item":-2.19999998807907,"defaultTexture":0,"defaultItem":0},"decals":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0}}', 'outfit-2-3199'),
	(79, 'ETF72063', 'Starting Outfit', 'mp_m_freemode_01', '{"cheek_3":{"item":0.76858226780947,"defaultTexture":0,"defaultItem":0},"mask":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"chimp_bone_width":{"item":4.63538007587466,"defaultTexture":0,"defaultItem":0},"eyebrows":{"item":6,"highlight":0,"defaultTexture":1,"defaultItem":-1,"texture":1,"opacity":0.64760292257973},"watch":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"neck_thikness":{"item":5.71448644091611,"defaultTexture":0,"defaultItem":0},"eye_opening":{"item":5.43627933117886,"defaultTexture":0,"defaultItem":0},"nose_0":{"item":5.17493325839539,"defaultTexture":0,"defaultItem":0},"skinMom":31,"glass":{"item":20,"defaultTexture":-1,"texture":0,"defaultItem":-1},"torso2":{"item":6,"defaultTexture":0,"texture":0,"defaultItem":0},"face2":{"item":25,"defaultTexture":0,"texture":25,"defaultItem":0},"vest":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"bag":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"hair":{"item":125,"highlight":29,"style":0,"defaultItem":0,"texture":29,"defaultTexture":0},"t-shirt":{"item":15,"defaultTexture":0,"texture":0,"defaultItem":1},"facemix":{"skinMix":0.15,"shapeMix":0.55382716049382},"eye_color":{"item":2,"defaultTexture":0,"texture":0,"defaultItem":-1},"moles":{"item":1,"highlight":0,"defaultTexture":0,"defaultItem":-1,"texture":0,"opacity":0.24},"eyebrown_forward":{"item":2.5,"defaultTexture":0,"defaultItem":0},"eyebrown_high":{"item":3.1,"defaultTexture":0,"defaultItem":0},"sun_damage":{"item":10,"highlight":0,"defaultTexture":0,"defaultItem":0,"texture":0,"opacity":0.32},"lips_thickness":{"item":0.2,"defaultTexture":0,"defaultItem":0},"nose_2":{"item":-2.4,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":3.5,"defaultTexture":0,"defaultItem":0},"chimp_hole":{"item":4.54545454545454,"defaultTexture":0,"defaultItem":0},"complexion":{"item":11,"highlight":0,"defaultTexture":0,"defaultItem":0,"texture":0,"opacity":0.02},"nose_3":{"item":-2.5,"defaultTexture":0,"defaultItem":0},"skinDad":21,"cheek_2":{"item":6.25403962343684,"defaultTexture":0,"defaultItem":0},"face":{"item":12,"defaultTexture":0,"texture":12,"defaultItem":0},"ageing":{"item":7,"highlight":0,"defaultTexture":0,"defaultItem":-1,"texture":0,"opacity":0.42},"arms":{"item":1,"defaultTexture":0,"texture":0,"defaultItem":0},"accessory":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"jaw_bone_width":{"item":-0.22059856681185,"defaultTexture":0,"defaultItem":0},"shoes":{"item":16,"defaultTexture":0,"texture":6,"defaultItem":1},"cheek_1":{"item":-1.29970493185331,"defaultTexture":0,"defaultItem":0},"tattoos":[],"chimp_bone_lenght":{"item":0.58873120696922,"defaultTexture":0,"defaultItem":0},"chimp_bone_lowering":{"item":4.09582689335394,"defaultTexture":0,"defaultItem":0},"jaw_bone_back_lenght":{"item":2.92679499789237,"defaultTexture":0,"defaultItem":0},"nose_1":{"item":-0.5,"defaultTexture":0,"defaultItem":0},"decals":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"nose_5":{"item":-3.0,"defaultTexture":0,"defaultItem":0},"pants":{"item":144,"defaultTexture":0,"texture":0,"defaultItem":0},"bracelet":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"beard":{"item":8,"highlight":0,"defaultTexture":1,"defaultItem":-1,"texture":26,"opacity":0.99}}', 'outfit-5-8683'),
	(80, 'AEZ52818', 'Starting Outfit', 'mp_m_freemode_01', '{"nose_5":{"defaultItem":0,"item":0.0,"defaultTexture":0},"vest":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"nose_4":{"defaultItem":0,"item":1.79999999999999,"defaultTexture":0},"shoes":{"texture":7,"defaultItem":1,"item":146,"defaultTexture":0},"lips_thickness":{"defaultItem":0,"item":10.0,"defaultTexture":0},"chimp_bone_width":{"defaultItem":0,"item":3.59999999999999,"defaultTexture":0},"neck_thikness":{"defaultItem":0,"item":-2.0,"defaultTexture":0},"torso2":{"texture":0,"defaultItem":0,"item":659,"defaultTexture":0},"t-shirt":{"texture":0,"defaultItem":1,"item":15,"defaultTexture":0},"eyebrows":{"highlight":0,"item":2,"opacity":0.94219896023605,"defaultTexture":1,"texture":0,"defaultItem":-1},"nose_3":{"defaultItem":0,"item":3.3,"defaultTexture":0},"sun_damage":{"highlight":0,"item":1,"opacity":0.1,"defaultTexture":0,"texture":0,"defaultItem":0},"eye_color":{"texture":0,"item":19,"defaultItem":-1,"defaultTexture":0},"complexion":{"highlight":0,"item":-1,"opacity":0.99,"defaultTexture":0,"texture":0,"defaultItem":0},"facemix":{"skinMix":0.22075716849499,"shapeMix":0.22987654320987},"face2":{"texture":21,"item":21,"defaultItem":0,"defaultTexture":0},"skinMom":3,"cheek_1":{"defaultItem":0,"item":-1.3,"defaultTexture":0},"chimp_bone_lowering":{"defaultItem":0,"item":1.0,"defaultTexture":0},"nose_1":{"defaultItem":0,"item":3.2,"defaultTexture":0},"chimp_hole":{"defaultItem":0,"item":-2.5,"defaultTexture":0},"decals":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"lipstick":{"highlight":0,"item":0,"opacity":0.15,"defaultTexture":1,"texture":0,"defaultItem":-1},"tattoos":[],"eye_opening":{"defaultItem":0,"item":1.11985387101306,"defaultTexture":0},"ageing":{"highlight":0,"item":-1,"opacity":0.25,"defaultTexture":0,"texture":0,"defaultItem":-1},"hair":{"highlight":0,"item":84,"texture":19,"style":0,"defaultTexture":0,"defaultItem":0},"cheek_3":{"defaultItem":0,"item":-3.59999999999999,"defaultTexture":0},"arms":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"eyebrown_forward":{"defaultItem":0,"item":-1.7,"defaultTexture":0},"jaw_bone_width":{"defaultItem":0,"item":-4.6,"defaultTexture":0},"pants":{"texture":3,"defaultItem":0,"item":220,"defaultTexture":0},"moles":{"highlight":0,"item":14,"opacity":0.42,"defaultTexture":0,"texture":0,"defaultItem":-1},"jaw_bone_back_lenght":{"defaultItem":0,"item":-4.2,"defaultTexture":0},"beard":{"highlight":0,"item":1,"opacity":0.99,"defaultTexture":1,"texture":0,"defaultItem":-1},"skinDad":8,"chimp_bone_lenght":{"defaultItem":0,"item":0.3,"defaultTexture":0},"nose_2":{"defaultItem":0,"item":-0.2,"defaultTexture":0},"mask":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"cheek_2":{"defaultItem":0,"item":-2.5,"defaultTexture":0},"accessory":{"texture":0,"defaultItem":0,"item":159,"defaultTexture":0},"bag":{"texture":0,"defaultItem":0,"item":141,"defaultTexture":0},"eyebrown_high":{"defaultItem":0,"item":3.37642264999297,"defaultTexture":0},"glass":{"texture":7,"defaultItem":-1,"item":13,"defaultTexture":-1},"face":{"texture":8,"item":8,"defaultItem":0,"defaultTexture":0}}', 'outfit-7-9413'),
	(81, 'STG67749', 'JD starter', 'mp_m_freemode_01', '{"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":2.70000010728836},"arms":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":1},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":-0.22059855982661},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":-1.38963043689727},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":1.75776302814483},"sun_damage":{"texture":0,"defaultItem":0,"item":8,"defaultTexture":0,"opacity":0.40999999642372,"highlight":0},"face":{"texture":1,"defaultTexture":0,"defaultItem":0,"item":1},"vest":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":7.15329468250274},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":-3.19657146930694},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":-2.19999998807907},"mask":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"complexion":{"texture":0,"defaultItem":0,"item":6,"defaultTexture":0,"opacity":0.31999999284744,"highlight":0},"skinDad":9,"glass":{"texture":-1,"defaultTexture":-1,"defaultItem":-1,"item":-1},"watch":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"blush":{"texture":0,"defaultItem":-1,"item":255,"defaultTexture":1,"opacity":1.0,"highlight":0},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":-0.09999999776482},"face2":{"texture":21,"defaultTexture":0,"defaultItem":0,"item":21},"bracelet":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0.0},"torso2":{"texture":3,"defaultTexture":0,"defaultItem":0,"item":485},"hair":{"texture":26,"defaultItem":0,"item":12,"defaultTexture":0,"style":0,"highlight":28},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":3.49999994039535},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":3.49999994039535},"tattoos":[],"hat":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":220},"facemix":{"skinMix":0.33302634954452,"shapeMix":0.66602420806884},"eye_color":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":5},"ageing":{"texture":0,"defaultItem":-1,"item":255,"defaultTexture":0,"opacity":0.0,"highlight":0},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":1.03835888206958},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":6.88351809978485},"pants":{"texture":5,"defaultTexture":0,"defaultItem":0,"item":218},"eyebrows":{"texture":26,"defaultItem":-1,"item":21,"defaultTexture":1,"opacity":0.99000000953674,"highlight":0},"bag":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"skinMom":17,"decals":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"accessory":{"texture":8,"defaultTexture":0,"defaultItem":0,"item":0},"moles":{"texture":0,"defaultItem":-1,"item":3,"defaultTexture":0,"opacity":0.5,"highlight":0},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":2.39999994635581},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":-0.67022621631622},"ear":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"beard":{"texture":2,"defaultItem":-1,"item":10,"defaultTexture":1,"opacity":0.54185050725936,"highlight":0},"shoes":{"texture":2,"defaultTexture":0,"defaultItem":1,"item":135},"bodyb":{"texture":0,"defaultItem":0,"item":255,"defaultTexture":0,"opacity":1.0,"highlight":0},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":4.90000009536743},"makeup":{"texture":0,"defaultItem":-1,"item":255,"defaultTexture":1,"opacity":1.0,"highlight":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":7.69284784793853},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":0.0},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":-4.30000007152557},"lipstick":{"texture":0,"defaultItem":-1,"item":255,"defaultTexture":1,"opacity":1.0,"highlight":0},"chest":{"texture":0,"defaultItem":0,"item":255,"defaultTexture":0,"opacity":1.0,"highlight":0},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":-2.59999990463256},"t-shirt":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":46}}', 'outfit-6-5144'),
	(82, 'RZY43875', 'SS no coat', 'mp_m_freemode_01', '{"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":0.0},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":3.19999992847442},"bodyb":{"opacity":1.0,"defaultTexture":0,"texture":0,"defaultItem":0,"highlight":0,"item":255},"hat":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0},"torso2":{"item":348,"defaultItem":0,"defaultTexture":0,"texture":10},"makeup":{"opacity":1.0,"defaultTexture":1,"texture":0,"defaultItem":-1,"highlight":0,"item":255},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":0.67865677177906},"complexion":{"opacity":0.6700000166893,"defaultTexture":0,"texture":0,"defaultItem":0,"highlight":0,"item":6},"arms":{"item":4,"defaultItem":0,"defaultTexture":0,"texture":0},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":8.14247548580169},"tattoos":[],"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":2.0191091299057},"bracelet":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":-1},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":5.98426282405853},"t-shirt":{"item":347,"defaultItem":1,"defaultTexture":0,"texture":0},"beard":{"opacity":0.57584232091903,"defaultTexture":1,"texture":2,"defaultItem":-1,"highlight":0,"item":16},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":3.6461991071701},"decals":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":1.6678375005722},"chest":{"opacity":1.0,"defaultTexture":0,"texture":0,"defaultItem":0,"highlight":0,"item":255},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":0.04074750468134},"blush":{"opacity":1.0,"defaultTexture":1,"texture":0,"defaultItem":-1,"highlight":0,"item":255},"accessory":{"item":1,"defaultItem":0,"defaultTexture":0,"texture":0},"nose_0":{"defaultItem":0,"defaultTexture":0,"item":1.48798644542694},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":1.75776302814483},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":-7.32471525669097},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":-4.00000005960464},"facemix":{"skinMix":0.35629630088806,"shapeMix":0.27333334088325},"hair":{"defaultTexture":0,"texture":2,"highlight":29,"style":0,"defaultItem":0,"item":37},"ear":{"item":0,"defaultItem":-1,"defaultTexture":0,"texture":0},"skinDad":19,"nose_3":{"defaultItem":0,"defaultTexture":0,"item":-2.37881124019622},"glass":{"item":50,"defaultItem":-1,"defaultTexture":-1,"texture":0},"face":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"bag":{"item":247,"defaultItem":0,"defaultTexture":0,"texture":0},"pants":{"item":35,"defaultItem":0,"defaultTexture":0,"texture":0},"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":-3.90754520893096},"shoes":{"item":21,"defaultItem":1,"defaultTexture":0,"texture":0},"watch":{"item":2,"defaultItem":-1,"defaultTexture":0,"texture":0},"face2":{"item":34,"defaultItem":0,"defaultTexture":0,"texture":34},"ageing":{"opacity":0.43987494707107,"defaultTexture":0,"texture":0,"defaultItem":-1,"highlight":0,"item":2},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":-3.01672041416168},"skinMom":0,"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":0.50000000745058},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":-2.92679488658905},"mask":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":-2.73851335048675},"eye_color":{"item":3,"defaultItem":-1,"defaultTexture":0,"texture":0},"moles":{"opacity":0.14000000059604,"defaultTexture":0,"texture":0,"defaultItem":-1,"highlight":0,"item":14},"lipstick":{"opacity":1.0,"defaultTexture":1,"texture":0,"defaultItem":-1,"highlight":0,"item":255},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":-0.70000000298023},"sun_damage":{"opacity":0.23000000417232,"defaultTexture":0,"texture":0,"defaultItem":0,"highlight":0,"item":9},"eyebrows":{"opacity":0.77979344129562,"defaultTexture":1,"texture":2,"defaultItem":-1,"highlight":0,"item":10},"vest":{"item":188,"defaultItem":0,"defaultTexture":0,"texture":2}}', 'outfit-5-8764'),
	(83, 'RZY43875', 'ss suit', 'mp_m_freemode_01', '{"ear":{"texture":0,"defaultItem":-1,"defaultTexture":0,"item":-1},"moles":{"defaultItem":-1,"defaultTexture":0,"opacity":0.14000000059604,"texture":0,"highlight":0,"item":14},"facemix":{"skinMix":0.35629630088806,"shapeMix":0.27333334088325},"eyebrows":{"defaultItem":-1,"defaultTexture":1,"opacity":0.77979344129562,"texture":2,"highlight":0,"item":10},"tattoos":[],"lipstick":{"defaultItem":-1,"defaultTexture":1,"opacity":1.0,"texture":0,"highlight":0,"item":255},"ageing":{"defaultItem":-1,"defaultTexture":0,"opacity":0.43987494707107,"texture":0,"highlight":0,"item":2},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":0.04074750468134},"makeup":{"defaultItem":-1,"defaultTexture":1,"opacity":1.0,"texture":0,"highlight":0,"item":255},"nose_0":{"defaultItem":0,"defaultTexture":0,"item":1.48798644542694},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":-3.01672041416168},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":-7.32471525669097},"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":-3.90754520893096},"hat":{"texture":0,"defaultItem":-1,"defaultTexture":0,"item":11},"face":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"skinMom":0,"nose_3":{"defaultItem":0,"defaultTexture":0,"item":-2.37881124019622},"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":0.50000000745058},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":-4.00000005960464},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":-2.73851335048675},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":5.98426282405853},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":0.67865677177906},"blush":{"defaultItem":-1,"defaultTexture":1,"opacity":1.0,"texture":0,"highlight":0,"item":255},"sun_damage":{"defaultItem":0,"defaultTexture":0,"opacity":0.23000000417232,"texture":0,"highlight":0,"item":9},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":-2.92679488658905},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":1.75776302814483},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":0.0},"hair":{"defaultItem":0,"defaultTexture":0,"texture":2,"highlight":29,"item":37,"style":0},"pants":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":10},"chest":{"defaultItem":0,"defaultTexture":0,"opacity":1.0,"texture":0,"highlight":0,"item":255},"face2":{"texture":34,"defaultItem":0,"defaultTexture":0,"item":34},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":2.0191091299057},"accessory":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":164},"arms":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":4},"mask":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":121},"glass":{"texture":6,"defaultItem":-1,"defaultTexture":-1,"item":5},"bracelet":{"texture":-1,"defaultItem":-1,"defaultTexture":0,"item":-1},"decals":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"shoes":{"texture":0,"defaultItem":1,"defaultTexture":0,"item":245},"watch":{"texture":0,"defaultItem":-1,"defaultTexture":0,"item":2},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":3.19999992847442},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":8.14247548580169},"torso2":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":4},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":-0.70000000298023},"beard":{"defaultItem":-1,"defaultTexture":1,"opacity":0.57584232091903,"texture":2,"highlight":0,"item":16},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":3.6461991071701},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":1.6678375005722},"vest":{"texture":3,"defaultItem":0,"defaultTexture":0,"item":72},"t-shirt":{"texture":0,"defaultItem":1,"defaultTexture":0,"item":31},"skinDad":19,"complexion":{"defaultItem":0,"defaultTexture":0,"opacity":0.6700000166893,"texture":0,"highlight":0,"item":6},"bag":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":134},"bodyb":{"defaultItem":0,"defaultTexture":0,"opacity":1.0,"texture":0,"highlight":0,"item":255},"eye_color":{"texture":0,"defaultItem":-1,"defaultTexture":0,"item":3}}', 'outfit-6-7968'),
	(84, 'RZY43875', 'scuba', 'mp_m_freemode_01', '{"ear":{"texture":-1,"defaultItem":-1,"defaultTexture":0,"item":-1},"moles":{"defaultItem":-1,"defaultTexture":0,"opacity":0.14000000059604,"texture":0,"highlight":0,"item":14},"facemix":{"skinMix":0.35629630088806,"shapeMix":0.27333334088325},"eyebrows":{"defaultItem":-1,"defaultTexture":1,"opacity":0.77979344129562,"texture":2,"highlight":0,"item":10},"tattoos":[],"lipstick":{"defaultItem":-1,"defaultTexture":1,"opacity":1.0,"texture":0,"highlight":0,"item":255},"ageing":{"defaultItem":-1,"defaultTexture":0,"opacity":0.43987494707107,"texture":0,"highlight":0,"item":2},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":0.04074750468134},"makeup":{"defaultItem":-1,"defaultTexture":1,"opacity":1.0,"texture":0,"highlight":0,"item":255},"nose_0":{"defaultItem":0,"defaultTexture":0,"item":1.48798644542694},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":-3.01672041416168},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":-7.32471525669097},"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":-3.90754520893096},"hat":{"texture":0,"defaultItem":-1,"defaultTexture":0,"item":11},"face":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"skinMom":0,"nose_3":{"defaultItem":0,"defaultTexture":0,"item":-2.37881124019622},"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":0.50000000745058},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":-4.00000005960464},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":-2.73851335048675},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":5.98426282405853},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":0.67865677177906},"blush":{"defaultItem":-1,"defaultTexture":1,"opacity":1.0,"texture":0,"highlight":0,"item":255},"sun_damage":{"defaultItem":0,"defaultTexture":0,"opacity":0.23000000417232,"texture":0,"highlight":0,"item":9},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":-2.92679488658905},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":1.75776302814483},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":0.0},"hair":{"defaultItem":0,"defaultTexture":0,"texture":2,"highlight":29,"item":37,"style":0},"pants":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":94},"chest":{"defaultItem":0,"defaultTexture":0,"opacity":1.0,"texture":0,"highlight":0,"item":255},"face2":{"texture":34,"defaultItem":0,"defaultTexture":0,"item":34},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":2.0191091299057},"accessory":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"arms":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":4},"mask":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":121},"glass":{"texture":6,"defaultItem":-1,"defaultTexture":-1,"item":5},"bracelet":{"texture":-1,"defaultItem":-1,"defaultTexture":0,"item":-1},"decals":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"shoes":{"texture":0,"defaultItem":1,"defaultTexture":0,"item":67},"watch":{"texture":0,"defaultItem":-1,"defaultTexture":0,"item":2},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":3.19999992847442},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":8.14247548580169},"torso2":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":243},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":-0.70000000298023},"beard":{"defaultItem":-1,"defaultTexture":1,"opacity":0.57584232091903,"texture":2,"highlight":0,"item":16},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":3.6461991071701},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":1.6678375005722},"vest":{"texture":3,"defaultItem":0,"defaultTexture":0,"item":72},"t-shirt":{"texture":0,"defaultItem":1,"defaultTexture":0,"item":15},"skinDad":19,"complexion":{"defaultItem":0,"defaultTexture":0,"opacity":0.6700000166893,"texture":0,"highlight":0,"item":6},"bag":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"bodyb":{"defaultItem":0,"defaultTexture":0,"opacity":1.0,"texture":0,"highlight":0,"item":255},"eye_color":{"texture":0,"defaultItem":-1,"defaultTexture":0,"item":3}}', 'outfit-10-4970'),
	(85, 'RZY43875', 'scuba diver 1', 'mp_m_freemode_01', '{"ear":{"texture":-1,"defaultItem":-1,"defaultTexture":0,"item":-1},"moles":{"defaultItem":-1,"defaultTexture":0,"opacity":0.14000000059604,"texture":0,"highlight":0,"item":14},"facemix":{"skinMix":0.35629630088806,"shapeMix":0.27333334088325},"eyebrows":{"defaultItem":-1,"defaultTexture":1,"opacity":0.77979344129562,"texture":2,"highlight":0,"item":10},"tattoos":[],"lipstick":{"defaultItem":-1,"defaultTexture":1,"opacity":1.0,"texture":0,"highlight":0,"item":255},"ageing":{"defaultItem":-1,"defaultTexture":0,"opacity":0.43987494707107,"texture":0,"highlight":0,"item":2},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":0.04074750468134},"makeup":{"defaultItem":-1,"defaultTexture":1,"opacity":1.0,"texture":0,"highlight":0,"item":255},"nose_0":{"defaultItem":0,"defaultTexture":0,"item":1.48798644542694},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":-3.01672041416168},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":-7.32471525669097},"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":-3.90754520893096},"hat":{"texture":0,"defaultItem":-1,"defaultTexture":0,"item":11},"face":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"skinMom":0,"nose_3":{"defaultItem":0,"defaultTexture":0,"item":-2.37881124019622},"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":0.50000000745058},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":-4.00000005960464},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":-2.73851335048675},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":5.98426282405853},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":0.67865677177906},"blush":{"defaultItem":-1,"defaultTexture":1,"opacity":1.0,"texture":0,"highlight":0,"item":255},"sun_damage":{"defaultItem":0,"defaultTexture":0,"opacity":0.23000000417232,"texture":0,"highlight":0,"item":9},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":-2.92679488658905},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":1.75776302814483},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":0.0},"hair":{"defaultItem":0,"defaultTexture":0,"texture":2,"highlight":29,"item":37,"style":0},"pants":{"texture":17,"defaultItem":0,"defaultTexture":0,"item":94},"chest":{"defaultItem":0,"defaultTexture":0,"opacity":1.0,"texture":0,"highlight":0,"item":255},"face2":{"texture":34,"defaultItem":0,"defaultTexture":0,"item":34},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":2.0191091299057},"accessory":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"arms":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":4},"mask":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":122},"glass":{"texture":0,"defaultItem":-1,"defaultTexture":-1,"item":-1},"bracelet":{"texture":-1,"defaultItem":-1,"defaultTexture":0,"item":-1},"decals":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"shoes":{"texture":1,"defaultItem":1,"defaultTexture":0,"item":67},"watch":{"texture":0,"defaultItem":-1,"defaultTexture":0,"item":2},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":3.19999992847442},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":8.14247548580169},"torso2":{"texture":17,"defaultItem":0,"defaultTexture":0,"item":243},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":-0.70000000298023},"beard":{"defaultItem":-1,"defaultTexture":1,"opacity":0.57584232091903,"texture":2,"highlight":0,"item":16},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":3.6461991071701},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":1.6678375005722},"vest":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"t-shirt":{"texture":0,"defaultItem":1,"defaultTexture":0,"item":15},"skinDad":19,"complexion":{"defaultItem":0,"defaultTexture":0,"opacity":0.6700000166893,"texture":0,"highlight":0,"item":6},"bag":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"bodyb":{"defaultItem":0,"defaultTexture":0,"opacity":1.0,"texture":0,"highlight":0,"item":255},"eye_color":{"texture":0,"defaultItem":-1,"defaultTexture":0,"item":3}}', 'outfit-8-3186'),
	(86, 'UYN60276', 'Starting Outfit', 'mp_f_freemode_01', '{"moles":{"defaultItem":-1,"defaultTexture":0,"opacity":0.13,"texture":0,"highlight":0,"item":-1},"chest":{"defaultItem":0,"defaultTexture":0,"opacity":0.4021062245328,"texture":15,"highlight":0,"item":16},"eyebrows":{"defaultItem":-1,"defaultTexture":1,"opacity":0.27,"texture":0,"highlight":0,"item":30},"tattoos":[],"lipstick":{"defaultItem":-1,"defaultTexture":1,"opacity":0.0,"texture":35,"highlight":0,"item":0},"ageing":{"defaultItem":-1,"defaultTexture":0,"opacity":0.32,"texture":0,"highlight":0,"item":4},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":5.0},"makeup":{"defaultItem":-1,"defaultTexture":1,"opacity":0.51541239286216,"texture":35,"highlight":35,"item":0},"decals":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":-3.4},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":-2.1},"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":3.0},"hat":{"texture":0,"defaultItem":-1,"defaultTexture":0,"item":225},"face":{"texture":6,"defaultItem":0,"defaultTexture":0,"item":6},"skinMom":38,"nose_3":{"defaultItem":0,"defaultTexture":0,"item":0.6},"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":-1.79999999999999},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":4.3},"blush":{"defaultItem":-1,"defaultTexture":1,"opacity":0.36433750175635,"texture":34,"highlight":0,"item":0},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":-1.5},"hair":{"defaultItem":0,"defaultTexture":0,"texture":15,"highlight":10,"item":41,"style":0},"torso2":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":965},"arms":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":4},"face2":{"texture":45,"defaultItem":0,"defaultTexture":0,"item":45},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":-0.7},"accessory":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"sun_damage":{"defaultItem":0,"defaultTexture":0,"opacity":0.02,"texture":0,"highlight":0,"item":7},"mask":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":-0.3},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":-3.7},"pants":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":23},"shoes":{"texture":0,"defaultItem":1,"defaultTexture":0,"item":8},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":-1.3},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":-3.59999999999999},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":-4.69999999999999},"t-shirt":{"texture":0,"defaultItem":1,"defaultTexture":0,"item":15},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":1.9},"facemix":{"skinMix":0.36444512676177,"shapeMix":0.99},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":-0.1},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":-4.4},"vest":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":-4.9},"skinDad":28,"complexion":{"defaultItem":0,"defaultTexture":0,"opacity":0.37189124631164,"texture":0,"highlight":0,"item":-1},"bag":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"eye_color":{"texture":0,"defaultItem":-1,"defaultTexture":0,"item":4},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":2.2}}', 'outfit-6-5947'),
	(87, 'RZY43875', 'SS suit 2 open jacket', 'mp_m_freemode_01', '{"skinMom":0,"glass":{"item":5,"defaultItem":-1,"defaultTexture":-1,"texture":6},"tattoos":[],"facemix":{"shapeMix":0.27333334088325,"skinMix":0.35629630088806},"bracelet":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":-1},"eyebrown_forward":{"item":-3.90754520893096,"defaultItem":0,"defaultTexture":0},"torso2":{"item":4,"defaultItem":0,"defaultTexture":0,"texture":0},"cheek_2":{"item":8.14247548580169,"defaultItem":0,"defaultTexture":0},"nose_4":{"item":-3.01672041416168,"defaultItem":0,"defaultTexture":0},"jaw_bone_back_lenght":{"item":3.6461991071701,"defaultItem":0,"defaultTexture":0},"lipstick":{"highlight":0,"opacity":1.0,"texture":0,"item":255,"defaultItem":-1,"defaultTexture":1},"chimp_hole":{"item":0.0,"defaultItem":0,"defaultTexture":0},"nose_3":{"item":-2.37881124019622,"defaultItem":0,"defaultTexture":0},"neck_thikness":{"item":5.98426282405853,"defaultItem":0,"defaultTexture":0},"hat":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0},"hair":{"highlight":29,"texture":2,"item":37,"defaultItem":0,"style":0,"defaultTexture":0},"chimp_bone_lenght":{"item":-4.00000005960464,"defaultItem":0,"defaultTexture":0},"nose_2":{"item":-2.92679488658905,"defaultItem":0,"defaultTexture":0},"makeup":{"highlight":0,"opacity":1.0,"texture":0,"item":255,"defaultItem":-1,"defaultTexture":1},"mask":{"item":121,"defaultItem":0,"defaultTexture":0,"texture":0},"blush":{"highlight":0,"opacity":1.0,"texture":0,"item":255,"defaultItem":-1,"defaultTexture":1},"pants":{"item":10,"defaultItem":0,"defaultTexture":0,"texture":0},"cheek_1":{"item":1.75776302814483,"defaultItem":0,"defaultTexture":0},"watch":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0},"skinDad":19,"chimp_bone_width":{"item":0.50000000745058,"defaultItem":0,"defaultTexture":0},"sun_damage":{"highlight":0,"opacity":0.23000000417232,"texture":0,"item":9,"defaultItem":0,"defaultTexture":0},"chest":{"highlight":0,"opacity":1.0,"texture":0,"item":255,"defaultItem":0,"defaultTexture":0},"ear":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":-1},"complexion":{"highlight":0,"opacity":0.6700000166893,"texture":0,"item":6,"defaultItem":0,"defaultTexture":0},"bodyb":{"highlight":0,"opacity":1.0,"texture":0,"item":255,"defaultItem":0,"defaultTexture":0},"lips_thickness":{"item":3.19999992847442,"defaultItem":0,"defaultTexture":0},"decals":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"arms":{"item":4,"defaultItem":0,"defaultTexture":0,"texture":0},"eyebrows":{"highlight":0,"opacity":0.77979344129562,"texture":2,"item":10,"defaultItem":-1,"defaultTexture":1},"eye_opening":{"item":2.0191091299057,"defaultItem":0,"defaultTexture":0},"t-shirt":{"item":31,"defaultItem":1,"defaultTexture":0,"texture":0},"beard":{"highlight":0,"opacity":0.57584232091903,"texture":2,"item":16,"defaultItem":-1,"defaultTexture":1},"eye_color":{"defaultTexture":0,"defaultItem":-1,"item":3,"texture":0},"jaw_bone_width":{"item":-2.73851335048675,"defaultItem":0,"defaultTexture":0},"moles":{"highlight":0,"opacity":0.14000000059604,"texture":0,"item":14,"defaultItem":-1,"defaultTexture":0},"chimp_bone_lowering":{"item":-0.70000000298023,"defaultItem":0,"defaultTexture":0},"nose_1":{"item":0.04074750468134,"defaultItem":0,"defaultTexture":0},"face":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"ageing":{"highlight":0,"opacity":0.43987494707107,"texture":0,"item":2,"defaultItem":-1,"defaultTexture":0},"nose_5":{"item":1.6678375005722,"defaultItem":0,"defaultTexture":0},"accessory":{"item":164,"defaultItem":0,"defaultTexture":0,"texture":0},"bag":{"item":134,"defaultItem":0,"defaultTexture":0,"texture":0},"eyebrown_high":{"item":0.67865677177906,"defaultItem":0,"defaultTexture":0},"shoes":{"item":245,"defaultItem":1,"defaultTexture":0,"texture":0},"face2":{"defaultTexture":0,"defaultItem":0,"item":34,"texture":34},"cheek_3":{"item":-7.32471525669097,"defaultItem":0,"defaultTexture":0},"nose_0":{"item":1.48798644542694,"defaultItem":0,"defaultTexture":0},"vest":{"item":72,"defaultItem":0,"defaultTexture":0,"texture":3}}', 'outfit-10-9864'),
	(88, 'UMV88168', 'chief', 'mp_m_freemode_01', '{"skinMom":6,"glass":{"defaultTexture":-1,"defaultItem":-1,"item":7,"texture":0},"tattoos":[],"facemix":{"shapeMix":0.61140847206115,"skinMix":0.57591551542282},"bracelet":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":-1},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":-5.33632278442382},"vest":{"defaultTexture":0,"defaultItem":0,"item":63,"texture":0},"moles":{"highlight":0,"opacity":0.0,"texture":0,"defaultTexture":0,"defaultItem":-1,"item":255},"decals":{"defaultTexture":0,"defaultItem":0,"item":179,"texture":0},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":-8.20627808570861},"face2":{"defaultTexture":0,"defaultItem":0,"item":38,"texture":38},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":0.0},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":-2.46636778116226},"sun_damage":{"highlight":0,"opacity":0.4699999988079,"texture":0,"defaultTexture":0,"defaultItem":0,"item":7},"hat":{"defaultTexture":0,"defaultItem":-1,"item":288,"texture":0},"hair":{"style":0,"texture":61,"defaultTexture":0,"defaultItem":0,"item":152,"highlight":62},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":10.0},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":-0.76233185827732},"makeup":{"highlight":0,"opacity":1.0,"texture":0,"defaultTexture":1,"defaultItem":-1,"item":255},"mask":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":6.41255617141723},"pants":{"defaultTexture":0,"defaultItem":0,"item":286,"texture":0},"blush":{"highlight":0,"opacity":1.0,"texture":0,"defaultTexture":1,"defaultItem":-1,"item":255},"watch":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"skinDad":1,"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0.31390134245157},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":-8.47533643245697},"accessory":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":0.49327354878187},"complexion":{"highlight":0,"opacity":0.12999999523162,"texture":0,"defaultTexture":0,"defaultItem":0,"item":255},"bodyb":{"highlight":0,"opacity":1.0,"texture":0,"defaultTexture":0,"defaultItem":0,"item":255},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":10.0},"lipstick":{"highlight":0,"opacity":0.15000000596046,"texture":0,"defaultTexture":1,"defaultItem":-1,"item":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":8.11659216880798},"eyebrows":{"highlight":0,"opacity":0.99000000953674,"texture":61,"defaultTexture":1,"defaultItem":-1,"item":12},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":-6.05381190776824},"t-shirt":{"defaultTexture":0,"defaultItem":1,"item":302,"texture":1},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":0.50000000745058},"ear":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":-1},"eye_color":{"defaultTexture":0,"defaultItem":-1,"item":4,"texture":0},"beard":{"highlight":0,"opacity":0.99000000953674,"texture":61,"defaultTexture":1,"defaultItem":-1,"item":8},"arms":{"defaultTexture":0,"defaultItem":0,"item":1,"texture":0},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":2.3766815662384},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":10.0},"ageing":{"highlight":0,"opacity":0.60000002384185,"texture":0,"defaultTexture":0,"defaultItem":-1,"item":0},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":4.52914804220199},"chest":{"highlight":0,"opacity":1.0,"texture":0,"defaultTexture":0,"defaultItem":0,"item":255},"bag":{"defaultTexture":0,"defaultItem":0,"item":214,"texture":0},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":5.69506704807281},"shoes":{"defaultTexture":0,"defaultItem":1,"item":25,"texture":0},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":3.99103134870529},"face":{"defaultTexture":0,"defaultItem":0,"item":14,"texture":14},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0.22421523928642},"torso2":{"defaultTexture":0,"defaultItem":0,"item":604,"texture":2}}', 'outfit-6-5989');

-- Dumping structure for table worldisyours.player_priv_garages
CREATE TABLE IF NOT EXISTS `player_priv_garages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owners` longtext DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `z` float DEFAULT NULL,
  `h` float DEFAULT NULL,
  `distance` int(11) DEFAULT 10,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.player_priv_garages: ~0 rows (approximately)

-- Dumping structure for table worldisyours.player_reputation
CREATE TABLE IF NOT EXISTS `player_reputation` (
  `citizenid` varchar(50) NOT NULL,
  `reputation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}' CHECK (json_valid(`reputation`)),
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.player_reputation: ~0 rows (approximately)

-- Dumping structure for table worldisyours.player_skills
CREATE TABLE IF NOT EXISTS `player_skills` (
  `citizenid` varchar(50) NOT NULL,
  `skills` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}' CHECK (json_valid(`skills`)),
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.player_skills: ~0 rows (approximately)

-- Dumping structure for table worldisyours.player_transactions
CREATE TABLE IF NOT EXISTS `player_transactions` (
  `id` varchar(50) NOT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.player_transactions: ~0 rows (approximately)
INSERT INTO `player_transactions` (`id`, `isFrozen`, `transactions`) VALUES
	('HEU60167', 0, '[{"message":"Ryan Rich has deposited $500","receiver":"Ryan Rich","time":1730352025,"trans_id":"0e6bc39e-d94c-4d86-bff2-c582d0c58f56","issuer":"Ryan Rich","title":"Personal Account / HEU60167","trans_type":"deposit","amount":500},{"message":"Ryan Rich has withdrawed $1790","receiver":"Ryan Rich","amount":1790,"trans_id":"4242b556-c677-4082-be69-1788895ebb9c","issuer":"Ryan Rich","title":"Personal Account / HEU60167","trans_type":"withdraw","time":1730349804}]'),
	('RZY43875', 0, '[{"time":1730511081,"title":"Personal Account / RZY43875","receiver":"John McClane","message":"John McClane has withdrawed $80000","trans_type":"withdraw","amount":80000,"issuer":"John McClane","trans_id":"e0527175-1fd5-4fef-a7d8-b25b18303a9f"}]');

-- Dumping structure for table worldisyours.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(8) NOT NULL,
  `fakeplate` varchar(8) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  `damage` longtext DEFAULT '',
  `in_garage` tinyint(1) DEFAULT 1,
  `garage_id` varchar(255) DEFAULT 'Legion Square',
  `job_vehicle` tinyint(1) DEFAULT 0,
  `job_vehicle_rank` int(10) DEFAULT 0,
  `gang_vehicle` tinyint(1) DEFAULT 0,
  `gang_vehicle_rank` int(10) DEFAULT 0,
  `impound` int(10) DEFAULT 0,
  `impound_retrievable` int(10) DEFAULT 0,
  `impound_data` longtext DEFAULT '',
  `nickname` varchar(255) DEFAULT '',
  `financed` tinyint(1) NOT NULL DEFAULT 0,
  `finance_data` longtext DEFAULT NULL,
  `vehicletv` tinyint(1) DEFAULT 0,
  `evidence` longtext DEFAULT NULL,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  `parking` varchar(60) DEFAULT NULL,
  `nosColour` text DEFAULT NULL,
  `traveldistance` int(50) DEFAULT 0,
  `noslevel` int(10) DEFAULT 0,
  `hasnitro` tinyint(4) DEFAULT 0,
  `vinnumber` varchar(50) DEFAULT NULL,
  `vinscratch` int(2) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_playervehicles_plate` (`plate`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.player_vehicles: ~10 rows (approximately)
INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`, `damage`, `in_garage`, `garage_id`, `job_vehicle`, `job_vehicle_rank`, `gang_vehicle`, `gang_vehicle_rank`, `impound`, `impound_retrievable`, `impound_data`, `nickname`, `financed`, `finance_data`, `vehicletv`, `evidence`, `glovebox`, `trunk`, `parking`, `nosColour`, `traveldistance`, `noslevel`, `hasnitro`, `vinnumber`, `vinscratch`) VALUES
	(40, 'license:53d63cef03bd84bee2778d19ae409b18c859187a', 'RDT43347', 'daemon', '2006142190', '{"modExhaust":-1,"modTransmission":-1,"tankHealth":975,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modXenon":false,"pearlescentColor":0,"color1":3,"modLivery":-1,"modVanityPlate":-1,"modSpoilers":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modAerials":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modWindows":-1,"bodyHealth":812,"modSuspension":-1,"modEngine":-1,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"interiorColor":0,"modDoorSpeaker":-1,"headlightColor":255,"fuelLevel":88,"modRearBumper":-1,"modKit19":-1,"modFrontBumper":-1,"modPlateHolder":-1,"color2":3,"modDashboard":-1,"modSpeakers":-1,"modCustomTiresF":false,"liveryRoof":-1,"wheelColor":156,"modSteeringWheel":-1,"modDrift":false,"modTank":-1,"modAPlate":-1,"modAirFilter":-1,"modTrunk":-1,"modKit17":-1,"wheelSize":0.0,"modRoof":-1,"modSideSkirt":-1,"modEngineBlock":-1,"neonEnabled":[false,false,false,false],"plate":"04CLP591","modKit49":-1,"modTurbo":false,"modCustomTiresR":false,"modKit21":-1,"wheelWidth":0.0,"modStruts":-1,"modKit47":-1,"engineHealth":930,"modArmor":-1,"modTrimB":-1,"modShifterLeavers":-1,"oilLevel":5,"modSmokeEnabled":false,"modBrakes":-1,"modBackWheels":-1,"model":2006142190,"modTrimA":-1,"modSeats":-1,"modDial":-1,"tyreSmokeColor":[255,255,255],"extras":[],"modArchCover":-1,"modFrame":-1,"modBProofTires":false,"modHood":-1,"modRightFender":-1,"dirtLevel":6,"windowTint":-1,"modGrille":-1,"neonColor":[255,0,255],"modFender":-1,"plateIndex":3,"modHydrolic":-1,"wheels":6,"modOrnaments":-1,"modHorns":-1,"dashboardColor":0,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modFrontWheels":-1}', '04CLP591', NULL, NULL, 100, 929.879, 812.094, 1, 0, NULL, '{"cylinderlevel":0,"fuel":100.0,"oil":100.0,"fuellevel":0,"manual":0,"underglow":0,"carwax":0,"oillevel":0,"axle":100.0,"antiLag":0,"cablelevel":0,"spark":99.0,"battery":100.0,"shaftlevel":0,"harness":0}', 0, 0, 0, 0, '', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0),
	(41, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'RZY43875', 'ramleg', '-911560020', '{"modAirFilter":-1,"modFender":-1,"modSuspension":-1,"modTurbo":false,"modStruts":-1,"modSpeakers":-1,"plate":"RC12HY34","modSeats":-1,"modDial":-1,"modCustomTiresR":false,"model":-911560020,"modTrimB":-1,"modFrontWheels":-1,"modTrimA":-1,"bodyHealth":999,"modVanityPlate":-1,"tyreSmokeColor":[255,255,255],"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modKit47":-1,"modBrakes":-1,"modKit21":-1,"modBackWheels":-1,"extras":[0,0,null,null,0,0,1,1,1,1,0,1],"modSpoilers":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modTank":-1,"modSideSkirt":-1,"modKit19":-1,"modTrunk":-1,"modPlateHolder":-1,"plateIndex":4,"modFrontBumper":-1,"modEngineBlock":-1,"modRearBumper":-1,"windowTint":-1,"modAerials":-1,"wheelColor":156,"wheelSize":1.0,"modLivery":0,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modXenon":false,"modAPlate":-1,"modOrnaments":-1,"modGrille":-1,"wheelWidth":1.0,"modDashboard":-1,"modKit49":-1,"modTransmission":-1,"dashboardColor":0,"pearlescentColor":134,"neonColor":[255,255,255],"color1":2,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modExhaust":-1,"modArchCover":-1,"modFrame":-1,"modHood":-1,"modDoorSpeaker":-1,"modHorns":-1,"modArmor":-1,"fuelLevel":83,"modRightFender":-1,"tankHealth":1000,"color2":0,"modSteeringWheel":-1,"modHydrolic":-1,"modCustomTiresF":false,"modWindows":-1,"modRoof":-1,"headlightColor":255,"modEngine":-1,"modSmokeEnabled":false,"modShifterLeavers":-1,"neonEnabled":[false,false,false,false],"dirtLevel":0,"modDrift":false,"modKit17":-1,"engineHealth":1000,"modBProofTires":false,"oilLevel":8,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"interiorColor":0,"liveryRoof":-1,"wheels":1}', 'RC12HY34', NULL, NULL, 83, 1000, 1000, 1, 0, NULL, '{"cablelevel":0,"underglow":0,"battery":92.0,"fuel":90.0,"oillevel":0,"oil":92.0,"harness":1,"axle":92.0,"shaftlevel":0,"fuellevel":0,"antiLag":0,"spark":96.0,"cylinderlevel":0,"carwax":0,"manual":0}', 0, 0, 0, 0, '{"dirt":0.03876903280615,"deformation":[]}', 1, 'Legion Square', 0, 0, 0, 0, 0, 1, '', '', 0, NULL, 0, '[{"evtype":"carfingerprint","seat":1,"fingerprint":"Rp853d77viJ0456","time":1732497189,"location":"Seat 1","plate":"RC12HY34"},{"evtype":"carfingerprint","seat":1,"fingerprint":"Rp853d77viJ0456","time":1733702839,"location":"Seat 1","plate":"RC12HY34"}]', '[{"slot":1,"name":"oxy","count":25}]', NULL, NULL, NULL, 32, 0, 0, NULL, 0),
	(42, 'license:c5f1341b9e5627f52c1a19fd6d2a98c978e4681a', 'YDT13754', 'hellcatum', '1832080473', '{"modFrame":-1,"neonColor":[255,0,255],"color2":0,"oilLevel":5,"extras":[1,1,1,1,0,1],"interiorColor":0,"plateIndex":4,"modAirFilter":-1,"modKit17":-1,"modTurbo":false,"tyreSmokeColor":[255,255,255],"modArchCover":-1,"dashboardColor":0,"modVanityPlate":-1,"wheels":1,"modSteeringWheel":-1,"modSmokeEnabled":false,"modDoorSpeaker":-1,"modDial":-1,"plate":"XU01NT15","modCustomTiresF":false,"modTrimB":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modOrnaments":-1,"modDrift":false,"tankHealth":896,"modTank":-1,"modKit21":-1,"modHorns":-1,"color1":0,"modAerials":-1,"modSideSkirt":-1,"modSeats":-1,"modPlateHolder":-1,"modTransmission":-1,"model":1832080473,"modTrimA":-1,"modArmor":-1,"modBackWheels":-1,"modSuspension":-1,"neonEnabled":[false,false,false,false],"fuelLevel":79,"modSpeakers":-1,"modRightFender":-1,"modKit49":-1,"windowStatus":{"1":true,"2":true,"3":false,"4":true,"5":false,"6":false,"7":false,"0":true},"modTrunk":-1,"modRoof":-1,"modEngine":-1,"modDashboard":-1,"bodyHealth":625,"headlightColor":0,"modGrille":-1,"modKit19":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":992.1798706054688,"47":0.0,"45":0.0},"modHood":-1,"modBrakes":-1,"wheelColor":156,"modWindows":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFrontWheels":-1,"modStruts":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modBProofTires":false,"modLivery":3,"modShifterLeavers":-1,"modCustomTiresR":false,"engineHealth":920,"modRearBumper":-1,"modSpoilers":-1,"pearlescentColor":156,"modAPlate":-1,"modExhaust":-1,"liveryRoof":-1,"modHydrolic":-1,"modKit47":-1,"modEngineBlock":-1,"wheelWidth":1.0,"modFrontBumper":-1,"windowTint":-1,"modFender":-1,"wheelSize":1.0,"dirtLevel":8,"modXenon":false}', 'XU01NT15', NULL, NULL, 79, 920, 626, 1, 0, NULL, '{"oillevel":0,"antiLag":0,"cylinderlevel":0,"axle":98.0,"fuel":95.0,"carwax":0,"underglow":0,"harness":0,"cablelevel":0,"spark":96.0,"fuellevel":0,"shaftlevel":0,"battery":98.0,"manual":0,"oil":98.0}', 0, 0, 0, 0, '{"deformation":[[{"x":0.0,"y":2.54574084281921,"z":0.0},0.06503167748451]],"dirt":7.81977224349975}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"time":1732413658,"plate":"XU01NT15","serial":"209474POL529592","evtype":"carcasing"},{"time":1732413655,"plate":"XU01NT15","serial":"209474POL529592","evtype":"carcasing"},{"time":1732413650,"plate":"XU01NT15","serial":"209474POL529592","evtype":"carcasing"},{"time":1732413652,"plate":"XU01NT15","serial":"209474POL529592","evtype":"carcasing"},{"time":1732413653,"plate":"XU01NT15","serial":"209474POL529592","evtype":"carcasing"},{"time":1732413657,"plate":"XU01NT15","serial":"209474POL529592","evtype":"carcasing"},{"fingerprint":"Oy606o21qGD5727","plate":"XU01NT15","location":"Seat 1","time":1732234257,"seat":1,"evtype":"carfingerprint"},{"time":1732413647,"plate":"XU01NT15","serial":"209474POL529592","evtype":"carcasing"},{"fingerprint":"Rp853d77viJ0456","plate":"XU01NT15","location":"Seat 1","time":1732506125,"seat":1,"evtype":"carfingerprint"},{"time":1732413646,"plate":"XU01NT15","serial":"209474POL529592","evtype":"carcasing"},{"fingerprint":"iX361N76kAR7753","plate":"XU01NT15","location":"Seat 1","time":1732572083,"seat":1,"evtype":"carfingerprint"}]', '[{"metadata":{"description":"Name: jason Borune   \\nPlate: XU01NT15   \\nModel: DChargerUM"},"name":"car_registration","count":1,"slot":1},{"metadata":{"description":"Name: jason Borune   \\nPlate: XU01NT15   \\nModel: DChargerUM   \\nDate: 2024-11-06   \\nExpire: 2025-02-04"},"name":"insurance","count":1,"slot":2}]', '[{"count":1,"slot":1,"name":"medbag"},{"count":1,"slot":2,"name":"nikon"},{"count":1,"slot":3,"name":"sdcard"},{"metadata":{"serial":"POL","components":[],"durability":100,"ammo":100,"registered":true},"count":1,"slot":4,"name":"WEAPON_FIREEXTINGUISHER"},{"count":1,"slot":5,"name":"diving_gear"},{"count":1,"slot":6,"name":"police_stormram"},{"count":1,"slot":9,"name":"fingerprintreader"},{"count":10,"slot":10,"name":"empty_evidence_bag"},{"count":10,"slot":11,"name":"fingerprintkit"},{"count":10,"slot":12,"name":"gsrtestkit"},{"count":1,"slot":13,"name":"fingerprinttape"},{"count":10,"slot":14,"name":"drugtestkit"},{"count":10,"slot":15,"name":"dnatestkit"},{"count":1,"slot":16,"name":"breathalyzer"},{"metadata":{"serial":"464077POL214032","components":[],"durability":100,"ammo":0,"registered":"jason Borune"},"count":1,"slot":17,"name":"WEAPON_PUMPSHOTGUN"},{"count":100,"slot":18,"name":"shotgun_ammo"},{"metadata":{"serial":"271526POL716348","components":[],"durability":100,"ammo":0,"registered":"jason Borune"},"count":1,"slot":19,"name":"WEAPON_HK417"},{"count":2,"slot":20,"name":"rifle_ammo"}]', NULL, NULL, 132, 0, 0, NULL, 0),
	(43, 'license:53d63cef03bd84bee2778d19ae409b18c859187a', 'RDT43347', 'polestar1', '-2136912655', '{"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modDrift":false,"modPlateHolder":-1,"interiorColor":0,"modDial":-1,"modSpeakers":-1,"modRightFender":-1,"modHydrolic":-1,"modFrame":-1,"modSeats":-1,"modTrimB":-1,"modVanityPlate":-1,"modKit17":-1,"modBackWheels":-1,"wheelColor":27,"modArchCover":-1,"modExhaust":-1,"neonEnabled":[false,false,false,false],"modStruts":-1,"modGrille":-1,"neonColor":[255,0,255],"extras":[],"color2":34,"dashboardColor":0,"modXenon":false,"modKit49":-1,"modBProofTires":false,"model":-2136912655,"dirtLevel":0,"modRearBumper":-1,"modSuspension":-1,"modShifterLeavers":-1,"modHorns":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"modCustomTiresR":false,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modLivery":2,"modKit19":-1,"modSpoilers":-1,"modAirFilter":-1,"modDoorSpeaker":-1,"modFrontBumper":-1,"modSmokeEnabled":false,"modTransmission":-1,"modSteeringWheel":-1,"color1":0,"modKit21":-1,"wheelWidth":0.0,"windowTint":-1,"modEngine":-1,"wheels":0,"modSideSkirt":-1,"plateIndex":1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modHood":-1,"headlightColor":255,"tankHealth":1000,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"fuelLevel":86,"modTurbo":false,"modFrontWheels":-1,"oilLevel":5,"modTank":-1,"engineHealth":1000,"modBrakes":-1,"modAPlate":-1,"modAerials":-1,"modEngineBlock":-1,"modRoof":-1,"modKit47":-1,"pearlescentColor":0,"plate":"43ENV405","modDashboard":-1,"modOrnaments":-1,"modWindows":-1,"modCustomTiresF":false,"modTrimA":-1,"modTrunk":-1,"wheelSize":0.0,"modFender":-1,"bodyHealth":1000,"liveryRoof":-1,"tyreSmokeColor":[255,255,255],"modArmor":-1}', '43ENV405', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0),
	(44, 'license:f90cd271ae404268c3728c7b32d31095b7092b5b', 'UMV88168', 'pd_amggtr', '1864892220', '{"modAirFilter":-1,"modFender":-1,"modSuspension":3,"modTurbo":1,"modStruts":-1,"modSpeakers":-1,"plate":"87NJN938","modSeats":-1,"modDial":-1,"modShifterLeavers":-1,"model":1864892220,"modTrimB":-1,"modFrontWheels":-1,"modTrimA":-1,"bodyHealth":912,"modVanityPlate":-1,"tyreSmokeColor":[255,255,255],"windowStatus":{"1":false,"2":true,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modKit47":-1,"modBrakes":2,"modKit21":-1,"modBackWheels":-1,"extras":[0],"modSpoilers":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modTank":-1,"modSideSkirt":-1,"tireHealth":{"1":1000.0,"2":999.75,"3":1000.0,"4":0.0,"5":0.0,"0":980.42724609375,"47":0.0,"45":0.0},"modTrunk":-1,"modPlateHolder":-1,"plateIndex":4,"modFrontBumper":-1,"modEngineBlock":-1,"modRearBumper":-1,"windowTint":1,"fuelLevel":78,"modArmor":-1,"wheelSize":1.0,"modLivery":2,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modXenon":1,"modAPlate":-1,"modOrnaments":-1,"modGrille":-1,"wheelWidth":1.0,"modDashboard":-1,"wheelColor":0,"modTransmission":-1,"dashboardColor":0,"wheels":0,"modHydrolic":-1,"color2":0,"modEngine":-1,"modExhaust":-1,"modArchCover":-1,"modFrame":-1,"modHood":-1,"modDoorSpeaker":-1,"modRoof":-1,"modAerials":-1,"liveryRoof":-1,"modRightFender":-1,"modWindows":-1,"color1":16,"modSteeringWheel":-1,"engineHealth":879,"headlightColor":1,"tankHealth":987,"neonEnabled":[false,false,false,false],"modKit19":-1,"pearlescentColor":0,"modSmokeEnabled":false,"modCustomTiresR":false,"interiorColor":0,"dirtLevel":15,"modDrift":false,"modKit17":-1,"neonColor":[255,255,255],"modBProofTires":false,"oilLevel":5,"doorStatus":{"1":false,"2":false,"3":false,"4":true,"5":false,"0":false},"modHorns":-1,"modKit49":-1,"modCustomTiresF":false}', '87NJN938', NULL, NULL, 78, 879, 912, 1, 0, NULL, '{"axle":98.0,"underglow":0,"harness":1,"fuel":93.0,"oillevel":3,"oil":94.0,"cablelevel":3,"cylinderlevel":3,"shaftlevel":3,"fuellevel":3,"antiLag":1,"spark":95.0,"carwax":0,"battery":91.0,"manual":0}', 0, 0, 0, 0, '{"dirt":15.0,"deformation":[[{"x":-1.05250287055969,"y":2.35028004646301,"z":0.69625949859619},0.1382433027029],[{"x":0.0,"y":2.35028004646301,"z":0.69625949859619},0.06707657128572],[{"x":1.05250287055969,"y":2.35028004646301,"z":0.0},0.10573934763669],[{"x":1.05250287055969,"y":2.35028004646301,"z":0.69625949859619},0.16823181509971],[{"x":-1.05250287055969,"y":1.1751400232315,"z":0.69625949859619},0.19821831583976],[{"x":1.05250287055969,"y":1.1751400232315,"z":0.69625949859619},0.06829244643449]]}', 1, 'Grove Street', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"evtype":"carfingerprint","seat":1,"fingerprint":"Oy606o21qGD5727","time":1732413681,"location":"Seat 1","plate":"87NJN938"},{"evtype":"carfingerprint","seat":1,"fingerprint":"Sd832S76hyL3818","time":1733704671,"location":"Seat 1","plate":"87NJN938"},{"evtype":"carfingerprint","seat":1,"fingerprint":"Sd832S76hyL3818","time":1732455111,"location":"Seat 1","plate":"87NJN938"},{"evtype":"carfingerprint","seat":2,"fingerprint":"Sd832S76hyL3818","time":1732413696,"location":"Seat 2","plate":"87NJN938"},{"evtype":"carfingerprint","seat":1,"fingerprint":"Sd832S76hyL3818","time":1732633489,"location":"Seat 1","plate":"87NJN938"},{"evtype":"carfingerprint","seat":1,"fingerprint":"Sd832S76hyL3818","time":1732539450,"location":"Seat 1","plate":"87NJN938"},{"evtype":"carfingerprint","seat":1,"fingerprint":"Sd832S76hyL3818","time":1732551255,"location":"Seat 1","plate":"87NJN938"},{"evtype":"carfingerprint","seat":1,"fingerprint":"Sd832S76hyL3818","time":1732554235,"location":"Seat 1","plate":"87NJN938"},{"evtype":"carfingerprint","seat":1,"fingerprint":"Sd832S76hyL3818","time":1732478921,"location":"Seat 1","plate":"87NJN938"},{"evtype":"carfingerprint","seat":1,"fingerprint":"Sd832S76hyL3818","time":1732461111,"location":"Seat 1","plate":"87NJN938"},{"evtype":"carfingerprint","seat":1,"fingerprint":"Sd832S76hyL3818","time":1732413915,"location":"Seat 1","plate":"87NJN938"}]', '[{"name":"heartstopper","count":15,"slot":1},{"name":"bscoke","count":15,"slot":2},{"metadata":{"description":"Name: Andy Murphy   \\nPlate: 87NJN938   \\nModel: Mercedes-Be"},"name":"car_registration","count":1,"slot":9},{"name":"shotfries","count":25,"slot":3},{"name":"recyclablematerial","count":137,"slot":11},{"name":"toolbox","count":1,"slot":5},{"metadata":{"description":"Name: Andy Murphy   \\nPlate: 87NJN938   \\nModel: Mercedes-Be   \\nDate: 2024-11-08   \\nExpire: 2025-02-06"},"name":"insurance","count":1,"slot":10}]', '[{"name":"impact_driver","count":1,"slot":1},{"name":"drill","count":1,"slot":2},{"name":"lockpick","count":2,"slot":3},{"name":"vehicle_manual","count":1,"slot":37},{"metadata":{"components":[],"registered":true,"latentprints":{"Sd832S76hyL3818":{"integrity":100,"evidenceId":381591}},"serial":"POL","durability":100},"name":"WEAPON_PEPPERSPRAY","count":1,"slot":41}]', NULL, NULL, 142, 0, 0, NULL, 0),
	(45, 'license:f90cd271ae404268c3728c7b32d31095b7092b5b', 'EBT98762', 'challengerum', '727778714', '{"modSmokeEnabled":false,"modExhaust":-1,"windowTint":-1,"modKit17":-1,"tyreSmokeColor":[255,255,255],"modHood":-1,"modDoorSpeaker":-1,"headlightColor":255,"modStruts":-1,"modAerials":-1,"wheelColor":156,"modEngine":-1,"modHorns":-1,"modRearBumper":-1,"modSeats":-1,"modKit47":-1,"modVanityPlate":-1,"fuelLevel":97,"modFrame":-1,"modKit21":-1,"modAPlate":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":999.25,"47":0.0,"45":0.0},"modAirFilter":-1,"modSideSkirt":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modCustomTiresR":false,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modOrnaments":-1,"modTrimB":-1,"wheelSize":0.0,"modKit49":-1,"color2":111,"modBProofTires":false,"modDashboard":-1,"modDrift":false,"modSpeakers":-1,"interiorColor":0,"wheels":1,"dashboardColor":0,"modBrakes":-1,"neonEnabled":[false,false,false,false],"modSteeringWheel":-1,"modShifterLeavers":-1,"modRoof":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"modArchCover":-1,"modEngineBlock":-1,"dirtLevel":0,"color1":111,"neonColor":[255,0,255],"modHydrolic":-1,"modFrontBumper":-1,"extras":[1],"modTrunk":-1,"modDial":-1,"modSpoilers":-1,"liveryRoof":-1,"modTrimA":-1,"modFender":-1,"modPlateHolder":-1,"modTransmission":-1,"model":727778714,"oilLevel":5,"modTank":-1,"modXenon":false,"modGrille":-1,"modLivery":0,"bodyHealth":997,"pearlescentColor":0,"modBackWheels":-1,"wheelWidth":0.0,"modArmor":-1,"plateIndex":0,"plate":"TG84PV56","tankHealth":1000,"engineHealth":997,"modKit19":-1,"modCustomTiresF":false,"modSuspension":-1,"modWindows":-1,"modRightFender":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modFrontWheels":-1,"modTurbo":false}', 'TG84PV56', NULL, NULL, 97, 997, 998, 1, 0, NULL, '{"battery":100.0,"spark":100.0,"axle":100.0,"manual":0,"underglow":0,"carwax":0,"fuellevel":0,"cablelevel":0,"shaftlevel":0,"harness":1,"antiLag":0,"cylinderlevel":0,"oil":100.0,"oillevel":0,"fuel":100.0}', 0, 0, 0, 0, '{"deformation":[],"dirt":0.35042724013328}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"fingerprint":"Xg238g31qEI6745","evtype":"carfingerprint","plate":"TG84PV56","location":"Seat 1","seat":1,"time":1732420369}]', NULL, NULL, NULL, NULL, 4, 0, 0, NULL, 0),
	(46, 'license:f90cd271ae404268c3728c7b32d31095b7092b5b', 'HEU60167', 'vanzhycade', '-491183793', '{"modHydrolic":-1,"modGrille":-1,"wheels":7,"plateIndex":3,"modStruts":-1,"modWindows":-1,"wheelWidth":1.0,"modSpoilers":-1,"interiorColor":0,"modTank":-1,"modTrimB":-1,"modArmor":-1,"model":-491183793,"modOrnaments":-1,"modSideSkirt":-1,"modFender":-1,"tyreSmokeColor":[255,255,255],"modHood":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrimA":-1,"modEngineBlock":-1,"modVanityPlate":-1,"modBrakes":-1,"dirtLevel":7,"modKit47":-1,"modKit49":-1,"modTransmission":-1,"modLivery":-1,"wheelColor":1,"windowTint":-1,"modKit17":-1,"modTurbo":false,"modDashboard":-1,"modHorns":-1,"modSeats":-1,"modRearBumper":-1,"modXenon":false,"modAPlate":-1,"modFrame":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"color2":0,"engineHealth":1000,"plate":"RZ56TS15","modDoorSpeaker":-1,"modPlateHolder":-1,"modEngine":-1,"modDrift":false,"modSmokeEnabled":false,"modSteeringWheel":-1,"modAirFilter":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":true},"liveryRoof":-1,"color1":29,"modDial":-1,"modAerials":-1,"dashboardColor":0,"modFrontWheels":-1,"oilLevel":5,"modExhaust":-1,"modSuspension":-1,"modTrunk":-1,"modArchCover":-1,"modCustomTiresF":false,"neonColor":[255,0,255],"modKit19":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"tankHealth":999,"modBProofTires":false,"modShifterLeavers":-1,"modRoof":-1,"pearlescentColor":29,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"wheelSize":1.0,"bodyHealth":991,"modFrontBumper":-1,"modBackWheels":-1,"extras":[1,1],"neonEnabled":[false,false,false,false],"headlightColor":255,"modCustomTiresR":false,"modKit21":-1,"fuelLevel":77,"modSpeakers":-1,"modRightFender":-1}', 'RZ56TS15', NULL, NULL, 77, 1000, 991, 1, 0, NULL, '{"fuellevel":0,"spark":100.0,"harness":1,"antiLag":0,"underglow":0,"axle":100.0,"cylinderlevel":0,"fuel":98.0,"oil":97.0,"oillevel":0,"battery":99.0,"shaftlevel":0,"manual":0,"cablelevel":0,"carwax":0}', 0, 0, 0, 0, '{"deformation":[[{"x":1.11811578273773,"y":2.86333751678466,"z":0.0},0.05238176137208]],"dirt":7.18290185928344}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"time":1732545419,"plate":"RZ56TS15","location":"Seat 2","evtype":"carfingerprint","seat":2,"fingerprint":"Rp853d77viJ0456"},{"time":1733719303,"plate":"RZ56TS15","location":"Seat 2","evtype":"carfingerprint","seat":2,"fingerprint":"Rp853d77viJ0456"}]', '[{"metadata":{"description":"Name: Ryan Rich   \\nPlate: RZ56TS15   \\nModel: vanzhycade"},"name":"car_registration","slot":1,"count":1},{"metadata":{"description":"Name: Ryan Rich   \\nPlate: RZ56TS15   \\nModel: vanzhycade   \\nDate: 2024-11-10   \\nExpire: 2025-02-08"},"name":"insurance","slot":2,"count":1}]', NULL, NULL, NULL, 38, 0, 0, NULL, 0),
	(47, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'STG67749', 'frogger', '744705981', '{"wheelWidth":0.0,"modRoof":-1,"modHydrolic":-1,"color2":1,"dashboardColor":0,"oilLevel":8,"modGrille":-1,"modArmor":-1,"tyreSmokeColor":[255,255,255],"wheelSize":0.0,"extras":[0,0,null,null,null,null,0],"modBProofTires":true,"headlightColor":255,"color1":1,"modSuspension":-1,"modLivery":-1,"modShifterLeavers":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"fuelLevel":78,"tankHealth":1000,"modRearBumper":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modPlateHolder":-1,"modDial":-1,"modEngineBlock":-1,"modKit21":-1,"engineHealth":1000,"bodyHealth":1000,"modSideSkirt":-1,"neonColor":[255,0,255],"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":false,"0":true},"modBrakes":-1,"modOrnaments":-1,"modAPlate":-1,"modWindows":-1,"modVanityPlate":-1,"modRightFender":-1,"modFrame":-1,"modEngine":-1,"modKit47":-1,"dirtLevel":12,"modTrimB":-1,"modFender":-1,"modDashboard":-1,"modDrift":false,"wheelColor":156,"model":744705981,"modBackWheels":-1,"modFrontBumper":-1,"modKit19":-1,"modSeats":-1,"modTrunk":-1,"modSpeakers":-1,"modDoorSpeaker":-1,"windowTint":-1,"modTank":-1,"neonEnabled":[false,false,false,false],"wheels":0,"modArchCover":-1,"modTransmission":-1,"pearlescentColor":5,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"liveryRoof":-1,"modAerials":-1,"modXenon":false,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modFrontWheels":-1,"plateIndex":4,"modSmokeEnabled":false,"modStruts":-1,"modKit17":-1,"plate":"47JEN328","modHorns":-1,"modSpoilers":-1,"modKit49":-1,"modCustomTiresF":false,"modTrimA":-1,"modExhaust":-1,"modCustomTiresR":false,"interiorColor":0,"modTurbo":false,"modSteeringWheel":-1,"modHood":-1,"modAirFilter":-1}', '47JEN328', NULL, 'intairport', 100, 1000, 1000, 1, 0, NULL, '{"carwax":0,"oil":100.0,"cablelevel":0,"fuel":100.0,"oillevel":0,"battery":100.0,"fuellevel":0,"spark":100.0,"shaftlevel":0,"harness":0,"underglow":0,"antiLag":0,"manual":0,"cylinderlevel":0,"axle":100.0}', 0, 0, 0, 0, '', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', 'Yellowstone 1', 0, NULL, 0, '[{"time":1732548485,"plate":"47JEN328","evtype":"carfingerprint","location":"Seat 1","seat":1,"fingerprint":"iX361N76kAR7753"},{"time":1732549887,"plate":"47JEN328","evtype":"carfingerprint","location":"Seat 2","seat":2,"fingerprint":"iX361N76kAR7753"}]', '[{"metadata":{"description":"Name: John Dutton   \\nPlate: 47JEN328   \\nModel: FROGGER"},"name":"car_registration","slot":1,"count":1},{"metadata":{"description":"Name: John Dutton   \\nPlate: 47JEN328   \\nModel: FROGGER   \\nDate: 2024-11-10   \\nExpire: 2025-02-08"},"name":"insurance","slot":2,"count":1},{"metadata":{"components":[],"ammo":0,"registered":"Ryan Rich","durability":100,"serial":"578330RJI204224"},"name":"WEAPON_CARTELGLOCK","slot":31,"count":1}]', NULL, NULL, NULL, 8, 0, 0, NULL, 0),
	(48, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'STG67749', 'ramtrx6x6', '-921695977', '{"modBackWheels":-1,"fuelLevel":32,"oilLevel":5,"modCustomTiresR":false,"modSuspension":-1,"modStruts":-1,"modSpeakers":-1,"modRoof":-1,"modGrille":-1,"modExhaust":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"plateIndex":4,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modRearBumper":-1,"modFrontWheels":-1,"modWindows":-1,"tyreSmokeColor":[255,255,255],"modKit17":-1,"modArmor":-1,"modTrimA":-1,"modSmokeEnabled":false,"modDial":-1,"color1":96,"modFender":-1,"modShifterLeavers":-1,"modTank":-1,"bodyHealth":977,"color2":144,"modArchCover":-1,"modHorns":-1,"modAPlate":-1,"modXenon":false,"modKit47":-1,"modBrakes":-1,"modTurbo":false,"modHydrolic":-1,"pearlescentColor":0,"modRightFender":-1,"plate":"83UUL306","model":-921695977,"wheels":0,"tireHealth":{"1":999.75,"2":1000.0,"3":1000.0,"4":1000.0,"5":999.75,"0":999.25,"47":0.0,"45":0.0},"modSpoilers":-1,"modKit21":-1,"modAerials":-1,"modLivery":0,"modSideSkirt":-1,"modKit49":-1,"modDashboard":-1,"modDoorSpeaker":-1,"modPlateHolder":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modSeats":-1,"modEngine":-1,"dashboardColor":15,"neonColor":[255,0,255],"modKit19":-1,"wheelSize":0.0,"modVanityPlate":-1,"modTrunk":-1,"dirtLevel":3,"modTrimB":-1,"interiorColor":29,"neonEnabled":[false,false,false,false],"modSteeringWheel":-1,"engineHealth":993,"modFrame":-1,"modAirFilter":-1,"headlightColor":255,"wheelWidth":0.0,"wheelColor":128,"extras":[0,null,1],"modFrontBumper":-1,"modCustomTiresF":false,"modDrift":false,"modHood":-1,"liveryRoof":-1,"windowTint":-1,"modEngineBlock":-1,"tankHealth":997,"modTransmission":-1,"windowStatus":{"1":false,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":false},"modOrnaments":-1,"modBProofTires":false}', '83UUL306', NULL, NULL, 32, 994, 977, 1, 0, NULL, '{"antiLag":0,"oillevel":0,"harness":0,"oil":98.0,"fuellevel":0,"carwax":0,"axle":99.0,"spark":98.0,"shaftlevel":0,"cylinderlevel":0,"battery":96.0,"cablelevel":0,"fuel":99.0,"underglow":0,"manual":0}', 0, 0, 0, 0, '{"dirt":3.22378587722778,"deformation":[]}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[]', '[{"metadata":{"description":"Name: John Dutton   \\nPlate: 83UUL306   \\nModel: ramtrx6x6"},"count":1,"slot":1,"name":"car_registration"},{"metadata":{"description":"Name: John Dutton   \\nPlate: 83UUL306   \\nModel: ramtrx6x6   \\nDate: 2024-11-10   \\nExpire: 2025-02-08"},"count":1,"slot":2,"name":"insurance"}]', '[{"name":"hide_deer","count":26,"slot":1},{"name":"hide_coyote","count":3,"slot":2},{"name":"hide_cow","count":3,"slot":3},{"name":"hide_rabbit","count":3,"slot":4},{"name":"meat_chicken","count":4,"slot":5},{"name":"meat_rabbit","count":5,"slot":6},{"name":"meat_cow","count":3,"slot":7},{"name":"meat_cormorant","count":4,"slot":8},{"name":"meat_deer","count":27,"slot":9},{"name":"meat_coyote","count":3,"slot":10}]', NULL, NULL, 58, 0, 0, NULL, 0),
	(49, 'license:6420bf4bfdea4c3827bd7e58537da2979425ce83', 'ETF72063', 'tribike2', '-1233807380', '{"modFrame":-1,"neonColor":[255,0,255],"color2":132,"oilLevel":0,"extras":[],"interiorColor":0,"plateIndex":4,"modAirFilter":-1,"modKit17":-1,"modFender":-1,"tyreSmokeColor":[255,255,255],"modArchCover":-1,"dashboardColor":0,"modVanityPlate":-1,"modKit19":-1,"modSteeringWheel":-1,"dirtLevel":15,"modDoorSpeaker":-1,"modDial":-1,"plate":"8TC565PQ","modCustomTiresF":false,"modTrimB":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modXenon":false,"modDrift":false,"tankHealth":1000,"modEngineBlock":-1,"modKit21":-1,"modHorns":-1,"color1":132,"modAerials":-1,"modSideSkirt":-1,"modSeats":-1,"modHood":-1,"modTransmission":-1,"model":-1233807380,"modTrimA":-1,"windowTint":-1,"modBackWheels":-1,"modSuspension":-1,"neonEnabled":[false,false,false,false],"fuelLevel":100,"modSpeakers":-1,"modRightFender":-1,"modKit49":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"liveryRoof":-1,"modRoof":-1,"modEngine":-1,"modDashboard":-1,"wheelWidth":0.0,"headlightColor":255,"bodyHealth":1000,"modPlateHolder":-1,"wheels":6,"modTurbo":false,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"wheelColor":156,"modShifterLeavers":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modArmor":-1,"modGrille":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modFrontBumper":-1,"modLivery":-1,"modHydrolic":-1,"modCustomTiresR":false,"engineHealth":1000,"modRearBumper":-1,"modSpoilers":-1,"pearlescentColor":132,"modAPlate":-1,"modFrontWheels":-1,"modSmokeEnabled":false,"modTrunk":-1,"modKit47":-1,"wheelSize":0.0,"modStruts":-1,"modBProofTires":false,"modTank":-1,"modOrnaments":-1,"modBrakes":-1,"modWindows":-1,"modExhaust":-1}', '8TC565PQ', NULL, 'pillboxgarage', 100, 1000, 1000, 0, 0, NULL, NULL, 0, 0, 0, 0, '{"deformation":[],"dirt":15.0}', 1, 'Mirror Park', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"fingerprint":"ml138z34Hhe8906","plate":"8TC565PQ","location":"Seat 1","time":1732583240,"seat":1,"evtype":"carfingerprint"}]', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0);

-- Dumping structure for table worldisyours.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.player_warns: ~0 rows (approximately)

-- Dumping structure for table worldisyours.pug_paintball
CREATE TABLE IF NOT EXISTS `pug_paintball` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `gameitems` text DEFAULT NULL,
  `kills` int(11) DEFAULT NULL,
  `deaths` int(11) DEFAULT NULL,
  `wins` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.pug_paintball: ~4 rows (approximately)
INSERT INTO `pug_paintball` (`id`, `citizenid`, `gameitems`, `kills`, `deaths`, `wins`) VALUES
	(1, 'HOU41578', 'nothing', 0, 0, 0),
	(2, 'RZY43875', 'nothing', 0, 0, 0),
	(3, 'RDT43347', 'nothing', 0, 0, 0),
	(4, 'UMV88168', 'nothing', 0, 0, 0);

-- Dumping structure for table worldisyours.radiocar_music
CREATE TABLE IF NOT EXISTS `radiocar_music` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  `url` varchar(256) NOT NULL,
  `plate` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.radiocar_music: ~0 rows (approximately)

-- Dumping structure for table worldisyours.radiocar_owned
CREATE TABLE IF NOT EXISTS `radiocar_owned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spz` varchar(32) NOT NULL,
  `style` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.radiocar_owned: ~1 rows (approximately)
INSERT INTO `radiocar_owned` (`id`, `spz`, `style`) VALUES
	(9, 'RZ56TS15', 2);

-- Dumping structure for table worldisyours.radiocar_playlist
CREATE TABLE IF NOT EXISTS `radiocar_playlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist` text NOT NULL,
  `plate` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.radiocar_playlist: ~0 rows (approximately)

-- Dumping structure for table worldisyours.rcore_fuelshop
CREATE TABLE IF NOT EXISTS `rcore_fuelshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_identifier` text NOT NULL,
  `owner_identifier` text NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.rcore_fuelshop: ~24 rows (approximately)
INSERT INTO `rcore_fuelshop` (`id`, `shop_identifier`, `owner_identifier`, `data`) VALUES
	(1, 'fuel_pump23', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":0}'),
	(2, 'fuel_pump13', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":307}'),
	(3, 'fuel_pump6', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":1048.6000000000002}'),
	(4, 'fuel_pump10', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":0}'),
	(5, 'fuel_pump11', 'none', '{"fuel_only_employee":false,"capacity":[null,null,10000],"companyMoney":0,"3":50,"open":true,"price":520000,"for_sale":true}'),
	(6, 'fuel_pump5', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":421.6}'),
	(7, 'fuel_pump24', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":0}'),
	(8, 'fuel_pump14', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":0}'),
	(9, 'fuel_pump9', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":801}'),
	(10, 'fuel_pump21', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":0}'),
	(11, 'fuel_pump18', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":98}'),
	(12, 'fuel_pump16', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":791}'),
	(13, 'fuel_pump2', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":0}'),
	(14, 'fuel_pump1', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":0}'),
	(15, 'fuel_pump4', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":13485.2}'),
	(16, 'fuel_pump17', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":2499}'),
	(17, 'fuel_pump7', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":0}'),
	(18, 'fuel_pump20', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":0}'),
	(19, 'fuel_pump8', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":0}'),
	(20, 'fuel_pump3', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":373}'),
	(21, 'fuel_pump12_airplanes', 'none', '{"7":500,"capacity":[null,null,null,null,null,null,10000],"companyMoney":187087.40000000009,"fuel_only_employee":false,"open":true,"price":520000,"for_sale":true}'),
	(22, 'fuel_pump15', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":0}'),
	(23, 'fuel_pump22', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":4443.2}'),
	(24, 'fuel_pump19', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"for_sale":true,"fuel_only_employee":false,"open":true,"price":520000,"companyMoney":197}');

-- Dumping structure for table worldisyours.rcore_prison
CREATE TABLE IF NOT EXISTS `rcore_prison` (
  `prisoner_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solitary_time` datetime DEFAULT NULL,
  `jail_time` datetime DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`prisoner_id`) USING BTREE,
  KEY `owner` (`owner`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.rcore_prison: ~0 rows (approximately)

-- Dumping structure for table worldisyours.rcore_prison_accounts
CREATE TABLE IF NOT EXISTS `rcore_prison_accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` bigint(20) DEFAULT 0,
  `giftstate` tinyint(4) DEFAULT 0,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`account_id`) USING BTREE,
  KEY `owner` (`owner`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.rcore_prison_accounts: ~0 rows (approximately)

-- Dumping structure for table worldisyours.rcore_prison_accounts_log
CREATE TABLE IF NOT EXISTS `rcore_prison_accounts_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.rcore_prison_accounts_log: ~0 rows (approximately)

-- Dumping structure for table worldisyours.rcore_prison_coms
CREATE TABLE IF NOT EXISTS `rcore_prison_coms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoneId` bigint(10) DEFAULT NULL,
  `state` enum('IDLE','SWEEPING','RETURN') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `perollAmount` int(10) DEFAULT 0,
  `perollTarget` int(10) DEFAULT 0,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `owner` (`owner`) USING BTREE,
  KEY `zoneId` (`zoneId`) USING BTREE,
  CONSTRAINT `FK_Q27L` FOREIGN KEY (`zoneId`) REFERENCES `rcore_prison_coms_sessions` (`zoneId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.rcore_prison_coms: ~1 rows (approximately)

-- Dumping structure for table worldisyours.rcore_prison_coms_sessions
CREATE TABLE IF NOT EXISTS `rcore_prison_coms_sessions` (
  `zoneId` bigint(10) NOT NULL,
  `verticesTarget` bigint(10) NOT NULL,
  `verticesDone` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`zoneId`),
  KEY `zoneId_index` (`zoneId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.rcore_prison_coms_sessions: ~0 rows (approximately)

-- Dumping structure for table worldisyours.rcore_prison_logs
CREATE TABLE IF NOT EXISTS `rcore_prison_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charId` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `officer_name` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `citizen_name` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.rcore_prison_logs: ~8 rows (approximately)
INSERT INTO `rcore_prison_logs` (`id`, `action`, `desc`, `charId`, `officer_name`, `citizen_name`, `created_at`) VALUES
	(71, 'CITIZEN_JAILED', 'Test Testina jailed by officer named Demons Test', 'RDT43347', 'Test Testina', 'Test Testina', '2024-11-02 03:45:23'),
	(72, 'Solitary', 'Player has been sent to solitary for 00:05:00!', 'RDT43347', '-', 'Test Testina', '2024-11-02 03:46:38'),
	(73, 'Solitary', 'Player has been released from solitary', 'RDT43347', '-', 'Test Testina', '2024-11-02 03:51:39'),
	(74, 'PRISON_BREAK', 'Test Testina escaped from prison', 'RDT43347', '-', 'Test Testina', '2024-11-02 03:52:57'),
	(75, 'CITIZEN_JAILED', 'John McClane jailed by officer named -', 'RZY43875', 'John McClane', 'John McClane', '2024-11-03 12:26:59'),
	(76, 'EDIT_SENTENCE', '- changed sentence from 00:18:52 to 00:01:00', 'RZY43875', 'John McClane', 'John McClane', '2024-11-03 12:28:06'),
	(77, 'RELEASE_PLAYER', 'John McClane was released by officer named -', 'RZY43875', '-', 'John McClane', '2024-11-03 12:29:06'),
	(78, 'CITIZEN_JAILED', 'John McClane jailed by officer named -', 'RZY43875', 'John McClane', 'John McClane', '2024-11-03 12:30:35'),
	(79, 'EDIT_SENTENCE', '- changed sentence from 00:19:39 to 00:01:00', 'RZY43875', 'John McClane', 'John McClane', '2024-11-03 12:30:56'),
	(80, 'RELEASE_PLAYER', 'John McClane was released by officer named -', 'RZY43875', '-', 'John McClane', '2024-11-03 12:31:56');

-- Dumping structure for table worldisyours.rcore_prison_stash
CREATE TABLE IF NOT EXISTS `rcore_prison_stash` (
  `owner` varchar(255) NOT NULL,
  `stash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.rcore_prison_stash: ~0 rows (approximately)

-- Dumping structure for table worldisyours.rcore_reports
CREATE TABLE IF NOT EXISTS `rcore_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` text NOT NULL,
  `title` text NOT NULL,
  `state` varchar(20) NOT NULL,
  `tag` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `in_resolve_at` datetime DEFAULT NULL,
  `in_resolve_by` text DEFAULT NULL,
  `resolved_at` datetime DEFAULT NULL,
  `resolved_by` text DEFAULT NULL,
  `players_in_area` text NOT NULL,
  `chat_room` text NOT NULL,
  `logger` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.rcore_reports: ~0 rows (approximately)

-- Dumping structure for table worldisyours.rcore_reports_admin_chat
CREATE TABLE IF NOT EXISTS `rcore_reports_admin_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` text NOT NULL,
  `parentMessageId` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.rcore_reports_admin_chat: ~0 rows (approximately)

-- Dumping structure for table worldisyours.rcore_reports_tags
CREATE TABLE IF NOT EXISTS `rcore_reports_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.rcore_reports_tags: ~0 rows (approximately)

-- Dumping structure for table worldisyours.rentvehs
CREATE TABLE IF NOT EXISTS `rentvehs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `vehicle` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `time` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.rentvehs: ~0 rows (approximately)

-- Dumping structure for table worldisyours.scenes
CREATE TABLE IF NOT EXISTS `scenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) DEFAULT NULL,
  `text` mediumtext DEFAULT NULL,
  `color` mediumtext DEFAULT NULL,
  `viewdistance` int(11) DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL,
  `fontsize` decimal(10,1) DEFAULT NULL,
  `fontstyle` int(11) DEFAULT NULL,
  `coords` mediumtext DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `date_deletion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Dumping data for table worldisyours.scenes: ~0 rows (approximately)

-- Dumping structure for table worldisyours.stores
CREATE TABLE IF NOT EXISTS `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `coordinate` text DEFAULT NULL,
  `owner` varchar(120) DEFAULT NULL,
  `stock` longtext DEFAULT NULL,
  `products` longtext DEFAULT NULL,
  `request` longtext DEFAULT NULL,
  `balance` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.stores: ~16 rows (approximately)
INSERT INTO `stores` (`id`, `name`, `coordinate`, `owner`, `stock`, `products`, `request`, `balance`) VALUES
	(1, 'Electronic', '{"y":30.31999969482422,"x":-88.80000305175781,"z":71.94999694824219}', 'none', '[{"label":"fitbit","amount":0,"request_price":12,"max_price":400,"price":400,"name":"fitbit","max_request":100,"weight":1.0,"recommended_price":400,"mission_money":0},{"label":"radio","amount":0,"request_price":12,"max_price":250,"price":250,"name":"radio","max_request":100,"weight":1.0,"recommended_price":250,"mission_money":0},{"label":"radioscanner","amount":0,"request_price":12,"max_price":500,"price":5000,"name":"radioscanner","max_request":100,"weight":1.0,"recommended_price":5000,"mission_money":0},{"label":"Camera","amount":0,"request_price":12,"max_price":2500,"price":2500,"name":"camera","max_request":100,"weight":1.0,"recommended_price":2500,"mission_money":0},{"label":"Laptop","amount":0,"request_price":12,"max_price":15000,"price":15000,"name":"laptop","max_request":100,"weight":1.0,"recommended_price":15000,"mission_money":0}]', '[{"label":"fitbit","amount":100,"request_price":12,"max_price":400,"price":400,"name":"fitbit","max_request":100,"weight":1.0,"recommended_price":400,"mission_money":0},{"label":"radio","amount":100,"request_price":12,"max_price":250,"price":250,"name":"radio","max_request":100,"weight":1.0,"recommended_price":250,"mission_money":0},{"label":"radioscanner","amount":100,"request_price":12,"max_price":500,"price":5000,"name":"radioscanner","max_request":100,"weight":1.0,"recommended_price":5000,"mission_money":0},{"label":"Camera","amount":100,"request_price":12,"max_price":2500,"price":2500,"name":"camera","max_request":100,"weight":1.0,"recommended_price":2500,"mission_money":0},{"label":"Laptop","amount":100,"request_price":12,"max_price":15000,"price":15000,"name":"laptop","max_request":100,"weight":1.0,"recommended_price":15000,"mission_money":0}]', '[]', '0'),
	(2, 'Tobaco2', '{"y":2893.0400390625,"x":-43.02000045776367,"z":60.09999847412109}', 'none', '[{"label":"Cuban Cigar","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cubancigar","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"blue Dream joint","amount":0,"request_price":5,"max_price":7,"price":5,"name":"blue_dream_joint","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Banana Kush Joint","amount":0,"request_price":5,"max_price":7,"price":5,"name":"banana_kush_joint","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":5,"max_price":7,"price":5,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0}]', '[{"label":"Cuban Cigar","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cubancigar","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"blue Dream joint","amount":100,"request_price":5,"max_price":7,"price":5,"name":"blue_dream_joint","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Banana Kush Joint","amount":100,"request_price":5,"max_price":7,"price":5,"name":"banana_kush_joint","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":5,"max_price":7,"price":5,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0}]', '[]', '0'),
	(3, 'I-Phone Store', '{"y":-232.97000122070313,"x":149.4499969482422,"z":54.41999816894531}', 'none', '[{"label":"Classic iPhone","amount":0,"request_price":1000,"max_price":1500,"price":1000,"name":"classic_phone","max_request":20,"weight":0.7,"recommended_price":1000,"mission_money":0},{"label":"Black iPhone","amount":0,"request_price":1500,"max_price":2000,"price":1500,"name":"black_phone","max_request":20,"weight":0.7,"recommended_price":1500,"mission_money":0},{"label":"Blue iPhone","amount":0,"request_price":1100,"max_price":1500,"price":1100,"name":"blue_phone","max_request":20,"weight":0.7,"recommended_price":1100,"mission_money":0},{"label":"Red iPhone","amount":0,"request_price":1500,"max_price":2000,"price":1500,"name":"red_phone","max_request":20,"weight":0.7,"recommended_price":1500,"mission_money":0},{"label":"Green iPhone","amount":0,"request_price":1200,"max_price":1500,"price":1200,"name":"green_phone","max_request":20,"weight":0.7,"recommended_price":1200,"mission_money":0},{"label":"Green light iPhone","amount":0,"request_price":1200,"max_price":1500,"price":1200,"name":"greenlight_phone","max_request":20,"weight":0.7,"recommended_price":1200,"mission_money":0},{"label":"Pink iPhone","amount":0,"request_price":1200,"max_price":1500,"price":1200,"name":"pink_phone","max_request":20,"weight":0.7,"recommended_price":1200,"mission_money":0},{"label":"White iPhone","amount":0,"request_price":1500,"max_price":2000,"price":1500,"name":"white_phone","max_request":20,"weight":0.7,"recommended_price":1500,"mission_money":0},{"label":"Power Bank","amount":0,"request_price":100,"max_price":200,"price":100,"name":"powerbank","max_request":20,"weight":0.7,"recommended_price":100,"mission_money":0},{"label":"DSLR Camera","amount":0,"request_price":1000,"max_price":1500,"price":1000,"name":"camera","max_request":20,"weight":0.9,"recommended_price":1000,"mission_money":0}]', '[{"label":"Classic iPhone","amount":50,"request_price":1000,"max_price":1500,"price":1000,"name":"classic_phone","max_request":20,"weight":0.7,"recommended_price":1000,"mission_money":0},{"label":"Black iPhone","amount":50,"request_price":1500,"max_price":2000,"price":1500,"name":"black_phone","max_request":20,"weight":0.7,"recommended_price":1500,"mission_money":0},{"label":"Blue iPhone","amount":50,"request_price":1100,"max_price":1500,"price":1100,"name":"blue_phone","max_request":20,"weight":0.7,"recommended_price":1100,"mission_money":0},{"label":"Red iPhone","amount":50,"request_price":1500,"max_price":2000,"price":1500,"name":"red_phone","max_request":20,"weight":0.7,"recommended_price":1500,"mission_money":0},{"label":"Green iPhone","amount":50,"request_price":1200,"max_price":1500,"price":1200,"name":"green_phone","max_request":20,"weight":0.7,"recommended_price":1200,"mission_money":0},{"label":"Green light iPhone","amount":100,"request_price":1200,"max_price":1500,"price":1200,"name":"greenlight_phone","max_request":20,"weight":0.7,"recommended_price":1200,"mission_money":0},{"label":"Pink iPhone","amount":50,"request_price":1200,"max_price":1500,"price":1200,"name":"pink_phone","max_request":20,"weight":0.7,"recommended_price":1200,"mission_money":0},{"label":"White iPhone","amount":50,"request_price":1500,"max_price":2000,"price":1500,"name":"white_phone","max_request":20,"weight":0.7,"recommended_price":1500,"mission_money":0},{"label":"Power Bank","amount":50,"request_price":100,"max_price":200,"price":100,"name":"powerbank","max_request":20,"weight":0.7,"recommended_price":100,"mission_money":0},{"label":"DSLR Camera","amount":50,"request_price":1000,"max_price":1500,"price":1000,"name":"camera","max_request":20,"weight":0.9,"recommended_price":1000,"mission_money":0}]', '[]', '0'),
	(4, 'Tobaco1', '{"y":2912.969970703125,"x":-60.13999938964844,"z":63.20999908447265}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(5, 'Hardware Shop', '{"y":-1753.719970703125,"x":46.93999862670898,"z":29.61000061035156}', 'none', '[{"label":"lockpick","amount":0,"request_price":12,"max_price":200,"price":200,"name":"lockpick","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"wrench","amount":0,"request_price":12,"max_price":250,"price":250,"name":"weapon_wrench","max_request":100,"weight":1.0,"recommended_price":250,"mission_money":0},{"label":"hammer","amount":0,"request_price":12,"max_price":200,"price":200,"name":"weapon_hammer","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"repairkit","amount":0,"request_price":12,"max_price":700,"price":700,"name":"repairkit","max_request":100,"weight":1.0,"recommended_price":700,"mission_money":0},{"label":"toolkit","amount":0,"request_price":12,"max_price":350,"price":350,"name":"screwdriverset","max_request":100,"weight":1.0,"recommended_price":350,"mission_money":0},{"label":"Binoculars","amount":0,"request_price":12,"max_price":50,"price":50,"name":"binoculars","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"2Brothers","amount":0,"request_price":12,"max_price":50,"price":50,"name":"firework1","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Poppelers","amount":0,"request_price":12,"max_price":50,"price":50,"name":"firework2","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"WipeOut","amount":0,"request_price":12,"max_price":50,"price":50,"name":"firework3","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Weeping Willow","amount":0,"request_price":12,"max_price":50,"price":50,"name":"firework4","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Cleaning Kit","amount":0,"request_price":12,"max_price":150,"price":150,"name":"cleaningkit","max_request":100,"weight":1.0,"recommended_price":150,"mission_money":0},{"label":"Advanced Repairkit","amount":0,"request_price":12,"max_price":1400,"price":1400,"name":"advancedrepairkit","max_request":100,"weight":1.0,"recommended_price":1400,"mission_money":0},{"label":"Razor Blade","amount":0,"request_price":12,"max_price":20,"price":20,"name":"razorblade","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Plastic Jerrycan","amount":0,"request_price":12,"max_price":20,"price":20,"name":"plasticjerrycan","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Black Couch","amount":0,"request_price":12,"max_price":50,"price":50,"name":"chair1","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Wood Lounger","amount":0,"request_price":12,"max_price":50,"price":50,"name":"chair2","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Metal Deco Chair","amount":0,"request_price":12,"max_price":50,"price":50,"name":"chair3","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Race Harness","amount":0,"request_price":12,"max_price":200,"price":200,"name":"harness","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"Outfit bag","amount":0,"request_price":12,"max_price":5000,"price":5000,"name":"kq_outfitbag","max_request":100,"weight":1.0,"recommended_price":5000,"mission_money":0},{"label":"Acetone","amount":0,"request_price":12,"max_price":50,"price":50,"name":"acetone","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Trowel","amount":0,"request_price":12,"max_price":20,"price":20,"name":"trowel","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Fire Extinguisher","amount":0,"request_price":12,"max_price":50,"price":50,"name":"weapon_fireextinguisher","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Baking Soda","amount":0,"request_price":12,"max_price":75,"price":75,"name":"sodiumbicarbonate","max_request":100,"weight":1.0,"recommended_price":75,"mission_money":0}]', '[{"label":"lockpick","amount":100,"request_price":12,"max_price":200,"price":200,"name":"lockpick","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"wrench","amount":100,"request_price":12,"max_price":250,"price":250,"name":"weapon_wrench","max_request":100,"weight":1.0,"recommended_price":250,"mission_money":0},{"label":"hammer","amount":100,"request_price":12,"max_price":200,"price":200,"name":"weapon_hammer","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"repairkit","amount":100,"request_price":12,"max_price":700,"price":700,"name":"repairkit","max_request":100,"weight":1.0,"recommended_price":700,"mission_money":0},{"label":"toolkit","amount":100,"request_price":12,"max_price":350,"price":350,"name":"screwdriverset","max_request":100,"weight":1.0,"recommended_price":350,"mission_money":0},{"label":"Binoculars","amount":100,"request_price":12,"max_price":50,"price":50,"name":"binoculars","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"2Brothers","amount":100,"request_price":12,"max_price":50,"price":50,"name":"firework1","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Poppelers","amount":100,"request_price":12,"max_price":50,"price":50,"name":"firework2","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"WipeOut","amount":100,"request_price":12,"max_price":50,"price":50,"name":"firework3","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Weeping Willow","amount":100,"request_price":12,"max_price":50,"price":50,"name":"firework4","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Cleaning Kit","amount":100,"request_price":12,"max_price":150,"price":150,"name":"cleaningkit","max_request":100,"weight":1.0,"recommended_price":150,"mission_money":0},{"label":"Advanced Repairkit","amount":100,"request_price":12,"max_price":1400,"price":1400,"name":"advancedrepairkit","max_request":100,"weight":1.0,"recommended_price":1400,"mission_money":0},{"label":"Razor Blade","amount":100,"request_price":12,"max_price":20,"price":20,"name":"razorblade","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Plastic Jerrycan","amount":100,"request_price":12,"max_price":20,"price":20,"name":"plasticjerrycan","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Black Couch","amount":100,"request_price":12,"max_price":50,"price":50,"name":"chair1","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Wood Lounger","amount":100,"request_price":12,"max_price":50,"price":50,"name":"chair2","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Metal Deco Chair","amount":100,"request_price":12,"max_price":50,"price":50,"name":"chair3","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Race Harness","amount":100,"request_price":12,"max_price":200,"price":200,"name":"harness","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"Outfit bag","amount":100,"request_price":12,"max_price":5000,"price":5000,"name":"kq_outfitbag","max_request":100,"weight":1.0,"recommended_price":5000,"mission_money":0},{"label":"Acetone","amount":100,"request_price":12,"max_price":50,"price":50,"name":"acetone","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Trowel","amount":100,"request_price":12,"max_price":20,"price":20,"name":"trowel","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Fire Extinguisher","amount":100,"request_price":12,"max_price":50,"price":50,"name":"weapon_fireextinguisher","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Baking Soda","amount":100,"request_price":12,"max_price":75,"price":75,"name":"sodiumbicarbonate","max_request":100,"weight":1.0,"recommended_price":75,"mission_money":0}]', '[]', '0'),
	(6, 'Hardware Shop', '{"y":3472.85009765625,"x":2747.7099609375,"z":55.66999816894531}', 'none', '[{"label":"lockpick","amount":0,"request_price":12,"max_price":200,"price":200,"name":"lockpick","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"wrench","amount":0,"request_price":12,"max_price":250,"price":250,"name":"weapon_wrench","max_request":100,"weight":1.0,"recommended_price":250,"mission_money":0},{"label":"hammer","amount":0,"request_price":12,"max_price":200,"price":200,"name":"weapon_hammer","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"repairkit","amount":0,"request_price":12,"max_price":700,"price":700,"name":"repairkit","max_request":100,"weight":1.0,"recommended_price":700,"mission_money":0},{"label":"toolkit","amount":0,"request_price":12,"max_price":350,"price":350,"name":"screwdriverset","max_request":100,"weight":1.0,"recommended_price":350,"mission_money":0},{"label":"Binoculars","amount":0,"request_price":12,"max_price":50,"price":50,"name":"binoculars","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"2Brothers","amount":0,"request_price":12,"max_price":50,"price":50,"name":"firework1","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Poppelers","amount":0,"request_price":12,"max_price":50,"price":50,"name":"firework2","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"WipeOut","amount":0,"request_price":12,"max_price":50,"price":50,"name":"firework3","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Weeping Willow","amount":0,"request_price":12,"max_price":50,"price":50,"name":"firework4","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Cleaning Kit","amount":0,"request_price":12,"max_price":150,"price":150,"name":"cleaningkit","max_request":100,"weight":1.0,"recommended_price":150,"mission_money":0},{"label":"Advanced Repairkit","amount":0,"request_price":12,"max_price":1400,"price":1400,"name":"advancedrepairkit","max_request":100,"weight":1.0,"recommended_price":1400,"mission_money":0},{"label":"Razor Blade","amount":0,"request_price":12,"max_price":20,"price":20,"name":"razorblade","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Plastic Jerrycan","amount":0,"request_price":12,"max_price":20,"price":20,"name":"plasticjerrycan","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Black Couch","amount":0,"request_price":12,"max_price":50,"price":50,"name":"chair1","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Wood Lounger","amount":0,"request_price":12,"max_price":50,"price":50,"name":"chair2","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Metal Deco Chair","amount":0,"request_price":12,"max_price":50,"price":50,"name":"chair3","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Race Harness","amount":0,"request_price":12,"max_price":200,"price":200,"name":"harness","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"Outfit bag","amount":0,"request_price":12,"max_price":5000,"price":5000,"name":"kq_outfitbag","max_request":100,"weight":1.0,"recommended_price":5000,"mission_money":0},{"label":"Acetone","amount":0,"request_price":12,"max_price":50,"price":50,"name":"acetone","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Trowel","amount":0,"request_price":12,"max_price":20,"price":20,"name":"trowel","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Fire Extinguisher","amount":0,"request_price":12,"max_price":50,"price":50,"name":"weapon_fireextinguisher","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Baking Soda","amount":0,"request_price":12,"max_price":75,"price":75,"name":"sodiumbicarbonate","max_request":100,"weight":1.0,"recommended_price":75,"mission_money":0}]', '[{"label":"lockpick","amount":100,"request_price":12,"max_price":200,"price":200,"name":"lockpick","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"wrench","amount":100,"request_price":12,"max_price":250,"price":250,"name":"weapon_wrench","max_request":100,"weight":1.0,"recommended_price":250,"mission_money":0},{"label":"hammer","amount":100,"request_price":12,"max_price":200,"price":200,"name":"weapon_hammer","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"repairkit","amount":100,"request_price":12,"max_price":700,"price":700,"name":"repairkit","max_request":100,"weight":1.0,"recommended_price":700,"mission_money":0},{"label":"toolkit","amount":100,"request_price":12,"max_price":350,"price":350,"name":"screwdriverset","max_request":100,"weight":1.0,"recommended_price":350,"mission_money":0},{"label":"Binoculars","amount":100,"request_price":12,"max_price":50,"price":50,"name":"binoculars","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"2Brothers","amount":100,"request_price":12,"max_price":50,"price":50,"name":"firework1","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Poppelers","amount":100,"request_price":12,"max_price":50,"price":50,"name":"firework2","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"WipeOut","amount":100,"request_price":12,"max_price":50,"price":50,"name":"firework3","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Weeping Willow","amount":100,"request_price":12,"max_price":50,"price":50,"name":"firework4","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Cleaning Kit","amount":100,"request_price":12,"max_price":150,"price":150,"name":"cleaningkit","max_request":100,"weight":1.0,"recommended_price":150,"mission_money":0},{"label":"Advanced Repairkit","amount":100,"request_price":12,"max_price":1400,"price":1400,"name":"advancedrepairkit","max_request":100,"weight":1.0,"recommended_price":1400,"mission_money":0},{"label":"Razor Blade","amount":100,"request_price":12,"max_price":20,"price":20,"name":"razorblade","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Plastic Jerrycan","amount":100,"request_price":12,"max_price":20,"price":20,"name":"plasticjerrycan","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Black Couch","amount":100,"request_price":12,"max_price":50,"price":50,"name":"chair1","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Wood Lounger","amount":100,"request_price":12,"max_price":50,"price":50,"name":"chair2","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Metal Deco Chair","amount":100,"request_price":12,"max_price":50,"price":50,"name":"chair3","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Race Harness","amount":100,"request_price":12,"max_price":200,"price":200,"name":"harness","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"Outfit bag","amount":100,"request_price":12,"max_price":5000,"price":5000,"name":"kq_outfitbag","max_request":100,"weight":1.0,"recommended_price":5000,"mission_money":0},{"label":"Acetone","amount":100,"request_price":12,"max_price":50,"price":50,"name":"acetone","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Trowel","amount":100,"request_price":12,"max_price":20,"price":20,"name":"trowel","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Fire Extinguisher","amount":100,"request_price":12,"max_price":50,"price":50,"name":"weapon_fireextinguisher","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Baking Soda","amount":100,"request_price":12,"max_price":75,"price":75,"name":"sodiumbicarbonate","max_request":100,"weight":1.0,"recommended_price":75,"mission_money":0}]', '[]', '0'),
	(7, 'Hardware Shop', '{"y":6136.1298828125,"x":-421.8299865722656,"z":31.8799991607666}', 'none', '[{"label":"lockpick","amount":0,"request_price":12,"max_price":200,"price":200,"name":"lockpick","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"wrench","amount":0,"request_price":12,"max_price":250,"price":250,"name":"weapon_wrench","max_request":100,"weight":1.0,"recommended_price":250,"mission_money":0},{"label":"hammer","amount":0,"request_price":12,"max_price":200,"price":200,"name":"weapon_hammer","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"repairkit","amount":0,"request_price":12,"max_price":700,"price":700,"name":"repairkit","max_request":100,"weight":1.0,"recommended_price":700,"mission_money":0},{"label":"toolkit","amount":0,"request_price":12,"max_price":350,"price":350,"name":"screwdriverset","max_request":100,"weight":1.0,"recommended_price":350,"mission_money":0},{"label":"Binoculars","amount":0,"request_price":12,"max_price":50,"price":50,"name":"binoculars","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"2Brothers","amount":0,"request_price":12,"max_price":50,"price":50,"name":"firework1","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Poppelers","amount":0,"request_price":12,"max_price":50,"price":50,"name":"firework2","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"WipeOut","amount":0,"request_price":12,"max_price":50,"price":50,"name":"firework3","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Weeping Willow","amount":0,"request_price":12,"max_price":50,"price":50,"name":"firework4","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Cleaning Kit","amount":0,"request_price":12,"max_price":150,"price":150,"name":"cleaningkit","max_request":100,"weight":1.0,"recommended_price":150,"mission_money":0},{"label":"Advanced Repairkit","amount":0,"request_price":12,"max_price":1400,"price":1400,"name":"advancedrepairkit","max_request":100,"weight":1.0,"recommended_price":1400,"mission_money":0},{"label":"Razor Blade","amount":0,"request_price":12,"max_price":20,"price":20,"name":"razorblade","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Plastic Jerrycan","amount":0,"request_price":12,"max_price":20,"price":20,"name":"plasticjerrycan","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Black Couch","amount":0,"request_price":12,"max_price":50,"price":50,"name":"chair1","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Wood Lounger","amount":0,"request_price":12,"max_price":50,"price":50,"name":"chair2","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Metal Deco Chair","amount":0,"request_price":12,"max_price":50,"price":50,"name":"chair3","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Race Harness","amount":0,"request_price":12,"max_price":200,"price":200,"name":"harness","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"Outfit bag","amount":0,"request_price":12,"max_price":5000,"price":5000,"name":"kq_outfitbag","max_request":100,"weight":1.0,"recommended_price":5000,"mission_money":0},{"label":"Acetone","amount":0,"request_price":12,"max_price":50,"price":50,"name":"acetone","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Trowel","amount":0,"request_price":12,"max_price":20,"price":20,"name":"trowel","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Fire Extinguisher","amount":0,"request_price":12,"max_price":50,"price":50,"name":"weapon_fireextinguisher","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Baking Soda","amount":0,"request_price":12,"max_price":75,"price":75,"name":"sodiumbicarbonate","max_request":100,"weight":1.0,"recommended_price":75,"mission_money":0}]', '[{"label":"lockpick","amount":100,"request_price":12,"max_price":200,"price":200,"name":"lockpick","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"wrench","amount":100,"request_price":12,"max_price":250,"price":250,"name":"weapon_wrench","max_request":100,"weight":1.0,"recommended_price":250,"mission_money":0},{"label":"hammer","amount":100,"request_price":12,"max_price":200,"price":200,"name":"weapon_hammer","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"repairkit","amount":100,"request_price":12,"max_price":700,"price":700,"name":"repairkit","max_request":100,"weight":1.0,"recommended_price":700,"mission_money":0},{"label":"toolkit","amount":100,"request_price":12,"max_price":350,"price":350,"name":"screwdriverset","max_request":100,"weight":1.0,"recommended_price":350,"mission_money":0},{"label":"Binoculars","amount":100,"request_price":12,"max_price":50,"price":50,"name":"binoculars","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"2Brothers","amount":100,"request_price":12,"max_price":50,"price":50,"name":"firework1","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Poppelers","amount":100,"request_price":12,"max_price":50,"price":50,"name":"firework2","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"WipeOut","amount":100,"request_price":12,"max_price":50,"price":50,"name":"firework3","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Weeping Willow","amount":100,"request_price":12,"max_price":50,"price":50,"name":"firework4","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Cleaning Kit","amount":100,"request_price":12,"max_price":150,"price":150,"name":"cleaningkit","max_request":100,"weight":1.0,"recommended_price":150,"mission_money":0},{"label":"Advanced Repairkit","amount":100,"request_price":12,"max_price":1400,"price":1400,"name":"advancedrepairkit","max_request":100,"weight":1.0,"recommended_price":1400,"mission_money":0},{"label":"Razor Blade","amount":100,"request_price":12,"max_price":20,"price":20,"name":"razorblade","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Plastic Jerrycan","amount":100,"request_price":12,"max_price":20,"price":20,"name":"plasticjerrycan","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Black Couch","amount":100,"request_price":12,"max_price":50,"price":50,"name":"chair1","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Wood Lounger","amount":100,"request_price":12,"max_price":50,"price":50,"name":"chair2","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Metal Deco Chair","amount":100,"request_price":12,"max_price":50,"price":50,"name":"chair3","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Race Harness","amount":100,"request_price":12,"max_price":200,"price":200,"name":"harness","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"Outfit bag","amount":100,"request_price":12,"max_price":5000,"price":5000,"name":"kq_outfitbag","max_request":100,"weight":1.0,"recommended_price":5000,"mission_money":0},{"label":"Acetone","amount":100,"request_price":12,"max_price":50,"price":50,"name":"acetone","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Trowel","amount":100,"request_price":12,"max_price":20,"price":20,"name":"trowel","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Fire Extinguisher","amount":100,"request_price":12,"max_price":50,"price":50,"name":"weapon_fireextinguisher","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Baking Soda","amount":100,"request_price":12,"max_price":75,"price":75,"name":"sodiumbicarbonate","max_request":100,"weight":1.0,"recommended_price":75,"mission_money":0}]', '[]', '0'),
	(8, '24/7 Shop', '{"y":-1347.0980224609376,"x":26.48081970214843,"z":29.49702072143554}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(9, '24/7 Shop', '{"y":326.0856018066406,"x":374.1860046386719,"z":103.56639862060547}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(10, '24/7 Shop', '{"y":382.5602111816406,"x":2557.323974609375,"z":108.62300109863281}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(11, '24/7 Shop', '{"y":585.9539794921875,"x":-3038.93896484375,"z":7.9079999923706}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(12, '24/7 Shop', '{"y":1001.4619750976563,"x":-3241.927001953125,"z":12.82999992370605}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(13, '24/7 Shop', '{"y":2671.10595703125,"x":547.2924194335938,"z":42.15649032592773}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(14, '24/7 Shop', '{"y":3740.672119140625,"x":1961.4639892578126,"z":32.34299850463867}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(15, '24/7 Shop', '{"y":3280.735107421875,"x":2679.0859375,"z":55.24113082885742}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(16, '24/7 Shop', '{"y":6414.130859375,"x":1729.2159423828126,"z":35.0369987487793}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(17, '24/7 Shop', '{"y":-982.281005859375,"x":1135.8079833984376,"z":46.41500091552734}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(18, '24/7 Shop', '{"y":-906.9829711914063,"x":-1222.9150390625,"z":12.32600021362304}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(19, '24/7 Shop', '{"y":-379.10699462890627,"x":-1487.552978515625,"z":40.16299819946289}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(20, '24/7 Shop', '{"y":390.9100036621094,"x":-2968.242919921875,"z":15.04300022125244}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(21, '24/7 Shop', '{"y":2708.929931640625,"x":1166.0240478515626,"z":38.15700149536133}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(22, '24/7 Shop', '{"y":3604.68408203125,"x":1392.56201171875,"z":34.97999954223633}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(23, '24/7 Shop', '{"y":-604.8228759765625,"x":-1391.47705078125,"z":30.31954956054687}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(24, '24/7 Shop', '{"y":-1757.5140380859376,"x":-48.51900100708008,"z":29.42099952697754}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(25, '24/7 Shop', '{"y":-323.8009948730469,"x":1163.373046875,"z":69.20500183105469}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(26, '24/7 Shop', '{"y":-914.260009765625,"x":-707.5009765625,"z":19.21500015258789}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(27, '24/7 Shop', '{"y":792.5180053710938,"x":-1820.52294921875,"z":138.1179962158203}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(28, '24/7 Shop', '{"y":4924.40380859375,"x":1698.387939453125,"z":42.0629997253418}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(29, '24/7 Shop', '{"y":-1773.800048828125,"x":30.79999923706054,"z":29.61000061035156}', 'none', '[{"label":"Bottle of Water","amount":0,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":0,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":0,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":0,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":0,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":0,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":0,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":0,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":0,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":0,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":0,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":0,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":0,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":0,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":0,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":0,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":0,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":0,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":0,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":0,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":0,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":0,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":0,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":0,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":0,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":0,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":0,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":0,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":0,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":0,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":0,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":0,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[{"label":"Bottle of Water","amount":100,"request_price":5,"max_price":7,"price":5,"name":"water_bottle","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Grilled Sandwich","amount":100,"request_price":5,"max_price":7,"price":5,"name":"tosti","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Coffee","amount":100,"request_price":8,"max_price":10,"price":8,"name":"coffee","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"egg sandwich","amount":100,"request_price":6,"max_price":10,"price":7,"name":"eggsandwich","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"ham sandwich","amount":100,"request_price":8,"max_price":10,"price":8,"name":"hamsandwich","max_request":100,"weight":1.0,"recommended_price":8,"mission_money":0},{"label":"tuna sandwich","amount":100,"request_price":6,"max_price":10,"price":6,"name":"tunasandwich","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"mandms","amount":100,"request_price":5,"max_price":8,"price":5,"name":"mandms","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"peanut mandms","amount":100,"request_price":6,"max_price":7,"price":6,"name":"peanutmandms","max_request":100,"weight":1.0,"recommended_price":6,"mission_money":0},{"label":"hersheys bar","amount":100,"request_price":50,"max_price":70,"price":50,"name":"hersheysbar","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"cocacola","amount":100,"request_price":5,"max_price":7,"price":5,"name":"cocacola","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"pepsi","amount":100,"request_price":5,"max_price":7,"price":5,"name":"pepsi","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"dr pepper","amount":100,"request_price":50,"max_price":7,"price":5,"name":"drpepper","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"tea","amount":100,"request_price":7,"max_price":5,"price":3,"name":"tea","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"hot chocolate","amount":100,"request_price":3,"max_price":7,"price":3,"name":"hotchocolate","max_request":100,"weight":1.0,"recommended_price":3,"mission_money":0},{"label":"corona","amount":100,"request_price":5,"max_price":8,"price":5,"name":"corona","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"corona 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"corona6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"budweiser","amount":100,"request_price":3,"max_price":8,"price":5,"name":"budweiser","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"budweiser 6 pack","amount":100,"request_price":15,"max_price":20,"price":20,"name":"budweiser6pack","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"whiskey","amount":100,"request_price":50,"max_price":70,"price":50,"name":"whiskey","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"vodka","amount":100,"request_price":50,"max_price":70,"price":50,"name":"vodka","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Redwood Pack","amount":100,"request_price":7,"max_price":9,"price":7,"name":"redw","max_request":100,"weight":1.0,"recommended_price":7,"mission_money":0},{"label":"Marlboro Pack","amount":100,"request_price":8,"max_price":12,"price":10,"name":"marlboro","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"vape","amount":100,"request_price":40,"max_price":75,"price":50,"name":"vape","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"liquid","amount":100,"request_price":8,"max_price":20,"price":10,"name":"liquid","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"lighter","amount":100,"request_price":3,"max_price":8,"price":5,"name":"lighter","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Davidoff Cigar","amount":100,"request_price":5,"max_price":15,"price":10,"name":"davidoffcigar","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 01","amount":100,"request_price":0.5,"max_price":1,"price":1,"name":"scratchcard01","max_request":100,"weight":1.0,"recommended_price":1,"mission_money":0},{"label":"Scratch Card 02","amount":100,"request_price":1,"max_price":2,"price":2,"name":"scratchcard02","max_request":100,"weight":1.0,"recommended_price":2,"mission_money":0},{"label":"Scratch Card 03","amount":100,"request_price":3,"max_price":5,"price":5,"name":"scratchcard03","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Scratch Card 04","amount":100,"request_price":7,"max_price":10,"price":10,"name":"scratchcard04","max_request":100,"weight":1.0,"recommended_price":10,"mission_money":0},{"label":"Scratch Card 05","amount":100,"request_price":12,"max_price":20,"price":20,"name":"scratchcard05","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Wallet","amount":50,"request_price":12,"max_price":70,"price":20,"name":"wallet","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"file","amount":50,"request_price":12,"max_price":70,"price":20,"name":"file","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0}]', '[]', '0'),
	(30, 'Pharmachy', '{"y":-814.0499877929688,"x":72.04000091552735,"z":31.31999969482422}', 'none', '[{"label":"Bandage","amount":0,"request_price":12,"max_price":75,"price":75,"name":"bandage","max_request":100,"weight":1.0,"recommended_price":75,"mission_money":0},{"label":"painkillers","amount":0,"request_price":12,"max_price":150,"price":150,"name":"painkillers","max_request":100,"weight":1.0,"recommended_price":150,"mission_money":0},{"label":"Walking Stick","amount":0,"request_price":12,"max_price":75,"price":75,"name":"walkstick","max_request":100,"weight":1.0,"recommended_price":75,"mission_money":0},{"label":"Sodium Carbonate","amount":0,"request_price":12,"max_price":20,"price":20,"name":"sodiumcarbonate","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Ammonia","amount":0,"request_price":12,"max_price":50,"price":50,"name":"ammonia","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"wheelchair","amount":0,"request_price":12,"max_price":200,"price":200,"name":"wheelchair","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"benzocaine","amount":0,"request_price":12,"max_price":50,"price":50,"name":"benzocaine","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Tylenol","amount":0,"request_price":12,"max_price":50,"price":50,"name":"tylenol","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Peptobismol","amount":0,"request_price":12,"max_price":50,"price":50,"name":"peptobismol","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"loperamide","amount":0,"request_price":12,"max_price":50,"price":50,"name":"loperamide","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"aspirin","amount":0,"request_price":12,"max_price":50,"price":50,"name":"aspirin","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"ibuprofen","amount":0,"request_price":12,"max_price":50,"price":50,"name":"ibuprofen","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"dramamine","amount":0,"request_price":12,"max_price":50,"price":50,"name":"dramamine","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"syringe","amount":0,"request_price":12,"max_price":50,"price":50,"name":"syringe","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Microfiber Cloth","amount":0,"request_price":12,"max_price":50,"price":50,"name":"microfibercloth","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Blox Multisurface","amount":0,"request_price":12,"max_price":50,"price":50,"name":"blox","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Pregtest","amount":0,"request_price":12,"max_price":20,"price":20,"name":"pregtest","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Condom","amount":0,"request_price":12,"max_price":5,"price":5,"name":"condom","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Planb","amount":0,"request_price":12,"max_price":50,"price":50,"name":"planb","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0}]', '[{"label":"Bandage","amount":100,"request_price":12,"max_price":75,"price":75,"name":"bandage","max_request":100,"weight":1.0,"recommended_price":75,"mission_money":0},{"label":"painkillers","amount":100,"request_price":12,"max_price":150,"price":150,"name":"painkillers","max_request":100,"weight":1.0,"recommended_price":150,"mission_money":0},{"label":"Walking Stick","amount":100,"request_price":12,"max_price":75,"price":75,"name":"walkstick","max_request":100,"weight":1.0,"recommended_price":75,"mission_money":0},{"label":"Sodium Carbonate","amount":100,"request_price":12,"max_price":20,"price":20,"name":"sodiumcarbonate","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Ammonia","amount":100,"request_price":12,"max_price":50,"price":50,"name":"ammonia","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"wheelchair","amount":100,"request_price":12,"max_price":200,"price":200,"name":"wheelchair","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"benzocaine","amount":100,"request_price":12,"max_price":50,"price":50,"name":"benzocaine","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Tylenol","amount":100,"request_price":12,"max_price":50,"price":50,"name":"tylenol","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Peptobismol","amount":100,"request_price":12,"max_price":50,"price":50,"name":"peptobismol","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"loperamide","amount":100,"request_price":12,"max_price":50,"price":50,"name":"loperamide","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"aspirin","amount":100,"request_price":12,"max_price":50,"price":50,"name":"aspirin","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"ibuprofen","amount":100,"request_price":12,"max_price":50,"price":50,"name":"ibuprofen","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"dramamine","amount":100,"request_price":12,"max_price":50,"price":50,"name":"dramamine","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"syringe","amount":100,"request_price":12,"max_price":50,"price":50,"name":"syringe","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Microfiber Cloth","amount":100,"request_price":12,"max_price":50,"price":50,"name":"microfibercloth","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Blox Multisurface","amount":100,"request_price":12,"max_price":50,"price":50,"name":"blox","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Pregtest","amount":100,"request_price":12,"max_price":20,"price":20,"name":"pregtest","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Condom","amount":100,"request_price":12,"max_price":5,"price":5,"name":"condom","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Planb","amount":100,"request_price":12,"max_price":50,"price":50,"name":"planb","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0}]', '[]', '0'),
	(31, 'Pharmachy', '{"y":-379.54998779296877,"x":-1831.0999755859376,"z":49.40999984741211}', 'none', '[{"label":"Bandage","amount":0,"request_price":12,"max_price":75,"price":75,"name":"bandage","max_request":100,"weight":1.0,"recommended_price":75,"mission_money":0},{"label":"painkillers","amount":0,"request_price":12,"max_price":150,"price":150,"name":"painkillers","max_request":100,"weight":1.0,"recommended_price":150,"mission_money":0},{"label":"Walking Stick","amount":0,"request_price":12,"max_price":75,"price":75,"name":"walkstick","max_request":100,"weight":1.0,"recommended_price":75,"mission_money":0},{"label":"Sodium Carbonate","amount":0,"request_price":12,"max_price":20,"price":20,"name":"sodiumcarbonate","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Ammonia","amount":0,"request_price":12,"max_price":50,"price":50,"name":"ammonia","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"wheelchair","amount":0,"request_price":12,"max_price":200,"price":200,"name":"wheelchair","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"benzocaine","amount":0,"request_price":12,"max_price":50,"price":50,"name":"benzocaine","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Tylenol","amount":0,"request_price":12,"max_price":50,"price":50,"name":"tylenol","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Peptobismol","amount":0,"request_price":12,"max_price":50,"price":50,"name":"peptobismol","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"loperamide","amount":0,"request_price":12,"max_price":50,"price":50,"name":"loperamide","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"aspirin","amount":0,"request_price":12,"max_price":50,"price":50,"name":"aspirin","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"ibuprofen","amount":0,"request_price":12,"max_price":50,"price":50,"name":"ibuprofen","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"dramamine","amount":0,"request_price":12,"max_price":50,"price":50,"name":"dramamine","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"syringe","amount":0,"request_price":12,"max_price":50,"price":50,"name":"syringe","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Microfiber Cloth","amount":0,"request_price":12,"max_price":50,"price":50,"name":"microfibercloth","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Blox Multisurface","amount":0,"request_price":12,"max_price":50,"price":50,"name":"blox","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Pregtest","amount":0,"request_price":12,"max_price":20,"price":20,"name":"pregtest","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Condom","amount":0,"request_price":12,"max_price":5,"price":5,"name":"condom","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Planb","amount":0,"request_price":12,"max_price":50,"price":50,"name":"planb","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0}]', '[{"label":"Bandage","amount":100,"request_price":12,"max_price":75,"price":75,"name":"bandage","max_request":100,"weight":1.0,"recommended_price":75,"mission_money":0},{"label":"painkillers","amount":100,"request_price":12,"max_price":150,"price":150,"name":"painkillers","max_request":100,"weight":1.0,"recommended_price":150,"mission_money":0},{"label":"Walking Stick","amount":100,"request_price":12,"max_price":75,"price":75,"name":"walkstick","max_request":100,"weight":1.0,"recommended_price":75,"mission_money":0},{"label":"Sodium Carbonate","amount":100,"request_price":12,"max_price":20,"price":20,"name":"sodiumcarbonate","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Ammonia","amount":100,"request_price":12,"max_price":50,"price":50,"name":"ammonia","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"wheelchair","amount":100,"request_price":12,"max_price":200,"price":200,"name":"wheelchair","max_request":100,"weight":1.0,"recommended_price":200,"mission_money":0},{"label":"benzocaine","amount":100,"request_price":12,"max_price":50,"price":50,"name":"benzocaine","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Tylenol","amount":100,"request_price":12,"max_price":50,"price":50,"name":"tylenol","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Peptobismol","amount":100,"request_price":12,"max_price":50,"price":50,"name":"peptobismol","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"loperamide","amount":100,"request_price":12,"max_price":50,"price":50,"name":"loperamide","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"aspirin","amount":100,"request_price":12,"max_price":50,"price":50,"name":"aspirin","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"ibuprofen","amount":100,"request_price":12,"max_price":50,"price":50,"name":"ibuprofen","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"dramamine","amount":100,"request_price":12,"max_price":50,"price":50,"name":"dramamine","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"syringe","amount":100,"request_price":12,"max_price":50,"price":50,"name":"syringe","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Microfiber Cloth","amount":100,"request_price":12,"max_price":50,"price":50,"name":"microfibercloth","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Blox Multisurface","amount":100,"request_price":12,"max_price":50,"price":50,"name":"blox","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0},{"label":"Pregtest","amount":100,"request_price":12,"max_price":20,"price":20,"name":"pregtest","max_request":100,"weight":1.0,"recommended_price":20,"mission_money":0},{"label":"Condom","amount":100,"request_price":12,"max_price":5,"price":5,"name":"condom","max_request":100,"weight":1.0,"recommended_price":5,"mission_money":0},{"label":"Planb","amount":100,"request_price":12,"max_price":50,"price":50,"name":"planb","max_request":100,"weight":1.0,"recommended_price":50,"mission_money":0}]', '[]', '0');

-- Dumping structure for table worldisyours.store_balance
CREATE TABLE IF NOT EXISTS `store_balance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `market_id` varchar(50) NOT NULL,
  `income` tinyint(3) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `hidden` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.store_balance: ~0 rows (approximately)

-- Dumping structure for table worldisyours.store_business
CREATE TABLE IF NOT EXISTS `store_business` (
  `market_id` varchar(50) NOT NULL DEFAULT '',
  `user_id` varchar(50) NOT NULL,
  `stock` longtext NOT NULL,
  `stock_prices` longtext NOT NULL,
  `stock_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `truck_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `relationship_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `money` int(10) unsigned NOT NULL DEFAULT 0,
  `total_money_earned` int(10) unsigned NOT NULL DEFAULT 0,
  `total_money_spent` int(10) unsigned NOT NULL DEFAULT 0,
  `goods_bought` int(10) unsigned NOT NULL DEFAULT 0,
  `distance_traveled` double unsigned NOT NULL DEFAULT 0,
  `total_visits` int(10) unsigned NOT NULL DEFAULT 0,
  `customers` int(10) unsigned NOT NULL DEFAULT 0,
  `market_name` varchar(50) DEFAULT NULL,
  `market_color` int(10) unsigned DEFAULT NULL,
  `market_blip` int(10) unsigned DEFAULT NULL,
  `timer` int(10) unsigned NOT NULL,
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.store_business: ~0 rows (approximately)

-- Dumping structure for table worldisyours.store_categories
CREATE TABLE IF NOT EXISTS `store_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `market_id` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.store_categories: ~0 rows (approximately)

-- Dumping structure for table worldisyours.store_employees
CREATE TABLE IF NOT EXISTS `store_employees` (
  `market_id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `jobs_done` int(11) unsigned NOT NULL DEFAULT 0,
  `role` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `timer` int(11) unsigned NOT NULL,
  PRIMARY KEY (`market_id`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.store_employees: ~0 rows (approximately)

-- Dumping structure for table worldisyours.store_jobs
CREATE TABLE IF NOT EXISTS `store_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `market_id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL,
  `reward` int(10) unsigned NOT NULL DEFAULT 0,
  `product` varchar(50) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT 0,
  `progress` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `trucker_contract_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.store_jobs: ~0 rows (approximately)

-- Dumping structure for table worldisyours.store_users_theme
CREATE TABLE IF NOT EXISTS `store_users_theme` (
  `user_id` varchar(50) NOT NULL,
  `dark_theme` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.store_users_theme: ~10 rows (approximately)
INSERT INTO `store_users_theme` (`user_id`, `dark_theme`) VALUES
	('EBT98762', 1),
	('ETF72063', 1),
	('HEU60167', 1),
	('HOU41578', 1),
	('RDT43347', 1),
	('RZY43875', 1),
	('STG67749', 1),
	('UMV88168', 1),
	('YDT13754', 1),
	('YFB89595', 1);

-- Dumping structure for table worldisyours.tiktok_users
CREATE TABLE IF NOT EXISTS `tiktok_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '0',
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `pp` text DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `bio` text NOT NULL DEFAULT '',
  `birthday` varchar(50) NOT NULL DEFAULT '0',
  `videos` text NOT NULL DEFAULT '{}',
  `followers` text NOT NULL,
  `following` text NOT NULL,
  `liked` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.tiktok_users: ~0 rows (approximately)

-- Dumping structure for table worldisyours.tiktok_videos
CREATE TABLE IF NOT EXISTS `tiktok_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `created` varchar(50) NOT NULL DEFAULT '00:00:00',
  `data` text DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.tiktok_videos: ~0 rows (approximately)

-- Dumping structure for table worldisyours.tinder_accounts
CREATE TABLE IF NOT EXISTS `tinder_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `pp` text NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `gender` varchar(50) NOT NULL,
  `targetGender` varchar(50) NOT NULL DEFAULT '0',
  `hobbies` varchar(50) NOT NULL DEFAULT '0',
  `age` varchar(50) NOT NULL DEFAULT '0',
  `description` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.tinder_accounts: ~0 rows (approximately)

-- Dumping structure for table worldisyours.tinder_likes
CREATE TABLE IF NOT EXISTS `tinder_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(1024) NOT NULL,
  `likeds` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.tinder_likes: ~0 rows (approximately)

-- Dumping structure for table worldisyours.tinder_messages
CREATE TABLE IF NOT EXISTS `tinder_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` longtext NOT NULL,
  `messages` longtext DEFAULT '{}',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.tinder_messages: ~0 rows (approximately)

-- Dumping structure for table worldisyours.twitter_account
CREATE TABLE IF NOT EXISTS `twitter_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.twitter_account: ~0 rows (approximately)

-- Dumping structure for table worldisyours.twitter_hashtags
CREATE TABLE IF NOT EXISTS `twitter_hashtags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `created` varchar(50) NOT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.twitter_hashtags: ~0 rows (approximately)

-- Dumping structure for table worldisyours.twitter_mentions
CREATE TABLE IF NOT EXISTS `twitter_mentions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tweet` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `mentioned` text NOT NULL,
  `created` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.twitter_mentions: ~0 rows (approximately)

-- Dumping structure for table worldisyours.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `message` longtext NOT NULL,
  `hashtags` varchar(50) NOT NULL,
  `mentions` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `likes` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.twitter_tweets: ~0 rows (approximately)

-- Dumping structure for table worldisyours.tw_electrician
CREATE TABLE IF NOT EXISTS `tw_electrician` (
  `identifier` char(50) DEFAULT NULL,
  `profiledata` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.tw_electrician: ~12 rows (approximately)
INSERT INTO `tw_electrician` (`identifier`, `profiledata`) VALUES
	('UMV88168', '{"name":"Andy Murphy","level":1,"lasttime":[],"xp":0,"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","identifier":"UMV88168"}'),
	('STG67749', '{"lasttime":[],"level":1,"xp":0,"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","identifier":"STG67749","name":"John Dutton"}'),
	('HEU60167', '{"xp":0,"name":"Ryan Rich","identifier":"HEU60167","avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","lasttime":[null,"2024-11-23 23:41:06"],"level":2}'),
	('XVQ84862', '{"name":"Kitty Rich","identifier":"XVQ84862","level":1,"lasttime":[],"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","xp":0}'),
	('RZY43875', '{"xp":0,"name":"John McClane","identifier":"RZY43875","avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","lasttime":[null,"2024-11-23 23:41:07"],"level":2}'),
	('YDT13754', '{"level":1,"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","xp":0,"name":"jason Borune","lasttime":[],"identifier":"YDT13754"}'),
	('ETF72063', '{"level":1,"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","xp":0,"name":"David Kurgen","lasttime":[],"identifier":"ETF72063"}'),
	('RDT43347', '{"name":"Test Testina","identifier":"RDT43347","xp":0,"lasttime":[],"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","level":1}'),
	('HOU41578', '{"identifier":"HOU41578","name":"Demons Test","lasttime":["2024-11-20 02:14:09"],"xp":0,"level":2,"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png"}'),
	('CWY62276', '{"level":1,"identifier":"CWY62276","name":"Mr Dx","lasttime":[],"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","xp":0}'),
	('AEZ52818', '{"lasttime":[],"identifier":"AEZ52818","level":1,"name":"Trey Soul","avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","xp":0}'),
	('UYN60276', '{"name":"Beth Dutton","level":1,"xp":0,"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","identifier":"UYN60276","lasttime":[]}');

-- Dumping structure for table worldisyours.tw_gardener
CREATE TABLE IF NOT EXISTS `tw_gardener` (
  `identifier` char(50) DEFAULT NULL,
  `profiledata` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.tw_gardener: ~12 rows (approximately)
INSERT INTO `tw_gardener` (`identifier`, `profiledata`) VALUES
	('UMV88168', '{"name":"Andy Murphy","identifier":"UMV88168","avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","level":1,"xp":0}'),
	('STG67749', '{"name":"John Dutton","xp":0,"level":1,"identifier":"STG67749","avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png"}'),
	('HEU60167', '{"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","level":1,"identifier":"HEU60167","xp":0,"name":"Ryan Rich"}'),
	('XVQ84862', '{"identifier":"XVQ84862","level":1,"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","name":"Kitty Rich","xp":0}'),
	('RZY43875', '{"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","level":1,"identifier":"RZY43875","xp":0,"name":"John McClane"}'),
	('YDT13754', '{"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","xp":0,"identifier":"YDT13754","level":1,"name":"jason Borune"}'),
	('ETF72063', '{"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","xp":0,"identifier":"ETF72063","level":1,"name":"David Kurgen"}'),
	('RDT43347', '{"identifier":"RDT43347","level":1,"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","name":"Test Testina","xp":0}'),
	('HOU41578', '{"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","name":"Demons Test","level":2,"xp":0,"identifier":"HOU41578"}'),
	('CWY62276', '{"identifier":"CWY62276","name":"Mr Dx","level":1,"xp":0,"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png"}'),
	('AEZ52818', '{"xp":0,"avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","name":"Trey Soul","level":1,"identifier":"AEZ52818"}'),
	('UYN60276', '{"xp":0,"name":"Beth Dutton","avatar":"https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png","level":1,"identifier":"UYN60276"}');

-- Dumping structure for table worldisyours.user_accounts
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL DEFAULT 'civ',
  `vip` int(1) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `character_slots` int(11) NOT NULL DEFAULT 2,
  `license` varchar(255) NOT NULL,
  `discord` varchar(255) DEFAULT NULL,
  `tokens` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`tokens`)),
  `ip` varchar(255) NOT NULL,
  `banned` tinyint(1) DEFAULT 0,
  `banned_by` varchar(255) NOT NULL DEFAULT 'auto_ban',
  `reason` text DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`unique_id`),
  KEY `license` (`license`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.user_accounts: ~14 rows (approximately)
INSERT INTO `user_accounts` (`id`, `name`, `unique_id`, `rank`, `vip`, `priority`, `character_slots`, `license`, `discord`, `tokens`, `ip`, `banned`, `banned_by`, `reason`, `created`) VALUES
	(13, 'XxXxXxXxX', 'BOII_4ERCR', 'civ', 0, 0, 2, 'license2:2f2ba296d8af7e551cee3d7801d0000da0871f5d', NULL, '["2:1afa3d449adf983194055f05a0b968207450aee772740a8b73706a4edda84200","3:3c4ad74eef8e0a3bd4b946f54f60a52c9f6d6c48cb1fafc51cc60130aca913b0","4:0e19404b8d100377ffb68a14d6f5d4232cf0a632cc7cd16e807b5265e5ce2afa","4:91d4865aace7090a174d174e6c9e3d3c13329a32622059641b0111784380c355","4:7550574ddcd366af3f98c505fa3b2b82df5c00e5afe1af0b16554e8c6a8abaee"]', 'ip:188.137.24.27', 0, 'auto_ban', NULL, '2024-11-05 20:27:31'),
	(14, 'ReloadTales', 'BOII_5RVM4', 'civ', 0, 0, 2, 'license2:c5f1341b9e5627f52c1a19fd6d2a98c978e4681a', 'discord:378388270762950686', '["3:9fbb542cd5fb2f5de03b4200c2f82890de6168fac298dd018109d182e23898dc","5:413278aaeaf8b644302a6fa61240a0a0d60c9c5e8645e5750d1e7beac83d7617","2:c2268ed26618e4dbc369d3c7432eab2618969556bbb498ff253f829daf92f70d","4:8a8ff80b8836e8ad8e0a0f51c4add38b4b1350ca0404480cf5bf35aec2e61b8c","4:31f62bd9e6d1edd6cbfaf30cc519484185ed70d93ac2fdb95a03cd484001ed0d","4:2cd839e30d64a2665739d54024f66ec8d75947ac53f78a2b1016ad041bce85d9"]', 'ip:174.22.127.113', 0, 'auto_ban', NULL, '2024-11-06 21:46:28'),
	(19, 'Howdy', 'BOII_6LB3V', 'civ', 0, 0, 2, 'license2:6bd4eb6766d43653d3f811585e41e0a4a7b3a4e6', 'discord:816842150947717130', '["2:5ea3f45a308350d05363f4cec6359d6fdc69354c1d2305f7846f9b0b69ef135c","5:fda6e4f2a697b8e1308dbd93af7c9db139c40a27636d7d2f6689707b94d4aa20","3:9fedade2842a797f67ab0ab6fc334a4b230262ea584b99ac4662dc0336af8146","4:e0e2f4b762e5fce67b0c5e9f6a7b8aff1112271ce6d4a3da4dc8e4deea715217","4:d0baa833d2245e140a176f50783426e13b4e91d065309c1da43e0d88c59d978e","4:2f1a900177588b9737ec6dc23d7c0b1d2601cce275d0694a6933048e4d730118"]', 'ip:174.74.102.84', 0, 'auto_ban', NULL, '2024-11-10 23:09:23'),
	(22, 'sleaz', 'BOII_6S1CW', 'civ', 0, 0, 2, 'license2:c81dd4db4c81c8553837eb79acef8ac6096c4c2a', 'discord:1146194226594451568', '["2:993077c458e2bc2200b45017197d6280c43765fac46ff52556526ed332e9ef0a","5:ceaed8f8b3712a3d9db1d01bcf05215e24344f7274f4194f86ca512a396d338b","4:d4bd1748958d490e5099db110b4ecc8d86f57a48ce318a28bd730dbf6e1aca9b","4:c2eef4dfc6e619a51f2b062ef9b6110ed7cb4fa670ab07c6120c6fb77a8b0591","4:9232057e8cd215d4091b6c01631c2fe523b670ecf448bf2580c0cd53dae8e3e2"]', 'ip:73.114.47.157', 0, 'auto_ban', NULL, '2024-11-17 23:43:45'),
	(11, 'DemonsAngel90', 'BOII_855X7', 'civ', 0, 0, 2, 'license2:83698be1f861284c6614f8d89130f8b6ea0ca95d', 'discord:835917888069435423', '["2:dcfee7a001df36583a6516e5a8ecceda8cd3335604c21b246de836c92009fc6a","3:7407e6286d6abb4a940aedc405a57c501ab6f63232fb1991306e42fd5deb0da2","5:0791b616eff39d19ae5d89bab7512f82b26147b1e5f1b59beca898e6b1c365bc","4:fbd419efba9b5a9228cddefea65604b39406c705caf35a91a2a31c0b39eeb522","4:aacf7e46ba127ba5e5f130d264851233beab52e60f97b9eaa9e863fb2f51c749","4:e8054f8fbf5d240e89eb2ab99ea8135841132b9e9c45550715a0522cb12a4699"]', 'ip:204.195.185.102', 0, 'auto_ban', NULL, '2024-10-31 03:07:14'),
	(21, 'TooLITMafia', 'BOII_8SW6N', 'civ', 0, 0, 2, 'license2:29881f5fc9e3deec0e9a78ec6cc93929ab03dbb0', 'discord:694971494001934337', '["5:664e8aa4442c1ea2081c600c9ef6a56c45a3da71db537230681c7c868f1a06b5","2:c1c2053943cb18a1e2217b033ede4b73297099c39279e7dde0e1bf48d758b515","3:5c2a4898ce5f5be1faaca95c3c447022649390e3cbc4c1ce00a05493b309ce51","4:257b21994ae6ee9e56e8bf825d1847715664524661805986fc0707913cc43b0d","4:cabbcc3979c651968687877ec2f0425c680c43fa2a261b64825f0f0ea4a0ead4","4:bfa64dbe663044996a6416baac266f01c331e7e7aa7cfcea8198a6d66b48c2e6"]', 'ip:71.220.1.116', 0, 'auto_ban', NULL, '2024-11-15 13:30:36'),
	(12, 'DocJay69', 'BOII_B3RE4', 'civ', 0, 0, 2, 'license2:17c08e084f072db994a114b63ea05a8373230d0f', 'discord:932306801687420960', '["5:97af0fc9640352e52754f34425a082ed2c0841b61f79908c485ee40c7525eb16","2:ca181ef64e0ed06e4143b0f3df56459180a87ecbfb2858bbd568bed7659c8a95","4:51d2b094f054a93a49c43017a972c22f5c5cf9db369ce4d0ec5ca9bd4433b9c6","4:807732b7415f32deb28a5fd27c35d89b8d5e8e1fc689843631760c05fd7c4906","4:8e03871a519b819083164153ea15e3195408e9fa15b3bdffaf1b61f9cbeba08d"]', 'ip:216.164.30.143', 0, 'auto_ban', NULL, '2024-10-31 10:46:27'),
	(15, 'TamerWaves', 'BOII_C8AOO', 'civ', 0, 0, 2, 'license2:a873d761329f649a4f4ce2f415deefc4cf2e254e', 'discord:431932035683057665', '["5:cab21eb119bd963eb01046587cb77a98e38525f0e20776725f5101092f70c07a","2:4c3ef46d8a5a257912482be9b789a3004b7b396348ca400cafd2876efa0fb633","4:9e4ac4c0024886e352e438f0271b4c431c0e19a084d9cd92468ce92dea9e84c5","4:5437b8ea6895ec443bea3f88252ef6b536dbe41ee29c185ea1a78dcf83863080","4:ca77bc8e4b895cdb6e73bcd0069eb0ebb57300bf897d31ef8cac641bf10a87b7"]', 'ip:47.160.255.151', 0, 'auto_ban', NULL, '2024-11-06 22:27:56'),
	(9, 'DEV Dx', 'BOII_D170X', 'civ', 0, 0, 2, 'license2:a045ed84bc7b147ab67442c4be4c70a4bb7d0ad5', 'discord:811436286006657025', '["3:674b47c2839e52f31ace071fe475451ae85619e50f5043e88b006b7f0de2f4ff","5:7105749bb771ad68cca3b878ef3fc6e639deba85bc9cd79ef105acd834e53fe8","2:b21fd71be08694f199b355530c8595471ebd9a3fe9f354b5c33408f6bae11a31","4:99fed08f37245cabb492af63f2abd33f245f3c75548ac8575d0a78c9cbc3b1a2","4:d52a5322e96464716d9d4b535c8d61f53583420a921100a29677978c90896476","4:7fb90a71f29dcd7b76c668cead2a9954a7248c4b915600f7f6699cdd1dae22b6"]', 'ip:103.180.245.84', 0, 'auto_ban', NULL, '2024-10-31 03:02:20'),
	(17, 'Mub', 'BOII_EIXEY', 'civ', 0, 0, 2, 'license2:858df86c7c41303ca28108a524f41476fa6745bc', 'discord:391542851877732374', '["5:4024bde49fec4822eb7e3c16c4927215809507f95f7996cda1f093d033dee438","3:ebb726e83154e11e97e828a30353c2e8342fe66482a5572d08fcfcf9f7ebd29e","2:d08b5b084801376fb1ce9374cadca1286501fa5b675bbac15a971b76c0402ae4","4:ecda1b31cf967af6f40d27048edb0eeec4c953d9898271688bbf15b27a07c392","4:0c85ee0662d16e3f390eb490cb2a23a7525883028125387515a422dc1a4d11f0","4:cefda9ab61d69c169c2aeb39c418037e44ffd3831bc5491c2dfe3dfa24472061"]', 'ip:86.23.229.18', 0, 'auto_ban', NULL, '2024-11-08 10:28:12'),
	(18, 'Puppystomper', 'BOII_FTLKK', 'civ', 0, 0, 2, 'license2:6aaaf88bc4e5ced902b84f2966a1baffcf977674', 'discord:648366373164023818', '["2:36b4c3c98decc6e02da91b588554f52d7ffcbe3c4039629377aca6bef9c04911","3:3f3e74dcb4f7ee3004534e89c0ef01b4298c65480305df44565067f7cf525e36","4:674c62ca01499d2dfcacb72faad9b76a5706b347ec7d055ba32fb7340f3e3b12","4:7be9cebe51286ed3213528f7e78ba6d5a61ddf3d75ee6f3b5761de14f197d594","4:de14a54a53df642e575d23e050f974cec6d61a2b0063769681027e64c6b92045"]', 'ip:72.95.145.227', 0, 'auto_ban', NULL, '2024-11-09 03:23:07'),
	(16, 'DiztheAsianBoii', 'BOII_NYC5R', 'civ', 0, 0, 2, 'license2:c363e9adffa05633d122cdfae7b3b5f6c8fbe8bc', NULL, '["2:949f33c7a745526480e240d871f9959cb67279a11c3db298e8635aa494bd3803","3:133a2dc5ed8c8d4c0c553ac4ab4179ae690668e62b1c78a27f93c2ee1176d59f","5:814b27b66b14d153298d7084ee6836fa876cd4e568a6f09b4a664cb56b385e86","4:118568922cafd6c76e57610529d8c0a3af98b91879d2fb7f75735519bb3dcdd5","4:1a0f967b96da9a3fe031402ebfc5202da7dee98222b0aeafd268665eef99fef6","4:79c0809216bf91ef1b773eed34eab5054023e90d365acb8270ed22410e0ca86b"]', 'ip:73.230.43.90', 0, 'auto_ban', NULL, '2024-11-07 06:09:23'),
	(20, 'antman', 'BOII_OWRI7', 'civ', 0, 0, 2, 'license2:22705ed6c2efbf9b68b41e85573d6e3a0967b090', 'discord:1238583284318081029', '["3:2eb7a02d774bf999466b7ce005c86d9ca886bed2cd4f92c138d008b68ba9496c","4:25d4a0c4e60213155bfe3d5da653e8526c6573deb9afdc8b271bb9fb9dfcd693","4:42ce8c35a07216a6caab352af7529888da1923df9c1cb9aaae6851d4a689faea","4:21bf1a8953afcb1164ee0c0dff069d9b9d3a75dc9ae5c49d355c4c6916680467"]', 'ip:98.251.229.220', 0, 'auto_ban', NULL, '2024-11-14 22:50:59'),
	(10, 'SBDemon', 'BOII_RL0S7', 'civ', 0, 0, 2, 'license2:3588634a5bf8693cc225a6515fbd20936019a06e', 'discord:677439579585773589', '["3:723c659af7220b5e901ea36e01c45edc4a43553c56ea2218d7992994f04e1554","2:cf601354e0b3150446b77ab0a8219b511e9294759aa89a4082fee0112de0a0eb","4:667b1ff63c223ab4d6bdaf95f86b8b187248fe67f072bd89b71320ae893baa84","4:891b6bc9250efb222046270e0c457ea9fbc57c071ebea407709f9bda52cbfb7d","4:f653e4e07eace3b13c86b35e2a0d628a32e724faa41cde4291d5668ea7e10288"]', 'ip:204.195.185.102', 0, 'auto_ban', NULL, '2024-10-31 03:06:56');

-- Dumping structure for table worldisyours.weedplants
CREATE TABLE IF NOT EXISTS `weedplants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext NOT NULL CHECK (json_valid(`coords`)),
  `time` int(255) NOT NULL,
  `fertilizer` longtext NOT NULL CHECK (json_valid(`fertilizer`)),
  `water` longtext NOT NULL CHECK (json_valid(`water`)),
  `genetics` varchar(45) NOT NULL,
  `light` int(255) NOT NULL,
  `planter` int(11) NOT NULL,
  `watersetup` longtext NOT NULL,
  `lightsetup` longtext NOT NULL,
  `bucket` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.weedplants: ~0 rows (approximately)

-- Dumping structure for table worldisyours.weedprops
CREATE TABLE IF NOT EXISTS `weedprops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext NOT NULL CHECK (json_valid(`coords`)),
  `rot` longtext NOT NULL CHECK (json_valid(`rot`)),
  `model` varchar(45) NOT NULL,
  `link` int(11) NOT NULL,
  `bucket` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.weedprops: ~1 rows (approximately)

-- Dumping structure for table worldisyours.wertfuelstations
CREATE TABLE IF NOT EXISTS `wertfuelstations` (
  `no` int(11) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `fuelsettings` text DEFAULT NULL,
  `employess` longtext DEFAULT NULL,
  `money` int(55) unsigned NOT NULL DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  `salary` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.wertfuelstations: ~4 rows (approximately)
INSERT INTO `wertfuelstations` (`no`, `owner`, `fuelsettings`, `employess`, `money`, `label`, `salary`) VALUES
	(3, NULL, '{"fuel":99946.5,"price":2.5,"status":1}', '[]', 58, NULL, '{"active":1,"payminute":15,"ranks":[50,75,100]}'),
	(2, NULL, '{"price":2.5,"fuel":100000,"status":1}', '[]', 0, NULL, '{"active":1,"payminute":15,"ranks":[50,75,100]}'),
	(1, NULL, '{"price":2.5,"fuel":100000,"status":1}', '[]', 0, NULL, '{"active":1,"payminute":15,"ranks":[50,75,100]}'),
	(4, NULL, '{"price":2.5,"status":1,"fuel":99903.0}', '[]', 103, NULL, '{"active":1,"payminute":15,"ranks":[50,75,100]}');

-- Dumping structure for table worldisyours.wertfuelstations_garage_vehicles
CREATE TABLE IF NOT EXISTS `wertfuelstations_garage_vehicles` (
  `station` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.wertfuelstations_garage_vehicles: ~0 rows (approximately)

-- Dumping structure for table worldisyours.wertfuelstations_refinerys
CREATE TABLE IF NOT EXISTS `wertfuelstations_refinerys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 0,
  `owner` varchar(50) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `lastcraft` int(55) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.wertfuelstations_refinerys: ~5 rows (approximately)
INSERT INTO `wertfuelstations_refinerys` (`id`, `name`, `fuel`, `owner`, `money`, `lastcraft`) VALUES
	(37, 'refinery-3', 1824000, NULL, 0, 1726834755),
	(38, 'refinery-2', 1823000, NULL, 0, 1726834755),
	(39, 'refinery-5', 1823000, NULL, 0, 1726834755),
	(40, 'refinery-1', 1823000, NULL, 0, 1726834755),
	(41, 'refinery-4', 1823000, NULL, 0, 1726834755);

-- Dumping structure for table worldisyours.whatsapp_accounts
CREATE TABLE IF NOT EXISTS `whatsapp_accounts` (
  `id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.whatsapp_accounts: ~0 rows (approximately)

-- Dumping structure for table worldisyours.whatsapp_chats
CREATE TABLE IF NOT EXISTS `whatsapp_chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `messages` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.whatsapp_chats: ~0 rows (approximately)

-- Dumping structure for table worldisyours.whatsapp_chats_messages
CREATE TABLE IF NOT EXISTS `whatsapp_chats_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_chat` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `message` mediumtext NOT NULL,
  `readed` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.whatsapp_chats_messages: ~0 rows (approximately)

-- Dumping structure for table worldisyours.whatsapp_groups
CREATE TABLE IF NOT EXISTS `whatsapp_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.whatsapp_groups: ~0 rows (approximately)

-- Dumping structure for table worldisyours.whatsapp_groups_messages
CREATE TABLE IF NOT EXISTS `whatsapp_groups_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `created` varchar(50) NOT NULL,
  `read` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.whatsapp_groups_messages: ~0 rows (approximately)

-- Dumping structure for table worldisyours.whatsapp_groups_users
CREATE TABLE IF NOT EXISTS `whatsapp_groups_users` (
  `number_group` varchar(50) NOT NULL,
  `admin` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table worldisyours.whatsapp_groups_users: ~0 rows (approximately)

-- Dumping structure for table worldisyours.whatsapp_stories
CREATE TABLE IF NOT EXISTS `whatsapp_stories` (
  `phone` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.whatsapp_stories: ~0 rows (approximately)

-- Dumping structure for table worldisyours.wsb_cctvcameras
CREATE TABLE IF NOT EXISTS `wsb_cctvcameras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.wsb_cctvcameras: ~1 rows (approximately)
INSERT INTO `wsb_cctvcameras` (`id`, `data`) VALUES
	(4, '{"heading":340.05914306640627,"prop":"prop_cctv_cam_01a","destory":false,"coords":{"x":-412.5550231933594,"y":-1708.1221923828126,"z":22.22522163391113},"name":"alta scrapyard test","job":"lspd"}');

-- Dumping structure for table worldisyours.wsb_speedtraps
CREATE TABLE IF NOT EXISTS `wsb_speedtraps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.wsb_speedtraps: ~0 rows (approximately)

-- Dumping structure for table worldisyours.yellowpages_posts
CREATE TABLE IF NOT EXISTS `yellowpages_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.yellowpages_posts: ~0 rows (approximately)

-- Dumping structure for trigger worldisyours.phone_instagram_decrement_comment_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_decrement_comment_count
AFTER DELETE ON phone_instagram_comments
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_posts
    SET comment_count = comment_count - 1
    WHERE id = OLD.post_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_instagram_decrement_like_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_decrement_like_count
AFTER DELETE ON phone_instagram_likes
FOR EACH ROW
BEGIN
    IF OLD.is_comment = 0 THEN
        UPDATE phone_instagram_posts
        SET like_count = like_count - 1
        WHERE id = OLD.id;
    ELSE
        UPDATE phone_instagram_comments
        SET like_count = like_count - 1
        WHERE id = OLD.id;
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_instagram_decrement_post_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_decrement_post_count
AFTER DELETE ON phone_instagram_posts
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET post_count = post_count - 1
    WHERE username = OLD.username;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_instagram_decrement_story_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_decrement_story_count
AFTER DELETE ON phone_instagram_stories
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET story_count = story_count - 1
    WHERE username = OLD.username;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_instagram_increment_comment_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_increment_comment_count
AFTER INSERT ON phone_instagram_comments
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_posts
    SET comment_count = comment_count + 1
    WHERE id = NEW.post_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_instagram_increment_like_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_increment_like_count
AFTER INSERT ON phone_instagram_likes
FOR EACH ROW
BEGIN
    IF NEW.is_comment = 0 THEN
        UPDATE phone_instagram_posts
        SET like_count = like_count + 1
        WHERE id = NEW.id;
    ELSE
        UPDATE phone_instagram_comments
        SET like_count = like_count + 1
        WHERE id = NEW.id;
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_instagram_increment_post_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_increment_post_count
AFTER INSERT ON phone_instagram_posts
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET post_count = post_count + 1
    WHERE username = NEW.username;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_instagram_increment_story_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_increment_story_count
AFTER INSERT ON phone_instagram_stories
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET story_count = story_count + 1
    WHERE username = NEW.username;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_instagram_update_counts_after_follow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_update_counts_after_follow
AFTER INSERT ON phone_instagram_follows
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET follower_count = follower_count + 1
    WHERE username = NEW.followed;

    UPDATE phone_instagram_accounts
    SET following_count = following_count + 1
    WHERE username = NEW.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_instagram_update_counts_after_unfollow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_update_counts_after_unfollow
AFTER DELETE ON phone_instagram_follows
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET follower_count = follower_count - 1
    WHERE username = OLD.followed;

    UPDATE phone_instagram_accounts
    SET following_count = following_count - 1
    WHERE username = OLD.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_tiktok_decrement_account_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_decrement_account_likes
AFTER DELETE ON phone_tiktok_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_accounts
    JOIN phone_tiktok_videos ON phone_tiktok_videos.username = phone_tiktok_accounts.username
    SET phone_tiktok_accounts.like_count = phone_tiktok_accounts.like_count - 1
    WHERE phone_tiktok_videos.id = OLD.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_tiktok_decrement_comment_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_decrement_comment_likes
AFTER DELETE ON phone_tiktok_comments_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_comments
    SET likes = likes - 1
    WHERE id = OLD.comment_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_tiktok_decrement_video_comments
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_decrement_video_comments
BEFORE DELETE ON phone_tiktok_comments
FOR EACH ROW
BEGIN
    DECLARE v_replies_count INT;

    -- Count the replies for the comment
    SELECT COUNT(*) INTO v_replies_count
    FROM phone_tiktok_comments
    WHERE reply_to = OLD.id;

    -- Update the video's comments count
    UPDATE phone_tiktok_videos
    SET comments = comments - (1 + v_replies_count)
    WHERE id = OLD.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_tiktok_decrement_video_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_decrement_video_likes
AFTER DELETE ON phone_tiktok_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET likes = likes - 1
    WHERE id = OLD.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_tiktok_decrement_video_saves
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_decrement_video_saves
AFTER DELETE ON phone_tiktok_saves
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET saves = saves - 1
    WHERE id = OLD.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_tiktok_increment_account_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_account_likes
AFTER INSERT ON phone_tiktok_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_accounts
    JOIN phone_tiktok_videos ON phone_tiktok_videos.username = phone_tiktok_accounts.username
    SET phone_tiktok_accounts.like_count = phone_tiktok_accounts.like_count + 1
    WHERE phone_tiktok_videos.id = NEW.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_tiktok_increment_comment_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_comment_likes
AFTER INSERT ON phone_tiktok_comments_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_comments
    SET likes = likes + 1
    WHERE id = NEW.comment_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_tiktok_increment_video_comments
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_video_comments
AFTER INSERT ON phone_tiktok_comments
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET comments = comments + 1
    WHERE id = NEW.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_tiktok_increment_video_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_video_count
AFTER INSERT ON phone_tiktok_videos
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_accounts
    SET video_count = video_count + 1
    WHERE username = NEW.username;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_tiktok_increment_video_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_video_likes
AFTER INSERT ON phone_tiktok_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET likes = likes + 1
    WHERE id = NEW.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_tiktok_increment_video_saves
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_video_saves
AFTER INSERT ON phone_tiktok_saves
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET saves = saves + 1
    WHERE id = NEW.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_tiktok_increment_video_views
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_video_views
AFTER INSERT ON phone_tiktok_views
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET views = views + 1
    WHERE id = NEW.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_tiktok_update_counts_after_follow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_update_counts_after_follow
AFTER INSERT ON phone_tiktok_follows
FOR EACH ROW
BEGIN
    -- Increment the follower_count for the followed user
    UPDATE phone_tiktok_accounts
    SET follower_count = follower_count + 1
    WHERE username = NEW.followed;

    -- Increment the following_count for the follower user
    UPDATE phone_tiktok_accounts
    SET following_count = following_count + 1
    WHERE username = NEW.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_tiktok_update_counts_after_unfollow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_update_counts_after_unfollow
AFTER DELETE ON phone_tiktok_follows
FOR EACH ROW
BEGIN
    -- Decrement the follower_count for the followed user
    UPDATE phone_tiktok_accounts
    SET follower_count = follower_count - 1
    WHERE username = OLD.followed;

    -- Decrement the following_count for the follower user
    UPDATE phone_tiktok_accounts
    SET following_count = following_count - 1
    WHERE username = OLD.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_tiktok_update_last_message
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_update_last_message
AFTER INSERT ON phone_tiktok_messages
FOR EACH ROW
BEGIN
    DECLARE modified_content TEXT CHARACTER SET utf8mb4;

    IF NEW.content LIKE '<!SHARED-VIDEO-URL%' THEN
        SET modified_content = 'Shared a video';
    ELSEIF LENGTH(NEW.content) > 50 THEN
        SET modified_content = CONCAT(SUBSTR(NEW.content, 1, 17), '...');
    ELSE
        SET modified_content = NEW.content;
    END IF;

    UPDATE phone_tiktok_channels
    SET last_message = modified_content
    WHERE id = NEW.channel_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_twitter_update_counts_after_follow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_counts_after_follow
AFTER INSERT ON phone_twitter_follows
FOR EACH ROW
BEGIN
    -- Increment the follower_count for the followed user
    UPDATE phone_twitter_accounts
    SET follower_count = follower_count + 1
    WHERE username = NEW.followed;

    -- Increment the following_count for the follower user
    UPDATE phone_twitter_accounts
    SET following_count = following_count + 1
    WHERE username = NEW.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_twitter_update_counts_after_unfollow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_counts_after_unfollow
AFTER DELETE ON phone_twitter_follows
FOR EACH ROW
BEGIN
    -- Decrement the follower_count for the followed user
    UPDATE phone_twitter_accounts
    SET follower_count = follower_count - 1
    WHERE username = OLD.followed;

    -- Decrement the following_count for the follower user
    UPDATE phone_twitter_accounts
    SET following_count = following_count - 1
    WHERE username = OLD.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_twitter_update_like_count_after_like
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_like_count_after_like
AFTER INSERT ON phone_twitter_likes
FOR EACH ROW
BEGIN
    UPDATE phone_twitter_tweets
    SET like_count = like_count + 1
    WHERE id = NEW.tweet_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_twitter_update_like_count_after_unlike
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_like_count_after_unlike
AFTER DELETE ON phone_twitter_likes
FOR EACH ROW
BEGIN
    UPDATE phone_twitter_tweets
    SET like_count = like_count - 1
    WHERE id = OLD.tweet_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_twitter_update_retweet_count_after_retweet
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_retweet_count_after_retweet
AFTER INSERT ON phone_twitter_retweets
FOR EACH ROW
BEGIN
    UPDATE phone_twitter_tweets
    SET retweet_count = retweet_count + 1
    WHERE id = NEW.tweet_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger worldisyours.phone_twitter_update_retweet_count_after_unretweet
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_retweet_count_after_unretweet
AFTER DELETE ON phone_twitter_retweets
FOR EACH ROW
BEGIN
    UPDATE phone_twitter_tweets
    SET retweet_count = retweet_count - 1
    WHERE id = OLD.tweet_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
