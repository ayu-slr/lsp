-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for kompeten
CREATE DATABASE IF NOT EXISTS `kompeten` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kompeten`;

-- Dumping structure for table kompeten.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kompeten.cache: ~4 rows (approximately)
INSERT IGNORE INTO `cache` (`key`, `value`, `expiration`) VALUES
	('bintang1@gmail.com|127.0.0.1', 'i:1;', 1778479975),
	('bintang1@gmail.com|127.0.0.1:timer', 'i:1778479975;', 1778479975),
	('romadani@gmail.com|127.0.0.1', 'i:4;', 1778479994),
	('romadani@gmail.com|127.0.0.1:timer', 'i:1778479994;', 1778479994);

-- Dumping structure for table kompeten.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kompeten.cache_locks: ~0 rows (approximately)

-- Dumping structure for table kompeten.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kompeten.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table kompeten.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kompeten.jobs: ~0 rows (approximately)

-- Dumping structure for table kompeten.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kompeten.job_batches: ~0 rows (approximately)

-- Dumping structure for table kompeten.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kompeten.migrations: ~11 rows (approximately)
INSERT IGNORE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2026_05_11_020054_create_pesertas_table', 1),
	(5, '2026_05_11_021051_create_skemas_table', 2),
	(6, '2026_05_11_024454_add_role_to_users_table', 3),
	(7, '2026_05_11_025057_add_status_to_pesertas_table', 4),
	(8, '2026_05_11_030322_add_certificate_and_comment_to_pesertas_table', 5),
	(9, '2026_05_11_032148_create_notifications_table', 6),
	(10, '2026_05_11_034058_add_kode_daftar_to_pesertas_table', 7),
	(11, '2026_05_11_043036_add_profile_fields_to_users_table', 8);

-- Dumping structure for table kompeten.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kompeten.notifications: ~5 rows (approximately)
INSERT IGNORE INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
	('190bed47-1c4a-4f0c-8ca1-e9575efb7038', 'App\\Notifications\\AdminNewRegistrationNotification', 'App\\Models\\User', 2, '{"peserta_id":6,"nama_peserta":"Andi Prayogi","kode_daftar":"BNSP-20260511-Z6YG","skema":"Junior Web Programming","message":"[BNSP-20260511-Z6YG] Pendaftaran baru atas nama Andi Prayogi untuk skema Junior Web Programming."}', NULL, '2026-05-10 23:21:02', '2026-05-10 23:21:02'),
	('3bded95f-6b63-434f-946a-cf2a1c863454', 'App\\Notifications\\UserStatusUpdatedNotification', 'App\\Models\\User', 4, '{"peserta_id":4,"kode_daftar":"BNSP-20260511-URK3","status":"Kompeten","message":"[BNSP-20260511-URK3] Status kelulusan Anda untuk skema Junior Web Programming telah diperbarui menjadi: KOMPETEN"}', '2026-05-10 20:51:45', '2026-05-10 20:51:34', '2026-05-10 20:51:45'),
	('49316126-8164-41ea-aa8b-27e451aec4a6', 'App\\Notifications\\AdminNewRegistrationNotification', 'App\\Models\\User', 2, '{"peserta_id":5,"nama_peserta":"ROMADANI","kode_daftar":"BNSP-20260511-R13U","skema":"Junior Web Programming","message":"[BNSP-20260511-R13U] Pendaftaran baru atas nama ROMADANI untuk skema Junior Web Programming."}', '2026-05-10 21:28:28', '2026-05-10 21:28:04', '2026-05-10 21:28:28'),
	('5b203e78-9ecc-43d5-88b4-66da0d22d637', 'App\\Notifications\\UserStatusUpdatedNotification', 'App\\Models\\User', 5, '{"peserta_id":5,"kode_daftar":"BNSP-20260511-R13U","status":"Belum Kompeten","message":"[BNSP-20260511-R13U] Status kelulusan Anda untuk skema Junior Web Programming telah diperbarui menjadi: BELUM KOMPETEN"}', '2026-05-10 21:46:19', '2026-05-10 21:46:08', '2026-05-10 21:46:19'),
	('d4dbdf01-dfbc-4835-be61-8fee030e5d58', 'App\\Notifications\\AdminNewRegistrationNotification', 'App\\Models\\User', 2, '{"peserta_id":4,"nama_peserta":"Bintang Simanjuntak","kode_daftar":"BNSP-20260511-URK3","skema":"Junior Web Programming","message":"[BNSP-20260511-URK3] Pendaftaran baru atas nama Bintang Simanjuntak untuk skema Junior Web Programming."}', '2026-05-10 20:50:12', '2026-05-10 20:49:56', '2026-05-10 20:50:12');

-- Dumping structure for table kompeten.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kompeten.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table kompeten.pesertas
CREATE TABLE IF NOT EXISTS `pesertas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_daftar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_peserta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skema_sertifikasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_kompetensi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Belum Dinilai',
  `sertifikat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `komentar` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pesertas_email_unique` (`email`),
  UNIQUE KEY `pesertas_kode_daftar_unique` (`kode_daftar`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kompeten.pesertas: ~3 rows (approximately)
INSERT IGNORE INTO `pesertas` (`id`, `kode_daftar`, `nama_peserta`, `email`, `telepon`, `skema_sertifikasi`, `status_kompetensi`, `sertifikat`, `komentar`, `created_at`, `updated_at`) VALUES
	(4, 'BNSP-20260511-URK3', 'Bintang Simanjuntak', 'bintang1@gmail.com', '+6281254876588', 'Junior Web Programming', 'Kompeten', 'sertifikat/xVKve9ufAYvMyH15Z3Vy5hfTCai23hRUniFKiHHG.pdf', NULL, '2026-05-10 20:49:56', '2026-05-10 20:51:34'),
	(5, 'BNSP-20260511-R13U', 'ROMADANI', 'romadani@gmail.com', '+6281254876588', 'Junior Web Programming', 'Belum Kompeten', NULL, 'Tidak mengerti logika', '2026-05-10 21:28:04', '2026-05-10 21:46:08'),
	(6, 'BNSP-20260511-Z6YG', 'Andi Prayogi', 'andi1@gmail.com', '+6287748435730', 'Junior Web Programming', 'Belum Dinilai', NULL, NULL, '2026-05-10 23:21:02', '2026-05-10 23:21:02');

-- Dumping structure for table kompeten.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kompeten.sessions: ~2 rows (approximately)
INSERT IGNORE INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('oEZzIv6izShb629v6KXQh6w0f1QHCXAaDBTj2C5g', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkRqR2E3am1sSEsxU3p2dGFCa2dhelZ0cXdabnNjQVM5UlA4WTdVciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fX0=', 1778480728),
	('UWMxzDF0wyGIbaPQsnV7UlVDbOpJUyoFHnhBxTRH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFNqeUhhSHJWWUw5R1hKU2J6UnBTVkNOSmQ1MEhwdXd0c0VPVDJPZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fX0=', 1778474796);

-- Dumping structure for table kompeten.skemas
CREATE TABLE IF NOT EXISTS `skemas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_skema` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kompeten.skemas: ~2 rows (approximately)
INSERT IGNORE INTO `skemas` (`id`, `nama_skema`, `created_at`, `updated_at`) VALUES
	(1, 'Junior Web Programming', '2026-05-10 19:13:41', '2026-05-10 19:13:41'),
	(2, 'Desain Grafis Muda', '2026-05-10 19:13:41', '2026-05-10 19:13:41');

-- Dumping structure for table kompeten.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kompeten.users: ~3 rows (approximately)
INSERT IGNORE INTO `users` (`id`, `name`, `email`, `phone`, `photo`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(2, 'Super Admin', 'admin@bnsp.com', '+6287748435730', 'profile_photos/NhvrAOZnOEpWv8GzBgWP1WfFB4aMhm9ENM9URuxA.jpg', 'admin', NULL, '$2y$12$sDo33/uJxvnIIhRVPgotbOHLyb7dXCc3..dYTVDKIykLxE9KVOIh.', NULL, '2026-05-10 19:17:04', '2026-05-10 23:16:15'),
	(4, 'Andi Prayogi', 'andi1@gmail.com', '+6287748435730', 'profile_photos/NhvrAOZnOEpWv8GzBgWP1WfFB4aMhm9ENM9URuxA.jpg', 'user', NULL, '$2y$12$sDo33/uJxvnIIhRVPgotbOHLyb7dXCc3..dYTVDKIykLxE9KVOIh.', NULL, '2026-05-10 20:49:45', '2026-05-10 20:49:45'),
	(5, 'ROMADANI', 'romadani@gmail.com', NULL, NULL, 'user', NULL, '$2y$12$sDo33/uJxvnIIhRVPgotbOHLyb7dXCc3..dYTVDKIykLxE9KVOIh.', NULL, '2026-05-10 21:27:46', '2026-05-10 21:27:46');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
