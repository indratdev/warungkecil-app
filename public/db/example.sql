-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for wkposdb
DROP DATABASE IF EXISTS `wkposdb`;
CREATE DATABASE IF NOT EXISTS `wkposdb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `wkposdb`;

-- Dumping structure for table wkposdb.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table wkposdb.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table wkposdb.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table wkposdb.migrations: ~5 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(36, '2014_10_12_000000_create_users_table', 1),
	(37, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(38, '2019_08_19_000000_create_failed_jobs_table', 1),
	(39, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(40, '2024_05_08_071258_create_master_projects_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table wkposdb.m_project
DROP TABLE IF EXISTS `m_project`;
CREATE TABLE IF NOT EXISTS `m_project` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `npwp` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table wkposdb.m_project: ~1 rows (approximately)
DELETE FROM `m_project`;
/*!40000 ALTER TABLE `m_project` DISABLE KEYS */;
INSERT INTO `m_project` (`id`, `owner_id`, `name`, `branch_name`, `address`, `province`, `city`, `zipcode`, `npwp`, `phone`, `active`, `deleted`, `created_at`, `updated_at`) VALUES
	(1, 1, 'PT SUKASARI', 'PT SUKASARI', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL);
/*!40000 ALTER TABLE `m_project` ENABLE KEYS */;

-- Dumping structure for table wkposdb.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table wkposdb.password_reset_tokens: ~0 rows (approximately)
DELETE FROM `password_reset_tokens`;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;

-- Dumping structure for table wkposdb.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table wkposdb.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for procedure wkposdb.sp_user_create_user
DROP PROCEDURE IF EXISTS `sp_user_create_user`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_create_user`(
	IN `PARAM_USER_NAME` VARCHAR(255),
	IN `PARAM_USER_EMAIL` VARCHAR(255),
	IN `PARAM_USER_PASS` TEXT,
	IN `PARAM_USER_TOKEN` VARCHAR(255)



,
	IN `PARAM_USER_BIRTH_DATE` VARCHAR(255),
	IN `PARAM_USER_GENDER` VARCHAR(16),
	IN `PARAM_USER_PHONE` VARCHAR(50),
	IN `PARAM_USER_ADDRESS` TEXT
)
BEGIN

    IF EXISTS (
        SELECT email FROM users
        WHERE email = PARAM_USER_EMAIL COLLATE utf8_unicode_ci
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data already exists.';
    END IF;

    INSERT INTO users (
        name
        , email
        , password
        , role_user
        , birth_date
        , gender
        , phone
        , address
        , remember_token
        , created_at
    )
    VALUES (
        PARAM_USER_NAME
        , PARAM_USER_EMAIL
		  , PARAM_USER_PASS
		  , 'admin'
		  , PARAM_USER_BIRTH_DATE
		  , PARAM_USER_GENDER
  		  , PARAM_USER_PHONE
  		  , PARAM_USER_ADDRESS
		  , PARAM_USER_TOKEN
		  , NOW()
    );

    
END//
DELIMITER ;

-- Dumping structure for procedure wkposdb.sp_user_read_all
DROP PROCEDURE IF EXISTS `sp_user_read_all`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_read_all`()
BEGIN
 SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    -- Jalankan query untuk membaca semua data pengguna
    SELECT *
    FROM users
    order by email
	 ;

    -- Setel level isolasi transaksi kembali ke nilai default (REPEATABLE READ)
    SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

END//
DELIMITER ;

-- Dumping structure for procedure wkposdb.sp_user_read_by_email
DROP PROCEDURE IF EXISTS `sp_user_read_by_email`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_read_by_email`(
	IN `param_email` VARCHAR(255)

)
BEGIN
 SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    SELECT *
FROM users
WHERE email LIKE CONCAT('%', param_email, '%');

    
    SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

END//
DELIMITER ;

-- Dumping structure for procedure wkposdb.sp_user_read_userExist
DROP PROCEDURE IF EXISTS `sp_user_read_userExist`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_read_userExist`(
	IN `param_email` VARCHAR(255)
)
BEGIN
 SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    SELECT count(*)
    FROM users
	 where
	 	email LIKE '%''param_email''%'
	 ;

    
    SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

END//
DELIMITER ;

-- Dumping structure for table wkposdb.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_user` varchar(255) NOT NULL DEFAULT 'staff',
  `birth_date` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table wkposdb.users: ~12 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_user`, `birth_date`, `gender`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Test User', 'admin@admin.com', '2024-05-08 08:58:35', '$2y$12$0ZVqhPAfZZmQA6w/PFFVs.1BrdEH3D5OwMxoop3LCjPp28/kCWOVe', 'admin', NULL, NULL, NULL, NULL, 'sAwTQXc3b1', '2024-05-08 08:58:35', '2024-05-08 08:58:35'),
	(2, 'Dr. Mateo Kilback', 'tolson@example.net', '2024-05-08 08:58:35', '$2y$12$gBB2zkhoT1bLXQYjsTh.M.o.a9nab7/ef3NRFvfk2oSViqFbQX956', 'staff', NULL, NULL, NULL, NULL, 'KvbVtuxSh0', '2024-05-08 08:58:35', '2024-05-08 08:58:35'),
	(3, 'Boris Dietrich', 'lubowitz.lincoln@example.com', '2024-05-08 08:58:35', '$2y$12$gBB2zkhoT1bLXQYjsTh.M.o.a9nab7/ef3NRFvfk2oSViqFbQX956', 'staff', NULL, NULL, NULL, NULL, 'OMEcGZtkdQ', '2024-05-08 08:58:35', '2024-05-08 08:58:35'),
	(4, 'Annette Schuster DDS', 'roel80@example.org', '2024-05-08 08:58:35', '$2y$12$gBB2zkhoT1bLXQYjsTh.M.o.a9nab7/ef3NRFvfk2oSViqFbQX956', 'staff', NULL, NULL, NULL, NULL, 'TKfpEXWxUS', '2024-05-08 08:58:35', '2024-05-08 08:58:35'),
	(5, 'Prof. Malvina Tillman', 'qharber@example.net', '2024-05-08 08:58:35', '$2y$12$gBB2zkhoT1bLXQYjsTh.M.o.a9nab7/ef3NRFvfk2oSViqFbQX956', 'staff', NULL, NULL, NULL, NULL, 'O9jqr4QWoS', '2024-05-08 08:58:35', '2024-05-08 08:58:35'),
	(6, 'Dr. Santina Nienow II', 'dshanahan@example.net', '2024-05-08 08:58:35', '$2y$12$gBB2zkhoT1bLXQYjsTh.M.o.a9nab7/ef3NRFvfk2oSViqFbQX956', 'staff', NULL, NULL, NULL, NULL, 'Rf1MjOYKR0', '2024-05-08 08:58:35', '2024-05-08 08:58:35'),
	(7, 'Burnice Marks', 'haley.ezequiel@example.net', '2024-05-08 08:58:35', '$2y$12$gBB2zkhoT1bLXQYjsTh.M.o.a9nab7/ef3NRFvfk2oSViqFbQX956', 'staff', NULL, NULL, NULL, NULL, 't9aGnCBFV4', '2024-05-08 08:58:35', '2024-05-08 08:58:35'),
	(8, 'Trenton Harris', 'bartoletti.katelin@example.net', '2024-05-08 08:58:35', '$2y$12$gBB2zkhoT1bLXQYjsTh.M.o.a9nab7/ef3NRFvfk2oSViqFbQX956', 'staff', NULL, NULL, NULL, NULL, 'AtZjxugtSm', '2024-05-08 08:58:35', '2024-05-08 08:58:35'),
	(9, 'Trey Dietrich', 'camylle.mann@example.com', '2024-05-08 08:58:35', '$2y$12$gBB2zkhoT1bLXQYjsTh.M.o.a9nab7/ef3NRFvfk2oSViqFbQX956', 'staff', NULL, NULL, NULL, NULL, 'J65ivnWmbY', '2024-05-08 08:58:35', '2024-05-08 08:58:35'),
	(10, 'Mr. Alf Tillman', 'richie38@example.org', '2024-05-08 08:58:35', '$2y$12$gBB2zkhoT1bLXQYjsTh.M.o.a9nab7/ef3NRFvfk2oSViqFbQX956', 'staff', NULL, NULL, NULL, NULL, 'BEs2Mxoh5n', '2024-05-08 08:58:35', '2024-05-08 08:58:35'),
	(11, 'Miss Lucile Tromp Sr.', 'tyrese76@example.com', '2024-05-08 08:58:35', '$2y$12$gBB2zkhoT1bLXQYjsTh.M.o.a9nab7/ef3NRFvfk2oSViqFbQX956', 'staff', NULL, NULL, NULL, NULL, 'FYa5aJwIJK', '2024-05-08 08:58:35', '2024-05-08 08:58:35'),
	(12, 'jojo', 'juminten@mail.com', NULL, '$2y$12$HYuzcbRPMzJAX95PuisDnuKsbln0Azq1khPP8EcEGhDjFkF/aSXl6', 'admin', '', 'Male', '08776655445', 'jalan jalan', 'yCBHS7GFcgzijiLoKB1wrafuxxT61l8pXPQNldGS', '2024-05-08 16:01:08', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
