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

-- Dumping data for table worldisyours.apartments: ~8 rows (approximately)
INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
	(1, 'apartment33661', 'apartment3', 'Integrity Way 3661', 'CIU02338'),
	(2, 'apartment48992', 'apartment4', 'Tinsel Towers 8992', 'JLN55666'),
	(4, 'apartment59146', 'apartment5', 'Fantastic Plaza 9146', 'GAZ46654'),
	(5, 'apartment51060', 'apartment5', 'Fantastic Plaza 1060', 'HFY38105'),
	(6, 'apartment17720', 'apartment1', 'South Rockford Drive 7720', 'EXH52321'),
	(7, 'apartment24521', 'apartment2', 'Morningwood Blvd 4521', 'CUM99608'),
	(8, 'apartment38566', 'apartment3', 'Integrity Way 8566', 'RBG25633'),
	(9, 'apartment51437', 'apartment5', 'Fantastic Plaza 1437', 'WFU61164');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.ap_appointments: ~0 rows (approximately)

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ap_bar: ~0 rows (approximately)
INSERT INTO `ap_bar` (`id`, `owner`, `name`, `mobile`, `job`, `bar_id`, `bar_date`, `bar_r_reason`, `bar_state`, `app_state`, `app_reason`, `app_date`, `jury_state`, `jury_pay`, `jury_case`, `jury_v_state`, `jury_case_date`, `jury_removal`) VALUES
	(1, 'AIM07751', 'Doc Test', '5058678976', 'Law Enforcement', '0000000', '01 JAN 2022', 'Reason', 1, 1, 'US MARSHAL SERVICE', 'Date', 1, 0, 0, 0, 'Court Date', 'Removal Reason');

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
INSERT INTO `ap_dlcsettings` (`script`, `settings`, `other`, `id_storage`) VALUES
	('ap_voting', '{"voteState":0,"time":0,"currentType":0,"funds":1000,"endDate":"0 days, 0 hours, and 0 minutes."}', '{"Housing":0.2,"Income":0.15,"Vehicle":0.2,"Item":0.2,"Business":0.15}', '[]');

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

-- Dumping data for table worldisyours.ap_judgeexam: ~6 rows (approximately)
INSERT INTO `ap_judgeexam` (`id`, `question`, `a`, `b`, `c`, `d`, `answer`, `last_changed_by`) VALUES
	(1, 'Question Example #1', 'Answer A Example', 'Answer B Example', 'Answer C Example', 'Answer D Example', 'a', 'Judge Name'),
	(2, 'Question Example #2', 'Answer A Example', 'Answer B Example', 'Answer C Example', 'Answer D Example', 'a', 'Judge Name'),
	(3, 'Question Example #3', 'Answer A Example', 'Answer B Example', 'Answer C Example', 'Answer D Example', 'a', 'Judge Name'),
	(4, 'Question Example #4', 'Answer A Example', 'Answer B Example', 'Answer C Example', 'Answer D Example', 'a', 'Judge Name'),
	(5, 'Question Example #5', 'Answer A Example', 'Answer B Example', 'Answer C Example', 'Answer D Example', 'a', 'Judge Name'),
	(6, 'Question Example #6', 'Answer A Example', 'Answer B Example', 'Answer C Example', 'Answer D Example', 'a', 'Judge Name');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.bank_accounts: ~2 rows (approximately)
INSERT INTO `bank_accounts` (`id`, `citizenid`, `account_name`, `account_balance`, `account_type`, `users`) VALUES
	(1, NULL, 'catcafe', 0, 'job', '[]'),
	(2, NULL, 'police', 0, 'job', '[]'),
	(3, NULL, 'billiards', 0, 'job', '[]'),
	(4, NULL, 'sahp', 0, 'job', '[]');

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

-- Dumping data for table worldisyours.bank_accounts_new: ~47 rows (approximately)
INSERT INTO `bank_accounts_new` (`id`, `amount`, `transactions`, `auth`, `isFrozen`, `creator`) VALUES
	('ambulance', 5000, '[]', '[]', 0, NULL),
	('ballas', 0, '[]', '[]', 0, NULL),
	('bcso', 0, '[]', '[]', 0, NULL),
	('beeker', 0, '[]', '[]', 0, NULL),
	('bennys', 0, '[]', '[]', 0, NULL),
	('bestbuds', 0, '[]', '[]', 0, NULL),
	('billiards', 0, '[]', '[]', 0, NULL),
	('burgershot', 450, '[]', '[]', 0, NULL),
	('bus', 0, '[]', '[]', 0, NULL),
	('cardealer', 0, '[]', '[]', 0, NULL),
	('cartel', 0, '[]', '[]', 0, NULL),
	('catcafe', 0, '[]', '[]', 0, NULL),
	('cityhall', 0, '[]', '[]', 0, NULL),
	('dealership', 0, '[]', '[]', 0, NULL),
	('dhs', 0, '[]', '[]', 0, NULL),
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
	('mechanic', 4449, '[]', '[]', 0, NULL),
	('mechanic2', 0, '[]', '[]', 0, NULL),
	('mechanic3', 0, '[]', '[]', 0, NULL),
	('none', 0, '[]', '[]', 0, NULL),
	('police', 0, '[]', '[]', 0, NULL),
	('realestate', 68, '[]', '[]', 0, NULL),
	('reporter', 0, '[]', '[]', 0, NULL),
	('sadoc', 0, '[]', '[]', 0, NULL),
	('safw', 0, '[]', '[]', 0, NULL),
	('sahp', 0, '[]', '[]', 0, NULL),
	('ss', 0, '[]', '[]', 0, NULL),
	('taxi', 0, '[]', '[]', 0, NULL),
	('tobacco', 0, '[]', '[]', 0, NULL),
	('tow', 0, '[]', '[]', 0, NULL),
	('triads', 0, '[]', '[]', 0, NULL),
	('trucker', 0, '[]', '[]', 0, NULL),
	('unemployed', 0, '[]', '[]', 0, NULL),
	('usms', 0, '[]', '[]', 0, NULL),
	('vagos', 0, '[]', '[]', 0, NULL),
	('vineyard', 0, '[]', '[]', 0, NULL),
	('whitewidow', 0, '[]', '[]', 0, NULL);

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
INSERT INTO `bank_statements` (`id`, `citizenid`, `account_name`, `amount`, `reason`, `statement_type`, `date`) VALUES
	(1, 'AIM07751', 'checking', 500000, 'Bank Deposit', 'deposit', '2024-08-25 17:21:34'),
	(2, 'PUX10690', 'checking', 250000, 'Bank Deposit', 'deposit', '2024-08-27 02:48:18');

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
	(1, '{"PodiumPriceProps":""}');

-- Dumping structure for table worldisyours.casino_players
CREATE TABLE IF NOT EXISTS `casino_players` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(128) NOT NULL,
  `properties` longtext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.casino_players: ~6 rows (approximately)
INSERT INTO `casino_players` (`ID`, `identifier`, `properties`) VALUES
	(35, 'OUV63962', '{"lastSave":12619074,"firstTime":false,"vipUntil":1729384082,"luckyWheelCooldownUntil":1728865386,"chips":66180,"logins":5,"activeTime":8992815,"lastDailyBonus":"10/12/24"}'),
	(36, 'AIM07751', '{"activeTime":41122719,"vipUntil":0,"chips":0,"firstTime":false,"logins":3,"lastSave":44733132}'),
	(37, 'QNC46912', '{"activeTime":41484429,"vipUntil":0,"firstTime":false,"luckyWheelCooldownUntil":1728621425,"chips":0,"lastDailyBonus":"10/09/24","logins":2,"lastSave":45093383}'),
	(38, 'LPI62642', '{"activeTime":41514957,"vipUntil":0,"firstTime":false,"luckyWheelCooldownUntil":1728621619,"chips":0,"lastDailyBonus":"10/09/24","logins":1,"lastSave":45123406}'),
	(39, 'ENW45444', '{"lastSave":62427577,"vipUntil":0,"firstTime":false,"luckyWheelCooldownUntil":1728864937,"chips":5000,"logins":3,"activeTime":58813461,"lastDailyBonus":"10/12/24"}'),
	(40, 'AXW11242', '{"lastSave":12619071,"vipUntil":1729384234,"luckyWheelCooldownUntil":1728865679,"firstTime":false,"chips":0,"logins":3,"activeTime":9007299,"lastDailyBonus":"10/12/24"}');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.cdev_pets: ~11 rows (approximately)
INSERT INTO `cdev_pets` (`id`, `key`, `owner`, `name`, `stamina`, `loyalty`, `happiness`, `hunger`, `health`, `thirst`, `sniff`, `resistance`, `agility`, `attack`, `customization`, `props`, `escaped`) VALUES
	(1, 'pet_amer', 'JXD83837', 'MEOW', 100, 100, 100, 82, 0, 82, 0, 0, 0, 0, '{"drawables":{"6":0,"0":0,"3":0},"textures":{"6":5,"0":5,"3":5}}', '{}', 0),
	(2, 'pet_chop', 'OUV63962', 'Patches', 100, 100, 100, 5, 0, 5, 0, 0, 0, 0, '{"drawables":[]}', '{}', 0),
	(3, 'pet_chop', 'AIM07751', 'TEST FREE', 100, 100, 100, 17, 0, 17, 1, 1, 1, 1, '{"drawables":[]}', '{}', 0),
	(4, 'pet_amer', 'AIM07751', 'Fat Ass', 100, 100, 100, 100, 100, 100, 0, 0, 0, 0, '{"drawables":{"6":0,"0":0,"3":0},"textures":{"6":4,"0":4,"3":4}}', '{}', 0),
	(5, 'pet_golden', 'JXD83837', 'NTT', 96, 100, 100, 93, 96, 93, 0, 0, 0, 0, '{"drawables":[]}', '{}', 0),
	(6, 'pet_mal', 'AIM07751', 'Blitz', 100, 100, 100, 100, 100, 100, 20, 20, 20, 20, '{"drawables":[]}', '{}', 0),
	(7, 'pet_pitt', 'OUV63962', 'Patches', 80, 100, 100, 88, 99, 96, 0, 0, 0, 0, '{"textures":{"1":0,"2":0,"3":0,"4":2,"5":0,"6":0,"7":0,"8":1,"9":0,"10":0,"11":0,"0":0},"drawables":{"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0,"8":2,"9":0,"10":0,"11":0,"0":0}}', '{"bowl":"redbowl"}', 0),
	(8, 'pet_mal', 'TOD22598', 'Zeus', 20, 100, 100, 0, 0, 11, 0, 0, 0, 0, '{"drawables":[]}', '{}', 0),
	(9, 'pet_shep', 'TOD22598', 'Duke', 16, 100, 100, 19, 96, 20, 1, 1, 1, 1, '{"textures":{"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0,"8":1,"9":0,"10":0,"11":0,"0":0},"drawables":{"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0,"8":2,"9":0,"10":0,"11":0,"0":0}}', '{}', 0),
	(10, 'pet_amer', 'RDO88579', 'piku', 60, 100, 100, 43, 72, 45, 0, 0, 0, 0, '{"textures":{"1":0,"2":0,"3":1,"4":0,"5":0,"6":1,"7":2,"8":0,"9":0,"10":0,"11":0,"0":1},"drawables":{"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":1,"8":0,"9":0,"10":0,"11":0,"0":0}}', '{}', 0),
	(11, 'pet_amer', 'ENW45444', 'Tabs', 25, 100, 100, 4, 8, 10, 0, 0, 0, 0, '{"drawables":{"1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0,"8":0,"9":0,"10":0,"11":0,"0":0},"textures":{"1":0,"2":0,"3":3,"4":0,"5":0,"6":3,"7":0,"8":0,"9":0,"10":0,"11":0,"0":3}}', '{"bowl":"cdev_pets_bowl4_a"}', 0);

-- Dumping structure for table worldisyours.cdev_pets_inventory
CREATE TABLE IF NOT EXISTS `cdev_pets_inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inventory` bigint(20) NOT NULL,
  `item` varchar(100) NOT NULL,
  `slot` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `metadata` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.cdev_pets_inventory: ~47 rows (approximately)
INSERT INTO `cdev_pets_inventory` (`id`, `inventory`, `item`, `slot`, `quantity`, `metadata`) VALUES
	(1, 3, 'k9activation', 9999999, 1, NULL),
	(4, 3, 'petfood6', 1, 1, NULL),
	(5, 3, 'leashgreen', 2, 1, NULL),
	(6, 5, 'bluebandana', 1, 1, NULL),
	(7, 5, 'pinksweater', 2, 1, NULL),
	(8, 5, 'redsunglasses', 3, 1, NULL),
	(9, 6, 'k9activation', 9999999, 1, NULL),
	(10, 7, 'allblackcollar', 1, 1, NULL),
	(11, 7, 'leashgreen', 2, 1, NULL),
	(12, 7, 'redbowl', 3, 1, NULL),
	(13, 7, 'bedmodern', 4, 1, NULL),
	(14, 7, 'baseball', 5, 1, NULL),
	(17, 7, 'petfood2', 6, 8, NULL),
	(18, 7, 'cleanwater', 7, 8, NULL),
	(19, 7, 'petmedhigh', 8, 1, NULL),
	(20, 7, 'petmedhigh', 9, 1, NULL),
	(21, 7, 'petmedhigh', 10, 1, NULL),
	(22, 7, 'petmedhigh', 11, 1, NULL),
	(23, 7, 'petmedhigh', 12, 1, NULL),
	(25, 8, 'policepatch', 1, 1, NULL),
	(26, 8, 'metalcollarblack', 2, 1, NULL),
	(27, 8, 'petfood2', 3, 1, NULL),
	(28, 8, 'pettreat3', 4, 1, NULL),
	(31, 8, 'leashgreen', 7, 1, NULL),
	(32, 9, 'k9activation', 9999999, 1, NULL),
	(40, 9, 'ramp', 8, 1, NULL),
	(42, 9, 'cone', 10, 1, NULL),
	(43, 9, 'hoop', 11, 1, NULL),
	(44, 9, 'allblackcollar', 12, 1, NULL),
	(45, 9, 'leashgreen', 9, 1, NULL),
	(48, 9, 'dummy', 15, 1, NULL),
	(49, 9, 'dummy', 16, 1, NULL),
	(50, 9, 'dummy', 17, 1, NULL),
	(51, 9, 'dummy', 18, 1, NULL),
	(53, 9, 'dummy', 20, 1, NULL),
	(54, 9, 'petmedhigh', 1, 1, NULL),
	(59, 9, 'petfood3', 2, 0, NULL),
	(62, 9, 'petmedhigh', 5, 1, NULL),
	(63, 9, 'petmedhigh', 6, 1, NULL),
	(64, 9, 'cleanwater', 7, 0, NULL),
	(65, 10, 'redsunglasses', 1, 1, NULL),
	(66, 11, 'redsunglasses', 1, 1, NULL),
	(67, 11, 'devilearsblack', 2, 1, NULL),
	(68, 11, 'leashgreen', 3, 1, NULL),
	(69, 11, 'cdev_pets_bowl4_a', 4, 1, NULL),
	(71, 11, 'petfood5', 6, 2, NULL),
	(72, 11, 'purpleneon', 7, 1, NULL);

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

-- Dumping structure for table worldisyours.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.crypto: ~0 rows (approximately)
INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('qbit', 1226, '[{"PreviousWorth":1216,"NewWorth":1226},{"PreviousWorth":1216,"NewWorth":1226},{"PreviousWorth":1216,"NewWorth":1226},{"PreviousWorth":1226,"NewWorth":1226}]');

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

-- Dumping data for table worldisyours.crypto_transactions: ~5 rows (approximately)
INSERT INTO `crypto_transactions` (`id`, `citizenid`, `title`, `message`, `date`) VALUES
	(1, 'OUV63962', 'Buy', 'You bought 500000 BTC(s)', '2024-09-23 16:04:00'),
	(2, 'JXD83837', 'Buy', 'You bought 988 BTC(s)', '2024-09-24 15:11:55'),
	(3, 'QNC46912', 'Buy', 'You bought 1001 BTC(s)', '2024-10-09 17:03:05'),
	(4, 'QNC46912', 'Buy', 'You bought 3003 BTC(s)', '2024-10-09 17:03:28'),
	(5, 'QNC46912', 'Sell/Transfer', 'You sold 4 BTC(s)', '2024-10-10 03:40:15');

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

-- Dumping structure for table worldisyours.dealership_data
CREATE TABLE IF NOT EXISTS `dealership_data` (
  `name` varchar(100) NOT NULL,
  `label` varchar(255) NOT NULL,
  `balance` float NOT NULL DEFAULT 0,
  `owner_id` varchar(255) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `employee_commission` int(11) DEFAULT 10,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.dealership_data: ~5 rows (approximately)
INSERT INTO `dealership_data` (`name`, `label`, `balance`, `owner_id`, `owner_name`, `employee_commission`) VALUES
	('air', '', 0, NULL, NULL, 10),
	('boats', '', 0, NULL, NULL, 10),
	('pdm', '', 0, NULL, NULL, 10),
	('truck', '', 0, NULL, NULL, 10),
	('WIY', 'TWIY Dealership', 750000, 'OUV63962', 'SBDemon Test', 10);

-- Dumping structure for table worldisyours.dealership_dispveh
CREATE TABLE IF NOT EXISTS `dealership_dispveh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealership` varchar(100) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `coords` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dispveh_dealership` (`dealership`),
  KEY `fk_dispveh_vehicle` (`vehicle`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.dealership_dispveh: ~4 rows (approximately)
INSERT INTO `dealership_dispveh` (`id`, `dealership`, `vehicle`, `color`, `coords`) VALUES
	(1, 'WIY', 'm4f82', '8', '{"x":-70.24809265136719,"y":71.2823486328125,"z":71.07707977294922,"w":159.3977508544922}'),
	(2, 'WIY', 'vanzhycade', '7', '{"x":-75.87223052978516,"y":73.9190902709961,"z":70.72942352294922,"w":127.40950775146485}'),
	(4, 'WIY', 'lbwk35', '8', '{"x":-65.05647277832031,"y":68.63192749023438,"z":70.91593170166016,"w":148.9819793701172}'),
	(6, 'WIY', 'GODzBMWS1000RR', '1', '{"x":-59.36717224121094,"y":65.40594482421875,"z":71.01105499267578,"w":137.8663330078125}');

-- Dumping structure for table worldisyours.dealership_employees
CREATE TABLE IF NOT EXISTS `dealership_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `dealership` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL,
  `joined` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_employees_dealership` (`dealership`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.dealership_employees: ~2 rows (approximately)
INSERT INTO `dealership_employees` (`id`, `identifier`, `dealership`, `role`, `joined`) VALUES
	(1, 'AIM07751', 'WIY', 'manager', '2024-10-09 17:35:01'),
	(2, 'AXW11242', 'WIY', 'manager', '2024-10-12 21:44:07');

-- Dumping structure for table worldisyours.dealership_orders
CREATE TABLE IF NOT EXISTS `dealership_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(100) NOT NULL,
  `dealership` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `cost` float NOT NULL DEFAULT 0,
  `delivery_time` int(11) NOT NULL,
  `order_created` datetime NOT NULL DEFAULT current_timestamp(),
  `fulfilled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `orders_vehicle_fk` (`vehicle`),
  KEY `orders_dealership_fk` (`dealership`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.dealership_orders: ~8 rows (approximately)
INSERT INTO `dealership_orders` (`id`, `vehicle`, `dealership`, `quantity`, `cost`, `delivery_time`, `order_created`, `fulfilled`) VALUES
	(1, 'demon', 'WIY', 1, 0.8, 1728519542, '2024-10-09 17:18:02', 1),
	(2, 'kgjoker', 'WIY', 1, 0.8, 1728519671, '2024-10-09 17:20:11', 1),
	(4, 'ramtrx6x6', 'WIY', 1, 0.8, 1728783891, '2024-10-12 18:43:51', 1),
	(5, 'crownbp', 'WIY', 1, 0.8, 1728784605, '2024-10-12 18:55:45', 1),
	(6, 'GODzRAMTRX6x6', 'WIY', 1, 0.8, 1728794334, '2024-10-12 21:37:54', 1),
	(7, 'Urus_Stretch_6', 'WIY', 1, 0.8, 1728794677, '2024-10-12 21:43:37', 1),
	(8, 'Urus_Stretch_6', 'WIY', 1, 0.8, 1728794810, '2024-10-12 21:45:50', 1),
	(9, 'Urus_Stretch_6', 'WIY', 1, 0.8, 1728794830, '2024-10-12 21:46:10', 1);

-- Dumping structure for table worldisyours.dealership_sales
CREATE TABLE IF NOT EXISTS `dealership_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealership` varchar(255) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `plate` varchar(255) NOT NULL,
  `player` varchar(255) NOT NULL,
  `seller` varchar(255) DEFAULT NULL,
  `purchase_type` varchar(50) NOT NULL,
  `paid` float NOT NULL DEFAULT 0,
  `owed` float NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_sales_vehicle` (`vehicle`),
  KEY `fk_sales_dealership` (`dealership`),
  KEY `fk_sales_player` (`player`),
  KEY `fk_sales_plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.dealership_sales: ~7 rows (approximately)
INSERT INTO `dealership_sales` (`id`, `dealership`, `vehicle`, `plate`, `player`, `seller`, `purchase_type`, `paid`, `owed`, `created_at`) VALUES
	(1, 'WIY', 'kgjoker', '0KU259EH', 'LPI62642', NULL, 'full', 1, 0, '2024-10-09 17:28:57'),
	(2, 'WIY', 'demon', '4AO749VP', 'LPI62642', NULL, 'full', 1, 0, '2024-10-09 17:31:06'),
	(3, 'pdm', 'cavalcade2', '3NK062SX', 'JVH49125', NULL, 'full', 1650000, 0, '2024-10-12 13:42:46'),
	(4, 'WIY', 'ramtrx6x6', '7RN352UB', 'AXW11242', NULL, 'full', 1, 0, '2024-10-12 18:47:52'),
	(5, 'WIY', 'crownbp', '2CX564XH', 'OUV63962', NULL, 'full', 1, 0, '2024-10-12 18:58:20'),
	(6, 'WIY', 'GODzRAMTRX6x6', '2PS473DF', 'OUV63962', NULL, 'full', 1, 0, '2024-10-12 21:40:19'),
	(7, 'WIY', 'Urus_Stretch_6', '7CX589TG', 'AXW11242', NULL, 'full', 1, 0, '2024-10-12 21:49:36');

-- Dumping structure for table worldisyours.dealership_stock
CREATE TABLE IF NOT EXISTS `dealership_stock` (
  `dealership` varchar(100) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`dealership`,`vehicle`),
  KEY `vehicle_fk` (`vehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.dealership_stock: ~960 rows (approximately)
INSERT INTO `dealership_stock` (`dealership`, `vehicle`, `stock`, `price`) VALUES
	('air', 'cargoplane', 0, 4500000),
	('air', 'conada', 0, 1150000),
	('air', 'cuban800', 0, 4500000),
	('air', 'dodo', 0, 4500000),
	('air', 'duster', 0, 4500000),
	('air', 'frogger', 0, 5200000),
	('air', 'frogger2', 0, 5200000),
	('air', 'havok', 0, 5200000),
	('air', 'luxor', 0, 4500000),
	('air', 'luxor2', 0, 4500000),
	('air', 'mammatus', 0, 4500000),
	('air', 'maverick', 0, 5200000),
	('air', 'microlight', 0, 4500000),
	('air', 'miljet', 0, 4500000),
	('air', 'nimbus', 0, 4500000),
	('air', 'seabreeze', 0, 4500000),
	('air', 'seasparrow', 0, 5200000),
	('air', 'seasparrow2', 0, 5200000),
	('air', 'shamal', 0, 4500000),
	('air', 'stunt', 0, 4500000),
	('air', 'supervolito', 0, 5200000),
	('air', 'supervolito2', 0, 5200000),
	('air', 'swift', 0, 5200000),
	('air', 'swift2', 0, 5200000),
	('air', 'velum', 0, 4500000),
	('air', 'velum2', 0, 4500000),
	('air', 'vestra', 0, 4500000),
	('air', 'volatus', 0, 5200000),
	('boats', 'dinghy', 0, 400000),
	('boats', 'dinghy2', 0, 400000),
	('boats', 'dinghy3', 0, 400000),
	('boats', 'dinghy4', 0, 400000),
	('boats', 'jetmax', 0, 400000),
	('boats', 'longfin', 0, 400000),
	('boats', 'marquis', 0, 400000),
	('boats', 'seashark', 0, 400000),
	('boats', 'seashark3', 0, 400000),
	('boats', 'speeder', 0, 400000),
	('boats', 'speeder2', 0, 400000),
	('boats', 'squalo', 0, 400000),
	('boats', 'suntrap', 0, 400000),
	('boats', 'toro', 0, 400000),
	('boats', 'toro2', 0, 400000),
	('boats', 'tropic', 0, 400000),
	('boats', 'tropic2', 0, 400000),
	('pdm', '16topcargle', 0, 1000000),
	('pdm', '18Velar', 0, 1000000),
	('pdm', '19gv80', 0, 1000000),
	('pdm', '2019tundrac', 0, 1000000),
	('pdm', '2020CLA45s', 0, 1000000),
	('pdm', '21rsq8', 0, 1000000),
	('pdm', '350z', 0, 1000000),
	('pdm', '356a', 0, 1000000),
	('pdm', '74civrswb', 0, 1000000),
	('pdm', '812mnsry', 0, 1000000),
	('pdm', 'a80', 0, 1000000),
	('pdm', 'aaq4', 0, 1000000),
	('pdm', 'adder', 0, 2600000),
	('pdm', 'aerox155', 0, 1000000),
	('pdm', 'akuma', 0, 1405000),
	('pdm', 'alpha', 0, 1060000),
	('pdm', 'amarok', 0, 1000000),
	('pdm', 'asbo', 0, 800000),
	('pdm', 'asea', 0, 1000000),
	('pdm', 'asterope', 0, 1000000),
	('pdm', 'astron', 0, 1500000),
	('pdm', 'autarch', 0, 2480000),
	('pdm', 'avarus', 0, 1720000),
	('pdm', 'b63s', 0, 1000000),
	('pdm', 'bagger', 0, 1835000),
	('pdm', 'baller', 0, 1000000),
	('pdm', 'baller2', 0, 1500000),
	('pdm', 'baller3', 0, 1500000),
	('pdm', 'baller4', 0, 2900000),
	('pdm', 'baller7', 0, 1450000),
	('pdm', 'banshee', 0, 1120000),
	('pdm', 'banshee2', 0, 2400000),
	('pdm', 'bati', 0, 1155000),
	('pdm', 'bati2', 0, 1260000),
	('pdm', 'bati901', 0, 1000000),
	('pdm', 'benzc32', 0, 1000000),
	('pdm', 'benze55', 0, 1000000),
	('pdm', 'benzsl63', 0, 1000000),
	('pdm', 'bestiagts', 0, 1400000),
	('pdm', 'bf400', 0, 1855000),
	('pdm', 'bfinjection', 0, 1521000),
	('pdm', 'bifta', 0, 1619500),
	('pdm', 'bison', 0, 358200),
	('pdm', 'bjxl', 0, 1100000),
	('pdm', 'blade', 0, 1525000),
	('pdm', 'blazer', 0, 1267500),
	('pdm', 'blazer2', 0, 1183000),
	('pdm', 'blazer3', 0, 1183000),
	('pdm', 'blazer4', 0, 1560250),
	('pdm', 'blista', 0, 1100000),
	('pdm', 'blista2', 0, 1500000),
	('pdm', 'blista3', 0, 1500000),
	('pdm', 'bmwe39', 0, 1000000),
	('pdm', 'bmwg07', 0, 1000000),
	('pdm', 'bmx', 0, 31840),
	('pdm', 'bobcatxl', 0, 268650),
	('pdm', 'boor', 0, 1300000),
	('pdm', 'brawler', 0, 1760000),
	('pdm', 'brigham', 0, 1575000),
	('pdm', 'brioso', 0, 1550000),
	('pdm', 'brioso2', 0, 1250000),
	('pdm', 'brioso3', 0, 1250000),
	('pdm', 'broadway', 0, 2000000),
	('pdm', 'btype', 0, 1275000),
	('pdm', 'btype2', 0, 1479000),
	('pdm', 'btype3', 0, 1071000),
	('pdm', 'buccaneer', 0, 1375000),
	('pdm', 'buccaneer2', 0, 1675000),
	('pdm', 'buffalo', 0, 1750000),
	('pdm', 'buffalo2', 0, 1900000),
	('pdm', 'buffalo4', 0, 1175000),
	('pdm', 'buffalo5', 0, 1537500),
	('pdm', 'bullet', 0, 2400000),
	('pdm', 'burrito3', 0, 796000),
	('pdm', 'c63scpd', 0, 1000000),
	('pdm', 'calico', 0, 1800000),
	('pdm', 'caracara2', 0, 1352000),
	('pdm', 'carbonizzare', 0, 1100000),
	('pdm', 'carbonrs', 0, 1620000),
	('pdm', 'casco', 0, 1700000),
	('pdm', 'cavalcade', 0, 1400000),
	('pdm', 'cavalcade2', 0, 1650000),
	('pdm', 'cayennemecqq', 0, 1000000),
	('pdm', 'cb650r', 0, 1000000),
	('pdm', 'champion', 0, 2050000),
	('pdm', 'cheburek', 0, 1190000),
	('pdm', 'cheetah', 0, 2280000),
	('pdm', 'cheetah2', 0, 2900000),
	('pdm', 'chimera', 0, 1350000),
	('pdm', 'chino', 0, 1500000),
	('pdm', 'chino2', 0, 1200000),
	('pdm', 'cinquemila', 0, 2250000),
	('pdm', 'civic2020', 0, 1000000),
	('pdm', 'claw', 0, 1000000),
	('pdm', 'cliffhanger', 0, 1008000),
	('pdm', 'clique', 0, 1000000),
	('pdm', 'clique2', 0, 1248500),
	('pdm', 'cls500w219', 0, 1000000),
	('pdm', 'club', 0, 800000),
	('pdm', 'cog55', 0, 1500000),
	('pdm', 'cogcabrio', 0, 1300000),
	('pdm', 'cognoscenti', 0, 1600000),
	('pdm', 'comet2', 0, 2600000),
	('pdm', 'comet3', 0, 1500000),
	('pdm', 'comet4', 0, 2200000),
	('pdm', 'comet5', 0, 1100000),
	('pdm', 'comet6', 0, 2600000),
	('pdm', 'comet7', 0, 1500000),
	('pdm', 'contender', 0, 1500000),
	('pdm', 'coquette', 0, 1900000),
	('pdm', 'coquette2', 0, 1805000),
	('pdm', 'coquette3', 0, 1700000),
	('pdm', 'coquette4', 0, 2400000),
	('pdm', 'corsita', 0, 1800000),
	('pdm', 'coureur', 0, 2980000),
	('pdm', 'cruiser', 0, 10109),
	('pdm', 'cyclone', 0, 3000000),
	('pdm', 'cypher', 0, 2100000),
	('pdm', 'daemon', 0, 1940000),
	('pdm', 'daemon2', 0, 1030000),
	('pdm', 'deathbike', 0, 1570000),
	('pdm', 'defiler', 0, 1780000),
	('pdm', 'deity', 0, 2050000),
	('pdm', 'deveste', 0, 3680000),
	('pdm', 'deviant', 0, 1050000),
	('pdm', 'diablous', 0, 1150000),
	('pdm', 'diablous2', 0, 1880000),
	('pdm', 'dilettante', 0, 800000),
	('pdm', 'dilettante2', 0, 1200000),
	('pdm', 'DL_G900', 0, 1000000),
	('pdm', 'dominator', 0, 1375000),
	('pdm', 'dominator2', 0, 1500000),
	('pdm', 'dominator3', 0, 1050000),
	('pdm', 'dominator7', 0, 1000000),
	('pdm', 'dominator8', 0, 1200000),
	('pdm', 'double', 0, 1200000),
	('pdm', 'drafter', 0, 1600000),
	('pdm', 'draugur', 0, 1679100),
	('pdm', 'dubsta', 0, 1900000),
	('pdm', 'dubsta2', 0, 1950000),
	('pdm', 'dubsta3', 0, 1746000),
	('pdm', 'dukes', 0, 1525000),
	('pdm', 'dukes3', 0, 1750000),
	('pdm', 'dune', 0, 1366000),
	('pdm', 'dvc63darwin', 0, 1000000),
	('pdm', 'dynasty', 0, 2250000),
	('pdm', 'e39touring', 0, 1000000),
	('pdm', 'e500', 0, 1000000),
	('pdm', 'e55', 0, 1000000),
	('pdm', 'elegy', 0, 1900000),
	('pdm', 'elegy2', 0, 1000000),
	('pdm', 'eli', 0, 1000000),
	('pdm', 'ellie', 0, 1337500),
	('pdm', 'emerus', 0, 2400000),
	('pdm', 'emperor', 0, 1000000),
	('pdm', 'enduro', 0, 1300000),
	('pdm', 'entity2', 0, 3280000),
	('pdm', 'entity3', 0, 3000000),
	('pdm', 'entityxf', 0, 3600000),
	('pdm', 'esskey', 0, 1350000),
	('pdm', 'eudora', 0, 1700000),
	('pdm', 'euros', 0, 1600000),
	('pdm', 'everon', 0, 1014000),
	('pdm', 'everon2', 0, 1600000),
	('pdm', 'exemplar', 0, 2000000),
	('pdm', 'f620', 0, 1250000),
	('pdm', 'faction', 0, 1550000),
	('pdm', 'faction2', 0, 1850000),
	('pdm', 'faction3', 0, 1250000),
	('pdm', 'fagaloa', 0, 2210000),
	('pdm', 'faggio', 0, 1100000),
	('pdm', 'faggio2', 0, 1050000),
	('pdm', 'faggio3', 0, 1680000),
	('pdm', 'fcr', 0, 1150000),
	('pdm', 'fcr2', 0, 1620000),
	('pdm', 'felon', 0, 1100000),
	('pdm', 'felon2', 0, 1700000),
	('pdm', 'feltzer2', 0, 1940000),
	('pdm', 'feltzer3', 0, 1955000),
	('pdm', 'fixter', 0, 44750),
	('pdm', 'flashgt', 0, 1600000),
	('pdm', 'fmj', 0, 2500000),
	('pdm', 'fortwo17', 0, 1000000),
	('pdm', 'fq2', 0, 1850000),
	('pdm', 'freecrawler', 0, 1056000),
	('pdm', 'fugitive', 0, 1200000),
	('pdm', 'furia', 0, 2600000),
	('pdm', 'furoregt', 0, 1560000),
	('pdm', 'futo', 0, 1750000),
	('pdm', 'futo2', 0, 2000000),
	('pdm', 'g63', 0, 1000000),
	('pdm', 'gargoyle', 0, 1450000),
	('pdm', 'gauntlet', 0, 1275000),
	('pdm', 'gauntlet2', 0, 1050000),
	('pdm', 'gauntlet3', 0, 1125000),
	('pdm', 'gauntlet4', 0, 1200000),
	('pdm', 'gauntlet5', 0, 1800000),
	('pdm', 'gauntlet6', 0, 2620000),
	('pdm', 'gb200', 0, 1800000),
	('pdm', 'gburrito2', 0, 228450),
	('pdm', 'gl63', 0, 1000000),
	('pdm', 'glendale', 0, 950000),
	('pdm', 'glendale2', 0, 900000),
	('pdm', 'golf1', 0, 1000000),
	('pdm', 'golf7', 0, 1000000),
	('pdm', 'golf91wideprzemo', 0, 1000000),
	('pdm', 'gp1', 0, 3200000),
	('pdm', 'granger', 0, 2200000),
	('pdm', 'granger2', 0, 2210000),
	('pdm', 'greenwood', 0, 1350000),
	('pdm', 'gresley', 0, 1500000),
	('pdm', 'growler', 0, 2100000),
	('pdm', 'gt500', 0, 2210000),
	('pdm', 'habanero', 0, 2000000),
	('pdm', 'hakuchou', 0, 1300000),
	('pdm', 'hakuchou2', 0, 1350000),
	('pdm', 'hellcatf9', 0, 1000000),
	('pdm', 'hellcatlb', 0, 1000000),
	('pdm', 'hellion', 0, 1412000),
	('pdm', 'hermes', 0, 1025000),
	('pdm', 'hexer', 0, 1035000),
	('pdm', 'hotknife', 0, 1350000),
	('pdm', 'huntley', 0, 2450000),
	('pdm', 'hustler', 0, 1425000),
	('pdm', 'ignus', 0, 2240000),
	('pdm', 'imorgon', 0, 2400000),
	('pdm', 'impaler', 0, 1525000),
	('pdm', 'impaler3', 0, 1525000),
	('pdm', 'imperator', 0, 1325000),
	('pdm', 'imperator3', 0, 1425000),
	('pdm', 'inductor', 0, 10950),
	('pdm', 'inductor2', 0, 99500),
	('pdm', 'infernus', 0, 3700000),
	('pdm', 'infernus2', 0, 2165000),
	('pdm', 'ingot', 0, 1000000),
	('pdm', 'innovation', 0, 1400000),
	('pdm', 'intruder', 0, 1800000),
	('pdm', 'issi2', 0, 1100000),
	('pdm', 'issi7', 0, 800000),
	('pdm', 'issi8', 0, 2000000),
	('pdm', 'italigtb', 0, 2400000),
	('pdm', 'italigtb2', 0, 3000000),
	('pdm', 'italigto', 0, 1200000),
	('pdm', 'italirsx', 0, 1200000),
	('pdm', 'iwagen', 0, 2250000),
	('pdm', 'jackal', 0, 1900000),
	('pdm', 'jester', 0, 2645000),
	('pdm', 'jester2', 0, 1200000),
	('pdm', 'jester3', 0, 1700000),
	('pdm', 'jester4', 0, 2800000),
	('pdm', 'journey', 0, 129350),
	('pdm', 'journey2', 0, 139350),
	('pdm', 'jubilee', 0, 1550000),
	('pdm', 'jugular', 0, 1600000),
	('pdm', 'kalahari', 0, 1366000),
	('pdm', 'kamacho', 0, 1450000),
	('pdm', 'kanjo', 0, 1500000),
	('pdm', 'kanjosj', 0, 1430000),
	('pdm', 'khamelion', 0, 1800000),
	('pdm', 'komoda', 0, 1100000),
	('pdm', 'krieger', 0, 4440000),
	('pdm', 'kuruma', 0, 1440000),
	('pdm', 'l35', 0, 1822300),
	('pdm', 'landstalker', 0, 1200000),
	('pdm', 'landstalker2', 0, 2600000),
	('pdm', 'le7b', 0, 2200000),
	('pdm', 'lectro', 0, 1410000),
	('pdm', 'lm87', 0, 3100000),
	('pdm', 'locust', 0, 1000000),
	('pdm', 'lurcher', 0, 1150000),
	('pdm', 'lynx', 0, 1000000),
	('pdm', 'm3e92', 0, 1000000),
	('pdm', 'm4lb2', 0, 1000000),
	('pdm', 'm5cs22', 0, 1000000),
	('pdm', 'm5e60', 0, 1000000),
	('pdm', 'mamba', 0, 2380000),
	('pdm', 'manana', 0, 1600000),
	('pdm', 'manana2', 0, 1200000),
	('pdm', 'manchez', 0, 1350000),
	('pdm', 'manchez2', 0, 1150000),
	('pdm', 'manchez3', 0, 1150000),
	('pdm', 'massacro', 0, 2200000),
	('pdm', 'massacro2', 0, 1600000),
	('pdm', 'maybach', 0, 1000000),
	('pdm', 'merse63', 0, 1000000),
	('pdm', 'mesa', 0, 1028000),
	('pdm', 'mesa3', 0, 1760000),
	('pdm', 'michelli', 0, 2100000),
	('pdm', 'minivan', 0, 139300),
	('pdm', 'minivan2', 0, 199000),
	('pdm', 'mlbrabus', 0, 1000000),
	('pdm', 'monroe', 0, 1955000),
	('pdm', 'monstrociti', 0, 1112000),
	('pdm', 'moonbeam', 0, 258900),
	('pdm', 'moonbeam2', 0, 298500),
	('pdm', 'mule2', 0, 796000),
	('pdm', 'mule3', 0, 806000),
	('pdm', 'nebula', 0, 2740000),
	('pdm', 'nemesis', 0, 1300000),
	('pdm', 'neo', 0, 1600000),
	('pdm', 'neon', 0, 2500000),
	('pdm', 'nero', 0, 4000000),
	('pdm', 'nero2', 0, 3200000),
	('pdm', 'nightblade', 0, 1830000),
	('pdm', 'ninef', 0, 1900000),
	('pdm', 'ninef2', 0, 2100000),
	('pdm', 'nissantitan17', 0, 1000000),
	('pdm', 'novak', 0, 2000000),
	('pdm', 'omnis', 0, 1800000),
	('pdm', 'omnisegt', 0, 2700000),
	('pdm', 'oppressor', 0, 1000000),
	('pdm', 'oracle', 0, 1200000),
	('pdm', 'oracle2', 0, 1800000),
	('pdm', 'osiris', 0, 4400000),
	('pdm', 'outlaw', 0, 2535000),
	('pdm', 'panamturs21', 0, 1000000),
	('pdm', 'panthere', 0, 1100000),
	('pdm', 'panto', 0, 750000),
	('pdm', 'paradise', 0, 179100),
	('pdm', 'pariah', 0, 1800000),
	('pdm', 'patriot', 0, 2100000),
	('pdm', 'patriot2', 0, 2100000),
	('pdm', 'patriot3', 0, 2700000),
	('pdm', 'pcj', 0, 1200000),
	('pdm', 'penetrator', 0, 3600000),
	('pdm', 'penumbra', 0, 1400000),
	('pdm', 'penumbra2', 0, 1000000),
	('pdm', 'peyote', 0, 1995000),
	('pdm', 'peyote2', 0, 1800000),
	('pdm', 'peyote3', 0, 2160000),
	('pdm', 'pfister811', 0, 4400000),
	('pdm', 'phoenix', 0, 1750000),
	('pdm', 'picador', 0, 1000000),
	('pdm', 'pigalle', 0, 1564000),
	('pdm', 'por911gt3', 0, 1000000),
	('pdm', 'postlude', 0, 1000000),
	('pdm', 'powersurge', 0, 1470000),
	('pdm', 'prairie', 0, 1200000),
	('pdm', 'premier', 0, 1550000),
	('pdm', 'previon', 0, 1490000),
	('pdm', 'primo', 0, 1350000),
	('pdm', 'primo2', 0, 1500000),
	('pdm', 'prototipo', 0, 3700000),
	('pdm', 'q8prior', 0, 1000000),
	('pdm', 'r300', 0, 1120000),
	('pdm', 'radi', 0, 1800000),
	('pdm', 'rancherxl', 0, 1056000),
	('pdm', 'rapger19', 0, 1000000),
	('pdm', 'rapidgt', 0, 1720000),
	('pdm', 'rapidgt2', 0, 1840000),
	('pdm', 'rapidgt3', 0, 1530000),
	('pdm', 'raptor', 0, 1800000),
	('pdm', 'ratbike', 0, 1250000),
	('pdm', 'ratel', 0, 1363100),
	('pdm', 'ratloader2', 0, 1000000),
	('pdm', 'reaper', 0, 2000000),
	('pdm', 'rebel2', 0, 1380000),
	('pdm', 'rebla', 0, 2100000),
	('pdm', 'reever', 0, 1218000),
	('pdm', 'regina', 0, 1200000),
	('pdm', 'remus', 0, 2600000),
	('pdm', 'retinue', 0, 2440000),
	('pdm', 'retinue2', 0, 2440000),
	('pdm', 'revolter', 0, 1900000),
	('pdm', 'rhapsody', 0, 1000000),
	('pdm', 'rhinehart', 0, 1050000),
	('pdm', 'riata', 0, 1412000),
	('pdm', 'rmodgt63', 0, 1000000),
	('pdm', 'rocoto', 0, 1300000),
	('pdm', 'rr01', 0, 1000000),
	('pdm', 'rs6rabt20', 0, 1000000),
	('pdm', 'rs7bratwa', 0, 1000000),
	('pdm', 'rt3000', 0, 1300000),
	('pdm', 'ruffian', 0, 1200000),
	('pdm', 'ruiner', 0, 1350000),
	('pdm', 'ruiner4', 0, 1575000),
	('pdm', 'rumpo', 0, 179100),
	('pdm', 'rumpo3', 0, 388050),
	('pdm', 'ruston', 0, 2600000),
	('pdm', 'RYGBus', 0, 1000000),
	('pdm', 's80', 0, 3100000),
	('pdm', 'sabregt', 0, 1450000),
	('pdm', 'sabregt2', 0, 1975000),
	('pdm', 'sadler', 0, 1000000),
	('pdm', 'sanchez', 0, 1155000),
	('pdm', 'sanchez2', 0, 1155000),
	('pdm', 'sanctus', 0, 1450000),
	('pdm', 'sandking', 0, 1225000),
	('pdm', 'sandking2', 0, 1412000),
	('pdm', 'savestra', 0, 1139000),
	('pdm', 'sc1', 0, 3800000),
	('pdm', 'schafter2', 0, 1700000),
	('pdm', 'schafter3', 0, 2000000),
	('pdm', 'schafter4', 0, 2200000),
	('pdm', 'schlagen', 0, 2200000),
	('pdm', 'schwarzer', 0, 2400000),
	('pdm', 'scorcher', 0, 55600),
	('pdm', 'seminole', 0, 2000000),
	('pdm', 'seminole2', 0, 1300000),
	('pdm', 'sentinel', 0, 2000000),
	('pdm', 'sentinel2', 0, 1300000),
	('pdm', 'sentinel3', 0, 1000000),
	('pdm', 'sentinel4', 0, 2800000),
	('pdm', 'serrano', 0, 1800000),
	('pdm', 'seven70', 0, 2800000),
	('pdm', 'sheava', 0, 3400000),
	('pdm', 'shinobi', 0, 1470000),
	('pdm', 'shotaro', 0, 1720000),
	('pdm', 'slamvan', 0, 1500000),
	('pdm', 'slamvan2', 0, 1350000),
	('pdm', 'slamvan3', 0, 1550000),
	('pdm', 'sm722', 0, 2500000),
	('pdm', 'sovereign', 0, 1680000),
	('pdm', 'specter', 0, 2200000),
	('pdm', 'speedo4', 0, 199000),
	('pdm', 'speedo5', 0, 475200),
	('pdm', 'stafford', 0, 1200000),
	('pdm', 'stalion', 0, 1950000),
	('pdm', 'stalion2', 0, 1000000),
	('pdm', 'stanier', 0, 1900000),
	('pdm', 'stinger', 0, 2715000),
	('pdm', 'stingergt', 0, 1190000),
	('pdm', 'stingertt', 0, 2760000),
	('pdm', 'stratum', 0, 1800000),
	('pdm', 'streiter', 0, 2000000),
	('pdm', 'stretch', 0, 2000000),
	('pdm', 'stryder', 0, 1350000),
	('pdm', 'sugoi', 0, 1700000),
	('pdm', 'sultan', 0, 1000000),
	('pdm', 'sultan2', 0, 1100000),
	('pdm', 'sultan3', 0, 1120000),
	('pdm', 'sultanrs', 0, 1530000),
	('pdm', 'superd', 0, 1600000),
	('pdm', 'surano', 0, 1600000),
	('pdm', 'surfer', 0, 298500),
	('pdm', 'surfer3', 0, 298050),
	('pdm', 'surge', 0, 1550000),
	('pdm', 'swinger', 0, 1757000),
	('pdm', 't20', 0, 3300000),
	('pdm', 'taco', 0, 897000),
	('pdm', 'tahoma', 0, 1200000),
	('pdm', 'tailgater', 0, 1500000),
	('pdm', 'tailgater2', 0, 2000000),
	('pdm', 'taipan', 0, 3700000),
	('pdm', 'tampa', 0, 1675000),
	('pdm', 'tampa2', 0, 1275000),
	('pdm', 'tempesta', 0, 2400000),
	('pdm', 'tenf', 0, 2700000),
	('pdm', 'tenf2', 0, 2300000),
	('pdm', 'tezeract', 0, 3400000),
	('pdm', 'thrax', 0, 3600000),
	('pdm', 'thrust', 0, 1780000),
	('pdm', 'tigon', 0, 4800000),
	('pdm', 'torero', 0, 1428000),
	('pdm', 'torero2', 0, 3900000),
	('pdm', 'tornado', 0, 1570000),
	('pdm', 'tornado2', 0, 1750000),
	('pdm', 'tornado5', 0, 1740000),
	('pdm', 'toros', 0, 2500000),
	('pdm', 'tribike', 0, 99500),
	('pdm', 'tribike2', 0, 13990),
	('pdm', 'tribike3', 0, 10368),
	('pdm', 'trophytruck', 0, 1014000),
	('pdm', 'trophytruck2', 0, 1352000),
	('pdm', 'tropos', 0, 1300000),
	('pdm', 'tulip', 0, 1200000),
	('pdm', 'tulip2', 0, 1000000),
	('pdm', 'turismo2', 0, 1890000),
	('pdm', 'turismor', 0, 2800000),
	('pdm', 'tyrant', 0, 4200000),
	('pdm', 'tyrus', 0, 4600000),
	('pdm', 'vacca', 0, 3100000),
	('pdm', 'vader', 0, 1620000),
	('pdm', 'vagner', 0, 3320000),
	('pdm', 'vagrant', 0, 1450000),
	('pdm', 'vamos', 0, 1500000),
	('pdm', 'vectre', 0, 1600000),
	('pdm', 'verlierer2', 0, 1810000),
	('pdm', 'verus', 0, 1380000),
	('pdm', 'vigero', 0, 1925000),
	('pdm', 'vigero2', 0, 1425000),
	('pdm', 'vindicator', 0, 1200000),
	('pdm', 'virgo', 0, 1300000),
	('pdm', 'virgo2', 0, 1150000),
	('pdm', 'virgo3', 0, 1150000),
	('pdm', 'virtue', 0, 2440000),
	('pdm', 'visione', 0, 1500000),
	('pdm', 'voltic', 0, 2400000),
	('pdm', 'voltic2', 0, 1966080),
	('pdm', 'voodoo', 0, 1950000),
	('pdm', 'vortex', 0, 1725000),
	('pdm', 'vstr', 0, 1600000),
	('pdm', 'warrener', 0, 1100000),
	('pdm', 'washington', 0, 1400000),
	('pdm', 'weevil', 0, 1100000),
	('pdm', 'weevil2', 0, 1210000),
	('pdm', 'windsor', 0, 1700000),
	('pdm', 'windsor2', 0, 2400000),
	('pdm', 'winky', 0, 1690000),
	('pdm', 'wolfsbane', 0, 1825000),
	('pdm', 'xa21', 0, 3600000),
	('pdm', 'xls', 0, 1700000),
	('pdm', 'yosemite', 0, 1925000),
	('pdm', 'yosemite2', 0, 1250000),
	('pdm', 'yosemite3', 0, 1182500),
	('pdm', 'youga', 0, 159200),
	('pdm', 'youga2', 0, 288050),
	('pdm', 'youga3', 0, 179100),
	('pdm', 'youga4', 0, 169500),
	('pdm', 'z190', 0, 1326000),
	('pdm', 'zeno', 0, 2700000),
	('pdm', 'zentorno', 0, 2800000),
	('pdm', 'zion', 0, 2200000),
	('pdm', 'zion2', 0, 1800000),
	('pdm', 'zion3', 0, 1650000),
	('pdm', 'zombiea', 0, 1350000),
	('pdm', 'zombieb', 0, 1670000),
	('pdm', 'zorrusso', 0, 3540000),
	('pdm', 'zr350', 0, 1600000),
	('pdm', 'ztype', 0, 1590000),
	('truck', 'airtug', 0, 1500000),
	('truck', 'benson', 0, 550000),
	('truck', 'biff', 0, 1000000),
	('truck', 'boxville', 0, 897000),
	('truck', 'boxville2', 0, 907000),
	('truck', 'boxville3', 0, 937000),
	('truck', 'boxville4', 0, 957000),
	('truck', 'bulldozer', 0, 1470000),
	('truck', 'caddy2', 0, 1270000),
	('truck', 'caddy3', 0, 1470000),
	('truck', 'cutter', 0, 1070000),
	('truck', 'docktug', 0, 1000000),
	('truck', 'dump', 0, 1270000),
	('truck', 'flatbed', 0, 1070000),
	('truck', 'forklift', 0, 1500000),
	('truck', 'guardian', 0, 1970000),
	('truck', 'handler', 0, 1670000),
	('truck', 'hauler', 0, 1000000),
	('truck', 'hauler2', 0, 1000000),
	('truck', 'mixer', 0, 1870000),
	('truck', 'mixer2', 0, 1070000),
	('truck', 'mower', 0, 1000000),
	('truck', 'mule', 0, 400000),
	('truck', 'mule4', 0, 400000),
	('truck', 'mule5', 0, 400000),
	('truck', 'packer', 0, 1000000),
	('truck', 'phantom', 0, 1000000),
	('truck', 'phantom3', 0, 1100000),
	('truck', 'pony', 0, 105000),
	('truck', 'pony2', 0, 110000),
	('truck', 'pounder', 0, 550000),
	('truck', 'pounder2', 0, 550000),
	('truck', 'ripley', 0, 1000000),
	('truck', 'rubble', 0, 1670000),
	('truck', 'scrap', 0, 1470000),
	('truck', 'slamtruck', 0, 1990000),
	('truck', 'stockade', 0, 1000000),
	('truck', 'tiptruck', 0, 1470000),
	('truck', 'tiptruck2', 0, 1270000),
	('truck', 'towtruck', 0, 1070000),
	('truck', 'towtruck2', 0, 1270000),
	('truck', 'tractor', 0, 1270000),
	('truck', 'tractor2', 0, 1470000),
	('truck', 'tractor3', 0, 1670000),
	('truck', 'utillitruck', 0, 1670000),
	('truck', 'utillitruck2', 0, 1870000),
	('truck', 'utillitruck3', 0, 1070000),
	('WIY', '1500ghoul', 0, 1),
	('WIY', '16charger', 0, 1),
	('WIY', '17m760i', 0, 1000000),
	('WIY', '17mansorypnmr', 0, 1),
	('WIY', '18performante', 0, 1),
	('WIY', '18rs7', 0, 1000000),
	('WIY', '2018s650p', 0, 1),
	('WIY', '2019chiron', 0, 1),
	('WIY', '20xb7', 0, 1000000),
	('WIY', '21sierra', 0, 1),
	('WIY', '22arturac', 0, 1000000),
	('WIY', '22m5', 0, 1000000),
	('WIY', '2ncsbmwm8', 0, 1000000),
	('WIY', '2ncsx7', 0, 1),
	('WIY', '488', 0, 1),
	('WIY', '488sp', 0, 1),
	('WIY', '600ltwb', 0, 1),
	('WIY', '6x6', 0, 1000000),
	('WIY', '77monte', 0, 1000000),
	('WIY', '911turbos', 0, 1),
	('WIY', 'a90sh', 0, 1),
	('WIY', 'alpinab7BLACKEDITION', 0, 1),
	('WIY', 'AmgGtrLight', 0, 1),
	('WIY', 'amrevu23mg', 0, 1),
	('WIY', 'autobio', 0, 1),
	('WIY', 'ben17', 0, 1),
	('WIY', 'bentaygam', 0, 1),
	('WIY', 'br900m', 0, 1),
	('WIY', 'brz13varis', 0, 1000000),
	('WIY', 'c8p1', 0, 1),
	('WIY', 'centuria', 0, 1),
	('WIY', 'chironspeedhunter', 0, 1),
	('WIY', 'chironsuper', 0, 1000000),
	('WIY', 'chironsupersport22', 0, 1),
	('WIY', 'choilambo', 0, 1),
	('WIY', 'ckbmwm4offwhite', 0, 1),
	('WIY', 'ckdrivingschool', 0, 1),
	('WIY', 'ckm3e36', 0, 1),
	('WIY', 'cls19', 0, 1),
	('WIY', 'crownbp', 0, 1),
	('WIY', 'cx30wz', 0, 1),
	('WIY', 'dawnonyx', 0, 1),
	('WIY', 'dc_sl63mansory', 0, 1),
	('WIY', 'demon', 0, 1),
	('WIY', 'e63s', 0, 1),
	('WIY', 'e63test', 0, 1),
	('WIY', 'e92bb', 0, 1),
	('WIY', 'eleanor', 0, 1),
	('WIY', 'escaladeprime', 0, 1),
	('WIY', 'eve', 0, 1),
	('WIY', 'evo9', 0, 1000000),
	('WIY', 'evoz', 0, 1),
	('WIY', 'evoz1', 0, 1),
	('WIY', 'f12rp', 0, 1),
	('WIY', 'f450c', 0, 1),
	('WIY', 'f550rbc', 0, 1),
	('WIY', 'f812', 0, 1),
	('WIY', 'fd370z', 0, 1),
	('WIY', 'fenyrsupersport', 0, 1),
	('WIY', 'ferrari812super', 0, 1),
	('WIY', 'fgt', 0, 1),
	('WIY', 'fk8', 0, 1),
	('WIY', 'flhxs_streetglide_special18', 0, 1),
	('WIY', 'forgt50020', 0, 1),
	('WIY', 'fpaceprior', 0, 1),
	('WIY', 'furai', 0, 1),
	('WIY', 'fxxk', 0, 1),
	('WIY', 'fxxkevo', 0, 1),
	('WIY', 'g63c', 0, 1),
	('WIY', 'G63Sam', 0, 1),
	('WIY', 'G65', 0, 1),
	('WIY', 'g700brabusretuned', 0, 1),
	('WIY', 'g81hr', 0, 1),
	('WIY', 'g900przemo6x6', 0, 1),
	('WIY', 'gcma4sedan2021', 0, 1),
	('WIY', 'gcmlamboultimae', 0, 1),
	('WIY', 'gcram1500', 0, 1000000),
	('WIY', 'gemera', 0, 1),
	('WIY', 'gfuckedsupra', 0, 1),
	('WIY', 'giulia_2021', 0, 1),
	('WIY', 'gmcev2', 0, 1),
	('WIY', 'GODz95GSX', 0, 1),
	('WIY', 'GODzBMWS1000RR', 0, 1),
	('WIY', 'GODzDRIFTCAT', 0, 1),
	('WIY', 'GODzKSTERZOTACHA', 0, 1),
	('WIY', 'GODzNINJAH2', 0, 1),
	('WIY', 'GODzOOF6x6', 0, 1),
	('WIY', 'GODzRAMTRX6x6', 0, 1),
	('WIY', 'GODzRB26SUBI', 0, 1),
	('WIY', 'GODzVIPS63AMG', 0, 1),
	('WIY', 'GODzYAMR1', 0, 1),
	('WIY', 'golf75r', 0, 1),
	('WIY', 'golf8gti', 0, 1),
	('WIY', 'gt17', 0, 1),
	('WIY', 'gt2rs', 0, 1),
	('WIY', 'gt3demon', 0, 1),
	('WIY', 'gt3hycade', 0, 1),
	('WIY', 'gt63', 0, 1),
	('WIY', 'gt63mt', 0, 1),
	('WIY', 'gt86trust', 0, 1),
	('WIY', 'gta5rp_veh_ferrari19', 0, 1),
	('WIY', 'gta5rp_veh_gle1', 0, 1),
	('WIY', 'gta5rp_veh_gtr33', 0, 1),
	('WIY', 'gto66c', 0, 1),
	('WIY', 'gtr50', 0, 1),
	('WIY', 'gtrh', 0, 1),
	('WIY', 'gtz34be', 0, 1),
	('WIY', 'gxone', 0, 1),
	('WIY', 'h2m', 0, 1),
	('WIY', 'hexerz2', 0, 1),
	('WIY', 'huracanpriorbeast', 0, 1),
	('WIY', 'hycadeevo', 0, 1),
	('WIY', 'Hycaders6', 0, 1),
	('WIY', 'hycadesti', 0, 1),
	('WIY', 'hycadeurus', 0, 1),
	('WIY', 'hyundaiveloster', 0, 1),
	('WIY', 'ikx3abt20', 0, 1),
	('WIY', 'ikx3mc2021', 0, 1),
	('WIY', 'ikx3rebel22', 0, 1),
	('WIY', 'impronta4', 0, 1),
	('WIY', 'jagoffroad', 0, 1),
	('WIY', 'jes21', 0, 1),
	('WIY', 'jesko', 0, 1),
	('WIY', 'kart', 0, 1),
	('WIY', 'kawagala', 0, 1),
	('WIY', 'kgc10', 0, 1),
	('WIY', 'kgjoker', 0, 1),
	('WIY', 'kln', 0, 1),
	('WIY', 'km1000rr', 0, 1),
	('WIY', 'lbperfs', 0, 1),
	('WIY', 'lbwk35', 0, 1),
	('WIY', 'lc500', 0, 1),
	('WIY', 'lpchopper2', 0, 1),
	('WIY', 'm135iwb', 0, 1),
	('WIY', 'm140iss', 0, 1),
	('WIY', 'm3e36', 0, 1),
	('WIY', 'm3e46', 0, 1),
	('WIY', 'm3g80mp', 0, 1000000),
	('WIY', 'm3s', 0, 1),
	('WIY', 'm4c', 0, 1),
	('WIY', 'M4CC', 0, 1),
	('WIY', 'm4f82', 0, 1),
	('WIY', 'm4speedhunter', 0, 1),
	('WIY', 'm6e24', 0, 1),
	('WIY', 'm8benzo', 0, 1),
	('WIY', 'mach1', 0, 1),
	('WIY', 'machewb', 0, 1),
	('WIY', 'manhartx7', 0, 1),
	('WIY', 'mans65', 0, 1),
	('WIY', 'manscountach', 0, 1),
	('WIY', 'mansgt', 0, 1),
	('WIY', 'manspana', 0, 1),
	('WIY', 'mansrs6', 0, 1),
	('WIY', 'manssupersnake', 0, 1),
	('WIY', 'mansurus', 0, 1),
	('WIY', 'mayg600p', 0, 1),
	('WIY', 'mercec63s', 0, 1),
	('WIY', 'mi8', 0, 1),
	('WIY', 'mk4hycade', 0, 1),
	('WIY', 'mlnovitec', 0, 1),
	('WIY', 'model3', 0, 1),
	('WIY', 'models', 0, 1),
	('WIY', 'modelx', 0, 1),
	('WIY', 'msls', 0, 1),
	('WIY', 'mteche39', 0, 1),
	('WIY', 'mustang65', 0, 1),
	('WIY', 'mv2019', 0, 1),
	('WIY', 'mxpan', 0, 1),
	('WIY', 'neonp1', 0, 1),
	('WIY', 'newsvan', 0, 1),
	('WIY', 'ninjah2', 0, 1),
	('WIY', 'nismo20', 0, 1),
	('WIY', 'nissanr36', 0, 1),
	('WIY', 'nitro10', 0, 1),
	('WIY', 'nitro11', 0, 1),
	('WIY', 'nitro4', 0, 1),
	('WIY', 'nitro5', 0, 1),
	('WIY', 'nitro7', 0, 1),
	('WIY', 'nitro8', 0, 1),
	('WIY', 'nitro9', 0, 1),
	('WIY', 'nsx17', 0, 1),
	('WIY', 'oycdefender', 0, 1),
	('WIY', 'oycgr', 0, 1),
	('WIY', 'p1lbwk', 0, 1),
	('WIY', 'p8tempus', 0, 1),
	('WIY', 'passat', 0, 1),
	('WIY', 'polestar1', 0, 1),
	('WIY', 'polo2018', 0, 1),
	('WIY', 'porche911speedhunter', 0, 1),
	('WIY', 'q8hycade', 0, 1),
	('WIY', 'r34h', 0, 1),
	('WIY', 'r355', 0, 1),
	('WIY', 'r35secret', 0, 1),
	('WIY', 'r36fp', 0, 1),
	('WIY', 'r820', 0, 1),
	('WIY', 'r8beastedit', 0, 1),
	('WIY', 'raid', 0, 1),
	('WIY', 'ramtrx6x6', 0, 1),
	('WIY', 'rculi', 0, 1),
	('WIY', 'rd', 0, 1),
	('WIY', 'rmod240sx', 0, 1),
	('WIY', 'rmodbentley1', 0, 1),
	('WIY', 'rmodcharger', 0, 1),
	('WIY', 'rmodcharger69', 0, 1),
	('WIY', 'rmode63s', 0, 1),
	('WIY', 'rmodf40', 0, 1),
	('WIY', 'rmodfordgt', 0, 1),
	('WIY', 'rmodg65', 0, 1),
	('WIY', 'rmodgtr', 0, 1),
	('WIY', 'rmodjeepg', 0, 1),
	('WIY', 'rmodm3e36', 0, 1),
	('WIY', 'rmodm3joker', 0, 1),
	('WIY', 'rmodm4', 0, 1),
	('WIY', 'rmodm4gts', 0, 1),
	('WIY', 'rmodm4Unikat', 0, 1),
	('WIY', 'rmodmk7', 0, 1),
	('WIY', 'rmodmustang', 0, 1),
	('WIY', 'rmodp1gtr', 0, 1),
	('WIY', 'rmodpagani', 0, 1),
	('WIY', 'rmodr50', 0, 1),
	('WIY', 'rmodr8alpil', 0, 1),
	('WIY', 'rmodr8alpilx', 0, 1),
	('WIY', 'rmodr8c', 0, 1),
	('WIY', 'rmodskyline34', 0, 1),
	('WIY', 'rmodsvj', 0, 1),
	('WIY', 'rmodx6', 0, 1),
	('WIY', 'rmodzl1', 0, 1),
	('WIY', 'rocket', 0, 1),
	('WIY', 'Rolls6x6', 0, 1),
	('WIY', 'RoyalCustome39m5_wb', 0, 1),
	('WIY', 'RoyalCustomKawasakiSH2', 0, 1),
	('WIY', 'rr21shelbystreet', 0, 1),
	('WIY', 'rrghostbyv', 0, 1),
	('WIY', 'rroctane', 0, 1),
	('WIY', 'rrphantom', 0, 1),
	('WIY', 'rrwraith', 0, 1),
	('WIY', 'rs322sedan', 0, 1),
	('WIY', 'rs4rk', 0, 1),
	('WIY', 'rs5mans', 0, 1),
	('WIY', 'rs615', 0, 1),
	('WIY', 'rs666', 0, 1),
	('WIY', 'rs6abt20', 0, 1),
	('WIY', 'rs6c8', 0, 1),
	('WIY', 'rs6_club77', 0, 1),
	('WIY', 'rs7', 0, 1),
	('WIY', 'rs721', 0, 1),
	('WIY', 'rs7beast', 0, 1),
	('WIY', 'rs7c821', 0, 1),
	('WIY', 'rs7c8beast', 0, 1),
	('WIY', 'rs7wide', 0, 1),
	('WIY', 'RufusVanquish', 0, 1),
	('WIY', 'rx7', 0, 1),
	('WIY', 'rx7veilside', 0, 1),
	('WIY', 's1', 0, 1),
	('WIY', 's15', 0, 1),
	('WIY', 's15lunar', 0, 1),
	('WIY', 's500w222', 0, 1),
	('WIY', 's63coupe', 0, 1),
	('WIY', 's63msc', 0, 1),
	('WIY', 's8d4', 0, 1),
	('WIY', 'scubieblob', 0, 1),
	('WIY', 'sema10X10', 0, 1),
	('WIY', 'senna', 0, 1),
	('WIY', 'sex6', 0, 1),
	('WIY', 'sf90', 0, 1),
	('WIY', 'sian', 0, 1),
	('WIY', 'silviagd', 0, 1),
	('WIY', 'sinacp', 0, 1),
	('WIY', 'singer', 0, 1),
	('WIY', 'skyline', 0, 1),
	('WIY', 'specialtf', 0, 1),
	('WIY', 'suprapandem', 0, 1),
	('WIY', 'swl', 0, 1),
	('WIY', 'taycan', 0, 1),
	('WIY', 'taycanani', 0, 1),
	('WIY', 'techart17', 0, 1),
	('WIY', 'terzo', 0, 1),
	('WIY', 'terzo1', 0, 1),
	('WIY', 'teslapd', 0, 1),
	('WIY', 'teslaroad', 0, 1),
	('WIY', 'topcargt63', 0, 1),
	('WIY', 'trx', 0, 1),
	('WIY', 'TTSTO', 0, 1),
	('WIY', 'urusbeastedit', 0, 1),
	('WIY', 'Urus_Stretch_6', 2, 1),
	('WIY', 'v60hr', 0, 1),
	('WIY', 'vanzhycade', 0, 1),
	('WIY', 'vanztt', 0, 1),
	('WIY', 'vanzur', 0, 1),
	('WIY', 'van_blacklions', 0, 1),
	('WIY', 'van_bloods', 0, 1),
	('WIY', 'van_bratwa', 0, 1),
	('WIY', 'van_brigada', 0, 1),
	('WIY', 'van_cali', 0, 1),
	('WIY', 'van_camorra', 0, 1),
	('WIY', 'van_club77', 0, 1),
	('WIY', 'van_criminals', 0, 1),
	('WIY', 'van_crips', 0, 1),
	('WIY', 'van_deparis', 0, 1),
	('WIY', 'van_galaxy', 0, 1),
	('WIY', 'van_gmbh', 0, 1),
	('WIY', 'van_gonzales', 0, 1),
	('WIY', 'van_grove', 0, 1),
	('WIY', 'van_hoover', 0, 1),
	('WIY', 'van_kadir', 0, 1),
	('WIY', 'van_lcn', 0, 1),
	('WIY', 'van_lostmc', 0, 1),
	('WIY', 'van_medelin', 0, 1),
	('WIY', 'van_mg13', 0, 1),
	('WIY', 'van_midnight', 0, 1),
	('WIY', 'van_narcos', 0, 1),
	('WIY', 'van_ogs', 0, 1),
	('WIY', 'van_orga', 0, 1),
	('WIY', 'van_osmanen', 0, 1),
	('WIY', 'van_peakyblinders', 0, 1),
	('WIY', 'van_redlight', 0, 1),
	('WIY', 'van_santasofia', 0, 1),
	('WIY', 'van_st187', 0, 1),
	('WIY', 'van_syndicate', 0, 1),
	('WIY', 'van_triaden', 0, 1),
	('WIY', 'van_tschetschenen', 0, 1),
	('WIY', 'van_vagos', 0, 1),
	('WIY', 'van_woo', 0, 1),
	('WIY', 'van_yakuza', 0, 1),
	('WIY', 'variszupra', 0, 1),
	('WIY', 'venatus', 0, 1),
	('WIY', 'w140', 0, 1),
	('WIY', 'w222wald', 0, 1000000),
	('WIY', 'waldw222', 0, 1000000),
	('WIY', 'wmfenyr', 0, 1),
	('WIY', 'wraith', 0, 1000000),
	('WIY', 'x6wz', 0, 1000000),
	('WIY', 'x6_brigada', 0, 1),
	('WIY', 'x6_cali', 0, 1),
	('WIY', 'x6_camorra', 0, 1),
	('WIY', 'x6_midnight', 0, 1),
	('WIY', 'x6_narcos', 0, 1),
	('WIY', 'x6_orga', 0, 1),
	('WIY', 'x6_yakuza', 0, 1),
	('WIY', 'xc90', 0, 1000000),
	('WIY', 'yzfr6', 0, 1000000),
	('WIY', 'yzfr7', 0, 1),
	('WIY', 'z8r', 0, 1000000),
	('WIY', 'zentenario', 0, 1),
	('WIY', 'zl1', 0, 1),
	('WIY', 'zlay_gtz35', 0, 1),
	('WIY', 'zx10r', 0, 1000000),
	('WIY', 'zx6r', 0, 1000000);

-- Dumping structure for table worldisyours.dealership_vehicles
CREATE TABLE IF NOT EXISTS `dealership_vehicles` (
  `spawn_code` varchar(100) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `hashkey` varchar(100) DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`spawn_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.dealership_vehicles: ~1,066 rows (approximately)
INSERT INTO `dealership_vehicles` (`spawn_code`, `brand`, `model`, `hashkey`, `category`, `price`, `created_at`) VALUES
	('1500ghoul', 'Dodge', '1500 Ghoul', '1743116543', 'oneoften', 1, '2024-10-09 09:16:32'),
	('16charger', 'Dodge', '16 Charger', '-1513691047', 'oneoften', 1, '2024-10-09 09:16:34'),
	('16topcargle', 'Mercedes', '16 Topcar GLE', '999051285', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('17m760i', 'BMW', '17 M760i', '-532475078', 'DEALERSHIP', 1000000, '2024-10-09 09:16:34'),
	('17mansorypnmr', 'Mansory', '17 Mansory Pnmr', '-77591427', 'oneoften', 1, '2024-10-09 09:16:33'),
	('18performante', 'Lamborghini', '18 Performante', '836213613', 'oneoffive', 1, '2024-10-09 09:16:32'),
	('18rs7', 'Audi', '18 RS7', '1550646689', 'DEALERSHIP', 1000000, '2024-10-09 09:16:33'),
	('18Velar', 'Land Rover', '18 Velar', '-984938540', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('19gv80', 'Genesis', '19 GV80', '-1388575296', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:35'),
	('2018s650p', 'Mercedes', '2018 S650 P', '1456801710', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('2019chiron', 'Bugatti', '2019 Chiron', '1469041587', 'oneofone', 1, '2024-10-09 09:16:34'),
	('2019tundrac', 'Toyota', '2019 Tundra C', '703639516', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:32'),
	('2020CLA45s', 'Mercedes', '2020 CLA 45 S', '1656253746', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('20xb7', 'BMW', '20 XB7', '1326776111', 'DEALERSHIP', 1000000, '2024-10-09 09:16:35'),
	('21rsq8', 'Audi', '21 RSQ8', '-1881066373', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('21sierra', 'GMC', '21 Sierra', '638600285', 'oneoften', 1, '2024-10-09 09:16:32'),
	('22arturac', 'McLaren', '22 Artura C', '-1929464475', 'DEALERSHIP', 1000000, '2024-10-09 09:16:34'),
	('22m5', 'BMW', '22 M5', '-1229221301', 'DEALERSHIP', 1000000, '2024-10-09 09:16:34'),
	('2ncsbmwm8', 'BMW', '2NCS BMW M8', '1419541864', 'DEALERSHIP', 1000000, '2024-10-09 09:16:33'),
	('2ncsx7', 'Honda', '2N CSX 7', '-663740674', 'oneoften', 1, '2024-10-09 09:16:35'),
	('350z', 'Nissan', '350Z', '147177933', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:35'),
	('356a', 'Porsche', '356A', '-2126371412', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('488', 'Ferrari', '488', '-127896429', 'oneoften', 1, '2024-10-09 09:16:33'),
	('488sp', 'Ferrari', '488 SP', '-497555200', 'oneoften', 1, '2024-10-09 09:16:32'),
	('600ltwb', 'McLaren', '600LT WB', '-37895182', 'oneoften', 1, '2024-10-09 09:16:35'),
	('6x6', 'Mercedes', '6x6', '660425153', 'DEALERSHIP', 1000000, '2024-10-09 09:16:32'),
	('74civrswb', 'Honda', '74 Civic RSWB', '-897028078', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('77monte', 'Chevrolet', '77 Monte', '1910489379', 'DEALERSHIP', 1000000, '2024-10-09 09:16:34'),
	('812mnsry', 'Ferrari', '812 Mansory', '768307670', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('911turbos', 'Porsche', '911 Turbo S', '2046572318', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('a80', 'Toyota', 'A80', '905399718', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('a90sh', 'Toyota', 'A90 SH', '558347990', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('aaq4', 'Audi', 'AA Q4', '-985643932', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('adder', 'Truffade', 'Adder', '-1216765807', 'super', 2600000, '2024-10-09 09:16:35'),
	('aerox155', 'Yamaha', 'Aerox 155', '-1047713792', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('airbus', 'Brute', 'Airport Bus', '1283517198', 'service', 1000000, '2024-10-09 09:16:33'),
	('airtug', 'HVY', 'Airtug', '1560980623', 'utility', 1500000, '2024-10-09 09:16:34'),
	('akula', 'Unknown', 'Akula', '1181327175', 'helicopters', 5200000, '2024-10-09 09:16:34'),
	('akuma', 'Dinka', 'Akuma', '1672195559', 'motorcycles', 1405000, '2024-10-09 09:16:34'),
	('alkonost', 'Unknown', 'RO-86 Alkonost', '-365873403', 'planes', 4500000, '2024-10-09 09:16:32'),
	('alpha', 'Albany', 'Alpha', '767087018', 'sports', 1060000, '2024-10-09 09:16:35'),
	('alphaz1', 'Buckingham', 'Alpha-Z1', '-1523619738', 'planes', 4500000, '2024-10-09 09:16:34'),
	('alpinab7BLACKEDITION', 'BMW', 'Alpina B7 Black Edition', '-1017119800', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('amarok', 'Volkswagen', 'Amarok', '493030188', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:32'),
	('ambulance', 'Brute', 'Ambulance', '1171614426', 'emergency', 1100000, '2024-10-09 09:16:34'),
	('AmgGtrLight', 'Mercedes', 'AMG GTR Light', '-448744104', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('amrevu23mg', 'Aston Martin', 'AM Revu 23 MG', '-1087050610', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('annihilator', 'Western Company', 'Annihilator', '837858166', 'helicopters', 5200000, '2024-10-09 09:16:33'),
	('annihilator2', 'Western Company', 'Annihilator Stealth', '295054921', 'helicopters', 5200000, '2024-10-09 09:16:34'),
	('apc', 'HVY', 'APC Tank', '562680400', 'military', 1000000, '2024-10-09 09:16:33'),
	('asbo', 'Maxwell', 'Asbo', '1118611807', 'compacts', 800000, '2024-10-09 09:16:35'),
	('asea', 'Declasse', 'Asea', '-1809822327', 'sedans', 1000000, '2024-10-09 09:16:35'),
	('asterope', 'Karin', 'Asterope', '-1903012613', 'sedans', 1000000, '2024-10-09 09:16:33'),
	('astron', 'Pfister', 'Astron', '629969764', 'sedans', 1500000, '2024-10-09 09:16:34'),
	('autarch', 'Överflöd', 'Autarch', '-313185164', 'super', 2480000, '2024-10-09 09:16:34'),
	('autobio', 'Range Rover', 'Autobio', '-1803031768', 'oneoften', 1, '2024-10-09 09:16:34'),
	('avarus', 'LCC', 'Avarus', '-2115793025', 'motorcycles', 1720000, '2024-10-09 09:16:35'),
	('avenger', 'Mammoth', 'Avenger', '-2118308144', 'planes', 4500000, '2024-10-09 09:16:33'),
	('avenger2', 'Mammoth', 'Avenger', '408970549', 'planes', 4500000, '2024-10-09 09:16:33'),
	('avisa', 'Kraken Subs', 'Avisa', '-1706603682', 'boats', 400000, '2024-10-09 09:16:33'),
	('b63s', 'Mercedes', 'B63 S', '-124294908', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:32'),
	('bagger', 'WMC', 'Bagger', '-2140431165', 'motorcycles', 1835000, '2024-10-09 09:16:34'),
	('baller', 'Gallivanter', 'Baller', '-808831384', 'suvs', 1000000, '2024-10-09 09:16:35'),
	('baller2', 'Gallivanter', 'Baller II', '142944341', 'suvs', 1500000, '2024-10-09 09:16:32'),
	('baller3', 'Gallivanter', 'Baller LE', '1878062887', 'suvs', 1500000, '2024-10-09 09:16:33'),
	('baller4', 'Gallivanter', 'Baller LE LWB', '634118882', 'suvs', 2900000, '2024-10-09 09:16:33'),
	('baller7', 'Gallivanter', 'Baller ST', '359875117', 'sedans', 1450000, '2024-10-09 09:16:34'),
	('banshee', 'Bravado', 'Banshee', '-1041692462', 'sports', 1120000, '2024-10-09 09:16:34'),
	('banshee2', 'Bravado', 'Banshee 900R', '633712403', 'super', 2400000, '2024-10-09 09:16:33'),
	('barracks', 'HVY', 'Barracks', '-823509173', 'military', 1000000, '2024-10-09 09:16:32'),
	('barracks2', 'HVY', 'Barracks Semi', '1074326203', 'military', 1000000, '2024-10-09 09:16:35'),
	('barracks3', 'HVY', 'Barracks', '630371791', 'military', 1000000, '2024-10-09 09:16:34'),
	('barrage', 'HVY', 'Barrage', '-212993243', 'military', 1000000, '2024-10-09 09:16:32'),
	('bati', 'Pegassi', 'Bati 801', '-114291515', 'motorcycles', 1155000, '2024-10-09 09:16:34'),
	('bati2', 'Pegassi', 'Bati 801RR', '-891462355', 'motorcycles', 1260000, '2024-10-09 09:16:34'),
	('bati901', 'Ducati', 'Bati 901', '981856910', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('ben17', 'Mercedes', 'Ben 17', '-2049278303', 'oneoften', 1, '2024-10-09 09:16:35'),
	('benson', 'Vapid', 'Benson', '2053223216', 'commercial', 550000, '2024-10-09 09:16:34'),
	('bentaygam', 'Bentley', 'Bentayga M', '-2069035003', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('benzc32', 'Mercedes', 'Benz C32', '-1257824026', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('benze55', 'Mercedes', 'Benz E55', '-1032122474', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:35'),
	('benzsl63', 'Mercedes', 'Benz SL63', '-2025387310', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:35'),
	('besra', 'Western Company', 'Besra', '1824333165', 'planes', 4500000, '2024-10-09 09:16:34'),
	('bestiagts', 'Grotti', 'Bestia GTS', '1274868363', 'sports', 1400000, '2024-10-09 09:16:33'),
	('bf400', 'Nagasaki', 'BF400', '86520421', 'motorcycles', 1855000, '2024-10-09 09:16:34'),
	('bfinjection', 'Annis', 'Bf Injection', '1126868326', 'offroad', 1521000, '2024-10-09 09:16:33'),
	('biff', 'Brute', 'Biff', '850991848', 'commercial', 1000000, '2024-10-09 09:16:33'),
	('bifta', 'Annis', 'Bifta', '-349601129', 'offroad', 1619500, '2024-10-09 09:16:34'),
	('bison', 'Bravado', 'Bison', '-16948145', 'vans', 358200, '2024-10-09 09:16:33'),
	('bjxl', 'Karin', 'BeeJay XL', '850565707', 'suvs', 1100000, '2024-10-09 09:16:33'),
	('blade', 'Vapid', 'Blade', '-1205801634', 'muscle', 1525000, '2024-10-09 09:16:34'),
	('blazer', 'Annis', 'Blazer', '-2128233223', 'offroad', 1267500, '2024-10-09 09:16:33'),
	('blazer2', 'Nagasaki', 'Blazer Lifeguard', '-48031959', 'offroad', 1183000, '2024-10-09 09:16:33'),
	('blazer3', 'Nagasaki', 'Blazer Hot Rod', '-1269889662', 'offroad', 1183000, '2024-10-09 09:16:33'),
	('blazer4', 'Annis', 'Blazer Sport', '-440768424', 'offroad', 1560250, '2024-10-09 09:16:35'),
	('blimp', 'Unknown', 'Atomic Blimp', '-150975354', 'planes', 4500000, '2024-10-09 09:16:34'),
	('blimp2', 'Unknown', 'Xero Blimp', '-613725916', 'planes', 4500000, '2024-10-09 09:16:34'),
	('blimp3', 'Unknown', 'Blimp', '-307958377', 'planes', 4500000, '2024-10-09 09:16:35'),
	('blista', 'Dinka', 'Blista', '-344943009', 'compacts', 1100000, '2024-10-09 09:16:33'),
	('blista2', 'Dinka', 'Blista Compact', '1039032026', 'compacts', 1500000, '2024-10-09 09:16:34'),
	('blista3', 'Dinka', 'Blista Go Go Monkey', '-591651781', 'compacts', 1500000, '2024-10-09 09:16:34'),
	('bmwe39', 'BMW', 'BMW E39', '577497474', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('bmwg07', 'BMW', 'BMW G07', '497572160', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('bmx', 'Bike', 'BMX', '1131912276', 'cycles', 31840, '2024-10-09 09:16:34'),
	('bobcatxl', 'Vapid', 'Bobcat XL Open', '1069929536', 'vans', 268650, '2024-10-09 09:16:34'),
	('bombushka', 'Unknown', 'RM-10 Bombushka', '-32878452', 'planes', 4500000, '2024-10-09 09:16:33'),
	('boor', 'Karin', 'Boor', '996383885', 'compacts', 1300000, '2024-10-09 09:16:34'),
	('boxville', 'Brute', 'Boxville LSDWP', '-1987130134', 'vans', 897000, '2024-10-09 09:16:33'),
	('boxville2', 'Brute', 'Boxville Go Postal', '-233098306', 'vans', 907000, '2024-10-09 09:16:34'),
	('boxville3', 'Brute', 'Boxville Humane Labs', '121658888', 'vans', 937000, '2024-10-09 09:16:35'),
	('boxville4', 'Brute', 'Boxville Post OP', '444171386', 'vans', 957000, '2024-10-09 09:16:34'),
	('br900m', 'Brabus', 'BR 900 M', '-475446832', 'oneofone', 1, '2024-10-09 09:16:35'),
	('brawler', 'Annis', 'Brawler', '-1479664699', 'offroad', 1760000, '2024-10-09 09:16:34'),
	('brickade', 'MTL', 'Brickade', '-305727417', 'service', 1000000, '2024-10-09 09:16:32'),
	('brickade2', 'MTL', 'Brickade 6x6', '-1576586413', 'service', 1000000, '2024-10-09 09:16:33'),
	('brigham', 'Albany', 'Brigham', '-654498607', 'muscle', 1575000, '2024-10-09 09:16:33'),
	('brioso', 'Grotti', 'Brioso R/A', '1549126457', 'compacts', 1550000, '2024-10-09 09:16:34'),
	('brioso2', 'Grotti', 'Brioso 300', '1429622905', 'compacts', 1250000, '2024-10-09 09:16:33'),
	('brioso3', 'Grotti', 'Brioso 300 Widebody', '15214558', 'compacts', 1250000, '2024-10-09 09:16:33'),
	('broadway', 'Classique', 'Broadway', '-1933242328', 'coupes', 2000000, '2024-10-09 09:16:35'),
	('brz13varis', 'Subaru', 'BRZ 13 Varis', '979439968', 'DEALERSHIP', 1000000, '2024-10-09 09:16:33'),
	('btype', 'Albany', 'Roosevelt', '117401876', 'sportsclassics', 1275000, '2024-10-09 09:16:34'),
	('btype2', 'Albany', 'Franken Stange', '-831834716', 'sportsclassics', 1479000, '2024-10-09 09:16:34'),
	('btype3', 'Albany', 'Roosevelt Valor', '-602287871', 'sportsclassics', 1071000, '2024-10-09 09:16:34'),
	('buccaneer', 'Albany', 'Buccaneer', '-682211828', 'muscle', 1375000, '2024-10-09 09:16:33'),
	('buccaneer2', 'Albany', 'Buccaneer Rider', '-1013450936', 'muscle', 1675000, '2024-10-09 09:16:34'),
	('buffalo', 'Bravado', 'Buffalo', '-304802106', 'sports', 1750000, '2024-10-09 09:16:33'),
	('buffalo2', 'Bravado', 'Buffalo S', '736902334', 'sports', 1900000, '2024-10-09 09:16:35'),
	('buffalo4', 'Bravado', 'Buffalo STX', '-619930876', 'muscle', 1175000, '2024-10-09 09:16:33'),
	('buffalo5', 'Bravado', 'Buffalo EVX', '165968051', 'muscle', 1537500, '2024-10-09 09:16:32'),
	('bulldozer', 'HVY', 'Dozer', '1886712733', 'industrial', 1470000, '2024-10-09 09:16:33'),
	('bullet', 'Vapid', 'Bullet', '-1696146015', 'super', 2400000, '2024-10-09 09:16:34'),
	('burrito3', 'Declasse', 'Burrito', '-1743316013', 'vans', 796000, '2024-10-09 09:16:34'),
	('bus', 'Brute', 'Bus', '-713569950', 'service', 1000000, '2024-10-09 09:16:35'),
	('buzzard', 'Nagasaki', 'Buzzard Attack Chopper', '788747387', 'helicopters', 5200000, '2024-10-09 09:16:34'),
	('buzzard2', 'Nagasaki', 'Buzzard', '745926877', 'helicopters', 5200000, '2024-10-09 09:16:34'),
	('c63scpd', 'Mercedes', 'C63 SCPD', '-380901047', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:35'),
	('c8p1', 'Chevrolet', 'C8 P1', '-41251115', 'oneoften', 1, '2024-10-09 09:16:33'),
	('cablecar', 'Unknown', 'Cable Car', '-960289747', 'service', 1000000, '2024-10-09 09:16:35'),
	('caddy2', 'Nagasaki', 'Caddy (Civilian)', '-537896628', 'utility', 1270000, '2024-10-09 09:16:33'),
	('caddy3', 'Nagasaki', 'Caddy (Golf)', '-769147461', 'utility', 1470000, '2024-10-09 09:16:33'),
	('calico', 'Karin', 'Calico GTF', '-1193912403', 'sports', 1800000, '2024-10-09 09:16:33'),
	('caracara2', 'Vapid', 'Caracara 4x4', '-1349095620', 'offroad', 1352000, '2024-10-09 09:16:34'),
	('carbonizzare', 'Grotti', 'Carbonizzare', '2072687711', 'sports', 1100000, '2024-10-09 09:16:33'),
	('carbonrs', 'Nagasaki', 'Carbon RS', '11251904', 'motorcycles', 1620000, '2024-10-09 09:16:33'),
	('cargobob', 'Western Company', 'Cargobob', '-50547061', 'helicopters', 5200000, '2024-10-09 09:16:34'),
	('cargobob2', 'Western Company', 'Cargobob Jetsam', '1621617168', 'helicopters', 5200000, '2024-10-09 09:16:34'),
	('cargobob3', 'Western Company', 'Cargobob', '1394036463', 'helicopters', 5200000, '2024-10-09 09:16:33'),
	('cargoplane', 'JoBuilt', 'Cargo Plane', '368211810', 'planes', 4500000, '2024-10-09 09:16:33'),
	('casco', 'Lampadati', 'Casco', '941800958', 'sportsclassics', 1700000, '2024-10-09 09:16:35'),
	('cavalcade', 'Albany', 'Cavalcade', '2006918058', 'suvs', 1400000, '2024-10-09 09:16:35'),
	('cavalcade2', 'Albany', 'Cavalcade II', '-789894171', 'suvs', 1650000, '2024-10-09 09:16:34'),
	('cayennemecqq', 'Porsche', 'Cayenne Mec QQ', '-1729839138', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('cb650r', 'Honda', 'CB650R', '1093254796', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('centuria', 'Bugatti', 'Centuria', '389821046', 'oneofone', 1, '2024-10-09 09:16:32'),
	('cerberus', 'MTL', 'Apocalypse Cerberus', '-801550069', 'commercial', 1000000, '2024-10-09 09:16:33'),
	('champion', 'Dewbauchee', 'Champion', '-915234475', 'coupes', 2050000, '2024-10-09 09:16:34'),
	('cheburek', 'Rune', 'Cheburek', '-988501280', 'sportsclassics', 1190000, '2024-10-09 09:16:33'),
	('cheetah', 'Grotti', 'Cheetah', '-1311154784', 'super', 2280000, '2024-10-09 09:16:34'),
	('cheetah2', 'Grotti', 'Cheetah Classic', '223240013', 'sports', 2900000, '2024-10-09 09:16:35'),
	('chernobog', 'HVY', 'Chernobog', '-692292317', 'military', 1000000, '2024-10-09 09:16:33'),
	('chimera', 'Nagasaki', 'Chimera', '6774487', 'motorcycles', 1350000, '2024-10-09 09:16:33'),
	('chino', 'Vapid', 'Chino', '349605904', 'muscle', 1500000, '2024-10-09 09:16:34'),
	('chino2', 'Vapid', 'Chino Luxe', '-1361687965', 'muscle', 1200000, '2024-10-09 09:16:32'),
	('chironspeedhunter', 'Bugatti', 'Chiron Speedhunter', '-686587798', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('chironsuper', 'Bugatti', 'Chiron Super', '-935830347', 'DEALERSHIP', 1000000, '2024-10-09 09:16:33'),
	('chironsupersport22', 'Bugatti', 'Chiron Supersport 22', '-1451334716', 'oneoften', 1, '2024-10-09 09:16:33'),
	('choilambo', 'Lamborghini', 'Choi Lambo', '-1036941824', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('cinquemila', 'Cinquemila', 'Lampadati', '-1527436269', 'sedans', 2250000, '2024-10-09 09:16:34'),
	('civic2020', 'Honda', 'Civic 2020', '-1028506419', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:32'),
	('ckbmwm4offwhite', 'BMW', 'CK BMW M4 Off White', '128141295', 'oneofone', 1, '2024-10-09 09:16:34'),
	('ckdrivingschool', 'Generic', 'CK Driving School', '-826688010', 'BUSINESS', 1, '2024-10-09 09:16:33'),
	('ckm3e36', 'BMW', 'CK M3 E36', '1098645260', 'oneoften', 1, '2024-10-09 09:16:33'),
	('claw', 'Custom', 'Claw', '826601543', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('cliffhanger', 'Western', 'Cliffhanger', '390201602', 'motorcycles', 1008000, '2024-10-09 09:16:33'),
	('clique', 'Vapid', 'Clique', '-1566607184', 'muscle', 1000000, '2024-10-09 09:16:35'),
	('clique2', 'Vapid', 'Clique Wagon', '-979292575', 'muscle', 1248500, '2024-10-09 09:16:33'),
	('cls19', 'Mercedes', 'CLS 19', '480281051', 'oneoften', 1, '2024-10-09 09:16:33'),
	('cls500w219', 'Mercedes', 'CLS 500 W219', '-1292352193', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('club', 'BF', 'Club', '-2098954619', 'compacts', 800000, '2024-10-09 09:16:33'),
	('coach', 'Brute', 'Dashound', '-2072933068', 'service', 1000000, '2024-10-09 09:16:33'),
	('cog55', 'Enus', 'Cognoscenti 55', '906642318', 'sedans', 1500000, '2024-10-09 09:16:34'),
	('cogcabrio', 'Enus', 'Cognoscenti Cabrio', '330661258', 'coupes', 1300000, '2024-10-09 09:16:35'),
	('cognoscenti', 'Enus', 'Cognoscenti', '-2030171296', 'sedans', 1600000, '2024-10-09 09:16:33'),
	('comet2', 'Pfister', 'Comet', '-1045541610', 'sports', 2600000, '2024-10-09 09:16:33'),
	('comet3', 'Pfister', 'Comet Retro Custom', '-2022483795', 'sports', 1500000, '2024-10-09 09:16:33'),
	('comet4', 'Pfister', 'Comet Safari', '1561920505', 'sports', 2200000, '2024-10-09 09:16:33'),
	('comet5', 'Pfister', 'Comet SR', '661493923', 'sports', 1100000, '2024-10-09 09:16:33'),
	('comet6', 'Pfister', 'Comet S2', '-1726022652', 'sports', 2600000, '2024-10-09 09:16:34'),
	('comet7', 'S2 Cabrio', 'Comet', '1141395928', 'sedans', 1500000, '2024-10-09 09:16:34'),
	('conada', 'Buckingham', 'Conada', '-477831899', 'helicopters', 1150000, '2024-10-09 09:16:34'),
	('conada2', 'Buckingham', 'Weaponized Conada', '-1659004814', 'helicopters', 5200000, '2024-10-09 09:16:33'),
	('contender', 'Vapid', 'Contender', '683047626', 'suvs', 1500000, '2024-10-09 09:16:33'),
	('coquette', 'Invetero', 'Coquette', '108773431', 'sports', 1900000, '2024-10-09 09:16:35'),
	('coquette2', 'Invetero', 'Coquette Classic', '1011753235', 'sportsclassics', 1805000, '2024-10-09 09:16:35'),
	('coquette3', 'Invetero', 'Coquette BlackFin', '784565758', 'muscle', 1700000, '2024-10-09 09:16:33'),
	('coquette4', 'Invetero', 'Coquette D10', '-1728685474', 'sports', 2400000, '2024-10-09 09:16:34'),
	('corsita', 'Lampadati', 'Corsita', '-754687673', 'sports', 1800000, '2024-10-09 09:16:33'),
	('coureur', 'Penaud', 'La Coureuse', '610429990', 'sports', 2980000, '2024-10-09 09:16:35'),
	('crownbp', 'Toyota', 'Crown BP', '299800035', 'oneoften', 1, '2024-10-09 09:16:35'),
	('cruiser', 'Bike', 'Cruiser', '448402357', 'cycles', 10109, '2024-10-09 09:16:34'),
	('crusader', 'Canis', 'Crusader', '321739290', 'military', 1000000, '2024-10-09 09:16:33'),
	('cuban800', 'Western Company', 'Cuban 800', '-644710429', 'planes', 4500000, '2024-10-09 09:16:33'),
	('cutter', 'HVY', 'Cutter', '-1006919392', 'industrial', 1070000, '2024-10-09 09:16:34'),
	('cx30wz', 'Mazda', 'CX30 WZ', '-919115499', 'oneoffive', 1, '2024-10-09 09:16:35'),
	('cyclone', 'Coil', 'Cyclone', '1392481335', 'super', 3000000, '2024-10-09 09:16:34'),
	('cypher', 'Übermacht', 'Cypher', '1755697647', 'sports', 2100000, '2024-10-09 09:16:34'),
	('daemon', 'WMC', 'Daemon', '2006142190', 'motorcycles', 1940000, '2024-10-09 09:16:33'),
	('daemon2', 'Western', 'Daemon Custom', '-1404136503', 'motorcycles', 1030000, '2024-10-09 09:16:33'),
	('dawnonyx', 'Rolls-Royce', 'Dawn Onyx', '2076472358', 'IMPORT', 1, '2024-10-09 09:16:35'),
	('dc_sl63mansory', 'Mercedes', 'DC SL63 Mansory', '1747485470', 'oneoften', 1, '2024-10-09 09:16:34'),
	('deathbike', 'Deathbike', 'Deathbike Apocalypse', '-27326686', 'motorcycles', 1570000, '2024-10-09 09:16:35'),
	('defiler', 'Shitzu', 'Defiler', '822018448', 'motorcycles', 1780000, '2024-10-09 09:16:34'),
	('deity', 'Enus', 'Deity', '1532171089', 'sedans', 2050000, '2024-10-09 09:16:33'),
	('demon', 'Dodge', 'Demon', '885421525', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('deveste', 'Principe', 'Deveste', '1591739866', 'super', 3680000, '2024-10-09 09:16:35'),
	('deviant', 'Schyster', 'Deviant', '1279262537', 'muscle', 1050000, '2024-10-09 09:16:33'),
	('diablous', 'Principe', 'Diablous', '-239841468', 'motorcycles', 1150000, '2024-10-09 09:16:33'),
	('diablous2', 'Principe', 'Diablous Custom', '1790834270', 'motorcycles', 1880000, '2024-10-09 09:16:33'),
	('dilettante', 'Karin', 'Dilettante', '-1130810103', 'compacts', 800000, '2024-10-09 09:16:34'),
	('dilettante2', 'Karin', 'Dilettante Patrol', '1682114128', 'compacts', 1200000, '2024-10-09 09:16:34'),
	('dinghy', 'Nagasaki', 'Dinghy 2-Seater', '1033245328', 'boats', 400000, '2024-10-09 09:16:32'),
	('dinghy2', 'Nagasaki', 'Dinghy 4-Seater', '276773164', 'boats', 400000, '2024-10-09 09:16:34'),
	('dinghy3', 'Nagasaki', 'Dinghy (Heist)', '509498602', 'boats', 400000, '2024-10-09 09:16:35'),
	('dinghy4', 'Nagasaki', 'Dinghy Yacht', '867467158', 'boats', 400000, '2024-10-09 09:16:35'),
	('DL_G900', 'Mercedes', 'DL G900', '651296914', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('docktug', 'HVY', 'Docktug', '-884690486', 'utility', 1000000, '2024-10-09 09:16:33'),
	('dodo', 'Mammoth', 'Dodo', '-901163259', 'planes', 4500000, '2024-10-09 09:16:35'),
	('dominator', 'Vapid', 'Dominator', '80636076', 'muscle', 1375000, '2024-10-09 09:16:33'),
	('dominator2', 'Vapid', 'Pißwasser Dominator', '-915704871', 'muscle', 1500000, '2024-10-09 09:16:33'),
	('dominator3', 'Vapid', 'Dominator GTX', '-986944621', 'muscle', 1050000, '2024-10-09 09:16:35'),
	('dominator7', 'Vapid', 'Dominator ASP', '426742808', 'muscle', 1000000, '2024-10-09 09:16:34'),
	('dominator8', 'Vapid', 'Dominator GTT', '736672010', 'muscle', 1200000, '2024-10-09 09:16:34'),
	('double', 'Dinka', 'Double-T', '-1670998136', 'motorcycles', 1200000, '2024-10-09 09:16:34'),
	('drafter', 'Obey', '8F Drafter', '686471183', 'sports', 1600000, '2024-10-09 09:16:34'),
	('draugur', 'Declasse', 'Draugur', '-768236378', 'offroad', 1679100, '2024-10-09 09:16:33'),
	('dubsta', 'Benefactor', 'Dubsta', '1177543287', 'suvs', 1900000, '2024-10-09 09:16:34'),
	('dubsta2', 'Benefactor', 'Dubsta Luxury', '-394074634', 'suvs', 1950000, '2024-10-09 09:16:35'),
	('dubsta3', 'Annis', 'Dubsta 6x6', '-1237253773', 'offroad', 1746000, '2024-10-09 09:16:33'),
	('dukes', 'Imponte', 'Dukes', '723973206', 'muscle', 1525000, '2024-10-09 09:16:35'),
	('dukes3', 'Imponte', 'Beater Dukes', '2134119907', 'muscle', 1750000, '2024-10-09 09:16:34'),
	('dump', 'HVY', 'Dump Truck', '-2130482718', 'industrial', 1270000, '2024-10-09 09:16:32'),
	('dune', 'Annis', 'Dune Buggy', '-1661854193', 'offroad', 1366000, '2024-10-09 09:16:34'),
	('duster', 'Western Company', 'Duster', '970356638', 'planes', 4500000, '2024-10-09 09:16:34'),
	('dvc63darwin', 'Mercedes', 'DV C63 Darwin', '296047390', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:35'),
	('dynasty', 'Weeny', 'Dynasty', '310284501', 'sportsclassics', 2250000, '2024-10-09 09:16:34'),
	('e39touring', 'BMW', 'E39 Touring', '-1925474466', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('e500', 'Mercedes', 'E500', '20111401', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('e55', 'Mercedes', 'E55', '2103567117', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:35'),
	('e63s', 'Mercedes', 'E63 S', '1673147807', 'IMPORT', 1, '2024-10-09 09:16:32'),
	('e63test', 'Mercedes', 'E63 Test', '1975500413', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('e92bb', 'BMW', 'E92 BB', '1157349776', 'oneoften', 1, '2024-10-09 09:16:34'),
	('eleanor', 'Shelby', 'Eleanor', '137494285', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('elegy', 'Annis', 'Elegy Retro Custom', '196747873', 'sports', 1900000, '2024-10-09 09:16:35'),
	('elegy2', 'Annis', 'Elegy RH8', '-566387422', 'sports', 1000000, '2024-10-09 09:16:33'),
	('eli', 'Tesla', 'Eli', '715023741', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('ellie', 'Vapid', 'Ellie', '-1267543371', 'muscle', 1337500, '2024-10-09 09:16:33'),
	('emerus', 'Progen', 'Emerus', '1323778901', 'super', 2400000, '2024-10-09 09:16:35'),
	('emperor', 'Albany', 'Emperor', '-685276541', 'sedans', 1000000, '2024-10-09 09:16:32'),
	('enduro', 'Dinka', 'Enduro', '1753414259', 'motorcycles', 1300000, '2024-10-09 09:16:35'),
	('entity2', 'Överflöd', 'Entity XXR', '-2120700196', 'super', 3280000, '2024-10-09 09:16:34'),
	('entity3', 'Overflod', 'Entity MT', '1748565021', 'super', 3000000, '2024-10-09 09:16:35'),
	('entityxf', 'Överflöd', 'Entity XF', '-1291952903', 'super', 3600000, '2024-10-09 09:16:33'),
	('escaladeprime', 'Cadillac', 'Escalade Prime', '541685454', 'IMPORT', 1, '2024-10-09 09:16:35'),
	('esskey', 'Pegassi', 'Esskey', '2035069708', 'motorcycles', 1350000, '2024-10-09 09:16:34'),
	('eudora', 'Willard', 'Eudora', '-1249788006', 'sedans', 1700000, '2024-10-09 09:16:33'),
	('euros', 'Annis', 'Euros', '2038480341', 'sports', 1600000, '2024-10-09 09:16:33'),
	('eve', 'Unknown', 'Eve', '-1018388741', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('everon', 'Karin', 'Everon', '-1756021720', 'offroad', 1014000, '2024-10-09 09:16:32'),
	('everon2', 'Karin', 'Everon Hotring', '-131348178', 'sports', 1600000, '2024-10-09 09:16:34'),
	('evo9', 'Mitsubishi', 'Evo 9', '-228528329', 'DEALERSHIP', 1000000, '2024-10-09 09:16:34'),
	('evoz', 'Mitsubishi', 'Evo Z', '1342057088', 'oneofone', 1, '2024-10-09 09:16:34'),
	('evoz1', 'Mitsubishi', 'Evo Z1', '-1444176231', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('exemplar', 'Dewbauchee', 'Exemplar', '-5153954', 'coupes', 2000000, '2024-10-09 09:16:34'),
	('f12rp', 'Ferrari', 'F12 RP', '355878484', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('f450c', 'Ford', 'F450 C', '1322123305', 'BUSINESS', 1, '2024-10-09 09:16:33'),
	('f550rbc', 'Ford', 'F550 RBC', '1317757953', 'BUSINESS', 1, '2024-10-09 09:16:33'),
	('f620', 'Ocelot', 'F620', '-591610296', 'coupes', 1250000, '2024-10-09 09:16:34'),
	('f812', 'Ferrari', 'F812', '1127414868', 'oneoften', 1, '2024-10-09 09:16:32'),
	('faction', 'Willard', 'Faction', '-2119578145', 'muscle', 1550000, '2024-10-09 09:16:34'),
	('faction2', 'Willard', 'Faction Rider', '-1790546981', 'muscle', 1850000, '2024-10-09 09:16:34'),
	('faction3', 'Willard', 'Faction Custom Donk', '-2039755226', 'muscle', 1250000, '2024-10-09 09:16:33'),
	('fagaloa', 'Vulcar', 'Fagaloa', '1617472902', 'sportsclassics', 2210000, '2024-10-09 09:16:34'),
	('faggio', 'Pegassi', 'Faggio Sport', '-1842748181', 'motorcycles', 1100000, '2024-10-09 09:16:34'),
	('faggio2', 'Pegassi', 'Faggio', '55628203', 'motorcycles', 1050000, '2024-10-09 09:16:34'),
	('faggio3', 'Pegassi', 'Faggio Mod', '-1289178744', 'motorcycles', 1680000, '2024-10-09 09:16:34'),
	('fbi', 'Bravado', 'FIB Buffalo', '1127131465', 'emergency', 400000, '2024-10-09 09:16:33'),
	('fbi2', 'Declasse', 'FIB Granger', '-1647941228', 'emergency', 400000, '2024-10-09 09:16:34'),
	('fcr', 'Pegassi', 'FCR 1000', '627535535', 'motorcycles', 1150000, '2024-10-09 09:16:33'),
	('fcr2', 'Pegassi', 'FCR 1000 Custom', '-757735410', 'motorcycles', 1620000, '2024-10-09 09:16:35'),
	('fd370z', 'Nissan', 'FD 370Z', '1260067116', 'oneoften', 1, '2024-10-09 09:16:35'),
	('felon', 'Lampadati', 'Felon', '-391594584', 'coupes', 1100000, '2024-10-09 09:16:34'),
	('felon2', 'Lampadati', 'Felon GT', '-89291282', 'coupes', 1700000, '2024-10-09 09:16:33'),
	('feltzer2', 'Benefactor', 'Feltzer', '-1995326987', 'sports', 1940000, '2024-10-09 09:16:35'),
	('feltzer3', 'Benefactor', 'Stirling GT', '-1566741232', 'sportsclassics', 1955000, '2024-10-09 09:16:35'),
	('fenyrsupersport', 'W Motors', 'Fenyr Supersport', '163908756', 'oneofone', 1, '2024-10-09 09:16:34'),
	('ferrari812super', 'Ferrari', 'Ferrari 812 Super', '-623096524', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('fgt', 'Ford', 'FGT', '1315816827', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('firetruk', 'MTL', 'Fire Truck', '1938952078', 'emergency', 1100000, '2024-10-09 09:16:34'),
	('fixter', 'Bike', 'Fixter', '-836512833', 'cycles', 44750, '2024-10-09 09:16:34'),
	('fk8', 'Honda', 'FK8', '-1745789659', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('flashgt', 'Vapid', 'Flash GT', '-1259134696', 'sports', 1600000, '2024-10-09 09:16:33'),
	('flatbed', 'MTL', 'Flatbed Truck', '1353720154', 'industrial', 1070000, '2024-10-09 09:16:33'),
	('flhxs_streetglide_special18', 'Harley-Davidson', 'FLHX Streetglide Special 18', '196279228', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('fmj', 'Vapid', 'FMJ', '1426219628', 'super', 2500000, '2024-10-09 09:16:34'),
	('forgt50020', 'Ford', 'Ford GT 500 20', '-1532987787', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('forklift', 'HVY', 'Forklift', '1491375716', 'utility', 1500000, '2024-10-09 09:16:34'),
	('formula', 'Progen', 'PR4', '340154634', 'openwheel', 1000000, '2024-10-09 09:16:34'),
	('formula2', 'Ocelot', 'R88', '-1960756985', 'openwheel', 1000000, '2024-10-09 09:16:32'),
	('fortwo17', 'Smart', 'Fortwo 17', '-469037778', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('fpaceprior', 'Jaguar', 'F-Pace Prior', '948750324', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('fq2', 'Fathom', 'FQ2', '-1137532101', 'suvs', 1850000, '2024-10-09 09:16:32'),
	('freecrawler', 'Canis', 'Freecrawler', '-54332285', 'offroad', 1056000, '2024-10-09 09:16:33'),
	('freight', 'Unknown', 'Freight Train', '1030400667', 'service', 1000000, '2024-10-09 09:16:33'),
	('frogger', 'Maibatsu', 'Frogger', '744705981', 'helicopters', 5200000, '2024-10-09 09:16:34'),
	('frogger2', 'Maibatsu', 'Frogger', '1949211328', 'helicopters', 5200000, '2024-10-09 09:16:33'),
	('fugitive', 'Cheval', 'Fugitive', '1909141499', 'sedans', 1200000, '2024-10-09 09:16:33'),
	('furai', 'Mazda', 'Furai', '1312899117', 'oneofone', 1, '2024-10-09 09:16:34'),
	('furia', 'Grotti', 'Furia', '960812448', 'super', 2600000, '2024-10-09 09:16:34'),
	('furoregt', 'Lampadati', 'Furore GT', '-1089039904', 'sports', 1560000, '2024-10-09 09:16:35'),
	('futo', 'Karin', 'Futo', '2016857647', 'coupes', 1750000, '2024-10-09 09:16:33'),
	('futo2', 'Karin', 'Futo GTX', '-1507230520', 'sports', 2000000, '2024-10-09 09:16:34'),
	('fxxk', 'Ferrari', 'FXX K', '1200120654', 'oneofone', 1, '2024-10-09 09:16:33'),
	('fxxkevo', 'Ferrari', 'FXXK Evo', '235772231', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('g63', 'Mercedes', 'G63', '572528485', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('g63c', 'Mercedes', 'G63 C', '123107141', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('G63Sam', 'Mercedes', 'G63 Sam', '-830050292', 'oneoften', 1, '2024-10-09 09:16:34'),
	('G65', 'Mercedes', 'G65', '178350184', 'IMPORT', 1, '2024-10-09 09:16:35'),
	('g700brabusretuned', 'Mercedes', 'G700 Brabus Retuned', '778435445', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('g81hr', 'BMW', 'G81 HR', '-1573472920', 'oneofone', 1, '2024-10-09 09:16:34'),
	('g900przemo6x6', 'Mercedes', 'G900 Przemo 6x6', '1492231774', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('gargoyle', 'Western', 'Gargoyle', '741090084', 'motorcycles', 1450000, '2024-10-09 09:16:33'),
	('gauntlet', 'Bravado', 'Gauntlet', '-1800170043', 'muscle', 1275000, '2024-10-09 09:16:34'),
	('gauntlet2', 'Bravado', 'Redwood Gauntlet', '349315417', 'muscle', 1050000, '2024-10-09 09:16:34'),
	('gauntlet3', 'Bravado', 'Classic Gauntlet', '722226637', 'muscle', 1125000, '2024-10-09 09:16:32'),
	('gauntlet4', 'Bravado', 'Gauntlet Hellfire', '1934384720', 'muscle', 1200000, '2024-10-09 09:16:33'),
	('gauntlet5', 'Bravado', 'Gauntlet Classic Custom', '-2122646867', 'muscle', 1800000, '2024-10-09 09:16:33'),
	('gauntlet6', 'Bravado', 'Hotring Hellfire', '1336514315', 'sports', 2620000, '2024-10-09 09:16:33'),
	('gb200', 'Vapid', 'GB 200', '1909189272', 'sports', 1800000, '2024-10-09 09:16:33'),
	('gburrito2', 'Declasse', 'Burrito Custom', '296357396', 'vans', 228450, '2024-10-09 09:16:32'),
	('gcma4sedan2021', 'Audi', 'GCM A4 Sedan 2021', '336470085', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('gcmlamboultimae', 'Lamborghini', 'GCM Lamboultimae', '214886145', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('gcram1500', 'Dodge', 'GC Ram 1500', '122037057', 'DEALERSHIP', 1000000, '2024-10-09 09:16:34'),
	('gemera', 'Koenigsegg', 'Gemera', '285057540', 'oneofone', 1, '2024-10-09 09:16:34'),
	('gfuckedsupra', 'Toyota', 'GFucked Supra', '170614576', 'IMPORT', 1, '2024-10-09 09:16:35'),
	('giulia_2021', 'Alfa Romeo', 'Giulia 2021', '100509671', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('gl63', 'Mercedes', 'GL63', '1382221388', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:35'),
	('glendale', 'Benefactor', 'Glendale', '75131841', 'sedans', 950000, '2024-10-09 09:16:33'),
	('glendale2', 'Benefactor', 'Glendale Custom', '-913589546', 'sedans', 900000, '2024-10-09 09:16:34'),
	('gmcev2', 'GMC', 'GMC EV2', '-674056502', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('GODz95GSX', 'Mitsubishi', 'GODz 95 GSX', '2048043048', 'oneofone', 1, '2024-10-09 09:16:34'),
	('GODzBMWS1000RR', 'BMW', 'GODz BMW S1000RR', '319992222', 'oneoftenbikes', 1, '2024-10-09 09:16:34'),
	('GODzDRIFTCAT', 'Mercedes', 'GODz Drift Cat', '123242153', 'oneofone', 1, '2024-10-09 09:16:35'),
	('GODzKSTERZOTACHA', 'Unknown', 'GODz Ksterz Otacha', '1680501288', 'oneoften', 1, '2024-10-09 09:16:34'),
	('GODzNINJAH2', 'Kawasaki', 'GODz Ninja H2', '718169509', 'oneoftenbikes', 1, '2024-10-09 09:16:33'),
	('GODzOOF6x6', 'Custom', 'GODz OOF 6x6', '-1043736490', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('GODzRAMTRX6x6', 'Dodge', 'GODz RAM TRX 6x6', '-1047672102', 'oneoften', 1, '2024-10-09 09:16:34'),
	('GODzRB26SUBI', 'Subaru', 'GODz RB26 Subi', '-208864293', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('GODzVIPS63AMG', 'Mercedes', 'GODz VIP S63 AMG', '-1439305004', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('GODzYAMR1', 'Yamaha', 'GODz YAM R1', '1594105967', 'IMPORT', 1, '2024-10-09 09:16:32'),
	('golf1', 'Volkswagen', 'Golf 1', '-403984030', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:35'),
	('golf7', 'Volkswagen', 'Golf 7', '1993953079', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('golf75r', 'Volkswagen', 'Golf 7.5 R', '406183167', 'IMPORT', 1, '2024-10-09 09:16:35'),
	('golf8gti', 'Volkswagen', 'Golf 8 GTI', '1933250471', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('golf91wideprzemo', 'Volkswagen', 'Golf 91 Wide Przemo', '-913280517', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('gp1', 'Progen', 'GP1', '1234311532', 'super', 3200000, '2024-10-09 09:16:34'),
	('granger', 'Declasse', 'Granger', '-1775728740', 'suvs', 2200000, '2024-10-09 09:16:35'),
	('granger2', 'Declasse', 'Granger 3600LX', '-261346873', 'suvs', 2210000, '2024-10-09 09:16:33'),
	('greenwood', 'Bravado', 'Greenwood', '40817712', 'muscle', 1350000, '2024-10-09 09:16:33'),
	('gresley', 'Bravado', 'Gresley', '-1543762099', 'suvs', 1500000, '2024-10-09 09:16:34'),
	('growler', 'Pfister', 'Growler', '1304459735', 'sports', 2100000, '2024-10-09 09:16:35'),
	('gt17', 'Ford', 'GT 17', '-2011325074', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('gt2rs', 'Porsche', 'GT2 RS', '-302443788', 'oneofone', 1, '2024-10-09 09:16:34'),
	('gt3demon', 'Porsche', 'GT3 Demon', '1259700081', 'oneofone', 1, '2024-10-09 09:16:33'),
	('gt3hycade', 'Porsche', 'GT3 Hycade', '-887152934', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('gt500', 'Grotti', 'GT500', '-2079788230', 'sportsclassics', 2210000, '2024-10-09 09:16:35'),
	('gt63', 'Mercedes', 'GT 63', '-248071157', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('gt63mt', 'Mercedes', 'GT 63 MT', '-865577339', 'oneoften', 1, '2024-10-09 09:16:35'),
	('gt86trust', 'Toyota', 'GT86 Trust', '1276173343', 'oneofone', 1, '2024-10-09 09:16:34'),
	('gta5rp_veh_ferrari19', 'Ferrari', 'GTA5 RP Ferrari 19', '143117753', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('gta5rp_veh_gle1', 'Mercedes', 'GTA5 RP Veh GLE 1', '-1423362619', 'oneoften', 1, '2024-10-09 09:16:33'),
	('gta5rp_veh_gtr33', 'Nissan', 'GTA5 RP Veh GTR33', '594603569', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('gto66c', 'Pontiac', 'GTO 66 C', '-791580259', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('gtr50', 'Nissan', 'GTR 50', '-221995372', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('gtrh', 'Nissan', 'GTR H', '-1771474146', 'oneofone', 1, '2024-10-09 09:16:35'),
	('gtz34be', 'Nissan', 'GTZ 34 BE', '4663782', 'oneofone', 1, '2024-10-09 09:16:34'),
	('guardian', 'Vapid', 'Guardian', '-2107990196', 'industrial', 1970000, '2024-10-09 09:16:34'),
	('gxone', 'Lexus', 'GX One', '497958578', 'oneofone', 1, '2024-10-09 09:16:33'),
	('h2m', 'Kawasaki', 'H2 M', '-138298961', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('habanero', 'Emperor', 'Habanero', '884422927', 'suvs', 2000000, '2024-10-09 09:16:33'),
	('hakuchou', 'Shitzu', 'Hakuchou', '1265391242', 'motorcycles', 1300000, '2024-10-09 09:16:32'),
	('hakuchou2', 'Shitzu', 'Hakuchou Drag', '-255678177', 'motorcycles', 1350000, '2024-10-09 09:16:35'),
	('halftrack', 'Bravado', 'Half-track', '-32236122', 'military', 1000000, '2024-10-09 09:16:34'),
	('handler', 'HVY', 'Dock Handler', '444583674', 'industrial', 1670000, '2024-10-09 09:16:34'),
	('hauler', 'Jobuilt', 'Hauler', '1518533038', 'commercial', 1000000, '2024-10-09 09:16:33'),
	('hauler2', 'Jobuilt', 'Hauler Custom', '387748548', 'commercial', 1000000, '2024-10-09 09:16:34'),
	('havok', 'Nagasaki', 'Havok', '-1984275979', 'helicopters', 5200000, '2024-10-09 09:16:34'),
	('hellcatf9', 'Dodge', 'Hellcat F9', '701647779', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('hellcatlb', 'Dodge', 'Hellcat LB', '-1624886479', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:32'),
	('hellion', 'Annis', 'Hellion', '-362150785', 'offroad', 1412000, '2024-10-09 09:16:33'),
	('hermes', 'Albany', 'Hermes', '15219735', 'muscle', 1025000, '2024-10-09 09:16:35'),
	('hexer', 'LCC', 'Hexer', '301427732', 'motorcycles', 1035000, '2024-10-09 09:16:32'),
	('hexerz2', 'Unknown', 'Hexer Z2', '-1716958872', 'oneoftenbikes', 1, '2024-10-09 09:16:33'),
	('hotknife', 'Vapid', 'Hotknife', '37348240', 'muscle', 1350000, '2024-10-09 09:16:33'),
	('howard', 'Unknown', 'Howard NX-25', '-1007528109', 'planes', 4500000, '2024-10-09 09:16:34'),
	('hunter', 'Unknown', 'FH-1 Hunter', '-42959138', 'helicopters', 5200000, '2024-10-09 09:16:33'),
	('huntley', 'Enus', 'Huntley S', '486987393', 'suvs', 2450000, '2024-10-09 09:16:33'),
	('huracanpriorbeast', 'Lamborghini', 'Huracan Prior Beast', '-761330702', 'oneofone', 1, '2024-10-09 09:16:34'),
	('hustler', 'Vapid', 'Hustler', '600450546', 'muscle', 1425000, '2024-10-09 09:16:35'),
	('hycadeevo', 'Mitsubishi', 'Hycade Evo', '1179345070', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('Hycaders6', 'Audi', 'Hycade RS6', '-139334333', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('hycadesti', 'Subaru', 'Hycad ESTI', '-931654709', 'oneofone', 1, '2024-10-09 09:16:35'),
	('hycadeurus', 'Lamborghini', 'Hycade Urus', '1623300705', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('hydra', 'Mammoth', 'Hydra', '970385471', 'planes', 4500000, '2024-10-09 09:16:34'),
	('hyundaiveloster', 'Hyundai', 'Hyundai Veloster', '-802877305', 'oneoften', 1, '2024-10-09 09:16:34'),
	('ignus', 'Pegassi', 'Ignus', '-1444114309', 'super', 2240000, '2024-10-09 09:16:33'),
	('ikx3abt20', 'Audi', 'IK X3 ABT 20', '340814357', 'oneofone', 1, '2024-10-09 09:16:33'),
	('ikx3mc2021', 'Audi', 'IK X3 MC 2021', '1681704727', 'oneofone', 1, '2024-10-09 09:16:33'),
	('ikx3rebel22', 'BMW', 'IK X3 Rebel 22', '-2072952302', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('imorgon', 'Överflöd', 'Imorgon', '-1132721664', 'sports', 2400000, '2024-10-09 09:16:33'),
	('impaler', 'Vapid', 'Impaler', '-2096690334', 'muscle', 1525000, '2024-10-09 09:16:34'),
	('impaler3', 'Vapid', 'Impaler Future Shock', '-1924800695', 'muscle', 1525000, '2024-10-09 09:16:33'),
	('imperator', 'Vapid', 'Imperator Arena', '444994115', 'muscle', 1325000, '2024-10-09 09:16:33'),
	('imperator3', 'Vapid', 'Imperator Nightmare', '-755532233', 'muscle', 1425000, '2024-10-09 09:16:33'),
	('impronta4', 'Unknown', 'Impronta 4', '1283668051', 'oneofone', 1, '2024-10-09 09:16:33'),
	('inductor', 'Coil', 'Inductor', '-897824023', 'cycles', 10950, '2024-10-09 09:16:33'),
	('inductor2', 'Coil', 'Junk Energy Inductor', '-1983622024', 'cycles', 99500, '2024-10-09 09:16:34'),
	('infernus', 'Pegassi', 'Infernus', '418536135', 'super', 3700000, '2024-10-09 09:16:35'),
	('infernus2', 'Pegassi', 'Infernus Classic', '-1405937764', 'sportsclassics', 2165000, '2024-10-09 09:16:35'),
	('ingot', 'Vulcar', 'Ingot', '-1289722222', 'sedans', 1000000, '2024-10-09 09:16:35'),
	('innovation', 'LLC', 'Innovation', '-159126838', 'motorcycles', 1400000, '2024-10-09 09:16:33'),
	('intruder', 'Karin', 'Intruder', '886934177', 'sedans', 1800000, '2024-10-09 09:16:33'),
	('issi2', 'Weeny', 'Issi', '-1177863319', 'compacts', 1100000, '2024-10-09 09:16:34'),
	('issi7', 'Weeny', 'Issi Sport', '1854776567', 'compacts', 800000, '2024-10-09 09:16:33'),
	('issi8', 'Weeny', 'Issi Rally', '1550581940', 'sports', 2000000, '2024-10-09 09:16:34'),
	('italigtb', 'Progen', 'Itali GTB', '-2048333973', 'super', 2400000, '2024-10-09 09:16:32'),
	('italigtb2', 'Progen', 'Itali GTB Custom', '-482719877', 'super', 3000000, '2024-10-09 09:16:33'),
	('italigto', 'Progen', 'Itali GTO', '-331467772', 'sports', 1200000, '2024-10-09 09:16:34'),
	('italirsx', 'Progen', 'Itali RSX', '-1149725334', 'sports', 1200000, '2024-10-09 09:16:33'),
	('iwagen', 'I-Wagen', 'Obey', '662793086', 'sedans', 2250000, '2024-10-09 09:16:32'),
	('jackal', 'Ocelot', 'Jackal', '-624529134', 'coupes', 1900000, '2024-10-09 09:16:35'),
	('jagoffroad', 'Jaguar', 'Jag Offroad', '-604937789', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('jes21', 'Koenigsegg', 'Jes 21', '1227057313', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('jesko', 'Koenigsegg', 'Jesko', '-604287337', 'oneofone', 1, '2024-10-09 09:16:35'),
	('jester', 'Dinka', 'Jester', '-1297672541', 'sports', 2645000, '2024-10-09 09:16:33'),
	('jester2', 'Dinka', 'Jester Racecar', '-1106353882', 'sports', 1200000, '2024-10-09 09:16:35'),
	('jester3', 'Dinka', 'Jester Classic', '-214906006', 'sports', 1700000, '2024-10-09 09:16:33'),
	('jester4', 'Dinka', 'Jester RR', '-1582061455', 'sports', 2800000, '2024-10-09 09:16:34'),
	('jet', 'Unknown', 'Jet', '1058115860', 'planes', 4500000, '2024-10-09 09:16:33'),
	('jetmax', 'Shitzu', 'Jetmax', '861409633', 'boats', 400000, '2024-10-09 09:16:34'),
	('journey', 'Zirconium', 'Journey', '-120287622', 'vans', 129350, '2024-10-09 09:16:33'),
	('journey2', 'Zirconium', 'Journey II', '-1627077503', 'vans', 139350, '2024-10-09 09:16:33'),
	('jubilee', 'Enus', 'Jubilee', '461465043', 'sedans', 1550000, '2024-10-09 09:16:33'),
	('jugular', 'Ocelot', 'Jugular', '-208911803', 'sports', 1600000, '2024-10-09 09:16:34'),
	('kalahari', 'Canis', 'Kalahari', '92612664', 'offroad', 1366000, '2024-10-09 09:16:35'),
	('kamacho', 'Canis', 'Kamacho', '-121446169', 'offroad', 1450000, '2024-10-09 09:16:34'),
	('kanjo', 'Dinka', 'Blista Kanjo', '409049982', 'compacts', 1500000, '2024-10-09 09:16:34'),
	('kanjosj', 'Dinka', 'Kanjo SJ', '-64075878', 'coupes', 1430000, '2024-10-09 09:16:35'),
	('kart', 'Generic', 'Kart', '-197095074', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('kawagala', 'Kawasaki', 'Kawagala', '824167151', 'oneoftenbikes', 1, '2024-10-09 09:16:35'),
	('kgc10', 'Nissan', 'KGC 10', '-1609249556', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('kgjoker', 'Unknown', 'KG Joker', '278009435', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('khamelion', 'Hijak', 'Khamelion', '544021352', 'sports', 1800000, '2024-10-09 09:16:33'),
	('khanjali', 'Unknown', 'TM-02 Khanjali Tank', '-1435527158', 'military', 1000000, '2024-10-09 09:16:33'),
	('kln', 'Unknown', 'KLN', '-313859199', 'oneofone', 1, '2024-10-09 09:16:33'),
	('km1000rr', 'Kawasaki', 'KM 1000 RR', '-1152411897', 'oneoftenbikes', 1, '2024-10-09 09:16:34'),
	('komoda', 'Lampadati', 'Komoda', '-834353991', 'sports', 1100000, '2024-10-09 09:16:34'),
	('kosatka', 'Rune', 'Kosatka', '1336872304', 'military', 1000000, '2024-10-09 09:16:34'),
	('krieger', 'Benefactor', 'Krieger', '-664141241', 'super', 4440000, '2024-10-09 09:16:33'),
	('kuruma', 'Karin', 'Kuruma', '-1372848492', 'sports', 1440000, '2024-10-09 09:16:32'),
	('l35', 'Declasse', 'Walton L35', '-1763675285', 'offroad', 1822300, '2024-10-09 09:16:34'),
	('landstalker', 'Dundreary', 'Landstalker', '1269098716', 'suvs', 1200000, '2024-10-09 09:16:34'),
	('landstalker2', 'Dundreary', 'Landstalker XL', '-838099166', 'suvs', 2600000, '2024-10-09 09:16:33'),
	('lazer', 'JoBuilt', 'P-996 Lazer', '-1281684762', 'planes', 4500000, '2024-10-09 09:16:34'),
	('lbperfs', 'Lamborghini', 'LB Performance S', '423548721', 'oneofone', 1, '2024-10-09 09:16:35'),
	('lbwk35', 'Infiniti', 'LBWK 35', '234376131', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('lc500', 'Lexus', 'LC 500', '689090322', 'oneofone', 1, '2024-10-09 09:16:34'),
	('le7b', 'Annis', 'RE-7B', '-1232836011', 'super', 2200000, '2024-10-09 09:16:34'),
	('lectro', 'Principe', 'Lectro', '640818791', 'motorcycles', 1410000, '2024-10-09 09:16:32'),
	('lguard', 'Declasse', 'Lifeguard', '469291905', 'emergency', 1100000, '2024-10-09 09:16:33'),
	('lm87', 'Benefactor', 'LM87', '-10917683', 'super', 3100000, '2024-10-09 09:16:34'),
	('locust', 'Ocelot', 'Locust', '-941272559', 'sports', 1000000, '2024-10-09 09:16:33'),
	('longfin', 'Shitzu', 'Longfin', '1861786828', 'boats', 400000, '2024-10-09 09:16:33'),
	('lpchopper2', 'Custom', 'LP Chopper 2', '982166354', 'oneoftenbikes', 1, '2024-10-09 09:16:34'),
	('lurcher', 'Bravado', 'Lurcher', '2068293287', 'muscle', 1150000, '2024-10-09 09:16:33'),
	('luxor', 'Buckingham', 'Luxor', '621481054', 'planes', 4500000, '2024-10-09 09:16:33'),
	('luxor2', 'Buckingham', 'Luxor Deluxe', '-1214293858', 'planes', 4500000, '2024-10-09 09:16:33'),
	('lynx', 'Ocelot', 'Lynx', '482197771', 'sports', 1000000, '2024-10-09 09:16:35'),
	('m135iwb', 'BMW', 'M135i WB', '1937961905', 'oneoften', 1, '2024-10-09 09:16:34'),
	('m140iss', 'BMW', 'M140 ISS', '86241023', 'oneoften', 1, '2024-10-09 09:16:33'),
	('m3e36', 'BMW', 'M3 E36', '-1127249378', 'IMPORT', 1, '2024-10-09 09:16:35'),
	('m3e46', 'BMW', 'M3 E46', '1896411446', 'oneofone', 1, '2024-10-09 09:16:33'),
	('m3e92', 'BMW', 'M3 E92', '708207258', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('m3g80mp', 'BMW', 'M3 G80 MP', '-1839523199', 'DEALERSHIP', 1000000, '2024-10-09 09:16:34'),
	('m3s', 'BMW', 'M3 S', '-1224372682', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('m4c', 'BMW', 'M4 C', '-1790311237', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('M4CC', 'BMW', 'M4 CC', '1515958426', 'oneoften', 1, '2024-10-09 09:16:34'),
	('m4f82', 'BMW', 'M4 F82', '909765281', 'oneofone', 1, '2024-10-09 09:16:34'),
	('m4lb2', 'BMW', 'M4 LB2', '-1943285805', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('m4speedhunter', 'BMW', 'M4 Speedhunter', '-14781991', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('m5cs22', 'BMW', 'M5 CS 22', '2070758651', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:35'),
	('m5e60', 'BMW', 'M5 E60', '1897651510', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:35'),
	('m6e24', 'BMW', 'M6 E24', '-1714271369', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('m8benzo', 'Mercedes', 'M8 Benzo', '-1441322426', 'oneoffive', 1, '2024-10-09 09:16:35'),
	('mach1', 'Ford', 'Mach 1', '102500578', 'oneoften', 1, '2024-10-09 09:16:34'),
	('machewb', 'Ford', 'Mache WB', '-1012131486', 'oneoften', 1, '2024-10-09 09:16:35'),
	('mamba', 'Declasse', 'Mamba', '-1660945322', 'sportsclassics', 2380000, '2024-10-09 09:16:32'),
	('mammatus', 'JoBuilt', 'Mammatus', '-1746576111', 'planes', 4500000, '2024-10-09 09:16:34'),
	('manana', 'Albany', 'Manana', '-2124201592', 'muscle', 1600000, '2024-10-09 09:16:33'),
	('manana2', 'Albany', 'Manana Custom', '1717532765', 'muscle', 1200000, '2024-10-09 09:16:34'),
	('manchez', 'Maibatsu', 'Manchez', '-1523428744', 'motorcycles', 1350000, '2024-10-09 09:16:33'),
	('manchez2', 'Maibatsu', 'Manchez Scout', '1086534307', 'motorcycles', 1150000, '2024-10-09 09:16:32'),
	('manchez3', 'Maibatsu', 'Manchez Scout Classic', '1384502824', 'motorcycles', 1150000, '2024-10-09 09:16:33'),
	('manhartx7', 'BMW', 'Manhart X7', '-866037387', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('mans65', 'Mercedes', 'Mansory 65', '-128982514', 'oneofone', 1, '2024-10-09 09:16:34'),
	('manscountach', 'Lamborghini', 'Mansory Countach', '-1474973007', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('mansgt', 'Ford', 'Mansory GT', '1077932112', 'oneofone', 1, '2024-10-09 09:16:33'),
	('manspana', 'Porsche', 'Mansory Panamera', '-1193002042', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('mansrs6', 'Audi', 'Mansory RS6', '-876161554', 'IMPORT', 1, '2024-10-09 09:16:35'),
	('manssupersnake', 'Ford', 'Mansory Super Snake', '1343921203', 'oneofone', 1, '2024-10-09 09:16:34'),
	('mansurus', 'Lamborghini', 'Mansory Urus', '1105878441', 'IMPORT', 1, '2024-10-09 09:16:32'),
	('marquis', 'Dinka', 'Marquis', '-1043459709', 'boats', 400000, '2024-10-09 09:16:34'),
	('massacro', 'Dewbauchee', 'Massacro', '-142942670', 'sports', 2200000, '2024-10-09 09:16:33'),
	('massacro2', 'Dewbauchee', 'Massacro Racecar', '-631760477', 'sports', 1600000, '2024-10-09 09:16:33'),
	('maverick', 'Buckingham', 'Maverick', '-1660661558', 'helicopters', 5200000, '2024-10-09 09:16:33'),
	('maybach', 'Mercedes', 'Maybach', '260207830', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('mayg600p', 'Mercedes', 'Maybach G600 P', '-977091317', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('mercec63s', 'Mercedes', 'Mercedes C63 S', '-384258214', 'oneoften', 1, '2024-10-09 09:16:33'),
	('merse63', 'Mercedes', 'Merse 63', '1130048499', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:35'),
	('mesa', 'Canis', 'Mesa', '914654722', 'offroad', 1028000, '2024-10-09 09:16:34'),
	('mesa3', 'Canis', 'Mesa Merryweather', '-2064372143', 'offroad', 1760000, '2024-10-09 09:16:34'),
	('metrotrain', 'Unknown', 'Metro Train', '868868440', 'service', 1000000, '2024-10-09 09:16:33'),
	('mi8', 'BMW', 'MI 8', '-750481609', 'oneofone', 1, '2024-10-09 09:16:34'),
	('michelli', 'Lampadati', 'Michelli GT', '1046206681', 'sportsclassics', 2100000, '2024-10-09 09:16:33'),
	('microlight', 'Unknown', 'Ultralight', '-1763555241', 'planes', 4500000, '2024-10-09 09:16:33'),
	('miljet', 'Buckingham', 'Miljet', '165154707', 'planes', 4500000, '2024-10-09 09:16:35'),
	('minitank', 'Unknown', 'RC Tank', '-1254331310', 'military', 1000000, '2024-10-09 09:16:33'),
	('minivan', 'Vapid', 'Minivan', '-310465116', 'vans', 139300, '2024-10-09 09:16:34'),
	('minivan2', 'Vapid', 'Minivan Custom', '-1126264336', 'vans', 199000, '2024-10-09 09:16:33'),
	('mixer', 'HVY', 'Mixer', '-784816453', 'industrial', 1870000, '2024-10-09 09:16:33'),
	('mixer2', 'HVY', 'Mixer II', '475220373', 'industrial', 1070000, '2024-10-09 09:16:34'),
	('mk4hycade', 'Toyota', 'MK4 Hycade', '-1630378078', 'oneofone', 1, '2024-10-09 09:16:33'),
	('mlbrabus', 'Mercedes', 'ML Brabus', '-346924611', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('mlnovitec', 'Mercedes', 'ML Novitec', '-751163311', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('model3', 'Tesla', 'Model 3', '967185883', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('models', 'Tesla', 'Model S', '-252836656', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('modelx', 'Tesla', 'Model X', '1281801152', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('mogul', 'Mammoth', 'Mogul', '-749299473', 'planes', 4500000, '2024-10-09 09:16:34'),
	('molotok', 'Unknown', 'V-65 Molotok', '1565978651', 'planes', 4500000, '2024-10-09 09:16:33'),
	('monroe', 'Pegassi', 'Monroe', '-433375717', 'sportsclassics', 1955000, '2024-10-09 09:16:34'),
	('monstrociti', 'Maibatsu', 'MonstroCiti', '802856453', 'offroad', 1112000, '2024-10-09 09:16:33'),
	('moonbeam', 'Declasse', 'Moonbeam', '525509695', 'vans', 258900, '2024-10-09 09:16:33'),
	('moonbeam2', 'Declasse', 'Moonbeam Custom', '1896491931', 'vans', 298500, '2024-10-09 09:16:33'),
	('mower', 'Jacksheepe', 'Lawn Mower', '1783355638', 'utility', 1000000, '2024-10-09 09:16:34'),
	('msls', 'Mercedes', 'MS LS', '-551921925', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('mteche39', 'BMW', 'M-Tech E39', '1026616240', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('mule', 'Maibatsu', 'Mule', '904750859', 'commercial', 400000, '2024-10-09 09:16:34'),
	('mule2', 'Maibatsu', 'Mule', '-1050465301', 'vans', 796000, '2024-10-09 09:16:34'),
	('mule3', 'Maibatsu', 'Mule', '-2052737935', 'vans', 806000, '2024-10-09 09:16:35'),
	('mule4', 'Maibatsu', 'Mule Custom', '1945374990', 'commercial', 400000, '2024-10-09 09:16:33'),
	('mule5', 'Maibatsu', 'Mule (Heist)', '1343932732', 'commercial', 400000, '2024-10-09 09:16:34'),
	('mustang65', 'Ford', 'Mustang 65', '-1567919678', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('mv2019', 'MV Agusta', 'MV 2019', '1239016987', 'oneoftenbikes', 1, '2024-10-09 09:16:33'),
	('mxpan', 'Mazda', 'MX Pan', '1323262305', 'oneofone', 1, '2024-10-09 09:16:33'),
	('nebula', 'Vulcar', 'Nebula', '-882629065', 'sportsclassics', 2740000, '2024-10-09 09:16:34'),
	('nemesis', 'Principe', 'Nemesis', '-634879114', 'motorcycles', 1300000, '2024-10-09 09:16:34'),
	('neo', 'Vysser', 'Neo', '-1620126302', 'sports', 1600000, '2024-10-09 09:16:32'),
	('neon', 'Pfister', 'Neon', '-1848994066', 'sports', 2500000, '2024-10-09 09:16:34'),
	('neonp1', 'McLaren', 'Neon P1', '555602948', 'oneofone', 1, '2024-10-09 09:16:33'),
	('nero', 'Truffade', 'Nero', '1034187331', 'super', 4000000, '2024-10-09 09:16:34'),
	('nero2', 'Truffade', 'Nero Custom', '1093792632', 'super', 3200000, '2024-10-09 09:16:34'),
	('newsvan', 'Generic', 'News Van', '-74027062', 'BUSINESS', 1, '2024-10-09 09:16:33'),
	('nightblade', 'WMC', 'Nightblade', '-1606187161', 'motorcycles', 1830000, '2024-10-09 09:16:34'),
	('nimbus', 'Buckingham', 'Nimbus', '-1295027632', 'planes', 4500000, '2024-10-09 09:16:34'),
	('ninef', 'Obey', '9F', '1032823388', 'sports', 1900000, '2024-10-09 09:16:33'),
	('ninef2', 'Obey', '9F Cabrio', '-1461482751', 'sports', 2100000, '2024-10-09 09:16:33'),
	('ninjah2', 'Kawasaki', 'Ninja H2', '1911052153', 'oneoftenbikes', 1, '2024-10-09 09:16:33'),
	('nismo20', 'Nissan', 'Nismo 20', '128072929', 'oneoften', 1, '2024-10-09 09:16:33'),
	('nissanr36', 'Nissan', 'Nissan R36', '1581308249', 'oneoften', 1, '2024-10-09 09:16:33'),
	('nissantitan17', 'Nissan', 'Nissan Titan 17', '1221510024', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('nitro10', 'Dodge', 'Nitro 10', '-1930022399', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('nitro11', 'Dodge', 'Nitro 11', '2059799969', 'BUSINESS', 1, '2024-10-09 09:16:34'),
	('nitro4', 'Dodge', 'Nitro 4', '324984409', 'BUSINESS', 1, '2024-10-09 09:16:32'),
	('nitro5', 'Dodge', 'Nitro 5', '561150596', 'BUSINESS', 1, '2024-10-09 09:16:33'),
	('nitro7', 'Dodge', 'Nitro 7', '-890122880', 'BUSINESS', 1, '2024-10-09 09:16:35'),
	('nitro8', 'Dodge', 'Nitro 8', '-1261526726', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('nitro9', 'Dodge', 'Nitro 9', '1881380837', 'oneoften', 1, '2024-10-09 09:16:35'),
	('nokota', 'Unknown', 'P-45 Nokota', '1036591958', 'planes', 4500000, '2024-10-09 09:16:35'),
	('novak', 'Lampadati', 'Novak', '-1829436850', 'suvs', 2000000, '2024-10-09 09:16:34'),
	('nsx17', 'Acura', 'NSX 17', '2133415987', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('omnis', 'Wow', 'Omnis', '-777172681', 'sports', 1800000, '2024-10-09 09:16:34'),
	('omnisegt', 'Obey', 'Omnis e-GT', '-505223465', 'sports', 2700000, '2024-10-09 09:16:32'),
	('openwheel1', 'Benefactor', 'BR8', '1492612435', 'openwheel', 1000000, '2024-10-09 09:16:34'),
	('openwheel2', 'Declasse', 'DR1', '1181339704', 'openwheel', 1000000, '2024-10-09 09:16:32'),
	('oppressor', 'Pegassi', 'Oppressor', '884483972', 'motorcycles', 1000000, '2024-10-09 09:16:33'),
	('oracle', 'Übermacht', 'Oracle', '1348744438', 'sedans', 1200000, '2024-10-09 09:16:33'),
	('oracle2', 'Übermacht', 'Oracle XS', '-511601230', 'coupes', 1800000, '2024-10-09 09:16:33'),
	('osiris', 'Pegassi', 'Osiris', '1987142870', 'super', 4400000, '2024-10-09 09:16:33'),
	('outlaw', 'Nagasaki', 'Outlaw', '408825843', 'offroad', 2535000, '2024-10-09 09:16:34'),
	('oycdefender', 'Land Rover', 'OYC Defender', '1255364829', 'IMPORT', 1, '2024-10-09 09:16:35'),
	('oycgr', 'Toyota', 'OYC GR', '-461351061', 'oneoften', 1, '2024-10-09 09:16:34'),
	('p1lbwk', 'McLaren', 'P1 LBWK', '853240097', 'oneofone', 1, '2024-10-09 09:16:35'),
	('p8tempus', 'Generic', 'P8 Tempus', '-89063262', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('packer', 'MTL', 'Packer', '569305213', 'commercial', 1000000, '2024-10-09 09:16:33'),
	('panamturs21', 'Porsche', 'Panam Turs 21', '-1787160698', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('panthere', 'Toundra', 'Panthere', '2100457220', 'sports', 1100000, '2024-10-09 09:16:34'),
	('panto', 'Benefactor', 'Panto', '-431692672', 'compacts', 750000, '2024-10-09 09:16:33'),
	('paradise', 'Bravado', 'Paradise', '1488164764', 'vans', 179100, '2024-10-09 09:16:34'),
	('pariah', 'Ocelot', 'Pariah', '867799010', 'sports', 1800000, '2024-10-09 09:16:34'),
	('passat', 'Volkswagen', 'Passat', '-1773424714', 'IMPORT', 1, '2024-10-09 09:16:32'),
	('patriot', 'Mammoth', 'Patriot', '-808457413', 'suvs', 2100000, '2024-10-09 09:16:35'),
	('patriot2', 'Mammoth', 'Patriot Stretch', '-420911112', 'suvs', 2100000, '2024-10-09 09:16:33'),
	('patriot3', 'Mil-Spec', 'Patriot Military', '-670086588', 'suvs', 2700000, '2024-10-09 09:16:34'),
	('patrolboat', 'Unknown', 'Kurtz 31 Patrol Boat', '-276744698', 'boats', 400000, '2024-10-09 09:16:33'),
	('pbus', 'Vapid', 'Police Prison Bus', '-2007026063', 'emergency', 1000000, '2024-10-09 09:16:32'),
	('pbus2', 'Unknown', 'Festival Bus', '345756458', 'service', 1000000, '2024-10-09 09:16:35'),
	('pcj', 'Shitzu', 'PCJ-600', '-909201658', 'motorcycles', 1200000, '2024-10-09 09:16:33'),
	('penetrator', 'Ocelot', 'Penetrator', '-1758137366', 'super', 3600000, '2024-10-09 09:16:34'),
	('penumbra', 'Maibatsu', 'Penumbra', '-377465520', 'sports', 1400000, '2024-10-09 09:16:35'),
	('penumbra2', 'Maibatsu', 'Penumbra FF', '-631322662', 'sports', 1000000, '2024-10-09 09:16:35'),
	('peyote', 'Vapid', 'Peyote', '1830407356', 'sportsclassics', 1995000, '2024-10-09 09:16:34'),
	('peyote2', 'Vapid', 'Peyote Gasser', '-1804415708', 'sportsclassics', 1800000, '2024-10-09 09:16:33'),
	('peyote3', 'Vapid', 'Peyote Custom', '1107404867', 'sportsclassics', 2160000, '2024-10-09 09:16:34'),
	('pfister811', 'Pfister', '811', '-1829802492', 'super', 4400000, '2024-10-09 09:16:34'),
	('phantom', 'Jobuilt', 'Phantom', '-2137348917', 'commercial', 1000000, '2024-10-09 09:16:33'),
	('phantom2', 'Jobuilt', 'Phantom Wedge', '-1649536104', 'commercial', 1000000, '2024-10-09 09:16:35'),
	('phantom3', 'Jobuilt', 'Phantom Custom', '177270108', 'commercial', 1100000, '2024-10-09 09:16:33'),
	('phoenix', 'Imponte', 'Phoenix', '-2095439403', 'muscle', 1750000, '2024-10-09 09:16:35'),
	('picador', 'Cheval', 'Picador', '1507916787', 'muscle', 1000000, '2024-10-09 09:16:33'),
	('pigalle', 'Lampadati', 'Pigalle', '1078682497', 'sportsclassics', 1564000, '2024-10-09 09:16:34'),
	('polestar1', 'Polestar', 'Polestar 1', '-2136912655', 'oneofone', 1, '2024-10-09 09:16:34'),
	('police', 'Vapid', 'Police Cruiser', '2046537925', 'emergency', 1000000, '2024-10-09 09:16:34'),
	('police2', 'Vapid', 'Police Buffalo', '-1627000575', 'emergency', 1000000, '2024-10-09 09:16:33'),
	('police3', 'Vapid', 'Police Interceptor', '1912215274', 'emergency', 1000000, '2024-10-09 09:16:33'),
	('police4', 'Vapid', 'Unmarked Cruiser', '-1973172295', 'emergency', 1000000, '2024-10-09 09:16:33'),
	('policeb', 'Vapid', 'Police Bike', '-34623805', 'emergency', 1100000, '2024-10-09 09:16:34'),
	('policeold1', 'Declasse', 'Police Rancher', '-1536924937', 'emergency', 1100000, '2024-10-09 09:16:34'),
	('policeold2', 'Albany', 'Police Roadcruiser', '-1779120616', 'emergency', 1100000, '2024-10-09 09:16:33'),
	('policet', 'Vapid', 'Police Transporter', '456714581', 'emergency', 1100000, '2024-10-09 09:16:33'),
	('polmav', 'Buckingham', 'Police Maverick', '353883353', 'emergency', 1100000, '2024-10-09 09:16:33'),
	('polo2018', 'Volkswagen', 'Polo 2018', '210550081', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('pony', 'Brute', 'Pony', '-119658072', 'vans', 105000, '2024-10-09 09:16:33'),
	('pony2', 'Brute', 'Pony (Smoke on the water)', '943752001', 'vans', 110000, '2024-10-09 09:16:34'),
	('por911gt3', 'Porsche', 'Porsche 911 GT3', '-1513854907', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('porche911speedhunter', 'Porsche', 'Porsche 911 Speedhunter', '656556372', 'oneoften', 1, '2024-10-09 09:16:33'),
	('postlude', 'Dinka', 'Postlude', '-294678663', 'coupes', 1000000, '2024-10-09 09:16:33'),
	('pounder', 'MTL', 'Pounder', '2112052861', 'commercial', 550000, '2024-10-09 09:16:35'),
	('pounder2', 'MTL', 'Pounder Custom', '1653666139', 'commercial', 550000, '2024-10-09 09:16:33'),
	('powersurge', 'Western', 'Powersurge', '-1386336041', 'motorcycles', 1470000, '2024-10-09 09:16:33'),
	('prairie', 'Bollokan', 'Prairie', '-1450650718', 'compacts', 1200000, '2024-10-09 09:16:32'),
	('pranger', 'Declasse', 'Park Ranger', '741586030', 'emergency', 400000, '2024-10-09 09:16:35'),
	('predator', 'Unknown', 'Police Predator', '-488123221', 'emergency', 400000, '2024-10-09 09:16:34'),
	('premier', 'Declasse', 'Premier', '-1883869285', 'sedans', 1550000, '2024-10-09 09:16:35'),
	('previon', 'Karin', 'Previon', '1416471345', 'coupes', 1490000, '2024-10-09 09:16:33'),
	('primo', 'Albany', 'Primo', '-1150599089', 'sedans', 1350000, '2024-10-09 09:16:35'),
	('primo2', 'Albany', 'Primo Custom', '-2040426790', 'sedans', 1500000, '2024-10-09 09:16:34'),
	('prototipo', 'Grotti', 'X80 Proto', '2123327359', 'super', 3700000, '2024-10-09 09:16:34'),
	('pyro', 'Buckingham', 'Pyro', '-1386191424', 'planes', 4500000, '2024-10-09 09:16:33'),
	('q8hycade', 'Audi', 'Q8 Hycade', '354212211', 'oneoften', 1, '2024-10-09 09:16:34'),
	('q8prior', 'Audi', 'Q8 Prior', '571788523', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('r300', 'Annis', '300R', '1076201208', 'sports', 1120000, '2024-10-09 09:16:33'),
	('r34h', 'Nissan', 'R34 H', '2022629226', 'oneofone', 1, '2024-10-09 09:16:34'),
	('r355', 'Nissan', 'R355', '1589686086', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('r35secret', 'Nissan', 'R35 Secret', '-1012683638', 'oneofone', 1, '2024-10-09 09:16:34'),
	('r36fp', 'Nissan', 'R36 FP', '-1409705672', 'oneofone', 1, '2024-10-09 09:16:34'),
	('r820', 'Audi', 'R820', '-143695728', 'IMPORT', 1, '2024-10-09 09:16:35'),
	('r8beastedit', 'Audi', 'R8 Beast Edition', '-716596795', 'oneofone', 1, '2024-10-09 09:16:35'),
	('radi', 'Vapid', 'Radius', '-1651067813', 'suvs', 1800000, '2024-10-09 09:16:34'),
	('raid', 'Generic', 'Raid', '-1299229688', 'IMPORT', 1, '2024-10-09 09:16:32'),
	('raiju', 'Mammoth', 'F-160 Raiju', '239897677', 'planes', 4500000, '2024-10-09 09:16:34'),
	('rallytruck', 'MTL', 'Dune', '-2103821244', 'service', 1000000, '2024-10-09 09:16:33'),
	('ramtrx6x6', 'Dodge', 'RAM TRX 6x6', '-921695977', 'oneoften', 1, '2024-10-09 09:16:33'),
	('rancherxl', 'Declasse', 'Rancher XL', '1645267888', 'offroad', 1056000, '2024-10-09 09:16:33'),
	('rapger19', 'Ford', 'Ranger 19', '-1140680424', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('rapidgt', 'Dewbauchee', 'Rapid GT', '-1934452204', 'sports', 1720000, '2024-10-09 09:16:34'),
	('rapidgt2', 'Dewbauchee', 'Rapid GT Convertible', '1737773231', 'sports', 1840000, '2024-10-09 09:16:34'),
	('rapidgt3', 'Dewbauchee', 'Rapid GT Classic', '2049897956', 'sportsclassics', 1530000, '2024-10-09 09:16:34'),
	('raptor', 'BF', 'Raptor', '-674927303', 'sports', 1800000, '2024-10-09 09:16:34'),
	('ratbike', 'Western', 'Rat Bike', '1873600305', 'motorcycles', 1250000, '2024-10-09 09:16:33'),
	('ratel', 'Vapid', 'Ratel', '-536105557', 'offroad', 1363100, '2024-10-09 09:16:34'),
	('ratloader2', 'Ratloader2', 'Ratloader', '-589178377', 'muscle', 1000000, '2024-10-09 09:16:33'),
	('rculi', 'Rolls-Royce', 'RCuli', '1640627795', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('rd', 'Yamaha', 'RD', '-1633535809', 'oneoftenbikes', 1, '2024-10-09 09:16:33'),
	('reaper', 'Pegassi', 'Reaper', '234062309', 'super', 2000000, '2024-10-09 09:16:34'),
	('rebel2', 'Vapid', 'Rebel', '-2045594037', 'offroad', 1380000, '2024-10-09 09:16:35'),
	('rebla', 'Übermacht', 'Rebla GTS', '83136452', 'suvs', 2100000, '2024-10-09 09:16:33'),
	('reever', 'Western', 'Reever', '1993851908', 'motorcycles', 1218000, '2024-10-09 09:16:33'),
	('regina', 'Dundreary', 'Regina', '-14495224', 'sedans', 1200000, '2024-10-09 09:16:33'),
	('remus', 'Annis', 'Remus', '1377217886', 'sports', 2600000, '2024-10-09 09:16:33'),
	('rentalbus', 'Brute', 'Rental Shuttle Bus', '-1098802077', 'service', 1000000, '2024-10-09 09:16:33'),
	('retinue', 'Vapid', 'Retinue', '1841130506', 'sportsclassics', 2440000, '2024-10-09 09:16:34'),
	('retinue2', 'Vapid', 'Retinue MKII', '2031587082', 'sportsclassics', 2440000, '2024-10-09 09:16:33'),
	('revolter', 'Übermacht', 'Revolter', '-410205223', 'sports', 1900000, '2024-10-09 09:16:35'),
	('rhapsody', 'Declasse', 'Rhapsody', '841808271', 'compacts', 1000000, '2024-10-09 09:16:33'),
	('rhinehart', 'Übermacht', 'Rhinehart', '-1855505138', 'sedans', 1050000, '2024-10-09 09:16:33'),
	('rhino', 'Unknown', 'Rhino Tank', '782665360', 'military', 1000000, '2024-10-09 09:16:34'),
	('riata', 'Vapid', 'Riata', '-1532697517', 'offroad', 1412000, '2024-10-09 09:16:34'),
	('riot', 'Brute', 'Police Riot', '-1205689942', 'emergency', 1000000, '2024-10-09 09:16:34'),
	('riot2', 'Unknown', 'RCV', '-1693015116', 'emergency', 10000000, '2024-10-09 09:16:33'),
	('ripley', 'HVY', 'Ripley', '-845979911', 'utility', 1000000, '2024-10-09 09:16:34'),
	('rmod240sx', 'Nissan', 'Rmod 240SX', '-221892567', 'oneofone', 1, '2024-10-09 09:16:33'),
	('rmodbentley1', 'Bentley', 'Rmod Bentley 1', '404106581', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('rmodcharger', 'Dodge', 'Rmod Charger', '-1547840082', 'oneoften', 1, '2024-10-09 09:16:34'),
	('rmodcharger69', 'Dodge', 'Rmod Charger 69', '8880015', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('rmode63s', 'Mercedes', 'Rmod E63 S', '-1497128181', 'oneoften', 1, '2024-10-09 09:16:34'),
	('rmodf40', 'Ferrari', 'Rmod F40', '-1637862878', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('rmodfordgt', 'Ford', 'Rmod Ford GT', '1865623141', 'oneofone', 1, '2024-10-09 09:16:34'),
	('rmodg65', 'Mercedes', 'Rmod G65', '340737726', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('rmodgt63', 'Mercedes', 'Rmod GT 63', '980885719', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('rmodgtr', 'Nissan', 'Rmod GTR', '-70029600', 'oneoffive', 1, '2024-10-09 09:16:32'),
	('rmodjeepg', 'Jeep', 'Rmod Jeep G', '-253083389', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('rmodm3e36', 'BMW', 'Rmod M3 E36', '47055373', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('rmodm3joker', 'BMW', 'Rmod M3 Joker', '706860338', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('rmodm4', 'BMW', 'Rmod M4', '541729238', 'oneofone', 1, '2024-10-09 09:16:34'),
	('rmodm4gts', 'BMW', 'Rmod M4 GTS', '934775262', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('rmodm4Unikat', 'BMW', 'Rmod M4 Unikat', '-579864890', 'oneoften', 1, '2024-10-09 09:16:33'),
	('rmodmk7', 'Volkswagen', 'Rmod MK7', '-1222347999', 'IMPORT', 1, '2024-10-09 09:16:35'),
	('rmodmustang', 'Ford', 'Rmod Mustang', '350464372', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('rmodp1gtr', 'McLaren', 'Rmod P1 GTR', '-1414722888', 'oneofone', 1, '2024-10-09 09:16:34'),
	('rmodpagani', 'Pagani', 'Rmod Pagani', '-1523482706', 'oneofone', 1, '2024-10-09 09:16:32'),
	('rmodr50', 'Volkswagen', 'Rmod R50', '325898467', 'IMPORT', 1, '2024-10-09 09:16:35'),
	('rmodr8alpil', 'Audi', 'Rmod R8 Alpil', '-1678844541', 'oneofone', 1, '2024-10-09 09:16:33'),
	('rmodr8alpilx', 'Audi', 'Rmod R8 Alpil X', '-1238757160', 'oneofone', 1, '2024-10-09 09:16:35'),
	('rmodr8c', 'Audi', 'Rmod R8 C', '685275230', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('rmodskyline34', 'Nissan', 'Rmod Skyline 34', '-1835937232', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('rmodsvj', 'Lamborghini', 'Rmod SVJ', '849075112', 'oneofone', 1, '2024-10-09 09:16:33'),
	('rmodx6', 'BMW', 'Rmod X6', '2045784380', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('rmodzl1', 'Chevrolet', 'Rmod ZL1', '-1293596973', 'IMPORT', 1, '2024-10-09 09:16:32'),
	('rocket', 'Unknown', 'Rocket', '798856618', 'oneoften', 1, '2024-10-09 09:16:35'),
	('rocoto', 'Obey', 'Rocoto', '2136773105', 'suvs', 1300000, '2024-10-09 09:16:33'),
	('rogue', 'Western Company', 'Rogue', '-975345305', 'planes', 4500000, '2024-10-09 09:16:34'),
	('Rolls6x6', 'Rolls-Royce', 'Rolls 6x6', '1950927547', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('RoyalCustome39m5_wb', 'BMW', 'Royal Custom E39 M5 WB', '-665460683', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('RoyalCustomKawasakiSH2', 'Kawasaki', 'Royal Custom Kawasaki SH2', '751658995', 'oneoftenbikes', 1, '2024-10-09 09:16:33'),
	('rr01', 'Rolls-Royce', 'RR 01', '288119019', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:35'),
	('rr21shelbystreet', 'Rolls-Royce', 'RR 21 Shelby Street', '1659462515', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('rrghostbyv', 'Rolls Royce', 'RR Ghost BYV', '1256664322', 'oneoften', 1, '2024-10-09 09:16:33'),
	('rroctane', 'Rolls-Royce', 'RR Octane', '1867394580', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('rrphantom', 'Rolls Royce', 'RR Phantom', '-1724630220', 'oneoften', 1, '2024-10-09 09:16:33'),
	('rrwraith', 'Rolls-Royce', 'RR Wraith', '974002163', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('rs322sedan', 'Audi', 'RS3 22 Sedan', '311795042', 'IMPORT', 1, '2024-10-09 09:16:32'),
	('rs4rk', 'Audi', 'RS4 RK', '136001179', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('rs5mans', 'Audi', 'RS5 Mansory', '-2128279531', 'oneoffive', 1, '2024-10-09 09:16:35'),
	('rs615', 'Audi', 'RS6 15', '939131970', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('rs666', 'Audi', 'RS6 66', '-1143827999', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('rs6abt20', 'Audi', 'RS6 ABT 20', '294222463', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('rs6c8', 'Audi', 'RS6 C8', '-560848940', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('rs6rabt20', 'Audi', 'RS6 R Abt 20', '1327150894', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('rs6_club77', 'Audi', 'RS6 Club 77', '-306053970', 'BUSINESS', 1, '2024-10-09 09:16:34'),
	('rs7', 'Audi', 'RS7', '1813965170', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('rs721', 'Audi', 'RS7 21', '1989114523', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('rs7beast', 'Audi', 'RS7 Beast', '1438733606', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('rs7bratwa', 'Audi', 'RS7 Bratwa', '-36902419', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:34'),
	('rs7c821', 'Audi', 'RS7 C821', '-1866537143', 'oneofone', 1, '2024-10-09 09:16:33'),
	('rs7c8beast', 'Audi', 'RS7 C8 Beast', '1698682352', 'oneoften', 1, '2024-10-09 09:16:34'),
	('rs7wide', 'Audi', 'RS7 Wide', '599841433', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('rt3000', 'Dinka', 'RT3000', '-452604007', 'sports', 1300000, '2024-10-09 09:16:33'),
	('rubble', 'Jobuilt', 'Rubble', '-1705304628', 'industrial', 1670000, '2024-10-09 09:16:33'),
	('ruffian', 'Pegassi', 'Ruffian', '-893578776', 'motorcycles', 1200000, '2024-10-09 09:16:34'),
	('RufusVanquish', 'Aston Martin', 'Rufus Vanquish', '-1650300813', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('ruiner', 'Imponte', 'Ruiner', '-227741703', 'muscle', 1350000, '2024-10-09 09:16:33'),
	('ruiner4', 'Imponte', 'Ruiner ZZ-8', '1706945532', 'muscle', 1575000, '2024-10-09 09:16:33'),
	('rumpo', 'Bravado', 'Rumpo', '1162065741', 'vans', 179100, '2024-10-09 09:16:35'),
	('rumpo3', 'Bravado', 'Rumpo Custom', '1475773103', 'vans', 388050, '2024-10-09 09:16:33'),
	('ruston', 'Hijak', 'Ruston', '719660200', 'sports', 2600000, '2024-10-09 09:16:34'),
	('rx7', 'Mazda', 'RX7', '-285576169', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('rx7veilside', 'Mazda', 'RX7 Veilside', '1752384486', 'oneoften', 1, '2024-10-09 09:16:35'),
	('RYGBus', 'Generic', 'RYG Bus', '-305508884', 'CUSTOMSPDM', 1000000, '2024-10-09 09:16:33'),
	('s1', 'Audi', 'S1', '1984719632', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('s15', 'Nissan', 'S15', '1966489524', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('s15lunar', 'Nissan', 'S15 Lunar', '447632049', 'oneofone', 1, '2024-10-09 09:16:32'),
	('s500w222', 'Mercedes', 'S500 W222', '859560111', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('s63coupe', 'Mercedes', 'S63 Coupe', '986737346', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('s63msc', 'Mercedes', 'S63 MSC', '-287900537', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('s80', 'Annis', 'S80RR', '-324618589', 'super', 3100000, '2024-10-09 09:16:33'),
	('s8d4', 'Audi', 'S8 D4', '-1493182664', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('sabregt', 'Declasse', 'Sabre GT Turbo', '-1685021548', 'muscle', 1450000, '2024-10-09 09:16:34'),
	('sabregt2', 'Declasse', 'Sabre GT Turbo Custom', '223258115', 'muscle', 1975000, '2024-10-09 09:16:33'),
	('sadler', 'Vapid', 'Sadler', '-599568815', 'utility', 1000000, '2024-10-09 09:16:34'),
	('sanchez', 'Maibatsu', 'Sanchez Livery', '788045382', 'motorcycles', 1155000, '2024-10-09 09:16:33'),
	('sanchez2', 'Maibatsu', 'Sanchez', '-1453280962', 'motorcycles', 1155000, '2024-10-09 09:16:32'),
	('sanctus', 'LCC', 'Sanctus', '1491277511', 'motorcycles', 1450000, '2024-10-09 09:16:33'),
	('sandking', 'Vapid', 'Sandking XL', '-1189015600', 'offroad', 1225000, '2024-10-09 09:16:34'),
	('sandking2', 'Vapid', 'Sandking SWB', '989381445', 'offroad', 1412000, '2024-10-09 09:16:34'),
	('savage', 'Unknown', 'Savage', '-82626025', 'helicopters', 5200000, '2024-10-09 09:16:34'),
	('savestra', 'Annis', 'Savestra', '903794909', 'sportsclassics', 1139000, '2024-10-09 09:16:35'),
	('sc1', 'Übermacht', 'SC1', '1352136073', 'super', 3800000, '2024-10-09 09:16:33'),
	('scarab', 'HVY', 'Scarab', '-1146969353', 'military', 1000000, '2024-10-09 09:16:35'),
	('schafter2', 'Benefactor', 'Schafter', '-1255452397', 'sedans', 1700000, '2024-10-09 09:16:33'),
	('schafter3', 'Benefactor', 'Schafter V12', '-1485523546', 'sports', 2000000, '2024-10-09 09:16:35'),
	('schafter4', 'Benefactor', 'Schafter LWB', '1489967196', 'sports', 2200000, '2024-10-09 09:16:34'),
	('schlagen', 'Benefactor', 'Schlagen GT', '-507495760', 'sports', 2200000, '2024-10-09 09:16:34'),
	('schwarzer', 'Benefactor', 'Schwartzer', '-746882698', 'sports', 2400000, '2024-10-09 09:16:33'),
	('scorcher', 'Bike', 'Scorcher', '-186537451', 'cycles', 55600, '2024-10-09 09:16:33'),
	('scrap', 'Vapid', 'Scrap Truck', '-1700801569', 'utility', 1470000, '2024-10-09 09:16:33'),
	('scubieblob', 'Subaru', 'Scubie Blob', '1980220721', 'IMPORT', 1, '2024-10-09 09:16:35'),
	('seabreeze', 'Western Company', 'Seabreeze', '-392675425', 'planes', 4500000, '2024-10-09 09:16:34'),
	('seashark', 'Speedophile', 'Seashark', '-1030275036', 'boats', 400000, '2024-10-09 09:16:34'),
	('seashark2', 'Speedophile', 'Seashark Lifeguard', '-616331036', 'emergency', 400000, '2024-10-09 09:16:33'),
	('seashark3', 'Speedophile', 'Seashark Yacht', '-311022263', 'boats', 400000, '2024-10-09 09:16:34'),
	('seasparrow', 'Unknown', 'Sea Sparrow', '-726768679', 'helicopters', 5200000, '2024-10-09 09:16:34'),
	('seasparrow2', 'Unknown', 'Sparrow', '1229411063', 'helicopters', 5200000, '2024-10-09 09:16:34'),
	('seasparrow3', 'Unknown', 'Sparrow (Prop)', '1593933419', 'helicopters', 5200000, '2024-10-09 09:16:35'),
	('sema10X10', 'Custom', 'Sema 10X10', '1424719030', 'IMPORT', 1, '2024-10-09 09:16:35'),
	('seminole', 'Canis', 'Seminole', '1221512915', 'suvs', 2000000, '2024-10-09 09:16:34'),
	('seminole2', 'Canis', 'Seminole Frontier', '-1810806490', 'suvs', 1300000, '2024-10-09 09:16:34'),
	('senna', 'McLaren', 'Senna', '-433961724', 'oneofone', 1, '2024-10-09 09:16:35'),
	('sentinel', 'Übermacht', 'Sentinel', '1349725314', 'coupes', 2000000, '2024-10-09 09:16:34'),
	('sentinel2', 'Übermacht', 'Sentinel XS', '873639469', 'coupes', 1300000, '2024-10-09 09:16:33'),
	('sentinel3', 'Übermacht', 'Sentinel Classic', '1104234922', 'coupes', 1000000, '2024-10-09 09:16:34'),
	('sentinel4', 'Übermacht', 'Sentinel Classic Widebody', '-1356880839', 'sports', 2800000, '2024-10-09 09:16:34'),
	('serrano', 'Benefactor', 'Serrano', '1337041428', 'suvs', 1800000, '2024-10-09 09:16:34'),
	('seven70', 'Dewbauchee', 'Seven-70', '-1757836725', 'sports', 2800000, '2024-10-09 09:16:34'),
	('sex6', 'BMW', 'Sex 6', '-1303860341', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('sf90', 'Ferrari', 'SF90', '-1820996020', 'oneofone', 1, '2024-10-09 09:16:35'),
	('shamal', 'Buckingham', 'Shamal', '-1214505995', 'planes', 4500000, '2024-10-09 09:16:35'),
	('sheava', 'Emperor', 'ETR1', '819197656', 'super', 3400000, '2024-10-09 09:16:34'),
	('sheriff', 'Declasse', 'Sheriff SUV', '-1683328900', 'emergency', 1000000, '2024-10-09 09:16:33'),
	('sheriff2', 'Vapid', 'Sheriff Cruiser', '1922257928', 'emergency', 1000000, '2024-10-09 09:16:34'),
	('shinobi', 'Nagasaki', 'Shinobi', '1353120668', 'motorcycles', 1470000, '2024-10-09 09:16:34'),
	('shotaro', 'Nagasaki', 'Shotaro', '-405626514', 'motorcycles', 1720000, '2024-10-09 09:16:33'),
	('sian', 'Lamborghini', 'Sian', '69336460', 'oneofone', 1, '2024-10-09 09:16:33'),
	('silviagd', 'Nissan', 'Silvia GD', '-1545879297', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('sinacp', 'Unknown', 'Sina CP', '964089500', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('singer', 'Porsche', 'Singer', '1614569209', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('skylift', 'HVY', 'Skylift', '1044954915', 'helicopters', 5200000, '2024-10-09 09:16:34'),
	('skyline', 'Nissan', 'Skyline', '2117711508', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('slamtruck', 'Vapid', 'Slam Truck', '-1045911276', 'utility', 1990000, '2024-10-09 09:16:34'),
	('slamvan', 'Vapid', 'Slam Van', '729783779', 'muscle', 1500000, '2024-10-09 09:16:33'),
	('slamvan2', 'Vapid', 'Lost Slam Van', '833469436', 'muscle', 1350000, '2024-10-09 09:16:34'),
	('slamvan3', 'Vapid', 'Slam Van Custom', '1119641113', 'muscle', 1550000, '2024-10-09 09:16:33'),
	('sm722', 'Benefactor', 'SM722', '775514032', 'sports', 2500000, '2024-10-09 09:16:35'),
	('sovereign', 'WMC', 'Sovereign', '743478836', 'motorcycles', 1680000, '2024-10-09 09:16:35'),
	('specialtf', 'Ferrari', 'Special TF', '175822380', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('specter', 'Dewbauchee', 'Specter', '1886268224', 'sports', 2200000, '2024-10-09 09:16:35'),
	('speeder', 'Pegassi', 'Speeder', '231083307', 'boats', 400000, '2024-10-09 09:16:33'),
	('speeder2', 'Pegassi', 'Speeder Yacht', '437538602', 'boats', 400000, '2024-10-09 09:16:34'),
	('speedo4', 'Vapid', 'Speedo Custom', '219613597', 'vans', 199000, '2024-10-09 09:16:33'),
	('speedo5', 'Vapid', 'Speedo Custom', '-44799464', 'vans', 475200, '2024-10-09 09:16:34'),
	('squalo', 'Shitzu', 'Squalo', '400514754', 'boats', 400000, '2024-10-09 09:16:33'),
	('stafford', 'Enus', 'Stafford', '321186144', 'sedans', 1200000, '2024-10-09 09:16:35'),
	('stalion', 'Declasse', 'Stallion', '1923400478', 'muscle', 1950000, '2024-10-09 09:16:34'),
	('stalion2', 'Declasse', 'Stallion Burgershot', '-401643538', 'muscle', 1000000, '2024-10-09 09:16:33'),
	('stanier', 'Vapid', 'Stanier', '-1477580979', 'sedans', 1900000, '2024-10-09 09:16:35'),
	('starling', 'Unknown', 'LF-22 Starling', '-1700874274', 'planes', 4500000, '2024-10-09 09:16:34'),
	('stinger', 'Grotti', 'Stinger', '1545842587', 'sportsclassics', 2715000, '2024-10-09 09:16:34'),
	('stingergt', 'Grotti', 'Stinger GT', '-2098947590', 'sportsclassics', 1190000, '2024-10-09 09:16:34'),
	('stingertt', 'Maibatsu', 'Itali GTO Stinger TT', '1447690049', 'sports', 2760000, '2024-10-09 09:16:35'),
	('stockade', 'Brute', 'Stockade', '1747439474', 'commercial', 1000000, '2024-10-09 09:16:32'),
	('stratum', 'Zirconium', 'Stratum', '1723137093', 'sedans', 1800000, '2024-10-09 09:16:34'),
	('streamer216', 'Mammoth', 'Streamer216', '191916658', 'planes', 4500000, '2024-10-09 09:16:33'),
	('streiter', 'Benefactor', 'Streiter', '1741861769', 'sports', 2000000, '2024-10-09 09:16:32'),
	('stretch', 'Dundreary', 'Stretch', '-1961627517', 'sedans', 2000000, '2024-10-09 09:16:33'),
	('strikeforce', 'Unknown', 'B-11 Strikeforce', '1692272545', 'planes', 4500000, '2024-10-09 09:16:32'),
	('stryder', 'Nagasaki', 'Stryder', '301304410', 'motorcycles', 1350000, '2024-10-09 09:16:34'),
	('stunt', 'Western Company', 'Mallard', '-2122757008', 'planes', 4500000, '2024-10-09 09:16:33'),
	('submersible', 'Kraken Subs', 'Submersible', '771711535', 'boats', 400000, '2024-10-09 09:16:34'),
	('submersible2', 'Kraken Subs', 'Kraken', '-1066334226', 'boats', 400000, '2024-10-09 09:16:33'),
	('sugoi', 'Dinka', 'Sugoi', '987469656', 'sports', 1700000, '2024-10-09 09:16:32'),
	('sultan', 'Karin', 'Sultan', '970598228', 'sports', 1000000, '2024-10-09 09:16:33'),
	('sultan2', 'Karin', 'Sultan Custom', '872704284', 'sports', 1100000, '2024-10-09 09:16:35'),
	('sultan3', 'Karin', 'Sultan Classic Custom', '-291021213', 'sports', 1120000, '2024-10-09 09:16:33'),
	('sultanrs', 'Karin', 'Sultan RS', '-295689028', 'sports', 1530000, '2024-10-09 09:16:33'),
	('suntrap', 'Shitzu', 'Suntrap', '-282946103', 'boats', 400000, '2024-10-09 09:16:35'),
	('superd', 'Enus', 'Super Diamond', '1123216662', 'sedans', 1600000, '2024-10-09 09:16:34'),
	('supervolito', 'Buckingham', 'SuperVolito', '710198397', 'helicopters', 5200000, '2024-10-09 09:16:33'),
	('supervolito2', 'Buckingham', 'SuperVolito Carbon', '-1671539132', 'helicopters', 5200000, '2024-10-09 09:16:33'),
	('suprapandem', 'Toyota', 'Supra Pandem', '-1753488927', 'oneoften', 1, '2024-10-09 09:16:32'),
	('surano', 'Benefactor', 'Surano', '384071873', 'sports', 1600000, '2024-10-09 09:16:32'),
	('surfer', 'BF', 'Surfer', '699456151', 'vans', 298500, '2024-10-09 09:16:34'),
	('surfer3', 'BF', 'Surfer Custom', '-1035489563', 'vans', 298050, '2024-10-09 09:16:35'),
	('surge', 'Cheval', 'Surge', '-1894894188', 'sedans', 1550000, '2024-10-09 09:16:32'),
	('swift', 'Buckingham', 'Swift', '-339587598', 'helicopters', 5200000, '2024-10-09 09:16:34'),
	('swift2', 'Buckingham', 'Swift Deluxe', '1075432268', 'helicopters', 5200000, '2024-10-09 09:16:33'),
	('swinger', 'Ocelot', 'Swinger', '500482303', 'sportsclassics', 1757000, '2024-10-09 09:16:33'),
	('swl', 'Custom', 'SWL', '-907083871', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('t20', 'Progen', 'T20', '1663218586', 'super', 3300000, '2024-10-09 09:16:33'),
	('taco', 'Brute', 'Taco Truck', '1951180813', 'vans', 897000, '2024-10-09 09:16:35'),
	('tahoma', 'Declasse', 'Tahoma Coupe', '-461850249', 'coupes', 1200000, '2024-10-09 09:16:34'),
	('tailgater', 'Obey', 'Tailgater', '-1008861746', 'sedans', 1500000, '2024-10-09 09:16:33'),
	('tailgater2', 'Obey', 'Tailgater S', '-1244461404', 'sedans', 2000000, '2024-10-09 09:16:32'),
	('taipan', 'Cheval', 'Taipan', '-1134706562', 'super', 3700000, '2024-10-09 09:16:33'),
	('tampa', 'Declasse', 'Tampa', '972671128', 'muscle', 1675000, '2024-10-09 09:16:33'),
	('tampa2', 'Declasse', 'Drift Tampa', '-1071380347', 'muscle', 1275000, '2024-10-09 09:16:33'),
	('taxi', 'Vapid', 'Taxi', '-956048545', 'service', 1000000, '2024-10-09 09:16:33'),
	('taycan', 'Porsche', 'Taycan', '1295777722', 'IMPORT', 1, '2024-10-09 09:16:32'),
	('taycanani', 'Porsche', 'Taycan Ani', '-1715150179', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('techart17', 'Porsche', 'Techart 17', '-396092791', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('tempesta', 'Pegassi', 'Tempesta', '272929391', 'super', 2400000, '2024-10-09 09:16:34'),
	('tenf', 'Obey', '10F', '-893984159', 'sports', 2700000, '2024-10-09 09:16:33'),
	('tenf2', 'Obey', '10F Widebody', '274946574', 'sports', 2300000, '2024-10-09 09:16:33'),
	('terbyte', 'Benefactor', 'Terrorbyte', '-1988428699', 'military', 1000000, '2024-10-09 09:16:33'),
	('terzo', 'Lamborghini', 'Terzo', '-2132463276', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('terzo1', 'Lamborghini', 'Terzo 1', '1681704178', 'oneoften', 1, '2024-10-09 09:16:34'),
	('teslapd', 'Tesla', 'Tesla PD', '-435728526', 'oneoften', 1, '2024-10-09 09:16:32'),
	('teslaroad', 'Tesla', 'Tesla Road', '526747911', 'IMPORT', 1, '2024-10-09 09:16:32'),
	('tezeract', 'Pegassi', 'Tezeract', '1031562256', 'super', 3400000, '2024-10-09 09:16:34'),
	('thrax', 'Truffade', 'Thrax', '1044193113', 'super', 3600000, '2024-10-09 09:16:35'),
	('thrust', 'Dinka', 'Thrust', '1836027715', 'motorcycles', 1780000, '2024-10-09 09:16:34'),
	('thruster', 'Mammoth', 'Thruster', '1489874736', 'military', 1000000, '2024-10-09 09:16:34'),
	('tigon', 'Lampadati', 'Tigon', '-1358197432', 'super', 4800000, '2024-10-09 09:16:35'),
	('tiptruck', 'Brute', 'Tipper', '48339065', 'industrial', 1470000, '2024-10-09 09:16:33'),
	('tiptruck2', 'Brute', 'Tipper II', '-947761570', 'industrial', 1270000, '2024-10-09 09:16:33'),
	('titan', 'Unknown', 'Titan', '1981688531', 'planes', 4500000, '2024-10-09 09:16:33'),
	('topcargt63', 'Mercedes', 'Top Car GT 63', '-169338100', 'oneoffive', 1, '2024-10-09 09:16:35'),
	('torero', 'Pegassi', 'Torero', '1504306544', 'sportsclassics', 1428000, '2024-10-09 09:16:33'),
	('torero2', 'Pegassi', 'Torero XO', '-165394758', 'super', 3900000, '2024-10-09 09:16:34'),
	('tornado', 'Declasse', 'Tornado', '464687292', 'sportsclassics', 1570000, '2024-10-09 09:16:34'),
	('tornado2', 'Declasse', 'Tornado Convertible', '1531094468', 'sportsclassics', 1750000, '2024-10-09 09:16:33'),
	('tornado5', 'Declasse', 'Tornado Custom', '-1797613329', 'sportsclassics', 1740000, '2024-10-09 09:16:33'),
	('toro', 'Lampadati', 'Toro', '1070967343', 'boats', 400000, '2024-10-09 09:16:33'),
	('toro2', 'Lampadati', 'Toro Yacht', '908897389', 'boats', 400000, '2024-10-09 09:16:33'),
	('toros', 'Pegassi', 'Toros', '-1168952148', 'suvs', 2500000, '2024-10-09 09:16:33'),
	('tourbus', 'Brute', 'Tour Bus', '1941029835', 'service', 1000000, '2024-10-09 09:16:33'),
	('towtruck', 'Vapid', 'Tow Truck (Large)', '-1323100960', 'utility', 1070000, '2024-10-09 09:16:34'),
	('towtruck2', 'Vapid', 'Tow Truck (Small)', '-442313018', 'utility', 1270000, '2024-10-09 09:16:34'),
	('tractor', 'Stanley', 'Tractor', '1641462412', 'utility', 1270000, '2024-10-09 09:16:35'),
	('tractor2', 'Stanley', 'Fieldmaster', '-2076478498', 'utility', 1470000, '2024-10-09 09:16:33'),
	('tractor3', 'Stanley', 'Fieldmaster', '1445631933', 'utility', 1670000, '2024-10-09 09:16:33'),
	('trailerlarge', 'Unknown', 'Mobile Operations Center', '1502869817', 'military', 1000000, '2024-10-09 09:16:34'),
	('trailersmall2', 'Vom Feuer', 'Anti-Aircraft Trailer', '-1881846085', 'military', 1000000, '2024-10-09 09:16:34'),
	('trash', 'JoBuilt', 'Trashmaster', '1917016601', 'service', 1000000, '2024-10-09 09:16:33'),
	('trash2', 'JoBuilt', 'Trashmaster', '-1255698084', 'service', 1000000, '2024-10-09 09:16:34'),
	('tribike', 'Bike', 'Whippet Race Bike', '1127861609', 'cycles', 99500, '2024-10-09 09:16:33'),
	('tribike2', 'Bike', 'Endurex Race Bike', '-1233807380', 'cycles', 13990, '2024-10-09 09:16:34'),
	('tribike3', 'Bike', 'Tri-Cycles Race Bike', '-400295096', 'cycles', 10368, '2024-10-09 09:16:34'),
	('trophytruck', 'Vapid', 'Trophy Truck', '101905590', 'offroad', 1014000, '2024-10-09 09:16:33'),
	('trophytruck2', 'Vapid', 'Desert Raid', '-663299102', 'offroad', 1352000, '2024-10-09 09:16:34'),
	('tropic', 'Shitzu', 'Tropic', '290013743', 'boats', 400000, '2024-10-09 09:16:35'),
	('tropic2', 'Shitzu', 'Tropic Yacht', '1448677353', 'boats', 400000, '2024-10-09 09:16:34'),
	('tropos', 'Lampadati', 'Tropos Rallye', '1887331236', 'sports', 1300000, '2024-10-09 09:16:33'),
	('trx', 'Ram', 'TRX', '909518807', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('TTSTO', 'Audi', 'TT STO', '1180382913', 'oneofone', 1, '2024-10-09 09:16:32'),
	('tug', 'Buckingham', 'Tug', '-2100640717', 'boats', 400000, '2024-10-09 09:16:32'),
	('tula', 'Mammoth', 'Tula', '1043222410', 'planes', 4500000, '2024-10-09 09:16:34'),
	('tulip', 'Declasse', 'Tulip', '1456744817', 'muscle', 1200000, '2024-10-09 09:16:33'),
	('tulip2', 'Declasse', 'Tulip M-100', '268758436', 'muscle', 1000000, '2024-10-09 09:16:35'),
	('turismo2', 'Grotti', 'Turismo Classic', '-982130927', 'sportsclassics', 1890000, '2024-10-09 09:16:33'),
	('turismor', 'Grotti', 'Turismo R', '408192225', 'super', 2800000, '2024-10-09 09:16:33'),
	('tyrant', 'Överflöd', 'Tyrant', '-376434238', 'super', 4200000, '2024-10-09 09:16:34'),
	('tyrus', 'Progen', 'Tyrus', '2067820283', 'super', 4600000, '2024-10-09 09:16:33'),
	('urusbeastedit', 'Lamborghini', 'Urus Beast Edit', '62476495', 'IMPORT', 1, '2024-10-09 09:16:35'),
	('Urus_Stretch_6', 'Lamborghini', 'Urus Stretch 6', '1876913310', 'ADMINONLY', 1, '2024-10-09 09:16:33'),
	('utillitruck', 'Brute', 'Utility Truck (Cherry Picker)', '516990260', 'utility', 1670000, '2024-10-09 09:16:34'),
	('utillitruck2', 'Brute', 'Utility Truck (Van)', '887537515', 'utility', 1870000, '2024-10-09 09:16:33'),
	('utillitruck3', 'Vapid', 'Utility Truck (Contender)', '2132890591', 'utility', 1070000, '2024-10-09 09:16:35'),
	('v60hr', 'Volvo', 'V60 HR', '449013693', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('vacca', 'Pegassi', 'Vacca', '338562499', 'super', 3100000, '2024-10-09 09:16:34'),
	('vader', 'Shitzu', 'Vader', '-140902153', 'motorcycles', 1620000, '2024-10-09 09:16:32'),
	('vagner', 'Dewbauchee', 'Vagner', '1939284556', 'super', 3320000, '2024-10-09 09:16:34'),
	('vagrant', 'Maxwell', 'Vagrant', '740289177', 'offroad', 1450000, '2024-10-09 09:16:35'),
	('valkyrie', 'Buckingham', 'Valkyrie', '-1600252419', 'helicopters', 5200000, '2024-10-09 09:16:33'),
	('vamos', 'Declasse', 'Vamos', '-49115651', 'muscle', 1500000, '2024-10-09 09:16:33'),
	('vanzhycade', 'Van', 'Vanz Hycade', '-491183793', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('vanztt', 'Generic', 'Van ZTT', '-1385030246', 'IMPORT', 1, '2024-10-09 09:16:34'),
	('vanzur', 'Van', 'Vanzur', '57559709', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('van_blacklions', 'Generic', 'Van Black Lions', '1705886263', 'GANG', 1, '2024-10-09 09:16:33'),
	('van_bloods', 'Generic', 'Van Bloods', '-1075668982', 'GANG', 1, '2024-10-09 09:16:34'),
	('van_bratwa', 'Generic', 'Van Bratwa', '-1144129590', 'GANG', 1, '2024-10-09 09:16:34'),
	('van_brigada', 'Generic', 'Van Brigada', '-798002684', 'GANG', 1, '2024-10-09 09:16:33'),
	('van_cali', 'Generic', 'Van Cali', '265472943', 'GANG', 1, '2024-10-09 09:16:33'),
	('van_camorra', 'Generic', 'Van Camorra', '-608308832', 'GANG', 1, '2024-10-09 09:16:34'),
	('van_club77', 'Generic', 'Van Club 77', '1843469073', 'BUSINESS', 1, '2024-10-09 09:16:33'),
	('van_criminals', 'Generic', 'Van Criminals', '1343939249', 'GANG', 1, '2024-10-09 09:16:33'),
	('van_crips', 'Generic', 'Van Crips', '435885037', 'GANG', 1, '2024-10-09 09:16:33'),
	('van_deparis', 'Generic', 'Van Deparis', '-553769471', 'GANG', 1, '2024-10-09 09:16:32'),
	('van_galaxy', 'Generic', 'Van Galaxy', '-170358368', 'BUSINESS', 1, '2024-10-09 09:16:33'),
	('van_gmbh', 'Generic', 'Van GmbH', '892094979', 'GANG', 1, '2024-10-09 09:16:34'),
	('van_gonzales', 'Generic', 'Van Gonzales', '678127595', 'GANG', 1, '2024-10-09 09:16:35'),
	('van_grove', 'Generic', 'Van Grove', '1857936747', 'GANG', 1, '2024-10-09 09:16:34'),
	('van_hoover', 'Generic', 'Van Hoover', '1119159431', 'GANG', 1, '2024-10-09 09:16:32'),
	('van_kadir', 'Generic', 'Van Kadir', '1554400201', 'GANG', 1, '2024-10-09 09:16:33'),
	('van_lcn', 'Generic', 'Van LCN', '-56174402', 'GANG', 1, '2024-10-09 09:16:33'),
	('van_lostmc', 'Generic', 'Van Lost MC', '1584695431', 'GANG', 1, '2024-10-09 09:16:34'),
	('van_medelin', 'Generic', 'Van Medelin', '1561368935', 'GANG', 1, '2024-10-09 09:16:33'),
	('van_mg13', 'Generic', 'Van MG13', '-619534212', 'GANG', 1, '2024-10-09 09:16:34'),
	('van_midnight', 'Generic', 'Van Midnight', '-458440488', 'GANG', 1, '2024-10-09 09:16:33'),
	('van_narcos', 'Generic', 'Van Narcos', '-1460322271', 'GANG', 1, '2024-10-09 09:16:33'),
	('van_ogs', 'Generic', 'Van OGS', '999626057', 'GANG', 1, '2024-10-09 09:16:34'),
	('van_orga', 'Generic', 'Van Orga', '1562589287', 'GANG', 1, '2024-10-09 09:16:33'),
	('van_osmanen', 'Generic', 'Van Osmanen', '1792332032', 'GANG', 1, '2024-10-09 09:16:33'),
	('van_peakyblinders', 'Generic', 'Van Peaky Blinders', '1144210487', 'GANG', 1, '2024-10-09 09:16:34'),
	('van_redlight', 'Generic', 'Van Red Light', '1390760687', 'GANG', 1, '2024-10-09 09:16:35'),
	('van_santasofia', 'Generic', 'Van Santa Sofia', '1256265445', 'GANG', 1, '2024-10-09 09:16:32'),
	('van_st187', 'Generic', 'Van ST187', '-1542824937', 'GANG', 1, '2024-10-09 09:16:33'),
	('van_syndicate', 'Generic', 'Van Syndicate', '-260491876', 'GANG', 1, '2024-10-09 09:16:34'),
	('van_triaden', 'Generic', 'Van Triaden', '1721988926', 'GANG', 1, '2024-10-09 09:16:34'),
	('van_tschetschenen', 'Generic', 'Van Tschetschenen', '1162889302', 'GANG', 1, '2024-10-09 09:16:33'),
	('van_vagos', 'Generic', 'Van Vagos', '-492226019', 'GANG', 1, '2024-10-09 09:16:34'),
	('van_woo', 'Generic', 'Van Woo', '-2128449264', 'GANG', 1, '2024-10-09 09:16:35'),
	('van_yakuza', 'Generic', 'Van Yakuza', '-1378101326', 'GANG', 1, '2024-10-09 09:16:33'),
	('variszupra', 'Toyota', 'Varis Supra', '1234962774', 'oneoffive', 1, '2024-10-09 09:16:34'),
	('vectre', 'Emperor', 'Vectre', '-1540373595', 'sports', 1600000, '2024-10-09 09:16:33'),
	('velum', 'JoBuilt', 'Velum', '-1673356438', 'planes', 4500000, '2024-10-09 09:16:34'),
	('velum2', 'JoBuilt', 'Velum 5-seater', '1077420264', 'planes', 4500000, '2024-10-09 09:16:34'),
	('venatus', 'Mansory', 'Venatus', '-184310767', 'oneofone', 1, '2024-10-09 09:16:35'),
	('verlierer2', 'Bravado', 'Verlierer', '1102544804', 'sports', 1810000, '2024-10-09 09:16:34'),
	('verus', 'Dinka', 'Verus', '298565713', 'offroad', 1380000, '2024-10-09 09:16:33'),
	('vestra', 'Buckingham', 'Vestra', '1341619767', 'planes', 4500000, '2024-10-09 09:16:32'),
	('vetir', 'Unknown', 'Vetir', '2014313426', 'military', 1000000, '2024-10-09 09:16:34'),
	('vigero', 'Declasse', 'Vigero', '-825837129', 'muscle', 1925000, '2024-10-09 09:16:33'),
	('vigero2', 'Declasse', 'Vigero ZX', '-1758379524', 'muscle', 1425000, '2024-10-09 09:16:34'),
	('vindicator', 'Dinka', 'Vindicator', '-1353081087', 'motorcycles', 1200000, '2024-10-09 09:16:34'),
	('virgo', 'Albany', 'Virgo', '-498054846', 'muscle', 1300000, '2024-10-09 09:16:34'),
	('virgo2', 'Dundreary', 'Virgo Custom Classic', '-899509638', 'muscle', 1150000, '2024-10-09 09:16:33'),
	('virgo3', 'Dundreary', 'Virgo Classic', '16646064', 'muscle', 1150000, '2024-10-09 09:16:34'),
	('virtue', 'Ocelot', 'Virtue', '669204833', 'super', 2440000, '2024-10-09 09:16:35'),
	('visione', 'Grotti', 'Visione', '-998177792', 'sports', 1500000, '2024-10-09 09:16:35'),
	('volatol', 'Unknown', 'Volatol', '447548909', 'planes', 4500000, '2024-10-09 09:16:34'),
	('volatus', 'Buckingham', 'Volatus', '-1845487887', 'helicopters', 5200000, '2024-10-09 09:16:34'),
	('voltic', 'Coil', 'Voltic', '-1622444098', 'super', 2400000, '2024-10-09 09:16:33'),
	('voltic2', 'Coil', 'Rocket Voltic', '989294410', 'super', 1966080, '2024-10-09 09:16:33'),
	('voodoo', 'Declasse', 'Voodoo', '2006667053', 'muscle', 1950000, '2024-10-09 09:16:33'),
	('vortex', 'Pegassi', 'Vortex', '-609625092', 'motorcycles', 1725000, '2024-10-09 09:16:34'),
	('vstr', 'Albany', 'V-STR', '1456336509', 'sports', 1600000, '2024-10-09 09:16:32'),
	('w140', 'Mercedes', 'W140', '-790722072', 'IMPORT', 1, '2024-10-09 09:16:35'),
	('w222wald', 'Mercedes', 'W222 Wald', '-737140922', 'DEALERSHIP', 1000000, '2024-10-09 09:16:34'),
	('waldw222', 'Mercedes', 'Wald W222', '-577024897', 'DEALERSHIP', 1000000, '2024-10-09 09:16:34'),
	('warrener', 'Vulcar', 'Warrener', '1373123368', 'sedans', 1100000, '2024-10-09 09:16:34'),
	('washington', 'Albany', 'Washington', '1777363799', 'sedans', 1400000, '2024-10-09 09:16:33'),
	('wastelander', 'MTL', 'Wastelander', '-1912017790', 'service', 1000000, '2024-10-09 09:16:35'),
	('weevil', 'BF', 'Weevil', '1644055914', 'compacts', 1100000, '2024-10-09 09:16:34'),
	('weevil2', 'BF', 'Weevil Custom', '-994371320', 'muscle', 1210000, '2024-10-09 09:16:33'),
	('windsor', 'Enus', 'Windsor', '1581459400', 'coupes', 1700000, '2024-10-09 09:16:33'),
	('windsor2', 'Enus', 'Windsor Drop', '-1930048799', 'coupes', 2400000, '2024-10-09 09:16:33'),
	('winky', 'Vapid', 'Winky', '-210308634', 'offroad', 1690000, '2024-10-09 09:16:34'),
	('wmfenyr', 'W Motors', 'WM Fenyr', '-1792334644', 'oneofone', 1, '2024-10-09 09:16:33'),
	('wolfsbane', 'Western', 'Wolfsbane', '-618617997', 'motorcycles', 1825000, '2024-10-09 09:16:34'),
	('wraith', 'Rolls-Royce', 'Wraith', '-1095688294', 'DEALERSHIP', 1000000, '2024-10-09 09:16:33'),
	('x6wz', 'BMW', 'X6 WZ', '-191084842', 'DEALERSHIP', 1000000, '2024-10-09 09:16:34'),
	('x6_brigada', 'BMW', 'X6 Brigada', '-2095220053', 'GANG', 1, '2024-10-09 09:16:33'),
	('x6_cali', 'BMW', 'X6 Cali', '-1440013148', 'GANG', 1, '2024-10-09 09:16:33'),
	('x6_camorra', 'BMW', 'X6 Camorra', '-1651569394', 'GANG', 1, '2024-10-09 09:16:34'),
	('x6_midnight', 'BMW', 'X6 Midnight', '-567387393', 'GANG', 1, '2024-10-09 09:16:33'),
	('x6_narcos', 'BMW', 'X6 Narcos', '1385640523', 'GANG', 1, '2024-10-09 09:16:33'),
	('x6_orga', 'BMW', 'X6 Orga', '-394771532', 'GANG', 1, '2024-10-09 09:16:34'),
	('x6_yakuza', 'BMW', 'X6 Yakuza', '-265352022', 'GANG', 1, '2024-10-09 09:16:34'),
	('xa21', 'Ocelot', 'XA-21', '917809321', 'super', 3600000, '2024-10-09 09:16:34'),
	('xc90', 'Volvo', 'XC90', '284310455', 'DEALERSHIP', 1000000, '2024-10-09 09:16:33'),
	('xls', 'Benefactor', 'XLS', '1203490606', 'suvs', 1700000, '2024-10-09 09:16:35'),
	('yosemite', 'Declasse', 'Yosemite', '1871995513', 'muscle', 1925000, '2024-10-09 09:16:34'),
	('yosemite2', 'Declasse', 'Yosemite Drift', '1693751655', 'muscle', 1250000, '2024-10-09 09:16:34'),
	('yosemite3', 'Declasse', 'Yosemite Rancher', '67753863', 'offroad', 1182500, '2024-10-09 09:16:34'),
	('youga', 'Bravado', 'Youga', '65402552', 'vans', 159200, '2024-10-09 09:16:32'),
	('youga2', 'Bravado', 'Youga Classic', '1026149675', 'vans', 288050, '2024-10-09 09:16:33'),
	('youga3', 'Bravado', 'Youga Classic 4x4', '1802742206', 'vans', 179100, '2024-10-09 09:16:34'),
	('youga4', 'Bravado', 'Youga Custom', '1486521356', 'vans', 169500, '2024-10-09 09:16:34'),
	('yzfr6', 'Yamaha', 'YZF R6', '-359650641', 'DEALERSHIP', 1000000, '2024-10-09 09:16:33'),
	('yzfr7', 'Yamaha', 'YZF R7', '418482029', 'oneoftenbikes', 1, '2024-10-09 09:16:33'),
	('z190', 'Karin', '190Z', '838982985', 'sportsclassics', 1326000, '2024-10-09 09:16:35'),
	('z8r', 'BMW', 'Z8 R', '-1028901189', 'DEALERSHIP', 1000000, '2024-10-09 09:16:34'),
	('zeno', 'Överflöd', 'Zeno', '655665811', 'super', 2700000, '2024-10-09 09:16:33'),
	('zentenario', 'Lamborghini', 'Zentenario', '-2086422402', 'IMPORT', 1, '2024-10-09 09:16:32'),
	('zentorno', 'Pegassi', 'Zentorno', '-1403128555', 'super', 2800000, '2024-10-09 09:16:34'),
	('zion', 'Übermacht', 'Zion', '-1122289213', 'coupes', 2200000, '2024-10-09 09:16:32'),
	('zion2', 'Übermacht', 'Zion Cabrio', '-1193103848', 'coupes', 1800000, '2024-10-09 09:16:33'),
	('zion3', 'Übermacht', 'Zion Classic', '1862507111', 'sportsclassics', 1650000, '2024-10-09 09:16:34'),
	('zl1', 'Chevrolet', 'ZL1', '365223774', 'IMPORT', 1, '2024-10-09 09:16:33'),
	('zlay_gtz35', 'Nissan', 'Zlay GTZ 35', '1414776775', 'oneoffive', 1, '2024-10-09 09:16:33'),
	('zombiea', 'Western', 'Zombie Bobber', '-1009268949', 'motorcycles', 1350000, '2024-10-09 09:16:34'),
	('zombieb', 'Western', 'Zombie Chopper', '-570033273', 'motorcycles', 1670000, '2024-10-09 09:16:34'),
	('zorrusso', 'Pegassi', 'Zorrusso', '-682108547', 'super', 3540000, '2024-10-09 09:16:33'),
	('zr350', 'Annis', 'ZR350', '-1858654120', 'sports', 1600000, '2024-10-09 09:16:33'),
	('ztype', 'Truffade', 'Z-Type', '758895617', 'sportsclassics', 1590000, '2024-10-09 09:16:34'),
	('zx10r', 'Kawasaki', 'ZX10R', '-714386060', 'DEALERSHIP', 1000000, '2024-10-09 09:16:34'),
	('zx6r', 'Kawasaki', 'ZX6R', '360757549', 'DEALERSHIP', 1000000, '2024-10-09 09:16:34');

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
	(1, NULL, NULL, NULL, NULL, NULL);

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

-- Dumping data for table worldisyours.drx_mdw_officers: ~0 rows (approximately)
INSERT INTO `drx_mdw_officers` (`citizenid`, `firstname`, `lastname`, `callsign`, `alias`, `phone`, `department`, `rank`, `image`, `roles`, `data`) VALUES
	('AIM07751', 'Mr', 'Doc', 401, 'DRX', '5058678976', 'LSPD', 'Head of police department', 'https://i.imgur.com/PDJ3oiB.png', '[{"access":true,"id":0,"role":"Full Access"}]', NULL);

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

-- Dumping structure for table worldisyours.ev_identifiers
CREATE TABLE IF NOT EXISTS `ev_identifiers` (
  `identifier` varchar(255) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `bloodtype` varchar(50) NOT NULL,
  `fingerprint` varchar(50) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ev_identifiers: ~0 rows (approximately)

-- Dumping structure for table worldisyours.gympass
CREATE TABLE IF NOT EXISTS `gympass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(500) NOT NULL,
  `gymid` int(11) NOT NULL,
  `gymtime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table worldisyours.gympass: ~8 rows (approximately)
INSERT INTO `gympass` (`id`, `identifier`, `gymid`, `gymtime`) VALUES
	(1, 'JLN55666', 1, 1724156054),
	(2, 'JLN55666', 2, 1725923606),
	(3, 'KVJ77630', 2, 1727142132),
	(4, 'FGB24346', 2, 1727142208),
	(5, 'OUV63962', 1, 1725480443),
	(6, 'OUV63962', 2, 1727308990),
	(7, 'QNC46912', 2, 1728075041),
	(8, 'AIM07751', 2, 1729222790),
	(9, 'CTM94839', 2, 1730963920);

-- Dumping structure for table worldisyours.gymstats
CREATE TABLE IF NOT EXISTS `gymstats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(500) NOT NULL,
  `stats` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table worldisyours.gymstats: ~30 rows (approximately)
INSERT INTO `gymstats` (`id`, `identifier`, `stats`) VALUES
	(1, 'JLN55666', '{"condition":17.29999999999999,"swimming":0.0,"strenght":18.2,"energy":100,"hygiene":50.0}'),
	(2, 'UAI42992', '{"condition":15.5,"strenght":0.0,"swimming":3.0,"energy":100,"hygiene":60.0}'),
	(3, 'GAZ46654', '{"hygiene":55.0,"strenght":0.0,"energy":100,"swimming":1.0,"condition":17.3}'),
	(4, 'HFY38105', '{"hygiene":70.0,"strenght":0.0,"energy":100,"swimming":1.0,"condition":11.9}'),
	(5, 'EXH52321', '{"hygiene":100.0,"strenght":0.0,"energy":100.0,"swimming":0.0,"condition":0.0}'),
	(6, 'CUM99608', '{"hygiene":87.5,"strenght":0.0,"energy":100,"swimming":1.0,"condition":5.0}'),
	(7, 'RBG25633', '{"condition":1.0,"strenght":0.0,"swimming":0.0,"energy":100,"hygiene":97.5}'),
	(8, 'WFU61164', '{"condition":5.0,"energy":100,"strenght":0.0,"swimming":0.0,"hygiene":87.5}'),
	(9, 'ERZ21370', '{"condition":1.0,"swimming":0.0,"hygiene":97.5,"energy":100,"strenght":0.0}'),
	(10, 'KVJ77630', '{"condition":13.7,"strenght":14.6,"swimming":0.0,"energy":100,"hygiene":97.5}'),
	(11, 'FGB24346', '{"condition":14.6,"strenght":22.49999999999999,"energy":100.0,"swimming":0.0,"hygiene":100}'),
	(12, 'JXD83837', '{"swimming":0.0,"strenght":0.0,"condition":26.49999999999997,"hygiene":27.5,"energy":100}'),
	(13, 'AIM07751', '{"condition":99.40000000000008,"energy":100,"strenght":100,"swimming":82.20000000000006,"hygiene":0}'),
	(14, 'OUV63962', '{"condition":100,"energy":100,"swimming":4.0,"strenght":100,"hygiene":27.39999999999992}'),
	(15, 'CTM94839', '{"energy":100,"swimming":0.0,"strenght":43.30000000000004,"condition":42.10000000000003,"hygiene":0}'),
	(16, 'PUX10690', '{"hygiene":62.5,"energy":100,"condition":14.6,"strenght":0.0,"swimming":0.0}'),
	(17, 'QCD01130', '{"condition":13.7,"hygiene":0,"strenght":55.00000000000006,"energy":100,"swimming":0.0}'),
	(18, 'XKU09196', '{"hygiene":100.0,"swimming":0.0,"condition":0.0,"strenght":0.0,"energy":100.0}'),
	(19, 'QNC46912', '{"strenght":100,"condition":100,"swimming":4.0,"energy":100,"hygiene":0}'),
	(20, 'BHC52575', '{"condition":8.0,"hygiene":30.0,"swimming":0.0,"energy":100,"strenght":16.4}'),
	(21, 'JVH49125', '{"hygiene":0,"energy":100,"swimming":0.0,"strenght":17.3,"condition":83.20000000000003}'),
	(22, 'LLU56122', '{"energy":100.0,"swimming":0.0,"strenght":0.0,"hygiene":100.0,"condition":0.0}'),
	(23, 'JTJ52719', '{"strenght":0.0,"energy":100.0,"condition":0.0,"swimming":0.0,"hygiene":100.0}'),
	(24, 'LPI62642', '{"strenght":0.0,"energy":100,"swimming":0.0,"condition":20.89999999999997,"hygiene":45.0}'),
	(25, 'TOD22598', '{"hygiene":80.0,"strenght":0.0,"condition":8.0,"swimming":0.0,"energy":100}'),
	(26, 'RDO88579', '{"strenght":0.0,"hygiene":70.0,"swimming":0.0,"energy":100,"condition":11.9}'),
	(27, 'ENW45444', '{"condition":70.00000000000013,"energy":100,"swimming":0.0,"strenght":20.89999999999999,"hygiene":0}'),
	(28, 'AXW11242', '{"energy":100,"strenght":0.0,"hygiene":15.0,"condition":30.5,"swimming":0.0}'),
	(29, 'GYH61824', '{"energy":100.0,"strenght":0.0,"hygiene":100.0,"condition":0.0,"swimming":0.0}'),
	(30, 'LOO91104', '{"energy":100,"strenght":0.0,"hygiene":90.0,"condition":4.0,"swimming":0.0}');

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
	(11, 'JVH49125', 'Test Testina', 'Y83748', '2024-10-02 22:54:14', '111', '80J5N724MF'),
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.houselocations: ~0 rows (approximately)

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
INSERT INTO `instagram_account` (`id`, `name`, `phone`, `username`, `password`, `avatar`, `description`, `verify`) VALUES
	('LPI62642', 'Ryan Rich', '1177833293', 'Ryan Rich', '12345', './img/app_details/default.png', NULL, 0);

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

-- Dumping structure for table worldisyours.kq_extra
CREATE TABLE IF NOT EXISTS `kq_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(256) DEFAULT '0',
  `tag` varchar(50) DEFAULT '0',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.kq_extra: ~1 rows (approximately)
INSERT INTO `kq_extra` (`id`, `player`, `tag`, `data`, `created_at`) VALUES
	(90, 'JVH49125', 'kq_outfitbag:outfit', '{"bagItem":"kq_outfitbag","data":{"drawable":{"mask":{"palette":0,"drawable":0,"texture":0},"legs":{"palette":0,"drawable":75,"texture":0},"accessory":{"palette":0,"drawable":16,"texture":0},"bag":{"palette":0,"drawable":0,"texture":0},"decals":{"palette":0,"drawable":0,"texture":0},"undershirt":{"palette":0,"drawable":8,"texture":0},"feet":{"palette":0,"drawable":88,"texture":0},"chest":{"palette":0,"drawable":30,"texture":0},"tops":{"palette":0,"drawable":1058,"texture":4},"torso":{"palette":0,"drawable":32,"texture":0}},"props":{"glasses":{"texture":-1,"prop":-1},"ear":{"texture":0,"prop":13},"helmet":{"texture":6,"prop":83}}},"model":-1667301416,"name":"test"}', '2024-09-13 03:36:44'),
	(91, 'ENW45444', 'kq_outfitbag:outfit', '{"bagItem":"kq_outfitbag","data":{"drawable":{"tops":{"texture":3,"palette":0,"drawable":488},"mask":{"texture":0,"palette":0,"drawable":0},"chest":{"texture":0,"palette":0,"drawable":0},"decals":{"texture":0,"palette":0,"drawable":0},"torso":{"texture":0,"palette":0,"drawable":0},"legs":{"texture":0,"palette":0,"drawable":297},"bag":{"texture":0,"palette":0,"drawable":0},"accessory":{"texture":0,"palette":0,"drawable":0},"undershirt":{"texture":0,"palette":0,"drawable":15},"feet":{"texture":8,"palette":0,"drawable":253}},"props":{"helmet":{"texture":-1,"prop":-1},"glasses":{"texture":3,"prop":23},"ear":{"texture":-1,"prop":-1}}},"name":"TWOG","model":1885233650}', '2024-10-12 18:20:06');

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

-- Dumping structure for table worldisyours.multijobs
CREATE TABLE IF NOT EXISTS `multijobs` (
  `citizenid` varchar(100) NOT NULL,
  `jobdata` text DEFAULT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.multijobs: ~12 rows (approximately)
INSERT INTO `multijobs` (`citizenid`, `jobdata`) VALUES
	('AIM07751', '{"police":4,"ambulance":4,"cardealer":4}'),
	('AXW11242', '{"cardealer":4,"police":0}'),
	('BHC52575', '{"garbage":0}'),
	('ENW45444', '{"lspd":10,"police":0,"tow":0}'),
	('JVH49125', '{"mechanic":3,"lspd":2,"kittys":1}'),
	('JXD83837', '{"tobacco":1,"police":3,"mechanic":3}'),
	('LPI62642', '{"burgershot":4,"kittys":4,"cardealer":4}'),
	('OUV63962', '{"lspd":10,"burgershot":4,"kittys":5}'),
	('QCD01130', '{"garbage":0}'),
	('QNC46912', '{"lspd":10}'),
	('RDO88579', '{"burgershot":3,"police":4}'),
	('TOD22598', '{"police":4}');

-- Dumping structure for table worldisyours.m_insurance_health
CREATE TABLE IF NOT EXISTS `m_insurance_health` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `creation_date` datetime NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.m_insurance_health: ~1 rows (approximately)
INSERT INTO `m_insurance_health` (`id`, `citizenid`, `creation_date`, `expire_date`) VALUES
	(2, 'OUV63962', '2024-10-12 15:43:18', '2025-01-10 14:43:18');

-- Dumping structure for table worldisyours.m_insurance_home
CREATE TABLE IF NOT EXISTS `m_insurance_home` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `creation_date` datetime NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.m_insurance_registration: ~0 rows (approximately)
INSERT INTO `m_insurance_registration` (`id`, `plate`, `model`, `registration`, `citizenid`) VALUES
	(8, '8QC438FZ', 'yosemite3', 1, 'OUV63962');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.m_insurance_vehicles: ~0 rows (approximately)
INSERT INTO `m_insurance_vehicles` (`id`, `plate`, `creation_date`, `expire_date`, `model`, `citizenid`) VALUES
	(7, '8QC438FZ', '2024-09-19 19:35:46', '2024-12-18 18:35:46', 'yosemite3', 'OUV63962');

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
INSERT INTO `occasion_vehicles` (`id`, `seller`, `price`, `description`, `plate`, `model`, `mods`, `occasionid`) VALUES
	(4, 'ENW45444', 7500, '', '40QCN557', 'dilettante2', '{"modArmor":-1,"modFrontBumper":-1,"modSuspension":-1,"modGrille":-1,"modVanityPlate":-1,"modTransmission":-1,"modOrnaments":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modSpeakers":-1,"modRearBumper":-1,"headlightColor":255,"extras":[null,null,null,null,null,null,null,null,null,0],"modTrimA":-1,"modFender":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"oilLevel":5,"wheelColor":156,"modTurbo":false,"modLivery":-1,"interiorColor":0,"wheelSize":1.0,"modRightFender":-1,"tankHealth":995,"modShifterLeavers":-1,"modSideSkirt":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modHood":-1,"modBProofTires":false,"modTrunk":-1,"pearlescentColor":111,"modBackWheels":-1,"modHydrolic":-1,"modWindows":-1,"wheelWidth":1.0,"modKit19":-1,"modDial":-1,"modExhaust":-1,"modCustomTiresF":false,"modEngineBlock":-1,"wheels":0,"modDoorSpeaker":-1,"modFrontWheels":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modAerials":-1,"bodyHealth":959,"modKit21":-1,"plateIndex":0,"modTank":-1,"modCustomTiresR":false,"modRoof":-1,"dashboardColor":0,"modPlateHolder":-1,"liveryRoof":-1,"modAirFilter":-1,"fuelLevel":68,"modEngine":-1,"modDashboard":-1,"modKit47":-1,"modStruts":-1,"model":1682114128,"dirtLevel":13,"engineHealth":965,"windowTint":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modHorns":-1,"modSteeringWheel":-1,"modFrame":-1,"modXenon":false,"modSeats":-1,"color2":10,"modSpoilers":-1,"neonEnabled":[false,false,false,false],"modDrift":false,"modTrimB":-1,"modAPlate":-1,"modKit49":-1,"plate":"40QCN557","color1":2,"neonColor":[255,0,255],"modKit17":-1,"modSmokeEnabled":false,"tyreSmokeColor":[255,255,255],"modBrakes":-1,"modArchCover":-1}', 'OC7495');

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
INSERT INTO `owned_gyms` (`id`, `identifier`, `gymid`, `gymprice`, `gymbalance`, `gymvisitorsdata`, `gymclosed`) VALUES
	(1, 'QNC46912', 2, 513, 3079, '[{"earningsvalue":513,"earningstime":1726205597},{"earningsvalue":1283,"earningstime":1726630790},{"earningsvalue":1283,"earningstime":1728371920}]', 0),
	(2, 'OUV63962', 1, 1000, 1000, '[{"earningsvalue":1000,"earningstime":1728789350}]', 0);

-- Dumping structure for table worldisyours.ox_doorlock
CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=882 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ox_doorlock: ~55 rows (approximately)
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
	(877, 'Owner_Dealership', '{"doors":[{"coords":{"x":-67.94718933105469,"y":63.82220458984375,"z":72.13197326660156},"heading":330,"model":925993716},{"coords":{"x":-69.47247314453125,"y":64.70402526855469,"z":72.13196563720703},"heading":330,"model":-1869234749}],"coords":{"x":-68.70983123779297,"y":64.26311492919922,"z":72.13197326660156},"maxDistance":2,"state":1,"groups":{"cardealer":0},"characters":["AXW11242","OUV63962"]}'),
	(878, 'Owner_Dealership2', '{"doors":false,"groups":{"cardealer":0},"state":1,"heading":240,"coords":{"x":-79.49440002441406,"y":78.2882080078125,"z":72.15385437011719},"model":1630015542,"maxDistance":2}'),
	(879, 'Owner_Dealership3', '{"doors":false,"groups":{"cardealer":0},"state":1,"heading":155,"coords":{"x":-72.638427734375,"y":79.96310424804688,"z":71.7396011352539},"model":-801051034,"maxDistance":2}'),
	(880, 'Owner_Dealership4', '{"doors":false,"groups":{"cardealer":0},"state":1,"heading":247,"coords":{"x":-62.28510665893555,"y":79.84893035888672,"z":72.30963134765625},"model":-1797916783,"maxDistance":2}'),
	(881, 'Owner_Dealership5', '{"doors":false,"groups":{"cardealer":0},"state":1,"heading":247,"coords":{"x":-63.97850036621094,"y":76.31161499023438,"z":71.81355285644531},"model":-1655830399,"maxDistance":2}');

-- Dumping structure for table worldisyours.ox_inventory
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.ox_inventory: ~8 rows (approximately)
INSERT INTO `ox_inventory` (`owner`, `name`, `data`, `lastupdated`) VALUES
	('', '[weedshop(1)]', '[{"name":"empty_weed_bag","slot":1,"count":7409},{"name":"ammonia","slot":14,"count":7878},{"name":"sodiumbicarbonate","slot":10,"count":7817},{"name":"plasticjerrycan","slot":11,"count":7465},{"name":"trowel","slot":12,"count":7964},{"name":"razorblade","slot":13,"count":7856}]', '2024-09-09 16:35:00'),
	('', 'Public Cocaine Lab', '[{"slot":1,"count":96,"name":"bakingsoda"},{"slot":2,"count":94,"name":"rawcocaine"},{"slot":3,"count":4,"name":"cutcocaine"}]', '2024-09-02 23:10:00'),
	('', 'mechanicSafe', '[{"name":"copper","slot":1,"count":26},{"name":"oxy","slot":15,"count":3},{"name":"iron","slot":16,"count":5},{"name":"aluminum","slot":17,"count":25},{"name":"painkillers","slot":20,"count":10},{"name":"bottle","slot":22,"count":11},{"name":"diving_gear","slot":25,"count":1},{"name":"rubber","slot":11,"count":3},{"name":"can","slot":6,"count":1}]', '2024-09-15 16:46:35'),
	('', 'BSTray3', NULL, '2024-10-10 04:10:00'),
	('', 'BSFridge', '[{"count":10,"slot":1,"name":"burgermeat"},{"count":200,"slot":7,"name":"chickenwrap"},{"count":200,"slot":8,"name":"torpedo"},{"count":19,"slot":11,"name":"bscoffee"},{"count":20,"slot":12,"name":"bscoke"},{"count":200,"slot":6,"name":"cheesewrap"},{"count":6,"slot":13,"name":"bleeder"}]', '2024-09-23 17:25:00'),
	('', 'kittysSafe', '[{"slot":1,"count":93,"name":"plastic"},{"slot":2,"count":6,"name":"glass"},{"slot":3,"count":38,"name":"metalscrap"},{"slot":4,"count":30,"name":"aluminum"},{"slot":5,"count":25,"name":"rubber"},{"slot":6,"count":46,"name":"iron"},{"slot":7,"count":55,"name":"copper"},{"slot":8,"count":51,"name":"steel"},{"slot":9,"count":1,"name":"internals"},{"slot":10,"count":1,"name":"seat"},{"slot":11,"count":3,"name":"engine5"},{"slot":12,"count":1,"name":"turbo"},{"slot":13,"count":1,"name":"sparkplugs"},{"slot":14,"count":1,"name":"axleparts"},{"slot":15,"count":2,"name":"livery"},{"slot":16,"count":2,"name":"transmission4"},{"slot":17,"count":2,"name":"carbattery"},{"slot":18,"count":3,"name":"antilag"},{"slot":19,"count":10000,"name":"nos"},{"slot":20,"count":1,"name":"headlights"},{"slot":21,"count":1,"name":"engine1"},{"slot":22,"count":1,"name":"suspension5"},{"slot":23,"count":1,"name":"tint_supplies"},{"slot":24,"count":1,"name":"paintcan"},{"slot":25,"count":2,"name":"nos"}]', '2024-10-13 20:00:00'),
	('', 'BSShelf', '[{"slot":1,"name":"bscoffee","count":97},{"slot":2,"name":"bscoke","count":96},{"slot":3,"name":"milkshake","count":87},{"slot":4,"name":"water_bottle","count":20},{"slot":6,"name":"heartstopper","count":98},{"slot":7,"name":"bleeder","count":97},{"slot":8,"name":"moneyshot","count":87},{"slot":9,"name":"torpedo","count":100},{"slot":10,"name":"meatfree","count":100},{"slot":11,"name":"shotrings","count":97},{"slot":12,"name":"shotfries","count":97},{"slot":13,"name":"shotnuggets","count":107},{"slot":14,"name":"chickenwrap","count":100},{"slot":15,"name":"cheesewrap","count":100},{"slot":16,"name":"creampie","count":100},{"slot":17,"name":"rimjob","count":100}]', '2024-10-12 22:35:00'),
	('', 'policestash_QNC46912', '[{"metadata":{"registered":true,"serial":"POL"},"count":1,"name":"handcuffs","slot":1},{"count":1,"name":"electronic_cuffs","slot":2},{"metadata":{"registered":"Andy Murphy","durability":99.9,"ammo":15,"latentprints":{"dv704g47QVg1927":{"evidenceId":628297,"integrity":100}},"components":[],"serial":"887336POL666142"},"count":1,"name":"WEAPON_PDG22","slot":3},{"metadata":{"type":"Class C Driver License","firstname":"Andy","birthdate":"10.03.1999","lastname":"Murphy"},"count":1,"name":"driver_license","slot":4},{"metadata":{"birthdate":"10.03.1999","lastname":"Murphy","gender":0,"nationality":"United Kingdom","firstname":"Andy","citizenid":"QNC46912"},"count":1,"name":"id_card","slot":5},{"metadata":{"registered":"Andy Murphy","durability":100,"ammo":0,"components":[],"serial":"929360POL208274"},"count":1,"name":"WEAPON_HEAVYSNIPER_MK2","slot":6},{"metadata":{"registered":"Andy Murphy","durability":100,"ammo":0,"latentprints":{"dv704g47QVg1927":{"evidenceId":578841,"integrity":100}},"components":[],"serial":"298448POL815333"},"count":1,"name":"WEAPON_PDM700","slot":7},{"count":7,"name":"oxy","slot":8},{"metadata":{"registered":true,"durability":100,"serial":"POL","components":[]},"count":1,"name":"WEAPON_FLASHLIGHT","slot":9},{"metadata":{"registered":true,"serial":"POL"},"count":1,"name":"handcuffs","slot":10},{"count":1,"name":"protein","slot":11},{"count":1,"name":"preworkout","slot":12},{"metadata":{"registered":true,"durability":100,"latentprints":{"dv704g47QVg1927":{"evidenceId":517406,"integrity":100}},"components":[],"serial":"POL","latentblood":{"41494d3037373531":{"evidenceId":883369,"bloodtype":"A-"}}},"count":1,"name":"WEAPON_BTASER","slot":13},{"metadata":{"registered":true,"durability":99.9,"latentprints":{"dv704g47QVg1927":{"evidenceId":643040,"integrity":100}},"latentblood":{"41494d3037373531":{"evidenceId":164561,"bloodtype":"A-"}},"serial":"POL","components":[]},"count":1,"name":"WEAPON_PDBATON","slot":14},{"metadata":{"registered":"Andy Murphy","durability":99.2,"ammo":10,"latentprints":{"dv704g47QVg1927":{"evidenceId":473711,"integrity":100}},"components":[],"serial":"913053POL207165"},"count":1,"name":"WEAPON_PDHKUSP","slot":15},{"count":1,"name":"radio","slot":17},{"count":132,"name":"pistol_ammo","slot":18},{"count":10,"name":"painkillers","slot":19},{"count":471,"name":"recyclablematerial","slot":21}]', '2024-10-12 06:45:00'),
	('', 'BSTray4', NULL, '2024-10-10 04:10:00');

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

-- Dumping structure for table worldisyours.phone_chats
CREATE TABLE IF NOT EXISTS `phone_chats` (
  `app` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.phone_chats: ~0 rows (approximately)

-- Dumping structure for table worldisyours.phone_crypto
CREATE TABLE IF NOT EXISTS `phone_crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'btc',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.phone_crypto: ~0 rows (approximately)
INSERT INTO `phone_crypto` (`crypto`, `worth`, `history`) VALUES
	('btc', 1067, '[{"NewWorth":1068,"PreviousWorth":1060},{"NewWorth":1068,"PreviousWorth":1060},{"NewWorth":1068,"PreviousWorth":1060},{"NewWorth":1067,"PreviousWorth":1068}]');

-- Dumping structure for table worldisyours.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.phone_gallery: ~0 rows (approximately)

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
) ENGINE=InnoDB AUTO_INCREMENT=8172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.players: ~16 rows (approximately)
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `apps`, `widget`, `bt`, `cryptocurrency`, `cryptocurrencytransfers`, `phonePos`, `spotify`, `ringtone`, `first_screen_showed`, `xp`, `okokcrafts`, `inside`, `note`, `tags`, `points`, `wanted`, `image`, `iban`, `pincode`) VALUES
	(527, 'AIM07751', 1, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'DocJay69', '{"bank":728645.0,"crypto":0,"cash":9430.0}', '{"gender":0,"birthdate":"17.08.2006","nationality":"United States","lastname":"Test","account":"US06QBCore8481147770","phone":"5058678976","firstname":"Doc"}', '{"type":"leo","onduty":true,"grade":{"isboss":false,"level":11,"payment":4000,"name":"Deputy Commissioner"},"isboss":false,"label":"LSPD","payment":4000,"name":"lspd"}', '{"isboss":false,"name":"none","grade":{"isboss":false,"name":"Unaffiliated","level":0},"label":"No Gang"}', '{"x":-460.8923034667969,"y":-327.3626403808594,"z":34.4864501953125}', '{"oxyxp":0,"bloodtype":"A-","ishandcuffed":false,"drugxp":0,"hunger":49.59999999999996,"inside":{"apartment":[]},"jailitems":[],"tracker":false,"callsign":"NO CALLSIGN","licences":{"driver":true,"weapon":true,"business":false},"inlaststand":false,"fingerprint":"Tb417Q82gdh1058","rep":[],"overdosexp":0,"phone":[],"criminalrecord":{"hasRecord":false},"thirst":54.40000000000003,"isdead":false,"phonedata":{"SerialNumber":13694192,"InstalledApps":[]},"stress":0,"injail":0,"status":[],"armor":0,"walletid":"QB-59545251"}', '[{"slot":1,"count":1,"name":"WEAPON_T1911","metadata":{"durability":35.30000000000076,"registered":"SBDemon Test","latentprints":{"Tb417Q82gdh1058":{"evidenceId":519789,"integrity":100},"rj614I08Jed5366":{"integrity":100,"evidenceId":182736}},"serial":"600087LCO140475","components":[],"ammo":8}},{"slot":2,"count":1,"name":"WEAPON_FLASHLIGHT","metadata":{"durability":100,"registered":true,"latentprints":{"Tb417Q82gdh1058":{"integrity":100,"evidenceId":620555}},"components":[],"serial":"POL"}},{"slot":3,"count":1,"name":"WEAPON_PD870","metadata":{"durability":85.80000000000067,"registered":"Doc Test","latentprints":{"Tb417Q82gdh1058":{"integrity":100,"evidenceId":883980}},"serial":"148988POL621128","components":[],"ammo":7}},{"slot":4,"count":1,"name":"WEAPON_STUNGUN","metadata":{"durability":100,"latentblood":{"4f55563633393632":{"bloodtype":"A+","evidenceId":306884},"43544d3934383339":{"bloodtype":"B+","evidenceId":148120},"4c50493632363432":{"bloodtype":"A+","evidenceId":563618}},"latentprints":{"Tb417Q82gdh1058":{"integrity":100,"evidenceId":290479}},"registered":"Doc Test","components":[],"serial":"400589POL248193"}},{"slot":5,"count":1,"name":"WEAPON_BSCAR","metadata":{"durability":73.40000000000018,"registered":"SBDemon Test","latentprints":{"Tb417Q82gdh1058":{"evidenceId":766298,"integrity":100}},"serial":"836019JWV581298","components":[],"ammo":0}},{"slot":6,"count":43,"name":"shotgun_ammo"},{"slot":7,"count":160,"name":"pistol_ammo"},{"slot":8,"count":210,"name":"smg_ammo"},{"slot":9,"count":1,"name":"filled_evidence_bag","metadata":{"date":"10/13/24 @ 10:04","street":"Shank St | ","description":"**Type:** Positive GSR Field Test  \\n**Tracking ID:** 616837  \\n**Date:** 10/13/24 @ 10:04  \\n**Collected:** Shank St | ","evtype":"gsr","label":"Positive GSR Field Test","tracking":616837}},{"slot":10,"count":31,"name":"ammo-50"},{"slot":11,"count":1,"name":"WEAPON_PISTOL50","metadata":{"durability":72.90000000000053,"latentblood":{"4f55563633393632":{"bloodtype":"A+","evidenceId":318827}},"latentprints":{"Tb417Q82gdh1058":{"integrity":100,"evidenceId":331242}},"registered":"Doc Test","serial":"807992HBT330092","components":[],"ammo":9}},{"slot":12,"count":1,"name":"WEAPON_PDHK45","metadata":{"durability":82.80000000000044,"latentblood":{"4f55563633393632":{"bloodtype":"A+","evidenceId":899174}},"latentprints":{"Tb417Q82gdh1058":{"integrity":100,"evidenceId":717498}},"registered":"Doc Test","serial":"645510POL193981","components":[],"ammo":10}},{"slot":13,"count":1,"name":"firstaid"},{"slot":14,"count":1,"name":"WEAPON_PDBATON","metadata":{"durability":90.10000000000048,"latentblood":{"4f55563633393632":{"bloodtype":"A+","evidenceId":809221},"514e433436393132":{"bloodtype":"A-","evidenceId":527279},"4c50493632363432":{"bloodtype":"A+","evidenceId":502865}},"latentprints":{"Tb417Q82gdh1058":{"integrity":100,"evidenceId":259384}},"registered":true,"components":[],"serial":"POL"}},{"slot":15,"count":1,"name":"handcuffs"},{"slot":16,"count":1,"name":"nikon","metadata":{"uploadPathDisplay":"LOCAL STORAGE","uploadPath":1,"uploadImages":false,"showTimestamp":true,"autoUpload":false,"memoryCardName":false,"photos":[],"memoryCard":true,"showOverlay":true,"flashEnabled":true}},{"slot":17,"count":1,"name":"filled_evidence_bag","metadata":{"description":"**Type:** Multipanel Oral Drug Test  \\n**Tracking ID:** 702833  \\n**Date:** 10/08/24 @ 08:34  \\n**DNA Code:** 4f55563633393632  \\n**Cocaine:** Negative  \\n  \\n **Marijuana:** Negative  \\n **Ecstacy:** Negative  \\n **Methamphetamine:** Negative  \\n **Oxycodone:** Negative  \\n**Collected:** San Andreas Ave | Prosperity St","player":3,"evtype":"drugtest","label":"Multipanel Oral Drug Test","dnalabel":"4f55563633393632","date":"10/08/24 @ 08:34","street":"San Andreas Ave | Prosperity St","tracking":702833,"drugs":{"cocaine":"Negative","weed":"Negative","meth":"Negative","ecstacy":"Negative","oxycodone":"Negative"}}},{"slot":18,"count":2,"name":"heavyarmor"},{"slot":19,"count":1,"name":"WEAPON_REDM4A1","metadata":{"durability":5.80000000000029,"latentblood":{"4f55563633393632":{"bloodtype":"A+","evidenceId":919949}},"latentprints":{"Tb417Q82gdh1058":{"integrity":100,"evidenceId":476779}},"serial":"490798HFN421974","registered":"SBDemon Test","components":[],"ammo":0}},{"slot":20,"count":2,"name":"nos"},{"slot":21,"count":3,"name":"lockpick"},{"slot":22,"count":1,"name":"advancedlockpick"},{"slot":23,"count":1,"name":"WEAPON_GLOCKBEAMS","metadata":{"durability":58.30000000000008,"serial":"548950ODX776805","latentprints":{"Tb417Q82gdh1058":{"integrity":100,"evidenceId":477698}},"registered":"SBDemon Test","components":[],"ammo":11}},{"slot":24,"count":1,"name":"radio"},{"slot":25,"count":1,"name":"bscoffee"},{"slot":26,"count":1,"name":"electronic_cuffs"},{"slot":27,"count":1,"name":"electronic_cuffs"},{"slot":28,"count":1,"name":"cleaningkit"},{"slot":29,"count":1,"name":"gpstracker"},{"slot":30,"count":2,"name":"bscoke"},{"slot":31,"count":9,"name":"ifaks"},{"slot":34,"count":3,"name":"shotfries"},{"slot":35,"count":4,"name":"bleeder"},{"slot":36,"count":2,"name":"bandage"},{"slot":37,"count":1,"name":"breathalyzer"},{"slot":38,"count":1,"name":"fingerprintkit"},{"slot":40,"count":1,"name":"sdcard"},{"slot":43,"count":3,"name":"dnatestkit"},{"slot":44,"count":3,"name":"drugtestkit"},{"slot":45,"count":2,"name":"gsrtestkit"},{"slot":46,"count":1,"name":"id_card","metadata":{"gender":0,"birthdate":"17.08.2006","citizenid":"AIM07751","nationality":"United States","lastname":"Test","firstname":"Doc"}},{"slot":47,"count":1,"name":"driver_license","metadata":{"birthdate":"17.08.2006","type":"Class C Driver License","lastname":"Test","firstname":"Doc"}},{"slot":48,"count":1,"name":"fingerprinttape"},{"slot":49,"count":1,"name":"mikrosil"},{"slot":50,"count":9430,"name":"money"}]', '2024-10-14 04:05:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(7432, 'AXW11242', 2, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'DocJay69', '{"crypto":0,"cash":364940,"bank":1575.0}', '{"firstname":"test","account":"US01QBCore5925238749","nationality":"United States","phone":"3795834160","gender":0,"lastname":"test","birthdate":"12.10.2012"}', '{"label":"Vehicle Dealer","type":"none","name":"cardealer","grade":{"level":4,"isboss":true,"name":"Manager","payment":150},"onduty":true,"isboss":true}', '{"grade":{"level":0,"name":"Unaffiliated","isboss":false},"label":"No Gang","isboss":false,"name":"none"}', '{"x":93.91648864746094,"y":-133.60879516601563,"z":55.4981689453125}', '{"bloodtype":"O+","thirst":92.4,"inside":{"apartment":[]},"rep":[],"stress":0.6,"licences":{"business":false,"weapon":false,"driver":true},"oxyxp":0,"hunger":91.6,"phone":[],"fingerprint":"gf099P39FWN4119","callsign":"NO CALLSIGN","armor":0,"jailitems":[],"tracker":false,"status":[],"overdosexp":0,"walletid":"QB-12475951","isdead":false,"drugxp":0,"inlaststand":false,"injail":0,"ishandcuffed":false,"phonedata":{"SerialNumber":49256308,"InstalledApps":[]},"criminalrecord":{"hasRecord":false}}', '[{"slot":1,"name":"WEAPON_CERAMICPISTOL","count":1,"metadata":{"components":[],"latentprints":{"gf099P39FWN4119":{"integrity":100,"evidenceId":898671}},"registered":"test test","ammo":12,"latentblood":{"4f55563633393632":{"evidenceId":396453,"bloodtype":"A+"}},"durability":51.99999999999976,"serial":"323006GWA203391"}},{"slot":2,"name":"pistol_ammo","count":198},{"slot":3,"name":"nos","count":2},{"slot":4,"name":"WEAPON_HUNTINGRIFLE","count":1,"metadata":{"components":[],"serial":"729027JAY402416","ammo":0,"durability":100,"registered":"test test"}},{"slot":5,"name":"hunterslogo","count":1},{"slot":6,"name":"driver_license","count":1,"metadata":{"lastname":"test","type":"Class C Driver License","firstname":"test","birthdate":"12.10.2012"}},{"slot":7,"name":"id_card","count":1,"metadata":{"birthdate":"12.10.2012","citizenid":"AXW11242","gender":0,"lastname":"test","nationality":"United States","firstname":"test"}},{"slot":8,"name":"hunterlicense","count":1},{"slot":21,"name":"bigfoot","count":1},{"slot":9,"name":"hunting_ammo","count":50},{"slot":10,"name":"advancedlockpick","count":1},{"slot":25,"name":"money","count":364940},{"slot":12,"name":"huntknife","count":1},{"slot":11,"name":"noscan","count":1},{"slot":24,"name":"gruppesechstablet","count":1}]', '2024-10-13 04:51:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(1384, 'BHC52575', 1, 'license:144133f1735907f6b5399c16bb2222fa9900545b', 'Harriet', '{"bank":5500,"crypto":0,"cash":14100.0}', '{"gender":1,"nationality":"Australia","lastname":"Johnson","firstname":"Harriet","phone":"7576734895","birthdate":"10.10.2001","account":"US02QBCore4098889924"}', '{"isboss":false,"name":"garbage","onduty":true,"grade":{"isboss":false,"level":0,"payment":50,"name":"Collector"},"type":"none","payment":50,"label":"Garbage"}', '{"label":"No Gang","isboss":false,"grade":{"isboss":false,"level":0,"name":"Unaffiliated"},"name":"none"}', '{"x":-73.88571166992188,"y":814.997802734375,"z":227.737060546875}', '{"thirst":96.2,"oxyxp":0,"tracker":false,"drugxp":0,"hunger":95.8,"stress":0,"armor":0,"licences":{"driver":true,"business":false,"weapon":false},"ishandcuffed":false,"inlaststand":false,"phonedata":{"InstalledApps":[],"SerialNumber":61244131},"phone":[],"rep":[],"inside":{"apartment":[]},"injail":0,"status":[],"callsign":"NO CALLSIGN","bloodtype":"AB-","criminalrecord":{"hasRecord":false},"jailitems":[],"overdosexp":0,"fingerprint":"sg552D99Ocm3244","isdead":false,"walletid":"QB-99600617"}', '[{"name":"money","slot":1,"count":14070},{"name":"driver_license","slot":2,"metadata":{"birthdate":"10.10.2001","type":"Class C Driver License","lastname":"Johnson","firstname":"Harriet"},"count":1},{"name":"id_card","slot":3,"metadata":{"nationality":"Australia","birthdate":"10.10.2001","gender":1,"citizenid":"BHC52575","lastname":"Johnson","firstname":"Harriet"},"count":1},{"name":"WEAPON_COMPACTRIFLE","slot":4,"metadata":{"components":[],"latentprints":{"sg552D99Ocm3244":{"integrity":100,"evidenceId":699981}},"registered":"Harriet Johnson","serial":"680611GPJ941342","durability":98.25000000000002,"ammo":26},"count":1},{"name":"heavyarmor","slot":5,"count":3},{"name":"rifle_ammo","slot":6,"count":270},{"name":"rubber","slot":7,"count":4},{"name":"iron","slot":8,"count":11},{"name":"plastic","slot":9,"count":2},{"name":"metalscrap","slot":10,"count":6},{"name":"money","slot":11,"count":30},{"name":"bandage","slot":12,"count":50},{"name":"cola","slot":13,"count":1},{"name":"water","slot":14,"count":1},{"name":"ammo-rifle2","slot":19,"count":69}]', '2024-09-19 01:58:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(643, 'CTM94839', 1, 'license:98e0b2e1815d54cc17f2b2fa2ab4192ac0ec52a4', 'TooLITMafia', '{"crypto":0,"bank":7163,"cash":91780}', '{"phone":"5986767123","gender":0,"account":"US01QBCore3672520872","birthdate":"22.08.2006","lastname":"Soul","firstname":"Trey","nationality":"United States"}', '{"isboss":false,"name":"police","grade":{"payment":125,"level":3,"name":"Lieutenant","isboss":false},"payment":125,"onduty":true,"label":"Law Enforcement","type":"leo"}', '{"isboss":false,"grade":{"level":0,"isboss":false,"name":"Unaffiliated"},"label":"No Gang","name":"none"}', '{"x":-533.024169921875,"y":263.20880126953127,"z":82.4578857421875}', '{"criminalrecord":{"hasRecord":false},"ishandcuffed":false,"tracker":false,"walletid":"QB-14975707","rep":[],"isdead":false,"injail":0,"stress":16.59999999999998,"phonedata":{"SerialNumber":30909165,"InstalledApps":[]},"inside":{"apartment":[]},"fingerprint":"fm994y77lLF4873","bloodtype":"B+","callsign":"NO CALLSIGN","thirst":88.60000000000001,"armor":0,"phone":{"background":"b3"},"hunger":87.39999999999999,"inlaststand":false,"jailitems":[],"status":[],"drugxp":0,"oxyxp":0,"licences":{"weapon":false,"driver":true,"business":false},"overdosexp":0}', '[{"slot":1,"name":"money","count":91780},{"slot":2,"name":"driver_license","metadata":{"birthdate":"22.08.2006","type":"Class C Driver License","lastname":"Soul","firstname":"Trey"},"count":1},{"slot":3,"name":"lockpick","count":50},{"slot":4,"name":"WEAPON_REDARP","metadata":{"durability":44.90000000000102,"components":[],"latentprints":{"fm994y77lLF4873":{"evidenceId":753090,"integrity":100}},"ammo":30,"registered":"Trey Soul","serial":"129699BTR448912"},"count":1},{"slot":5,"name":"bottle","count":3},{"slot":6,"name":"tosti","count":1},{"slot":7,"name":"rifle_ammo","count":19},{"slot":8,"name":"advancedlockpick","count":50},{"slot":9,"name":"WEAPON_COMPACTRIFLE","metadata":{"durability":94.00000000000004,"registered":"Trey Soul","serial":"228697UPK267807","ammo":0,"latentprints":{"fm994y77lLF4873":{"evidenceId":181065,"integrity":100}},"components":[]},"count":1},{"slot":10,"name":"burger-heartstopper","count":15},{"slot":11,"name":"w_diet_coke","count":15},{"slot":12,"name":"id_card","metadata":{"lastname":"Soul","nationality":"United States","birthdate":"22.08.2006","gender":0,"firstname":"Trey","citizenid":"CTM94839"},"count":1},{"slot":13,"name":"red_phone","count":1},{"slot":14,"name":"sandwich","count":10}]', '2024-10-09 04:29:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(7355, 'ENW45444', 1, 'license:340e13c7d15e0f07ff7ed5e66a62423ae74f5915', 'TamerWaves', '{"bank":115227.0,"crypto":0,"cash":30082.0}', '{"gender":0,"birthdate":"19.01.1978","account":"US01QBCore4268257595","nationality":"United States","phone":"6115148840","lastname":"Lutz","firstname":"Shelby"}', '{"type":"leo","label":"LSPD","isboss":true,"grade":{"isboss":true,"payment":3500,"level":10,"name":"Chief"},"onduty":true,"name":"lspd"}', '{"isboss":false,"label":"No Gang","grade":{"isboss":false,"name":"Unaffiliated","level":0},"name":"none"}', '{"x":948.3428344726563,"y":-1575.8505859375,"z":30.3919677734375}', '{"oxyxp":0,"bloodtype":"O-","ishandcuffed":false,"drugxp":0,"phonedata":{"SerialNumber":46740232,"InstalledApps":[]},"inside":{"apartment":[]},"jailitems":[],"tracker":false,"callsign":"NO CALLSIGN","licences":{"driver":true,"weapon":false,"business":false},"inlaststand":false,"fingerprint":"sj675B07bpH2056","rep":[],"overdosexp":0,"status":[],"criminalrecord":{"hasRecord":false},"hunger":100,"isdead":false,"thirst":100,"stress":0.4,"injail":0,"phone":{"background":"b3","Pincode":"5263"},"armor":0,"walletid":"QB-89037659"}', '[{"slot":1,"count":1,"name":"WEAPON_CERAMICPISTOL","metadata":{"durability":59.59999999999976,"serial":"771610JHY734881","latentprints":{"sj675B07bpH2056":{"integrity":100,"evidenceId":366014}},"registered":"test test","latentblood":{"4f55563633393632":{"bloodtype":"A+","evidenceId":680350}},"components":[],"ammo":0}},{"slot":2,"count":5,"name":"sandwich"},{"slot":3,"count":11,"name":"coffee"},{"slot":4,"count":1,"name":"vape"},{"slot":5,"count":1,"name":"blue_phone"},{"slot":6,"count":10,"name":"lockpick"},{"slot":7,"count":2,"name":"bottle"},{"slot":8,"count":15,"name":"marlborocig"},{"slot":9,"count":2,"name":"can"},{"slot":10,"count":6,"name":"oxy"},{"slot":15,"count":6,"name":"bandage"},{"slot":16,"count":4,"name":"drillbit"},{"slot":20,"count":1,"name":"goldpan"},{"slot":21,"count":1,"name":"id_card","metadata":{"gender":0,"birthdate":"19.01.1978","citizenid":"ENW45444","nationality":"United States","lastname":"Lutz","firstname":"Shelby"}},{"slot":22,"count":1,"name":"driver_license","metadata":{"firstname":"Shelby","type":"Class C Driver License","lastname":"Lutz","birthdate":"19.01.1978"}},{"slot":23,"count":30082,"name":"money"},{"slot":24,"count":1,"name":"kq_outfitbag"},{"slot":25,"count":1,"name":"lighter"},{"slot":26,"count":1,"name":"pickaxe"},{"slot":27,"count":1,"name":"WEAPON_HAMMER","metadata":{"durability":99.99,"components":[]}},{"slot":28,"count":1,"name":"kq_expensive_bag"},{"slot":29,"count":1,"name":"WEAPON_GOLFCLUB","metadata":{"durability":100,"components":[]}},{"slot":30,"count":1,"name":"miningdrill"},{"slot":31,"count":1,"name":"cryptostick"},{"slot":32,"count":1,"name":"repairkit"},{"slot":35,"count":1,"name":"WEAPON_GOLFCLUB","metadata":{"durability":100,"components":[]}},{"slot":36,"count":1,"name":"cryptostick"},{"slot":37,"count":1,"name":"WEAPON_HAMMER","metadata":{"durability":100,"components":[]}},{"slot":38,"count":1,"name":"WEAPON_HAMMER","metadata":{"durability":100,"components":[]}},{"slot":39,"count":1,"name":"mininglaser"},{"slot":33,"count":1,"name":"screwdriverset"},{"slot":34,"count":1,"name":"diamond_ring"},{"slot":40,"count":10,"name":"drillbit"}]', '2024-10-13 21:16:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(7598, 'GYH61824', 2, 'license:53d63cef03bd84bee2778d19ae409b18c859187a', 'DemonsAngel90', '{"crypto":0,"cash":500,"bank":5000}', '{"phone":"4898775561","account":"US09QBCore5794389733","nationality":"United States","gender":1,"firstname":"Kitty","lastname":"Rich","birthdate":"18.02.1990"}', '{"label":"Civilian","type":"none","name":"unemployed","grade":{"name":"Freelancer","level":0},"onduty":false,"isboss":false,"payment":10}', '{"label":"No Gang Affiliation","isboss":false,"name":"none","grade":{"name":"none","level":0}}', '{"x":205.13406372070313,"y":-939.6263427734375,"z":30.6783447265625}', '{"bloodtype":"O-","thirst":92.4,"inside":{"apartment":[]},"rep":[],"stress":0,"licences":{"business":false,"weapon":false,"driver":true},"oxyxp":0,"hunger":91.6,"phone":[],"status":[],"callsign":"NO CALLSIGN","armor":0,"jailitems":[],"tracker":false,"drugxp":0,"overdosexp":0,"criminalrecord":{"hasRecord":false},"isdead":false,"walletid":"QB-88968090","inlaststand":false,"fingerprint":"OZ901V03wBJ7058","ishandcuffed":false,"phonedata":{"SerialNumber":29816408,"InstalledApps":[]},"injail":0}', '[{"slot":1,"name":"money","count":500},{"slot":2,"name":"driver_license","count":1,"metadata":{"birthdate":"18.02.1990","firstname":"Kitty","type":"Class C Driver License","lastname":"Rich"}},{"slot":3,"name":"id_card","count":1,"metadata":{"birthdate":"18.02.1990","citizenid":"GYH61824","firstname":"Kitty","lastname":"Rich","gender":1,"nationality":"United States"}}]', '2024-10-13 00:40:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(1442, 'JVH49125', 1, 'license:53d63cef03bd84bee2778d19ae409b18c859187a', 'DemonsAngel90', '{"bank":114313.49999999996,"crypto":0,"cash":139621.0}', '{"gender":1,"birthdate":"18.02.1990","phone":"6887049303","nationality":"United States","account":"US02QBCore7108353815","lastname":"Testina","firstname":"Test"}', '{"type":"mechanic","payment":75,"grade":{"isboss":false,"name":"Novice","level":1,"payment":75},"isboss":false,"label":"Kittys Motor Works","onduty":false,"name":"kittys"}', '{"isboss":false,"name":"none","grade":{"isboss":false,"level":0,"name":"Unaffiliated"},"label":"No Gang"}', '{"x":951.6264038085938,"y":-1558.02197265625,"z":43.7369384765625}', '{"oxyxp":0,"bloodtype":"AB-","ishandcuffed":false,"drugxp":0,"phonedata":{"SerialNumber":73277738,"InstalledApps":[]},"inside":{"apartment":[]},"jailitems":[],"tracker":false,"electronic-cuffs":false,"callsign":"NO CALLSIGN","licences":{"driver":true,"weapon":true,"business":false},"inlaststand":false,"fingerprint":"xQ358t79KXL2469","walletid":"QB-17480527","overdosexp":0,"status":[],"criminalrecord":{"hasRecord":false},"hunger":100,"isdead":false,"thirst":100,"stress":0.6,"injail":0,"phone":{"background":"b10"},"armor":0,"rep":[]}', '[{"slot":1,"count":1,"name":"WEAPON_FLASHLIGHT","metadata":{"components":[],"durability":100}},{"slot":2,"count":1,"name":"WEAPON_RAM7","metadata":{"durability":17.50000000000003,"registered":"Test Testina","latentprints":{"xQ358t79KXL2469":{"integrity":100,"evidenceId":493343}},"serial":"262863FII168193","components":[],"ammo":30}},{"slot":3,"count":1,"name":"wet_blue_phone"},{"slot":4,"count":1,"name":"toolbox"},{"slot":5,"count":8,"name":"lockpick"},{"slot":6,"count":11,"name":"emptyvial"},{"slot":7,"count":48,"name":"rifle_ammo"},{"slot":8,"count":1,"name":"WEAPON_RAM7","metadata":{"durability":42.20000000000021,"registered":"Test Testina","latentprints":{"xQ358t79KXL2469":{"evidenceId":214872,"integrity":100}},"latentblood":{"4f55563633393632":{"bloodtype":"A+","evidenceId":549175},"41494d3037373531":{"bloodtype":"A-","evidenceId":184248}},"serial":"113711DJM959073","components":[],"ammo":10}},{"slot":9,"count":1,"name":"repairkit"},{"slot":10,"count":4,"name":"cubancigar"},{"slot":11,"count":8,"name":"advancedlockpick"},{"slot":12,"count":1,"name":"advancedrepairkit"},{"slot":13,"count":1,"name":"mechanic_tools"},{"slot":14,"count":3,"name":"ifaks"},{"slot":15,"count":1,"name":"WEAPON_RAM7","metadata":{"durability":84.40000000000015,"registered":"SBDemon Test","latentprints":{"xQ358t79KXL2469":{"evidenceId":201656,"integrity":100}},"serial":"683228YRL367899","components":[],"ammo":0}},{"slot":16,"count":139621,"name":"money"},{"slot":17,"count":100,"name":"bandage"},{"slot":18,"count":6,"name":"stone"},{"slot":19,"count":5,"name":"uncut_ruby"},{"slot":20,"count":7,"name":"uncut_diamond"},{"slot":21,"count":1,"name":"accesstool","metadata":{"uses":6}},{"slot":22,"count":1,"name":"WEAPON_TEC9S","metadata":{"durability":59.50000000000001,"registered":"SBDemon Test","latentprints":{"xQ358t79KXL2469":{"evidenceId":869586,"integrity":100}},"serial":"384895JPV484918","components":[],"ammo":7}},{"slot":23,"count":1,"name":"trowel"},{"slot":24,"count":22,"name":"water_bottle"},{"slot":25,"count":1,"name":"lighter"},{"slot":26,"count":434,"name":"pistol_ammo"},{"slot":27,"count":1,"name":"binoculars"},{"slot":28,"count":4,"name":"uncut_sapphire"},{"slot":29,"count":1,"name":"pickaxe"},{"slot":30,"count":5,"name":"uncut_emerald"},{"slot":31,"count":200,"name":"ammo-rifle"},{"slot":32,"count":1,"name":"pdmcontract"},{"slot":33,"count":1,"name":"goldpan"},{"slot":34,"count":1,"name":"miningdrill"},{"slot":35,"count":1,"name":"mininglaser"},{"slot":36,"count":20,"name":"drillbit"},{"slot":37,"count":12,"name":"copperore"},{"slot":38,"count":5,"name":"goldore"},{"slot":39,"count":2,"name":"silica"},{"slot":40,"count":7,"name":"carbon"},{"slot":41,"count":5,"name":"quartz"},{"slot":42,"count":6,"name":"ironore"},{"slot":45,"count":2,"name":"screwdriverset"},{"slot":46,"count":1,"name":"mechboard","metadata":{"description":"Model: KARIN REBEL01\\nPlate: [23SJB840]\\n\\nChanges: 1","info":{"veh":"KARIN REBEL01","vehlist":["Primary - [ Cream (Metallic) ]"],"vehplate":"[23SJB840]"}}}]', '2024-10-13 21:16:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '{"general2":0}', '[]', NULL, NULL, '[]', 0, 0, NULL, NULL, NULL),
	(1540, 'LLU56122', 1, 'license:09899930455af2afcd96efb6a2fb55ad31ce7089', 'GunnsiB', '{"crypto":0,"cash":500,"bank":4500}', '{"firstname":"Gunnar","phone":"1653059178","birthdate":"21.09.2004","account":"US07QBCore1914440776","lastname":"Zoega","gender":0,"nationality":"Iceland"}', '{"onduty":false,"type":"none","label":"Civilian","name":"unemployed","payment":10,"grade":{"name":"Freelancer","level":0},"isboss":false}', '{"label":"No Gang Affiliation","name":"none","grade":{"name":"none","level":0},"isboss":false}', '{"x":-434.22857666015627,"y":-345.19122314453127,"z":34.90771484375}', '{"phonedata":{"SerialNumber":50364841,"InstalledApps":[]},"inside":{"apartment":[]},"phone":[],"criminalrecord":{"hasRecord":false},"thirst":100,"fingerprint":"gP719k72mjj7946","inlaststand":false,"ishandcuffed":false,"stress":0,"jailitems":[],"hunger":100,"isdead":false,"status":[],"injail":0,"licences":{"weapon":false,"driver":true,"business":false},"callsign":"NO CALLSIGN","tracker":false,"armor":0,"bloodtype":"AB+","walletid":"QB-49958844","rep":[]}', '[{"slot":1,"name":"money","count":500},{"slot":2,"name":"id_card","count":1,"metadata":{"citizenid":"LLU56122","lastname":"Zoega","gender":0,"firstname":"Gunnar","nationality":"Iceland","birthdate":"21.09.2004"}},{"slot":3,"name":"driver_license","count":1,"metadata":{"firstname":"Gunnar","lastname":"Zoega","type":"Class C Driver License","birthdate":"21.09.2004"}},{"slot":4,"name":"ammo-rifle2","count":146},{"slot":5,"name":"WEAPON_COMPACTRIFLE","count":1,"metadata":{"durability":98.8,"serial":"657502CSU470278","latentprints":{"gP719k72mjj7946":{"evidenceId":380331,"integrity":100}},"ammo":30,"registered":"Gunnar Zoega","latentblood":{"4248433532353735":{"evidenceId":516896,"bloodtype":"AB-"}},"components":[]}}]', '2024-09-05 03:32:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(7617, 'LOO91104', 1, 'license:92628a164825fc5cc642f21577b6d39a86a0632d', 'Ratwagen', '{"crypto":0,"cash":0,"bank":5000}', '{"phone":"8546405875","account":"US06QBCore4285937842","nationality":"United States","gender":0,"firstname":"Jimbo","lastname":"Taylor","birthdate":"15.03.1977"}', '{"label":"Civilian","type":"none","name":"unemployed","grade":{"name":"Freelancer","level":0},"onduty":false,"isboss":false,"payment":10}', '{"label":"No Gang Affiliation","isboss":false,"name":"none","grade":{"name":"none","level":0}}', '{"x":1367.2747802734376,"y":3589.371337890625,"z":34.890869140625}', '{"bloodtype":"B+","thirst":73.40000000000002,"inside":{"apartment":[]},"rep":[],"stress":13.69999999999996,"licences":{"business":false,"weapon":false,"driver":true},"oxyxp":0,"hunger":70.59999999999998,"phone":[],"status":[],"callsign":"NO CALLSIGN","armor":0,"jailitems":[],"tracker":false,"drugxp":0,"overdosexp":0,"criminalrecord":{"hasRecord":false},"isdead":false,"walletid":"QB-48718042","inlaststand":false,"fingerprint":"cd702q29rbO8507","ishandcuffed":false,"phonedata":{"SerialNumber":48410867,"InstalledApps":[]},"injail":0}', '[{"slot":2,"name":"driver_license","count":1,"metadata":{"birthdate":"15.03.1977","firstname":"Jimbo","type":"Class C Driver License","lastname":"Taylor"}},{"slot":3,"name":"id_card","count":1,"metadata":{"birthdate":"15.03.1977","citizenid":"LOO91104","firstname":"Jimbo","lastname":"Taylor","gender":0,"nationality":"United States"}},{"slot":4,"name":"sandwich","count":5},{"slot":5,"name":"lockpick","count":2},{"slot":6,"name":"WEAPON_CERAMICPISTOL","count":1,"metadata":{"components":[],"latentprints":{"cd702q29rbO8507":{"integrity":100,"evidenceId":306938}},"ammo":12,"registered":"Jimbo Taylor","durability":98.99999999999999,"serial":"910999YDL206535"}},{"slot":7,"name":"pistol_ammo","count":183}]', '2024-10-13 02:01:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(4514, 'LPI62642', 1, 'license:f90cd271ae404268c3728c7b32d31095b7092b5b', 'SBDemon', '{"crypto":0,"cash":23480,"bank":6182.0}', '{"lastname":"Rich","birthdate":"19.12.1995","account":"US06QBCore6453757143","phone":"1177833293","nationality":"United States","gender":0,"firstname":"Ryan"}', '{"name":"kittys","type":"mechanic","grade":{"payment":150,"name":"Manager","level":4,"isboss":true},"payment":150,"label":"Kittys Motor Works","isboss":true,"onduty":false}', '{"grade":{"isboss":false,"level":0,"name":"Unaffiliated"},"name":"none","label":"No Gang","isboss":false}', '{"x":-874.10107421875,"y":-793.4637451171875,"z":19.085693359375}', '{"drugxp":0,"status":[],"phonedata":{"InstalledApps":[],"SerialNumber":21533893},"isdead":false,"oxyxp":0,"fingerprint":"Sf008c14sPx6453","callsign":"NO CALLSIGN","inlaststand":false,"tracker":false,"licences":{"business":false,"weapon":false,"driver":true},"thirst":96.2,"rep":[],"bloodtype":"A+","injail":0,"phone":{"profilepicture":"./img/app_details/default.png","InstalledApps":{"twitter":"twitter","instagram":"instagram","uber":"uber"},"background":"b27"},"overdosexp":0,"ishandcuffed":false,"hunger":95.8,"jailitems":[],"criminalrecord":{"hasRecord":false},"armor":0,"stress":0,"walletid":"QB-77218535","inside":{"apartment":[]}}', '[{"name":"WEAPON_CARTELGLOCK","count":1,"metadata":{"ammo":0,"serial":"172632FFV988409","durability":90.0,"latentblood":{"514e433436393132":{"bloodtype":"A-","evidenceId":557665}},"components":["at_clip_100_black"],"registered":"Ryan Rich"},"slot":1},{"name":"trowel","count":1,"slot":46},{"name":"gold_phone","count":1,"slot":47},{"name":"money","count":23480,"slot":48},{"name":"id_card","count":1,"metadata":{"lastname":"Rich","gender":0,"nationality":"United States","birthdate":"19.12.1995","citizenid":"LPI62642","firstname":"Ryan"},"slot":49},{"name":"driver_license","count":1,"metadata":{"lastname":"Rich","birthdate":"19.12.1995","type":"Class C Driver License","firstname":"Ryan"},"slot":50},{"name":"toolbox","count":1,"slot":41},{"name":"mechanic_tools","count":1,"slot":42},{"name":"boombox","count":1,"slot":43},{"name":"advancedlockpick","count":1,"slot":3},{"name":"lockpick","count":2,"slot":2}]', '2024-10-12 20:39:38', '[{"Alerts":0,"custom":false,"tooltipText":"Phone","color":"img/apps/phone.png","job":false,"blockedjobs":[],"tooltipPos":"top","app":"phone","slot":1,"bottom":true},{"Alerts":0,"custom":false,"tooltipText":"Gallery","color":"img/apps/gallery.png","job":false,"blockedjobs":[],"app":"photos","bottom":true,"slot":2},{"Alerts":0,"custom":false,"tooltipText":"Messages","color":"img/apps/messages.png","job":false,"blockedjobs":[],"app":"messages","bottom":true,"slot":3},{"Alerts":0,"custom":false,"tooltipText":"Zoo","color":"img/apps/zoo.png","job":false,"blockedjobs":[],"tooltipPos":"top","app":"safari","slot":4,"bottom":true},{"Alerts":0,"custom":false,"tooltipText":"Mail","color":"img/apps/mail.png","job":false,"blockedjobs":[],"app":"mail","slot":5},{"Alerts":0,"custom":false,"slot":6,"color":"img/apps/calendar.png","job":false,"blockedjobs":[],"app":"calendar","tooltipText":"Calendar"},{"Alerts":0,"custom":false,"tooltipText":"Camera","color":"img/apps/camera.png","job":false,"blockedjobs":[],"app":"camera","slot":7},{"Alerts":0,"custom":false,"slot":8,"color":"img/apps/appstore.png","job":false,"blockedjobs":[],"app":"store","tooltipText":"App Store"},{"Alerts":0,"custom":false,"slot":9,"color":"img/apps/clock.png","job":false,"blockedjobs":[],"app":"clock","tooltipText":"Clock"},{"Alerts":0,"custom":false,"slot":10,"color":"img/apps/ping.png","job":false,"blockedjobs":[],"app":"ping","tooltipText":"Ping"},{"Alerts":0,"custom":false,"slot":11,"color":"img/apps/calculator.png","job":false,"blockedjobs":[],"app":"calculator","tooltipText":"Calculator"},{"Alerts":0,"custom":false,"slot":12,"color":"img/apps/bank.png","job":false,"blockedjobs":[],"app":"bank","tooltipText":"Wallet"},{"Alerts":0,"custom":false,"tooltipText":"Weather","color":"img/apps/weather.png","job":false,"blockedjobs":[],"app":"weather","slot":13},{"Alerts":0,"custom":false,"tooltipText":"Notes","color":"img/apps/notes.png","job":false,"blockedjobs":[],"app":"notes","slot":14},{"Alerts":0,"custom":false,"slot":15,"color":"img/apps/settings.png","job":false,"blockedjobs":[],"app":"settings","tooltipText":"Settings"},{"Alerts":0,"custom":false,"tooltipText":"Business","color":"img/apps/business.png","job":false,"blockedjobs":[],"app":"business","slot":16},{"Alerts":0,"custom":false,"tooltipText":"Instagraph","color":"img/apps/instagraph.png","job":false,"blockedjobs":[],"slot":17,"app":"instagram"},{"Alerts":0,"custom":false,"tooltipText":"Tweedle","color":"img/apps/tweedle.png","job":false,"blockedjobs":[],"slot":18,"app":"twitter"},{"Alerts":0,"custom":false,"tooltipText":"doorRun","color":"img/apps/doorRun.png","job":false,"blockedjobs":[],"slot":19,"app":"uber"}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(534, 'OUV63962', 2, 'license:f90cd271ae404268c3728c7b32d31095b7092b5b', 'SBDemon', '{"bank":19401186.0,"crypto":500,"cash":360360.0}', '{"gender":0,"birthdate":"19.12.1995","account":"US06QBCore1824406376","nationality":"United States","phone":"1428617570","lastname":"Test","firstname":"SBDemon"}', '{"type":"mechanic","onduty":false,"grade":{"isboss":true,"payment":300,"level":5,"name":"Owner"},"isboss":true,"label":"Kittys Motor Works","payment":300,"name":"kittys"}', '{"isboss":false,"name":"none","grade":{"isboss":false,"level":0,"name":"Unaffiliated"},"label":"No Gang"}', '{"x":202.8000030517578,"y":-899.2219848632813,"z":31.116455078125}', '{"oxyxp":0,"bloodtype":"A+","ishandcuffed":false,"drugxp":0,"hunger":100,"inside":{"apartment":[]},"jailitems":[],"tracker":false,"electronic-cuffs":false,"callsign":"NO CALLSIGN","licences":{"driver":true,"weapon":true,"business":false},"inlaststand":false,"fingerprint":"rj614I08Jed5366","rep":[],"armor":0,"status":[],"criminalrecord":{"hasRecord":false},"phonedata":{"SerialNumber":94844853,"InstalledApps":[]},"isdead":false,"thirst":100,"stress":0,"injail":0,"phone":{"InstalledApps":{"racing":"racing","crypto":"crypto","youtube":"youtube","spotify":"spotify"},"background":"b31"},"overdosexp":0,"walletid":"QB-31783513"}', '[{"slot":1,"count":1,"name":"WEAPON_CARTELARP","metadata":{"durability":85.80000000000006,"registered":"SBDemon Test","latentprints":{"rj614I08Jed5366":{"integrity":100,"evidenceId":781014}},"serial":"498688ZYB773400","components":["at_clip_bandana_white"],"ammo":0}},{"slot":2,"count":1,"name":"WEAPON_MIDASGLOCK","metadata":{"durability":58.3,"latentblood":{"4a56483439313235":{"bloodtype":"AB-","evidenceId":981593}},"latentprints":{"Tb417Q82gdh1058":{"integrity":100,"evidenceId":364827},"rj614I08Jed5366":{"integrity":100,"evidenceId":368311}},"serial":"168420GFO294503","registered":"SBDemon Test","components":[],"ammo":0}},{"slot":3,"count":17,"name":"lockpick"},{"slot":46,"count":1,"name":"id_card","metadata":{"nationality":"United States","birthdate":"19.12.1995","citizenid":"OUV63962","gender":0,"lastname":"Test","firstname":"SBDemon"}},{"slot":47,"count":13,"name":"oxy"},{"slot":48,"count":1,"name":"trowel"},{"slot":49,"count":360360,"name":"money"},{"slot":50,"count":1,"name":"driver_license","metadata":{"birthdate":"19.12.1995","type":"Class C Driver License","lastname":"Test","firstname":"SBDemon"}}]', '2024-10-13 21:15:34', '[{"app":"phone","bottom":true,"tooltipPos":"top","custom":false,"color":"img/apps/phone.png","job":false,"slot":1,"blockedjobs":[],"tooltipText":"Phone","Alerts":0},{"app":"photos","bottom":true,"custom":false,"color":"img/apps/gallery.png","job":false,"slot":2,"blockedjobs":[],"tooltipText":"Gallery","Alerts":0},{"app":"messages","bottom":true,"custom":false,"color":"img/apps/messages.png","job":false,"slot":3,"blockedjobs":[],"tooltipText":"Messages","Alerts":0},{"app":"safari","bottom":true,"tooltipPos":"top","custom":false,"color":"img/apps/zoo.png","job":false,"slot":4,"blockedjobs":[],"tooltipText":"Zoo","Alerts":0},{"job":false,"slot":5,"blockedjobs":[],"app":"mail","tooltipText":"Mail","Alerts":0,"custom":false,"color":"img/apps/mail.png"},{"job":false,"slot":6,"blockedjobs":[],"app":"calendar","tooltipText":"Calendar","Alerts":0,"custom":false,"color":"img/apps/calendar.png"},{"job":false,"slot":7,"blockedjobs":[],"app":"camera","tooltipText":"Camera","Alerts":0,"custom":false,"color":"img/apps/camera.png"},{"job":false,"slot":8,"blockedjobs":[],"app":"store","tooltipText":"App Store","Alerts":0,"custom":false,"color":"img/apps/appstore.png"},{"job":false,"slot":9,"blockedjobs":[],"app":"clock","tooltipText":"Clock","Alerts":0,"custom":false,"color":"img/apps/clock.png"},{"job":false,"slot":10,"blockedjobs":[],"app":"ping","tooltipText":"Ping","Alerts":0,"custom":false,"color":"img/apps/ping.png"},{"job":false,"slot":11,"blockedjobs":[],"app":"calculator","tooltipText":"Calculator","Alerts":0,"custom":false,"color":"img/apps/calculator.png"},{"job":false,"slot":12,"blockedjobs":[],"app":"bank","tooltipText":"Wallet","Alerts":0,"custom":false,"color":"img/apps/bank.png"},{"job":false,"slot":13,"blockedjobs":[],"app":"weather","tooltipText":"Weather","Alerts":0,"custom":false,"color":"img/apps/weather.png"},{"job":false,"slot":14,"blockedjobs":[],"app":"notes","tooltipText":"Notes","Alerts":0,"custom":false,"color":"img/apps/notes.png"},{"job":false,"slot":15,"blockedjobs":[],"app":"settings","tooltipText":"Settings","Alerts":0,"custom":false,"color":"img/apps/settings.png"},{"job":false,"slot":16,"blockedjobs":[],"app":"business","tooltipText":"Business","Alerts":0,"custom":false,"color":"img/apps/business.png"},{"job":false,"slot":17,"blockedjobs":["police"],"app":"racing","tooltipText":"Racing","Alerts":0,"custom":false,"color":"img/apps/racing.png"},{"job":false,"slot":18,"blockedjobs":[],"app":"spotify","tooltipText":"Soundfy","Alerts":0,"custom":false,"color":"img/apps/soundfy.png"},{"job":false,"slot":19,"blockedjobs":[],"app":"youtube","tooltipText":"YouLink","Alerts":0,"custom":false,"color":"img/apps/youlink.png"},{"job":false,"slot":20,"blockedjobs":[],"app":"crypto","Alerts":0,"tooltipText":"Binance","custom":false,"color":"img/apps/crypto.png"}]', NULL, NULL, NULL, NULL, NULL, '[{"author_name":"Ace Visionz Productions","url":"https://www.youtube.com/watch?v=AggJCt_jxzE","thumbnail_url":"https://i.ytimg.com/vi/AggJCt_jxzE/hqdefault.jpg","title":"Friday Night - King George"}]', NULL, 1, '{"general2":0}', '[]', '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(818, 'PUX10690', 1, 'license:c5f1341b9e5627f52c1a19fd6d2a98c978e4681a', 'ReloadTales', '{"bank":254500,"cash":500,"crypto":0}', '{"account":"US03QBCore2722546038","phone":"8599966938","gender":0,"lastname":"johnson","firstname":"Jayjay","birthdate":"22.06.1998","nationality":"United States"}', '{"isboss":false,"type":"none","name":"unemployed","payment":10,"label":"Civilian","grade":{"level":0,"name":"Freelancer","isboss":false},"onduty":false}', '{"label":"No Gang","grade":{"level":0,"name":"Unaffiliated","isboss":false},"name":"none","isboss":false}', '{"x":-272.3868103027344,"y":-1309.3846435546876,"z":30.8974609375}', '{"fingerprint":"FN907O31cVa5973","walletid":"QB-75919042","injail":0,"inside":{"apartment":[]},"inlaststand":false,"bloodtype":"B+","thirst":92.4,"isdead":false,"drugxp":0,"oxyxp":0,"overdosexp":0,"hunger":91.6,"jailitems":[],"tracker":false,"phone":[],"armor":0,"licences":{"weapon":true,"business":false,"driver":true},"phonedata":{"SerialNumber":25046145,"InstalledApps":[]},"ishandcuffed":false,"criminalrecord":{"hasRecord":false},"rep":[],"stress":1,"status":[],"callsign":"NO CALLSIGN"}', '[{"slot":1,"name":"WEAPON_PISTOL50","metadata":{"latentprints":{"FN907O31cVa5973":{"integrity":100,"evidenceId":240488}},"registered":"Jayjay johnson","serial":"483060CZQ188811","latentblood":{"41494d3037373531":{"bloodtype":"A-","evidenceId":525668}},"durability":90.00000000000022,"ammo":0,"components":[]},"count":1},{"name":"lockpick","slot":2,"count":2},{"name":"advancedlockpick","slot":3,"count":2},{"slot":4,"name":"rentalpapers","metadata":{"description":"Owner: Jayjay johnson | Plate: 23NAA090 | Vehicle: Asea"},"count":1},{"name":"plastic","slot":6,"count":6},{"name":"rubber","slot":7,"count":11},{"name":"money","slot":8,"count":500},{"name":"metalscrap","slot":9,"count":9},{"name":"aluminum","slot":10,"count":8},{"name":"steel","slot":11,"count":3},{"slot":12,"name":"driver_license","metadata":{"firstname":"Jayjay","type":"Class C Driver License","birthdate":"22.06.1998","lastname":"johnson"},"count":1},{"slot":13,"name":"id_card","metadata":{"nationality":"United States","gender":0,"lastname":"johnson","citizenid":"PUX10690","birthdate":"22.06.1998","firstname":"Jayjay"},"count":1},{"name":"iron","slot":14,"count":7}]', '2024-09-14 03:03:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(1019, 'QCD01130', 1, 'license:6420bf4bfdea4c3827bd7e58537da2979425ce83', 'Dave ', '{"bank":16931,"crypto":0,"cash":6023.0}', '{"gender":0,"nationality":"United States","phone":"5033827154","firstname":"Dave","lastname":"Dredd","birthdate":"12.10.1982","account":"US07QBCore6166591096"}', '{"isboss":false,"name":"garbage","onduty":true,"grade":{"isboss":false,"name":"Collector","level":0,"payment":50},"type":"none","payment":50,"label":"Garbage"}', '{"grade":{"isboss":false,"level":0,"name":"Unaffiliated"},"name":"none","label":"No Gang","isboss":false}', '{"x":-105.71868133544922,"y":831.2966918945313,"z":235.7237548828125}', '{"thirst":96.2,"oxyxp":0,"tracker":false,"drugxp":0,"hunger":95.8,"bloodtype":"O-","armor":0,"licences":{"driver":true,"business":false,"weapon":false},"ishandcuffed":false,"callsign":"NO CALLSIGN","phonedata":{"InstalledApps":[],"SerialNumber":36129197},"walletid":"QB-46865489","stress":1,"inside":{"apartment":[]},"injail":0,"status":[],"phone":[],"isdead":false,"jailitems":[],"fingerprint":"Qe101w05SkN4625","overdosexp":0,"criminalrecord":{"hasRecord":false},"inlaststand":false,"rep":[]}', '[{"name":"WEAPON_COMPACTRIFLE","slot":1,"metadata":{"components":[],"latentprints":{"Qe101w05SkN4625":{"integrity":100,"evidenceId":720662}},"registered":"Dave Dredd","serial":"381354OEH188427","durability":98.50000000000002,"ammo":0},"count":1},{"name":"driver_license","slot":2,"metadata":{"birthdate":"12.10.1982","firstname":"Dave","lastname":"Dredd","type":"Class C Driver License"},"count":1},{"name":"id_card","slot":3,"metadata":{"nationality":"United States","birthdate":"12.10.1982","gender":0,"citizenid":"QCD01130","lastname":"Dredd","firstname":"Dave"},"count":1},{"name":"money","slot":4,"count":6023},{"name":"lockpick","slot":5,"count":20},{"name":"rubber","slot":6,"count":14},{"name":"bottle","slot":7,"count":1},{"name":"sandwich","slot":8,"count":26},{"name":"steel","slot":9,"count":2},{"name":"ammo-rifle2","slot":10,"count":70},{"name":"rubber","slot":11,"count":2},{"name":"cryptostick","slot":12,"count":1},{"name":"plastic","slot":13,"count":5},{"name":"glass","slot":14,"count":3},{"name":"iron","slot":15,"count":2},{"name":"aluminum","slot":16,"count":5},{"name":"steel","slot":17,"count":1},{"name":"aluminum","slot":18,"count":1},{"name":"rubber","slot":19,"count":1},{"name":"iron","slot":20,"count":3},{"name":"cryptostick","slot":21,"count":1},{"name":"aluminum","slot":22,"count":4},{"name":"aluminum","slot":23,"count":1},{"name":"metalscrap","slot":24,"count":5},{"name":"glass","slot":25,"count":4},{"name":"WEAPON_PETROLCAN","slot":26,"metadata":{"components":[],"durability":99,"ammo":99},"count":1},{"name":"WEAPON_PETROLCAN","slot":27,"metadata":{"components":[],"durability":99,"ammo":99},"count":1},{"name":"water_bottle","slot":28,"count":4},{"name":"steel","slot":29,"count":2},{"name":"plastic","slot":30,"count":1},{"name":"cryptostick","slot":31,"count":1},{"name":"cryptostick","slot":32,"count":1},{"name":"cryptostick","slot":33,"count":1},{"name":"cryptostick","slot":34,"count":1},{"name":"driver_license","slot":35,"metadata":{"nationality":"United States","birthdate":"12.10.1982","type":"Class C Driver License","gender":0,"citizenid":"QCD01130","lastname":"Dredd","firstname":"Dave"},"count":1},{"name":"can","slot":36,"count":25},{"name":"WEAPON_RAM7","slot":37,"metadata":{"durability":100,"registered":"Test Testina","serial":"505775JZW366903","components":[],"ammo":0},"count":1},{"name":"heavyarmor","slot":38,"count":4},{"name":"rifle_ammo","slot":39,"count":300},{"name":"bandage","slot":40,"count":50}]', '2024-09-19 01:54:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(1262, 'QNC46912', 1, 'license:6c71ff5df10586f8d960d0fa1d9d981cb823f338', 'Mub', '{"crypto":0,"bank":301560,"cash":3724}', '{"lastname":"Murphy","birthdate":"10.03.1999","account":"US02QBCore1411692722","phone":"6223202493","firstname":"Andy","nationality":"United Kingdom","gender":0}', '{"grade":{"isboss":true,"name":"Chief","level":10,"payment":3500},"payment":3500,"isboss":true,"type":"leo","label":"LSPD","onduty":true,"name":"lspd"}', '{"label":"No Gang","isboss":false,"grade":{"name":"Unaffiliated","level":0,"isboss":false},"name":"none"}', '{"x":-711.3757934570313,"y":-156.3164825439453,"z":37.4014892578125}', '{"rep":[],"isdead":false,"overdosexp":0,"inlaststand":false,"jailitems":[],"injail":0,"phonedata":{"InstalledApps":[],"SerialNumber":88009866},"drugxp":0,"stress":13.69999999999998,"criminalrecord":{"hasRecord":false},"walletid":"QB-77709798","tracker":false,"oxyxp":0,"licences":{"weapon":true,"driver":true,"business":false},"bloodtype":"A-","ishandcuffed":false,"armor":0,"thirst":62.00000000000003,"inside":{"apartment":[]},"fingerprint":"dv704g47QVg1927","phone":{"InstalledApps":{"crypto":"crypto","garage":"garage","racing":"racing"},"background":"b31"},"callsign":"L-1","hunger":57.99999999999997,"status":[]}', '[{"name":"WEAPON_PDHK33","count":1,"slot":1,"metadata":{"serial":"344623POL127202","ammo":30,"registered":"Andy Murphy","components":[],"latentprints":{"dv704g47QVg1927":{"integrity":100,"evidenceId":218875}},"durability":91.70000000000012}},{"name":"WEAPON_FLASHLIGHT","count":1,"slot":2,"metadata":{"serial":"POL","latentprints":{"xQ358t79KXL2469":{"integrity":100,"evidenceId":157936},"dv704g47QVg1927":{"integrity":100,"evidenceId":858729},"Tb417Q82gdh1058":{"evidenceId":109120,"integrity":100}},"registered":true,"components":[],"durability":97.90000000000008}},{"name":"rifle_ammo","slot":6,"count":181},{"name":"mininglaser","slot":7,"count":1},{"name":"drillbit","slot":11,"count":12},{"name":"fingerprintkit","slot":46,"count":1},{"name":"money","slot":47,"count":3724}]', '2024-10-12 19:47:14', '[{"app":"phone","bottom":true,"blockedjobs":[],"Alerts":0,"job":false,"tooltipPos":"top","custom":false,"color":"img/apps/phone.png","slot":1,"tooltipText":"Phone"},{"app":"photos","bottom":true,"blockedjobs":[],"Alerts":0,"job":false,"custom":false,"color":"img/apps/gallery.png","slot":2,"tooltipText":"Gallery"},{"app":"messages","bottom":true,"blockedjobs":[],"Alerts":0,"job":false,"custom":false,"color":"img/apps/messages.png","slot":3,"tooltipText":"Messages"},{"app":"safari","bottom":true,"blockedjobs":[],"Alerts":0,"job":false,"tooltipPos":"top","custom":false,"color":"img/apps/zoo.png","slot":4,"tooltipText":"Zoo"},{"job":false,"app":"mail","blockedjobs":[],"custom":false,"color":"img/apps/mail.png","slot":5,"Alerts":0,"tooltipText":"Mail"},{"job":false,"app":"calendar","blockedjobs":[],"custom":false,"color":"img/apps/calendar.png","slot":6,"Alerts":0,"tooltipText":"Calendar"},{"job":false,"app":"camera","blockedjobs":[],"custom":false,"color":"img/apps/camera.png","slot":7,"Alerts":0,"tooltipText":"Camera"},{"job":false,"app":"store","blockedjobs":[],"custom":false,"color":"img/apps/appstore.png","slot":8,"Alerts":0,"tooltipText":"App Store"},{"job":false,"app":"clock","blockedjobs":[],"custom":false,"color":"img/apps/clock.png","slot":9,"Alerts":0,"tooltipText":"Clock"},{"job":false,"app":"ping","blockedjobs":[],"custom":false,"color":"img/apps/ping.png","slot":10,"Alerts":0,"tooltipText":"Ping"},{"job":false,"app":"calculator","blockedjobs":[],"custom":false,"color":"img/apps/calculator.png","slot":11,"Alerts":0,"tooltipText":"Calculator"},{"job":false,"app":"bank","blockedjobs":[],"custom":false,"color":"img/apps/bank.png","slot":12,"Alerts":0,"tooltipText":"Wallet"},{"job":false,"app":"weather","blockedjobs":[],"custom":false,"color":"img/apps/weather.png","slot":13,"Alerts":0,"tooltipText":"Weather"},{"job":false,"app":"notes","blockedjobs":[],"custom":false,"color":"img/apps/notes.png","slot":14,"Alerts":0,"tooltipText":"Notes"},{"job":false,"app":"settings","blockedjobs":[],"custom":false,"color":"img/apps/settings.png","slot":15,"Alerts":0,"tooltipText":"Settings"},{"job":false,"app":"business","blockedjobs":[],"custom":false,"color":"img/apps/business.png","slot":16,"Alerts":0,"tooltipText":"Business"},{"job":false,"app":"racing","blockedjobs":["police"],"custom":false,"color":"img/apps/racing.png","slot":17,"Alerts":0,"tooltipText":"Racing"},{"job":false,"app":"crypto","tooltipText":"Binance","custom":false,"color":"img/apps/crypto.png","slot":18,"Alerts":0,"blockedjobs":[]},{"job":false,"app":"garage","tooltipText":"My Garage","custom":false,"color":"img/apps/garages.png","slot":19,"Alerts":0,"blockedjobs":[]}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(5819, 'RDO88579', 1, 'license:a045ed84bc7b147ab67442c4be4c70a4bb7d0ad5', 'DEV Dx', '{"crypto":0,"cash":40200,"bank":4275}', '{"firstname":"Mr","gender":0,"nationality":"Albania","birthdate":"03.09.2012","phone":"7745030982","account":"US03QBCore1176655441","lastname":"Dx"}', '{"onduty":false,"grade":{"name":"Advanced","payment":125,"isboss":false,"level":3},"name":"burgershot","payment":125,"isboss":false,"type":"none","label":"BurgerShot"}', '{"grade":{"name":"Unaffiliated","isboss":false,"level":0},"name":"none","isboss":false,"label":"No Gang"}', '{"x":-50.03076934814453,"y":-1110.0791015625,"z":26.6680908203125}', '{"isdead":false,"bloodtype":"AB+","thirst":73.40000000000002,"inlaststand":false,"oxyxp":0,"jailitems":[],"phone":{"InstalledApps":{"spotify":"spotify","meos":"meos"},"background":"b2"},"hunger":70.59999999999998,"injail":0,"armor":0,"licences":{"weapon":true,"driver":true,"business":false},"drugxp":0,"stress":0,"fingerprint":"Yu377B29wtV9341","rep":[],"status":[],"ishandcuffed":false,"walletid":"QB-95141799","callsign":"NO CALLSIGN","phonedata":{"InstalledApps":[],"SerialNumber":80346517},"criminalrecord":{"hasRecord":false},"inside":{"apartment":[]},"overdosexp":0,"tracker":false}', '[{"count":1,"name":"WEAPON_MEGAPHONE","slot":1},{"count":1,"metadata":{"durability":1730605134,"degrade":43200},"name":"megaphone","slot":2},{"count":1,"metadata":{"gender":0,"nationality":"Albania","birthdate":"03.09.2012","lastname":"Dx","citizenid":"RDO88579","firstname":"Mr"},"name":"id_card","slot":3},{"count":1,"metadata":{"myhidentime":1727453819,"date":"Fri Sep 27 09:16:59 2024","roomnumber":701,"cardnumber":"JC8ZB2D99M"},"name":"hotel_card","slot":4},{"count":1,"name":"torture_kit","slot":5},{"count":40200,"name":"money","slot":6},{"count":1,"metadata":{"lastname":"Dx","type":"Class C Driver License","birthdate":"03.09.2012","firstname":"Mr"},"name":"driver_license","slot":7},{"count":1,"name":"red_phone","slot":8}]', '2024-10-09 06:02:52', '[{"tooltipPos":"top","job":false,"custom":false,"app":"phone","slot":1,"Alerts":0,"bottom":true,"tooltipText":"Phone","blockedjobs":[],"color":"img/apps/phone.png"},{"job":false,"custom":false,"app":"photos","slot":2,"tooltipText":"Gallery","bottom":true,"Alerts":0,"blockedjobs":[],"color":"img/apps/gallery.png"},{"job":false,"custom":false,"app":"messages","slot":3,"tooltipText":"Messages","bottom":true,"Alerts":0,"blockedjobs":[],"color":"img/apps/messages.png"},{"tooltipPos":"top","job":false,"custom":false,"app":"safari","slot":4,"Alerts":0,"bottom":true,"tooltipText":"Zoo","blockedjobs":[],"color":"img/apps/zoo.png"},{"custom":false,"slot":5,"job":false,"app":"mail","Alerts":0,"tooltipText":"Mail","blockedjobs":[],"color":"img/apps/mail.png"},{"custom":false,"slot":6,"job":false,"app":"calendar","Alerts":0,"tooltipText":"Calendar","blockedjobs":[],"color":"img/apps/calendar.png"},{"custom":false,"slot":7,"job":false,"app":"camera","Alerts":0,"tooltipText":"Camera","blockedjobs":[],"color":"img/apps/camera.png"},{"custom":false,"slot":8,"job":false,"app":"store","Alerts":0,"tooltipText":"App Store","blockedjobs":[],"color":"img/apps/appstore.png"},{"custom":false,"slot":9,"job":false,"app":"clock","Alerts":0,"tooltipText":"Clock","blockedjobs":[],"color":"img/apps/clock.png"},{"custom":false,"slot":10,"job":false,"app":"ping","Alerts":0,"tooltipText":"Ping","blockedjobs":[],"color":"img/apps/ping.png"},{"custom":false,"slot":11,"job":false,"app":"calculator","Alerts":0,"tooltipText":"Calculator","blockedjobs":[],"color":"img/apps/calculator.png"},{"custom":false,"slot":12,"job":false,"app":"bank","Alerts":0,"tooltipText":"Wallet","blockedjobs":[],"color":"img/apps/bank.png"},{"custom":false,"slot":13,"job":false,"app":"weather","Alerts":0,"tooltipText":"Weather","blockedjobs":[],"color":"img/apps/weather.png"},{"custom":false,"slot":14,"job":false,"app":"notes","Alerts":0,"tooltipText":"Notes","blockedjobs":[],"color":"img/apps/notes.png"},{"custom":false,"slot":15,"job":false,"app":"settings","Alerts":0,"tooltipText":"Settings","blockedjobs":[],"color":"img/apps/settings.png"},{"custom":false,"slot":16,"job":false,"app":"business","Alerts":0,"tooltipText":"Business","blockedjobs":[],"color":"img/apps/business.png"},{"custom":false,"app":"spotify","job":false,"slot":17,"Alerts":0,"tooltipText":"Soundfy","blockedjobs":[],"color":"img/apps/soundfy.png"},{"custom":false,"app":"meos","job":["police"],"slot":18,"Alerts":0,"tooltipText":"Police","blockedjobs":[],"color":"img/apps/police.png"}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL),
	(1111, 'XKU09196', 1, 'license:ede60aa4be9a38d678be00c5da5e6a4525e9ad79', 'ayannawalker2002', '{"cash":500,"crypto":0,"bank":5000}', '{"firstname":"Domo","lastname":"Monroe","phone":"7225353139","nationality":"Mauritius","account":"US06QBCore9541900819","birthdate":"10.06.2002","gender":1}', '{"grade":{"name":"Freelancer","level":0},"name":"unemployed","label":"Civilian","type":"none","payment":10,"onduty":false,"isboss":false}', '{"label":"No Gang Affiliation","grade":{"name":"none","level":0},"name":"none","isboss":false}', '{"x":-819.6923217773438,"y":-723.7186889648438,"z":106.8564453125}', '{"walletid":"QB-32470538","stress":0,"ishandcuffed":false,"status":[],"fingerprint":"rU765o68WTc5715","criminalrecord":{"hasRecord":false},"armor":0,"hunger":100,"thirst":100,"tracker":false,"inlaststand":false,"phone":[],"bloodtype":"O-","rep":[],"jailitems":[],"isdead":false,"phonedata":{"SerialNumber":29832777,"InstalledApps":[]},"injail":0,"licences":{"business":false,"weapon":false,"driver":true},"callsign":"NO CALLSIGN","inside":{"apartment":[]}}', '[{"slot":1,"count":500,"name":"money"},{"metadata":{"firstname":"Domo","lastname":"Monroe","type":"Class C Driver License","birthdate":"10.06.2002"},"slot":2,"count":1,"name":"driver_license"},{"metadata":{"lastname":"Monroe","nationality":"Mauritius","firstname":"Domo","gender":1,"citizenid":"XKU09196","birthdate":"10.06.2002"},"slot":3,"count":1,"name":"id_card"}]', '2024-09-02 17:43:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '[]', 0, 0, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.playerskins: ~26 rows (approximately)
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(2, 'CIU02338', '1885233650', '{"moles":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"blush":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"cheek_1":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"accessory":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_5":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"shoes":{"item":3,"texture":0,"defaultTexture":0,"defaultItem":1},"pants":{"item":4,"texture":2,"defaultTexture":0,"defaultItem":0},"ageing":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"hat":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"lipstick":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"jaw_bone_back_lenght":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_lenght":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"bag":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"vest":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"watch":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"nose_2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"beard":{"item":10,"texture":0,"defaultTexture":1,"defaultItem":-1},"ear":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"neck_thikness":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"arms":{"item":1,"texture":0,"defaultTexture":0,"defaultItem":0},"eye_color":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":-1},"chimp_hole":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eye_opening":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"makeup":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"chimp_bone_width":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"mask":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"face2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrown_high":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_lowering":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrown_forward":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"jaw_bone_width":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"facemix":{"skinMix":0,"shapeMix":0,"defaultSkinMix":0.0,"defaultShapeMix":0.0},"hair":{"item":11,"texture":0,"defaultTexture":0,"defaultItem":0},"lips_thickness":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_3":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_0":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"face":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"t-shirt":{"item":1,"texture":0,"defaultTexture":0,"defaultItem":1},"nose_1":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_3":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"decals":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"bracelet":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"glass":{"item":4,"texture":0,"defaultTexture":0,"defaultItem":0},"torso2":{"item":62,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrows":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1}}', 1),
	(3, 'JLN55666', '1885233650', '{"face":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"hair":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_2":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"lipstick":{"item":-1,"defaultItem":-1,"texture":1,"defaultTexture":1},"eye_color":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"hat":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"ageing":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"jaw_bone_width":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"makeup":{"item":-1,"defaultItem":-1,"texture":1,"defaultTexture":1},"chimp_hole":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"cheek_1":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"torso2":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"beard":{"item":-1,"defaultItem":-1,"texture":1,"defaultTexture":1},"vest":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"cheek_2":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"chimp_bone_lowering":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_0":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"shoes":{"item":1,"defaultItem":1,"texture":0,"defaultTexture":0},"neck_thikness":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"chimp_bone_width":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"lips_thickness":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"eyebrows":{"item":-1,"defaultItem":-1,"texture":1,"defaultTexture":1},"bag":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"ear":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"chimp_bone_lenght":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"jaw_bone_back_lenght":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"facemix":{"defaultSkinMix":0.0,"defaultShapeMix":0.0,"skinMix":0,"shapeMix":0},"eyebrown_forward":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"mask":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"watch":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"bracelet":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"moles":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"eyebrown_high":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_1":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"pants":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_3":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"blush":{"item":-1,"defaultItem":-1,"texture":1,"defaultTexture":1},"cheek_3":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"accessory":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"arms":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"decals":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"eye_opening":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_5":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"glass":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"face2":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"t-shirt":{"item":1,"defaultItem":1,"texture":0,"defaultTexture":0},"nose_4":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0}}', 1),
	(5, 'HFY38105', '1885233650', '{"decals":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"beard":{"item":-1,"defaultTexture":1,"texture":1,"defaultItem":-1},"ageing":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"chimp_bone_width":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"lips_thickness":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"accessory":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"hair":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"eyebrows":{"item":-1,"defaultTexture":1,"texture":1,"defaultItem":-1},"nose_1":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"bracelet":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"glass":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"face":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"neck_thikness":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"pants":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"nose_5":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"moles":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"chimp_bone_lenght":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"vest":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"facemix":{"skinMix":0,"shapeMix":0,"defaultShapeMix":0.0,"defaultSkinMix":0.0},"eyebrown_forward":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"t-shirt":{"item":1,"defaultTexture":0,"texture":0,"defaultItem":1},"chimp_hole":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"cheek_3":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"arms":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"nose_0":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"cheek_1":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"eyebrown_high":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"jaw_bone_width":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"bag":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"mask":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"cheek_2":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"chimp_bone_lowering":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"blush":{"item":-1,"defaultTexture":1,"texture":1,"defaultItem":-1},"eye_opening":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"jaw_bone_back_lenght":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"nose_4":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"nose_3":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"nose_2":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"hat":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"watch":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"ear":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"eye_color":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"face2":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"torso2":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"shoes":{"item":1,"defaultTexture":0,"texture":0,"defaultItem":1},"lipstick":{"item":-1,"defaultTexture":1,"texture":1,"defaultItem":-1},"makeup":{"item":-1,"defaultTexture":1,"texture":1,"defaultItem":-1}}', 1),
	(6, 'GAZ46654', '-1667301416', '{"bracelet":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"nose_4":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"shoes":{"item":49,"defaultTexture":0,"defaultItem":1,"texture":0},"bag":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"face2":{"item":2,"defaultTexture":0,"defaultItem":0,"texture":2},"t-shirt":{"item":2,"defaultTexture":0,"defaultItem":1,"texture":0},"accessory":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrown_high":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"vest":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"ear":{"item":0,"defaultTexture":0,"defaultItem":-1,"texture":0},"jaw_bone_width":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"lips_thickness":{"item":12,"defaultTexture":0,"defaultItem":0,"texture":0},"watch":{"item":3,"defaultTexture":0,"defaultItem":-1,"texture":0},"face":{"item":40,"defaultTexture":0,"defaultItem":0,"texture":8},"glass":{"item":5,"defaultTexture":0,"defaultItem":0,"texture":0},"hair":{"item":87,"defaultTexture":0,"defaultItem":0,"texture":28},"ageing":{"item":15,"defaultTexture":0,"defaultItem":-1,"texture":0},"nose_3":{"item":4,"defaultTexture":0,"defaultItem":0,"texture":0},"chimp_bone_width":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"moles":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"facemix":{"defaultShapeMix":0.0,"defaultSkinMix":0.0,"shapeMix":0,"skinMix":0},"hat":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"pants":{"item":8,"defaultTexture":0,"defaultItem":0,"texture":0},"mask":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"makeup":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1},"neck_thikness":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"lipstick":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1},"cheek_3":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"cheek_1":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_5":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"cheek_2":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"chimp_bone_lowering":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"torso2":{"item":173,"defaultTexture":0,"defaultItem":0,"texture":0},"chimp_bone_lenght":{"item":8,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_2":{"item":6,"defaultTexture":0,"defaultItem":0,"texture":0},"beard":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1},"jaw_bone_back_lenght":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrown_forward":{"item":4,"defaultTexture":0,"defaultItem":0,"texture":0},"chimp_hole":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eye_opening":{"item":13,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_1":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_0":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eye_color":{"item":14,"defaultTexture":0,"defaultItem":-1,"texture":0},"eyebrows":{"item":2,"defaultTexture":1,"defaultItem":-1,"texture":1},"decals":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"arms":{"item":4,"defaultTexture":0,"defaultItem":0,"texture":0},"blush":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1}}', 1),
	(7, 'CUM99608', '1885233650', '{"ageing":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"pants":{"item":7,"defaultTexture":0,"defaultItem":0,"texture":0},"torso2":{"item":7,"defaultTexture":0,"defaultItem":0,"texture":0},"lipstick":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1},"t-shirt":{"item":1,"defaultTexture":0,"defaultItem":1,"texture":0},"nose_0":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"shoes":{"item":12,"defaultTexture":0,"defaultItem":1,"texture":0},"cheek_2":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"moles":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"nose_2":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"bracelet":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"facemix":{"defaultShapeMix":0.0,"defaultSkinMix":0.0,"shapeMix":0,"skinMix":0},"hat":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"neck_thikness":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"cheek_1":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"lips_thickness":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"hair":{"item":38,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrown_forward":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"chimp_bone_lenght":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"makeup":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1},"ear":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"eyebrows":{"item":0,"defaultTexture":1,"defaultItem":-1,"texture":1},"beard":{"item":10,"defaultTexture":1,"defaultItem":-1,"texture":1},"accessory":{"item":17,"defaultTexture":0,"defaultItem":0,"texture":0},"eye_color":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"face2":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrown_high":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"chimp_hole":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"decals":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"glass":{"item":35,"defaultTexture":0,"defaultItem":0,"texture":0},"chimp_bone_lowering":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"jaw_bone_back_lenght":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"vest":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"bag":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eye_opening":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"cheek_3":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_5":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_4":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"watch":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"blush":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1},"nose_3":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"chimp_bone_width":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"mask":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"arms":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"jaw_bone_width":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"face":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_1":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0}}', 1),
	(8, 'RBG25633', '1885233650', '{"pants":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"moles":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"facemix":{"skinMix":0,"defaultSkinMix":0.0,"defaultShapeMix":0.0,"shapeMix":0},"hair":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"lipstick":{"item":-1,"defaultItem":-1,"texture":1,"defaultTexture":1},"decals":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"chimp_bone_width":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"chimp_bone_lowering":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_1":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"jaw_bone_width":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"makeup":{"item":-1,"defaultItem":-1,"texture":1,"defaultTexture":1},"t-shirt":{"item":1,"defaultItem":1,"texture":0,"defaultTexture":0},"cheek_1":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"arms":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_0":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"cheek_2":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"watch":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"mask":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"face":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"bracelet":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"neck_thikness":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"ageing":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"nose_4":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"vest":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"ear":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"eyebrown_high":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"chimp_bone_lenght":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"jaw_bone_back_lenght":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"eye_color":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"accessory":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"lips_thickness":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"beard":{"item":-1,"defaultItem":-1,"texture":1,"defaultTexture":1},"eye_opening":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_2":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"face2":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"cheek_3":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_5":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"chimp_hole":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"eyebrows":{"item":-1,"defaultItem":-1,"texture":1,"defaultTexture":1},"blush":{"item":-1,"defaultItem":-1,"texture":1,"defaultTexture":1},"eyebrown_forward":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"glass":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"shoes":{"item":1,"defaultItem":1,"texture":0,"defaultTexture":0},"bag":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"hat":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"torso2":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_3":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0}}', 1),
	(9, 'WFU61164', '-619494093', '{"jaw_bone_width":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"vest":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"face2":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"makeup":{"defaultItem":-1,"item":-1,"defaultTexture":1,"texture":1},"t-shirt":{"defaultItem":1,"item":1,"defaultTexture":0,"texture":0},"watch":{"defaultItem":-1,"item":-1,"defaultTexture":0,"texture":0},"nose_0":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"chimp_bone_width":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"lipstick":{"defaultItem":-1,"item":-1,"defaultTexture":1,"texture":1},"bag":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"nose_4":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"pants":{"defaultItem":0,"item":1,"defaultTexture":0,"texture":0},"glass":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"shoes":{"defaultItem":1,"item":1,"defaultTexture":0,"texture":0},"facemix":{"defaultSkinMix":0.0,"skinMix":0,"shapeMix":0,"defaultShapeMix":0.0},"cheek_2":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"neck_thikness":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"eyebrows":{"defaultItem":-1,"item":-1,"defaultTexture":1,"texture":1},"nose_2":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"blush":{"defaultItem":-1,"item":-1,"defaultTexture":1,"texture":1},"beard":{"defaultItem":-1,"item":-1,"defaultTexture":1,"texture":1},"nose_5":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"eyebrown_high":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"face":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"chimp_bone_lenght":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"decals":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"arms":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"accessory":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"hat":{"defaultItem":-1,"item":-1,"defaultTexture":0,"texture":0},"chimp_bone_lowering":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"jaw_bone_back_lenght":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"eyebrown_forward":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"lips_thickness":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"eye_opening":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"cheek_3":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"ageing":{"defaultItem":-1,"item":-1,"defaultTexture":0,"texture":0},"hair":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"cheek_1":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"chimp_hole":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"nose_3":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"nose_1":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"ear":{"defaultItem":-1,"item":-1,"defaultTexture":0,"texture":0},"torso2":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"moles":{"defaultItem":-1,"item":-1,"defaultTexture":0,"texture":0},"bracelet":{"defaultItem":-1,"item":-1,"defaultTexture":0,"texture":0},"eye_color":{"defaultItem":-1,"item":-1,"defaultTexture":0,"texture":0},"mask":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0}}', 1),
	(10, 'ERZ21370', 'mp_m_freemode_01', '{"shoes":{"defaultTexture":0,"item":2,"texture":0,"defaultItem":1},"ageing":{"texture":0,"opacity":0.6,"defaultTexture":0,"defaultItem":-1,"highlight":0,"item":5},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":0.1},"vest":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"hair":{"texture":1,"item":10,"defaultTexture":0,"defaultItem":0,"highlight":1,"style":0},"bag":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":-4.0},"arms":{"defaultTexture":0,"item":2,"texture":0,"defaultItem":0},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":1.5},"face2":{"defaultTexture":0,"item":37,"texture":37,"defaultItem":0},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":-0.4},"t-shirt":{"defaultTexture":0,"item":15,"texture":0,"defaultItem":1},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":-3.0},"pants":{"defaultTexture":0,"item":1,"texture":0,"defaultItem":0},"accessory":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":2.0},"skinDad":17,"skinMom":27,"tattoos":[],"nose_2":{"defaultTexture":0,"defaultItem":0,"item":-4.8},"decals":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"facemix":{"shapeMix":0.12610100043342,"skinMix":0.39838310857161},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":-3.7},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":-2.2},"complexion":{"texture":0,"opacity":0.09,"defaultTexture":0,"defaultItem":0,"highlight":0,"item":4},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":-2.8},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":0.0},"moles":{"texture":0,"opacity":0.37,"defaultTexture":0,"defaultItem":-1,"highlight":0,"item":10},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":1.0},"eye_color":{"defaultTexture":0,"item":1,"texture":0,"defaultItem":-1},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":-0.4},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":4.5},"mask":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":2.9},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":-4.1},"eyebrows":{"texture":0,"opacity":0.64,"defaultTexture":1,"defaultItem":-1,"highlight":0,"item":10},"beard":{"texture":0,"opacity":0.61,"defaultTexture":1,"defaultItem":-1,"highlight":0,"item":24},"sun_damage":{"texture":0,"opacity":0.44,"defaultTexture":0,"defaultItem":0,"highlight":0,"item":9},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":-3.4},"torso2":{"defaultTexture":0,"item":16,"texture":0,"defaultItem":0},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":3.8},"face":{"defaultTexture":0,"item":10,"texture":10,"defaultItem":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":4.4}}', 1),
	(11, 'KVJ77630', 'mp_m_freemode_01', '{"nose_3":{"defaultTexture":0,"item":-2.9,"defaultItem":0},"ageing":{"texture":0,"opacity":0.42,"defaultTexture":0,"item":14,"highlight":0,"defaultItem":-1},"nose_5":{"defaultTexture":0,"item":3.8,"defaultItem":0},"vest":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"hair":{"texture":1,"style":0,"defaultTexture":0,"defaultItem":0,"highlight":1,"item":27},"bag":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"cheek_2":{"defaultTexture":0,"item":2.6,"defaultItem":0},"eye_color":{"texture":0,"item":1,"defaultTexture":0,"defaultItem":-1},"eyebrown_forward":{"defaultTexture":0,"item":-0.7,"defaultItem":0},"face2":{"texture":27,"item":27,"defaultTexture":0,"defaultItem":0},"face":{"texture":2,"item":2,"defaultTexture":0,"defaultItem":0},"t-shirt":{"texture":0,"item":15,"defaultItem":1,"defaultTexture":0},"nose_4":{"defaultTexture":0,"item":-0.8,"defaultItem":0},"eyebrown_high":{"defaultTexture":0,"item":2.5,"defaultItem":0},"accessory":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"nose_1":{"defaultTexture":0,"item":-1.0,"defaultItem":0},"skinDad":29,"skinMom":27,"tattoos":[],"nose_2":{"defaultTexture":0,"item":-4.8,"defaultItem":0},"decals":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"facemix":{"shapeMix":0.82838795224746,"skinMix":0.21758933603965},"lips_thickness":{"defaultTexture":0,"item":2.4,"defaultItem":0},"jaw_bone_back_lenght":{"defaultTexture":0,"item":3.59999999999999,"defaultItem":0},"complexion":{"texture":0,"opacity":0.63,"defaultTexture":0,"item":0,"highlight":0,"defaultItem":0},"chimp_bone_lowering":{"defaultTexture":0,"item":1.4,"defaultItem":0},"cheek_3":{"defaultTexture":0,"item":3.9,"defaultItem":0},"moles":{"texture":0,"opacity":0.76,"defaultTexture":0,"item":4,"highlight":0,"defaultItem":-1},"cheek_1":{"defaultTexture":0,"item":4.69999999999999,"defaultItem":0},"pants":{"texture":0,"item":52,"defaultItem":0,"defaultTexture":0},"chimp_hole":{"defaultTexture":0,"item":-2.8,"defaultItem":0},"neck_thikness":{"defaultTexture":0,"item":-3.9,"defaultItem":0},"mask":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"chimp_bone_width":{"defaultTexture":0,"item":-2.0,"defaultItem":0},"jaw_bone_width":{"defaultTexture":0,"item":1.9,"defaultItem":0},"eye_opening":{"defaultTexture":0,"item":-4.6,"defaultItem":0},"beard":{"texture":0,"opacity":0.12,"defaultTexture":1,"item":19,"highlight":0,"defaultItem":-1},"sun_damage":{"texture":0,"opacity":0.35,"defaultTexture":0,"item":3,"highlight":0,"defaultItem":0},"chimp_bone_lenght":{"defaultTexture":0,"item":-3.3,"defaultItem":0},"arms":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"shoes":{"texture":0,"item":54,"defaultItem":1,"defaultTexture":0},"torso2":{"texture":0,"item":235,"defaultItem":0,"defaultTexture":0},"eyebrows":{"texture":0,"opacity":0.16,"defaultTexture":1,"item":31,"highlight":0,"defaultItem":-1}}', 1),
	(13, 'FGB24346', 'a_m_m_beach_01', '{"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":0.0},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":0.0},"face":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"ear":{"defaultItem":-1,"texture":-1,"item":-1,"defaultTexture":0},"facemix":{"shapeMix":0.5,"skinMix":0.5},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":0.0},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":0.0},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":0.0},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":0.0},"bag":{"defaultItem":0,"texture":0,"item":-1,"defaultTexture":0},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":0.0},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":0.0},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":0.0},"bracelet":{"defaultItem":-1,"texture":-1,"item":-1,"defaultTexture":0},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":0.0},"shoes":{"defaultItem":1,"texture":0,"item":-1,"defaultTexture":0},"hair":{"highlight":-1,"item":-1,"style":0,"texture":-1,"defaultItem":0,"defaultTexture":0},"tattoos":[],"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":0.0},"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":0.0},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":0.0},"accessory":{"defaultItem":0,"texture":0,"item":-1,"defaultTexture":0},"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":0.0},"torso2":{"defaultItem":0,"texture":0,"item":-1,"defaultTexture":0},"mask":{"defaultItem":0,"texture":0,"item":-1,"defaultTexture":0},"eye_color":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":-1},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":0.0},"nose_0":{"defaultItem":0,"defaultTexture":0,"item":0.0},"t-shirt":{"defaultItem":1,"texture":0,"item":-1,"defaultTexture":0},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":0.0},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":0.0},"vest":{"defaultItem":0,"texture":0,"item":-1,"defaultTexture":0},"glass":{"defaultItem":-1,"texture":-1,"item":-1,"defaultTexture":-1},"arms":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"pants":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"decals":{"defaultItem":0,"texture":0,"item":-1,"defaultTexture":0},"nose_3":{"defaultItem":0,"defaultTexture":0,"item":0.0},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":0.0},"face2":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"watch":{"defaultItem":-1,"texture":-1,"item":-1,"defaultTexture":0},"hat":{"defaultItem":-1,"texture":-1,"item":-1,"defaultTexture":0}}', 1),
	(20, 'PUX10690', 'mp_m_freemode_01', '{"eyebrows":{"defaultTexture":1,"opacity":0.0,"defaultItem":-1,"texture":0,"highlight":0,"item":15},"jaw_bone_width":{"defaultTexture":0,"item":4.4,"defaultItem":0},"torso2":{"defaultTexture":0,"item":28,"defaultItem":0,"texture":0},"moles":{"defaultTexture":0,"opacity":0.54,"defaultItem":-1,"texture":0,"highlight":0,"item":13},"eye_color":{"defaultTexture":0,"item":1,"defaultItem":-1,"texture":0},"neck_thikness":{"defaultTexture":0,"item":-4.4,"defaultItem":0},"chimp_bone_lowering":{"defaultTexture":0,"item":-4.1,"defaultItem":0},"nose_3":{"defaultTexture":0,"item":3.8,"defaultItem":0},"decals":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"accessory":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"cheek_3":{"defaultTexture":0,"item":-2.0,"defaultItem":0},"nose_5":{"defaultTexture":0,"item":-5.0,"defaultItem":0},"facemix":{"skinMix":0.3822884237055,"shapeMix":0.3414501727734},"jaw_bone_back_lenght":{"defaultTexture":0,"item":-2.2,"defaultItem":0},"chimp_bone_width":{"defaultTexture":0,"item":5.0,"defaultItem":0},"vest":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"bag":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_2":{"defaultTexture":0,"item":-4.1,"defaultItem":0},"cheek_1":{"defaultTexture":0,"item":5.0,"defaultItem":0},"lips_thickness":{"defaultTexture":0,"item":-4.5,"defaultItem":0},"complexion":{"defaultTexture":0,"opacity":0.65,"defaultItem":0,"texture":0,"highlight":0,"item":9},"chimp_hole":{"defaultTexture":0,"item":1.3,"defaultItem":0},"tattoos":[],"nose_1":{"defaultTexture":0,"item":0.7,"defaultItem":0},"eyebrown_high":{"defaultTexture":0,"item":-2.9,"defaultItem":0},"shoes":{"defaultTexture":0,"item":54,"defaultItem":1,"texture":0},"chimp_bone_lenght":{"defaultTexture":0,"item":-1.1,"defaultItem":0},"mask":{"defaultTexture":0,"item":52,"defaultItem":0,"texture":5},"eyebrown_forward":{"defaultTexture":0,"item":-0.4,"defaultItem":0},"nose_4":{"defaultTexture":0,"item":1.79999999999999,"defaultItem":0},"beard":{"defaultTexture":1,"opacity":0.77,"defaultItem":-1,"texture":0,"highlight":0,"item":7},"ageing":{"defaultTexture":0,"opacity":0.13,"defaultItem":-1,"texture":0,"highlight":0,"item":6},"t-shirt":{"defaultTexture":0,"item":13,"defaultItem":1,"texture":2},"pants":{"defaultTexture":0,"item":24,"defaultItem":0,"texture":0},"face2":{"defaultTexture":0,"item":38,"defaultItem":0,"texture":38},"hair":{"defaultTexture":0,"item":55,"defaultItem":0,"texture":1,"highlight":1,"style":0},"face":{"defaultTexture":0,"item":5,"defaultItem":0,"texture":5},"cheek_2":{"defaultTexture":0,"item":-2.1,"defaultItem":0},"arms":{"defaultTexture":0,"item":1,"defaultItem":0,"texture":0},"skinMom":40,"skinDad":28,"eye_opening":{"defaultTexture":0,"item":-3.9,"defaultItem":0},"sun_damage":{"defaultTexture":0,"opacity":0.7,"defaultItem":0,"texture":0,"highlight":0,"item":3}}', 1),
	(27, 'LLU56122', 'mp_m_freemode_01', '{"face":{"defaultTexture":0,"item":25,"texture":25,"defaultItem":0},"eye_color":{"defaultTexture":0,"item":1,"texture":0,"defaultItem":-1},"chimp_hole":{"defaultTexture":0,"item":-0.7,"defaultItem":0},"complexion":{"defaultItem":0,"highlight":0,"texture":0,"opacity":0.17,"item":5,"defaultTexture":0},"t-shirt":{"defaultTexture":0,"item":15,"texture":0,"defaultItem":1},"hair":{"defaultItem":0,"highlight":1,"texture":1,"style":0,"item":8,"defaultTexture":0},"nose_5":{"defaultTexture":0,"item":-2.6,"defaultItem":0},"lips_thickness":{"defaultTexture":0,"item":-1.1,"defaultItem":0},"nose_4":{"defaultTexture":0,"item":-2.9,"defaultItem":0},"eyebrown_high":{"defaultTexture":0,"item":-4.5,"defaultItem":0},"nose_3":{"defaultTexture":0,"item":-3.0,"defaultItem":0},"vest":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"nose_2":{"defaultTexture":0,"item":-0.5,"defaultItem":0},"sun_damage":{"defaultItem":0,"highlight":0,"texture":0,"opacity":0.62,"item":5,"defaultTexture":0},"pants":{"defaultTexture":0,"item":42,"texture":0,"defaultItem":0},"chimp_bone_lowering":{"defaultTexture":0,"item":-3.5,"defaultItem":0},"skinMom":26,"face2":{"defaultTexture":0,"item":33,"texture":33,"defaultItem":0},"skinDad":13,"nose_1":{"defaultTexture":0,"item":1.9,"defaultItem":0},"moles":{"defaultItem":-1,"highlight":0,"texture":0,"opacity":0.79,"item":2,"defaultTexture":0},"neck_thikness":{"defaultTexture":0,"item":4.8,"defaultItem":0},"beard":{"defaultItem":-1,"highlight":0,"texture":0,"opacity":0.27,"item":22,"defaultTexture":1},"cheek_1":{"defaultTexture":0,"item":0.7,"defaultItem":0},"decals":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"shoes":{"defaultTexture":0,"item":10,"texture":0,"defaultItem":1},"eyebrown_forward":{"defaultTexture":0,"item":-2.5,"defaultItem":0},"chimp_bone_width":{"defaultTexture":0,"item":-5.0,"defaultItem":0},"accessory":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"tattoos":[],"eye_opening":{"defaultTexture":0,"item":4.69999999999999,"defaultItem":0},"mask":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"bag":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"cheek_3":{"defaultTexture":0,"item":0.3,"defaultItem":0},"torso2":{"defaultTexture":0,"item":86,"texture":0,"defaultItem":0},"chimp_bone_lenght":{"defaultTexture":0,"item":-2.7,"defaultItem":0},"jaw_bone_width":{"defaultTexture":0,"item":-1.2,"defaultItem":0},"ageing":{"defaultItem":-1,"highlight":0,"texture":0,"opacity":0.25,"item":14,"defaultTexture":0},"eyebrows":{"defaultItem":-1,"highlight":0,"texture":0,"opacity":0.26,"item":4,"defaultTexture":1},"jaw_bone_back_lenght":{"defaultTexture":0,"item":2.2,"defaultItem":0},"cheek_2":{"defaultTexture":0,"item":-3.0,"defaultItem":0},"facemix":{"skinMix":0.33240636538419,"shapeMix":0.04504831092374},"arms":{"defaultTexture":0,"item":1,"texture":0,"defaultItem":0}}', 1),
	(96, 'QCD01130', 'mp_m_freemode_01', '{"nose_4":{"item":4.30000007152557,"defaultTexture":0,"defaultItem":0},"bodyb":{"texture":0,"defaultTexture":0,"item":255,"highlight":0,"opacity":1.0,"defaultItem":0},"nose_3":{"item":0.76858229935169,"defaultTexture":0,"defaultItem":0},"hat":{"item":143,"defaultTexture":0,"texture":0,"defaultItem":-1},"blush":{"texture":0,"defaultTexture":1,"item":255,"highlight":0,"opacity":1.0,"defaultItem":-1},"skinMom":22,"skinDad":11,"lips_thickness":{"item":-0.09999999776482,"defaultTexture":0,"defaultItem":0},"pants":{"item":20,"defaultTexture":0,"texture":2,"defaultItem":0},"chimp_bone_width":{"item":9.58128452301025,"defaultTexture":0,"defaultItem":0},"chest":{"texture":0,"defaultTexture":0,"item":255,"highlight":0,"opacity":1.0,"defaultItem":0},"complexion":{"texture":0,"defaultTexture":0,"item":5,"highlight":0,"opacity":0.72000002861022,"defaultItem":0},"tattoos":[],"torso2":{"item":71,"defaultTexture":0,"texture":0,"defaultItem":0},"chimp_hole":{"item":0.0,"defaultTexture":0,"defaultItem":0},"vest":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"cheek_3":{"item":-1.02992832660675,"defaultTexture":0,"defaultItem":0},"jaw_bone_back_lenght":{"item":4.00000005960464,"defaultTexture":0,"defaultItem":0},"hair":{"defaultTexture":0,"texture":8,"item":10,"highlight":10,"style":0,"defaultItem":0},"eyebrown_forward":{"item":-4.90000009536743,"defaultTexture":0,"defaultItem":0},"decals":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"arms":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"nose_0":{"item":0.0,"defaultTexture":0,"defaultItem":0},"nose_5":{"item":-0.7999999821186,"defaultTexture":0,"defaultItem":0},"eyebrown_high":{"item":-1.80000007152557,"defaultTexture":0,"defaultItem":0},"beard":{"texture":4,"defaultTexture":1,"item":2,"highlight":0,"opacity":0.70999997854232,"defaultItem":-1},"bag":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"nose_2":{"item":0.85007727146148,"defaultTexture":0,"defaultItem":0},"glass":{"item":37,"defaultTexture":-1,"texture":1,"defaultItem":-1},"mask":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"moles":{"texture":0,"defaultTexture":0,"item":2,"highlight":0,"opacity":0.63999998569488,"defaultItem":-1},"eye_opening":{"item":-2.56709277629852,"defaultTexture":0,"defaultItem":0},"t-shirt":{"item":15,"defaultTexture":0,"texture":0,"defaultItem":1},"chimp_bone_lenght":{"item":4.72530573606491,"defaultTexture":0,"defaultItem":0},"shoes":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":1},"jaw_bone_width":{"item":5.0,"defaultTexture":0,"defaultItem":0},"chimp_bone_lowering":{"item":6.61374151706695,"defaultTexture":0,"defaultItem":0},"ageing":{"texture":0,"defaultTexture":0,"item":0,"highlight":0,"opacity":0.43000000715255,"defaultItem":-1},"cheek_2":{"item":3.73612463474273,"defaultTexture":0,"defaultItem":0},"lipstick":{"texture":0,"defaultTexture":1,"item":255,"highlight":0,"opacity":1.0,"defaultItem":-1},"facemix":{"shapeMix":0.30098766088485,"skinMix":0.64074075222015},"neck_thikness":{"item":4.90000009536743,"defaultTexture":0,"defaultItem":0},"face2":{"item":33,"defaultTexture":0,"texture":33,"defaultItem":0},"eye_color":{"item":2,"defaultTexture":0,"texture":0,"defaultItem":-1},"accessory":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"cheek_1":{"item":6.88351809978485,"defaultTexture":0,"defaultItem":0},"watch":{"item":-1,"defaultTexture":0,"texture":-1,"defaultItem":-1},"sun_damage":{"texture":0,"defaultTexture":0,"item":0,"highlight":0,"opacity":0.25999999046325,"defaultItem":0},"nose_1":{"item":1.7493325471878,"defaultTexture":0,"defaultItem":0},"eyebrows":{"texture":4,"defaultTexture":1,"item":12,"highlight":0,"opacity":0.57584232091903,"defaultItem":-1},"makeup":{"texture":0,"defaultTexture":1,"item":255,"highlight":0,"opacity":1.0,"defaultItem":-1},"face":{"item":44,"defaultTexture":0,"texture":44,"defaultItem":0},"bracelet":{"item":-1,"defaultTexture":0,"texture":-1,"defaultItem":-1},"ear":{"item":-1,"defaultTexture":0,"texture":-1,"defaultItem":-1}}', 1),
	(97, 'BHC52575', 'mp_f_freemode_01', '{"makeup":{"defaultTexture":1,"texture":0,"item":5,"highlight":0,"opacity":0.71558660268783,"defaultItem":-1},"ageing":{"defaultTexture":0,"texture":0,"item":8,"highlight":0,"opacity":0.14000000059604,"defaultItem":-1},"nose_3":{"item":-0.59999998658895,"defaultTexture":0,"defaultItem":0},"hat":{"item":-1,"texture":-1,"defaultTexture":0,"defaultItem":-1},"blush":{"defaultTexture":1,"texture":0,"item":255,"highlight":0,"opacity":1.0,"defaultItem":-1},"ear":{"item":-1,"texture":-1,"defaultTexture":0,"defaultItem":-1},"skinDad":20,"lips_thickness":{"item":-3.3764225244522,"defaultTexture":0,"defaultItem":0},"pants":{"item":10,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_width":{"item":1.80000007152557,"defaultTexture":0,"defaultItem":0},"chest":{"defaultTexture":0,"texture":0,"item":255,"highlight":0,"opacity":1.0,"defaultItem":0},"complexion":{"defaultTexture":0,"texture":0,"item":2,"highlight":0,"opacity":0.38699874281883,"defaultItem":0},"tattoos":[],"torso2":{"item":46,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_hole":{"item":0.0,"defaultTexture":0,"defaultItem":0},"vest":{"item":100,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_3":{"item":4.00000005960464,"defaultTexture":0,"defaultItem":0},"eyebrown_forward":{"item":1.09999999403953,"defaultTexture":0,"defaultItem":0},"bodyb":{"defaultTexture":0,"texture":0,"item":255,"highlight":0,"opacity":1.0,"defaultItem":0},"sun_damage":{"defaultTexture":0,"texture":0,"item":9,"highlight":0,"opacity":0.31999999284744,"defaultItem":0},"arms":{"item":4,"texture":0,"defaultTexture":0,"defaultItem":0},"bracelet":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"nose_0":{"item":2.4771673977375,"defaultTexture":0,"defaultItem":0},"eyebrown_high":{"item":-0.50000000745058,"defaultTexture":0,"defaultItem":0},"nose_5":{"item":-3.49999994039535,"defaultTexture":0,"defaultItem":0},"beard":{"defaultTexture":1,"texture":0,"item":255,"highlight":0,"opacity":1.0,"defaultItem":-1},"bag":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"jaw_bone_back_lenght":{"item":4.30000007152557,"defaultTexture":0,"defaultItem":0},"glass":{"item":-1,"texture":-1,"defaultTexture":-1,"defaultItem":-1},"mask":{"item":22,"texture":0,"defaultTexture":0,"defaultItem":0},"moles":{"defaultTexture":0,"texture":0,"item":8,"highlight":0,"opacity":0.59094983339309,"defaultItem":-1},"eye_opening":{"item":-3.01672041416168,"defaultTexture":0,"defaultItem":0},"t-shirt":{"item":10,"texture":0,"defaultTexture":0,"defaultItem":1},"chimp_bone_lenght":{"item":-1.29999995231628,"defaultTexture":0,"defaultItem":0},"shoes":{"item":4,"texture":0,"defaultTexture":0,"defaultItem":1},"nose_4":{"item":-3.40000003576278,"defaultTexture":0,"defaultItem":0},"chimp_bone_lowering":{"item":-4.09999996423721,"defaultTexture":0,"defaultItem":0},"decals":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"neck_thikness":{"item":3.10664594173431,"defaultTexture":0,"defaultItem":0},"lipstick":{"defaultTexture":1,"texture":31,"item":1,"highlight":0,"opacity":0.45120555162429,"defaultItem":-1},"cheek_2":{"item":0.7999999821186,"defaultTexture":0,"defaultItem":0},"nose_2":{"item":2.30000004172325,"defaultTexture":0,"defaultItem":0},"facemix":{"shapeMix":0.99000000953674,"skinMix":0.7829629778862},"eye_color":{"item":1,"texture":0,"defaultTexture":0,"defaultItem":-1},"accessory":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_1":{"item":-3.89999985694885,"defaultTexture":0,"defaultItem":0},"face2":{"item":25,"texture":25,"defaultTexture":0,"defaultItem":0},"watch":{"item":-1,"texture":-1,"defaultTexture":0,"defaultItem":-1},"nose_1":{"item":0.3999999910593,"defaultTexture":0,"defaultItem":0},"eyebrows":{"defaultTexture":1,"texture":61,"item":16,"highlight":0,"opacity":0.81000840663909,"defaultItem":-1},"jaw_bone_width":{"item":-3.18814098834991,"defaultTexture":0,"defaultItem":0},"face":{"item":17,"texture":17,"defaultTexture":0,"defaultItem":0},"hair":{"defaultTexture":0,"texture":30,"item":43,"highlight":33,"style":0,"defaultItem":0},"skinMom":37}', 1),
	(137, 'JXD83837', 'mp_m_freemode_01', '{"lips_thickness":{"item":0.0,"defaultTexture":0,"defaultItem":0},"t-shirt":{"texture":0,"item":15,"defaultItem":1,"defaultTexture":0},"shoes":{"texture":7,"item":111,"defaultItem":1,"defaultTexture":0},"chimp_hole":{"item":0.0,"defaultTexture":0,"defaultItem":0},"eye_color":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"arms":{"texture":2,"item":0,"defaultItem":0,"defaultTexture":0},"face2":{"texture":21,"item":21,"defaultTexture":0,"defaultItem":0},"watch":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"nose_0":{"item":0.0,"defaultTexture":0,"defaultItem":0},"chimp_bone_lenght":{"item":0.0,"defaultTexture":0,"defaultItem":0},"nose_2":{"item":0.0,"defaultTexture":0,"defaultItem":0},"accessory":{"texture":0,"item":183,"defaultItem":0,"defaultTexture":0},"bracelet":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"nose_3":{"item":0.0,"defaultTexture":0,"defaultItem":0},"decals":{"texture":0,"item":115,"defaultItem":0,"defaultTexture":0},"jaw_bone_width":{"item":0.0,"defaultTexture":0,"defaultItem":0},"chimp_bone_lowering":{"item":0.0,"defaultTexture":0,"defaultItem":0},"bag":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"hair":{"highlight":-1,"style":2,"texture":-1,"item":132,"defaultItem":0,"defaultTexture":0},"cheek_3":{"item":0.0,"defaultTexture":0,"defaultItem":0},"pants":{"texture":12,"item":8,"defaultItem":0,"defaultTexture":0},"vest":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"facemix":{"shapeMix":0.5,"skinMix":0.5},"jaw_bone_back_lenght":{"item":0.0,"defaultTexture":0,"defaultItem":0},"cheek_1":{"item":0.0,"defaultTexture":0,"defaultItem":0},"chimp_bone_width":{"item":0.0,"defaultTexture":0,"defaultItem":0},"tattoos":[],"eyebrown_high":{"item":0.0,"defaultTexture":0,"defaultItem":0},"eyebrown_forward":{"item":0.0,"defaultTexture":0,"defaultItem":0},"nose_1":{"item":0.0,"defaultTexture":0,"defaultItem":0},"eye_opening":{"item":0.0,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":0.0,"defaultTexture":0,"defaultItem":0},"neck_thikness":{"item":0.0,"defaultTexture":0,"defaultItem":0},"cheek_2":{"item":0.0,"defaultTexture":0,"defaultItem":0},"glass":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":-1},"torso2":{"texture":0,"item":12,"defaultItem":0,"defaultTexture":0},"nose_5":{"item":0.0,"defaultTexture":0,"defaultItem":0},"face":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"ear":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"hat":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"mask":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0}}', 1),
	(143, 'RDO88579', 'mp_m_freemode_01', '{"glass":{"item":-1,"defaultItem":-1,"texture":-1,"defaultTexture":-1},"bodyb":{"item":255,"defaultItem":0,"opacity":1.0,"texture":0,"defaultTexture":0,"highlight":0},"pants":{"item":4,"defaultItem":0,"texture":0,"defaultTexture":0},"blush":{"item":255,"defaultItem":-1,"opacity":1.0,"texture":0,"defaultTexture":1,"highlight":0},"face":{"item":30,"defaultTexture":0,"texture":30,"defaultItem":0},"skinDad":0,"ear":{"item":-1,"defaultItem":-1,"texture":-1,"defaultTexture":0},"jaw_bone_width":{"item":4.19999986886978,"defaultItem":0,"defaultTexture":0},"decals":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_5":{"item":-1.1999999731779,"defaultItem":0,"defaultTexture":0},"torso2":{"item":47,"defaultItem":0,"texture":0,"defaultTexture":0},"eye_opening":{"item":4.00000005960464,"defaultItem":0,"defaultTexture":0},"moles":{"item":7,"defaultItem":-1,"opacity":0.18999999761581,"texture":0,"defaultTexture":0,"highlight":0},"tattoos":[],"cheek_3":{"item":2.30000004172325,"defaultItem":0,"defaultTexture":0},"beard":{"item":255,"defaultItem":-1,"opacity":1.0,"texture":0,"defaultTexture":1,"highlight":0},"accessory":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"vest":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"hat":{"item":-1,"defaultItem":-1,"texture":-1,"defaultTexture":0},"cheek_2":{"item":-3.40000003576278,"defaultItem":0,"defaultTexture":0},"eye_color":{"item":1,"defaultTexture":0,"texture":0,"defaultItem":-1},"nose_1":{"item":-3.00000011920928,"defaultItem":0,"defaultTexture":0},"cheek_1":{"item":3.00000011920928,"defaultItem":0,"defaultTexture":0},"eyebrown_high":{"item":3.19999992847442,"defaultItem":0,"defaultTexture":0},"hair":{"item":16,"defaultItem":0,"style":0,"texture":1,"defaultTexture":0,"highlight":1},"lipstick":{"item":255,"defaultItem":-1,"opacity":1.0,"texture":0,"defaultTexture":1,"highlight":0},"neck_thikness":{"item":0.0,"defaultItem":0,"defaultTexture":0},"jaw_bone_back_lenght":{"item":2.39999994635581,"defaultItem":0,"defaultTexture":0},"eyebrows":{"item":28,"defaultItem":-1,"opacity":0.44999998807907,"texture":0,"defaultTexture":1,"highlight":0},"sun_damage":{"item":2,"defaultItem":0,"opacity":0.23999999463558,"texture":0,"defaultTexture":0,"highlight":0},"watch":{"item":-1,"defaultItem":-1,"texture":-1,"defaultTexture":0},"chest":{"item":255,"defaultItem":0,"opacity":1.0,"texture":0,"defaultTexture":0,"highlight":0},"bracelet":{"item":-1,"defaultItem":-1,"texture":-1,"defaultTexture":0},"nose_4":{"item":-3.30000013113021,"defaultItem":0,"defaultTexture":0},"chimp_hole":{"item":0.0,"defaultItem":0,"defaultTexture":0},"chimp_bone_width":{"item":4.00000005960464,"defaultItem":0,"defaultTexture":0},"chimp_bone_lowering":{"item":-3.60000014305114,"defaultItem":0,"defaultTexture":0},"arms":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"facemix":{"skinMix":0.57349914312362,"shapeMix":0.93539875745773},"bag":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_3":{"item":-4.19999986886978,"defaultItem":0,"defaultTexture":0},"shoes":{"item":10,"defaultItem":1,"texture":0,"defaultTexture":0},"nose_2":{"item":4.19999986886978,"defaultItem":0,"defaultTexture":0},"eyebrown_forward":{"item":-4.90000009536743,"defaultItem":0,"defaultTexture":0},"face2":{"item":21,"defaultTexture":0,"texture":21,"defaultItem":0},"lips_thickness":{"item":-5.0,"defaultItem":0,"defaultTexture":0},"skinMom":0,"chimp_bone_lenght":{"item":-1.89999997615814,"defaultItem":0,"defaultTexture":0},"ageing":{"item":255,"defaultItem":-1,"opacity":0.0,"texture":0,"defaultTexture":0,"highlight":0},"makeup":{"item":255,"defaultItem":-1,"opacity":1.0,"texture":0,"defaultTexture":1,"highlight":0},"complexion":{"item":8,"defaultItem":0,"opacity":0.23000000417232,"texture":0,"defaultTexture":0,"highlight":0},"t-shirt":{"item":15,"defaultItem":1,"texture":0,"defaultTexture":0},"mask":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_0":{"item":0.0,"defaultItem":0,"defaultTexture":0}}', 1),
	(205, 'CTM94839', 'mp_m_freemode_01', '{"makeup":{"texture":0,"defaultItem":-1,"item":255,"defaultTexture":1,"opacity":1.0,"highlight":0},"glass":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":-1},"watch":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"accessory":{"texture":0,"item":13,"defaultItem":0,"defaultTexture":0},"chimp_hole":{"item":0.0,"defaultItem":0,"defaultTexture":0},"cheek_1":{"item":0.0,"defaultItem":0,"defaultTexture":0},"nose_0":{"item":0.0,"defaultItem":0,"defaultTexture":0},"cheek_2":{"item":0.0,"defaultItem":0,"defaultTexture":0},"chest":{"texture":0,"defaultItem":0,"item":255,"defaultTexture":0,"opacity":1.0,"highlight":0},"ageing":{"texture":0,"defaultItem":-1,"item":255,"defaultTexture":0,"opacity":0.0,"highlight":0},"face2":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"torso2":{"texture":0,"item":6,"defaultItem":0,"defaultTexture":0},"moles":{"texture":0,"defaultItem":-1,"item":8,"defaultTexture":0,"opacity":0.52999997138977,"highlight":0},"lipstick":{"texture":0,"defaultItem":-1,"item":255,"defaultTexture":1,"opacity":1.0,"highlight":0},"nose_2":{"item":0.0,"defaultItem":0,"defaultTexture":0},"nose_5":{"item":0.0,"defaultItem":0,"defaultTexture":0},"eyebrown_high":{"item":0.0,"defaultItem":0,"defaultTexture":0},"mask":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"decals":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"tattoos":{"ZONE_TORSO":[{"collection":"mpchristmas2_overlays","overlay":"MP_Xmas2_M_Tat_019"},{"collection":"mpheist4_overlays","overlay":"MP_Heist4_Tat_004_M"},{"collection":"mplowrider2_overlays","overlay":"MP_LR_Tat_016_M"},{"collection":"mplowrider_overlays","overlay":"MP_LR_Tat_004_M"},{"collection":"mplowrider_overlays","overlay":"MP_LR_Tat_013_M"},{"collection":"mpluxe2_overlays","overlay":"MP_LUXE_TAT_025_M"},{"collection":"mpsum2_overlays","overlay":"MP_Sum2_Tat_005_M"},{"collection":"mpsum2_overlays","overlay":"MP_Sum2_Tat_043_M"},{"collection":"mpbeach_overlays","overlay":"MP_Bea_M_Stom_000"},{"collection":"mpstunt_overlays","overlay":"MP_MP_Stunt_tat_034_M"},{"collection":"multiplayer_overlays","overlay":"FM_Tat_Award_M_005"}],"ZONE_RIGHT_ARM":[{"collection":"mpchristmas2017_overlays","overlay":"MP_Christmas2017_Tattoo_006_M"},{"collection":"mpchristmas2_overlays","overlay":"MP_Xmas2_M_Tat_008"},{"collection":"mpgunrunning_overlays","overlay":"MP_Gunrunning_Tattoo_002_M"}],"ZONE_LEFT_ARM":[{"collection":"mpgunrunning_overlays","overlay":"MP_Gunrunning_Tattoo_004_M"},{"collection":"mphipster_overlays","overlay":"FM_Hip_M_Tat_016"},{"collection":"mpsmuggler_overlays","overlay":"MP_Smuggler_Tattoo_014_M"},{"collection":"mpstunt_overlays","overlay":"MP_MP_Stunt_tat_002_M"}],"ZONE_LEFT_LEG":[{"collection":"mpstunt_overlays","overlay":"MP_MP_Stunt_tat_021_M"}],"ZONE_RIGHT_LEG":[{"collection":"mpluxe2_overlays","overlay":"MP_LUXE_TAT_023_M"},{"collection":"mpsum2_overlays","overlay":"MP_Sum2_Tat_017_M"},{"collection":"mpgunrunning_overlays","overlay":"MP_Gunrunning_Tattoo_030_M"}],"ZONE_HEAD":[{"collection":"mpbeach_overlays","overlay":"MP_Bea_M_Neck_001"},{"collection":"mpbiker_overlays","overlay":"MP_MP_Biker_Tat_038_M"},{"collection":"mpbusiness_overlays","overlay":"MP_Buis_M_Neck_000"},{"collection":"mpheist3_overlays","overlay":"mpHeist3_Tat_005_M"},{"collection":"mpheist3_overlays","overlay":"mpHeist3_Tat_008_M"},{"collection":"mpheist3_overlays","overlay":"mpHeist3_Tat_010_M"},{"collection":"mpheist3_overlays","overlay":"mpHeist3_Tat_021_M"},{"collection":"mpheist3_overlays","overlay":"mpHeist3_Tat_022_M"},{"collection":"mpsum2_overlays","overlay":"MP_Sum2_Tat_022_M"},{"collection":"mpsum2_overlays","overlay":"MP_Sum2_Tat_023_M"}]},"nose_1":{"item":0.0,"defaultItem":0,"defaultTexture":0},"hair":{"texture":13,"style":0,"item":19,"defaultTexture":0,"defaultItem":0,"highlight":3},"nose_4":{"item":0.0,"defaultItem":0,"defaultTexture":0},"sun_damage":{"texture":0,"defaultItem":0,"item":9,"defaultTexture":0,"opacity":0.49000000953674,"highlight":0},"shoes":{"texture":2,"item":107,"defaultItem":1,"defaultTexture":0},"ear":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"bracelet":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"arms":{"texture":0,"item":33,"defaultItem":0,"defaultTexture":0},"chimp_bone_lenght":{"item":0.0,"defaultItem":0,"defaultTexture":0},"t-shirt":{"texture":0,"item":15,"defaultItem":1,"defaultTexture":0},"chimp_bone_width":{"item":0.0,"defaultItem":0,"defaultTexture":0},"vest":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"beard":{"texture":3,"defaultItem":-1,"item":10,"defaultTexture":1,"opacity":0.99000000953674,"highlight":0},"eyebrown_forward":{"item":0.0,"defaultItem":0,"defaultTexture":0},"cheek_3":{"item":0.0,"defaultItem":0,"defaultTexture":0},"hat":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"nose_3":{"item":0.0,"defaultItem":0,"defaultTexture":0},"facemix":{"shapeMix":0.0,"skinMix":0.5543029308319},"bag":{"texture":0,"item":140,"defaultItem":0,"defaultTexture":0},"face":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"eye_color":{"texture":0,"item":1,"defaultItem":-1,"defaultTexture":0},"jaw_bone_width":{"item":0.0,"defaultItem":0,"defaultTexture":0},"lips_thickness":{"item":0.0,"defaultItem":0,"defaultTexture":0},"skinDad":36,"eyebrows":{"texture":0,"defaultItem":-1,"item":15,"defaultTexture":1,"opacity":0.58999997377395,"highlight":0},"eye_opening":{"item":0.0,"defaultItem":0,"defaultTexture":0},"complexion":{"texture":0,"defaultItem":0,"item":2,"defaultTexture":0,"opacity":0.62000000476837,"highlight":0},"pants":{"texture":0,"item":11,"defaultItem":0,"defaultTexture":0},"chimp_bone_lowering":{"item":0.0,"defaultItem":0,"defaultTexture":0},"bodyb":{"texture":0,"defaultItem":0,"item":255,"defaultTexture":0,"opacity":1.0,"highlight":0},"blush":{"texture":0,"defaultItem":-1,"item":255,"defaultTexture":1,"opacity":1.0,"highlight":0},"jaw_bone_back_lenght":{"item":0.0,"defaultItem":0,"defaultTexture":0},"skinMom":37,"neck_thikness":{"item":0.0,"defaultItem":0,"defaultTexture":0}}', 1),
	(215, 'QNC46912', 'mp_m_freemode_01', '{"eye_opening":{"item":10.0,"defaultTexture":0,"defaultItem":0},"glass":{"texture":0,"defaultItem":-1,"defaultTexture":-1,"item":12},"cheek_3":{"item":10.0,"defaultTexture":0,"defaultItem":0},"mask":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"arms":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":1},"cheek_1":{"item":-10.0,"defaultTexture":0,"defaultItem":0},"cheek_2":{"item":4.63538020849227,"defaultTexture":0,"defaultItem":0},"eye_color":{"texture":0,"defaultItem":-1,"defaultTexture":0,"item":17},"tattoos":[],"chimp_bone_width":{"item":4.36560362577438,"defaultTexture":0,"defaultItem":0},"lipstick":{"defaultItem":-1,"defaultTexture":1,"highlight":0,"texture":0,"opacity":1.0,"item":255},"vest":{"texture":1,"defaultItem":0,"defaultTexture":0,"item":1},"sun_damage":{"defaultItem":0,"defaultTexture":0,"highlight":0,"texture":0,"opacity":0.62999999523162,"item":3},"skinMom":11,"eyebrows":{"defaultItem":-1,"defaultTexture":1,"highlight":0,"texture":0,"opacity":0.99000000953674,"item":12},"jaw_bone_back_lenght":{"item":2.29731634259223,"defaultTexture":0,"defaultItem":0},"watch":{"texture":-1,"defaultItem":-1,"defaultTexture":0,"item":-1},"blush":{"defaultItem":-1,"defaultTexture":1,"highlight":0,"texture":0,"opacity":1.0,"item":255},"beard":{"defaultItem":-1,"defaultTexture":1,"highlight":0,"texture":61,"opacity":0.99000000953674,"item":10},"shoes":{"texture":0,"defaultItem":1,"defaultTexture":0,"item":119},"eyebrown_high":{"item":9.85106110572815,"defaultTexture":0,"defaultItem":0},"hair":{"defaultItem":0,"defaultTexture":0,"highlight":26,"texture":61,"item":152,"style":0},"nose_5":{"item":-4.17732179164886,"defaultTexture":0,"defaultItem":0},"chest":{"defaultItem":0,"defaultTexture":0,"highlight":0,"texture":0,"opacity":1.0,"item":255},"nose_0":{"item":8.68202865123748,"defaultTexture":0,"defaultItem":0},"bodyb":{"defaultItem":0,"defaultTexture":0,"highlight":0,"texture":0,"opacity":1.0,"item":255},"ear":{"texture":-1,"defaultItem":-1,"defaultTexture":0,"item":-1},"lips_thickness":{"item":1.09999999403953,"defaultTexture":0,"defaultItem":0},"t-shirt":{"texture":0,"defaultItem":1,"defaultTexture":0,"item":241},"face":{"texture":5,"defaultItem":0,"defaultTexture":0,"item":5},"nose_1":{"item":-5.80441176891326,"defaultTexture":0,"defaultItem":0},"nose_3":{"item":4.9950823187828,"defaultTexture":0,"defaultItem":0},"chimp_bone_lowering":{"item":2.74694383144378,"defaultTexture":0,"defaultItem":0},"decals":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"makeup":{"defaultItem":-1,"defaultTexture":1,"highlight":0,"texture":0,"opacity":1.0,"item":255},"accessory":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"hat":{"texture":-1,"defaultItem":-1,"defaultTexture":0,"item":-1},"chimp_bone_lenght":{"item":-4.49999988079071,"defaultTexture":0,"defaultItem":0},"pants":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":244},"bag":{"texture":0,"defaultItem":0,"defaultTexture":0,"item":0},"eyebrown_forward":{"item":-10.0,"defaultTexture":0,"defaultItem":0},"torso2":{"texture":2,"defaultItem":0,"defaultTexture":0,"item":311},"moles":{"defaultItem":-1,"defaultTexture":0,"highlight":0,"texture":0,"opacity":0.63999998569488,"item":8},"chimp_hole":{"item":0.0,"defaultTexture":0,"defaultItem":0},"face2":{"texture":26,"defaultItem":0,"defaultTexture":0,"item":26},"nose_4":{"item":0.58030068874359,"defaultTexture":0,"defaultItem":0},"nose_2":{"item":7.14486420154571,"defaultTexture":0,"defaultItem":0},"jaw_bone_width":{"item":4.9950823187828,"defaultTexture":0,"defaultItem":0},"ageing":{"defaultItem":-1,"defaultTexture":0,"highlight":0,"texture":0,"opacity":0.34999999403953,"item":7},"neck_thikness":{"item":10.0,"defaultTexture":0,"defaultItem":0},"complexion":{"defaultItem":0,"defaultTexture":0,"highlight":0,"texture":0,"opacity":0.63999998569488,"item":10},"facemix":{"skinMix":0.99000000953674,"shapeMix":0.57753086090087},"skinDad":19,"bracelet":{"texture":-1,"defaultItem":-1,"defaultTexture":0,"item":-1}}', 1),
	(219, 'AIM07751', 'mp_m_freemode_01', '{"lipstick":{"highlight":0,"defaultTexture":1,"opacity":0.15000000596046,"item":255,"defaultItem":-1,"texture":0},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0.0},"ageing":{"highlight":0,"defaultTexture":0,"opacity":0.99000000953674,"item":14,"defaultItem":-1,"texture":0},"watch":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":6.97344362735748},"skinDad":6,"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":3.30000013113021},"eye_color":{"item":11,"defaultTexture":0,"defaultItem":-1,"texture":0},"hair":{"highlight":29,"defaultTexture":0,"style":0,"item":91,"defaultItem":0,"texture":28},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":1.89999997615814},"t-shirt":{"item":166,"defaultTexture":0,"defaultItem":1,"texture":12},"hat":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":-10.0},"bag":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"bracelet":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":2.19999998807907},"bodyb":{"highlight":0,"defaultTexture":0,"opacity":1.0,"item":255,"defaultItem":0,"texture":0},"face":{"item":13,"defaultTexture":0,"defaultItem":0,"texture":13},"blush":{"highlight":0,"defaultTexture":1,"opacity":1.0,"item":255,"defaultItem":-1,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":-2.00000002980232},"sun_damage":{"highlight":0,"defaultTexture":0,"opacity":1.0,"item":255,"defaultItem":0,"texture":0},"torso2":{"item":423,"defaultTexture":0,"defaultItem":0,"texture":7},"tattoos":[],"nose_4":{"defaultTexture":0,"defaultItem":0,"item":-0.90000003576278},"beard":{"highlight":0,"defaultTexture":1,"opacity":0.75,"item":255,"defaultItem":-1,"texture":0},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":-0.19999999552965},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":-3.40000003576278},"complexion":{"highlight":0,"defaultTexture":0,"opacity":0.75,"item":255,"defaultItem":0,"texture":0},"chest":{"highlight":0,"defaultTexture":0,"opacity":1.0,"item":255,"defaultItem":0,"texture":0},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":9.58128452301025},"accessory":{"item":8,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":1.89999997615814},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":0.67022621631622},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":-6.06575787067413},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":7.15329468250274},"mask":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrows":{"highlight":0,"defaultTexture":1,"opacity":0.6249417066574,"item":17,"defaultItem":-1,"texture":1},"arms":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":0.94843335449695},"pants":{"item":153,"defaultTexture":0,"defaultItem":0,"texture":0},"skinMom":0,"moles":{"highlight":0,"defaultTexture":0,"opacity":0.33000001311302,"item":4,"defaultItem":-1,"texture":0},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":-2.82843887805938},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":2.38724187016487},"face2":{"item":28,"defaultTexture":0,"defaultItem":0,"texture":28},"shoes":{"item":119,"defaultTexture":0,"defaultItem":1,"texture":0},"ear":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"vest":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":2.00000002980232},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":-5.88590681552887},"decals":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"glass":{"item":5,"defaultTexture":-1,"defaultItem":-1,"texture":0},"makeup":{"highlight":0,"defaultTexture":1,"opacity":1.0,"item":255,"defaultItem":-1,"texture":0},"facemix":{"skinMix":0.15000000596046,"shapeMix":0.59333330392837}}', 1),
	(224, 'LPI62642', 'mp_m_freemode_01', '{"arms":{"item":24,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0.0},"ageing":{"highlight":0,"defaultTexture":0,"opacity":0.56999999284744,"item":255,"defaultItem":-1,"texture":0},"watch":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":4.79999989271163},"skinDad":10,"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":4.79999989271163},"eye_color":{"item":11,"defaultTexture":0,"defaultItem":-1,"texture":0},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":2.30000004172325},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":-4.19999986886978},"t-shirt":{"item":243,"defaultTexture":0,"defaultItem":1,"texture":4},"hat":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"vest":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"bag":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"skinMom":21,"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":0.0},"bodyb":{"highlight":0,"defaultTexture":0,"opacity":1.0,"item":255,"defaultItem":0,"texture":0},"face":{"item":7,"defaultTexture":0,"defaultItem":0,"texture":7},"blush":{"highlight":0,"defaultTexture":1,"opacity":1.0,"item":255,"defaultItem":-1,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":3.89999985694885},"complexion":{"highlight":0,"defaultTexture":0,"opacity":0.23000000417232,"item":255,"defaultItem":0,"texture":0},"lipstick":{"highlight":0,"defaultTexture":1,"opacity":1.0,"item":255,"defaultItem":-1,"texture":0},"tattoos":[],"nose_4":{"defaultTexture":0,"defaultItem":0,"item":0.7999999821186},"ear":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"moles":{"highlight":0,"defaultTexture":0,"opacity":0.25999999046325,"item":255,"defaultItem":-1,"texture":0},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":3.30000013113021},"glass":{"item":8,"defaultTexture":-1,"defaultItem":-1,"texture":2},"chest":{"highlight":0,"defaultTexture":0,"opacity":1.0,"item":255,"defaultItem":0,"texture":0},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":4.09999996423721},"accessory":{"item":13,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":-3.19999992847442},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":0.85201792418956},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":-1.80000007152557},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":-2.00000002980232},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":2.00000002980232},"eyebrows":{"highlight":0,"defaultTexture":1,"opacity":1.0,"item":12,"defaultItem":-1,"texture":3},"mask":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":-0.31390134245157},"pants":{"item":330,"defaultTexture":0,"defaultItem":0,"texture":0},"hair":{"highlight":1,"defaultTexture":0,"style":1,"item":1,"defaultItem":0,"texture":3},"beard":{"highlight":0,"defaultTexture":1,"opacity":0.99000000953674,"item":16,"defaultItem":-1,"texture":3},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":1.00000001490116},"torso2":{"item":198,"defaultTexture":0,"defaultItem":0,"texture":0},"face2":{"item":21,"defaultTexture":0,"defaultItem":0,"texture":21},"shoes":{"item":250,"defaultTexture":0,"defaultItem":1,"texture":1},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":-3.27354252338409},"bracelet":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"sun_damage":{"highlight":0,"defaultTexture":0,"opacity":0.51999998092651,"item":255,"defaultItem":0,"texture":0},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":1.70000001788139},"decals":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":1.30044847726821},"makeup":{"highlight":0,"defaultTexture":1,"opacity":1.0,"item":255,"defaultItem":-1,"texture":0},"facemix":{"skinMix":0.58380281925201,"shapeMix":0.42605632543563}}', 1),
	(226, 'JVH49125', 'mp_f_freemode_01', '{"lipstick":{"highlight":0,"defaultTexture":1,"opacity":0.4474287033081,"texture":53,"defaultItem":-1,"item":5},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0.0},"ageing":{"highlight":0,"defaultTexture":0,"opacity":0.15000000596046,"texture":0,"defaultItem":-1,"item":255},"watch":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":0.0},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":0.0},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0.0},"eye_color":{"item":-2,"defaultTexture":0,"defaultItem":-1,"texture":0},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":0.0},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":0.0},"t-shirt":{"item":36,"defaultTexture":0,"defaultItem":1,"texture":0},"hat":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"eyebrows":{"highlight":0,"defaultTexture":1,"opacity":0.51541239023208,"texture":3,"defaultItem":-1,"item":12},"bag":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"bracelet":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":0.0},"bodyb":{"highlight":0,"defaultTexture":0,"opacity":1.0,"texture":0,"defaultItem":0,"item":255},"face":{"item":21,"defaultTexture":0,"defaultItem":0,"texture":21},"blush":{"highlight":0,"defaultTexture":1,"opacity":0.31146129965782,"texture":35,"defaultItem":-1,"item":1},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":0.0},"sun_damage":{"highlight":0,"defaultTexture":0,"opacity":0.31999999284744,"texture":0,"defaultItem":0,"item":7},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":0.0},"tattoos":{"ZONE_RIGHT_ARM":[{"collection":"mpchristmas2017_overlays","overlay":"MP_Christmas2017_Tattoo_017_M"},{"collection":"mpchristmas2017_overlays","overlay":"MP_Christmas2017_Tattoo_006_M"}],"ZONE_LEFT_ARM":[{"collection":"mplowrider2_overlays","overlay":"MP_LR_Tat_018_M"}]},"glass":{"item":-1,"defaultTexture":-1,"defaultItem":-1,"texture":-1},"ear":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"moles":{"highlight":0,"defaultTexture":0,"opacity":0.0,"texture":0,"defaultItem":-1,"item":255},"mask":{"item":179,"defaultTexture":0,"defaultItem":0,"texture":3},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":0.0},"chest":{"highlight":0,"defaultTexture":0,"opacity":1.0,"texture":0,"defaultItem":0,"item":255},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":0.0},"accessory":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":2},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":0.0},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":0.0},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":0.0},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":0.0},"complexion":{"highlight":0,"defaultTexture":0,"opacity":0.0,"texture":0,"defaultItem":0,"item":255},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":0.0},"arms":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":0.0},"pants":{"item":6,"defaultTexture":0,"defaultItem":0,"texture":0},"hair":{"highlight":61,"defaultTexture":0,"style":0,"texture":61,"defaultItem":0,"item":4},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":0.0},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0.0},"torso2":{"item":262,"defaultTexture":0,"defaultItem":0,"texture":0},"face2":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"shoes":{"item":13,"defaultTexture":0,"defaultItem":1,"texture":0},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":0.0},"beard":{"highlight":0,"defaultTexture":1,"opacity":1.0,"texture":0,"defaultItem":-1,"item":255},"skinDad":41,"skinMom":32,"decals":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"vest":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"makeup":{"highlight":61,"defaultTexture":1,"opacity":0.50030487775802,"texture":61,"defaultItem":-1,"item":5},"facemix":{"skinMix":0.53961312770843,"shapeMix":0.0}}', 1),
	(227, 'ENW45444', 'mp_m_freemode_01', '{"skinDad":6,"tattoos":[],"arms":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"cheek_1":{"item":-1.56948152311367,"defaultItem":0,"defaultTexture":0},"t-shirt":{"item":15,"texture":0,"defaultItem":1,"defaultTexture":0},"cheek_2":{"item":-0.31052409723198,"defaultItem":0,"defaultTexture":0},"hair":{"highlight":27,"item":150,"defaultItem":0,"texture":7,"style":0,"defaultTexture":0},"shoes":{"item":253,"texture":8,"defaultItem":1,"defaultTexture":0},"lips_thickness":{"item":1.3,"defaultItem":0,"defaultTexture":0},"chest":{"highlight":0,"opacity":0.81378530279612,"defaultItem":0,"texture":5,"item":3,"defaultTexture":0},"nose_4":{"item":-0.40888014612898,"defaultItem":0,"defaultTexture":0},"eyebrows":{"highlight":0,"opacity":0.54562737108332,"defaultItem":-1,"texture":5,"item":9,"defaultTexture":1},"chimp_hole":{"item":3.5,"defaultItem":0,"defaultTexture":0},"facemix":{"shapeMix":0.80356060304655,"skinMix":0.18305683706008},"nose_5":{"item":0.0491780244485,"defaultItem":0,"defaultTexture":0},"jaw_bone_width":{"item":3.55627371083321,"defaultItem":0,"defaultTexture":0},"ageing":{"highlight":0,"opacity":0.14,"defaultItem":-1,"texture":0,"item":11,"defaultTexture":0},"eyebrown_high":{"item":-0.3,"defaultItem":0,"defaultTexture":0},"bag":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"moles":{"highlight":0,"opacity":0.37,"defaultItem":-1,"texture":0,"item":16,"defaultTexture":0},"nose_2":{"item":4.89672614865814,"defaultItem":0,"defaultTexture":0},"face":{"item":44,"texture":44,"defaultItem":0,"defaultTexture":0},"chimp_bone_width":{"item":1.12828438948995,"defaultItem":0,"defaultTexture":0},"chimp_bone_lenght":{"item":2.83686946747224,"defaultItem":0,"defaultTexture":0},"skinMom":29,"eye_opening":{"item":0.1,"defaultItem":0,"defaultTexture":0},"eyebrown_forward":{"item":3.1,"defaultItem":0,"defaultTexture":0},"nose_1":{"item":1.92918364479415,"defaultItem":0,"defaultTexture":0},"watch":{"item":25,"texture":0,"defaultItem":-1,"defaultTexture":0},"sun_damage":{"highlight":0,"opacity":0.79,"defaultItem":0,"texture":0,"item":7,"defaultTexture":0},"face2":{"item":40,"texture":40,"defaultItem":0,"defaultTexture":0},"vest":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"eye_color":{"item":4,"texture":0,"defaultItem":-1,"defaultTexture":0},"nose_0":{"item":0.58873120696922,"defaultItem":0,"defaultTexture":0},"complexion":{"highlight":0,"opacity":0.47,"defaultItem":0,"texture":0,"item":1,"defaultTexture":0},"mask":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"cheek_3":{"item":2.56709287621188,"defaultItem":0,"defaultTexture":0},"nose_3":{"item":4.18575242377406,"defaultItem":0,"defaultTexture":0},"chimp_bone_lowering":{"item":1.7577631024308,"defaultItem":0,"defaultTexture":0},"neck_thikness":{"item":9.67120977940143,"defaultItem":0,"defaultTexture":0},"pants":{"item":297,"texture":0,"defaultItem":0,"defaultTexture":0},"accessory":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"glass":{"item":23,"texture":3,"defaultItem":-1,"defaultTexture":-1},"bracelet":{"item":16,"texture":0,"defaultItem":-1,"defaultTexture":0},"torso2":{"item":488,"texture":3,"defaultItem":0,"defaultTexture":0},"jaw_bone_back_lenght":{"item":-0.22059856681185,"defaultItem":0,"defaultTexture":0},"beard":{"highlight":0,"opacity":0.9044302374596,"defaultItem":-1,"texture":6,"item":17,"defaultTexture":1},"decals":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0}}', 1),
	(230, 'AXW11242', 'mp_m_freemode_01', '{"makeup":{"item":255,"defaultTexture":1,"defaultItem":-1,"texture":0,"highlight":0,"opacity":1.0},"accessory":{"item":13,"texture":0,"defaultItem":0,"defaultTexture":0},"skinDad":9,"bag":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"eye_color":{"item":1,"defaultTexture":0,"defaultItem":-1,"texture":0},"ear":{"item":-1,"texture":-1,"defaultItem":-1,"defaultTexture":0},"face2":{"item":29,"defaultTexture":0,"defaultItem":0,"texture":29},"lips_thickness":{"item":-4.39999997615814,"defaultTexture":0,"defaultItem":0},"jaw_bone_back_lenght":{"item":1.09999999403953,"defaultTexture":0,"defaultItem":0},"complexion":{"item":2,"defaultTexture":0,"defaultItem":0,"texture":0,"highlight":0,"opacity":0.50999999046325},"lipstick":{"item":255,"defaultTexture":1,"defaultItem":-1,"texture":0,"highlight":0,"opacity":1.0},"chimp_bone_width":{"item":-2.19999998807907,"defaultTexture":0,"defaultItem":0},"hair":{"item":29,"defaultTexture":0,"defaultItem":0,"texture":1,"highlight":1,"style":0},"eyebrown_high":{"item":-0.09999999776482,"defaultTexture":0,"defaultItem":0},"vest":{"item":5,"texture":0,"defaultItem":0,"defaultTexture":0},"skinMom":32,"facemix":{"shapeMix":0.8292121887207,"skinMix":0.37415274977684},"watch":{"item":-1,"texture":-1,"defaultItem":-1,"defaultTexture":0},"chimp_bone_lowering":{"item":2.89999991655349,"defaultTexture":0,"defaultItem":0},"eye_opening":{"item":-4.09999996423721,"defaultTexture":0,"defaultItem":0},"bodyb":{"item":255,"defaultTexture":0,"defaultItem":0,"texture":0,"highlight":0,"opacity":1.0},"nose_2":{"item":4.79999989271163,"defaultTexture":0,"defaultItem":0},"t-shirt":{"item":15,"texture":0,"defaultItem":1,"defaultTexture":0},"face":{"item":31,"defaultTexture":0,"defaultItem":0,"texture":31},"pants":{"item":22,"texture":1,"defaultItem":0,"defaultTexture":0},"nose_0":{"item":0.0,"defaultTexture":0,"defaultItem":0},"tattoos":[],"eyebrows":{"item":255,"defaultTexture":1,"defaultItem":-1,"texture":0,"highlight":0,"opacity":0.0},"chimp_bone_lenght":{"item":-4.39999997615814,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":0.70000000298023,"defaultTexture":0,"defaultItem":0},"decals":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"sun_damage":{"item":8,"defaultTexture":0,"defaultItem":0,"texture":0,"highlight":0,"opacity":0.14000000059604},"chimp_hole":{"item":0.19999999552965,"defaultTexture":0,"defaultItem":0},"moles":{"item":13,"defaultTexture":0,"defaultItem":-1,"texture":0,"highlight":0,"opacity":0.77999997138977},"cheek_2":{"item":1.29999995231628,"defaultTexture":0,"defaultItem":0},"arms":{"item":2,"texture":0,"defaultItem":0,"defaultTexture":0},"jaw_bone_width":{"item":0.3999999910593,"defaultTexture":0,"defaultItem":0},"bracelet":{"item":-1,"texture":-1,"defaultItem":-1,"defaultTexture":0},"torso2":{"item":143,"texture":0,"defaultItem":0,"defaultTexture":0},"nose_5":{"item":2.70000010728836,"defaultTexture":0,"defaultItem":0},"hat":{"item":-1,"texture":-1,"defaultItem":-1,"defaultTexture":0},"shoes":{"item":32,"texture":0,"defaultItem":1,"defaultTexture":0},"glass":{"item":-1,"texture":-1,"defaultItem":-1,"defaultTexture":-1},"mask":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"eyebrown_forward":{"item":1.09999999403953,"defaultTexture":0,"defaultItem":0},"chest":{"item":255,"defaultTexture":0,"defaultItem":0,"texture":0,"highlight":0,"opacity":1.0},"ageing":{"item":10,"defaultTexture":0,"defaultItem":-1,"texture":0,"highlight":0,"opacity":0.12999999523162},"beard":{"item":255,"defaultTexture":1,"defaultItem":-1,"texture":0,"highlight":0,"opacity":1.0},"nose_3":{"item":5.0,"defaultTexture":0,"defaultItem":0},"neck_thikness":{"item":2.30000004172325,"defaultTexture":0,"defaultItem":0},"nose_1":{"item":-3.60000014305114,"defaultTexture":0,"defaultItem":0},"cheek_1":{"item":-2.09999993443489,"defaultTexture":0,"defaultItem":0},"blush":{"item":255,"defaultTexture":1,"defaultItem":-1,"texture":0,"highlight":0,"opacity":1.0},"cheek_3":{"item":4.19999986886978,"defaultTexture":0,"defaultItem":0}}', 1),
	(231, 'GYH61824', 'mp_f_freemode_01', '{"accessory":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"tattoos":[],"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":-6.88351809978485},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":-2.09999993443489},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":-4.09999996423721},"shoes":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":27},"glass":{"texture":-1,"defaultTexture":-1,"defaultItem":-1,"item":-1},"sun_damage":{"opacity":0.63999998569488,"defaultTexture":0,"highlight":0,"defaultItem":0,"texture":0,"item":-1},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":-0.04917802289128},"bodyb":{"opacity":1.0,"defaultTexture":0,"highlight":0,"defaultItem":0,"texture":0,"item":255},"bracelet":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":1.29999995231628},"t-shirt":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":15},"watch":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"vest":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"lipstick":{"opacity":0.49275115132331,"defaultTexture":1,"highlight":0,"defaultItem":-1,"texture":53,"item":3},"beard":{"opacity":1.0,"defaultTexture":1,"highlight":0,"defaultItem":-1,"texture":0,"item":255},"ageing":{"opacity":0.0,"defaultTexture":0,"highlight":0,"defaultItem":-1,"texture":0,"item":255},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":-4.90515679121017},"torso2":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"complexion":{"opacity":0.15000000596046,"defaultTexture":0,"highlight":0,"defaultItem":0,"texture":0,"item":-1},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":-3.10000002384185},"eyebrows":{"opacity":0.53429675102233,"defaultTexture":1,"highlight":0,"defaultItem":-1,"texture":3,"item":1},"mask":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":-0.31052410602569},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":-5.0},"facemix":{"shapeMix":0.90543210506439,"skinMix":0.99000000953674},"chest":{"opacity":1.0,"defaultTexture":0,"highlight":0,"defaultItem":0,"texture":0,"item":255},"decals":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"blush":{"opacity":0.35300689935684,"defaultTexture":1,"highlight":0,"defaultItem":-1,"texture":53,"item":1},"eye_color":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":3},"arms":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":-5.0},"pants":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":31},"moles":{"opacity":0.44999998807907,"defaultTexture":0,"highlight":0,"defaultItem":-1,"texture":0,"item":13},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":-4.69999998807907},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":4.00000005960464},"skinMom":29,"bag":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":-2.39999994635581},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":2.59999990463256},"makeup":{"opacity":0.79867781368554,"defaultTexture":1,"highlight":61,"defaultItem":-1,"texture":36,"item":1},"ear":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"hat":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":-0.59999998658895},"face":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"face2":{"texture":21,"defaultTexture":0,"defaultItem":0,"item":21},"skinDad":39,"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":0.90000003576278},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":2.65701830387115},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":-4.19999986886978},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":-4.09999996423721},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":-0.04074750468134},"hair":{"style":0,"defaultTexture":0,"highlight":36,"texture":37,"defaultItem":0,"item":2}}', 1),
	(232, 'LOO91104', 'mp_m_freemode_01', '{"accessory":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"hat":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":-3.30000013113021},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":-1.92918364479415},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":8.95180553604046},"shoes":{"texture":1,"defaultTexture":0,"defaultItem":1,"item":150},"glass":{"texture":0,"defaultTexture":-1,"defaultItem":-1,"item":60},"sun_damage":{"opacity":0.18000000715255,"defaultItem":0,"highlight":0,"defaultTexture":0,"texture":0,"item":1},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":3.90754520893096},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":7.96262443065643},"bracelet":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"arms":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":11},"t-shirt":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":15},"eye_color":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":4},"ageing":{"opacity":0.46000000834465,"defaultItem":-1,"highlight":0,"defaultTexture":0,"texture":0,"item":13},"moles":{"opacity":0.43999999761581,"defaultItem":-1,"highlight":0,"defaultTexture":0,"texture":0,"item":8},"ear":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"vest":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":-0.09999999776482},"makeup":{"opacity":1.0,"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":0,"item":255},"complexion":{"opacity":0.11999999731779,"defaultItem":0,"highlight":0,"defaultTexture":0,"texture":0,"item":9},"eyebrows":{"opacity":0.80000001192092,"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":26,"item":5},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":-1.03835888206958},"tattoos":[],"lipstick":{"opacity":1.0,"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":0,"item":255},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":1.12828440964221},"blush":{"opacity":1.0,"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":0,"item":255},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":1.03835888206958},"decals":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":-0.22059855982661},"face2":{"texture":22,"defaultTexture":0,"defaultItem":0,"item":22},"facemix":{"skinMix":0.39580246806144,"shapeMix":0.99000000953674},"hair":{"defaultItem":0,"item":182,"highlight":27,"style":0,"texture":2,"defaultTexture":0},"chest":{"opacity":1.0,"defaultItem":0,"highlight":0,"defaultTexture":0,"texture":0,"item":255},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":0.31895462423563},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":4.81523126363754},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":-4.69999998807907},"beard":{"opacity":0.99,"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":2,"item":2},"bag":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":7.87269917099901},"watch":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"skinMom":0,"torso2":{"texture":1,"defaultTexture":0,"defaultItem":0,"item":206},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":8.68202865123748},"pants":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":164},"face":{"texture":14,"defaultTexture":0,"defaultItem":0,"item":14},"bodyb":{"opacity":1.0,"defaultItem":0,"highlight":0,"defaultTexture":0,"texture":0,"item":255},"skinDad":19,"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":10.0},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":10.0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":1.57791197299957},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":-4.54545454545454},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":-3.79999995231628},"mask":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0}}', 1),
	(233, 'OUV63962', 'mp_m_freemode_01', '{"lips_thickness":{"item":0.0,"defaultTexture":0,"defaultItem":0},"lipstick":{"texture":0,"defaultItem":-1,"opacity":1.0,"item":255,"highlight":0,"defaultTexture":1},"neck_thikness":{"item":0.0,"defaultTexture":0,"defaultItem":0},"eyebrows":{"texture":0,"defaultItem":-1,"opacity":1.0,"item":12,"highlight":0,"defaultTexture":1},"chimp_bone_lenght":{"item":0.0,"defaultTexture":0,"defaultItem":0},"vest":{"item":5,"defaultTexture":0,"defaultItem":0,"texture":0},"beard":{"texture":3,"defaultItem":-1,"opacity":1.0,"item":7,"highlight":0,"defaultTexture":1},"nose_4":{"item":0.0,"defaultTexture":0,"defaultItem":0},"blush":{"texture":0,"defaultItem":-1,"opacity":1.0,"item":255,"highlight":0,"defaultTexture":1},"eye_color":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"glass":{"item":3,"defaultTexture":-1,"defaultItem":-1,"texture":0},"chimp_bone_width":{"item":0.0,"defaultTexture":0,"defaultItem":0},"hair":{"texture":3,"style":0,"defaultItem":0,"item":1,"highlight":255,"defaultTexture":0},"skinMom":21,"nose_5":{"item":0.0,"defaultTexture":0,"defaultItem":0},"nose_1":{"item":0.0,"defaultTexture":0,"defaultItem":0},"jaw_bone_back_lenght":{"item":0.0,"defaultTexture":0,"defaultItem":0},"face":{"item":7,"defaultTexture":0,"defaultItem":0,"texture":7},"facemix":{"skinMix":0.5,"shapeMix":0.5},"complexion":{"texture":0,"defaultItem":0,"opacity":1.0,"item":255,"highlight":0,"defaultTexture":0},"ageing":{"texture":0,"defaultItem":-1,"opacity":1.0,"item":255,"highlight":0,"defaultTexture":0},"moles":{"texture":0,"defaultItem":-1,"opacity":1.0,"item":255,"highlight":0,"defaultTexture":0},"tattoos":[],"cheek_3":{"item":0.0,"defaultTexture":0,"defaultItem":0},"nose_0":{"item":0.0,"defaultTexture":0,"defaultItem":0},"skinDad":10,"t-shirt":{"item":15,"defaultTexture":0,"defaultItem":1,"texture":0},"torso2":{"item":143,"defaultTexture":0,"defaultItem":0,"texture":0},"pants":{"item":330,"defaultTexture":0,"defaultItem":0,"texture":0},"bodyb":{"texture":0,"defaultItem":0,"opacity":1.0,"item":255,"highlight":0,"defaultTexture":0},"chimp_bone_lowering":{"item":0.0,"defaultTexture":0,"defaultItem":0},"accessory":{"item":13,"defaultTexture":0,"defaultItem":0,"texture":0},"watch":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"eyebrown_high":{"item":0.0,"defaultTexture":0,"defaultItem":0},"jaw_bone_width":{"item":0.0,"defaultTexture":0,"defaultItem":0},"eyebrown_forward":{"item":0.0,"defaultTexture":0,"defaultItem":0},"chimp_hole":{"item":0.0,"defaultTexture":0,"defaultItem":0},"makeup":{"texture":0,"defaultItem":-1,"opacity":1.0,"item":255,"highlight":0,"defaultTexture":1},"face2":{"item":21,"defaultTexture":0,"defaultItem":0,"texture":21},"ear":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"chest":{"texture":0,"defaultItem":0,"opacity":1.0,"item":255,"highlight":0,"defaultTexture":0},"arms":{"item":15,"defaultTexture":0,"defaultItem":0,"texture":0},"shoes":{"item":261,"defaultTexture":0,"defaultItem":1,"texture":2},"cheek_2":{"item":0.0,"defaultTexture":0,"defaultItem":0},"mask":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"hat":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"sun_damage":{"texture":0,"defaultItem":0,"opacity":1.0,"item":255,"highlight":0,"defaultTexture":0},"eye_opening":{"item":0.0,"defaultTexture":0,"defaultItem":0},"cheek_1":{"item":0.0,"defaultTexture":0,"defaultItem":0},"nose_2":{"item":0.0,"defaultTexture":0,"defaultItem":0},"bracelet":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"bag":{"item":161,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_3":{"item":0.0,"defaultTexture":0,"defaultItem":0},"decals":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0}}', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.player_houses: ~0 rows (approximately)

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

-- Dumping data for table worldisyours.player_mails: ~21 rows (approximately)
INSERT INTO `player_mails` (`id`, `identifier`, `citizenid`, `sender`, `subject`, `message`, `read`, `mailid`, `date`, `button`) VALUES
	(2, 'DJD56142', NULL, 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Mre Dxe<br />Phone Number: <strong>2915240715</strong><br><br>Kind regards,<br>Township Los Santos', 0, 425286, '2024-09-14 05:14:43', '[]'),
	(3, 'DXT09752', NULL, 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Mre Dxe<br />Phone Number: <strong>2915240715</strong><br><br>Kind regards,<br>Township Los Santos', 0, 452426, '2024-09-14 05:14:43', '[]'),
	(4, 'SRI85140', NULL, 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Mre Dxe<br />Phone Number: <strong>2915240715</strong><br><br>Kind regards,<br>Township Los Santos', 0, 338924, '2024-09-14 05:14:43', '[]'),
	(5, 'DJD56142', NULL, 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Mre Dxe<br />Phone Number: <strong>2915240715</strong><br><br>Kind regards,<br>Township Los Santos', 0, 952947, '2024-09-14 05:15:56', '[]'),
	(6, 'DXT09752', NULL, 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Mre Dxe<br />Phone Number: <strong>2915240715</strong><br><br>Kind regards,<br>Township Los Santos', 0, 550295, '2024-09-14 05:15:56', '[]'),
	(7, 'SRI85140', NULL, 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Mre Dxe<br />Phone Number: <strong>2915240715</strong><br><br>Kind regards,<br>Township Los Santos', 0, 298029, '2024-09-14 05:15:56', '[]'),
	(8, 'DJD56142', NULL, 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Test Testina<br />Phone Number: <strong>6887049303</strong><br><br>Kind regards,<br>Township Los Santos', 0, 684942, '2024-09-16 05:06:14', '[]'),
	(9, 'DXT09752', NULL, 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Test Testina<br />Phone Number: <strong>6887049303</strong><br><br>Kind regards,<br>Township Los Santos', 0, 660815, '2024-09-16 05:06:14', '[]'),
	(10, 'SRI85140', NULL, 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Test Testina<br />Phone Number: <strong>6887049303</strong><br><br>Kind regards,<br>Township Los Santos', 0, 199224, '2024-09-16 05:06:14', '[]'),
	(11, 'JVH49125', NULL, 'Crastenburg Hotel', 'Room Number 111', ' Your room is ready <br><br> Safe Password: <br><b>PZTBVR </b><br> You can change it from the reception . <br><br> Your stay in the hotel is extended to <br><b> Thu Sep 19 02:18:45 2024 </b><br><br>Greetings, <br>Crastenburg Hotel Management & Staff', 0, 958728, '2024-09-16 09:18:45', NULL),
	(12, 'OUV63962', NULL, 'Crastenburg Hotel', 'Room Number 101', ' Your room is ready <br><br> Safe Password: <br><b>XDNOG3 </b><br> You can change it from the reception . <br><br> Your stay in the hotel is extended to <br><b> Tue Sep 24 19:38:34 2024 </b><br><br>Greetings, <br>Crastenburg Hotel Management & Staff', 0, 348617, '2024-09-18 02:38:34', NULL),
	(15, 'OUV63962', NULL, '[8QC438FZ]', 'Yosemite Rancher Declasse', 'Yosemite Rancher Declasse<br>Plates: [8QC438FZ]<br><br>Changes: 10<br> ----------------------- <br><br>Exhausts - [ 4. Side Exit Titanium Exhausts ]<br>Livery - [ 18. Drift Assault ]<br>Spoilers - [ 6. Tube Trail Door ]<br>Skirts - [ 3. Trail Side Steps ]<br>Front Bumpers - [ 14. Offroad Shield Bumper ]<br>Engine Blocks - [ 4. V8 - Chrome Ribbed Covers ]<br>Hoods - [ 6. Secondary Hood w/ Triple Intake ]<br>Primary - [ White Prismatic (Chameleon) ]<br>Plates - [ Yellow on Black ]<br> Window Tints - [ Pure Black ] - ', 0, 464141, '2024-09-23 15:58:13', NULL),
	(16, 'JVH49125', NULL, 'Crastenburg Hotel', 'Room Number 111', ' Your room is ready <br><br> Safe Password: <br><b>Y83748 </b><br> You can change it from the reception . <br><br> Your stay in the hotel is extended to <br><b> Tue Oct  1 22:54:14 2024 </b><br><br>Greetings, <br>Crastenburg Hotel Management & Staff', 0, 638966, '2024-09-25 05:54:14', NULL),
	(17, 'JXD83837', NULL, 'Crastenburg Hotel', 'Room Number 201', ' Your room is ready <br><br> Safe Password: <br><b>THQKGW </b><br> You can change it from the reception . <br><br> Your stay in the hotel is extended to <br><b> Fri Sep 27 09:00:42 2024 </b><br><br>Greetings, <br>Crastenburg Hotel Management & Staff', 0, 902321, '2024-09-26 16:00:42', NULL),
	(18, 'RDO88579', NULL, 'Crastenburg Hotel', 'Room Number 701', ' Your room is ready <br><br> Safe Password: <br><b>C8EP9W </b><br> You can change it from the reception . <br><br> Your stay in the hotel is extended to <br><b> Fri Sep 27 09:16:59 2024 </b><br><br>Greetings, <br>Crastenburg Hotel Management & Staff', 0, 748638, '2024-09-26 16:16:59', NULL),
	(19, 'JVH49125', NULL, 'Dynasty 8', 'Sales commission.', '¡Thanks for working with us! You received a commission for the sale of the house = 34', 0, 584466, '2024-10-09 16:44:50', '[]'),
	(20, 'JVH49125', NULL, '[7RN352UB]', 'RAM TRX 6x6 Dodge', 'RAM TRX 6x6 Dodge<br>Plates: [7RN352UB]<br><br>Changes: 1<br> ----------------------- <br><br>Extras - [ Extra: 1: ON ] - ', 0, 812048, '2024-10-13 01:53:13', NULL),
	(21, 'DJD56142', NULL, 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Shelby Lutz<br />Phone Number: <strong>6115148840</strong><br><br>Kind regards,<br>Township Los Santos', 0, 642981, '2024-10-13 02:45:57', '[]'),
	(22, 'DXT09752', NULL, 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Shelby Lutz<br />Phone Number: <strong>6115148840</strong><br><br>Kind regards,<br>Township Los Santos', 0, 112540, '2024-10-13 02:45:57', '[]'),
	(23, 'SRI85140', NULL, 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Shelby Lutz<br />Phone Number: <strong>6115148840</strong><br><br>Kind regards,<br>Township Los Santos', 0, 737462, '2024-10-13 02:45:57', '[]'),
	(24, 'JVH49125', NULL, '[01GQY922]', '9F Cabrio Obey', '9F Cabrio Obey<br>Plates: [01GQY922]<br><br>Changes: 6<br> ----------------------- <br><br>Primary - [ Gasoline Green (Metallic) ]<br>Secondary - [ Galaxy Blue (Metallic) ]<br>Pearlescent - [ Lime Green (Metallic) ]<br>Wheel - [ Gasoline Green (Metallic) ]<br>Dashboard - [ Carbon Black (Metallic) ]<br>Interior - [ Carbon Black (Metallic) ]', 0, 530171, '2024-10-13 04:23:16', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.player_outfits: ~36 rows (approximately)
INSERT INTO `player_outfits` (`id`, `citizenid`, `outfitname`, `model`, `skin`, `outfitId`) VALUES
	(1, 'GAZ46654', 'fit 1', '-1667301416', '{"cheek_1":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"eye_opening":{"texture":0,"defaultItem":0,"item":13,"defaultTexture":0},"vest":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"t-shirt":{"texture":0,"defaultItem":1,"item":2,"defaultTexture":0},"cheek_3":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"bag":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"hair":{"texture":28,"defaultItem":0,"item":87,"defaultTexture":0},"moles":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"eye_color":{"texture":0,"defaultItem":-1,"item":14,"defaultTexture":0},"nose_4":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"jaw_bone_back_lenght":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"nose_3":{"texture":0,"defaultItem":0,"item":4,"defaultTexture":0},"watch":{"texture":0,"defaultItem":-1,"item":3,"defaultTexture":0},"bracelet":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"accessory":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"cheek_2":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"neck_thikness":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"blush":{"texture":1,"defaultItem":-1,"item":-1,"defaultTexture":1},"nose_0":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"chimp_bone_width":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"face2":{"texture":2,"defaultItem":0,"item":2,"defaultTexture":0},"eyebrown_forward":{"texture":0,"defaultItem":0,"item":4,"defaultTexture":0},"lips_thickness":{"texture":0,"defaultItem":0,"item":12,"defaultTexture":0},"mask":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"hat":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"chimp_bone_lowering":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"shoes":{"texture":0,"defaultItem":1,"item":49,"defaultTexture":0},"jaw_bone_width":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"arms":{"texture":0,"defaultItem":0,"item":4,"defaultTexture":0},"eyebrown_high":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"glass":{"texture":0,"defaultItem":0,"item":5,"defaultTexture":0},"ear":{"texture":0,"defaultItem":-1,"item":0,"defaultTexture":0},"pants":{"texture":0,"defaultItem":0,"item":8,"defaultTexture":0},"nose_1":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"eyebrows":{"texture":1,"defaultItem":-1,"item":2,"defaultTexture":1},"beard":{"texture":1,"defaultItem":-1,"item":-1,"defaultTexture":1},"chimp_hole":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"ageing":{"texture":0,"defaultItem":-1,"item":15,"defaultTexture":0},"lipstick":{"texture":1,"defaultItem":-1,"item":-1,"defaultTexture":1},"nose_5":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"nose_2":{"texture":0,"defaultItem":0,"item":6,"defaultTexture":0},"torso2":{"texture":0,"defaultItem":0,"item":173,"defaultTexture":0},"facemix":{"skinMix":0,"defaultSkinMix":0.0,"defaultShapeMix":0.0,"shapeMix":0},"chimp_bone_lenght":{"texture":0,"defaultItem":0,"item":8,"defaultTexture":0},"face":{"texture":8,"defaultItem":0,"item":40,"defaultTexture":0},"decals":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"makeup":{"texture":1,"defaultItem":-1,"item":-1,"defaultTexture":1}}', 'outfit-9-1189'),
	(2, 'ERZ21370', 'Starting Outfit', 'mp_m_freemode_01', '{"shoes":{"defaultTexture":0,"item":2,"texture":0,"defaultItem":1},"ageing":{"texture":0,"opacity":0.6,"defaultTexture":0,"defaultItem":-1,"highlight":0,"item":5},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":0.1},"vest":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"hair":{"texture":1,"item":10,"defaultTexture":0,"defaultItem":0,"highlight":1,"style":0},"bag":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":-4.0},"arms":{"defaultTexture":0,"item":2,"texture":0,"defaultItem":0},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":1.5},"face2":{"defaultTexture":0,"item":37,"texture":37,"defaultItem":0},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":-0.4},"t-shirt":{"defaultTexture":0,"item":15,"texture":0,"defaultItem":1},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":-3.0},"pants":{"defaultTexture":0,"item":1,"texture":0,"defaultItem":0},"accessory":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":2.0},"skinDad":17,"skinMom":27,"tattoos":[],"nose_2":{"defaultTexture":0,"defaultItem":0,"item":-4.8},"decals":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"facemix":{"shapeMix":0.12610100043342,"skinMix":0.39838310857161},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":-3.7},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":-2.2},"complexion":{"texture":0,"opacity":0.09,"defaultTexture":0,"defaultItem":0,"highlight":0,"item":4},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":-2.8},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":0.0},"moles":{"texture":0,"opacity":0.37,"defaultTexture":0,"defaultItem":-1,"highlight":0,"item":10},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":1.0},"eye_color":{"defaultTexture":0,"item":1,"texture":0,"defaultItem":-1},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":-0.4},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":4.5},"mask":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":2.9},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":-4.1},"eyebrows":{"texture":0,"opacity":0.64,"defaultTexture":1,"defaultItem":-1,"highlight":0,"item":10},"beard":{"texture":0,"opacity":0.61,"defaultTexture":1,"defaultItem":-1,"highlight":0,"item":24},"sun_damage":{"texture":0,"opacity":0.44,"defaultTexture":0,"defaultItem":0,"highlight":0,"item":9},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":-3.4},"torso2":{"defaultTexture":0,"item":16,"texture":0,"defaultItem":0},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":3.8},"face":{"defaultTexture":0,"item":10,"texture":10,"defaultItem":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":4.4}}', 'outfit-10-6803'),
	(3, 'KVJ77630', 'Starting Outfit', 'mp_m_freemode_01', '{"nose_3":{"defaultTexture":0,"item":-2.9,"defaultItem":0},"ageing":{"texture":0,"opacity":0.42,"defaultTexture":0,"item":14,"highlight":0,"defaultItem":-1},"nose_5":{"defaultTexture":0,"item":3.8,"defaultItem":0},"vest":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"hair":{"texture":1,"style":0,"defaultTexture":0,"defaultItem":0,"highlight":1,"item":27},"bag":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"cheek_2":{"defaultTexture":0,"item":2.6,"defaultItem":0},"eye_color":{"texture":0,"item":1,"defaultTexture":0,"defaultItem":-1},"eyebrown_forward":{"defaultTexture":0,"item":-0.7,"defaultItem":0},"face2":{"texture":27,"item":27,"defaultTexture":0,"defaultItem":0},"face":{"texture":2,"item":2,"defaultTexture":0,"defaultItem":0},"t-shirt":{"texture":0,"item":15,"defaultItem":1,"defaultTexture":0},"nose_4":{"defaultTexture":0,"item":-0.8,"defaultItem":0},"eyebrown_high":{"defaultTexture":0,"item":2.5,"defaultItem":0},"accessory":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"nose_1":{"defaultTexture":0,"item":-1.0,"defaultItem":0},"skinDad":29,"skinMom":27,"tattoos":[],"nose_2":{"defaultTexture":0,"item":-4.8,"defaultItem":0},"decals":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"facemix":{"shapeMix":0.82838795224746,"skinMix":0.21758933603965},"lips_thickness":{"defaultTexture":0,"item":2.4,"defaultItem":0},"jaw_bone_back_lenght":{"defaultTexture":0,"item":3.59999999999999,"defaultItem":0},"complexion":{"texture":0,"opacity":0.63,"defaultTexture":0,"item":0,"highlight":0,"defaultItem":0},"chimp_bone_lowering":{"defaultTexture":0,"item":1.4,"defaultItem":0},"cheek_3":{"defaultTexture":0,"item":3.9,"defaultItem":0},"moles":{"texture":0,"opacity":0.76,"defaultTexture":0,"item":4,"highlight":0,"defaultItem":-1},"cheek_1":{"defaultTexture":0,"item":4.69999999999999,"defaultItem":0},"pants":{"texture":0,"item":52,"defaultItem":0,"defaultTexture":0},"chimp_hole":{"defaultTexture":0,"item":-2.8,"defaultItem":0},"neck_thikness":{"defaultTexture":0,"item":-3.9,"defaultItem":0},"mask":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"chimp_bone_width":{"defaultTexture":0,"item":-2.0,"defaultItem":0},"jaw_bone_width":{"defaultTexture":0,"item":1.9,"defaultItem":0},"eye_opening":{"defaultTexture":0,"item":-4.6,"defaultItem":0},"beard":{"texture":0,"opacity":0.12,"defaultTexture":1,"item":19,"highlight":0,"defaultItem":-1},"sun_damage":{"texture":0,"opacity":0.35,"defaultTexture":0,"item":3,"highlight":0,"defaultItem":0},"chimp_bone_lenght":{"defaultTexture":0,"item":-3.3,"defaultItem":0},"arms":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"shoes":{"texture":0,"item":54,"defaultItem":1,"defaultTexture":0},"torso2":{"texture":0,"item":235,"defaultItem":0,"defaultTexture":0},"eyebrows":{"texture":0,"opacity":0.16,"defaultTexture":1,"item":31,"highlight":0,"defaultItem":-1}}', 'outfit-10-6258'),
	(4, 'FGB24346', 'Starting Outfit', 'mp_m_freemode_01', '{"eye_opening":{"defaultTexture":0,"item":-1.5,"defaultItem":0},"ageing":{"texture":0,"opacity":0.02,"defaultTexture":0,"item":14,"highlight":0,"defaultItem":-1},"nose_5":{"defaultTexture":0,"item":5.0,"defaultItem":0},"vest":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"hair":{"texture":1,"defaultTexture":0,"style":0,"item":20,"highlight":1,"defaultItem":0},"torso2":{"texture":0,"item":16,"defaultItem":0,"defaultTexture":0},"cheek_2":{"defaultTexture":0,"item":-2.0,"defaultItem":0},"chimp_hole":{"defaultTexture":0,"item":-0.1,"defaultItem":0},"eyebrown_forward":{"defaultTexture":0,"item":-1.2,"defaultItem":0},"face2":{"texture":36,"item":36,"defaultTexture":0,"defaultItem":0},"face":{"texture":43,"item":43,"defaultTexture":0,"defaultItem":0},"t-shirt":{"texture":0,"item":15,"defaultItem":1,"defaultTexture":0},"nose_4":{"defaultTexture":0,"item":3.7,"defaultItem":0},"eyebrown_high":{"defaultTexture":0,"item":2.0,"defaultItem":0},"accessory":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"nose_1":{"defaultTexture":0,"item":0.8,"defaultItem":0},"skinDad":32,"skinMom":44,"tattoos":[],"nose_2":{"defaultTexture":0,"item":-0.6,"defaultItem":0},"eyebrows":{"texture":0,"opacity":0.79,"defaultTexture":1,"item":9,"highlight":0,"defaultItem":-1},"facemix":{"skinMix":0.57081454401573,"shapeMix":0.31330972078589},"lips_thickness":{"defaultTexture":0,"item":-0.7,"defaultItem":0},"jaw_bone_back_lenght":{"defaultTexture":0,"item":5.0,"defaultItem":0},"complexion":{"texture":0,"opacity":0.06,"defaultTexture":0,"item":8,"highlight":0,"defaultItem":0},"pants":{"texture":0,"item":5,"defaultItem":0,"defaultTexture":0},"decals":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"moles":{"texture":0,"opacity":0.79,"defaultTexture":0,"item":4,"highlight":0,"defaultItem":-1},"cheek_1":{"defaultTexture":0,"item":-1.79999999999999,"defaultItem":0},"chimp_bone_lenght":{"defaultTexture":0,"item":-4.2,"defaultItem":0},"chimp_bone_lowering":{"defaultTexture":0,"item":0.8,"defaultItem":0},"neck_thikness":{"defaultTexture":0,"item":-3.0,"defaultItem":0},"nose_3":{"defaultTexture":0,"item":4.4,"defaultItem":0},"mask":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"jaw_bone_width":{"defaultTexture":0,"item":-3.0,"defaultItem":0},"chimp_bone_width":{"defaultTexture":0,"item":3.59999999999999,"defaultItem":0},"beard":{"texture":0,"opacity":0.2,"defaultTexture":1,"item":27,"highlight":0,"defaultItem":-1},"sun_damage":{"texture":0,"opacity":0.39,"defaultTexture":0,"item":3,"highlight":0,"defaultItem":0},"eye_color":{"texture":0,"item":1,"defaultTexture":0,"defaultItem":-1},"arms":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"cheek_3":{"defaultTexture":0,"item":-3.0,"defaultItem":0},"bag":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"shoes":{"texture":0,"item":7,"defaultItem":1,"defaultTexture":0}}', 'outfit-9-1650'),
	(5, 'JXD83837', 'Starting Outfit', 'mp_m_freemode_01', '{"skinDad":8,"tattoos":[],"chimp_bone_lowering":{"item":2.2,"defaultTexture":0,"defaultItem":0},"torso2":{"item":5,"defaultTexture":0,"texture":0,"defaultItem":0},"decals":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"skinMom":28,"eye_opening":{"item":2.9,"defaultTexture":0,"defaultItem":0},"pants":{"item":17,"defaultTexture":0,"texture":0,"defaultItem":0},"eyebrown_high":{"item":-2.4,"defaultTexture":0,"defaultItem":0},"eyebrows":{"item":28,"texture":0,"highlight":0,"defaultTexture":1,"defaultItem":-1,"opacity":0.56},"complexion":{"item":0,"texture":0,"highlight":0,"defaultTexture":0,"defaultItem":0,"opacity":0.4},"jaw_bone_width":{"item":-1.0,"defaultTexture":0,"defaultItem":0},"bag":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"t-shirt":{"item":15,"defaultTexture":0,"texture":0,"defaultItem":1},"vest":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"lips_thickness":{"item":-1.7,"defaultTexture":0,"defaultItem":0},"ageing":{"item":8,"texture":0,"highlight":0,"defaultTexture":0,"defaultItem":-1,"opacity":0.64},"mask":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"cheek_2":{"item":-3.1,"defaultTexture":0,"defaultItem":0},"arms":{"item":5,"defaultTexture":0,"texture":0,"defaultItem":0},"accessory":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"nose_1":{"item":-0.6,"defaultTexture":0,"defaultItem":0},"eye_color":{"item":1,"defaultTexture":0,"texture":0,"defaultItem":-1},"chimp_hole":{"item":2.8,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":2.7,"defaultTexture":0,"defaultItem":0},"jaw_bone_back_lenght":{"item":4.4,"defaultTexture":0,"defaultItem":0},"cheek_1":{"item":-2.5,"defaultTexture":0,"defaultItem":0},"eyebrown_forward":{"item":1.4,"defaultTexture":0,"defaultItem":0},"hair":{"defaultItem":0,"texture":1,"highlight":1,"defaultTexture":0,"item":52,"style":0},"nose_5":{"item":-3.1,"defaultTexture":0,"defaultItem":0},"face":{"item":19,"defaultTexture":0,"texture":19,"defaultItem":0},"nose_3":{"item":-1.2,"defaultTexture":0,"defaultItem":0},"face2":{"item":25,"defaultTexture":0,"texture":25,"defaultItem":0},"sun_damage":{"item":5,"texture":0,"highlight":0,"defaultTexture":0,"defaultItem":0,"opacity":0.55},"nose_2":{"item":-2.2,"defaultTexture":0,"defaultItem":0},"chimp_bone_width":{"item":-1.6,"defaultTexture":0,"defaultItem":0},"moles":{"item":13,"texture":0,"highlight":0,"defaultTexture":0,"defaultItem":-1,"opacity":0.11},"beard":{"item":24,"texture":0,"highlight":0,"defaultTexture":1,"defaultItem":-1,"opacity":0.01},"cheek_3":{"item":0.6,"defaultTexture":0,"defaultItem":0},"neck_thikness":{"item":-2.5,"defaultTexture":0,"defaultItem":0},"chimp_bone_lenght":{"item":-3.0,"defaultTexture":0,"defaultItem":0},"facemix":{"skinMix":0.74357071009541,"shapeMix":0.34969264806983},"shoes":{"item":10,"defaultTexture":0,"texture":0,"defaultItem":1}}', 'outfit-6-8236'),
	(6, 'AIM07751', 'Starting Outfit', 'mp_m_freemode_01', '{"skinDad":15,"tattoos":[],"chimp_bone_lowering":{"item":-2.0,"defaultTexture":0,"defaultItem":0},"torso2":{"item":14,"defaultTexture":0,"texture":0,"defaultItem":0},"decals":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"skinMom":28,"eye_opening":{"item":-3.1,"defaultTexture":0,"defaultItem":0},"pants":{"item":5,"defaultTexture":0,"texture":0,"defaultItem":0},"nose_5":{"item":2.0,"defaultTexture":0,"defaultItem":0},"shoes":{"item":42,"defaultTexture":0,"texture":0,"defaultItem":1},"complexion":{"item":5,"texture":0,"highlight":0,"defaultTexture":0,"defaultItem":0,"opacity":0.75},"jaw_bone_width":{"item":-3.7,"defaultTexture":0,"defaultItem":0},"bag":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"t-shirt":{"item":15,"defaultTexture":0,"texture":0,"defaultItem":1},"vest":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"lips_thickness":{"item":-0.5,"defaultTexture":0,"defaultItem":0},"hair":{"item":8,"texture":1,"highlight":1,"defaultTexture":0,"defaultItem":0,"style":0},"mask":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"jaw_bone_back_lenght":{"item":-2.5,"defaultTexture":0,"defaultItem":0},"chimp_bone_width":{"item":3.3,"defaultTexture":0,"defaultItem":0},"accessory":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"nose_1":{"item":-0.2,"defaultTexture":0,"defaultItem":0},"eye_color":{"defaultItem":-1,"defaultTexture":0,"texture":0,"item":1},"chimp_hole":{"item":2.2,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":-0.89999999999999,"defaultTexture":0,"defaultItem":0},"eyebrown_forward":{"item":-0.6,"defaultTexture":0,"defaultItem":0},"cheek_1":{"item":-4.9,"defaultTexture":0,"defaultItem":0},"face2":{"defaultItem":0,"defaultTexture":0,"texture":28,"item":28},"eyebrown_high":{"item":-0.7,"defaultTexture":0,"defaultItem":0},"chimp_bone_lenght":{"item":1.9,"defaultTexture":0,"defaultItem":0},"nose_3":{"item":-3.4,"defaultTexture":0,"defaultItem":0},"cheek_2":{"item":-2.1,"defaultTexture":0,"defaultItem":0},"nose_2":{"item":1.9,"defaultTexture":0,"defaultItem":0},"sun_damage":{"item":1,"texture":0,"highlight":0,"defaultTexture":0,"defaultItem":0,"opacity":0.62},"face":{"defaultItem":0,"defaultTexture":0,"texture":9,"item":9},"eyebrows":{"item":14,"texture":0,"highlight":0,"defaultTexture":1,"defaultItem":-1,"opacity":0.46},"moles":{"item":17,"texture":0,"highlight":0,"defaultTexture":0,"defaultItem":-1,"opacity":0.33},"beard":{"item":9,"texture":0,"highlight":0,"defaultTexture":1,"defaultItem":-1,"opacity":0.75},"neck_thikness":{"item":1.79999999999999,"defaultTexture":0,"defaultItem":0},"arms":{"item":1,"defaultTexture":0,"texture":0,"defaultItem":0},"cheek_3":{"item":-1.5,"defaultTexture":0,"defaultItem":0},"facemix":{"shapeMix":0.14923373240374,"skinMix":0.69626680988294},"ageing":{"item":6,"texture":0,"highlight":0,"defaultTexture":0,"defaultItem":-1,"opacity":0.33}}', 'outfit-4-9068'),
	(7, 'OUV63962', 'Starting Outfit', 'mp_m_freemode_01', '{"face2":{"defaultTexture":0,"texture":30,"item":30,"defaultItem":0},"nose_4":{"defaultTexture":0,"item":2.1,"defaultItem":0},"face":{"defaultTexture":0,"texture":2,"item":2,"defaultItem":0},"facemix":{"skinMix":0.6460125127935,"shapeMix":0.03367869214651},"eyebrown_forward":{"defaultTexture":0,"item":1.6,"defaultItem":0},"chimp_bone_lenght":{"defaultTexture":0,"item":0.1,"defaultItem":0},"cheek_1":{"defaultTexture":0,"item":-2.1,"defaultItem":0},"arms":{"defaultTexture":0,"texture":0,"item":1,"defaultItem":0},"beard":{"highlight":0,"item":8,"texture":0,"opacity":0.13,"defaultTexture":1,"defaultItem":-1},"nose_1":{"defaultTexture":0,"item":-0.6,"defaultItem":0},"skinDad":10,"chimp_bone_lowering":{"defaultTexture":0,"item":1.1,"defaultItem":0},"decals":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"eye_color":{"defaultTexture":0,"texture":0,"item":1,"defaultItem":-1},"t-shirt":{"defaultTexture":0,"texture":0,"item":15,"defaultItem":1},"ageing":{"highlight":0,"item":12,"texture":0,"opacity":0.05,"defaultTexture":0,"defaultItem":-1},"chimp_bone_width":{"defaultTexture":0,"item":1.79999999999999,"defaultItem":0},"skinMom":40,"bag":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"neck_thikness":{"defaultTexture":0,"item":3.5,"defaultItem":0},"nose_5":{"defaultTexture":0,"item":2.5,"defaultItem":0},"torso2":{"defaultTexture":0,"texture":0,"item":14,"defaultItem":0},"jaw_bone_back_lenght":{"defaultTexture":0,"item":-1.1,"defaultItem":0},"cheek_3":{"defaultTexture":0,"item":-0.2,"defaultItem":0},"accessory":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"jaw_bone_width":{"defaultTexture":0,"item":0.5,"defaultItem":0},"vest":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"eye_opening":{"defaultTexture":0,"item":4.9,"defaultItem":0},"nose_3":{"defaultTexture":0,"item":3.1,"defaultItem":0},"sun_damage":{"highlight":0,"item":2,"texture":0,"opacity":0.07,"defaultTexture":0,"defaultItem":0},"eyebrows":{"highlight":0,"item":12,"texture":0,"opacity":0.36,"defaultTexture":1,"defaultItem":-1},"nose_2":{"defaultTexture":0,"item":4.69999999999999,"defaultItem":0},"pants":{"defaultTexture":0,"texture":0,"item":105,"defaultItem":0},"mask":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"moles":{"highlight":0,"item":6,"texture":0,"opacity":0.11,"defaultTexture":0,"defaultItem":-1},"eyebrown_high":{"defaultTexture":0,"item":-1.4,"defaultItem":0},"tattoos":[],"chimp_hole":{"defaultTexture":0,"item":-4.8,"defaultItem":0},"hair":{"highlight":1,"item":68,"style":0,"texture":1,"defaultTexture":0,"defaultItem":0},"complexion":{"highlight":0,"item":1,"texture":0,"opacity":0.31,"defaultTexture":0,"defaultItem":0},"cheek_2":{"defaultTexture":0,"item":-3.0,"defaultItem":0},"shoes":{"defaultTexture":0,"texture":0,"item":42,"defaultItem":1},"lips_thickness":{"defaultTexture":0,"item":-0.1,"defaultItem":0}}', 'outfit-10-6135'),
	(8, 'CTM94839', 'Starting Outfit', 'mp_m_freemode_01', '{"face2":{"defaultTexture":0,"defaultItem":0,"item":23,"texture":23},"nose_4":{"defaultTexture":0,"item":-1.7,"defaultItem":0},"face":{"defaultTexture":0,"defaultItem":0,"item":38,"texture":38},"chimp_hole":{"defaultTexture":0,"item":-1.2,"defaultItem":0},"eyebrown_forward":{"defaultTexture":0,"item":-2.2,"defaultItem":0},"chimp_bone_lenght":{"defaultTexture":0,"item":-5.0,"defaultItem":0},"cheek_1":{"defaultTexture":0,"item":0.2,"defaultItem":0},"arms":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"beard":{"defaultTexture":1,"item":4,"texture":0,"highlight":0,"opacity":0.39,"defaultItem":-1},"eyebrown_high":{"defaultTexture":0,"item":-0.1,"defaultItem":0},"skinDad":36,"chimp_bone_lowering":{"defaultTexture":0,"item":-2.1,"defaultItem":0},"decals":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eye_color":{"defaultTexture":0,"defaultItem":-1,"item":1,"texture":0},"lips_thickness":{"defaultTexture":0,"item":-4.4,"defaultItem":0},"ageing":{"defaultTexture":0,"item":12,"texture":0,"highlight":0,"opacity":0.1,"defaultItem":-1},"chimp_bone_width":{"defaultTexture":0,"item":-0.2,"defaultItem":0},"skinMom":37,"jaw_bone_width":{"defaultTexture":0,"item":-4.3,"defaultItem":0},"neck_thikness":{"defaultTexture":0,"item":3.7,"defaultItem":0},"nose_5":{"defaultTexture":0,"item":0.6,"defaultItem":0},"t-shirt":{"defaultTexture":0,"defaultItem":1,"item":15,"texture":0},"jaw_bone_back_lenght":{"defaultTexture":0,"item":-4.69999999999999,"defaultItem":0},"cheek_3":{"defaultTexture":0,"item":3.4,"defaultItem":0},"accessory":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrows":{"defaultTexture":1,"item":15,"texture":0,"highlight":0,"opacity":0.59,"defaultItem":-1},"vest":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"cheek_2":{"defaultTexture":0,"item":3.3,"defaultItem":0},"facemix":{"skinMix":0.5543029365563,"shapeMix":0.22506745583426},"nose_1":{"defaultTexture":0,"item":3.0,"defaultItem":0},"bag":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_2":{"defaultTexture":0,"item":-0.8,"defaultItem":0},"sun_damage":{"defaultTexture":0,"item":9,"texture":0,"highlight":0,"opacity":0.49,"defaultItem":0},"tattoos":[],"moles":{"defaultTexture":0,"item":8,"texture":0,"highlight":0,"opacity":0.53,"defaultItem":-1},"eye_opening":{"defaultTexture":0,"item":-4.0,"defaultItem":0},"mask":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"pants":{"defaultTexture":0,"defaultItem":0,"item":12,"texture":0},"hair":{"defaultTexture":0,"item":23,"texture":1,"highlight":1,"style":0,"defaultItem":0},"complexion":{"defaultTexture":0,"item":2,"texture":0,"highlight":0,"opacity":0.62,"defaultItem":0},"torso2":{"defaultTexture":0,"defaultItem":0,"item":93,"texture":0},"shoes":{"defaultTexture":0,"defaultItem":1,"item":1,"texture":0},"nose_3":{"defaultTexture":0,"item":-3.59999999999999,"defaultItem":0}}', 'outfit-3-1165'),
	(9, 'CTM94839', 'Starting Outfit', 'mp_m_freemode_01', '{"face2":{"defaultTexture":0,"defaultItem":0,"item":23,"texture":23},"nose_4":{"defaultTexture":0,"item":-1.7,"defaultItem":0},"face":{"defaultTexture":0,"defaultItem":0,"item":38,"texture":38},"chimp_hole":{"defaultTexture":0,"item":-1.2,"defaultItem":0},"eyebrown_forward":{"defaultTexture":0,"item":-2.2,"defaultItem":0},"chimp_bone_lenght":{"defaultTexture":0,"item":-5.0,"defaultItem":0},"cheek_1":{"defaultTexture":0,"item":0.2,"defaultItem":0},"arms":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"beard":{"defaultTexture":1,"item":4,"texture":0,"highlight":0,"opacity":0.39,"defaultItem":-1},"eyebrown_high":{"defaultTexture":0,"item":-0.1,"defaultItem":0},"skinDad":36,"chimp_bone_lowering":{"defaultTexture":0,"item":-2.1,"defaultItem":0},"decals":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eye_color":{"defaultTexture":0,"defaultItem":-1,"item":1,"texture":0},"lips_thickness":{"defaultTexture":0,"item":-4.4,"defaultItem":0},"ageing":{"defaultTexture":0,"item":12,"texture":0,"highlight":0,"opacity":0.1,"defaultItem":-1},"chimp_bone_width":{"defaultTexture":0,"item":-0.2,"defaultItem":0},"skinMom":37,"jaw_bone_width":{"defaultTexture":0,"item":-4.3,"defaultItem":0},"neck_thikness":{"defaultTexture":0,"item":3.7,"defaultItem":0},"nose_5":{"defaultTexture":0,"item":0.6,"defaultItem":0},"t-shirt":{"defaultTexture":0,"defaultItem":1,"item":15,"texture":0},"jaw_bone_back_lenght":{"defaultTexture":0,"item":-4.69999999999999,"defaultItem":0},"cheek_3":{"defaultTexture":0,"item":3.4,"defaultItem":0},"accessory":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrows":{"defaultTexture":1,"item":15,"texture":0,"highlight":0,"opacity":0.59,"defaultItem":-1},"vest":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"cheek_2":{"defaultTexture":0,"item":3.3,"defaultItem":0},"facemix":{"skinMix":0.5543029365563,"shapeMix":0.22506745583426},"nose_1":{"defaultTexture":0,"item":3.0,"defaultItem":0},"bag":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_2":{"defaultTexture":0,"item":-0.8,"defaultItem":0},"sun_damage":{"defaultTexture":0,"item":9,"texture":0,"highlight":0,"opacity":0.49,"defaultItem":0},"tattoos":[],"moles":{"defaultTexture":0,"item":8,"texture":0,"highlight":0,"opacity":0.53,"defaultItem":-1},"eye_opening":{"defaultTexture":0,"item":-4.0,"defaultItem":0},"mask":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"pants":{"defaultTexture":0,"defaultItem":0,"item":12,"texture":0},"hair":{"defaultTexture":0,"item":23,"texture":1,"highlight":1,"style":0,"defaultItem":0},"complexion":{"defaultTexture":0,"item":2,"texture":0,"highlight":0,"opacity":0.62,"defaultItem":0},"torso2":{"defaultTexture":0,"defaultItem":0,"item":93,"texture":0},"shoes":{"defaultTexture":0,"defaultItem":1,"item":1,"texture":0},"nose_3":{"defaultTexture":0,"item":-3.59999999999999,"defaultItem":0}}', 'outfit-7-7420'),
	(10, 'PUX10690', 'Starting Outfit', 'mp_m_freemode_01', '{"eyebrows":{"defaultTexture":1,"opacity":0.0,"defaultItem":-1,"texture":0,"highlight":0,"item":15},"jaw_bone_width":{"defaultTexture":0,"item":4.4,"defaultItem":0},"torso2":{"defaultTexture":0,"item":28,"defaultItem":0,"texture":0},"moles":{"defaultTexture":0,"opacity":0.54,"defaultItem":-1,"texture":0,"highlight":0,"item":13},"eye_color":{"defaultTexture":0,"item":1,"defaultItem":-1,"texture":0},"neck_thikness":{"defaultTexture":0,"item":-4.4,"defaultItem":0},"chimp_bone_lowering":{"defaultTexture":0,"item":-4.1,"defaultItem":0},"nose_3":{"defaultTexture":0,"item":3.8,"defaultItem":0},"decals":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"accessory":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"cheek_3":{"defaultTexture":0,"item":-2.0,"defaultItem":0},"nose_5":{"defaultTexture":0,"item":-5.0,"defaultItem":0},"facemix":{"skinMix":0.3822884237055,"shapeMix":0.3414501727734},"jaw_bone_back_lenght":{"defaultTexture":0,"item":-2.2,"defaultItem":0},"chimp_bone_width":{"defaultTexture":0,"item":5.0,"defaultItem":0},"vest":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"bag":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_2":{"defaultTexture":0,"item":-4.1,"defaultItem":0},"cheek_1":{"defaultTexture":0,"item":5.0,"defaultItem":0},"lips_thickness":{"defaultTexture":0,"item":-4.5,"defaultItem":0},"complexion":{"defaultTexture":0,"opacity":0.65,"defaultItem":0,"texture":0,"highlight":0,"item":9},"chimp_hole":{"defaultTexture":0,"item":1.3,"defaultItem":0},"tattoos":[],"nose_1":{"defaultTexture":0,"item":0.7,"defaultItem":0},"eyebrown_high":{"defaultTexture":0,"item":-2.9,"defaultItem":0},"shoes":{"defaultTexture":0,"item":54,"defaultItem":1,"texture":0},"chimp_bone_lenght":{"defaultTexture":0,"item":-1.1,"defaultItem":0},"mask":{"defaultTexture":0,"item":52,"defaultItem":0,"texture":5},"eyebrown_forward":{"defaultTexture":0,"item":-0.4,"defaultItem":0},"nose_4":{"defaultTexture":0,"item":1.79999999999999,"defaultItem":0},"beard":{"defaultTexture":1,"opacity":0.77,"defaultItem":-1,"texture":0,"highlight":0,"item":7},"ageing":{"defaultTexture":0,"opacity":0.13,"defaultItem":-1,"texture":0,"highlight":0,"item":6},"t-shirt":{"defaultTexture":0,"item":13,"defaultItem":1,"texture":2},"pants":{"defaultTexture":0,"item":24,"defaultItem":0,"texture":0},"face2":{"defaultTexture":0,"item":38,"defaultItem":0,"texture":38},"hair":{"defaultTexture":0,"item":55,"defaultItem":0,"texture":1,"highlight":1,"style":0},"face":{"defaultTexture":0,"item":5,"defaultItem":0,"texture":5},"cheek_2":{"defaultTexture":0,"item":-2.1,"defaultItem":0},"arms":{"defaultTexture":0,"item":1,"defaultItem":0,"texture":0},"skinMom":40,"skinDad":28,"eye_opening":{"defaultTexture":0,"item":-3.9,"defaultItem":0},"sun_damage":{"defaultTexture":0,"opacity":0.7,"defaultItem":0,"texture":0,"highlight":0,"item":3}}', 'outfit-7-2773'),
	(11, 'QCD01130', 'Starting Outfit', 'mp_m_freemode_01', '{"face":{"defaultItem":0,"item":44,"defaultTexture":0,"texture":44},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":4.90000009536743},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":0.8500772797527},"chest":{"highlight":0,"opacity":1.0,"defaultItem":0,"texture":0,"item":255,"defaultTexture":0},"vest":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"bag":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"bracelet":{"defaultItem":-1,"item":-1,"defaultTexture":0,"texture":-1},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":-1.65940705353379},"torso2":{"defaultItem":0,"item":374,"defaultTexture":0,"texture":0},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":9.58128424898131},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":-0.7999999821186},"glass":{"defaultItem":-1,"item":37,"defaultTexture":-1,"texture":1},"hat":{"defaultItem":-1,"item":143,"defaultTexture":0,"texture":0},"decals":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"t-shirt":{"defaultItem":1,"item":15,"defaultTexture":0,"texture":0},"pants":{"defaultItem":0,"item":43,"defaultTexture":0,"texture":1},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":3.73612477167345},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":1.74933258395391},"sun_damage":{"highlight":0,"opacity":0.25999999046325,"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"skinDad":11,"moles":{"highlight":0,"opacity":0.63999998569488,"defaultItem":-1,"texture":0,"item":2,"defaultTexture":0},"eye_color":{"defaultItem":-1,"item":2,"defaultTexture":0,"texture":0},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":4.00000005960464},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":-4.90000009536743},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":-1.80000007152557},"tattoos":[],"lipstick":{"highlight":0,"opacity":1.0,"defaultItem":-1,"texture":0,"item":255,"defaultTexture":1},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":-1.02992834059294},"beard":{"highlight":0,"opacity":0.70999997854232,"defaultItem":-1,"texture":4,"item":2,"defaultTexture":1},"skinMom":22,"nose_3":{"defaultTexture":0,"defaultItem":0,"item":0.76858226780947},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":-2.56709287621188},"ageing":{"highlight":0,"opacity":0.43000000715255,"defaultItem":-1,"texture":0,"item":0,"defaultTexture":0},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":6.88351833637768},"makeup":{"highlight":0,"opacity":1.0,"defaultItem":-1,"texture":0,"item":255,"defaultTexture":1},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":4.72530560629478},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":4.30000007152557},"ear":{"defaultItem":-1,"item":-1,"defaultTexture":0,"texture":-1},"complexion":{"highlight":0,"opacity":0.72000002861022,"defaultItem":0,"texture":0,"item":5,"defaultTexture":0},"mask":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":5.0},"hair":{"style":0,"highlight":10,"defaultItem":0,"item":4,"defaultTexture":0,"texture":7},"arms":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":6.61374174511732},"face2":{"defaultItem":0,"item":33,"defaultTexture":0,"texture":33},"blush":{"highlight":0,"opacity":1.0,"defaultItem":-1,"texture":0,"item":255,"defaultTexture":1},"bodyb":{"highlight":0,"opacity":1.0,"defaultItem":0,"texture":0,"item":255,"defaultTexture":0},"watch":{"defaultItem":-1,"item":-1,"defaultTexture":0,"texture":-1},"eyebrows":{"highlight":0,"opacity":0.57584234930448,"defaultItem":-1,"texture":4,"item":12,"defaultTexture":1},"facemix":{"shapeMix":0.30098765432098,"skinMix":0.64074074074074},"accessory":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":-0.09999999776482},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0.0},"shoes":{"defaultItem":1,"item":32,"defaultTexture":0,"texture":1}}', 'outfit-7-8783'),
	(12, 'QNC46912', 'Starting Outfit', 'mp_m_freemode_01', '{"skinMom":11,"accessory":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":-2.11746522411128},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":-10.0},"skinDad":19,"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":1.09999999403953},"t-shirt":{"texture":0,"item":15,"defaultTexture":0,"defaultItem":1},"hat":{"texture":-1,"item":-1,"defaultTexture":0,"defaultItem":-1},"bodyb":{"texture":0,"item":255,"defaultTexture":0,"defaultItem":0,"highlight":0,"opacity":1.0},"hair":{"texture":61,"item":48,"defaultTexture":0,"style":0,"defaultItem":0,"highlight":26},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":3.19657158915273},"ageing":{"texture":0,"item":7,"defaultTexture":0,"defaultItem":-1,"highlight":0,"opacity":0.34999999403953},"shoes":{"texture":0,"item":54,"defaultTexture":0,"defaultItem":1},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":4.54545454545454},"beard":{"texture":0,"item":10,"defaultTexture":1,"defaultItem":-1,"highlight":0,"opacity":0.99},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":-10.0},"face":{"texture":5,"item":5,"defaultTexture":0,"defaultItem":0},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":0.04074750597161},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":10.0},"torso2":{"texture":0,"item":427,"defaultTexture":0,"defaultItem":0},"eyebrows":{"texture":0,"item":12,"defaultTexture":1,"defaultItem":-1,"highlight":0,"opacity":0.99},"tattoos":[],"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":4.30000007152557},"nose_0":{"defaultItem":0,"defaultTexture":0,"item":3.37642264999297},"moles":{"texture":0,"item":8,"defaultTexture":0,"defaultItem":-1,"highlight":0,"opacity":0.63999998569488},"makeup":{"texture":0,"item":255,"defaultTexture":1,"defaultItem":-1,"highlight":0,"opacity":1.0},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":-10.0},"ear":{"texture":-1,"item":-1,"defaultTexture":0,"defaultItem":-1},"eye_color":{"texture":0,"item":17,"defaultTexture":0,"defaultItem":-1},"lipstick":{"texture":0,"item":255,"defaultTexture":1,"defaultItem":-1,"highlight":0,"opacity":1.0},"arms":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"vest":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"decals":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"pants":{"texture":0,"item":5,"defaultTexture":0,"defaultItem":0},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":-9.84263032176478},"facemix":{"shapeMix":0.57753086419753,"skinMix":0.99},"bracelet":{"texture":-1,"item":-1,"defaultTexture":0,"defaultItem":-1},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":0.0},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":1.89999997615814},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":6.51538569622031},"blush":{"texture":0,"item":255,"defaultTexture":1,"defaultItem":-1,"highlight":0,"opacity":1.0},"complexion":{"texture":0,"item":10,"defaultTexture":0,"defaultItem":0,"highlight":0,"opacity":0.63999998569488},"watch":{"texture":-1,"item":-1,"defaultTexture":0,"defaultItem":-1},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":-10.0},"bag":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"glass":{"texture":-1,"item":-1,"defaultTexture":-1,"defaultItem":-1},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":-4.49999988079071},"chest":{"texture":0,"item":255,"defaultTexture":0,"defaultItem":0,"highlight":0,"opacity":1.0},"mask":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":9.85106084024167},"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":-10.0},"nose_3":{"defaultItem":0,"defaultTexture":0,"item":10.0},"face2":{"texture":26,"item":26,"defaultTexture":0,"defaultItem":0},"sun_damage":{"texture":0,"item":3,"defaultTexture":0,"defaultItem":0,"highlight":0,"opacity":0.62999999523162}}', 'outfit-10-4550'),
	(13, 'BHC52575', 'Starting Outfit', 'mp_f_freemode_01', '{"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":4.3},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":-1.79999999999999},"torso2":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":415},"complexion":{"defaultTexture":0,"item":2,"defaultItem":0,"opacity":0.38699873542222,"highlight":0,"texture":0},"hair":{"defaultTexture":0,"item":52,"defaultItem":0,"style":0,"highlight":1,"texture":1},"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":1.79999999999999},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":-3.18814107067584},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":3.1066460587326},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":4.0},"face":{"defaultItem":0,"texture":17,"defaultTexture":0,"item":17},"shoes":{"defaultItem":1,"texture":0,"defaultTexture":0,"item":1},"decals":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"eye_color":{"defaultItem":-1,"texture":0,"defaultTexture":0,"item":1},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":0.4},"facemix":{"shapeMix":0.99,"skinMix":0.78296296296296},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":-3.9},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":-3.01672052831249},"arms":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":11},"bag":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"vest":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"ageing":{"defaultTexture":0,"item":8,"defaultItem":-1,"opacity":0.14,"highlight":0,"texture":0},"eyebrows":{"defaultTexture":1,"item":16,"defaultItem":-1,"opacity":0.81000843051847,"highlight":0,"texture":61},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":2.3},"moles":{"defaultTexture":0,"item":8,"defaultItem":-1,"opacity":0.59094983841506,"highlight":0,"texture":0},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":-3.37642264999297},"lipstick":{"defaultTexture":1,"item":1,"defaultItem":-1,"opacity":0.45120556414219,"highlight":0,"texture":31},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":0.8},"pants":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":56},"skinMom":37,"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":1.1},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":-3.5},"nose_0":{"defaultItem":0,"defaultTexture":0,"item":2.47716734579176},"accessory":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":-0.5},"nose_3":{"defaultItem":0,"defaultTexture":0,"item":-0.6},"tattoos":[],"makeup":{"defaultTexture":1,"item":5,"defaultItem":-1,"opacity":0.71558662357734,"highlight":0,"texture":0},"skinDad":20,"nose_4":{"defaultItem":0,"defaultTexture":0,"item":-3.4},"mask":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"sun_damage":{"defaultTexture":0,"item":9,"defaultItem":0,"opacity":0.32,"highlight":0,"texture":0},"t-shirt":{"defaultItem":1,"texture":0,"defaultTexture":0,"item":3},"face2":{"defaultItem":0,"texture":25,"defaultTexture":0,"item":25},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":-4.1},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":-1.3}}', 'outfit-10-9928'),
	(14, 'JVH49125', 'Starting Outfit', 'mp_f_freemode_01', '{"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":-4.0},"sun_damage":{"defaultTexture":0,"item":7,"defaultItem":0,"opacity":0.32,"texture":0,"highlight":0},"torso2":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":69},"complexion":{"defaultTexture":0,"item":2,"defaultItem":0,"opacity":0.01,"texture":0,"highlight":0},"hair":{"defaultTexture":0,"item":15,"defaultItem":0,"texture":37,"style":0,"highlight":1},"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":3.9},"mask":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":-2.9},"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":1.0},"face":{"defaultItem":0,"texture":8,"defaultTexture":0,"item":8},"shoes":{"defaultItem":1,"texture":0,"defaultTexture":0,"item":7},"decals":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"face2":{"defaultItem":0,"texture":21,"defaultTexture":0,"item":21},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":1.79999999999999},"facemix":{"shapeMix":0.99,"skinMix":0.5396131446395},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":3.9},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":4.6},"arms":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":1},"bag":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"vest":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"ageing":{"defaultTexture":0,"item":0,"defaultItem":-1,"opacity":0.26,"texture":0,"highlight":0},"eyebrows":{"defaultTexture":1,"item":12,"defaultItem":-1,"opacity":0.51541239286216,"texture":3,"highlight":0},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":-3.4},"moles":{"defaultTexture":0,"item":8,"defaultItem":-1,"opacity":0.01,"texture":0,"highlight":0},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":2.46873682731487},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":1.5},"pants":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"skinMom":32,"nose_5":{"defaultItem":0,"defaultTexture":0,"item":4.0},"t-shirt":{"defaultItem":1,"texture":0,"defaultTexture":0,"item":34},"accessory":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"lipstick":{"defaultTexture":1,"item":0,"defaultItem":-1,"opacity":0.0,"texture":0,"highlight":0},"nose_3":{"defaultItem":0,"defaultTexture":0,"item":-1.9},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":-4.0},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":2.4},"skinDad":41,"nose_4":{"defaultItem":0,"defaultTexture":0,"item":0.4},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":3.59999999999999},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":-0.4},"eye_color":{"defaultItem":-1,"texture":0,"defaultTexture":0,"item":3},"tattoos":[],"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":1.4},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":-2.3}}', 'outfit-4-1400'),
	(15, 'LLU56122', 'Starting Outfit', 'mp_m_freemode_01', '{"face":{"defaultTexture":0,"item":25,"texture":25,"defaultItem":0},"eye_color":{"defaultTexture":0,"item":1,"texture":0,"defaultItem":-1},"chimp_hole":{"defaultTexture":0,"item":-0.7,"defaultItem":0},"complexion":{"defaultItem":0,"highlight":0,"texture":0,"opacity":0.17,"item":5,"defaultTexture":0},"t-shirt":{"defaultTexture":0,"item":15,"texture":0,"defaultItem":1},"hair":{"defaultItem":0,"highlight":1,"texture":1,"style":0,"item":8,"defaultTexture":0},"nose_5":{"defaultTexture":0,"item":-2.6,"defaultItem":0},"lips_thickness":{"defaultTexture":0,"item":-1.1,"defaultItem":0},"nose_4":{"defaultTexture":0,"item":-2.9,"defaultItem":0},"eyebrown_high":{"defaultTexture":0,"item":-4.5,"defaultItem":0},"nose_3":{"defaultTexture":0,"item":-3.0,"defaultItem":0},"vest":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"nose_2":{"defaultTexture":0,"item":-0.5,"defaultItem":0},"sun_damage":{"defaultItem":0,"highlight":0,"texture":0,"opacity":0.62,"item":5,"defaultTexture":0},"pants":{"defaultTexture":0,"item":42,"texture":0,"defaultItem":0},"chimp_bone_lowering":{"defaultTexture":0,"item":-3.5,"defaultItem":0},"skinMom":26,"face2":{"defaultTexture":0,"item":33,"texture":33,"defaultItem":0},"skinDad":13,"nose_1":{"defaultTexture":0,"item":1.9,"defaultItem":0},"moles":{"defaultItem":-1,"highlight":0,"texture":0,"opacity":0.79,"item":2,"defaultTexture":0},"neck_thikness":{"defaultTexture":0,"item":4.8,"defaultItem":0},"beard":{"defaultItem":-1,"highlight":0,"texture":0,"opacity":0.27,"item":22,"defaultTexture":1},"cheek_1":{"defaultTexture":0,"item":0.7,"defaultItem":0},"decals":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"shoes":{"defaultTexture":0,"item":10,"texture":0,"defaultItem":1},"eyebrown_forward":{"defaultTexture":0,"item":-2.5,"defaultItem":0},"chimp_bone_width":{"defaultTexture":0,"item":-5.0,"defaultItem":0},"accessory":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"tattoos":[],"eye_opening":{"defaultTexture":0,"item":4.69999999999999,"defaultItem":0},"mask":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"bag":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"cheek_3":{"defaultTexture":0,"item":0.3,"defaultItem":0},"torso2":{"defaultTexture":0,"item":86,"texture":0,"defaultItem":0},"chimp_bone_lenght":{"defaultTexture":0,"item":-2.7,"defaultItem":0},"jaw_bone_width":{"defaultTexture":0,"item":-1.2,"defaultItem":0},"ageing":{"defaultItem":-1,"highlight":0,"texture":0,"opacity":0.25,"item":14,"defaultTexture":0},"eyebrows":{"defaultItem":-1,"highlight":0,"texture":0,"opacity":0.26,"item":4,"defaultTexture":1},"jaw_bone_back_lenght":{"defaultTexture":0,"item":2.2,"defaultItem":0},"cheek_2":{"defaultTexture":0,"item":-3.0,"defaultItem":0},"facemix":{"skinMix":0.33240636538419,"shapeMix":0.04504831092374},"arms":{"defaultTexture":0,"item":1,"texture":0,"defaultItem":0}}', 'outfit-7-7960'),
	(16, 'AIM07751', 'chem suit', 'mp_m_freemode_01', '{"torso2":{"defaultItem":0,"item":731,"texture":0,"defaultTexture":0},"eyebrows":{"defaultTexture":1,"item":14,"opacity":0.46000000834465,"defaultItem":-1,"texture":0,"highlight":0},"chimp_bone_lenght":{"defaultItem":0,"item":1.89999997615814,"defaultTexture":0},"skinDad":15,"face":{"defaultItem":0,"item":9,"texture":9,"defaultTexture":0},"hair":{"defaultTexture":0,"item":8,"style":0,"defaultItem":0,"texture":1,"highlight":1},"eye_opening":{"defaultItem":0,"item":-3.10000002384185,"defaultTexture":0},"watch":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":0},"ageing":{"defaultTexture":0,"item":6,"opacity":0.33000001311302,"defaultItem":-1,"texture":0,"highlight":0},"bag":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"makeup":{"defaultTexture":1,"item":255,"opacity":1.0,"defaultItem":-1,"texture":0,"highlight":0},"chimp_hole":{"defaultItem":0,"item":2.19999998807907,"defaultTexture":0},"chest":{"defaultTexture":0,"item":255,"opacity":1.0,"defaultItem":0,"texture":0,"highlight":0},"lips_thickness":{"defaultItem":0,"item":-0.50000000745058,"defaultTexture":0},"eyebrown_high":{"defaultItem":0,"item":-0.70000000298023,"defaultTexture":0},"accessory":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"blush":{"defaultTexture":1,"item":255,"opacity":1.0,"defaultItem":-1,"texture":0,"highlight":0},"sun_damage":{"defaultTexture":0,"item":1,"opacity":0.62000000476837,"defaultItem":0,"texture":0,"highlight":0},"arms":{"defaultItem":0,"item":171,"texture":0,"defaultTexture":0},"skinMom":28,"glass":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":-1},"bodyb":{"defaultTexture":0,"item":255,"opacity":1.0,"defaultItem":0,"texture":0,"highlight":0},"chimp_bone_lowering":{"defaultItem":0,"item":-2.00000002980232,"defaultTexture":0},"neck_thikness":{"defaultItem":0,"item":1.80000007152557,"defaultTexture":0},"eye_color":{"defaultItem":-1,"item":1,"texture":0,"defaultTexture":0},"nose_3":{"defaultItem":0,"item":-3.40000003576278,"defaultTexture":0},"nose_2":{"defaultItem":0,"item":1.89999997615814,"defaultTexture":0},"jaw_bone_width":{"defaultItem":0,"item":-3.70000004768371,"defaultTexture":0},"pants":{"defaultItem":0,"item":11,"texture":0,"defaultTexture":0},"cheek_1":{"defaultItem":0,"item":-4.90000009536743,"defaultTexture":0},"t-shirt":{"defaultItem":1,"item":15,"texture":0,"defaultTexture":0},"cheek_2":{"defaultItem":0,"item":-2.09999993443489,"defaultTexture":0},"moles":{"defaultTexture":0,"item":17,"opacity":0.33000001311302,"defaultItem":-1,"texture":0,"highlight":0},"complexion":{"defaultTexture":0,"item":5,"opacity":0.75,"defaultItem":0,"texture":0,"highlight":0},"nose_5":{"defaultItem":0,"item":2.00000002980232,"defaultTexture":0},"vest":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"nose_4":{"defaultItem":0,"item":-0.90000003576278,"defaultTexture":0},"lipstick":{"defaultTexture":1,"item":255,"opacity":1.0,"defaultItem":-1,"texture":0,"highlight":0},"nose_1":{"defaultItem":0,"item":-0.19999999552965,"defaultTexture":0},"mask":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"jaw_bone_back_lenght":{"defaultItem":0,"item":-2.5,"defaultTexture":0},"cheek_3":{"defaultItem":0,"item":-1.50000005960464,"defaultTexture":0},"tattoos":[],"shoes":{"defaultItem":1,"item":13,"texture":0,"defaultTexture":0},"beard":{"defaultTexture":1,"item":9,"opacity":0.75,"defaultItem":-1,"texture":0,"highlight":0},"chimp_bone_width":{"defaultItem":0,"item":3.30000013113021,"defaultTexture":0},"hat":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":0},"nose_0":{"defaultItem":0,"item":0.0,"defaultTexture":0},"facemix":{"shapeMix":0.14923372864723,"skinMix":0.69626682996749},"face2":{"defaultItem":0,"item":28,"texture":28,"defaultTexture":0},"ear":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":0},"eyebrown_forward":{"defaultItem":0,"item":-0.59999998658895,"defaultTexture":0},"bracelet":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":0},"decals":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0}}', 'outfit-10-3971'),
	(17, 'AIM07751', 'doc', 'mp_m_freemode_01', '{"torso2":{"defaultItem":0,"item":67,"texture":0,"defaultTexture":0},"eyebrows":{"defaultTexture":1,"item":14,"opacity":0.46000000834465,"defaultItem":-1,"texture":0,"highlight":0},"chimp_bone_lenght":{"defaultItem":0,"item":1.89999997615814,"defaultTexture":0},"skinDad":15,"face":{"defaultItem":0,"item":9,"texture":9,"defaultTexture":0},"hair":{"defaultTexture":0,"item":8,"style":0,"defaultItem":0,"texture":1,"highlight":1},"eye_opening":{"defaultItem":0,"item":-3.10000002384185,"defaultTexture":0},"watch":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":0},"ageing":{"defaultTexture":0,"item":6,"opacity":0.33000001311302,"defaultItem":-1,"texture":0,"highlight":0},"bag":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"makeup":{"defaultTexture":1,"item":255,"opacity":1.0,"defaultItem":-1,"texture":0,"highlight":0},"chimp_hole":{"defaultItem":0,"item":2.19999998807907,"defaultTexture":0},"chest":{"defaultTexture":0,"item":255,"opacity":1.0,"defaultItem":0,"texture":0,"highlight":0},"lips_thickness":{"defaultItem":0,"item":-0.50000000745058,"defaultTexture":0},"eyebrown_high":{"defaultItem":0,"item":-0.70000000298023,"defaultTexture":0},"accessory":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"blush":{"defaultTexture":1,"item":255,"opacity":1.0,"defaultItem":-1,"texture":0,"highlight":0},"sun_damage":{"defaultTexture":0,"item":1,"opacity":0.62000000476837,"defaultItem":0,"texture":0,"highlight":0},"arms":{"defaultItem":0,"item":1,"texture":0,"defaultTexture":0},"skinMom":28,"glass":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":-1},"bodyb":{"defaultTexture":0,"item":255,"opacity":1.0,"defaultItem":0,"texture":0,"highlight":0},"chimp_bone_lowering":{"defaultItem":0,"item":-2.00000002980232,"defaultTexture":0},"neck_thikness":{"defaultItem":0,"item":1.80000007152557,"defaultTexture":0},"eye_color":{"defaultItem":-1,"item":1,"texture":0,"defaultTexture":0},"nose_3":{"defaultItem":0,"item":-3.40000003576278,"defaultTexture":0},"nose_2":{"defaultItem":0,"item":1.89999997615814,"defaultTexture":0},"jaw_bone_width":{"defaultItem":0,"item":-3.70000004768371,"defaultTexture":0},"pants":{"defaultItem":0,"item":7,"texture":0,"defaultTexture":0},"cheek_1":{"defaultItem":0,"item":-4.90000009536743,"defaultTexture":0},"t-shirt":{"defaultItem":1,"item":15,"texture":0,"defaultTexture":0},"cheek_2":{"defaultItem":0,"item":-2.09999993443489,"defaultTexture":0},"moles":{"defaultTexture":0,"item":17,"opacity":0.33000001311302,"defaultItem":-1,"texture":0,"highlight":0},"complexion":{"defaultTexture":0,"item":5,"opacity":0.75,"defaultItem":0,"texture":0,"highlight":0},"nose_5":{"defaultItem":0,"item":2.00000002980232,"defaultTexture":0},"vest":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"nose_4":{"defaultItem":0,"item":-0.90000003576278,"defaultTexture":0},"lipstick":{"defaultTexture":1,"item":255,"opacity":1.0,"defaultItem":-1,"texture":0,"highlight":0},"nose_1":{"defaultItem":0,"item":-0.19999999552965,"defaultTexture":0},"mask":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0},"jaw_bone_back_lenght":{"defaultItem":0,"item":-2.5,"defaultTexture":0},"cheek_3":{"defaultItem":0,"item":-1.50000005960464,"defaultTexture":0},"tattoos":[],"shoes":{"defaultItem":1,"item":8,"texture":2,"defaultTexture":0},"beard":{"defaultTexture":1,"item":9,"opacity":0.75,"defaultItem":-1,"texture":0,"highlight":0},"chimp_bone_width":{"defaultItem":0,"item":3.30000013113021,"defaultTexture":0},"hat":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":0},"nose_0":{"defaultItem":0,"item":0.0,"defaultTexture":0},"facemix":{"shapeMix":0.14923372864723,"skinMix":0.69626682996749},"face2":{"defaultItem":0,"item":28,"texture":28,"defaultTexture":0},"ear":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":0},"eyebrown_forward":{"defaultItem":0,"item":-0.59999998658895,"defaultTexture":0},"bracelet":{"defaultItem":-1,"item":-1,"texture":-1,"defaultTexture":0},"decals":{"defaultItem":0,"item":0,"texture":0,"defaultTexture":0}}', 'outfit-4-6099'),
	(18, 'JVH49125', 'black biker', 'mp_f_freemode_01', '{"torso2":{"defaultTexture":0,"item":1058,"texture":4,"defaultItem":0},"eyebrows":{"highlight":0,"item":12,"opacity":0.51541239023208,"defaultItem":-1,"texture":3,"defaultTexture":1},"chimp_bone_lenght":{"defaultTexture":0,"item":-0.3999999910593,"defaultItem":0},"skinDad":41,"face":{"defaultItem":0,"item":8,"texture":8,"defaultTexture":0},"skinMom":32,"eye_opening":{"defaultTexture":0,"item":4.6000000834465,"defaultItem":0},"watch":{"defaultTexture":0,"item":4,"texture":0,"defaultItem":-1},"ageing":{"highlight":0,"item":255,"opacity":0.15000000596046,"defaultItem":-1,"texture":0,"defaultTexture":0},"complexion":{"highlight":0,"item":255,"opacity":0.0,"defaultItem":0,"texture":0,"defaultTexture":0},"makeup":{"highlight":37,"item":5,"opacity":0.2774694263935,"defaultItem":-1,"texture":0,"defaultTexture":1},"chimp_hole":{"defaultTexture":0,"item":2.39999994635581,"defaultItem":0},"chest":{"highlight":0,"item":255,"opacity":1.0,"defaultItem":0,"texture":0,"defaultTexture":0},"bag":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"eyebrown_high":{"defaultTexture":0,"item":3.60000014305114,"defaultItem":0},"chimp_bone_width":{"defaultTexture":0,"item":3.89999985694885,"defaultItem":0},"cheek_1":{"defaultTexture":0,"item":3.89999985694885,"defaultItem":0},"moles":{"highlight":0,"item":255,"opacity":0.0,"defaultItem":-1,"texture":0,"defaultTexture":0},"nose_4":{"defaultTexture":0,"item":0.3999999910593,"defaultItem":0},"lipstick":{"highlight":0,"item":5,"opacity":0.4474287033081,"defaultItem":-1,"texture":34,"defaultTexture":1},"glass":{"defaultTexture":-1,"item":-1,"texture":-1,"defaultItem":-1},"nose_0":{"defaultTexture":0,"item":0.0,"defaultItem":0},"chimp_bone_lowering":{"defaultTexture":0,"item":-4.00000005960464,"defaultItem":0},"neck_thikness":{"defaultTexture":0,"item":0.0,"defaultItem":0},"arms":{"defaultTexture":0,"item":32,"texture":0,"defaultItem":0},"nose_3":{"defaultTexture":0,"item":-1.89999997615814,"defaultItem":0},"nose_2":{"defaultTexture":0,"item":-3.40000003576278,"defaultItem":0},"jaw_bone_width":{"defaultTexture":0,"item":1.40000000596046,"defaultItem":0},"pants":{"defaultTexture":0,"item":75,"texture":0,"defaultItem":0},"jaw_bone_back_lenght":{"defaultTexture":0,"item":-4.00000005960464,"defaultItem":0},"bodyb":{"highlight":0,"item":255,"opacity":1.0,"defaultItem":0,"texture":0,"defaultTexture":0},"blush":{"highlight":0,"item":1,"opacity":0.57961922883987,"defaultItem":-1,"texture":35,"defaultTexture":1},"face2":{"defaultItem":0,"item":21,"texture":21,"defaultTexture":0},"beard":{"highlight":0,"item":255,"opacity":1.0,"defaultItem":-1,"texture":0,"defaultTexture":1},"mask":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0},"hair":{"highlight":1,"item":15,"style":0,"defaultItem":0,"texture":37,"defaultTexture":0},"accessory":{"defaultTexture":0,"item":16,"texture":0,"defaultItem":0},"ear":{"defaultTexture":0,"item":13,"texture":0,"defaultItem":-1},"t-shirt":{"defaultTexture":0,"item":8,"texture":0,"defaultItem":1},"lips_thickness":{"defaultTexture":0,"item":2.46873676776886,"defaultItem":0},"nose_1":{"defaultTexture":0,"item":1.80000007152557,"defaultItem":0},"cheek_3":{"defaultTexture":0,"item":-2.30000004172325,"defaultItem":0},"tattoos":{"ZONE_RIGHT_ARM":[{"overlay":"MP_Christmas2017_Tattoo_017_M","collection":"mpchristmas2017_overlays"}]},"nose_5":{"defaultTexture":0,"item":4.00000005960464,"defaultItem":0},"eye_color":{"defaultItem":-1,"item":3,"texture":0,"defaultTexture":0},"cheek_2":{"defaultTexture":0,"item":1.50000005960464,"defaultItem":0},"hat":{"defaultTexture":0,"item":83,"texture":6,"defaultItem":-1},"sun_damage":{"highlight":0,"item":7,"opacity":0.31999999284744,"defaultItem":0,"texture":0,"defaultTexture":0},"facemix":{"shapeMix":0.99000000953674,"skinMix":0.53961312770843},"vest":{"defaultTexture":0,"item":36,"texture":0,"defaultItem":0},"shoes":{"defaultTexture":0,"item":88,"texture":0,"defaultItem":1},"eyebrown_forward":{"defaultTexture":0,"item":1.00000001490116,"defaultItem":0},"bracelet":{"defaultTexture":0,"item":10,"texture":0,"defaultItem":-1},"decals":{"defaultTexture":0,"item":0,"texture":0,"defaultItem":0}}', 'outfit-3-4146'),
	(19, 'AIM07751', 'lsso sheriff', 'mp_m_freemode_01', '{"makeup":{"texture":0,"defaultTexture":1,"item":255,"highlight":0,"opacity":1.0,"defaultItem":-1},"bodyb":{"texture":0,"defaultTexture":0,"item":255,"highlight":0,"opacity":1.0,"defaultItem":0},"nose_3":{"item":-3.40000003576278,"defaultTexture":0,"defaultItem":0},"hat":{"item":30,"defaultTexture":0,"texture":1,"defaultItem":-1},"blush":{"texture":0,"defaultTexture":1,"item":255,"highlight":0,"opacity":1.0,"defaultItem":-1},"ear":{"item":-1,"defaultTexture":0,"texture":-1,"defaultItem":-1},"skinDad":15,"lips_thickness":{"item":-0.50000000745058,"defaultTexture":0,"defaultItem":0},"pants":{"item":56,"defaultTexture":0,"texture":2,"defaultItem":0},"chimp_bone_width":{"item":3.30000013113021,"defaultTexture":0,"defaultItem":0},"chest":{"texture":0,"defaultTexture":0,"item":255,"highlight":0,"opacity":1.0,"defaultItem":0},"complexion":{"texture":0,"defaultTexture":0,"item":5,"highlight":0,"opacity":0.75,"defaultItem":0},"tattoos":[],"torso2":{"item":93,"defaultTexture":0,"texture":1,"defaultItem":0},"chimp_hole":{"item":2.19999998807907,"defaultTexture":0,"defaultItem":0},"vest":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"cheek_3":{"item":-1.50000005960464,"defaultTexture":0,"defaultItem":0},"jaw_bone_width":{"item":-3.70000004768371,"defaultTexture":0,"defaultItem":0},"cheek_2":{"item":-2.09999993443489,"defaultTexture":0,"defaultItem":0},"eyebrown_high":{"item":-0.70000000298023,"defaultTexture":0,"defaultItem":0},"sun_damage":{"texture":0,"defaultTexture":0,"item":1,"highlight":0,"opacity":0.62000000476837,"defaultItem":0},"nose_2":{"item":1.89999997615814,"defaultTexture":0,"defaultItem":0},"nose_0":{"item":0.0,"defaultTexture":0,"defaultItem":0},"nose_5":{"item":2.00000002980232,"defaultTexture":0,"defaultItem":0},"decals":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"beard":{"texture":0,"defaultTexture":1,"item":9,"highlight":0,"opacity":0.75,"defaultItem":-1},"bag":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"eyebrown_forward":{"item":-0.59999998658895,"defaultTexture":0,"defaultItem":0},"glass":{"item":-1,"defaultTexture":-1,"texture":-1,"defaultItem":-1},"arms":{"item":4,"defaultTexture":0,"texture":0,"defaultItem":0},"moles":{"texture":0,"defaultTexture":0,"item":17,"highlight":0,"opacity":0.33000001311302,"defaultItem":-1},"eye_opening":{"item":-3.10000002384185,"defaultTexture":0,"defaultItem":0},"t-shirt":{"item":260,"defaultTexture":0,"texture":0,"defaultItem":1},"chimp_bone_lenght":{"item":1.89999997615814,"defaultTexture":0,"defaultItem":0},"shoes":{"item":18,"defaultTexture":0,"texture":1,"defaultItem":1},"hair":{"texture":1,"defaultTexture":0,"item":3,"highlight":1,"style":0,"defaultItem":0},"chimp_bone_lowering":{"item":-2.00000002980232,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":-0.90000003576278,"defaultTexture":0,"defaultItem":0},"facemix":{"shapeMix":0.14923372864723,"skinMix":0.69626682996749},"lipstick":{"texture":0,"defaultTexture":1,"item":255,"highlight":0,"opacity":1.0,"defaultItem":-1},"jaw_bone_back_lenght":{"item":-2.5,"defaultTexture":0,"defaultItem":0},"neck_thikness":{"item":1.80000007152557,"defaultTexture":0,"defaultItem":0},"face2":{"item":28,"defaultTexture":0,"texture":28,"defaultItem":0},"eye_color":{"item":1,"defaultTexture":0,"texture":0,"defaultItem":-1},"accessory":{"item":6,"defaultTexture":0,"texture":5,"defaultItem":0},"cheek_1":{"item":-4.90000009536743,"defaultTexture":0,"defaultItem":0},"ageing":{"texture":0,"defaultTexture":0,"item":6,"highlight":0,"opacity":0.33000001311302,"defaultItem":-1},"watch":{"item":-1,"defaultTexture":0,"texture":-1,"defaultItem":-1},"nose_1":{"item":-0.19999999552965,"defaultTexture":0,"defaultItem":0},"eyebrows":{"texture":0,"defaultTexture":1,"item":14,"highlight":0,"opacity":0.46000000834465,"defaultItem":-1},"skinMom":28,"face":{"item":9,"defaultTexture":0,"texture":9,"defaultItem":0},"bracelet":{"item":-1,"defaultTexture":0,"texture":-1,"defaultItem":-1},"mask":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0}}', 'outfit-10-8176'),
	(20, 'AIM07751', 'fedora doc', 'mp_m_freemode_01', '{"jaw_bone_back_lenght":{"defaultTexture":0,"item":-2.5,"defaultItem":0},"hat":{"defaultTexture":0,"texture":2,"item":26,"defaultItem":-1},"tattoos":[],"chimp_bone_lowering":{"defaultTexture":0,"item":-2.00000002980232,"defaultItem":0},"makeup":{"texture":0,"defaultTexture":1,"opacity":1.0,"defaultItem":-1,"item":255,"highlight":0},"nose_5":{"defaultTexture":0,"item":2.00000002980232,"defaultItem":0},"bracelet":{"defaultTexture":0,"texture":-1,"item":-1,"defaultItem":-1},"beard":{"texture":0,"defaultTexture":1,"opacity":0.75,"defaultItem":-1,"item":255,"highlight":0},"mask":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"nose_3":{"defaultTexture":0,"item":-3.40000003576278,"defaultItem":0},"t-shirt":{"defaultTexture":0,"texture":0,"item":15,"defaultItem":1},"skinDad":17,"chest":{"texture":0,"defaultTexture":0,"opacity":1.0,"defaultItem":0,"item":255,"highlight":0},"shoes":{"defaultTexture":0,"texture":1,"item":31,"defaultItem":1},"nose_4":{"defaultTexture":0,"item":-0.90000003576278,"defaultItem":0},"jaw_bone_width":{"defaultTexture":0,"item":-3.70000004768371,"defaultItem":0},"ageing":{"texture":0,"defaultTexture":0,"opacity":0.33000001311302,"defaultItem":-1,"item":6,"highlight":0},"bodyb":{"texture":0,"defaultTexture":0,"opacity":1.0,"defaultItem":0,"item":255,"highlight":0},"decals":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"lips_thickness":{"defaultTexture":0,"item":-0.50000000745058,"defaultItem":0},"eye_color":{"defaultTexture":0,"texture":0,"item":1,"defaultItem":-1},"eyebrown_forward":{"defaultTexture":0,"item":-0.59999998658895,"defaultItem":0},"watch":{"defaultTexture":0,"texture":-1,"item":-1,"defaultItem":-1},"skinMom":28,"pants":{"defaultTexture":0,"texture":0,"item":-1,"defaultItem":0},"vest":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"nose_2":{"defaultTexture":0,"item":1.89999997615814,"defaultItem":0},"chimp_bone_lenght":{"defaultTexture":0,"item":1.89999997615814,"defaultItem":0},"blush":{"texture":0,"defaultTexture":1,"opacity":1.0,"defaultItem":-1,"item":255,"highlight":0},"lipstick":{"texture":0,"defaultTexture":1,"opacity":1.0,"defaultItem":-1,"item":255,"highlight":0},"neck_thikness":{"defaultTexture":0,"item":1.80000007152557,"defaultItem":0},"arms":{"defaultTexture":0,"texture":0,"item":4,"defaultItem":0},"eye_opening":{"defaultTexture":0,"item":-3.10000002384185,"defaultItem":0},"nose_0":{"defaultTexture":0,"item":0.0,"defaultItem":0},"eyebrown_high":{"defaultTexture":0,"item":-0.70000000298023,"defaultItem":0},"facemix":{"shapeMix":0.21012344956398,"skinMix":0.36024692654609},"cheek_2":{"defaultTexture":0,"item":-2.09999993443489,"defaultItem":0},"hair":{"style":0,"defaultTexture":0,"texture":1,"defaultItem":0,"item":3,"highlight":1},"chimp_hole":{"defaultTexture":0,"item":2.19999998807907,"defaultItem":0},"sun_damage":{"texture":0,"defaultTexture":0,"opacity":0.62000000476837,"defaultItem":0,"item":255,"highlight":0},"complexion":{"texture":0,"defaultTexture":0,"opacity":0.75,"defaultItem":0,"item":255,"highlight":0},"face":{"defaultTexture":0,"texture":1,"item":1,"defaultItem":0},"eyebrows":{"texture":0,"defaultTexture":1,"opacity":0.46000000834465,"defaultItem":-1,"item":14,"highlight":0},"cheek_3":{"defaultTexture":0,"item":-1.50000005960464,"defaultItem":0},"ear":{"defaultTexture":0,"texture":-1,"item":-1,"defaultItem":-1},"bag":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"cheek_1":{"defaultTexture":0,"item":-4.90000009536743,"defaultItem":0},"nose_1":{"defaultTexture":0,"item":-0.19999999552965,"defaultItem":0},"accessory":{"defaultTexture":0,"texture":5,"item":0,"defaultItem":0},"moles":{"texture":0,"defaultTexture":0,"opacity":0.33000001311302,"defaultItem":-1,"item":255,"highlight":0},"glass":{"defaultTexture":-1,"texture":-1,"item":-1,"defaultItem":-1},"chimp_bone_width":{"defaultTexture":0,"item":3.30000013113021,"defaultItem":0},"face2":{"defaultTexture":0,"texture":28,"item":28,"defaultItem":0},"torso2":{"defaultTexture":0,"texture":0,"item":760,"defaultItem":0}}', 'outfit-10-1553'),
	(21, 'LPI62642', 'Starting Outfit', 'mp_m_freemode_01', '{"neck_thikness":{"item":4.1,"defaultItem":0,"defaultTexture":0},"ageing":{"opacity":0.57,"texture":0,"defaultTexture":0,"item":10,"defaultItem":-1,"highlight":0},"moles":{"opacity":0.26,"texture":0,"defaultTexture":0,"item":13,"defaultItem":-1,"highlight":0},"decals":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"pants":{"texture":0,"item":105,"defaultItem":0,"defaultTexture":0},"eyebrown_high":{"item":-1.79999999999999,"defaultItem":0,"defaultTexture":0},"skinMom":26,"bag":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"cheek_2":{"item":-2.0,"defaultItem":0,"defaultTexture":0},"vest":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"arms":{"texture":0,"item":1,"defaultItem":0,"defaultTexture":0},"sun_damage":{"opacity":0.52,"texture":0,"defaultTexture":0,"item":9,"defaultItem":0,"highlight":0},"torso2":{"texture":0,"item":96,"defaultItem":0,"defaultTexture":0},"eyebrows":{"opacity":0.6,"texture":0,"defaultTexture":1,"item":14,"defaultItem":-1,"highlight":0},"chimp_bone_width":{"item":4.8,"defaultItem":0,"defaultTexture":0},"beard":{"opacity":0.57,"texture":0,"defaultTexture":1,"item":2,"defaultItem":-1,"highlight":0},"eye_opening":{"item":-4.2,"defaultItem":0,"defaultTexture":0},"face2":{"defaultTexture":0,"item":38,"defaultItem":0,"texture":38},"facemix":{"shapeMix":0.23939950806767,"skinMix":0.22895044692321},"tattoos":[],"eye_color":{"defaultTexture":0,"item":1,"defaultItem":-1,"texture":0},"chimp_bone_lowering":{"item":3.9,"defaultItem":0,"defaultTexture":0},"mask":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"t-shirt":{"texture":0,"item":15,"defaultItem":1,"defaultTexture":0},"cheek_3":{"item":-1.79999999999999,"defaultItem":0,"defaultTexture":0},"shoes":{"texture":0,"item":7,"defaultItem":1,"defaultTexture":0},"nose_1":{"item":2.3,"defaultItem":0,"defaultTexture":0},"accessory":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"nose_4":{"item":0.8,"defaultItem":0,"defaultTexture":0},"face":{"defaultTexture":0,"item":17,"defaultItem":0,"texture":17},"jaw_bone_width":{"item":1.0,"defaultItem":0,"defaultTexture":0},"chimp_hole":{"item":-3.4,"defaultItem":0,"defaultTexture":0},"eyebrown_forward":{"item":1.3,"defaultItem":0,"defaultTexture":0},"chimp_bone_lenght":{"item":-4.2,"defaultItem":0,"defaultTexture":0},"nose_3":{"item":3.3,"defaultItem":0,"defaultTexture":0},"skinDad":20,"nose_5":{"item":1.7,"defaultItem":0,"defaultTexture":0},"nose_2":{"item":-3.2,"defaultItem":0,"defaultTexture":0},"complexion":{"opacity":0.23,"texture":0,"defaultTexture":0,"item":6,"defaultItem":0,"highlight":0},"cheek_1":{"item":-5.0,"defaultItem":0,"defaultTexture":0},"jaw_bone_back_lenght":{"item":4.8,"defaultItem":0,"defaultTexture":0},"lips_thickness":{"item":2.0,"defaultItem":0,"defaultTexture":0},"hair":{"style":0,"texture":1,"highlight":1,"item":58,"defaultItem":0,"defaultTexture":0}}', 'outfit-7-5943'),
	(22, 'AIM07751', 'us marshal', 'mp_m_freemode_01', '{"ear":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"ageing":{"opacity":0.99000000953674,"texture":0,"highlight":0,"item":14,"defaultItem":-1,"defaultTexture":0},"moles":{"opacity":0.33000001311302,"texture":0,"highlight":0,"item":4,"defaultItem":-1,"defaultTexture":0},"decals":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"pants":{"texture":0,"item":80,"defaultItem":0,"defaultTexture":0},"eyebrown_high":{"item":2.38724187016487,"defaultItem":0,"defaultTexture":0},"skinMom":0,"chest":{"opacity":1.0,"texture":0,"highlight":0,"item":255,"defaultItem":0,"defaultTexture":0},"hair":{"style":0,"texture":28,"highlight":29,"item":41,"defaultItem":0,"defaultTexture":0},"lips_thickness":{"item":-10.0,"defaultItem":0,"defaultTexture":0},"blush":{"opacity":1.0,"texture":0,"highlight":0,"item":255,"defaultItem":-1,"defaultTexture":1},"bag":{"texture":0,"item":82,"defaultItem":0,"defaultTexture":0},"chimp_hole":{"item":2.19999998807907,"defaultItem":0,"defaultTexture":0},"arms":{"texture":0,"item":4,"defaultItem":0,"defaultTexture":0},"sun_damage":{"opacity":1.0,"texture":0,"highlight":0,"item":255,"defaultItem":0,"defaultTexture":0},"torso2":{"texture":0,"item":19,"defaultItem":0,"defaultTexture":0},"eyebrows":{"opacity":0.6249417066574,"texture":1,"highlight":0,"item":17,"defaultItem":-1,"defaultTexture":1},"chimp_bone_width":{"item":3.30000013113021,"defaultItem":0,"defaultTexture":0},"beard":{"opacity":0.75,"texture":0,"highlight":0,"item":255,"defaultItem":-1,"defaultTexture":1},"eye_opening":{"item":0.67022621631622,"defaultItem":0,"defaultTexture":0},"bracelet":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"nose_0":{"item":0.0,"defaultItem":0,"defaultTexture":0},"cheek_2":{"item":7.15329468250274,"defaultItem":0,"defaultTexture":0},"jaw_bone_width":{"item":-2.82843887805938,"defaultItem":0,"defaultTexture":0},"face2":{"texture":28,"item":28,"defaultItem":0,"defaultTexture":0},"facemix":{"shapeMix":0.59333330392837,"skinMix":0.15000000596046},"tattoos":[],"eye_color":{"texture":0,"item":11,"defaultItem":-1,"defaultTexture":0},"nose_1":{"item":-0.19999999552965,"defaultItem":0,"defaultTexture":0},"mask":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"t-shirt":{"texture":0,"item":63,"defaultItem":1,"defaultTexture":0},"chimp_bone_lowering":{"item":-2.00000002980232,"defaultItem":0,"defaultTexture":0},"cheek_3":{"item":-6.06575787067413,"defaultItem":0,"defaultTexture":0},"glass":{"texture":5,"item":3,"defaultItem":-1,"defaultTexture":-1},"shoes":{"texture":0,"item":36,"defaultItem":1,"defaultTexture":0},"watch":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"makeup":{"opacity":1.0,"texture":0,"highlight":0,"item":255,"defaultItem":-1,"defaultTexture":1},"lipstick":{"opacity":0.15000000596046,"texture":0,"highlight":0,"item":255,"defaultItem":-1,"defaultTexture":1},"accessory":{"texture":5,"item":1,"defaultItem":0,"defaultTexture":0},"nose_2":{"item":1.89999997615814,"defaultItem":0,"defaultTexture":0},"face":{"texture":13,"item":13,"defaultItem":0,"defaultTexture":0},"vest":{"texture":7,"item":67,"defaultItem":0,"defaultTexture":0},"bodyb":{"opacity":1.0,"texture":0,"highlight":0,"item":255,"defaultItem":0,"defaultTexture":0},"neck_thikness":{"item":9.58128452301025,"defaultItem":0,"defaultTexture":0},"chimp_bone_lenght":{"item":1.89999997615814,"defaultItem":0,"defaultTexture":0},"nose_3":{"item":-3.40000003576278,"defaultItem":0,"defaultTexture":0},"skinDad":6,"cheek_1":{"item":-5.88590681552887,"defaultItem":0,"defaultTexture":0},"nose_5":{"item":2.00000002980232,"defaultItem":0,"defaultTexture":0},"nose_4":{"item":-0.90000003576278,"defaultItem":0,"defaultTexture":0},"eyebrown_forward":{"item":0.94843335449695,"defaultItem":0,"defaultTexture":0},"jaw_bone_back_lenght":{"item":6.97344362735748,"defaultItem":0,"defaultTexture":0},"hat":{"texture":14,"item":135,"defaultItem":-1,"defaultTexture":0},"complexion":{"opacity":0.75,"texture":0,"highlight":0,"item":255,"defaultItem":0,"defaultTexture":0}}', 'outfit-4-8088'),
	(23, 'LPI62642', 'Fit', 'mp_m_freemode_01', '{"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":4.09999996423721},"eye_color":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":11},"tattoos":[],"glass":{"texture":2,"defaultTexture":-1,"defaultItem":-1,"item":8},"bodyb":{"texture":0,"item":255,"defaultItem":0,"highlight":0,"opacity":1.0,"defaultTexture":0},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":2.00000002980232},"facemix":{"skinMix":0.58380281925201,"shapeMix":0.42605632543563},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":1.30044847726821},"sun_damage":{"texture":0,"item":255,"defaultItem":0,"highlight":0,"opacity":0.51999998092651,"defaultTexture":0},"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":4.79999989271163},"complexion":{"texture":0,"item":255,"defaultItem":0,"highlight":0,"opacity":0.23000000417232,"defaultTexture":0},"face":{"texture":7,"defaultTexture":0,"defaultItem":0,"item":7},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":3.89999985694885},"t-shirt":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":1},"face2":{"texture":21,"defaultTexture":0,"defaultItem":0,"item":21},"vest":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"eyebrows":{"texture":3,"item":12,"defaultItem":-1,"highlight":0,"opacity":0.99000000953674,"defaultTexture":1},"makeup":{"texture":0,"item":255,"defaultItem":-1,"highlight":0,"opacity":1.0,"defaultTexture":1},"bracelet":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":-3.27354252338409},"moles":{"texture":0,"item":255,"defaultItem":-1,"highlight":0,"opacity":0.25999999046325,"defaultTexture":0},"decals":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":0.85201792418956},"chest":{"texture":0,"item":255,"defaultItem":0,"highlight":0,"opacity":1.0,"defaultTexture":0},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":1.00000001490116},"ageing":{"texture":0,"item":255,"defaultItem":-1,"highlight":0,"opacity":0.56999999284744,"defaultTexture":0},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":-2.00000002980232},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":0.7999999821186},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":-3.19999992847442},"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":-0.31390134245157},"pants":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":274},"blush":{"texture":0,"item":255,"defaultItem":-1,"highlight":0,"opacity":1.0,"defaultTexture":1},"nose_0":{"defaultItem":0,"defaultTexture":0,"item":0.0},"beard":{"texture":3,"item":2,"defaultItem":-1,"highlight":0,"opacity":0.79035872220993,"defaultTexture":1},"arms":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":25},"ear":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"hair":{"texture":3,"item":1,"style":1,"highlight":1,"defaultItem":0,"defaultTexture":0},"lipstick":{"texture":0,"item":255,"defaultItem":-1,"highlight":0,"opacity":1.0,"defaultTexture":1},"shoes":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":22},"torso2":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":165},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":0.0},"watch":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"mask":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"accessory":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":2.30000004172325},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":-1.80000007152557},"hat":{"texture":1,"defaultTexture":0,"defaultItem":-1,"item":56},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":-4.19999986886978},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":4.79999989271163},"bag":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"nose_3":{"defaultItem":0,"defaultTexture":0,"item":3.30000013113021},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":1.70000001788139},"skinMom":21,"skinDad":10}', 'outfit-1-2773'),
	(24, 'AIM07751', 'marshal 2', 'mp_m_freemode_01', '{"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":9.58128452301025},"eye_color":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":11},"tattoos":[],"glass":{"texture":0,"defaultTexture":-1,"defaultItem":-1,"item":-1},"bodyb":{"opacity":1.0,"item":255,"defaultItem":0,"highlight":0,"defaultTexture":0,"texture":0},"skinMom":0,"facemix":{"shapeMix":0.59333330392837,"skinMix":0.15000000596046},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":2.38724187016487},"sun_damage":{"opacity":1.0,"item":255,"defaultItem":0,"highlight":0,"defaultTexture":0,"texture":0},"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":3.30000013113021},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":2.19999998807907},"face":{"texture":13,"defaultTexture":0,"defaultItem":0,"item":13},"bag":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"bracelet":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"face2":{"texture":28,"defaultTexture":0,"defaultItem":0,"item":28},"vest":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"eyebrows":{"opacity":0.6249417066574,"item":17,"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":1},"makeup":{"opacity":1.0,"item":-1,"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":0},"nose_3":{"defaultItem":0,"defaultTexture":0,"item":-3.40000003576278},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":-5.88590681552887},"torso2":{"texture":6,"defaultTexture":0,"defaultItem":0,"item":389},"decals":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"blush":{"opacity":1.0,"item":255,"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":0},"skinDad":6,"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":-2.82843887805938},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":-6.06575787067413},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":7.15329468250274},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":-0.90000003576278},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":1.89999997615814},"chest":{"opacity":1.0,"item":255,"defaultItem":0,"highlight":0,"defaultTexture":0,"texture":0},"arms":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":6.97344362735748},"nose_0":{"defaultItem":0,"defaultTexture":0,"item":0.0},"beard":{"opacity":0.75,"item":255,"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":0},"moles":{"opacity":0.33000001311302,"item":4,"defaultItem":-1,"highlight":0,"defaultTexture":0,"texture":0},"ear":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"hair":{"texture":28,"item":41,"style":0,"highlight":29,"defaultItem":0,"defaultTexture":0},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":0.67022621631622},"watch":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":-2.00000002980232},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":-10.0},"shoes":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":36},"mask":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"t-shirt":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":17},"ageing":{"opacity":0.99000000953674,"item":14,"defaultItem":-1,"highlight":0,"defaultTexture":0,"texture":0},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":-0.19999999552965},"hat":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":1.89999997615814},"pants":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":320},"accessory":{"texture":1,"defaultTexture":0,"defaultItem":0,"item":17},"lipstick":{"opacity":0.15000000596046,"item":255,"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":0},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":2.00000002980232},"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":0.94843335449695},"complexion":{"opacity":0.75,"item":255,"defaultItem":0,"highlight":0,"defaultTexture":0,"texture":0}}', 'outfit-4-8480'),
	(26, 'RDO88579', 'Starting Outfit', 'mp_m_freemode_01', '{"nose_2":{"defaultItem":0,"item":4.2,"defaultTexture":0},"eye_opening":{"defaultItem":0,"item":4.0,"defaultTexture":0},"eyebrown_high":{"defaultItem":0,"item":3.2,"defaultTexture":0},"arms":{"defaultItem":0,"defaultTexture":0,"item":6,"texture":0},"nose_4":{"defaultItem":0,"item":-3.3,"defaultTexture":0},"torso2":{"defaultItem":0,"defaultTexture":0,"item":41,"texture":0},"skinMom":41,"pants":{"defaultItem":0,"defaultTexture":0,"item":69,"texture":0},"eyebrown_forward":{"defaultItem":0,"item":-4.9,"defaultTexture":0},"accessory":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"face2":{"defaultItem":0,"defaultTexture":0,"item":45,"texture":45},"t-shirt":{"defaultItem":1,"defaultTexture":0,"item":15,"texture":0},"bag":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"facemix":{"shapeMix":0.93539875244394,"skinMix":0.57349915978482},"skinDad":34,"lips_thickness":{"defaultItem":0,"item":-5.0,"defaultTexture":0},"chimp_bone_lowering":{"defaultItem":0,"item":-3.59999999999999,"defaultTexture":0},"decals":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"eye_color":{"defaultItem":-1,"defaultTexture":0,"item":1,"texture":0},"mask":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"chimp_hole":{"defaultItem":0,"item":-3.3,"defaultTexture":0},"jaw_bone_back_lenght":{"defaultItem":0,"item":2.4,"defaultTexture":0},"nose_5":{"defaultItem":0,"item":-1.2,"defaultTexture":0},"neck_thikness":{"defaultItem":0,"item":-4.69999999999999,"defaultTexture":0},"cheek_3":{"defaultItem":0,"item":2.3,"defaultTexture":0},"ageing":{"defaultItem":-1,"item":0,"opacity":0.07,"defaultTexture":0,"highlight":0,"texture":0},"complexion":{"defaultItem":0,"item":8,"opacity":0.23,"defaultTexture":0,"highlight":0,"texture":0},"nose_3":{"defaultItem":0,"item":-4.2,"defaultTexture":0},"cheek_1":{"defaultItem":0,"item":3.0,"defaultTexture":0},"shoes":{"defaultItem":1,"defaultTexture":0,"item":10,"texture":0},"vest":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"hair":{"defaultItem":0,"item":16,"defaultTexture":0,"style":0,"highlight":1,"texture":1},"chimp_bone_width":{"defaultItem":0,"item":4.0,"defaultTexture":0},"eyebrows":{"defaultItem":-1,"item":28,"opacity":0.45,"defaultTexture":1,"highlight":0,"texture":0},"moles":{"defaultItem":-1,"item":7,"opacity":0.19,"defaultTexture":0,"highlight":0,"texture":0},"cheek_2":{"defaultItem":0,"item":-3.4,"defaultTexture":0},"tattoos":[],"nose_1":{"defaultItem":0,"item":-3.0,"defaultTexture":0},"jaw_bone_width":{"defaultItem":0,"item":4.2,"defaultTexture":0},"sun_damage":{"defaultItem":0,"item":2,"opacity":0.24,"defaultTexture":0,"highlight":0,"texture":0},"chimp_bone_lenght":{"defaultItem":0,"item":-1.9,"defaultTexture":0},"face":{"defaultItem":0,"defaultTexture":0,"item":30,"texture":30}}', 'outfit-4-7446'),
	(27, 'JVH49125', 'pink camo', 'mp_f_freemode_01', '{"nose_0":{"item":0.0,"defaultItem":0,"defaultTexture":0},"cheek_1":{"item":3.89999985694885,"defaultItem":0,"defaultTexture":0},"eye_opening":{"item":4.6000000834465,"defaultItem":0,"defaultTexture":0},"face2":{"item":21,"defaultItem":0,"texture":21,"defaultTexture":0},"neck_thikness":{"item":0.0,"defaultItem":0,"defaultTexture":0},"chimp_hole":{"item":2.39999994635581,"defaultItem":0,"defaultTexture":0},"eye_color":{"item":65534,"defaultItem":-1,"texture":0,"defaultTexture":0},"jaw_bone_width":{"item":1.40000000596046,"defaultItem":0,"defaultTexture":0},"arms":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":13},"decals":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"shoes":{"defaultTexture":0,"defaultItem":1,"texture":0,"item":13},"skinDad":41,"bodyb":{"item":255,"opacity":1.0,"defaultTexture":0,"defaultItem":0,"highlight":0,"texture":0},"facemix":{"skinMix":0.53961312770843,"shapeMix":0.99000000953674},"torso2":{"defaultTexture":0,"defaultItem":0,"texture":12,"item":18},"watch":{"defaultTexture":0,"defaultItem":-1,"texture":0,"item":1},"tattoos":{"ZONE_RIGHT_ARM":[{"overlay":"MP_Christmas2017_Tattoo_017_M","collection":"mpchristmas2017_overlays"}]},"ageing":{"item":255,"opacity":0.15000000596046,"defaultTexture":0,"defaultItem":-1,"highlight":0,"texture":0},"lips_thickness":{"item":2.46873676776886,"defaultItem":0,"defaultTexture":0},"nose_2":{"item":-3.40000003576278,"defaultItem":0,"defaultTexture":0},"nose_5":{"item":4.00000005960464,"defaultItem":0,"defaultTexture":0},"lipstick":{"item":5,"opacity":0.4474287033081,"defaultTexture":1,"defaultItem":-1,"highlight":0,"texture":10},"nose_3":{"item":-1.89999997615814,"defaultItem":0,"defaultTexture":0},"mask":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":17},"skinMom":32,"pants":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":43},"face":{"item":8,"defaultItem":0,"texture":8,"defaultTexture":0},"eyebrown_high":{"item":3.60000014305114,"defaultItem":0,"defaultTexture":0},"eyebrown_forward":{"item":1.00000001490116,"defaultItem":0,"defaultTexture":0},"hat":{"defaultTexture":0,"defaultItem":-1,"texture":-1,"item":-1},"cheek_3":{"item":-2.30000004172325,"defaultItem":0,"defaultTexture":0},"hair":{"item":19,"highlight":1,"style":0,"defaultItem":0,"texture":61,"defaultTexture":0},"beard":{"item":255,"opacity":1.0,"defaultTexture":1,"defaultItem":-1,"highlight":0,"texture":0},"bag":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"chimp_bone_lowering":{"item":-4.00000005960464,"defaultItem":0,"defaultTexture":0},"chimp_bone_lenght":{"item":-0.3999999910593,"defaultItem":0,"defaultTexture":0},"sun_damage":{"item":7,"opacity":0.31999999284744,"defaultTexture":0,"defaultItem":0,"highlight":0,"texture":0},"bracelet":{"defaultTexture":0,"defaultItem":-1,"texture":-1,"item":-1},"nose_4":{"item":0.3999999910593,"defaultItem":0,"defaultTexture":0},"chimp_bone_width":{"item":3.89999985694885,"defaultItem":0,"defaultTexture":0},"accessory":{"defaultTexture":0,"defaultItem":0,"texture":2,"item":134},"t-shirt":{"defaultTexture":0,"defaultItem":1,"texture":0,"item":16},"complexion":{"item":255,"opacity":0.0,"defaultTexture":0,"defaultItem":0,"highlight":0,"texture":0},"moles":{"item":255,"opacity":0.0,"defaultTexture":0,"defaultItem":-1,"highlight":0,"texture":0},"ear":{"defaultTexture":0,"defaultItem":-1,"texture":-1,"item":-1},"cheek_2":{"item":1.50000005960464,"defaultItem":0,"defaultTexture":0},"eyebrows":{"item":12,"opacity":0.51541239023208,"defaultTexture":1,"defaultItem":-1,"highlight":0,"texture":3},"vest":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":37},"blush":{"item":1,"opacity":0.31146129965782,"defaultTexture":1,"defaultItem":-1,"highlight":0,"texture":52},"makeup":{"item":5,"opacity":0.43232119083404,"defaultTexture":1,"defaultItem":-1,"highlight":61,"texture":0},"jaw_bone_back_lenght":{"item":-4.00000005960464,"defaultItem":0,"defaultTexture":0},"glass":{"defaultTexture":-1,"defaultItem":-1,"texture":-1,"item":-1},"nose_1":{"item":1.80000007152557,"defaultItem":0,"defaultTexture":0},"chest":{"item":255,"opacity":1.0,"defaultTexture":0,"defaultItem":0,"highlight":0,"texture":0}}', 'outfit-5-6878'),
	(28, 'CTM94839', 'too', 'mp_m_freemode_01', '{"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":0.0},"bracelet":{"texture":-1,"defaultTexture":0,"item":-1,"defaultItem":-1},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":0.0},"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":0.0},"torso2":{"texture":0,"defaultTexture":0,"item":6,"defaultItem":0},"facemix":{"skinMix":0.5543029308319,"shapeMix":0.0},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":0.0},"tattoos":{"ZONE_RIGHT_LEG":[{"collection":"mpluxe2_overlays","overlay":"MP_LUXE_TAT_023_M"},{"collection":"mpsum2_overlays","overlay":"MP_Sum2_Tat_017_M"},{"collection":"mpgunrunning_overlays","overlay":"MP_Gunrunning_Tattoo_030_M"}],"ZONE_TORSO":[{"collection":"mpchristmas2_overlays","overlay":"MP_Xmas2_M_Tat_019"},{"collection":"mpheist4_overlays","overlay":"MP_Heist4_Tat_004_M"},{"collection":"mplowrider2_overlays","overlay":"MP_LR_Tat_016_M"},{"collection":"mplowrider_overlays","overlay":"MP_LR_Tat_004_M"},{"collection":"mplowrider_overlays","overlay":"MP_LR_Tat_013_M"},{"collection":"mpluxe2_overlays","overlay":"MP_LUXE_TAT_025_M"},{"collection":"mpsum2_overlays","overlay":"MP_Sum2_Tat_005_M"},{"collection":"mpsum2_overlays","overlay":"MP_Sum2_Tat_043_M"},{"collection":"mpbeach_overlays","overlay":"MP_Bea_M_Stom_000"},{"collection":"mpstunt_overlays","overlay":"MP_MP_Stunt_tat_034_M"},{"collection":"multiplayer_overlays","overlay":"FM_Tat_Award_M_005"}],"ZONE_RIGHT_ARM":[{"collection":"mpchristmas2017_overlays","overlay":"MP_Christmas2017_Tattoo_006_M"},{"collection":"mpchristmas2_overlays","overlay":"MP_Xmas2_M_Tat_008"},{"collection":"mpgunrunning_overlays","overlay":"MP_Gunrunning_Tattoo_002_M"}],"ZONE_LEFT_ARM":[{"collection":"mpgunrunning_overlays","overlay":"MP_Gunrunning_Tattoo_004_M"},{"collection":"mphipster_overlays","overlay":"FM_Hip_M_Tat_016"},{"collection":"mpsmuggler_overlays","overlay":"MP_Smuggler_Tattoo_014_M"},{"collection":"mpstunt_overlays","overlay":"MP_MP_Stunt_tat_002_M"}],"ZONE_LEFT_LEG":[{"collection":"mpstunt_overlays","overlay":"MP_MP_Stunt_tat_021_M"}],"ZONE_HEAD":[{"collection":"mpbeach_overlays","overlay":"MP_Bea_M_Neck_001"},{"collection":"mpbiker_overlays","overlay":"MP_MP_Biker_Tat_038_M"},{"collection":"mpbusiness_overlays","overlay":"MP_Buis_M_Neck_000"},{"collection":"mpheist3_overlays","overlay":"mpHeist3_Tat_005_M"},{"collection":"mpheist3_overlays","overlay":"mpHeist3_Tat_008_M"},{"collection":"mpheist3_overlays","overlay":"mpHeist3_Tat_010_M"},{"collection":"mpheist3_overlays","overlay":"mpHeist3_Tat_021_M"},{"collection":"mpheist3_overlays","overlay":"mpHeist3_Tat_022_M"},{"collection":"mpsum2_overlays","overlay":"MP_Sum2_Tat_022_M"},{"collection":"mpsum2_overlays","overlay":"MP_Sum2_Tat_023_M"}]},"decals":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"beard":{"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":3,"item":10,"opacity":0.99000000953674},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":0.0},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":0.0},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":0.0},"hair":{"defaultItem":0,"highlight":52,"defaultTexture":0,"style":0,"item":111,"texture":19},"nose_3":{"defaultItem":0,"defaultTexture":0,"item":0.0},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":0.0},"shoes":{"texture":6,"defaultTexture":0,"item":158,"defaultItem":1},"blush":{"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":0,"item":255,"opacity":1.0},"ageing":{"defaultItem":-1,"highlight":0,"defaultTexture":0,"texture":0,"item":255,"opacity":0.0},"lipstick":{"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":0,"item":255,"opacity":1.0},"skinMom":37,"ear":{"texture":-1,"defaultTexture":0,"item":-1,"defaultItem":-1},"glass":{"texture":-1,"defaultTexture":-1,"item":-1,"defaultItem":-1},"sun_damage":{"defaultItem":0,"highlight":0,"defaultTexture":0,"texture":0,"item":9,"opacity":0.49000000953674},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":0.0},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":0.0},"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":0.0},"makeup":{"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":0,"item":255,"opacity":1.0},"arms":{"texture":0,"defaultTexture":0,"item":33,"defaultItem":0},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":0.0},"hat":{"texture":-1,"defaultTexture":0,"item":-1,"defaultItem":-1},"face2":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"t-shirt":{"texture":0,"defaultTexture":0,"item":15,"defaultItem":1},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":0.0},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":0.0},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":0.0},"bag":{"texture":0,"defaultTexture":0,"item":121,"defaultItem":0},"pants":{"texture":0,"defaultTexture":0,"item":11,"defaultItem":0},"moles":{"defaultItem":-1,"highlight":0,"defaultTexture":0,"texture":0,"item":8,"opacity":0.52999997138977},"eyebrows":{"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":0,"item":15,"opacity":0.58999997377395},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":0.0},"skinDad":36,"watch":{"texture":-1,"defaultTexture":0,"item":-1,"defaultItem":-1},"face":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"vest":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"eye_color":{"texture":0,"defaultTexture":0,"item":1,"defaultItem":-1},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":0.0},"complexion":{"defaultItem":0,"highlight":0,"defaultTexture":0,"texture":0,"item":2,"opacity":0.62000000476837},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":0.0},"nose_0":{"defaultItem":0,"defaultTexture":0,"item":0.0},"accessory":{"texture":0,"defaultTexture":0,"item":13,"defaultItem":0},"bodyb":{"defaultItem":0,"highlight":0,"defaultTexture":0,"texture":0,"item":255,"opacity":1.0},"mask":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"chest":{"defaultItem":0,"highlight":0,"defaultTexture":0,"texture":0,"item":255,"opacity":1.0}}', 'outfit-10-9779'),
	(29, 'AIM07751', 'LSSO ', 'mp_m_freemode_01', '{"makeup":{"item":255,"opacity":1.0,"texture":0,"defaultTexture":1,"defaultItem":-1,"highlight":0},"glass":{"texture":0,"item":5,"defaultItem":-1,"defaultTexture":-1},"watch":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"accessory":{"texture":0,"item":8,"defaultItem":0,"defaultTexture":0},"chimp_hole":{"item":2.19999998807907,"defaultItem":0,"defaultTexture":0},"cheek_1":{"item":-5.88590681552887,"defaultItem":0,"defaultTexture":0},"torso2":{"texture":0,"item":256,"defaultItem":0,"defaultTexture":0},"cheek_2":{"item":7.15329468250274,"defaultItem":0,"defaultTexture":0},"facemix":{"skinMix":0.15000000596046,"shapeMix":0.59333330392837},"ageing":{"item":14,"opacity":0.99000000953674,"texture":0,"defaultTexture":0,"defaultItem":-1,"highlight":0},"shoes":{"texture":0,"item":119,"defaultItem":1,"defaultTexture":0},"nose_3":{"item":-3.40000003576278,"defaultItem":0,"defaultTexture":0},"moles":{"item":4,"opacity":0.33000001311302,"texture":0,"defaultTexture":0,"defaultItem":-1,"highlight":0},"eye_opening":{"item":0.67022621631622,"defaultItem":0,"defaultTexture":0},"blush":{"item":255,"opacity":1.0,"texture":0,"defaultTexture":1,"defaultItem":-1,"highlight":0},"pants":{"texture":2,"item":126,"defaultItem":0,"defaultTexture":0},"decals":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"eyebrown_high":{"item":2.38724187016487,"defaultItem":0,"defaultTexture":0},"cheek_3":{"item":-6.06575787067413,"defaultItem":0,"defaultTexture":0},"tattoos":[],"nose_1":{"item":-0.19999999552965,"defaultItem":0,"defaultTexture":0},"nose_5":{"item":2.00000002980232,"defaultItem":0,"defaultTexture":0},"nose_4":{"item":-0.90000003576278,"defaultItem":0,"defaultTexture":0},"sun_damage":{"item":255,"opacity":1.0,"texture":0,"defaultTexture":0,"defaultItem":0,"highlight":0},"face2":{"texture":28,"item":28,"defaultItem":0,"defaultTexture":0},"ear":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"lipstick":{"item":255,"opacity":0.15000000596046,"texture":0,"defaultTexture":1,"defaultItem":-1,"highlight":0},"mask":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"hair":{"item":91,"style":0,"texture":28,"defaultTexture":0,"defaultItem":0,"highlight":29},"vest":{"texture":1,"item":7,"defaultItem":0,"defaultTexture":0},"chimp_bone_width":{"item":3.30000013113021,"defaultItem":0,"defaultTexture":0},"arms":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"beard":{"item":255,"opacity":0.75,"texture":0,"defaultTexture":1,"defaultItem":-1,"highlight":0},"eyebrown_forward":{"item":0.94843335449695,"defaultItem":0,"defaultTexture":0},"t-shirt":{"texture":0,"item":163,"defaultItem":1,"defaultTexture":0},"skinMom":0,"nose_2":{"item":1.89999997615814,"defaultItem":0,"defaultTexture":0},"bracelet":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"bag":{"texture":1,"item":10,"defaultItem":0,"defaultTexture":0},"chimp_bone_lenght":{"item":1.89999997615814,"defaultItem":0,"defaultTexture":0},"hat":{"texture":0,"item":13,"defaultItem":-1,"defaultTexture":0},"jaw_bone_width":{"item":-2.82843887805938,"defaultItem":0,"defaultTexture":0},"lips_thickness":{"item":-10.0,"defaultItem":0,"defaultTexture":0},"skinDad":6,"eyebrows":{"item":17,"opacity":0.6249417066574,"texture":1,"defaultTexture":1,"defaultItem":-1,"highlight":0},"face":{"texture":13,"item":13,"defaultItem":0,"defaultTexture":0},"complexion":{"item":255,"opacity":0.75,"texture":0,"defaultTexture":0,"defaultItem":0,"highlight":0},"eye_color":{"texture":0,"item":11,"defaultItem":-1,"defaultTexture":0},"chimp_bone_lowering":{"item":-2.00000002980232,"defaultItem":0,"defaultTexture":0},"bodyb":{"item":255,"opacity":1.0,"texture":0,"defaultTexture":0,"defaultItem":0,"highlight":0},"chest":{"item":255,"opacity":1.0,"texture":0,"defaultTexture":0,"defaultItem":0,"highlight":0},"jaw_bone_back_lenght":{"item":6.97344362735748,"defaultItem":0,"defaultTexture":0},"nose_0":{"item":0.0,"defaultItem":0,"defaultTexture":0},"neck_thikness":{"item":9.58128452301025,"defaultItem":0,"defaultTexture":0}}', 'outfit-5-9090'),
	(30, 'AIM07751', 'Game warden', 'mp_m_freemode_01', '{"makeup":{"item":255,"opacity":1.0,"texture":0,"defaultTexture":1,"defaultItem":-1,"highlight":0},"glass":{"texture":0,"item":5,"defaultItem":-1,"defaultTexture":-1},"watch":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"accessory":{"texture":0,"item":8,"defaultItem":0,"defaultTexture":0},"chimp_hole":{"item":2.19999998807907,"defaultItem":0,"defaultTexture":0},"cheek_1":{"item":-5.88590681552887,"defaultItem":0,"defaultTexture":0},"torso2":{"texture":18,"item":304,"defaultItem":0,"defaultTexture":0},"cheek_2":{"item":7.15329468250274,"defaultItem":0,"defaultTexture":0},"facemix":{"skinMix":0.15000000596046,"shapeMix":0.59333330392837},"ageing":{"item":14,"opacity":0.99000000953674,"texture":0,"defaultTexture":0,"defaultItem":-1,"highlight":0},"shoes":{"texture":0,"item":119,"defaultItem":1,"defaultTexture":0},"nose_3":{"item":-3.40000003576278,"defaultItem":0,"defaultTexture":0},"moles":{"item":4,"opacity":0.33000001311302,"texture":0,"defaultTexture":0,"defaultItem":-1,"highlight":0},"eye_opening":{"item":0.67022621631622,"defaultItem":0,"defaultTexture":0},"blush":{"item":255,"opacity":1.0,"texture":0,"defaultTexture":1,"defaultItem":-1,"highlight":0},"pants":{"texture":6,"item":126,"defaultItem":0,"defaultTexture":0},"decals":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"eyebrown_high":{"item":2.38724187016487,"defaultItem":0,"defaultTexture":0},"cheek_3":{"item":-6.06575787067413,"defaultItem":0,"defaultTexture":0},"tattoos":[],"nose_1":{"item":-0.19999999552965,"defaultItem":0,"defaultTexture":0},"nose_5":{"item":2.00000002980232,"defaultItem":0,"defaultTexture":0},"nose_4":{"item":-0.90000003576278,"defaultItem":0,"defaultTexture":0},"sun_damage":{"item":255,"opacity":1.0,"texture":0,"defaultTexture":0,"defaultItem":0,"highlight":0},"face2":{"texture":28,"item":28,"defaultItem":0,"defaultTexture":0},"ear":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"lipstick":{"item":255,"opacity":0.15000000596046,"texture":0,"defaultTexture":1,"defaultItem":-1,"highlight":0},"mask":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"hair":{"item":91,"style":0,"texture":28,"defaultTexture":0,"defaultItem":0,"highlight":29},"vest":{"texture":3,"item":42,"defaultItem":0,"defaultTexture":0},"chimp_bone_width":{"item":3.30000013113021,"defaultItem":0,"defaultTexture":0},"arms":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"beard":{"item":255,"opacity":0.75,"texture":0,"defaultTexture":1,"defaultItem":-1,"highlight":0},"eyebrown_forward":{"item":0.94843335449695,"defaultItem":0,"defaultTexture":0},"t-shirt":{"texture":0,"item":89,"defaultItem":1,"defaultTexture":0},"skinMom":0,"nose_2":{"item":1.89999997615814,"defaultItem":0,"defaultTexture":0},"bracelet":{"texture":-1,"item":-1,"defaultItem":-1,"defaultTexture":0},"bag":{"texture":15,"item":83,"defaultItem":0,"defaultTexture":0},"chimp_bone_lenght":{"item":1.89999997615814,"defaultItem":0,"defaultTexture":0},"hat":{"texture":9,"item":201,"defaultItem":-1,"defaultTexture":0},"jaw_bone_width":{"item":-2.82843887805938,"defaultItem":0,"defaultTexture":0},"lips_thickness":{"item":-10.0,"defaultItem":0,"defaultTexture":0},"skinDad":6,"eyebrows":{"item":17,"opacity":0.6249417066574,"texture":1,"defaultTexture":1,"defaultItem":-1,"highlight":0},"face":{"texture":13,"item":13,"defaultItem":0,"defaultTexture":0},"complexion":{"item":255,"opacity":0.75,"texture":0,"defaultTexture":0,"defaultItem":0,"highlight":0},"eye_color":{"texture":0,"item":11,"defaultItem":-1,"defaultTexture":0},"chimp_bone_lowering":{"item":-2.00000002980232,"defaultItem":0,"defaultTexture":0},"bodyb":{"item":255,"opacity":1.0,"texture":0,"defaultTexture":0,"defaultItem":0,"highlight":0},"chest":{"item":255,"opacity":1.0,"texture":0,"defaultTexture":0,"defaultItem":0,"highlight":0},"jaw_bone_back_lenght":{"item":6.97344362735748,"defaultItem":0,"defaultTexture":0},"nose_0":{"item":0.0,"defaultItem":0,"defaultTexture":0},"neck_thikness":{"item":9.58128452301025,"defaultItem":0,"defaultTexture":0}}', 'outfit-4-8331'),
	(31, 'AIM07751', 'lspd', 'mp_m_freemode_01', '{"arms":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0.0},"ageing":{"highlight":0,"defaultTexture":0,"opacity":0.99000000953674,"item":14,"defaultItem":-1,"texture":0},"watch":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":6.97344362735748},"skinDad":6,"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":3.30000013113021},"eye_color":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":11},"hair":{"highlight":29,"defaultTexture":0,"style":0,"item":91,"defaultItem":0,"texture":28},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":1.89999997615814},"t-shirt":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":89},"hat":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":94},"eyebrows":{"highlight":0,"defaultTexture":1,"opacity":0.6249417066574,"item":17,"defaultItem":-1,"texture":1},"bag":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":71},"skinMom":0,"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":2.19999998807907},"bodyb":{"highlight":0,"defaultTexture":0,"opacity":1.0,"item":255,"defaultItem":0,"texture":0},"face":{"texture":13,"defaultTexture":0,"defaultItem":0,"item":13},"blush":{"highlight":0,"defaultTexture":1,"opacity":1.0,"item":255,"defaultItem":-1,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":-2.00000002980232},"complexion":{"highlight":0,"defaultTexture":0,"opacity":0.75,"item":255,"defaultItem":0,"texture":0},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":-0.19999999552965},"tattoos":[],"nose_4":{"defaultTexture":0,"defaultItem":0,"item":-0.90000003576278},"beard":{"highlight":0,"defaultTexture":1,"opacity":0.75,"item":255,"defaultItem":-1,"texture":0},"makeup":{"highlight":0,"defaultTexture":1,"opacity":1.0,"item":255,"defaultItem":-1,"texture":0},"mask":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"bracelet":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"chest":{"highlight":0,"defaultTexture":0,"opacity":1.0,"item":255,"defaultItem":0,"texture":0},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":9.58128452301025},"accessory":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":8},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":1.89999997615814},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":0.67022621631622},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":-6.06575787067413},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":7.15329468250274},"sun_damage":{"highlight":0,"defaultTexture":0,"opacity":1.0,"item":255,"defaultItem":0,"texture":0},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":-5.88590681552887},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":-10.0},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":0.94843335449695},"pants":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":153},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":2.38724187016487},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":-3.40000003576278},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":-2.82843887805938},"torso2":{"texture":1,"defaultTexture":0,"defaultItem":0,"item":301},"face2":{"texture":28,"defaultTexture":0,"defaultItem":0,"item":28},"shoes":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":119},"ear":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"lipstick":{"highlight":0,"defaultTexture":1,"opacity":0.15000000596046,"item":255,"defaultItem":-1,"texture":0},"vest":{"texture":1,"defaultTexture":0,"defaultItem":0,"item":109},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":2.00000002980232},"decals":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"glass":{"texture":0,"defaultTexture":-1,"defaultItem":-1,"item":5},"moles":{"highlight":0,"defaultTexture":0,"opacity":0.33000001311302,"item":4,"defaultItem":-1,"texture":0},"facemix":{"skinMix":0.15000000596046,"shapeMix":0.59333330392837}}', 'outfit-6-5272'),
	(32, 'AIM07751', 'usm1', 'mp_m_freemode_01', '{"lipstick":{"highlight":0,"defaultTexture":1,"opacity":0.15000000596046,"item":255,"defaultItem":-1,"texture":0},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0.0},"ageing":{"highlight":0,"defaultTexture":0,"opacity":0.99000000953674,"item":14,"defaultItem":-1,"texture":0},"watch":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":6.97344362735748},"skinDad":6,"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":3.30000013113021},"eye_color":{"item":11,"defaultTexture":0,"defaultItem":-1,"texture":0},"hair":{"highlight":29,"defaultTexture":0,"style":0,"item":91,"defaultItem":0,"texture":28},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":1.89999997615814},"t-shirt":{"item":166,"defaultTexture":0,"defaultItem":1,"texture":12},"hat":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":-10.0},"bag":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"bracelet":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":2.19999998807907},"bodyb":{"highlight":0,"defaultTexture":0,"opacity":1.0,"item":255,"defaultItem":0,"texture":0},"face":{"item":13,"defaultTexture":0,"defaultItem":0,"texture":13},"blush":{"highlight":0,"defaultTexture":1,"opacity":1.0,"item":255,"defaultItem":-1,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":-2.00000002980232},"sun_damage":{"highlight":0,"defaultTexture":0,"opacity":1.0,"item":255,"defaultItem":0,"texture":0},"torso2":{"item":423,"defaultTexture":0,"defaultItem":0,"texture":7},"tattoos":[],"nose_4":{"defaultTexture":0,"defaultItem":0,"item":-0.90000003576278},"beard":{"highlight":0,"defaultTexture":1,"opacity":0.75,"item":255,"defaultItem":-1,"texture":0},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":-0.19999999552965},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":-3.40000003576278},"complexion":{"highlight":0,"defaultTexture":0,"opacity":0.75,"item":255,"defaultItem":0,"texture":0},"chest":{"highlight":0,"defaultTexture":0,"opacity":1.0,"item":255,"defaultItem":0,"texture":0},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":9.58128452301025},"accessory":{"item":8,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":1.89999997615814},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":0.67022621631622},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":-6.06575787067413},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":7.15329468250274},"mask":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrows":{"highlight":0,"defaultTexture":1,"opacity":0.6249417066574,"item":17,"defaultItem":-1,"texture":1},"arms":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":0.94843335449695},"pants":{"item":153,"defaultTexture":0,"defaultItem":0,"texture":0},"skinMom":0,"moles":{"highlight":0,"defaultTexture":0,"opacity":0.33000001311302,"item":4,"defaultItem":-1,"texture":0},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":-2.82843887805938},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":2.38724187016487},"face2":{"item":28,"defaultTexture":0,"defaultItem":0,"texture":28},"shoes":{"item":119,"defaultTexture":0,"defaultItem":1,"texture":0},"ear":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"vest":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":2.00000002980232},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":-5.88590681552887},"decals":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"glass":{"item":5,"defaultTexture":-1,"defaultItem":-1,"texture":0},"makeup":{"highlight":0,"defaultTexture":1,"opacity":1.0,"item":255,"defaultItem":-1,"texture":0},"facemix":{"skinMix":0.15000000596046,"shapeMix":0.59333330392837}}', 'outfit-3-7557'),
	(33, 'QNC46912', 'White Shirt', 'mp_m_freemode_01', '{"skinDad":19,"tattoos":[],"arms":{"item":1,"defaultTexture":0,"defaultItem":0,"texture":0},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":-10.0},"t-shirt":{"item":241,"defaultTexture":0,"defaultItem":1,"texture":0},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":4.63538020849227},"hair":{"highlight":26,"item":152,"defaultItem":0,"defaultTexture":0,"style":0,"texture":61},"vest":{"item":1,"defaultTexture":0,"defaultItem":0,"texture":1},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":1.09999999403953},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":2.29731634259223},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":0.58030068874359},"eyebrows":{"highlight":0,"opacity":0.99000000953674,"defaultItem":-1,"texture":0,"item":12,"defaultTexture":1},"sun_damage":{"highlight":0,"opacity":0.62999999523162,"defaultItem":0,"texture":0,"item":3,"defaultTexture":0},"blush":{"highlight":0,"opacity":1.0,"defaultItem":-1,"texture":0,"item":255,"defaultTexture":1},"facemix":{"shapeMix":0.57753086090087,"skinMix":0.99000000953674},"accessory":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":4.9950823187828},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":-4.49999988079071},"lipstick":{"highlight":0,"opacity":1.0,"defaultItem":-1,"texture":0,"item":255,"defaultTexture":1},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":-4.17732179164886},"pants":{"item":244,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":9.85106110572815},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":0.0},"face":{"item":5,"defaultTexture":0,"defaultItem":0,"texture":5},"torso2":{"item":311,"defaultTexture":0,"defaultItem":0,"texture":2},"moles":{"highlight":0,"opacity":0.63999998569488,"defaultItem":-1,"texture":0,"item":8,"defaultTexture":0},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":7.14486420154571},"ear":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":4.36560362577438},"shoes":{"item":119,"defaultTexture":0,"defaultItem":1,"texture":0},"skinMom":11,"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":10.0},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":-10.0},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":-5.80441176891326},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":2.74694383144378},"bag":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"face2":{"item":26,"defaultTexture":0,"defaultItem":0,"texture":26},"makeup":{"highlight":0,"opacity":1.0,"defaultItem":-1,"texture":0,"item":255,"defaultTexture":1},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":4.9950823187828},"watch":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"complexion":{"highlight":0,"opacity":0.63999998569488,"defaultItem":0,"texture":0,"item":10,"defaultTexture":0},"mask":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eye_color":{"item":17,"defaultTexture":0,"defaultItem":-1,"texture":0},"glass":{"item":12,"defaultTexture":-1,"defaultItem":-1,"texture":0},"ageing":{"highlight":0,"opacity":0.34999999403953,"defaultItem":-1,"texture":0,"item":7,"defaultTexture":0},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":10.0},"chest":{"highlight":0,"opacity":1.0,"defaultItem":0,"texture":0,"item":255,"defaultTexture":0},"hat":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"bodyb":{"highlight":0,"opacity":1.0,"defaultItem":0,"texture":0,"item":255,"defaultTexture":0},"decals":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":8.68202865123748},"bracelet":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":-1},"beard":{"highlight":0,"opacity":0.99000000953674,"defaultItem":-1,"texture":61,"item":10,"defaultTexture":1},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":10.0}}', 'outfit-4-9668'),
	(34, 'ENW45444', 'Starting Outfit', 'mp_m_freemode_01', '{"skinDad":6,"tattoos":[],"arms":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"cheek_1":{"item":-1.56948152311367,"defaultItem":0,"defaultTexture":0},"t-shirt":{"item":15,"texture":0,"defaultItem":1,"defaultTexture":0},"cheek_2":{"item":-0.31052409723198,"defaultItem":0,"defaultTexture":0},"hair":{"highlight":27,"item":150,"defaultItem":0,"texture":7,"style":0,"defaultTexture":0},"shoes":{"item":253,"texture":8,"defaultItem":1,"defaultTexture":0},"lips_thickness":{"item":1.3,"defaultItem":0,"defaultTexture":0},"chest":{"highlight":0,"opacity":0.81378530279612,"defaultItem":0,"texture":5,"item":3,"defaultTexture":0},"nose_4":{"item":-0.40888014612898,"defaultItem":0,"defaultTexture":0},"eyebrows":{"highlight":0,"opacity":0.54562737108332,"defaultItem":-1,"texture":5,"item":9,"defaultTexture":1},"chimp_hole":{"item":3.5,"defaultItem":0,"defaultTexture":0},"facemix":{"shapeMix":0.80356060304655,"skinMix":0.18305683706008},"nose_5":{"item":0.0491780244485,"defaultItem":0,"defaultTexture":0},"jaw_bone_width":{"item":3.55627371083321,"defaultItem":0,"defaultTexture":0},"ageing":{"highlight":0,"opacity":0.14,"defaultItem":-1,"texture":0,"item":11,"defaultTexture":0},"eyebrown_high":{"item":-0.3,"defaultItem":0,"defaultTexture":0},"bag":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"moles":{"highlight":0,"opacity":0.37,"defaultItem":-1,"texture":0,"item":16,"defaultTexture":0},"nose_2":{"item":4.89672614865814,"defaultItem":0,"defaultTexture":0},"face":{"item":44,"texture":44,"defaultItem":0,"defaultTexture":0},"chimp_bone_width":{"item":1.12828438948995,"defaultItem":0,"defaultTexture":0},"chimp_bone_lenght":{"item":2.83686946747224,"defaultItem":0,"defaultTexture":0},"skinMom":29,"eye_opening":{"item":0.1,"defaultItem":0,"defaultTexture":0},"eyebrown_forward":{"item":3.1,"defaultItem":0,"defaultTexture":0},"nose_1":{"item":1.92918364479415,"defaultItem":0,"defaultTexture":0},"watch":{"item":25,"texture":0,"defaultItem":-1,"defaultTexture":0},"sun_damage":{"highlight":0,"opacity":0.79,"defaultItem":0,"texture":0,"item":7,"defaultTexture":0},"face2":{"item":40,"texture":40,"defaultItem":0,"defaultTexture":0},"vest":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"eye_color":{"item":4,"texture":0,"defaultItem":-1,"defaultTexture":0},"nose_0":{"item":0.58873120696922,"defaultItem":0,"defaultTexture":0},"complexion":{"highlight":0,"opacity":0.47,"defaultItem":0,"texture":0,"item":1,"defaultTexture":0},"mask":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"cheek_3":{"item":2.56709287621188,"defaultItem":0,"defaultTexture":0},"nose_3":{"item":4.18575242377406,"defaultItem":0,"defaultTexture":0},"chimp_bone_lowering":{"item":1.7577631024308,"defaultItem":0,"defaultTexture":0},"neck_thikness":{"item":9.67120977940143,"defaultItem":0,"defaultTexture":0},"pants":{"item":297,"texture":0,"defaultItem":0,"defaultTexture":0},"accessory":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"glass":{"item":23,"texture":3,"defaultItem":-1,"defaultTexture":-1},"bracelet":{"item":16,"texture":0,"defaultItem":-1,"defaultTexture":0},"torso2":{"item":488,"texture":3,"defaultItem":0,"defaultTexture":0},"jaw_bone_back_lenght":{"item":-0.22059856681185,"defaultItem":0,"defaultTexture":0},"beard":{"highlight":0,"opacity":0.9044302374596,"defaultItem":-1,"texture":6,"item":17,"defaultTexture":1},"decals":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0}}', 'outfit-1-8700'),
	(35, 'AXW11242', 'Starting Outfit', 'mp_m_freemode_01', '{"accessory":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"skinDad":9,"bag":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"eye_color":{"item":1,"defaultTexture":0,"defaultItem":-1,"texture":0},"face2":{"item":29,"defaultTexture":0,"defaultItem":0,"texture":29},"lips_thickness":{"item":-4.4,"defaultTexture":0,"defaultItem":0},"complexion":{"item":2,"defaultTexture":0,"defaultItem":0,"texture":0,"highlight":0,"opacity":0.51},"chimp_bone_width":{"item":-2.2,"defaultTexture":0,"defaultItem":0},"vest":{"item":5,"texture":0,"defaultItem":0,"defaultTexture":0},"facemix":{"shapeMix":0.82921219712525,"skinMix":0.37415273748793},"skinMom":32,"eye_opening":{"item":-4.1,"defaultTexture":0,"defaultItem":0},"nose_5":{"item":2.7,"defaultTexture":0,"defaultItem":0},"t-shirt":{"item":15,"texture":0,"defaultItem":1,"defaultTexture":0},"face":{"item":31,"defaultTexture":0,"defaultItem":0,"texture":31},"pants":{"item":17,"texture":0,"defaultItem":0,"defaultTexture":0},"tattoos":[],"eyebrows":{"item":26,"defaultTexture":1,"defaultItem":-1,"texture":0,"highlight":0,"opacity":0.0},"chimp_bone_lenght":{"item":-4.4,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":0.7,"defaultTexture":0,"defaultItem":0},"sun_damage":{"item":8,"defaultTexture":0,"defaultItem":0,"texture":0,"highlight":0,"opacity":0.14},"chimp_hole":{"item":0.2,"defaultTexture":0,"defaultItem":0},"cheek_2":{"item":1.3,"defaultTexture":0,"defaultItem":0},"arms":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"jaw_bone_width":{"item":0.4,"defaultTexture":0,"defaultItem":0},"eyebrown_high":{"item":-0.1,"defaultTexture":0,"defaultItem":0},"jaw_bone_back_lenght":{"item":1.1,"defaultTexture":0,"defaultItem":0},"mask":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0},"chimp_bone_lowering":{"item":2.9,"defaultTexture":0,"defaultItem":0},"shoes":{"item":32,"texture":0,"defaultItem":1,"defaultTexture":0},"torso2":{"item":86,"texture":0,"defaultItem":0,"defaultTexture":0},"nose_2":{"item":4.8,"defaultTexture":0,"defaultItem":0},"eyebrown_forward":{"item":1.1,"defaultTexture":0,"defaultItem":0},"ageing":{"item":10,"defaultTexture":0,"defaultItem":-1,"texture":0,"highlight":0,"opacity":0.13},"cheek_3":{"item":4.2,"defaultTexture":0,"defaultItem":0},"cheek_1":{"item":-2.1,"defaultTexture":0,"defaultItem":0},"moles":{"item":13,"defaultTexture":0,"defaultItem":-1,"texture":0,"highlight":0,"opacity":0.78},"neck_thikness":{"item":2.3,"defaultTexture":0,"defaultItem":0},"nose_1":{"item":-3.59999999999999,"defaultTexture":0,"defaultItem":0},"hair":{"item":29,"defaultTexture":0,"defaultItem":0,"texture":1,"highlight":1,"style":0},"nose_3":{"item":5.0,"defaultTexture":0,"defaultItem":0},"decals":{"item":0,"texture":0,"defaultItem":0,"defaultTexture":0}}', 'outfit-7-3332'),
	(36, 'GYH61824', 'Starting Outfit', 'mp_f_freemode_01', '{"accessory":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"tattoos":[],"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":-6.88351809978485},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":-2.09999993443489},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":-4.09999996423721},"shoes":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":27},"glass":{"texture":-1,"defaultTexture":-1,"defaultItem":-1,"item":-1},"sun_damage":{"opacity":0.63999998569488,"defaultTexture":0,"highlight":0,"defaultItem":0,"texture":0,"item":-1},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":-0.04917802289128},"bodyb":{"opacity":1.0,"defaultTexture":0,"highlight":0,"defaultItem":0,"texture":0,"item":255},"bracelet":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":1.29999995231628},"t-shirt":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":15},"watch":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"vest":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"lipstick":{"opacity":0.49275115132331,"defaultTexture":1,"highlight":0,"defaultItem":-1,"texture":53,"item":3},"beard":{"opacity":1.0,"defaultTexture":1,"highlight":0,"defaultItem":-1,"texture":0,"item":255},"ageing":{"opacity":0.0,"defaultTexture":0,"highlight":0,"defaultItem":-1,"texture":0,"item":255},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":-4.90515679121017},"torso2":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"complexion":{"opacity":0.15000000596046,"defaultTexture":0,"highlight":0,"defaultItem":0,"texture":0,"item":-1},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":-3.10000002384185},"eyebrows":{"opacity":0.53429675102233,"defaultTexture":1,"highlight":0,"defaultItem":-1,"texture":3,"item":1},"mask":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":-0.31052410602569},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":-5.0},"facemix":{"shapeMix":0.90543210506439,"skinMix":0.99000000953674},"chest":{"opacity":1.0,"defaultTexture":0,"highlight":0,"defaultItem":0,"texture":0,"item":255},"decals":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"blush":{"opacity":0.35300689935684,"defaultTexture":1,"highlight":0,"defaultItem":-1,"texture":53,"item":1},"eye_color":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":3},"arms":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":-5.0},"pants":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":31},"moles":{"opacity":0.44999998807907,"defaultTexture":0,"highlight":0,"defaultItem":-1,"texture":0,"item":13},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":-4.69999998807907},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":4.00000005960464},"skinMom":29,"bag":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":-2.39999994635581},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":2.59999990463256},"makeup":{"opacity":0.79867781368554,"defaultTexture":1,"highlight":61,"defaultItem":-1,"texture":36,"item":1},"ear":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"hat":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":-0.59999998658895},"face":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"face2":{"texture":21,"defaultTexture":0,"defaultItem":0,"item":21},"skinDad":39,"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":0.90000003576278},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":2.65701830387115},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":-4.19999986886978},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":-4.09999996423721},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":-0.04074750468134},"hair":{"style":0,"defaultTexture":0,"highlight":36,"texture":37,"defaultItem":0,"item":2}}', 'outfit-10-5951'),
	(37, 'LOO91104', 'Starting Outfit', 'mp_m_freemode_01', '{"accessory":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"hat":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":-3.30000013113021},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":-1.92918364479415},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":8.95180553604046},"shoes":{"texture":1,"defaultTexture":0,"defaultItem":1,"item":150},"glass":{"texture":0,"defaultTexture":-1,"defaultItem":-1,"item":60},"sun_damage":{"opacity":0.18000000715255,"defaultItem":0,"highlight":0,"defaultTexture":0,"texture":0,"item":1},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":3.90754520893096},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":7.96262443065643},"bracelet":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"arms":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":11},"t-shirt":{"texture":0,"defaultTexture":0,"defaultItem":1,"item":15},"eye_color":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":4},"ageing":{"opacity":0.46000000834465,"defaultItem":-1,"highlight":0,"defaultTexture":0,"texture":0,"item":13},"moles":{"opacity":0.43999999761581,"defaultItem":-1,"highlight":0,"defaultTexture":0,"texture":0,"item":8},"ear":{"texture":-1,"defaultTexture":0,"defaultItem":-1,"item":-1},"vest":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":-0.09999999776482},"makeup":{"opacity":1.0,"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":0,"item":255},"complexion":{"opacity":0.11999999731779,"defaultItem":0,"highlight":0,"defaultTexture":0,"texture":0,"item":9},"eyebrows":{"opacity":0.80000001192092,"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":26,"item":5},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":-1.03835888206958},"tattoos":[],"lipstick":{"opacity":1.0,"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":0,"item":255},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":1.12828440964221},"blush":{"opacity":1.0,"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":0,"item":255},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":1.03835888206958},"decals":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":-0.22059855982661},"face2":{"texture":22,"defaultTexture":0,"defaultItem":0,"item":22},"facemix":{"skinMix":0.39580246806144,"shapeMix":0.99000000953674},"hair":{"defaultItem":0,"item":182,"highlight":27,"style":0,"texture":2,"defaultTexture":0},"chest":{"opacity":1.0,"defaultItem":0,"highlight":0,"defaultTexture":0,"texture":0,"item":255},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":0.31895462423563},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":4.81523126363754},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":-4.69999998807907},"beard":{"opacity":0.99,"defaultItem":-1,"highlight":0,"defaultTexture":1,"texture":2,"item":2},"bag":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":7.87269917099901},"watch":{"texture":0,"defaultTexture":0,"defaultItem":-1,"item":-1},"skinMom":0,"torso2":{"texture":1,"defaultTexture":0,"defaultItem":0,"item":206},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":8.68202865123748},"pants":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":164},"face":{"texture":14,"defaultTexture":0,"defaultItem":0,"item":14},"bodyb":{"opacity":1.0,"defaultItem":0,"highlight":0,"defaultTexture":0,"texture":0,"item":255},"skinDad":19,"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":10.0},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":10.0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":1.57791197299957},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":-4.54545454545454},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":-3.79999995231628},"mask":{"texture":0,"defaultTexture":0,"defaultItem":0,"item":0}}', 'outfit-4-3137');

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

-- Dumping structure for table worldisyours.player_transactions
CREATE TABLE IF NOT EXISTS `player_transactions` (
  `id` varchar(50) NOT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.player_transactions: ~6 rows (approximately)
INSERT INTO `player_transactions` (`id`, `isFrozen`, `transactions`) VALUES
	('AIM07751', 0, '[{"title":"Personal Account / AIM07751","time":1727140910,"trans_type":"withdraw","receiver":"Doc Test","issuer":"Doc Test","trans_id":"d17df9d0-4812-47a5-9c5c-6296bfa463eb","amount":10000,"message":"Doc Test has withdrawed $10000"},{"title":"Personal Account / AIM07751","trans_type":"withdraw","message":"Doc Test has withdrawed $25000","issuer":"Doc Test","receiver":"Doc Test","trans_id":"2dc049e0-49b6-4add-a76b-23534eec6e5b","amount":25000,"time":1726800241},{"title":"Personal Account / AIM07751","time":1726430770,"trans_type":"deposit","issuer":"Doc Test","message":"Doc Test has deposited $179000","trans_id":"0c7712ed-d464-4975-952f-4d0ab496ca19","amount":179000,"receiver":"Doc Test"},{"title":"Personal Account / AIM07751","time":1726430595,"trans_type":"deposit","issuer":"Doc Test","message":"Doc Test has deposited $180","trans_id":"9728d5b8-d384-42db-899c-aece140b76a6","amount":180,"receiver":"Doc Test"},{"title":"Personal Account / AIM07751","time":1726407095,"trans_type":"withdraw","issuer":"Doc Test","message":"Doc Test has withdrawed $3000","trans_id":"da02c0f6-2286-4c88-88a1-7406497f15a5","amount":3000,"receiver":"Doc Test"}]'),
	('ENW45444', 0, '[{"time":1728830295,"title":"Personal Account / ENW45444","receiver":"Shelby Lutz","issuer":"Shelby Lutz","trans_type":"withdraw","trans_id":"6384eaa0-54c2-4ad7-b3b4-18794fa82574","message":"Shelby Lutz has withdrawed $20000","amount":20000},{"time":1728827439,"title":"Personal Account / ENW45444","receiver":"Shelby Lutz","issuer":"Shelby Lutz","trans_type":"deposit","trans_id":"97bd82be-8de9-4e8d-8c39-15f0862e1bde","message":"Shelby Lutz has deposited $25000","amount":25000},{"trans_type":"withdraw","title":"Personal Account / ENW45444","receiver":"Shelby Lutz","issuer":"Shelby Lutz","time":1728773943,"trans_id":"e59e0456-d27e-4a93-a8af-77f4834adf7c","message":"Shelby Lutz has withdrawed $2500","amount":2500}]'),
	('LPI62642', 0, '[{"title":"Personal Account / LPI62642","trans_type":"deposit","time":1726859578,"trans_id":"6526cece-c9f3-439e-9530-c57f7badc403","message":"Ryan Rich has deposited $500","amount":500,"issuer":"Ryan Rich","receiver":"Ryan Rich"}]'),
	('OUV63962', 0, '[{"time":1726709704,"trans_type":"deposit","issuer":"SBDemon Test","title":"Personal Account / OUV63962","message":"SBDemon Test has deposited $18000000","amount":18000000,"receiver":"SBDemon Test","trans_id":"f7de7870-6d13-4757-a79a-ffa266e03229"},{"time":1726709682,"trans_type":"deposit","issuer":"SBDemon Test","title":"Personal Account / OUV63962","message":"SBDemon Test has deposited $2000000","amount":2000000,"receiver":"SBDemon Test","trans_id":"d1ea7be7-2503-40a6-aa22-6ace25cf8ba1"},{"title":"Personal Account / OUV63962","trans_type":"withdraw","issuer":"SBDemon Test","time":1726430790,"trans_id":"2a879e72-f1a6-4100-b562-3157694b131c","amount":150,"receiver":"SBDemon Test","message":"SBDemon Test has withdrawed $150"},{"title":"Personal Account / OUV63962","trans_type":"withdraw","issuer":"SBDemon Test","time":1726430784,"trans_id":"add6809e-eda2-4314-90e3-9c5fa546448b","amount":20294490,"receiver":"SBDemon Test","message":"SBDemon Test has withdrawed $20294490"},{"title":"Personal Account / OUV63962","trans_type":"deposit","issuer":"SBDemon Test","time":1726430769,"trans_id":"c0b226ea-736d-4ade-aeac-b77efd328f77","amount":51000,"receiver":"SBDemon Test","message":"SBDemon Test has deposited $51000"},{"title":"Personal Account / OUV63962","trans_type":"deposit","issuer":"SBDemon Test","time":1726430749,"trans_id":"ae07d966-ef0d-4237-9e4e-a0f281e4b842","amount":10121745,"receiver":"SBDemon Test","message":"SBDemon Test has deposited $10121745"},{"title":"Personal Account / OUV63962","trans_type":"deposit","issuer":"SBDemon Test","time":1726430736,"trans_id":"58b180a7-110a-4f8c-ba04-94c38cf98a6b","amount":50000,"receiver":"SBDemon Test","message":"SBDemon Test has deposited $50000"}]'),
	('QCD01130', 0, '[{"issuer":"Dave Dredd","amount":9000,"title":"Personal Account / QCD01130","time":1726098966,"receiver":"Dave Dredd","message":"Deposit","trans_id":"86a85105-db7a-4888-abaa-3661690ae6ee","trans_type":"deposit"}]'),
	('QNC46912', 0, '[{"receiver":"Andy Murphy","title":"Personal Account / QNC46912","amount":75000,"trans_id":"934b90a9-6e85-469a-8b1c-a8303405312c","message":"Andy Murphy has deposited $75000","time":1728760827,"issuer":"Andy Murphy","trans_type":"deposit"},{"receiver":"Andy Murphy","title":"Personal Account / QNC46912","trans_type":"deposit","time":1728583397,"message":"Andy Murphy has deposited $90000","issuer":"Andy Murphy","amount":90000,"trans_id":"278d63e4-b0f5-4207-957a-29a332e5ede6"}]');

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
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.player_vehicles: ~25 rows (approximately)
INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`, `damage`, `in_garage`, `garage_id`, `job_vehicle`, `job_vehicle_rank`, `gang_vehicle`, `gang_vehicle_rank`, `impound`, `impound_retrievable`, `impound_data`, `nickname`, `financed`, `finance_data`, `vehicletv`, `evidence`, `glovebox`, `trunk`, `parking`, `nosColour`, `traveldistance`, `noslevel`, `hasnitro`, `vinnumber`, `vinscratch`) VALUES
	(1, 'license:f90cd271ae404268c3728c7b32d31095b7092b5b', 'JLN55666', 'buffalo5', '165968051', '{"modRoof":-1,"modRightFender":-1,"modHydrolic":-1,"modOrnaments":-1,"modKit49":-1,"modTurbo":false,"modVanityPlate":-1,"modRearBumper":-1,"pearlescentColor":73,"plate":"SBDEMON","modSpeakers":-1,"modDoorSpeaker":-1,"wheels":1,"oilLevel":4.76596940834568,"modHood":-1,"modSpoilers":-1,"extras":[],"modFrontBumper":-1,"modGrille":-1,"engineHealth":993.7046216400761,"modKit47":-1,"tankHealth":999.2649192831461,"modAPlate":-1,"modEngineBlock":-1,"wheelWidth":0.0,"interiorColor":93,"neonEnabled":[false,false,false,false],"modCustomTiresR":false,"fuelLevel":63.54625877794252,"tyreSmokeColor":[255,255,255],"dashboardColor":134,"modTransmission":-1,"modSmokeEnabled":false,"dirtLevel":0.0,"modCustomTiresF":false,"modKit21":-1,"modKit17":-1,"modHorns":-1,"modXenon":false,"modFender":-1,"modTrunk":-1,"modPlateHolder":-1,"modTrimA":-1,"tireHealth":{"1":999.75,"2":1000.0,"3":1000.0,"0":1000.0},"modStruts":-1,"wheelColor":0,"modShifterLeavers":-1,"modSteeringWheel":-1,"modFrontWheels":-1,"xenonColor":255,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modBackWheels":-1,"modFrame":-1,"modTrimB":-1,"bodyHealth":995.2932781095246,"modDashboard":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"modWindows":-1,"wheelSize":0.0,"windowTint":-1,"liveryRoof":-1,"modBrakes":-1,"modTank":-1,"modEngine":-1,"modSeats":-1,"color1":64,"modKit19":-1,"modSuspension":-1,"modAerials":-1,"modExhaust":-1,"model":165968051,"color2":64,"neonColor":[255,0,255],"modArchCover":-1,"modLivery":-1,"modAirFilter":-1,"modSideSkirt":-1,"plateIndex":0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modArmor":-1,"modDial":-1}', 'SBDEMON', NULL, NULL, 64, 994, 995, 1, 0, NULL, '{"radiator":100,"axle":100,"brakes":100,"clutch":100,"fuel":100}', 0, 0, 0, 0, '{"deformation":[],"dirt":0.0383102223277}', 0, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '536USQ69', 0),
	(4, 'license:952ce5d8f57a50a73cdf2fd4889e9b8c1826f375', 'WFU61164', 'bati', '-114291515', '{"modFender":-1,"modFrame":-1,"modRightFender":-1,"color2":41,"plateIndex":3,"pearlescentColor":111,"modTrimA":-1,"modGrille":-1,"modKit47":-1,"modTransmission":-1,"modWindows":-1,"modCustomTiresR":false,"modEngine":-1,"model":-114291515,"modKit17":-1,"wheels":6,"xenonColor":255,"modEngineBlock":-1,"bodyHealth":1000.0592475178704,"modXenon":false,"neonColor":[255,0,255],"modAirFilter":-1,"extras":[],"modDial":-1,"liveryRoof":-1,"dirtLevel":4.76596940834568,"modTrimB":-1,"modHydrolic":-1,"modDashboard":-1,"windowTint":-1,"modTrunk":-1,"modTank":-1,"neonEnabled":[false,false,false,false],"modKit19":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSteeringWheel":-1,"modFrontBumper":-1,"modPlateHolder":-1,"modFrontWheels":-1,"modOrnaments":-1,"modLivery":-1,"wheelWidth":0.0,"interiorColor":0,"modArmor":-1,"modShifterLeavers":-1,"engineHealth":1000.0592475178704,"modCustomTiresF":false,"tyreSmokeColor":[255,255,255],"modSpeakers":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":true,"7":false,"0":false},"wheelColor":156,"modDoorSpeaker":-1,"modBackWheels":-1,"dashboardColor":0,"modSpoilers":-1,"modHood":-1,"color1":5,"modSideSkirt":-1,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"0":1000.0},"modSeats":-1,"modVanityPlate":-1,"modStruts":-1,"modTurbo":false,"modSmokeEnabled":false,"modRearBumper":-1,"modKit21":-1,"modKit49":-1,"modBrakes":-1,"oilLevel":4.76596940834568,"fuelLevel":100.08535757525947,"modHorns":-1,"modAerials":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modAPlate":-1,"tankHealth":1000.0592475178704,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelSize":0.0,"modExhaust":-1,"modArchCover":-1,"modSuspension":-1,"plate":"0DQ926VI","modRoof":-1}', '0DQ926VI', NULL, 'pillboxgarage', 100, 1000, 1000, 0, 0, NULL, NULL, 21600, 900, 24, 1430, '', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '195YKP55', 0),
	(5, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'AIM07751', 'ambulance', '1171614426', '{"modExhaust":-1,"oilLevel":7.94328234724281,"tankHealth":996.0876063442489,"modRearBumper":-1,"modXenon":false,"engineHealth":992.9102934053518,"modTrimA":-1,"modStruts":-1,"color2":28,"modCustomTiresF":false,"modTank":-1,"modBrakes":-1,"windowStatus":{"1":true,"2":true,"3":false,"4":false,"5":false,"6":true,"7":false,"0":true},"xenonColor":255,"pearlescentColor":112,"dirtLevel":0.0,"bodyHealth":984.967011058109,"modRightFender":-1,"wheelWidth":1.0,"modFrontWheels":-1,"modFrame":-1,"modHydrolic":-1,"modHood":-1,"liveryRoof":-1,"wheelSize":1.0,"wheelColor":156,"interiorColor":0,"modTrunk":-1,"modSpeakers":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"fuelLevel":98.4967011058109,"modTrimB":-1,"modDial":-1,"modEngineBlock":-1,"modKit17":-1,"neonColor":[255,0,255],"windowTint":-1,"modKit19":-1,"modKit49":-1,"modDoorSpeaker":-1,"modRoof":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modBackWheels":-1,"modDashboard":-1,"modVanityPlate":-1,"modAerials":-1,"model":1171614426,"modWindows":-1,"modArchCover":-1,"modFrontBumper":-1,"modOrnaments":-1,"modSpoilers":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modLivery":2,"modSteeringWheel":-1,"plateIndex":4,"modKit47":-1,"modKit21":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modShifterLeavers":-1,"modGrille":-1,"modAirFilter":-1,"modCustomTiresR":false,"dashboardColor":0,"modSideSkirt":-1,"color1":112,"modTurbo":false,"tyreSmokeColor":[255,255,255],"extras":{"1":true},"modTransmission":-1,"modSmokeEnabled":false,"modHorns":-1,"wheels":0,"modSuspension":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modFender":-1,"modEngine":-1,"plate":"24MBN641","modSeats":-1,"modArmor":-1,"modPlateHolder":-1}', '24MBN641', NULL, 'pillboxgarage', 99, 993, 986, 1, 0, NULL, '{"radiator":92,"fuel":88,"brakes":94,"clutch":92,"axle":94}', 0, 0, 0, 0, '{"deformation":[],"dirt":0.01594631560146}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"evtype":"carfingerprint","seat":1,"time":1724882961,"fingerprint":"Tb417Q82gdh1058","location":"Seat 1","plate":"24MBN641"},{"evtype":"carfingerprint","seat":1,"time":1724987153,"fingerprint":"Tb417Q82gdh1058","location":"Seat 1","plate":"24MBN641"}]', NULL, NULL, NULL, NULL, 0, 0, 0, '549EKO81', 0),
	(6, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'AIM07751', 'deathbike', '-27326686', '{"interiorColor":2,"modGrille":-1,"modKit19":-1,"modFrontBumper":-1,"modTank":-1,"modBackWheels":-1,"modSuspension":-1,"wheelSize":1.0,"oilLevel":5,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"liveryRoof":-1,"modArmor":-1,"modTrunk":-1,"modEngineBlock":-1,"modSpoilers":-1,"tankHealth":750,"modVanityPlate":-1,"modOrnaments":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"color2":120,"neonEnabled":[false,false,false,false],"modWindows":-1,"modXenon":false,"engineHealth":660,"modFender":-1,"modShifterLeavers":-1,"tyreSmokeColor":[255,255,255],"modAirFilter":-1,"modSteeringWheel":-1,"modDashboard":-1,"wheelColor":0,"modPlateHolder":-1,"modKit21":-1,"extras":[],"modEngine":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modDial":-1,"modRightFender":-1,"modSpeakers":-1,"modLivery":-1,"modSmokeEnabled":false,"modTrimB":-1,"modCustomTiresR":false,"modDrift":false,"modHorns":-1,"color1":0,"modSeats":-1,"modKit49":-1,"neonColor":[255,0,255],"modKit17":-1,"modTransmission":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"dashboardColor":156,"modBProofTires":false,"modSideSkirt":-1,"modDoorSpeaker":-1,"modCustomTiresF":false,"modKit47":-1,"modArchCover":-1,"modStruts":-1,"model":-27326686,"modTurbo":false,"bodyHealth":469,"modHydrolic":-1,"fuelLevel":84,"modAPlate":-1,"plate":"88FHR472","modExhaust":-1,"windowTint":-1,"modHood":-1,"modTrimA":-1,"modRoof":-1,"modRearBumper":-1,"plateIndex":0,"modFrame":-1,"modBrakes":-1,"modAerials":-1,"headlightColor":255,"dirtLevel":1,"wheelWidth":1.0,"pearlescentColor":7,"modFrontWheels":-1,"wheels":6}', '88FHR472', NULL, 'pillboxgarage', 84, 661, 470, 1, 0, NULL, '{"antiLag":0,"fuel":100.0,"underglow":0,"cylinderlevel":0,"harness":0,"axle":98.0,"shaftlevel":0,"oil":100.0,"oillevel":0,"carwax":0,"battery":100.0,"spark":100.0,"fuellevel":0,"cablelevel":0,"manual":0}', 0, 0, 0, 0, '{"deformation":[],"dirt":0.62079572677612}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"seat":1,"fingerprint":"Tb417Q82gdh1058","location":"Seat 1","time":1725552109,"evtype":"carfingerprint","plate":"88FHR472"},{"seat":1,"fingerprint":"Tb417Q82gdh1058","location":"Seat 1","time":1725507864,"evtype":"carfingerprint","plate":"88FHR472"},{"seat":1,"fingerprint":"Tb417Q82gdh1058","location":"Seat 1","time":1725581857,"evtype":"carfingerprint","plate":"88FHR472"}]', NULL, NULL, NULL, NULL, 6, 0, 0, '336QTO24', 0),
	(7, 'license:f90cd271ae404268c3728c7b32d31095b7092b5b', 'OUV63962', 'yosemite3', '67753863', '{"modFrame":-1,"modBProofTires":false,"dashboardColor":111,"modAPlate":-1,"modTurbo":false,"tyreSmokeColor":[255,255,255],"modSeats":-1,"headlightColor":255,"windowTint":-1,"modHorns":-1,"modKit47":-1,"modCustomTiresF":false,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modTrimB":-1,"plate":"8QC438FZ","modKit21":-1,"modFrontWheels":-1,"modDoorSpeaker":-1,"modDial":-1,"modDrift":false,"modBrakes":-1,"oilLevel":5,"modGrille":-1,"modKit49":-1,"modTrunk":-1,"modTransmission":-1,"modRearBumper":-1,"modDashboard":-1,"liveryRoof":-1,"wheels":4,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modRightFender":-1,"tankHealth":999,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"interiorColor":13,"model":67753863,"modRoof":-1,"modBackWheels":-1,"modFender":-1,"modAirFilter":-1,"modVanityPlate":-1,"fuelLevel":80,"modHood":-1,"modSmokeEnabled":false,"modWindows":-1,"wheelSize":1.0,"modKit19":-1,"modKit17":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTank":-1,"color2":1,"modEngine":-1,"bodyHealth":981,"wheelColor":0,"modEngineBlock":-1,"modLivery":-1,"modFrontBumper":-1,"modArchCover":-1,"modExhaust":-1,"modSideSkirt":-1,"modSteeringWheel":-1,"extras":[0,0,0],"engineHealth":984,"modCustomTiresR":false,"modAerials":-1,"plateIndex":0,"modHydrolic":-1,"modArmor":-1,"modOrnaments":-1,"neonEnabled":[false,false,false,false],"modXenon":false,"pearlescentColor":134,"dirtLevel":10,"modTrimA":-1,"modSpoilers":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"neonColor":[255,0,255],"modShifterLeavers":-1,"color1":56,"modSuspension":-1,"modSpeakers":-1,"modPlateHolder":-1,"wheelWidth":1.0,"modStruts":-1}', '8QC438FZ', NULL, 'pillboxgarage', 80, 984, 981, 0, 0, NULL, '{"underglow":0,"harness":0,"spark":100.0,"oil":95.0,"axle":98.0,"antiLag":0,"oillevel":0,"battery":100.0,"cylinderlevel":0,"fuellevel":0,"fuel":100.0,"carwax":0,"cablelevel":0,"manual":0,"shaftlevel":0}', 0, 0, 0, 0, '{"deformation":[],"dirt":9.23046684265136}', 0, 'North Vinewood Blvd', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"evtype":"carfingerprint","seat":1,"location":"Seat 1","fingerprint":"rj614I08Jed5366","time":1727365767,"plate":"8QC438FZ"}]', '[{"name":"car_registration","metadata":{"description":"Name: SBDemon Test   \\nPlate: 8QC438FZ   \\nModel: yosemite3"},"slot":1,"count":1},{"name":"insurance","metadata":{"description":"Name: SBDemon Test   \\nPlate: 8QC438FZ   \\nModel: yosemite3   \\nDate: 2024-09-19   \\nExpire: 2024-12-18"},"slot":2,"count":1}]', NULL, NULL, NULL, 19, 0, 0, '583GJR73', 0),
	(8, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'AIM07751', 'coquette', '108773431', '{"interiorColor":0,"oilLevel":7,"modAerials":-1,"modArchCover":-1,"modOrnaments":-1,"modLivery":-1,"modBProofTires":false,"modStruts":-1,"plate":"8KP019SA","modFrontWheels":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modVanityPlate":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modSteeringWheel":-1,"modTurbo":false,"modFender":-1,"modKit17":-1,"modTrimA":-1,"neonEnabled":[false,false,false,false],"modBrakes":-1,"modShifterLeavers":-1,"modSpoilers":-1,"modCustomTiresR":false,"modHorns":-1,"modDashboard":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"bodyHealth":999,"engineHealth":1000,"dirtLevel":0,"modSeats":-1,"windowTint":-1,"modKit21":-1,"wheelWidth":1.0,"modKit19":-1,"modRightFender":-1,"fuelLevel":94,"modAPlate":-1,"headlightColor":255,"modSuspension":-1,"modXenon":false,"modGrille":-1,"modSpeakers":-1,"modFrame":-1,"modTrimB":-1,"dashboardColor":0,"liveryRoof":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modBackWheels":-1,"modExhaust":-1,"modHydrolic":-1,"modKit47":-1,"modSideSkirt":-1,"modEngineBlock":-1,"modKit49":-1,"color1":111,"wheelSize":1.0,"tyreSmokeColor":[255,255,255],"modDial":-1,"neonColor":[255,0,255],"pearlescentColor":111,"modTank":-1,"modRearBumper":-1,"modDrift":false,"plateIndex":0,"modArmor":-1,"wheels":0,"model":108773431,"color2":111,"modCustomTiresF":false,"tankHealth":1000,"modDoorSpeaker":-1,"modPlateHolder":-1,"extras":{"1":0,"2":0,"10":0,"11":0},"wheelColor":156,"modAirFilter":-1,"modEngine":-1,"modFrontBumper":-1,"modTrunk":-1,"modSmokeEnabled":false,"modHood":-1,"modRoof":-1,"modWindows":-1,"modTransmission":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}}', '8KP019SA', NULL, 'pillboxgarage', 94, 1000, 999, 0, 0, NULL, '{"axle":95.0,"cablelevel":0,"antiLag":0,"manual":0,"carwax":0,"shaftlevel":0,"fuellevel":0,"oil":92.0,"cylinderlevel":0,"battery":97.0,"underglow":0,"spark":95.0,"harness":0,"fuel":92.0,"oillevel":0}', 0, 0, 0, 0, '{"dirt":0.14307503402233,"deformation":[]}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"time":1728786665,"evtype":"carfingerprint","seat":1,"fingerprint":"Tb417Q82gdh1058","plate":"8KP019SA","location":"Seat 1"}]', NULL, NULL, NULL, NULL, 18, 0, 0, '248VEI32', 0),
	(9, 'license:c5f1341b9e5627f52c1a19fd6d2a98c978e4681a', 'PUX10690', 'zentorno', '-1403128555', '{"modShifterLeavers":-1,"oilLevel":4.76596940834568,"plateIndex":0,"modRearBumper":-1,"modXenon":false,"engineHealth":1000.0592475178704,"modTrimA":-1,"modStruts":-1,"color2":41,"modCustomTiresF":false,"modTank":-1,"modBrakes":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":false,"0":true},"xenonColor":255,"pearlescentColor":7,"dirtLevel":0.0,"bodyHealth":1000.0592475178704,"modRightFender":-1,"wheelWidth":1.0,"modFrontWheels":-1,"modFrame":-1,"modHydrolic":-1,"modHood":-1,"liveryRoof":-1,"wheelSize":1.0,"wheelColor":156,"interiorColor":0,"modTrunk":-1,"modSpeakers":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"fuelLevel":100.08535757525947,"modTrimB":-1,"modDial":-1,"modEngineBlock":-1,"modKit17":-1,"neonColor":[255,0,255],"modVanityPlate":-1,"modKit19":-1,"modKit49":-1,"modDoorSpeaker":-1,"modRoof":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modBackWheels":-1,"modDashboard":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit47":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modWindows":-1,"color1":1,"modFrontBumper":-1,"windowTint":-1,"modSpoilers":-1,"wheels":7,"modLivery":-1,"modSteeringWheel":-1,"modPlateHolder":-1,"tankHealth":1000.0592475178704,"modKit21":-1,"extras":[],"modCustomTiresR":false,"modOrnaments":-1,"modArchCover":-1,"dashboardColor":0,"modAerials":-1,"modSideSkirt":-1,"model":-1403128555,"modTurbo":false,"tyreSmokeColor":[255,255,255],"modGrille":-1,"modTransmission":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modAirFilter":-1,"plate":"83RUF593","modSuspension":-1,"modHorns":-1,"modFender":-1,"modEngine":-1,"modExhaust":-1,"modSeats":-1,"modArmor":-1,"modSmokeEnabled":false}', '83RUF593', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, '{"radiator":100,"fuel":100,"brakes":100,"clutch":98,"axle":100}', 0, 0, 0, 0, '{"deformation":[],"dirt":0.00319930398836}', 0, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"fingerprint":"FN907O31cVa5973","evtype":"carfingerprint","location":"Seat 1","plate":"83RUF593","seat":1,"time":1726542185}]', NULL, NULL, NULL, NULL, 0, 0, 0, '467CFK75', 0),
	(10, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'AIM07751', 'avarus', '-2115793025', '{"modTank":-1,"modRoof":-1,"tyreSmokeColor":[255,255,255],"modStruts":-1,"modPlateHolder":-1,"modBrakes":-1,"modTransmission":-1,"modArmor":-1,"modSuspension":-1,"dirtLevel":3,"modRightFender":-1,"modBackWheels":-1,"modSteeringWheel":-1,"modTrimA":-1,"modAPlate":-1,"color2":142,"color1":145,"modExhaust":-1,"modArchCover":-1,"bodyHealth":1000,"model":-2115793025,"wheelSize":0.0,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modKit49":-1,"pearlescentColor":2,"modSmokeEnabled":false,"modXenon":false,"modDoorSpeaker":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modFender":-1,"modEngineBlock":-1,"modDial":-1,"windowTint":-1,"neonEnabled":[false,false,false,false],"modSpoilers":-1,"interiorColor":111,"modSideSkirt":-1,"modKit47":-1,"modRearBumper":-1,"wheelWidth":0.0,"modHorns":-1,"modFrontBumper":-1,"modFrontWheels":-1,"modTurbo":false,"modOrnaments":-1,"modSpeakers":-1,"modTrimB":-1,"modBProofTires":false,"modSeats":-1,"neonColor":[255,0,255],"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modKit21":-1,"modDashboard":-1,"modCustomTiresF":false,"modHydrolic":-1,"modKit19":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"liveryRoof":-1,"modDrift":false,"engineHealth":1000,"tankHealth":1000,"modEngine":-1,"plate":"41YUU517","modFrame":-1,"modGrille":-1,"wheelColor":111,"modAirFilter":-1,"modShifterLeavers":-1,"modWindows":-1,"oilLevel":5,"modLivery":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"headlightColor":255,"modCustomTiresR":false,"modTrunk":-1,"extras":[],"wheels":6,"dashboardColor":111,"modHood":-1,"fuelLevel":65,"modAerials":-1,"modKit17":-1,"plateIndex":0,"modVanityPlate":-1}', '41YUU517', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '239RQK28', 0),
	(11, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'AIM07751', 'dubsta3', '-1237253773', '{"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modArchCover":-1,"modGrille":-1,"modBrakes":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modStruts":-1,"modKit49":-1,"modHydrolic":-1,"modSteeringWheel":-1,"wheels":4,"tireHealth":{"1":999.5,"2":1000.0,"3":1000.0,"4":1000.0,"5":1000.0,"0":1000.0,"47":0.0,"45":0.0},"modTrimB":-1,"modSideSkirt":-1,"modTrunk":-1,"modArmor":-1,"modExhaust":-1,"modSpeakers":-1,"pearlescentColor":18,"modSeats":-1,"modTurbo":false,"modBProofTires":false,"modCustomTiresF":false,"engineHealth":1000,"model":-1237253773,"bodyHealth":999,"plateIndex":0,"modAirFilter":-1,"neonEnabled":[false,false,false,false],"headlightColor":255,"wheelSize":1.0,"modKit17":-1,"modDrift":false,"modEngine":-1,"modKit19":-1,"modFrontBumper":-1,"tankHealth":1000,"modEngineBlock":-1,"modDoorSpeaker":-1,"modShifterLeavers":-1,"interiorColor":0,"modRightFender":-1,"modFrontWheels":-1,"plate":"69TRM876","wheelColor":156,"modRearBumper":-1,"modDial":-1,"modKit47":-1,"modTrimA":-1,"modXenon":false,"modTransmission":-1,"oilLevel":8,"windowTint":-1,"dashboardColor":0,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modLivery":-1,"modAerials":-1,"modOrnaments":-1,"modSpoilers":-1,"wheelWidth":1.0,"liveryRoof":-1,"modSuspension":-1,"modHorns":-1,"tyreSmokeColor":[255,255,255],"modFrame":-1,"color2":1,"modTank":-1,"extras":[],"neonColor":[255,0,255],"modCustomTiresR":false,"modSmokeEnabled":false,"dirtLevel":1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modRoof":-1,"modFender":-1,"modVanityPlate":-1,"modPlateHolder":-1,"fuelLevel":98,"modHood":-1,"modBackWheels":-1,"modKit21":-1,"modDashboard":-1,"modAPlate":-1,"color1":1,"modWindows":-1}', '69TRM876', NULL, 'pillboxgarage', 98, 1000, 1000, 1, 0, NULL, '{"cylinderlevel":0,"antiLag":0,"spark":100.0,"harness":0,"manual":0,"carwax":0,"oillevel":0,"oil":100.0,"cablelevel":0,"battery":100.0,"shaftlevel":0,"underglow":0,"fuellevel":0,"axle":100.0,"fuel":100.0}', 0, 0, 0, 0, '{"dirt":1.4637085199356,"deformation":[]}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"seat":1,"fingerprint":"Tb417Q82gdh1058","time":1729081155,"location":"Seat 1","plate":"69TRM876","evtype":"carfingerprint"}]', NULL, NULL, NULL, NULL, 20, 0, 0, '480OWD70', 0),
	(13, 'license:53d63cef03bd84bee2778d19ae409b18c859187a', 'JVH49125', 'gauntlet', '-1800170043', '{"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modHood":-1,"color1":62,"modOrnaments":-1,"modLivery":-1,"wheelWidth":0.61308521032333,"modDrift":false,"windowTint":3,"modTank":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":false,"7":true,"0":true},"modSpeakers":-1,"pearlescentColor":28,"modCustomTiresR":false,"tankHealth":997,"modTrunk":-1,"modBProofTires":false,"modShifterLeavers":-1,"wheels":1,"modDoorSpeaker":-1,"modBrakes":-1,"liveryRoof":-1,"modDashboard":-1,"modWindows":-1,"modEngine":-1,"model":-1800170043,"dashboardColor":0,"extras":{"10":1,"11":1},"wheelSize":0.74400001764297,"modGrille":-1,"modKit49":-1,"plateIndex":0,"tyreSmokeColor":[255,255,255],"modKit47":-1,"headlightColor":255,"modFrontWheels":8,"modTransmission":-1,"modSpoilers":-1,"modHydrolic":-1,"modKit21":-1,"modSeats":-1,"modTurbo":false,"modPlateHolder":-1,"fuelLevel":37,"modFender":-1,"modArchCover":-1,"modFrame":-1,"neonColor":[255,0,255],"dirtLevel":9,"modRoof":-1,"color2":31,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRightFender":-1,"modAerials":-1,"modAirFilter":-1,"modSuspension":2,"tireHealth":{"1":979.678955078125,"2":999.75,"3":997.5,"4":0.0,"5":0.0,"0":994.480712890625,"47":0.0,"45":0.0},"modSideSkirt":-1,"modEngineBlock":-1,"modRearBumper":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modTrimA":-1,"modExhaust":-1,"plate":"03LOC875","modAPlate":-1,"modSteeringWheel":-1,"interiorColor":0,"modDial":-1,"modCustomTiresF":false,"neonEnabled":[false,false,false,false],"modKit17":-1,"modTrimB":-1,"engineHealth":965,"modStruts":-1,"bodyHealth":973,"oilLevel":5,"modKit19":-1,"wheelColor":31,"modHorns":-1,"modArmor":-1,"modVanityPlate":-1,"modSmokeEnabled":false,"modFrontBumper":-1,"modXenon":false,"modBackWheels":-1}', '03LOC875', NULL, NULL, 37, 966, 973, 1, 0, NULL, NULL, 0, 0, 0, 0, '{"deformation":[[{"x":0.0,"y":2.56481504440307,"z":0.0},0.07222723215818],[{"x":1.01429307460784,"y":2.56481504440307,"z":0.0},0.06772408634424]],"dirt":8.64081764221191}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '732LAK12', 0),
	(14, 'license:53d63cef03bd84bee2778d19ae409b18c859187a', 'JVH49125', 'flatbed', '1353720154', '{"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modHood":-1,"color1":45,"modOrnaments":-1,"modLivery":-1,"wheelWidth":0.0,"modDrift":false,"windowTint":-1,"modTank":-1,"windowStatus":{"1":true,"2":true,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"modSpeakers":-1,"pearlescentColor":35,"modCustomTiresR":false,"tankHealth":989,"modTrunk":-1,"modBProofTires":false,"modShifterLeavers":-1,"wheels":0,"modDoorSpeaker":-1,"modBrakes":-1,"liveryRoof":-1,"modDashboard":-1,"modWindows":-1,"modEngine":-1,"model":1353720154,"dashboardColor":0,"extras":[],"wheelSize":0.0,"modGrille":-1,"modKit49":-1,"plateIndex":0,"tyreSmokeColor":[255,255,255],"modKit47":-1,"headlightColor":255,"modFrontWheels":-1,"modTransmission":-1,"modSpoilers":-1,"modHydrolic":-1,"modKit21":-1,"modSeats":-1,"modTurbo":false,"modPlateHolder":-1,"fuelLevel":47,"modFender":-1,"modArchCover":-1,"modFrame":-1,"neonColor":[255,0,255],"dirtLevel":3,"modRoof":-1,"color2":40,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRightFender":-1,"modAerials":-1,"modAirFilter":-1,"modSuspension":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modSideSkirt":-1,"modEngineBlock":-1,"modRearBumper":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modTrimA":-1,"modExhaust":-1,"plate":"66XPG383","modAPlate":-1,"modSteeringWheel":-1,"interiorColor":0,"modDial":-1,"modCustomTiresF":false,"neonEnabled":[false,false,false,false],"modKit17":-1,"modTrimB":-1,"engineHealth":999,"modStruts":-1,"bodyHealth":966,"oilLevel":8,"modKit19":-1,"wheelColor":156,"modHorns":-1,"modArmor":-1,"modVanityPlate":-1,"modSmokeEnabled":false,"modFrontBumper":-1,"modXenon":false,"modBackWheels":-1}', '66XPG383', NULL, NULL, 47, 999, 966, 1, 0, NULL, NULL, 0, 0, 0, 0, '{"deformation":[[{"x":1.53542912006378,"y":5.26889467239379,"z":0.0},0.0722436606884]],"dirt":2.79104900360107}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '708TWL11', 0),
	(16, 'license:53d63cef03bd84bee2778d19ae409b18c859187a', 'JVH49125', 'avarus', '-2115793025', '{"modLivery":-1,"bodyHealth":990,"modFender":-1,"modSuspension":-1,"dashboardColor":111,"modXenon":false,"modRightFender":-1,"color2":142,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrunk":-1,"modGrille":-1,"modTrimB":-1,"modEngineBlock":-1,"modSteeringWheel":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"pearlescentColor":2,"modFrame":-1,"modCustomTiresR":false,"model":-2115793025,"modSmokeEnabled":false,"modKit49":-1,"modBrakes":-1,"modCustomTiresF":false,"wheelWidth":0.0,"modEngine":-1,"color1":145,"modBackWheels":-1,"modHood":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"tyreSmokeColor":[255,255,255],"modArchCover":-1,"modExhaust":-1,"windowTint":-1,"modSideSkirt":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modTrimA":-1,"modFrontWheels":-1,"modRoof":-1,"neonColor":[255,0,255],"modAirFilter":-1,"fuelLevel":95,"plate":"42DMT629","modSeats":-1,"interiorColor":111,"modDial":-1,"modSpeakers":-1,"wheelSize":0.0,"modPlateHolder":-1,"modStruts":-1,"tankHealth":997,"modDashboard":-1,"modHorns":-1,"modKit21":-1,"modTurbo":false,"modTransmission":-1,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"headlightColor":255,"modVanityPlate":-1,"modShifterLeavers":-1,"wheelColor":111,"modWindows":-1,"modOrnaments":-1,"engineHealth":993,"modTank":-1,"modKit17":-1,"oilLevel":5,"modRearBumper":-1,"modSpoilers":-1,"liveryRoof":-1,"modDoorSpeaker":-1,"dirtLevel":5,"extras":[],"modAerials":-1,"modFrontBumper":-1,"wheels":6,"modKit47":-1,"plateIndex":0,"modKit19":-1,"modBProofTires":false,"modArmor":-1,"modHydrolic":-1,"modDrift":false}', '42DMT629', NULL, NULL, 95, 994, 990, 1, 0, NULL, NULL, 0, 0, 0, 0, '{"deformation":[],"dirt":4.90493535995483}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '109BSY57', 0),
	(17, 'license:f90cd271ae404268c3728c7b32d31095b7092b5b', 'OUV63962', 'sultan', '970598228', '{"modKit19":-1,"modSteeringWheel":-1,"modKit47":-1,"wheelSize":1.0,"modFrame":-1,"plate":"SUCK IT ","modHorns":-1,"bodyHealth":949,"modRearBumper":-1,"fuelLevel":99,"tankHealth":994,"modDashboard":-1,"modTrimB":-1,"model":970598228,"modPlateHolder":-1,"modCustomTiresF":false,"modTank":-1,"modDoorSpeaker":-1,"modArmor":-1,"liveryRoof":-1,"modCustomTiresR":false,"modKit21":-1,"modDial":-1,"modKit17":-1,"modSeats":-1,"modSpoilers":-1,"modFrontWheels":-1,"modSpeakers":-1,"modKit49":-1,"modRightFender":-1,"modTrunk":-1,"modVanityPlate":-1,"plateIndex":0,"modFrontBumper":-1,"color2":4,"interiorColor":0,"modTurbo":false,"extras":{"10":0,"12":1},"modExhaust":-1,"modTrimA":-1,"modArchCover":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modEngineBlock":-1,"modSuspension":-1,"modRoof":-1,"modShifterLeavers":-1,"wheelWidth":1.0,"modBProofTires":false,"engineHealth":948,"modAerials":-1,"dashboardColor":0,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"neonColor":[255,0,255],"modDrift":false,"modWindows":-1,"pearlescentColor":111,"modHydrolic":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modFender":-1,"modLivery":-1,"color1":4,"modAPlate":-1,"modAirFilter":-1,"modHood":-1,"windowTint":-1,"modStruts":-1,"wheels":0,"modEngine":-1,"modTransmission":-1,"modXenon":false,"modSmokeEnabled":false,"tyreSmokeColor":[255,255,255],"modSideSkirt":-1,"modBackWheels":-1,"modBrakes":-1,"headlightColor":255,"modOrnaments":-1,"modGrille":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelColor":156,"tireHealth":{"1":999.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":998.25,"47":0.0,"45":0.0},"dirtLevel":1,"neonEnabled":[false,false,false,false],"oilLevel":5}', 'SUCK IT', NULL, NULL, 100, 948.069, 948.913, 1, 0, NULL, '{"spark":90.0,"battery":97.0,"carwax":0,"shaftlevel":0,"oil":95.0,"fuel":96.0,"underglow":0,"antiLag":0,"cablelevel":0,"harness":0,"fuellevel":0,"cylinderlevel":0,"manual":0,"oillevel":0,"axle":94.0}', 0, 0, 0, 0, '', 0, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"plate":"SUCK IT","evtype":"carfingerprint","fingerprint":"gf099P39FWN4119","seat":2,"time":1729024933,"location":"Seat 2"}]', NULL, NULL, NULL, NULL, 10, 0, 0, '037VHP17', 0),
	(18, 'license:f90cd271ae404268c3728c7b32d31095b7092b5b', 'LPI62642', 'kgjoker', '278009435', '{"modKit19":-1,"modSteeringWheel":-1,"modKit47":-1,"wheelSize":1.0,"modFrame":-1,"plate":"0KU259EH","modHorns":-1,"bodyHealth":993,"modRearBumper":-1,"fuelLevel":83,"tankHealth":997,"modDashboard":-1,"modTrimB":-1,"model":278009435,"modPlateHolder":-1,"modCustomTiresF":false,"modTank":-1,"modDoorSpeaker":-1,"modArmor":-1,"liveryRoof":-1,"modCustomTiresR":false,"modKit21":-1,"modDial":-1,"modKit17":-1,"modSeats":-1,"modSpoilers":-1,"modFrontWheels":-1,"modSpeakers":-1,"modKit49":-1,"modRightFender":-1,"modTrunk":-1,"modVanityPlate":-1,"plateIndex":3,"modFrontBumper":-1,"color2":[0,0,0,0],"interiorColor":0,"modTurbo":false,"extras":{"12":1,"2":1,"11":0},"modExhaust":-1,"modTrimA":-1,"modArchCover":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":false,"7":true,"0":true},"modEngineBlock":-1,"modSuspension":-1,"modRoof":-1,"modShifterLeavers":-1,"wheelWidth":1.0,"modBProofTires":false,"engineHealth":1000,"modAerials":-1,"dashboardColor":0,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"neonColor":[255,0,255],"modDrift":false,"modWindows":-1,"pearlescentColor":0,"modHydrolic":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modFender":-1,"modLivery":-1,"color1":[0,0,0,0],"modAPlate":-1,"modAirFilter":-1,"modHood":-1,"windowTint":-1,"modStruts":-1,"wheels":7,"modEngine":-1,"modTransmission":-1,"modXenon":false,"modSmokeEnabled":false,"tyreSmokeColor":[255,255,255],"modSideSkirt":-1,"modBackWheels":-1,"modBrakes":-1,"headlightColor":255,"modOrnaments":-1,"modGrille":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelColor":0,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"dirtLevel":1,"neonEnabled":[false,false,false,false],"oilLevel":5}', '0KU259EH', NULL, NULL, 92, 1000, 993.489, 1, 0, NULL, '{"spark":100.0,"battery":100.0,"carwax":0,"shaftlevel":0,"oil":100.0,"fuel":97.0,"underglow":0,"antiLag":0,"cablelevel":0,"harness":0,"fuellevel":0,"cylinderlevel":0,"manual":0,"oillevel":0,"axle":100.0}', 0, 0, 0, 0, '{"dirt":0.9441242814064,"deformation":[[{"x":1.02132022380828,"y":2.55781173706054,"z":0.0},0.06823186576366]]}', 0, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, 'null', 0, '[{"plate":"0KU259EH","evtype":"carfingerprint","fingerprint":"Tb417Q82gdh1058","seat":2,"time":1729023012,"location":"Seat 2"},{"plate":"0KU259EH","evtype":"carfingerprint","fingerprint":"Tb417Q82gdh1058","seat":3,"time":1728793202,"location":"Seat 3"},{"plate":"0KU259EH","evtype":"carfingerprint","fingerprint":"xQ358t79KXL2469","seat":2,"time":1729008158,"location":"Seat 2"}]', NULL, NULL, NULL, NULL, 25, 0, 0, '470XEZ35', 0),
	(19, 'license:f90cd271ae404268c3728c7b32d31095b7092b5b', 'LPI62642', 'demon', '885421525', '{"modSpoilers":-1,"modArchCover":-1,"modXenon":false,"modRightFender":-1,"modPlateHolder":-1,"modSeats":-1,"modHydrolic":-1,"modTransmission":-1,"modKit49":-1,"modEngineBlock":-1,"oilLevel":5,"modDashboard":-1,"modFrontBumper":-1,"model":885421525,"modKit47":-1,"wheels":7,"color1":[232,20,22,0],"tyreSmokeColor":[255,255,255],"modOrnaments":-1,"interiorColor":0,"modDrift":false,"modDoorSpeaker":-1,"plate":"RICH","modExhaust":-1,"wheelSize":1.0,"fuelLevel":74,"modTrimA":-1,"dashboardColor":0,"modBackWheels":-1,"plateIndex":4,"modHood":-1,"bodyHealth":996,"headlightColor":255,"modTank":-1,"modFrame":-1,"modFender":-1,"modWindows":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"wheelColor":0,"modShifterLeavers":-1,"neonColor":[255,0,255],"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"neonEnabled":[false,false,false,false],"color2":[232,20,22,0],"modTurbo":false,"extras":[0,1],"modSpeakers":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modAPlate":-1,"modEngine":-1,"modKit21":-1,"dirtLevel":1,"modFrontWheels":-1,"modSteeringWheel":-1,"modRearBumper":-1,"modLivery":-1,"engineHealth":998,"modGrille":-1,"modVanityPlate":-1,"modTrimB":-1,"modTrunk":-1,"modSmokeEnabled":false,"modKit17":-1,"tankHealth":1000,"liveryRoof":-1,"modAirFilter":-1,"modSideSkirt":-1,"modAerials":-1,"pearlescentColor":0,"modStruts":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"wheelWidth":1.0,"windowTint":-1,"modCustomTiresR":false,"modArmor":-1,"modDial":-1,"modBrakes":-1,"modHorns":-1,"modRoof":-1,"modSuspension":-1,"modCustomTiresF":false,"modBProofTires":false,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit19":-1}', 'RICH', NULL, NULL, 74, 998, 997, 1, 0, NULL, '{"cablelevel":0,"battery":100.0,"oillevel":0,"fuel":100.0,"harness":1,"oil":100.0,"fuellevel":0,"carwax":0,"spark":100.0,"underglow":0,"antiLag":0,"axle":100.0,"cylinderlevel":0,"shaftlevel":0,"manual":0}', 0, 0, 0, 0, '{"deformation":[],"dirt":1.09052801132202}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, 'null', 0, '[{"time":1728792674,"evtype":"carfingerprint","seat":1,"fingerprint":"dv704g47QVg1927","plate":"RICH","location":"Seat 1"},{"bloodtype":"A-","time":1730347880,"evtype":"carblood","citizenid":"QNC46912","plate":"RICH","seat":1},{"bloodtype":"A-","time":1730347878,"evtype":"carblood","citizenid":"QNC46912","plate":"RICH","seat":1},{"time":1728780063,"evtype":"carfingerprint","seat":2,"fingerprint":"Tb417Q82gdh1058","plate":"RICH","location":"Seat 2"},{"bloodtype":"A-","time":1730347881,"evtype":"carblood","citizenid":"QNC46912","plate":"RICH","seat":1}]', NULL, '[{"metadata":{"ammo":30,"registered":"Ryan Rich","components":[],"durability":97.9,"serial":"251169MMW343617"},"count":1,"slot":1,"name":"WEAPON_WOARP"},{"metadata":{"ammo":26,"registered":"Ryan Rich","components":["at_clip_bandana_black"],"durability":97.7,"serial":"663642QCT796436"},"count":1,"slot":2,"name":"WEAPON_BMARP"},{"count":200,"slot":3,"name":"plasticjerrycan"},{"count":200,"slot":4,"name":"emptybaggies"},{"count":50,"slot":5,"name":"sodiumcarbonate"},{"count":1,"slot":6,"name":"bandage"},{"count":18,"slot":8,"name":"cocaleaf"},{"count":1,"slot":9,"name":"cokeprocessingtable"},{"count":1,"slot":10,"name":"scales"},{"count":1,"slot":11,"name":"tvremote"}]', NULL, NULL, 40, 0, 0, '154EJW44', 0),
	(20, 'license:53d63cef03bd84bee2778d19ae409b18c859187a', 'ENW45444', 'cavalcade2', '-789894171', '{"modSuspension":-1,"modDashboard":-1,"modTrimA":-1,"pearlescentColor":0,"modEngine":-1,"bodyHealth":863,"neonEnabled":[false,false,false,false],"modBackWheels":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"model":-789894171,"modArchCover":-1,"modStruts":-1,"modAPlate":-1,"fuelLevel":71,"modAirFilter":-1,"modOrnaments":-1,"modSideSkirt":-1,"extras":{"12":0,"10":1,"11":1},"dashboardColor":0,"modTurbo":false,"modLivery":-1,"tankHealth":964,"modSeats":-1,"modTransmission":-1,"modXenon":false,"plateIndex":0,"wheelSize":1.0,"modDial":-1,"modFrontBumper":-1,"modRearBumper":-1,"modFrame":-1,"modTrunk":-1,"tyreSmokeColor":[255,255,255],"modShifterLeavers":-1,"modKit19":-1,"modKit21":-1,"windowStatus":{"1":false,"2":true,"3":true,"4":true,"5":true,"6":false,"7":true,"0":true},"modAerials":-1,"dirtLevel":10,"wheelWidth":1.0,"modBProofTires":false,"neonColor":[255,0,255],"modHorns":-1,"liveryRoof":-1,"color2":[0,0,0,0],"modRightFender":-1,"modGrille":-1,"headlightColor":255,"color1":[0,0,0,0],"modHydrolic":-1,"wheelColor":0,"modSpoilers":-1,"modKit17":-1,"modCustomTiresF":false,"engineHealth":907,"modCustomTiresR":false,"modPlateHolder":-1,"modTrimB":-1,"modSpeakers":-1,"modSteeringWheel":-1,"windowTint":-1,"modSmokeEnabled":false,"modExhaust":-1,"modFender":-1,"modVanityPlate":-1,"modKit49":-1,"oilLevel":8,"modBrakes":-1,"modDoorSpeaker":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modTank":-1,"modRoof":-1,"plate":"3NK062SX","modHood":-1,"interiorColor":0,"modDrift":false,"modFrontWheels":-1,"modEngineBlock":-1,"modWindows":-1,"wheels":3,"modKit47":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modArmor":-1}', '3NK062SX', NULL, NULL, 75, 906.776, 862.544, 1, 0, NULL, '{"shaftlevel":0,"cylinderlevel":0,"battery":95.0,"fuel":86.0,"manual":0,"underglow":0,"carwax":0,"axle":92.0,"cablelevel":0,"fuellevel":0,"harness":0,"oil":84.0,"spark":96.0,"antiLag":0,"oillevel":0}', 0, 0, 0, 0, '{"dirt":6.07911920547485,"deformation":[[{"x":-1.09648978710174,"y":2.62653064727783,"z":0.0},0.0531174428761],[{"x":1.09648978710174,"y":2.62653064727783,"z":0.0},0.09493805468082]]}', 0, 'Grove Street', 0, 0, 0, 0, 0, 0, '', '', 0, 'null', 0, '[{"location":"Seat 1","seat":1,"plate":"3NK062SX","time":1729090408,"fingerprint":"sj675B07bpH2056","evtype":"carfingerprint"},{"location":"Seat 1","seat":1,"plate":"3NK062SX","time":1729024966,"fingerprint":"xQ358t79KXL2469","evtype":"carfingerprint"},{"location":"Seat 1","seat":1,"plate":"3NK062SX","time":1729099708,"fingerprint":"sj675B07bpH2056","evtype":"carfingerprint"}]', NULL, NULL, NULL, NULL, 112, 0, 0, NULL, 0),
	(22, 'license:f90cd271ae404268c3728c7b32d31095b7092b5b', 'OUV63962', 'sheava', '819197656', '{"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modArchCover":-1,"modGrille":-1,"modBrakes":2,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modStruts":-1,"modKit49":-1,"modHydrolic":-1,"modSteeringWheel":-1,"wheels":5,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modTrimB":-1,"modSideSkirt":-1,"windowTint":6,"modArmor":4,"modExhaust":0,"modSpeakers":-1,"pearlescentColor":111,"modSeats":-1,"modTurbo":1,"modBProofTires":false,"modCustomTiresF":false,"engineHealth":999,"model":819197656,"bodyHealth":992,"plateIndex":0,"modAirFilter":-1,"neonEnabled":[false,false,false,false],"headlightColor":255,"wheelSize":1.0,"modKit17":-1,"modCustomTiresR":false,"modEngine":3,"modKit19":-1,"modFrontBumper":1,"tankHealth":1000,"modEngineBlock":-1,"modDoorSpeaker":-1,"modShifterLeavers":-1,"modXenon":1,"modRightFender":-1,"modFrontWheels":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"wheelColor":111,"modRearBumper":0,"modDial":-1,"modKit47":-1,"modTrimA":-1,"plate":"SRA 672","modTransmission":2,"color2":111,"modPlateHolder":-1,"dashboardColor":111,"modHood":0,"modFender":-1,"modAerials":-1,"modOrnaments":-1,"liveryRoof":-1,"dirtLevel":1,"extras":[1],"modSuspension":-1,"modHorns":57,"tyreSmokeColor":[1,1,1],"interiorColor":111,"modKit21":-1,"modTank":-1,"modTrunk":-1,"neonColor":[255,0,255],"modDrift":false,"oilLevel":5,"modSmokeEnabled":1,"modFrame":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":false,"0":true},"modRoof":2,"modVanityPlate":-1,"modLivery":1,"fuelLevel":98,"modSpoilers":3,"modBackWheels":-1,"wheelWidth":1.0,"modDashboard":-1,"modAPlate":-1,"color1":111,"modWindows":-1}', 'SRA 672', NULL, 'motelgarage', 98, 999, 993, 1, 0, NULL, '{"cylinderlevel":3,"antiLag":1,"spark":100.0,"harness":1,"manual":0,"carwax":0,"cablelevel":3,"oil":100.0,"axle":98.0,"fuellevel":3,"shaftlevel":3,"underglow":0,"battery":98.0,"oillevel":3,"fuel":100.0}', 0, 0, 0, 0, '{"dirt":0.72307622432708,"deformation":[]}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"seat":1,"fingerprint":"rj614I08Jed5366","time":1729038302,"location":"Seat 1","plate":"SRA 672","evtype":"carfingerprint"}]', NULL, NULL, NULL, NULL, 18, 81, 1, NULL, 0),
	(23, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'AXW11242', 'issi2', '-1177863319', '{"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modArchCover":-1,"modGrille":-1,"modBrakes":2,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modStruts":-1,"modKit49":-1,"modHydrolic":-1,"modSteeringWheel":-1,"wheels":0,"tireHealth":{"1":998.25,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modTrimB":-1,"modSideSkirt":-1,"windowTint":-1,"modArmor":4,"modExhaust":-1,"modSpeakers":-1,"pearlescentColor":38,"modSeats":-1,"modTurbo":1,"modBProofTires":false,"modCustomTiresF":false,"engineHealth":952,"model":-1177863319,"bodyHealth":998,"plateIndex":0,"modAirFilter":-1,"neonEnabled":[false,false,false,false],"headlightColor":255,"wheelSize":1.0,"modKit17":-1,"modDrift":false,"modEngine":3,"modKit19":-1,"modFrontBumper":-1,"tankHealth":1000,"modEngineBlock":-1,"modDoorSpeaker":-1,"modShifterLeavers":-1,"modWindows":-1,"modRightFender":-1,"modFrontWheels":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"wheelColor":156,"modRearBumper":-1,"modDial":-1,"modKit47":-1,"modFrame":-1,"extras":{"11":0},"modTransmission":2,"modTrunk":-1,"plate":"80FDP009","dashboardColor":0,"modXenon":false,"modTrimA":-1,"modAerials":-1,"modOrnaments":-1,"modSpoilers":-1,"modCustomTiresR":false,"modSmokeEnabled":false,"modSuspension":2,"modHorns":-1,"tyreSmokeColor":[255,255,255],"modPlateHolder":-1,"color2":4,"modTank":-1,"liveryRoof":-1,"neonColor":[255,0,255],"wheelWidth":1.0,"modHood":-1,"dirtLevel":4,"modRoof":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modFender":-1,"modLivery":-1,"modVanityPlate":-1,"fuelLevel":99,"oilLevel":5,"modBackWheels":-1,"modKit21":-1,"modDashboard":-1,"modAPlate":-1,"color1":36,"interiorColor":0}', '80FDP009', NULL, NULL, 99, 953, 999, 1, 0, NULL, '{"cylinderlevel":3,"antiLag":1,"spark":100.0,"harness":1,"manual":0,"carwax":0,"fuellevel":3,"oillevel":3,"oil":100.0,"battery":100.0,"shaftlevel":3,"underglow":0,"axle":100.0,"cablelevel":3,"fuel":100.0}', 0, 0, 0, 0, '{"dirt":3.97911667823791,"deformation":[]}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729983043,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984589,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729982990,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729983003,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984580,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729982992,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984831,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984810,"evtype":"carcasing"},{"plate":"80FDP009","type":-1499064924,"serial":"168420GFO294503","time":1729983334,"evtype":"carcasing"},{"plate":"80FDP009","type":-1499064924,"serial":"168420GFO294503","time":1729983339,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984576,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729983044,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729983044,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729983058,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729983043,"evtype":"carcasing"},{"seat":1,"fingerprint":"gf099P39FWN4119","time":1729038101,"location":"Seat 1","plate":"80FDP009","evtype":"carfingerprint"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984811,"evtype":"carcasing"},{"seat":2,"fingerprint":"rj614I08Jed5366","time":1729032773,"location":"Seat 2","plate":"80FDP009","evtype":"carfingerprint"},{"plate":"80FDP009","type":-1499064924,"serial":"168420GFO294503","time":1729983335,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729983057,"evtype":"carcasing"},{"seat":1,"fingerprint":"gf099P39FWN4119","time":1729034572,"location":"Seat 1","plate":"80FDP009","evtype":"carfingerprint"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984812,"evtype":"carcasing"},{"plate":"80FDP009","type":-1499064924,"serial":"168420GFO294503","time":1729983338,"evtype":"carcasing"},{"plate":"80FDP009","type":-1499064924,"serial":"168420GFO294503","time":1729983337,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729983675,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729983059,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729983052,"evtype":"carcasing"},{"seat":2,"fingerprint":"sj675B07bpH2056","time":1729034752,"location":"Seat 2","plate":"80FDP009","evtype":"carfingerprint"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729983060,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984844,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984844,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984843,"evtype":"carcasing"},{"plate":"80FDP009","type":-1499064924,"serial":"168420GFO294503","time":1729983335,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984841,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984840,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729982992,"evtype":"carcasing"},{"seat":1,"bloodtype":"O+","citizenid":"AXW11242","time":1730587894,"plate":"80FDP009","evtype":"carblood"},{"plate":"80FDP009","type":-1499064924,"serial":"168420GFO294503","time":1729983336,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984843,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729983358,"evtype":"carcasing"},{"plate":"80FDP009","type":-1499064924,"serial":"168420GFO294503","time":1729983338,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984810,"evtype":"carcasing"},{"plate":"80FDP009","type":-1499064924,"serial":"168420GFO294503","time":1729983340,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984591,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984592,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984584,"evtype":"carcasing"},{"seat":1,"fingerprint":"rj614I08Jed5366","time":1729039950,"location":"Seat 1","plate":"80FDP009","evtype":"carfingerprint"},{"plate":"80FDP009","type":-1499064924,"serial":"168420GFO294503","time":1729983335,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984812,"evtype":"carcasing"},{"plate":"80FDP009","type":-1499064924,"serial":"168420GFO294503","time":1729983336,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984811,"evtype":"carcasing"},{"plate":"80FDP009","type":-1499064924,"serial":"168420GFO294503","time":1729983334,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729983045,"evtype":"carcasing"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729984839,"evtype":"carcasing"},{"seat":1,"fingerprint":"gf099P39FWN4119","time":1729032545,"location":"Seat 1","plate":"80FDP009","evtype":"carfingerprint"},{"seat":2,"fingerprint":"rj614I08Jed5366","time":1729034795,"location":"Seat 2","plate":"80FDP009","evtype":"carfingerprint"},{"plate":"80FDP009","type":727643628,"serial":"323006GWA203391","time":1729983056,"evtype":"carcasing"},{"plate":"80FDP009","type":-1499064924,"serial":"168420GFO294503","time":1729983339,"evtype":"carcasing"}]', '[{"slot":1,"name":"noscan","count":1}]', NULL, NULL, NULL, 22, 58, 1, NULL, 0),
	(24, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'AXW11242', 'hellcatlb', '-1624886479', '{"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modArchCover":-1,"modGrille":-1,"modBrakes":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modStruts":-1,"modKit49":-1,"modHydrolic":-1,"modSteeringWheel":-1,"wheels":1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modTrimB":-1,"modSideSkirt":-1,"windowTint":-1,"modArmor":-1,"modExhaust":-1,"modSpeakers":-1,"pearlescentColor":0,"modSeats":-1,"modTurbo":false,"modBProofTires":false,"modCustomTiresF":false,"engineHealth":994,"model":-1624886479,"bodyHealth":996,"plateIndex":0,"modAirFilter":-1,"neonEnabled":[false,false,false,false],"headlightColor":255,"wheelSize":1.0,"modKit17":-1,"modDrift":false,"modEngine":-1,"modKit19":-1,"modFrontBumper":-1,"tankHealth":1000,"modEngineBlock":-1,"modDoorSpeaker":-1,"modShifterLeavers":-1,"modWindows":-1,"modRightFender":-1,"modFrontWheels":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"wheelColor":147,"modRearBumper":-1,"modDial":-1,"modKit47":-1,"modFrame":-1,"extras":[0],"modTransmission":-1,"modTrunk":-1,"plate":"06LCP172","dashboardColor":0,"modXenon":false,"modTrimA":-1,"modAerials":-1,"modOrnaments":-1,"modSpoilers":-1,"modCustomTiresR":false,"modSmokeEnabled":false,"modSuspension":-1,"modHorns":-1,"tyreSmokeColor":[255,255,255],"modPlateHolder":-1,"color2":27,"modTank":-1,"liveryRoof":-1,"neonColor":[255,0,255],"wheelWidth":1.0,"modHood":-1,"dirtLevel":4,"modRoof":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":false},"modFender":-1,"modLivery":-1,"modVanityPlate":-1,"fuelLevel":100,"oilLevel":5,"modBackWheels":-1,"modKit21":-1,"modDashboard":-1,"modAPlate":-1,"color1":6,"interiorColor":0}', '06LCP172', NULL, 'pillboxgarage', 100, 995, 997, 1, 0, NULL, NULL, 0, 0, 0, 0, '{"dirt":3.73169517517089,"deformation":[]}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"seat":1,"fingerprint":"gf099P39FWN4119","time":1729046650,"location":"Seat 1","plate":"06LCP172","evtype":"carfingerprint"}]', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0),
	(25, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'AXW11242', 'hellcatlb', '-1624886479', '{"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modArchCover":-1,"modGrille":-1,"modBrakes":2,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modStruts":-1,"modKit49":-1,"modHydrolic":-1,"modSteeringWheel":-1,"wheels":1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modTrimB":-1,"modSideSkirt":-1,"windowTint":-1,"modArmor":4,"modExhaust":-1,"color2":27,"pearlescentColor":0,"modSeats":-1,"modTurbo":1,"modBProofTires":false,"modCustomTiresF":false,"engineHealth":999,"model":-1624886479,"bodyHealth":1000,"modSpoilers":-1,"modAirFilter":-1,"neonEnabled":[false,false,false,false],"headlightColor":255,"wheelSize":1.0,"modKit17":-1,"modDrift":false,"modEngine":3,"modKit19":-1,"modFrontBumper":-1,"tankHealth":1000,"modEngineBlock":-1,"modDoorSpeaker":-1,"modShifterLeavers":-1,"extras":[0],"modRightFender":-1,"modFrontWheels":-1,"plate":"25NWR252","wheelColor":147,"modRearBumper":-1,"modDial":-1,"modKit47":-1,"modFrame":-1,"modRoof":-1,"modTransmission":2,"liveryRoof":-1,"interiorColor":0,"dashboardColor":0,"modSpeakers":-1,"modFender":-1,"modAerials":-1,"modOrnaments":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"plateIndex":0,"color1":6,"modSuspension":2,"modHorns":-1,"tyreSmokeColor":[255,255,255],"wheelWidth":1.0,"modXenon":false,"modTank":-1,"modPlateHolder":-1,"neonColor":[255,0,255],"modWindows":-1,"modSmokeEnabled":false,"dirtLevel":1,"modCustomTiresR":false,"modTrunk":-1,"modHood":-1,"modLivery":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":false},"fuelLevel":46,"modVanityPlate":-1,"modBackWheels":-1,"modKit21":-1,"modDashboard":-1,"modAPlate":-1,"modTrimA":-1,"oilLevel":5}', '25NWR252', NULL, NULL, 46, 1000, 1000, 1, 0, NULL, '{"cylinderlevel":3,"antiLag":1,"spark":97.0,"harness":1,"manual":0,"carwax":0,"battery":90.0,"oil":88.0,"cablelevel":3,"fuellevel":3,"shaftlevel":3,"underglow":0,"oillevel":3,"axle":93.0,"fuel":89.0}', 0, 0, 0, 0, '{"dirt":0.57242709398269,"deformation":[]}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"seat":1,"fingerprint":"gf099P39FWN4119","time":1729042434,"location":"Seat 1","plate":"25NWR252","evtype":"carfingerprint"},{"seat":1,"fingerprint":"xQ358t79KXL2469","time":1729043351,"location":"Seat 1","plate":"25NWR252","evtype":"carfingerprint"}]', NULL, NULL, NULL, NULL, 21, 56, 1, NULL, 0),
	(26, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'AXW11242', 'ramtrx6x6', '-921695977', '{"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modArchCover":-1,"modGrille":-1,"modBrakes":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modStruts":-1,"modKit49":-1,"modHydrolic":-1,"modSteeringWheel":-1,"wheels":0,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":1000.0,"5":1000.0,"0":1000.0,"47":0.0,"45":0.0},"modTrimB":-1,"modSideSkirt":-1,"windowTint":-1,"modArmor":-1,"modExhaust":-1,"modSpeakers":-1,"pearlescentColor":0,"modSeats":-1,"modTurbo":false,"modBProofTires":false,"modCustomTiresF":false,"engineHealth":1000,"model":-921695977,"bodyHealth":993,"plateIndex":4,"modAirFilter":-1,"neonEnabled":[false,false,false,false],"headlightColor":255,"wheelSize":0.0,"modKit17":-1,"modDrift":false,"modEngine":-1,"modKit19":-1,"modFrontBumper":-1,"tankHealth":999,"modEngineBlock":-1,"modDoorSpeaker":-1,"modShifterLeavers":-1,"modWindows":-1,"modRightFender":-1,"modFrontWheels":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"wheelColor":0,"modRearBumper":-1,"modDial":-1,"modKit47":-1,"modFrame":-1,"extras":[1,null,0],"modTransmission":-1,"modTrunk":-1,"plate":"7RN352UB","dashboardColor":0,"modXenon":false,"modTrimA":-1,"modAerials":-1,"modOrnaments":-1,"modSpoilers":-1,"modCustomTiresR":false,"modSmokeEnabled":false,"modSuspension":-1,"modHorns":-1,"tyreSmokeColor":[255,255,255],"modPlateHolder":-1,"color2":[0,0,0,0],"modTank":-1,"liveryRoof":-1,"neonColor":[255,0,255],"wheelWidth":0.0,"modHood":-1,"dirtLevel":15,"modRoof":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modFender":-1,"modLivery":0,"modVanityPlate":-1,"fuelLevel":71,"oilLevel":5,"modBackWheels":-1,"modKit21":-1,"modDashboard":-1,"modAPlate":-1,"color1":[0,0,0,0],"interiorColor":0}', '7RN352UB', NULL, NULL, 71, 1000, 993, 1, 0, NULL, '{"cylinderlevel":3,"antiLag":0,"spark":95.0,"harness":1,"manual":0,"carwax":0,"fuellevel":3,"oillevel":3,"oil":98.0,"battery":100.0,"shaftlevel":3,"underglow":0,"axle":95.0,"cablelevel":3,"fuel":100.0}', 0, 0, 0, 0, '{"dirt":15.0,"deformation":[]}', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, 'null', 0, '[{"seat":1,"fingerprint":"gf099P39FWN4119","time":1729043272,"location":"Seat 1","plate":"7RN352UB","evtype":"carfingerprint"}]', NULL, NULL, NULL, NULL, 27, 0, 0, NULL, 0),
	(27, 'license:f90cd271ae404268c3728c7b32d31095b7092b5b', 'OUV63962', 'crownbp', '299800035', '{"modKit17":-1,"modFrontBumper":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modRightFender":-1,"modBProofTires":false,"wheels":0,"modHood":-1,"modCustomTiresF":false,"fuelLevel":99,"modOrnaments":-1,"modAerials":-1,"modVanityPlate":-1,"modKit47":-1,"modSideSkirt":-1,"liveryRoof":-1,"pearlescentColor":0,"modAirFilter":-1,"plate":"2CX564XH","extras":[1,0,1],"modFrame":-1,"modSpoilers":-1,"bodyHealth":1000,"modDrift":false,"modStruts":-1,"modSeats":-1,"tyreSmokeColor":[255,255,255],"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modBackWheels":-1,"modDoorSpeaker":-1,"modArchCover":-1,"modTrimB":-1,"modRoof":-1,"neonEnabled":[false,false,false,false],"oilLevel":5,"modSpeakers":-1,"neonColor":[255,0,255],"modKit49":-1,"color2":[0,0,0,0],"modBrakes":-1,"modAPlate":-1,"modRearBumper":-1,"dashboardColor":0,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modTrunk":-1,"modXenon":false,"headlightColor":255,"modGrille":-1,"modFrontWheels":-1,"modTank":-1,"modDashboard":-1,"modSuspension":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modHydrolic":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTurbo":false,"model":299800035,"modWindows":-1,"modSmokeEnabled":false,"modExhaust":-1,"modShifterLeavers":-1,"modHorns":-1,"windowTint":-1,"interiorColor":0,"dirtLevel":0,"modKit19":-1,"tankHealth":1000,"modArmor":-1,"modFender":-1,"modLivery":0,"plateIndex":3,"wheelColor":0,"modKit21":-1,"modEngineBlock":-1,"modPlateHolder":-1,"wheelSize":0.0,"modEngine":-1,"modCustomTiresR":false,"modDial":-1,"wheelWidth":0.0,"modTransmission":-1,"modTrimA":-1,"color1":[0,0,0,0],"modSteeringWheel":-1,"engineHealth":1000}', '2CX564XH', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, '{"cylinderlevel":0,"antiLag":0,"spark":100.0,"harness":0,"manual":0,"carwax":0,"cablelevel":0,"oil":100.0,"axle":100.0,"fuellevel":0,"shaftlevel":0,"underglow":0,"battery":100.0,"oillevel":0,"fuel":100.0}', 0, 0, 0, 0, '', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, 'null', 0, '[{"seat":1,"fingerprint":"rj614I08Jed5366","time":1729043900,"location":"Seat 1","plate":"2CX564XH","evtype":"carfingerprint"}]', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0),
	(28, 'license:53d63cef03bd84bee2778d19ae409b18c859187a', 'JVH49125', 'ninef2', '-1461482751', '{"modKit17":-1,"modFrontBumper":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modPlateHolder":-1,"modBProofTires":false,"wheels":7,"modHood":-1,"modCustomTiresF":false,"fuelLevel":32,"modOrnaments":-1,"modAerials":-1,"modVanityPlate":-1,"modKit47":-1,"modSideSkirt":-1,"liveryRoof":-1,"pearlescentColor":92,"modWindows":-1,"plate":"01GQY922","wheelWidth":1.0,"modFrame":-1,"modSpoilers":-1,"bodyHealth":1000,"modDrift":false,"modStruts":-1,"modSeats":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modBackWheels":-1,"modDoorSpeaker":-1,"modSuspension":-1,"modTrimB":-1,"modRoof":-1,"neonEnabled":[false,false,false,false],"oilLevel":5,"modSpeakers":-1,"neonColor":[255,0,255],"modKit49":-1,"color2":61,"modBrakes":2,"modAPlate":-1,"modRearBumper":-1,"dashboardColor":0,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modTrunk":-1,"modXenon":false,"headlightColor":255,"modGrille":-1,"modFrontWheels":-1,"modDial":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"dirtLevel":1,"wheelSize":1.0,"modHydrolic":-1,"modTrimA":-1,"wheelColor":156,"plateIndex":0,"modArchCover":-1,"modSmokeEnabled":false,"modEngine":-1,"modShifterLeavers":-1,"modHorns":-1,"windowTint":-1,"interiorColor":0,"modAirFilter":-1,"modKit19":-1,"modLivery":-1,"modArmor":-1,"modFender":-1,"modDashboard":-1,"modTransmission":-1,"modCustomTiresR":false,"modKit21":-1,"modEngineBlock":-1,"engineHealth":1000,"modRightFender":-1,"modExhaust":-1,"tyreSmokeColor":[255,255,255],"extras":{"10":1,"12":0},"modTank":-1,"modTurbo":1,"tankHealth":1000,"color1":54,"modSteeringWheel":-1,"model":-1461482751}', '01GQY922', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, '{"cylinderlevel":3,"antiLag":1,"spark":100.0,"harness":1,"manual":0,"carwax":0,"cablelevel":3,"oil":100.0,"axle":100.0,"fuellevel":0,"shaftlevel":3,"underglow":0,"battery":100.0,"oillevel":3,"fuel":100.0}', 0, 0, 0, 0, '', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, NULL, 0, '[{"seat":1,"fingerprint":"xQ358t79KXL2469","time":1729051788,"location":"Seat 1","plate":"01GQY922","evtype":"carfingerprint"},{"seat":1,"fingerprint":"rj614I08Jed5366","time":1729053298,"location":"Seat 1","plate":"01GQY922","evtype":"carfingerprint"},{"seat":1,"fingerprint":"rj614I08Jed5366","time":1729053298,"location":"Seat 1","plate":"01GQY922","evtype":"carfingerprint"},{"seat":2,"fingerprint":"rj614I08Jed5366","time":1729051818,"location":"Seat 2","plate":"01GQY922","evtype":"carfingerprint"}]', NULL, NULL, NULL, NULL, 3, 0, 0, NULL, 0),
	(29, 'license:f90cd271ae404268c3728c7b32d31095b7092b5b', 'OUV63962', 'GODzRAMTRX6x6', '-1047672102', '{"modWindows":-1,"extras":[],"modSmokeEnabled":false,"modAirFilter":-1,"wheels":3,"modFrame":-1,"modSpoilers":-1,"modDashboard":-1,"wheelWidth":0.0,"model":-1047672102,"engineHealth":1000,"modCustomTiresF":false,"modStruts":-1,"modEngine":-1,"plateIndex":0,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"color2":[0,0,0,0],"modHydrolic":-1,"modTrimB":-1,"modDoorSpeaker":-1,"tyreSmokeColor":[255,255,255],"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modVanityPlate":-1,"modBProofTires":false,"oilLevel":5,"modAerials":-1,"modHorns":-1,"modBrakes":-1,"plate":"2PS473DF","modArchCover":-1,"modKit49":-1,"modLivery":-1,"modKit47":-1,"modSteeringWheel":-1,"liveryRoof":-1,"modSpeakers":-1,"dirtLevel":0,"modShifterLeavers":-1,"modRearBumper":-1,"modCustomTiresR":false,"fuelLevel":100,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":1000.0,"5":1000.0,"0":1000.0,"47":0.0,"45":0.0},"modArmor":-1,"tankHealth":1000,"modKit21":-1,"modKit17":-1,"modTransmission":-1,"color1":[0,0,0,0],"modAPlate":-1,"modSuspension":-1,"modRoof":-1,"modFrontWheels":-1,"modFender":-1,"dashboardColor":0,"modSeats":-1,"modFrontBumper":-1,"modPlateHolder":-1,"modHood":-1,"modEngineBlock":-1,"windowTint":-1,"headlightColor":255,"bodyHealth":1000,"modDrift":false,"modExhaust":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"wheelColor":0,"modDial":-1,"modRightFender":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"pearlescentColor":0,"modXenon":false,"neonColor":[255,0,255],"modSideSkirt":-1,"modTrimA":-1,"modTank":-1,"interiorColor":0,"neonEnabled":[false,false,false,false],"wheelSize":0.0,"modGrille":-1,"modOrnaments":-1,"modBackWheels":3,"modKit19":-1,"modTrunk":-1,"modTurbo":false}', '2PS473DF', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '', 0, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, 'null', 0, '[{"seat":1,"fingerprint":"rj614I08Jed5366","time":1729053619,"location":"Seat 1","plate":"2PS473DF","evtype":"carfingerprint"}]', NULL, NULL, NULL, NULL, 2, 0, 0, NULL, 0),
	(30, 'license:17c08e084f072db994a114b63ea05a8373230d0f', 'AXW11242', 'Urus_Stretch_6', '1876913310', '{"modKit17":-1,"modFrontBumper":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"4":0.0,"5":0.0,"0":1000.0,"47":0.0,"45":0.0},"modPlateHolder":-1,"modBProofTires":false,"wheels":0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modCustomTiresF":false,"fuelLevel":100,"engineHealth":1000,"modAerials":-1,"modLivery":-1,"modKit47":-1,"modSideSkirt":-1,"liveryRoof":-1,"pearlescentColor":0,"modAirFilter":-1,"plate":"7CX589TG","extras":[],"modFrame":-1,"modSpoilers":-1,"bodyHealth":1000,"modDrift":false,"modStruts":-1,"modSeats":-1,"dirtLevel":0,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modBackWheels":-1,"modDoorSpeaker":-1,"modArchCover":-1,"plateIndex":4,"modRoof":-1,"neonEnabled":[false,false,false,false],"oilLevel":5,"modSpeakers":-1,"neonColor":[255,0,255],"modKit49":-1,"color2":[255,255,255,0],"modBrakes":-1,"modAPlate":-1,"modRearBumper":-1,"dashboardColor":0,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false,"47":false,"45":false},"modTrunk":-1,"modDial":-1,"headlightColor":255,"modGrille":-1,"modFrontWheels":-1,"modTurbo":false,"wheelSize":0.0,"modTrimA":-1,"modWindows":-1,"modTank":-1,"wheelWidth":0.0,"model":1876913310,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modHydrolic":-1,"modSmokeEnabled":false,"modEngine":-1,"modShifterLeavers":-1,"modHorns":-1,"windowTint":-1,"interiorColor":0,"modTrimB":-1,"modKit19":-1,"modXenon":false,"modArmor":-1,"modFender":-1,"modExhaust":-1,"modHood":-1,"wheelColor":0,"modKit21":-1,"modEngineBlock":-1,"modSuspension":-1,"modDashboard":-1,"modCustomTiresR":false,"tyreSmokeColor":[255,255,255],"modOrnaments":-1,"modRightFender":-1,"modTransmission":-1,"tankHealth":1000,"color1":[255,255,255,0],"modSteeringWheel":-1,"modVanityPlate":-1}', '7CX589TG', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, '{"cylinderlevel":0,"antiLag":0,"spark":100.0,"harness":0,"manual":0,"carwax":0,"battery":100.0,"oil":100.0,"cablelevel":0,"fuellevel":0,"shaftlevel":0,"underglow":0,"oillevel":0,"axle":100.0,"fuel":100.0}', 0, 0, 0, 0, '', 1, 'Legion Square', 0, 0, 0, 0, 0, 0, '', '', 0, 'null', 0, '[{"seat":1,"fingerprint":"gf099P39FWN4119","time":1729054176,"location":"Seat 1","plate":"7CX589TG","evtype":"carfingerprint"}]', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.radiocar_owned: ~4 rows (approximately)
INSERT INTO `radiocar_owned` (`id`, `spz`, `style`) VALUES
	(1, '83RUF593', 1),
	(2, '8QC438FZ', 2),
	(3, 'SRA 672', 1),
	(5, '86SOO134', 2);

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
	(1, 'fuel_pump23', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":0}'),
	(2, 'fuel_pump13', 'none', '{"1":50,"2":50,"capacity":[9972,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":307}'),
	(3, 'fuel_pump6', 'none', '{"1":50,"2":50,"capacity":[9992,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":87}'),
	(4, 'fuel_pump10', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":0}'),
	(5, 'fuel_pump11', 'none', '{"capacity":[null,null,10000],"price":520000,"open":true,"3":50,"companyMoney":0,"for_sale":true,"fuel_only_employee":false}'),
	(6, 'fuel_pump5', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":0}'),
	(7, 'fuel_pump24', 'LPI62642', '{"1":50,"2":50,"capacity":[0.33333333302933,9555.666666665857],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":522200.0000002421}'),
	(8, 'fuel_pump14', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":0}'),
	(9, 'fuel_pump9', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":0}'),
	(10, 'fuel_pump21', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":0}'),
	(11, 'fuel_pump18', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":0}'),
	(12, 'fuel_pump16', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":0}'),
	(13, 'fuel_pump2', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":0}'),
	(14, 'fuel_pump1', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":0}'),
	(15, 'fuel_pump4', 'none', '{"1":50,"2":50,"capacity":[9940,9986],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":9611}'),
	(16, 'fuel_pump17', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":1950}'),
	(17, 'fuel_pump7', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":0}'),
	(18, 'fuel_pump20', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":0}'),
	(19, 'fuel_pump8', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":0}'),
	(20, 'fuel_pump3', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":0}'),
	(21, 'fuel_pump12_airplanes', 'none', '{"capacity":[null,null,null,null,null,null,10000],"price":520000,"open":true,"7":500,"companyMoney":153500,"for_sale":true,"fuel_only_employee":false}'),
	(22, 'fuel_pump15', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":0}'),
	(23, 'fuel_pump22', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":4400}'),
	(24, 'fuel_pump19', 'none', '{"1":50,"2":50,"capacity":[10000,10000],"price":520000,"open":true,"for_sale":true,"fuel_only_employee":false,"companyMoney":0}');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.rcore_prison_accounts: ~3 rows (approximately)
INSERT INTO `rcore_prison_accounts` (`account_id`, `owner`, `balance`, `giftstate`, `createdAt`, `updatedAt`) VALUES
	(1, 'JVH49125', 0, 1, '2024-09-11 20:07:29', '2024-09-23 14:09:13'),
	(2, 'AXW11242', 0, 0, '2024-10-12 21:57:26', '2024-10-12 21:57:26'),
	(3, 'ENW45444', 0, 0, '2024-10-13 03:23:50', '2024-10-13 03:23:50');

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

-- Dumping data for table worldisyours.rcore_prison_accounts_log: ~2 rows (approximately)
INSERT INTO `rcore_prison_accounts_log` (`id`, `action`, `desc`, `charId`, `amount`, `created_at`) VALUES
	(1, 'Job reward', 'You have received 125 credits for your job!', 'AXW11242', 125, '2024-10-12 15:02:34'),
	(2, 'Job reward', 'You have received 254 credits for your job!', 'AXW11242', 254, '2024-10-12 15:18:36');

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
INSERT INTO `rcore_prison_coms_sessions` (`zoneId`, `verticesTarget`, `verticesDone`) VALUES
	(442, 32, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.rcore_prison_logs: ~24 rows (approximately)
INSERT INTO `rcore_prison_logs` (`id`, `action`, `desc`, `charId`, `officer_name`, `citizen_name`, `created_at`) VALUES
	(1, 'CITIZEN_JAILED', 'Mre Dxe jailed by officer named SBDemon Test', 'JXD83837', 'Mre Dxe', 'Mre Dxe', '2024-09-11 13:01:12'),
	(2, 'RELEASE_PLAYER', 'Mre Dxe was released by officer named SBDemon Test', 'JXD83837', 'SBDemon Test', 'Mre Dxe', '2024-09-11 13:01:56'),
	(3, 'CITIZEN_JAILED', 'Test Testina jailed by officer named SBDemon Test', 'JVH49125', 'Test Testina', 'Test Testina', '2024-09-11 13:02:16'),
	(4, 'RELEASE_PLAYER', 'Test Testina was released by officer named SBDemon Test', 'JVH49125', 'SBDemon Test', 'Test Testina', '2024-09-11 13:03:13'),
	(5, 'CITIZEN_JAILED', 'SBDemon Test jailed by officer named Mre Dxe', 'OUV63962', 'SBDemon Test', 'SBDemon Test', '2024-09-11 13:03:23'),
	(6, 'RELEASE_PLAYER', 'SBDemon Test was released by officer named Mre Dxe', 'OUV63962', 'Mre Dxe', 'SBDemon Test', '2024-09-11 13:04:20'),
	(7, 'CITIZEN_JAILED', 'Test Testina jailed by officer named SBDemon Test', 'JVH49125', 'Test Testina', 'Test Testina', '2024-09-11 13:04:45'),
	(8, 'RELEASE_PLAYER', 'Test Testina was released by officer named SBDemon Test', 'JVH49125', 'SBDemon Test', 'Test Testina', '2024-09-11 13:23:45'),
	(9, 'CITIZEN_PAROLLED', 'Ryan Rich parolled by officer named Doc Test', 'LPI62642', 'Doc Test', 'Ryan Rich', '2024-09-20 19:47:21'),
	(10, 'CITIZEN_PAROLLED', 'Test Testina parolled by officer named Doc Test', 'JVH49125', 'Doc Test', 'Test Testina', '2024-09-20 19:51:08'),
	(11, 'CITIZEN_JAILED', 'Ryan Rich jailed by officer named Andy Murphy', 'LPI62642', 'Ryan Rich', 'Ryan Rich', '2024-10-09 21:11:07'),
	(12, 'RELEASE_PLAYER', 'Ryan Rich was released by officer named Andy Murphy', 'LPI62642', 'Andy Murphy', 'Ryan Rich', '2024-10-09 21:12:08'),
	(13, 'CITIZEN_JAILED', 'test test jailed by officer named SBDemon Test', 'AXW11242', 'test test', 'test test', '2024-10-12 14:55:28'),
	(14, 'EDIT_SENTENCE', 'SBDemon Test changed sentence from 00:03:57 to 00:00:01', 'AXW11242', 'test test', 'test test', '2024-10-12 15:02:34'),
	(15, 'RELEASE_PLAYER', 'test test was released by officer named SBDemon Test', 'AXW11242', 'SBDemon Test', 'test test', '2024-10-12 15:02:36'),
	(16, 'CITIZEN_JAILED', 'test test jailed by officer named SBDemon Test', 'AXW11242', 'test test', 'test test', '2024-10-12 15:06:03'),
	(17, 'Solitary', 'Player has been sent to solitary for 00:03:00!', 'AXW11242', '-', 'test test', '2024-10-12 15:07:03'),
	(18, 'Solitary', 'Player has been released from solitary', 'AXW11242', '-', 'test test', '2024-10-12 15:10:03'),
	(19, 'EDIT_SENTENCE', 'SBDemon Test changed sentence from 00:11:36 to 00:06:36', 'AXW11242', 'test test', 'test test', '2024-10-12 15:18:36'),
	(20, 'RELEASE_PLAYER', 'test test was released by officer named SBDemon Test', 'AXW11242', 'SBDemon Test', 'test test', '2024-10-12 15:25:13'),
	(21, 'CITIZEN_JAILED', 'Shelby Lutz jailed by officer named SBDemon Test', 'ENW45444', 'Shelby Lutz', 'Shelby Lutz', '2024-10-12 20:17:20'),
	(22, 'CITIZEN_JAILED', 'SBDemon Test jailed by officer named test test', 'OUV63962', 'SBDemon Test', 'SBDemon Test', '2024-10-12 20:22:17'),
	(23, 'RELEASE_PLAYER', 'SBDemon Test was released by officer named test test', 'OUV63962', 'test test', 'SBDemon Test', '2024-10-12 20:23:44'),
	(24, 'RELEASE_PLAYER', 'Shelby Lutz was released by officer named SBDemon Test', 'ENW45444', 'SBDemon Test', 'Shelby Lutz', '2024-10-12 20:32:05');

-- Dumping structure for table worldisyours.rcore_prison_stash
CREATE TABLE IF NOT EXISTS `rcore_prison_stash` (
  `owner` varchar(255) NOT NULL,
  `stash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.rcore_prison_stash: ~5 rows (approximately)
INSERT INTO `rcore_prison_stash` (`owner`, `stash`) VALUES
	('AXW11242', '[]'),
	('ENW45444', '[]'),
	('JVH49125', '[]'),
	('LPI62642', '[]'),
	('OUV63962', '[]');

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

-- Dumping data for table worldisyours.rcore_reports: ~2 rows (approximately)
INSERT INTO `rcore_reports` (`id`, `author`, `title`, `state`, `tag`, `created_at`, `in_resolve_at`, `in_resolve_by`, `resolved_at`, `resolved_by`, `players_in_area`, `chat_room`, `logger`) VALUES
	(1, '{"name":"SBDemon","identifier":"f90cd271ae404268c3728c7b32d31095b7092b5b","reportsOpenedByCommand":"report"}', 'Rules breaker', 'RESOLVED', NULL, '2024-10-13 12:49:03', '2024-10-13 12:49:17', '{"name":"SBDemon","identifier":"f90cd271ae404268c3728c7b32d31095b7092b5b"}', '2024-10-13 12:50:11', '{"name":"SBDemon","identifier":"f90cd271ae404268c3728c7b32d31095b7092b5b"}', '[{"name":"DocJay69","identifier":"17c08e084f072db994a114b63ea05a8373230d0f","fivemLicense":"17c08e084f072db994a114b63ea05a8373230d0f","playerId":5,"isOnline":true,"armor":0,"inventory":[{"name":"WEAPON_T1911","value":1,"label":"TAN 1911"},{"name":"WEAPON_FLASHLIGHT","value":1,"label":"Flashlight"},{"name":"WEAPON_PD870","value":1,"label":"PD REMINGTON 870"},{"name":"WEAPON_STUNGUN","value":1,"label":"Tazer"},{"name":"WEAPON_BSCAR","value":1,"label":"BLACK SCAR"},{"name":"shotgun_ammo","value":43,"label":"Shotgun Ammo"},{"name":"pistol_ammo","value":160,"label":"Pistol Ammo"},{"name":"smg_ammo","value":210,"label":"SMG Ammo"},{"name":"filled_evidence_bag","value":1,"label":"Collected Evidence"},{"name":"ammo-50","value":31,"label":".50 AE"},{"name":"WEAPON_PISTOL50","value":1,"label":"PD P.50-X"},{"name":"WEAPON_PDHK45","value":1,"label":"PD HK45"},{"name":"firstaid","value":1,"label":"First Aid"},{"name":"WEAPON_PDBATON","value":1,"label":"PD BATON"},{"name":"handcuffs","value":1,"label":"Handcuffs"},{"name":"nikon","value":1,"label":"Nikoff G600"},{"name":"filled_evidence_bag","value":1,"label":"Collected Evidence"},{"name":"heavyarmor","value":2,"label":"Heavy Armor"},{"name":"WEAPON_REDM4A1","value":1,"label":"RED DRAG M4A1"},{"name":"nos","value":2,"label":"NOS Bottle"},{"name":"lockpick","value":3,"label":"Lockpick"},{"name":"advancedlockpick","value":1,"label":"Advanced Lockpick"},{"name":"WEAPON_GLOCKBEAMS","value":1,"label":"GLOCK BEAM SWITCH"},{"name":"radio","value":1,"label":"Radio"},{"name":"bscoffee","value":2,"label":"BurgerShot Coffee"},{"name":"electronic_cuffs","value":1,"label":"Electronic Cuffs"},{"name":"electronic_cuffs","value":1,"label":"Electronic Cuffs"},{"name":"cleaningkit","value":1,"label":"Cleaning Kit"},{"name":"gpstracker","value":1,"label":"GPS Tracker"},{"name":"bscoke","value":2,"label":"BurgerShot Coke"},{"name":"ifaks","value":9,"label":"ifaks"},{"name":"shotfries","value":3,"label":"Shot Fries"},{"name":"bleeder","value":5,"label":"The Bleeder"},{"name":"bandage","value":2,"label":"Bandage"},{"name":"breathalyzer","value":1,"label":"Breathalyzer"},{"name":"fingerprintkit","value":1,"label":"Fingerprint Kit"},{"name":"sdcard","value":1,"label":"SD Card"},{"name":"dnatestkit","value":3,"label":"DNA Field Swab Kit"},{"name":"drugtestkit","value":3,"label":"DNA Field Swab Kit"},{"name":"gsrtestkit","value":2,"label":"GSR Field Test Kit"},{"name":"id_card","value":1,"label":"ID Card"},{"name":"driver_license","value":1,"label":"Drivers License"},{"name":"fingerprinttape","value":1,"label":"Fingerprint Tape"},{"name":"mikrosil","value":1,"label":"Mikrosil"},{"name":"money","value":430,"label":"Money"}],"steamId":"11000014c70b050","discordId":"932306801687420960","coords":{"x":-172.73406982421876,"y":-1169.221923828125,"z":23.028564453125},"health":100,"customData":[]},{"name":"DemonsAngel90","identifier":"53d63cef03bd84bee2778d19ae409b18c859187a","fivemLicense":"53d63cef03bd84bee2778d19ae409b18c859187a","playerId":10,"isOnline":true,"armor":0,"inventory":[{"name":"WEAPON_FLASHLIGHT","value":1,"label":"Flashlight"},{"name":"WEAPON_RAM7","value":1,"label":"RAM-7"},{"name":"wet_blue_phone","value":1,"label":"Wet Blue Phone"},{"name":"toolbox","value":1,"label":"Toolbox"},{"name":"advancedlockpick","value":8,"label":"Advanced Lockpick"},{"name":"emptyvial","value":11,"label":"Empty Vial"},{"name":"rifle_ammo","value":160,"label":"Rifle Ammo"},{"name":"WEAPON_RAM7","value":1,"label":"RAM-7"},{"name":"repairkit","value":1,"label":"Repairkit"},{"name":"cubancigar","value":4,"label":"Cuban Cigar"},{"name":"livery","value":1,"label":"Livery Roll"},{"name":"advancedrepairkit","value":1,"label":"Advanced Repairkit"},{"name":"mechanic_tools","value":1,"label":"Mechanic tools"},{"name":"ifaks","value":3,"label":"ifaks"},{"name":"WEAPON_RAM7","value":1,"label":"RAM-7"},{"name":"money","value":522121,"label":"Money"},{"name":"bandage","value":100,"label":"Bandage"},{"name":"stone","value":6,"label":"Stone"},{"name":"uncut_ruby","value":5,"label":"Uncut Ruby"},{"name":"uncut_diamond","value":7,"label":"Uncut Diamond"},{"name":"accesstool","value":1,"label":"Access Tool"},{"name":"WEAPON_TEC9S","value":1,"label":"TEC 9 W STRAP"},{"name":"trowel","value":1,"label":"Trowel"},{"name":"water_bottle","value":22,"label":"Bottle of Water"},{"name":"lighter","value":1,"label":"Lighter"},{"name":"pistol_ammo","value":434,"label":"Pistol Ammo"},{"name":"binoculars","value":1,"label":"Binoculars"},{"name":"uncut_sapphire","value":4,"label":"Uncut Sapphire"},{"name":"pickaxe","value":1,"label":"Pickaxe"},{"name":"uncut_emerald","value":5,"label":"Uncut Emerald"},{"name":"ammo-rifle","value":200,"label":"5.56x45"},{"name":"pdmcontract","value":1,"label":"PDM Contract"},{"name":"goldpan","value":1,"label":"Gold Panning Tray"},{"name":"miningdrill","value":1,"label":"Mining Drill"},{"name":"mininglaser","value":1,"label":"Mining Laser"},{"name":"drillbit","value":20,"label":"Drill Bit"},{"name":"copperore","value":12,"label":"Copper Ore"},{"name":"goldore","value":5,"label":"Gold Ore"},{"name":"silica","value":2,"label":"Silica"},{"name":"carbon","value":7,"label":"Carbon"},{"name":"quartz","value":5,"label":"Quartz"},{"name":"ironore","value":6,"label":"Iron Ore"},{"name":"nos","value":2,"label":"NOS Bottle"},{"name":"lockpick","value":12,"label":"Lockpick"},{"name":"screwdriverset","value":2,"label":"Toolkit"},{"name":"paintcan","value":1,"label":"Vehicle Spray Can"},{"name":"paintcan","value":1,"label":"Vehicle Spray Can"}],"steamId":"11000014a8f3402","discordId":"835917888069435423","coords":{"x":-178.73406982421876,"y":-1163.3011474609376,"z":22.6409912109375},"health":100,"customData":[]},{"name":"SBDemon","identifier":"f90cd271ae404268c3728c7b32d31095b7092b5b","fivemLicense":"f90cd271ae404268c3728c7b32d31095b7092b5b","playerId":9,"isOnline":true,"armor":0,"inventory":[{"name":"WEAPON_CARTELARP","value":1,"label":"CARTEL ARP"},{"name":"WEAPON_MIDASGLOCK","value":1,"label":"MIDAS GLOCK"},{"name":"lockpick","value":17,"label":"Lockpick"},{"name":"radiocar_blue","value":1,"label":"radiocar blue style"},{"name":"money","value":346660,"label":"Money"},{"name":"driver_license","value":1,"label":"Drivers License"},{"name":"id_card","value":1,"label":"ID Card"},{"name":"oxy","value":13,"label":"Prescription Oxy"},{"name":"trowel","value":1,"label":"Trowel"}],"steamId":"110000142ba0053","discordId":"677439579585773589","coords":{"x":-171.95603942871095,"y":-1169.6834716796876,"z":23.028564453125},"health":100,"customData":[]}]', '{"messages":[{"message":"Test","author":{"name":"SBDemon","identifier":"f90cd271ae404268c3728c7b32d31095b7092b5b"},"created_at":"2024-10-13 12:49:08","isSaved":false,"isAdmin":true,"id":1}],"players":[]}', '{"logs":[{"time":"2024-10-13 12:49:04","text":"SBDemon created report with ID 1","player":"f90cd271ae404268c3728c7b32d31095b7092b5b","title":"CREATE_REPORT","playerName":"SBDemon"},{"time":"2024-10-13 12:49:08","text":"SBDemon added message with ID 1","player":"f90cd271ae404268c3728c7b32d31095b7092b5b","title":"ADD_MESSAGE","playerName":"SBDemon"},{"time":"2024-10-13 12:49:17","text":"SBDemon enters report with ID 1","admin":"f90cd271ae404268c3728c7b32d31095b7092b5b","title":"ADMIN_ENTERS_REPORT","adminName":"SBDemon"},{"time":"2024-10-13 12:49:17","text":"SBDemon set in resolve report with ID 1","admin":"f90cd271ae404268c3728c7b32d31095b7092b5b","title":"SET_IN_RESOLVE","adminName":"SBDemon"},{"time":"2024-10-13 12:49:34","text":"SBDemon leaved report with ID 1","admin":"f90cd271ae404268c3728c7b32d31095b7092b5b","title":"ADMIN_LEAVES_REPORT","adminName":"SBDemon"},{"time":"2024-10-13 12:50:08","text":"SBDemon enters report with ID 1","admin":"f90cd271ae404268c3728c7b32d31095b7092b5b","title":"ADMIN_ENTERS_REPORT","adminName":"SBDemon"},{"time":"2024-10-13 12:50:11","text":"SBDemon closed report with ID 1","admin":"f90cd271ae404268c3728c7b32d31095b7092b5b","title":"CLOSED_REPORT","adminName":"SBDemon"}]}'),
	(2, '{"name":"TamerWaves","identifier":"340e13c7d15e0f07ff7ed5e66a62423ae74f5915","reportsOpenedByCommand":"report"}', 'Casino, everything is invisible', 'RESOLVED', NULL, '2024-10-13 12:50:38', '2024-10-13 12:50:44', '{"name":"DocJay69","identifier":"17c08e084f072db994a114b63ea05a8373230d0f"}', '2024-10-13 12:51:46', '{"name":"SBDemon","identifier":"f90cd271ae404268c3728c7b32d31095b7092b5b"}', '[{"name":"TamerWaves","identifier":"340e13c7d15e0f07ff7ed5e66a62423ae74f5915","fivemLicense":"340e13c7d15e0f07ff7ed5e66a62423ae74f5915","playerId":8,"isOnline":true,"armor":0,"inventory":[{"name":"WEAPON_CERAMICPISTOL","value":1,"label":"Ceramic Pistol"},{"name":"sandwich","value":6,"label":"Sandwich"},{"name":"coffee","value":11,"label":"Coffee"},{"name":"vape","value":1,"label":"Vape"},{"name":"blue_phone","value":1,"label":"Blue Phone"},{"name":"lockpick","value":14,"label":"Lockpick"},{"name":"marlborocig","value":15,"label":"Marlboro Cigarette"},{"name":"oxy","value":6,"label":"Prescription Oxy"},{"name":"pistol_ammo","value":10,"label":"Pistol Ammo"},{"name":"bandage","value":7,"label":"Bandage"},{"name":"drillbit","value":4,"label":"Drill Bit"},{"name":"goldpan","value":1,"label":"Gold Panning Tray"},{"name":"id_card","value":1,"label":"ID Card"},{"name":"driver_license","value":1,"label":"Drivers License"},{"name":"money","value":21082,"label":"Money"},{"name":"kq_outfitbag","value":1,"label":"Outfit bag"},{"name":"lighter","value":1,"label":"Lighter"},{"name":"pickaxe","value":1,"label":"Pickaxe"},{"name":"WEAPON_HAMMER","value":1,"label":"Hammer"},{"name":"kq_expensive_bag","value":1,"label":"Designer bag"},{"name":"WEAPON_GOLFCLUB","value":1,"label":"Golf Club"},{"name":"miningdrill","value":1,"label":"Mining Drill"},{"name":"cryptostick","value":1,"label":"Crypto Stick"},{"name":"repairkit","value":1,"label":"Repairkit"},{"name":"WEAPON_GOLFCLUB","value":1,"label":"Golf Club"},{"name":"cryptostick","value":1,"label":"Crypto Stick"},{"name":"WEAPON_HAMMER","value":1,"label":"Hammer"},{"name":"WEAPON_HAMMER","value":1,"label":"Hammer"},{"name":"mininglaser","value":1,"label":"Mining Laser"},{"name":"screwdriverset","value":1,"label":"Toolkit"},{"name":"diamond_ring","value":1,"label":"Diamond Ring"},{"name":"drillbit","value":10,"label":"Drill Bit"}],"steamId":"11000013e4f712e","discordId":"431932035683057665","coords":{"x":-133.62197875976563,"y":-1149.9033203125,"z":24.4945068359375},"health":100,"customData":[]}]', '{"messages":[{"message":"We are working on it ","author":{"name":"SBDemon","identifier":"f90cd271ae404268c3728c7b32d31095b7092b5b"},"created_at":"2024-10-13 12:51:28","isSaved":false,"isAdmin":true,"id":1}],"players":[]}', '{"logs":[{"time":"2024-10-13 12:50:38","text":"TamerWaves created report with ID 2","player":"340e13c7d15e0f07ff7ed5e66a62423ae74f5915","title":"CREATE_REPORT","playerName":"TamerWaves"},{"time":"2024-10-13 12:50:44","text":"DocJay69 enters report with ID 2","admin":"17c08e084f072db994a114b63ea05a8373230d0f","title":"ADMIN_ENTERS_REPORT","adminName":"DocJay69"},{"time":"2024-10-13 12:50:44","text":"DocJay69 set in resolve report with ID 2","admin":"17c08e084f072db994a114b63ea05a8373230d0f","title":"SET_IN_RESOLVE","adminName":"DocJay69"},{"time":"2024-10-13 12:50:54","text":"SBDemon enters report with ID 2","admin":"f90cd271ae404268c3728c7b32d31095b7092b5b","title":"ADMIN_ENTERS_REPORT","adminName":"SBDemon"},{"time":"2024-10-13 12:51:12","text":"DocJay69 leaved report with ID 2","admin":"17c08e084f072db994a114b63ea05a8373230d0f","title":"ADMIN_LEAVES_REPORT","adminName":"DocJay69"},{"time":"2024-10-13 12:51:18","text":"DemonsAngel90 enters report with ID 2","admin":"53d63cef03bd84bee2778d19ae409b18c859187a","title":"ADMIN_ENTERS_REPORT","adminName":"DemonsAngel90"},{"time":"2024-10-13 12:51:26","text":"DemonsAngel90 leaved report with ID 2","admin":"53d63cef03bd84bee2778d19ae409b18c859187a","title":"ADMIN_LEAVES_REPORT","adminName":"DemonsAngel90"},{"time":"2024-10-13 12:51:28","text":"SBDemon added message with ID 1","player":"f90cd271ae404268c3728c7b32d31095b7092b5b","title":"ADD_MESSAGE","playerName":"SBDemon"},{"time":"2024-10-13 12:51:31","text":"DocJay69 enters report with ID 2","admin":"17c08e084f072db994a114b63ea05a8373230d0f","title":"ADMIN_ENTERS_REPORT","adminName":"DocJay69"},{"time":"2024-10-13 12:51:46","text":"SBDemon closed report with ID 2","admin":"f90cd271ae404268c3728c7b32d31095b7092b5b","title":"CLOSED_REPORT","adminName":"SBDemon"}]}');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table worldisyours.store_jobs: ~0 rows (approximately)

-- Dumping structure for table worldisyours.store_users_theme
CREATE TABLE IF NOT EXISTS `store_users_theme` (
  `user_id` varchar(50) NOT NULL,
  `dark_theme` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table worldisyours.store_users_theme: ~10 rows (approximately)
INSERT INTO `store_users_theme` (`user_id`, `dark_theme`) VALUES
	('AIM07751', 1),
	('CTM94839', 1),
	('ENW45444', 1),
	('JVH49125', 1),
	('JXD83837', 1),
	('LPI62642', 1),
	('OUV63962', 1),
	('QCD01130', 1),
	('QNC46912', 1),
	('TOD22598', 1);

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
INSERT INTO `twitter_account` (`id`, `name`, `phone`, `username`, `password`, `avatar`) VALUES
	('LPI62642', 'RR', '1177833293', 'Ryan Rich', '12345', 'https://media.discordapp.net/attachments/1268798751234068513/1293785339931922483/screenshot.jpg?ex=6708a2fe&is=6707517e&hm=ae7ccf46f157456dd0e4c71ffb4f74c6aa6730eb2f3eb324e236107be2ec7318&');

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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
