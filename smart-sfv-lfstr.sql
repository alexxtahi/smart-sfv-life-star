-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour smart-sfv-life-star-bd
CREATE DATABASE IF NOT EXISTS `smart-sfv-life-star-bd` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `smart-sfv-life-star-bd`;

-- Listage de la structure de la table smart-sfv-life-star-bd. abonnements
CREATE TABLE IF NOT EXISTS `abonnements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `numero_abonnement` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_decodeur` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse_decodeur` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_abonnement` date NOT NULL,
  `duree` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_debut` date NOT NULL,
  `payement_abonnement` bigint(20) unsigned DEFAULT NULL,
  `payement_equipement` bigint(20) unsigned DEFAULT NULL,
  `type_abonnement_id` int(10) unsigned NOT NULL,
  `abonne_id` int(10) unsigned NOT NULL,
  `agence_id` int(10) unsigned NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.abonnements : ~0 rows (environ)
/*!40000 ALTER TABLE `abonnements` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonnements` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. abonnement_option_canal
CREATE TABLE IF NOT EXISTS `abonnement_option_canal` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `abonnement_id` bigint(20) unsigned NOT NULL,
  `option_canal_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abonnement_option_canal_abonnement_id_foreign` (`abonnement_id`),
  KEY `abonnement_option_canal_option_canal_id_foreign` (`option_canal_id`),
  CONSTRAINT `abonnement_option_canal_abonnement_id_foreign` FOREIGN KEY (`abonnement_id`) REFERENCES `abonnements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abonnement_option_canal_option_canal_id_foreign` FOREIGN KEY (`option_canal_id`) REFERENCES `option_canals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.abonnement_option_canal : ~0 rows (environ)
/*!40000 ALTER TABLE `abonnement_option_canal` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonnement_option_canal` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. abonnes
CREATE TABLE IF NOT EXISTS `abonnes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `full_name_abonne` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `civilite` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naissance_abonne` date NOT NULL,
  `adresse_abonne` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `localite_id` int(10) unsigned NOT NULL,
  `nation_id` int(10) unsigned DEFAULT NULL,
  `numero_piece` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_postal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_abonne` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_conjoint` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_piece_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.abonnes : ~0 rows (environ)
/*!40000 ALTER TABLE `abonnes` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonnes` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. agences
CREATE TABLE IF NOT EXISTS `agences` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_agence` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_identifiant_agence` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_agence` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `localite_id` int(11) NOT NULL,
  `adresse_agence` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_responsable` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_responsable` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_agence` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_cc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agences_numero_identifiant_agence_unique` (`numero_identifiant_agence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.agences : ~0 rows (environ)
/*!40000 ALTER TABLE `agences` DISABLE KEYS */;
/*!40000 ALTER TABLE `agences` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. approvisionnements
CREATE TABLE IF NOT EXISTS `approvisionnements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_approvisionnement` date NOT NULL,
  `depot_id` int(11) NOT NULL,
  `fournisseur_id` int(11) DEFAULT NULL,
  `acompte_approvisionnement` bigint(20) NOT NULL DEFAULT '0',
  `numero_conteneur` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_declaration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_immatriculation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remise_id` int(11) DEFAULT NULL,
  `scan_facture_fournisseur` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.approvisionnements : ~17 rows (environ)
/*!40000 ALTER TABLE `approvisionnements` DISABLE KEYS */;
INSERT INTO `approvisionnements` (`id`, `date_approvisionnement`, `depot_id`, `fournisseur_id`, `acompte_approvisionnement`, `numero_conteneur`, `numero_declaration`, `numero_immatriculation`, `remise_id`, `scan_facture_fournisseur`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, '2021-08-20', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:13:52'),
	(2, '2021-08-20', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(3, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 00:47:47', '2021-08-21 00:47:47'),
	(4, '2021-08-21', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 00:50:57', '2021-08-21 00:50:57'),
	(5, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:04:39', '2021-08-21 01:04:39'),
	(6, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:12:06', '2021-08-21 01:12:06'),
	(7, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:16:48', '2021-08-21 01:16:48'),
	(8, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:23:21', '2021-08-21 01:23:21'),
	(9, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:27:08', '2021-08-21 01:27:08'),
	(10, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:29:11', '2021-08-21 01:29:11'),
	(11, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:36:15', '2021-08-21 01:36:15'),
	(12, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:39:10', '2021-08-21 01:39:10'),
	(13, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:52:10', '2021-08-21 01:52:10'),
	(14, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 02:06:31', '2021-08-21 02:06:31'),
	(15, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 02:10:12', '2021-08-21 02:10:12'),
	(16, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 02:12:28', '2021-08-21 02:12:28'),
	(17, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 02:15:43', '2021-08-21 02:15:43'),
	(18, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 02:58:33', '2021-08-21 02:58:33'),
	(19, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 03:43:00', '2021-08-21 03:43:00'),
	(20, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 04:25:07', '2021-08-21 04:25:07'),
	(21, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 05:39:39', '2021-08-21 05:39:39'),
	(22, '2021-08-21', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, '2021-08-21 23:32:26', '2021-08-21 23:32:26'),
	(23, '2021-08-22', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-22 00:55:44', '2021-08-22 00:55:44'),
	(24, '2021-08-22', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-22 01:09:40', '2021-08-22 01:09:40'),
	(25, '2021-08-22', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-22 02:35:11', '2021-08-22 02:35:11'),
	(26, '2021-08-22', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-22 02:39:41', '2021-08-22 02:39:41'),
	(27, '2021-08-22', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-22 02:46:09', '2021-08-22 02:46:09');
/*!40000 ALTER TABLE `approvisionnements` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. articles
CREATE TABLE IF NOT EXISTS `articles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description_article` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `prix_achat_ttc` int(11) NOT NULL,
  `prix_vente_ttc_base` int(11) DEFAULT NULL,
  `quantite_en_stock` int(11) NOT NULL DEFAULT '0',
  `sous_categorie_id` int(11) DEFAULT NULL,
  `code_barre` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_interne` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rayon_id` int(11) DEFAULT NULL,
  `rangee_id` int(11) DEFAULT NULL,
  `unite_id` int(11) DEFAULT NULL,
  `taille_id` int(11) DEFAULT NULL,
  `param_tva_id` int(11) DEFAULT NULL,
  `taux_airsi_achat` int(11) DEFAULT NULL,
  `taux_airsi_vente` int(11) DEFAULT NULL,
  `poids_net` int(11) DEFAULT NULL,
  `poids_brut` int(11) DEFAULT NULL,
  `stock_mini` int(11) DEFAULT NULL,
  `stock_max` int(11) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `prix_vente_en_gros_base` int(11) DEFAULT NULL,
  `prix_vente_demi_gros_base` int(11) DEFAULT NULL,
  `prix_pond_ttc` int(11) DEFAULT NULL,
  `image_article` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stockable` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.articles : ~83 rows (environ)
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` (`id`, `description_article`, `categorie_id`, `prix_achat_ttc`, `prix_vente_ttc_base`, `quantite_en_stock`, `sous_categorie_id`, `code_barre`, `reference_interne`, `rayon_id`, `rangee_id`, `unite_id`, `taille_id`, `param_tva_id`, `taux_airsi_achat`, `taux_airsi_vente`, `poids_net`, `poids_brut`, `stock_mini`, `stock_max`, `volume`, `prix_vente_en_gros_base`, `prix_vente_demi_gros_base`, `prix_pond_ttc`, `image_article`, `stockable`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Laurent Perrier Brut', 1, 28000, 60000, 0, NULL, '1', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 15:51:43', '2021-08-20 13:16:13'),
	(2, 'Laurent Perrier Demi-Sec', 1, 27000, 60000, 0, NULL, '2', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 15:59:59', '2021-08-20 13:20:32'),
	(3, 'Moët & Chandon Brut', 1, 28000, 70000, 0, NULL, '3', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:01:29', '2021-08-20 12:58:09'),
	(4, 'Moët & Chandon Nectar', 1, 35000, 70000, 0, NULL, '4', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:02:14', '2021-08-20 12:59:21'),
	(5, 'Moët & Chandon Ice', 1, 40000, 80000, 0, NULL, '5', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:03:16', '2021-08-20 12:56:30'),
	(6, 'Laurent Perrier Rosé', 1, 55000, 80000, 0, NULL, '6', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:06:34', '2021-08-20 12:57:49'),
	(7, 'Veuve Clicquot', 1, 32500, 90000, 0, NULL, '7', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:07:48', '2021-08-20 13:00:44'),
	(8, 'Moët & Chandon Rosé', 1, 40000, 100000, 0, NULL, '8', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 17, 2, '2021-08-17 16:14:47', '2021-08-22 02:58:05'),
	(9, 'Laurent Perrier Brut Magnum', 1, 0, 100000, 0, NULL, '9', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-17 16:17:39', '2021-08-17 16:17:39'),
	(10, 'Moët & Chandon Magnum Brut', 1, 0, 130000, 0, NULL, '10', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:19:43', '2021-08-20 13:21:55'),
	(11, 'Ruinart Brut', 1, 50000, 150000, 0, NULL, '11', NULL, 0, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:20:30', '2021-08-20 12:57:14'),
	(12, 'DON PERIGNON', 1, 125000, 250000, 0, NULL, '12', NULL, 0, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:24:05', '2021-08-20 12:47:59'),
	(13, 'J&B', 2, 11000, 40000, 0, NULL, '13', NULL, 0, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 5, 2, '2021-08-17 16:25:34', '2021-08-21 03:27:49'),
	(14, 'Johnny Walker Red', 2, 0, 60000, 0, NULL, '14', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-17 16:26:35', '2021-08-17 16:26:35'),
	(15, 'Jack Daniel’s', 2, 15000, 60000, 0, NULL, '15', NULL, 0, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:27:42', '2021-08-20 13:01:06'),
	(16, 'Chivas Regal', 2, 24000, 70000, 0, NULL, '16', NULL, 0, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:28:31', '2021-08-20 13:02:41'),
	(17, 'Johnny Walker Black', 2, 22000, 70000, 0, NULL, '17', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:31:56', '2021-08-20 13:03:14'),
	(18, 'Johnny Walker Green', 2, 0, 90000, 0, NULL, '18', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:33:14', '2021-08-17 16:35:27'),
	(19, 'Johnny Walker Double Black', 2, 30000, 110000, 0, NULL, '19', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:34:38', '2021-08-20 13:18:22'),
	(20, 'Johnny Walker Gold', 2, 0, 150000, 0, NULL, '20', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-17 16:38:06', '2021-08-17 16:38:06'),
	(21, 'Johnny Walker Blue', 2, 0, 250000, 0, NULL, '22', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:38:56', '2021-08-17 16:39:30'),
	(22, 'Hennessy', 3, 0, 60000, 0, NULL, '23', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-17 16:40:59', '2021-08-17 16:40:59'),
	(23, 'Vodka Absolut', 4, 10000, 60000, 0, NULL, '24', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:41:45', '2021-08-20 13:02:19'),
	(24, 'Grey Goose', 4, 0, 70000, 0, NULL, '25', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-17 16:42:29', '2021-08-17 16:42:29'),
	(25, 'Gin Gordon’s', 5, 10000, 50000, 0, NULL, '26', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:43:34', '2021-08-20 13:03:52'),
	(26, 'Saint James Blanc', 6, 10000, 40000, 0, NULL, '27', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:44:28', '2021-08-20 13:15:55'),
	(27, 'Saint James Rouge', 6, 9000, 40000, 0, NULL, '28', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:45:22', '2021-08-20 13:15:43'),
	(28, 'Bacardi Carta Oro', 6, 0, 40000, 0, NULL, '29', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-17 16:46:01', '2021-08-17 16:46:01'),
	(29, 'Baileys', 7, 11000, 50000, 0, NULL, '30', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:47:45', '2021-08-20 13:37:10'),
	(30, 'Get 27', 7, 0, 50000, 0, NULL, '31', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-17 16:48:18', '2021-08-17 16:48:18'),
	(31, 'Martini Blanco', 8, 9000, 40000, 0, NULL, '32', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:49:34', '2021-08-20 13:06:54'),
	(32, 'Martini Rosé', 8, 9000, 40000, 0, NULL, '33', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:50:13', '2021-08-20 13:10:29'),
	(33, 'Martini Rouge', 8, 9000, 40000, 0, NULL, '34', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:50:45', '2021-08-20 13:10:08'),
	(34, 'Saint-Estève Blanc', 9, 0, 30000, 0, NULL, '35', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-17 16:52:02', '2021-08-17 16:52:02'),
	(35, 'Saint-Estève Rosé', 9, 0, 30000, 0, NULL, '36', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-17 16:52:34', '2021-08-17 16:52:34'),
	(36, 'Saint-Estève Rouge', 9, 0, 30000, 0, NULL, '37', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-17 16:53:14', '2021-08-17 16:53:14'),
	(37, 'Verre de Jack', 4, 0, 5000, 0, NULL, '38', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 5, 2, '2021-08-19 16:10:47', '2021-08-20 17:22:21'),
	(38, 'Johnny Ref', 4, 11000, 5000, 0, NULL, '39', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-19 16:11:51', '2021-08-20 13:03:33'),
	(39, 'Cocktail', 8, 0, 5000, 0, NULL, '40', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 5, 2, '2021-08-19 16:12:35', '2021-08-21 01:32:59'),
	(40, 'Christal', 1, 125000, 300000, 0, NULL, '71', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 5, 2, '2021-08-20 12:49:47', '2021-08-20 17:27:05'),
	(41, 'Ruinart Blanc', 1, 65000, 150000, 0, NULL, '55', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-20 12:55:19', '2021-08-20 12:55:19'),
	(42, 'Clan Campbell', 2, 9000, 40000, 0, NULL, '56', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 5, 2, '2021-08-20 13:05:43', '2021-08-21 03:00:42'),
	(43, 'Veuve Rich', 1, 40000, 90000, 0, NULL, '57', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 5, 2, '2021-08-20 13:14:05', '2021-08-22 02:39:04'),
	(44, 'Magic', 9, 3000, 30000, 0, NULL, '58', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 5, 2, '2021-08-20 13:15:19', '2021-08-21 02:05:52'),
	(45, 'Glendffidich 12 Ans', 2, 0, 130000, 0, NULL, '59', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-20 13:42:15', '2021-08-20 13:42:15'),
	(46, 'Remy Martins XO', 2, 0, 0, 0, NULL, '60', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-20 13:48:28', '2021-08-20 13:48:28'),
	(48, 'Remy Martins VSOP', 2, 0, 0, 0, NULL, '61', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-20 13:51:51', '2021-08-20 13:51:51'),
	(49, 'Bombey Saphire', 2, 0, 0, 0, NULL, '62', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-20 13:52:32', '2021-08-20 13:52:32'),
	(50, 'Pastis 51', 7, 0, 0, 0, NULL, '63', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-20 13:53:14', '2021-08-20 13:53:14'),
	(51, 'Belvedere', 7, 0, 0, 0, NULL, '64', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-20 13:53:45', '2021-08-20 13:53:45'),
	(52, 'Ballantine\'s', 7, 0, 0, 0, NULL, '65', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-20 13:54:42', '2021-08-20 13:54:42'),
	(53, 'Tequila Camino', 8, 0, 0, 0, NULL, '66', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-20 13:55:17', '2021-08-20 13:55:17'),
	(54, 'Tequila Blanc', 8, 0, 0, 0, NULL, '67', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-20 13:55:46', '2021-08-20 13:55:46'),
	(55, 'Talisker', 2, 0, 0, 0, NULL, '68', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-20 13:58:05', '2021-08-20 13:58:05'),
	(56, 'Napoleon', 2, 0, 0, 0, NULL, '69', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-20 13:58:32', '2021-08-20 13:58:32'),
	(57, 'Verre de Bailey\'s', 7, 0, 5000, 0, NULL, '72', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 5, '2021-08-20 17:27:41', '2021-08-20 17:27:41'),
	(58, 'Verre de Martini', 7, 0, 5000, 0, NULL, '74', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 5, 5, '2021-08-20 17:28:35', '2021-08-20 17:29:50'),
	(59, 'Verre de St James', 6, 0, 5000, 0, NULL, '73', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 5, '2021-08-20 17:29:39', '2021-08-20 17:29:39'),
	(60, 'Verre de vodka', 4, 0, 5000, 0, NULL, '75', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 5, 5, '2021-08-20 17:30:48', '2021-08-20 17:31:21'),
	(61, 'Verre de Gin Gordons', 5, 0, 5000, 0, NULL, '76', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 5, '2021-08-20 17:33:46', '2021-08-20 17:33:46'),
	(62, 'Red bull', 10, 0, 5000, 0, NULL, '78', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 5, 5, '2021-08-21 01:03:19', '2021-08-21 01:03:58'),
	(63, 'Dom perignon', 1, 0, 250000, 0, NULL, '79', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 5, '2021-08-21 01:22:43', '2021-08-21 01:22:43'),
	(64, 'Vin', 9, 0, 30000, 0, NULL, '80', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 5, '2021-08-21 01:35:00', '2021-08-21 01:35:00'),
	(65, 'Verre de vin', 9, 0, 5000, 0, NULL, '81', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 5, 5, '2021-08-21 01:35:34', '2021-08-21 01:35:45'),
	(66, 'Champagne sans alcool', 1, 0, 30000, 0, NULL, '82', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 5, '2021-08-21 02:03:55', '2021-08-21 02:03:55'),
	(67, 'Coca cola', 10, 0, 5000, 0, NULL, '83', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 5, '2021-08-21 02:09:47', '2021-08-21 02:09:47'),
	(68, 'Verre de Gin Gordon’s', 5, 0, 5000, 0, NULL, '84', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2021-08-21 02:22:38', 5, 5, 5, '2021-08-21 02:21:50', '2021-08-21 02:22:38'),
	(69, 'Coupe de champagne', 1, 0, 10000, 0, NULL, '87', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 5, 5, '2021-08-21 02:44:36', '2021-08-21 02:45:06'),
	(70, 'Bière', 11, 0, 5000, 0, NULL, '88', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 5, 5, '2021-08-21 02:57:20', '2021-08-21 02:58:07'),
	(71, 'Vsop', 3, 0, 200000, 0, NULL, '89', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 16, 5, '2021-08-21 03:40:23', '2021-08-23 16:07:57'),
	(72, 'Verre de vsop', 3, 0, 20000, 0, NULL, '90', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 5, 5, '2021-08-21 03:41:11', '2021-08-21 03:41:20'),
	(73, 'RHUMS', 6, 0, 40000, 0, NULL, '91', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 5, '2021-08-21 04:23:47', '2021-08-21 04:23:47'),
	(74, 'Verre de rhums', 6, 0, 5000, 0, NULL, '92', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 5, 5, '2021-08-21 04:24:33', '2021-08-21 04:24:42'),
	(75, 'Conso 10000', 12, 0, 10000, 0, NULL, '92', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 5, 5, '2021-08-22 00:18:41', '2021-08-22 00:40:51'),
	(76, 'Conso 20000', 12, 0, 20000, 0, NULL, '93', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 5, 5, '2021-08-22 00:20:21', '2021-08-22 00:20:38'),
	(77, 'Cons 60000', 12, 0, 60000, 0, NULL, '94', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 5, '2021-08-22 00:21:14', '2021-08-22 00:21:14'),
	(78, 'Cons 70000', 12, 0, 70000, 0, NULL, '95', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 5, '2021-08-22 00:21:47', '2021-08-22 00:21:47'),
	(79, 'Cons 80000', 12, 0, 80000, 0, NULL, '96', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 5, '2021-08-22 00:22:17', '2021-08-22 00:22:17'),
	(80, 'Cons 90000', 12, 0, 90000, 0, NULL, '97', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 5, 5, '2021-08-22 00:22:58', '2021-08-22 00:40:38'),
	(81, 'Conso 140000', 12, 0, 140000, 0, NULL, '98', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 5, 5, '2021-08-22 00:41:42', '2021-08-22 00:42:37'),
	(82, 'Conso 150000', 12, 0, 150000, 0, NULL, '99', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 5, 5, '2021-08-22 00:42:26', '2021-08-22 00:42:41'),
	(83, 'Short de tequila', 4, 0, 3000, 0, NULL, '100', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 5, '2021-08-22 02:14:52', '2021-08-22 02:14:52'),
	(84, 'Verre de tequila', 13, 0, 5000, 0, NULL, '200', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 5, '2021-08-22 02:18:03', '2021-08-22 02:18:03'),
	(85, 'Short tequila', 13, 0, 3000, 0, NULL, '203', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 5, 5, '2021-08-22 02:19:38', '2021-08-22 02:19:49'),
	(86, 'Moët & Chandon Nectar Rosé', 1, 0, 110000, 0, NULL, '204', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 5, '2021-08-22 02:34:31', '2021-08-22 02:34:31');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. article_approvisionnements
CREATE TABLE IF NOT EXISTS `article_approvisionnements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quantite` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `unite_id` int(11) DEFAULT NULL,
  `approvisionnement_id` int(11) NOT NULL,
  `date_peremption` date DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.article_approvisionnements : ~67 rows (environ)
/*!40000 ALTER TABLE `article_approvisionnements` DISABLE KEYS */;
INSERT INTO `article_approvisionnements` (`id`, `quantite`, `article_id`, `unite_id`, `approvisionnement_id`, `date_peremption`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 3, 31, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:13:52'),
	(2, 3, 33, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:13:52'),
	(3, 2, 44, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:13:52'),
	(4, 3, 45, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:13:52'),
	(5, 2, 27, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:13:52'),
	(6, 2, 26, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:13:52'),
	(7, 3, 1, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:13:52'),
	(8, 1, 8, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:13:52'),
	(9, 1, 19, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(10, 1, 12, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(11, 1, 41, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(12, 1, 5, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(13, 1, 42, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(14, 1, 11, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(15, 1, 6, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(16, 6, 3, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(17, 6, 2, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(18, 3, 4, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(19, 2, 7, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(20, 3, 15, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(21, 3, 23, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(22, 1, 16, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(23, 1, 17, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(24, 1, 14, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(25, 2, 25, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(26, 2, 13, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(27, 1, 43, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(28, 2, 29, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(29, 1, 21, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:14:55', '2021-08-20 14:14:55'),
	(30, 1, 21, 1, 1, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:15:03', '2021-08-20 14:15:03'),
	(31, 1, 21, 1, 2, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(32, 1, 20, 1, 2, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(33, 2, 47, 1, 2, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(34, 11, 22, 1, 2, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(35, 1, 49, 1, 2, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(36, 2, 50, 1, 2, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(37, 9, 51, 1, 2, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(38, 3, 24, 1, 2, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(39, 1, 53, 1, 2, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(40, 1, 55, 1, 2, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(41, 1, 56, 1, 2, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(42, 3, 26, 1, 2, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(43, 5, 27, 1, 2, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(44, 6, 35, 1, 2, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(45, 2, 54, 1, 2, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(46, 20, 3, 1, 3, NULL, NULL, NULL, NULL, 5, '2021-08-21 00:47:47', '2021-08-21 00:47:47'),
	(47, 20, 2, 1, 3, NULL, NULL, NULL, NULL, 5, '2021-08-21 00:50:24', '2021-08-21 00:50:24'),
	(48, 20, 2, 1, 3, NULL, NULL, NULL, NULL, 5, '2021-08-21 00:50:32', '2021-08-21 00:50:32'),
	(49, 20, 2, 1, 4, NULL, NULL, NULL, NULL, 5, '2021-08-21 00:50:58', '2021-08-21 00:50:58'),
	(50, 20, 62, 1, 5, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:04:39', '2021-08-21 01:04:39'),
	(51, 20, 62, 2, 5, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:04:39', '2021-08-21 01:04:39'),
	(52, 20, 5, 1, 6, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:12:06', '2021-08-21 01:12:06'),
	(53, 20, 5, 2, 6, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:12:07', '2021-08-21 01:12:07'),
	(54, 20, 17, 1, 7, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:16:48', '2021-08-21 01:16:48'),
	(55, 20, 17, 2, 7, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:16:48', '2021-08-21 01:16:48'),
	(56, 20, 63, 1, 8, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:23:21', '2021-08-21 01:23:21'),
	(57, 20, 63, 2, 8, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:23:22', '2021-08-21 01:23:22'),
	(58, 50, 3, 1, 9, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:27:08', '2021-08-21 01:27:08'),
	(59, 50, 3, 2, 9, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:27:08', '2021-08-21 01:27:08'),
	(60, 50, 11, 1, 10, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:29:11', '2021-08-21 01:29:11'),
	(61, 50, 41, 2, 10, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:29:11', '2021-08-21 01:29:11'),
	(62, 50, 64, 1, 11, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:36:15', '2021-08-21 01:36:15'),
	(63, 50, 64, 2, 11, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:36:15', '2021-08-21 01:36:15'),
	(64, 20, 7, 1, 12, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:39:10', '2021-08-21 01:39:10'),
	(65, 20, 7, 2, 12, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:39:10', '2021-08-21 01:39:10'),
	(66, 50, 4, 1, 13, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:52:10', '2021-08-21 01:52:10'),
	(67, 50, 4, 2, 13, NULL, NULL, NULL, NULL, 5, '2021-08-21 01:52:11', '2021-08-21 01:52:11'),
	(68, 20, 44, 1, 14, NULL, NULL, NULL, NULL, 5, '2021-08-21 02:06:31', '2021-08-21 02:06:31'),
	(69, 50, 67, 1, 15, NULL, NULL, NULL, NULL, 5, '2021-08-21 02:10:12', '2021-08-21 02:10:12'),
	(70, 50, 15, 1, 16, NULL, NULL, NULL, NULL, 5, '2021-08-21 02:12:28', '2021-08-21 02:12:28'),
	(71, 50, 15, 2, 16, NULL, NULL, NULL, NULL, 5, '2021-08-21 02:12:28', '2021-08-21 02:12:28'),
	(72, 20, 42, 1, 17, NULL, NULL, NULL, NULL, 5, '2021-08-21 02:15:43', '2021-08-21 02:15:43'),
	(73, 20, 42, 2, 17, NULL, NULL, NULL, NULL, 5, '2021-08-21 02:15:43', '2021-08-21 02:15:43'),
	(74, 20, 70, 1, 18, NULL, NULL, NULL, NULL, 5, '2021-08-21 02:58:33', '2021-08-21 02:58:33'),
	(75, 50, 71, 1, 19, NULL, NULL, NULL, NULL, 5, '2021-08-21 03:43:00', '2021-08-21 03:43:00'),
	(76, 30, 73, 1, 20, NULL, NULL, NULL, NULL, 5, '2021-08-21 04:25:07', '2021-08-21 04:25:07'),
	(77, 20, 16, 1, 21, NULL, NULL, NULL, NULL, 5, '2021-08-21 05:39:39', '2021-08-21 05:39:39'),
	(78, 10, 63, 1, 22, NULL, NULL, NULL, NULL, 18, '2021-08-21 23:32:26', '2021-08-21 23:32:26'),
	(79, 12, 17, 1, 22, NULL, NULL, NULL, NULL, 18, '2021-08-21 23:32:26', '2021-08-21 23:32:26'),
	(80, 2, 13, 1, 22, NULL, NULL, NULL, NULL, 18, '2021-08-21 23:32:26', '2021-08-21 23:32:26'),
	(81, 3, 44, 1, 22, NULL, NULL, NULL, NULL, 18, '2021-08-21 23:32:26', '2021-08-21 23:32:26'),
	(82, 6, 4, 1, 22, NULL, NULL, NULL, NULL, 18, '2021-08-21 23:32:26', '2021-08-21 23:32:26'),
	(83, 1, 29, 1, 22, NULL, NULL, NULL, NULL, 18, '2021-08-21 23:32:26', '2021-08-21 23:32:26'),
	(84, 1, 26, 1, 22, NULL, NULL, NULL, NULL, 18, '2021-08-21 23:32:26', '2021-08-21 23:32:26'),
	(85, 5, 15, 1, 22, NULL, NULL, NULL, NULL, 18, '2021-08-21 23:32:26', '2021-08-21 23:32:26'),
	(86, 20, 3, 1, 23, NULL, NULL, NULL, NULL, 5, '2021-08-22 00:55:44', '2021-08-22 00:55:44'),
	(87, 50, 1, 1, 24, NULL, NULL, NULL, NULL, 5, '2021-08-22 01:09:40', '2021-08-22 01:09:40'),
	(88, 50, 2, 1, 24, NULL, NULL, NULL, NULL, 5, '2021-08-22 01:09:40', '2021-08-22 01:09:40'),
	(89, 30, 86, 1, 25, NULL, NULL, NULL, NULL, 5, '2021-08-22 02:35:11', '2021-08-22 02:35:11'),
	(90, 30, 86, 2, 25, NULL, NULL, NULL, NULL, 5, '2021-08-22 02:35:12', '2021-08-22 02:35:12'),
	(91, 20, 43, 1, 26, NULL, NULL, NULL, NULL, 5, '2021-08-22 02:39:41', '2021-08-22 02:39:41'),
	(92, 20, 43, 2, 26, NULL, NULL, NULL, NULL, 5, '2021-08-22 02:39:41', '2021-08-22 02:39:41'),
	(93, 50, 62, 1, 27, NULL, NULL, NULL, NULL, 5, '2021-08-22 02:46:09', '2021-08-22 02:46:09');
/*!40000 ALTER TABLE `article_approvisionnements` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. article_bons
CREATE TABLE IF NOT EXISTS `article_bons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quantite_demande` int(11) NOT NULL,
  `quantite_recu` int(10) unsigned DEFAULT NULL,
  `article_id` int(11) NOT NULL,
  `bon_commande_id` int(11) NOT NULL,
  `prix_article` double(8,2) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.article_bons : ~0 rows (environ)
/*!40000 ALTER TABLE `article_bons` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_bons` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. article_destockers
CREATE TABLE IF NOT EXISTS `article_destockers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quantite_destocker` int(10) unsigned NOT NULL,
  `article_id` int(10) unsigned NOT NULL,
  `unite_id` int(10) unsigned NOT NULL,
  `destockage_id` int(10) unsigned NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.article_destockers : ~0 rows (environ)
/*!40000 ALTER TABLE `article_destockers` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_destockers` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. article_fournisseur
CREATE TABLE IF NOT EXISTS `article_fournisseur` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) unsigned NOT NULL,
  `fournisseur_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_fournisseur_article_id_foreign` (`article_id`),
  KEY `article_fournisseur_fournisseur_id_foreign` (`fournisseur_id`),
  CONSTRAINT `article_fournisseur_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `article_fournisseur_fournisseur_id_foreign` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseurs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.article_fournisseur : ~0 rows (environ)
/*!40000 ALTER TABLE `article_fournisseur` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_fournisseur` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. article_retournes
CREATE TABLE IF NOT EXISTS `article_retournes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `retour_article_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `unite_id` int(11) NOT NULL,
  `quantite_vendue` int(11) NOT NULL DEFAULT '0',
  `quantite` int(11) NOT NULL,
  `prix_unitaire` int(11) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.article_retournes : ~62 rows (environ)
/*!40000 ALTER TABLE `article_retournes` DISABLE KEYS */;
INSERT INTO `article_retournes` (`id`, `retour_article_id`, `article_id`, `unite_id`, `quantite_vendue`, `quantite`, `prix_unitaire`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, 2, 2, 60000, NULL, NULL, NULL, 5, '2021-08-21 11:24:23', '2021-08-21 11:24:23'),
	(2, 2, 16, 1, 1, 1, 70000, NULL, NULL, NULL, 5, '2021-08-21 11:30:48', '2021-08-21 11:30:48'),
	(3, 3, 15, 1, 1, 1, 60000, NULL, NULL, NULL, 5, '2021-08-21 11:31:19', '2021-08-21 11:31:19'),
	(4, 4, 2, 1, 2, 2, 60000, NULL, NULL, NULL, 5, '2021-08-21 11:47:14', '2021-08-21 11:47:14'),
	(5, 5, 3, 1, 15, 15, 70000, NULL, NULL, NULL, 5, '2021-08-21 11:47:46', '2021-08-21 11:47:46'),
	(6, 6, 4, 1, 3, 3, 70000, NULL, NULL, NULL, 5, '2021-08-21 11:48:11', '2021-08-21 11:48:11'),
	(7, 7, 2, 1, 3, 3, 60000, NULL, NULL, NULL, 5, '2021-08-21 11:48:37', '2021-08-21 11:48:37'),
	(8, 8, 73, 1, 1, 1, 40000, NULL, NULL, NULL, 5, '2021-08-21 11:49:12', '2021-08-21 11:49:12'),
	(9, 9, 5, 1, 1, 1, 80000, NULL, NULL, NULL, 5, '2021-08-21 11:49:59', '2021-08-21 11:49:59'),
	(10, 10, 4, 1, 1, 1, 70000, NULL, NULL, NULL, 5, '2021-08-21 11:50:19', '2021-08-21 11:50:19'),
	(11, 11, 24, 1, 1, 1, 70000, NULL, NULL, NULL, 5, '2021-08-21 11:50:34', '2021-08-21 11:50:34'),
	(12, 12, 39, 3, 1, 1, 5000, NULL, NULL, NULL, 5, '2021-08-21 11:50:50', '2021-08-21 11:50:50'),
	(13, 13, 4, 1, 1, 1, 70000, NULL, NULL, NULL, 5, '2021-08-21 12:03:55', '2021-08-21 12:03:55'),
	(14, 14, 2, 1, 2, 2, 60000, NULL, NULL, NULL, 5, '2021-08-21 12:04:09', '2021-08-21 12:04:09'),
	(15, 15, 2, 1, 1, 1, 60000, NULL, NULL, NULL, 5, '2021-08-21 12:04:24', '2021-08-21 12:04:24'),
	(16, 16, 2, 1, 1, 1, 60000, NULL, NULL, NULL, 5, '2021-08-21 12:04:39', '2021-08-21 12:04:39'),
	(17, 17, 2, 1, 1, 1, 60000, NULL, NULL, NULL, 5, '2021-08-21 12:04:52', '2021-08-21 12:04:52'),
	(18, 18, 2, 1, 2, 2, 60000, NULL, NULL, NULL, 5, '2021-08-21 12:05:13', '2021-08-21 12:05:13'),
	(19, 19, 3, 1, 1, 1, 70000, NULL, NULL, NULL, 5, '2021-08-21 12:05:31', '2021-08-21 12:05:31'),
	(20, 20, 4, 1, 1, 1, 70000, NULL, NULL, NULL, 5, '2021-08-21 12:05:50', '2021-08-21 12:05:50'),
	(21, 21, 7, 1, 3, 3, 90000, NULL, NULL, NULL, 5, '2021-08-21 12:07:04', '2021-08-21 12:07:04'),
	(22, 22, 3, 1, 1, 1, 70000, NULL, NULL, NULL, 5, '2021-08-21 12:07:22', '2021-08-21 12:07:22'),
	(23, 23, 69, 4, 1, 1, 10000, NULL, NULL, NULL, 5, '2021-08-21 12:13:06', '2021-08-21 12:13:06'),
	(24, 24, 2, 1, 2, 2, 60000, NULL, NULL, NULL, 5, '2021-08-21 12:13:22', '2021-08-21 12:13:22'),
	(25, 25, 11, 1, 2, 2, 150000, NULL, NULL, NULL, 5, '2021-08-21 12:13:37', '2021-08-21 12:13:37'),
	(26, 26, 5, 1, 1, 1, 80000, NULL, NULL, NULL, 5, '2021-08-21 12:18:49', '2021-08-21 12:18:49'),
	(27, 27, 5, 1, 1, 1, 80000, NULL, NULL, NULL, 5, '2021-08-21 12:18:57', '2021-08-21 12:18:57'),
	(28, 28, 63, 1, 1, 1, 250000, NULL, NULL, NULL, 5, '2021-08-21 12:19:13', '2021-08-21 12:19:13'),
	(29, 29, 4, 1, 1, 1, 70000, NULL, NULL, NULL, 5, '2021-08-21 12:20:59', '2021-08-21 12:20:59'),
	(30, 30, 3, 1, 1, 1, 70000, NULL, NULL, NULL, 5, '2021-08-21 12:26:30', '2021-08-21 12:26:30'),
	(31, 31, 72, 3, 1, 1, 20000, NULL, NULL, NULL, 5, '2021-08-21 12:26:40', '2021-08-21 12:26:40'),
	(32, 32, 11, 1, 2, 2, 150000, NULL, NULL, NULL, 5, '2021-08-21 12:27:08', '2021-08-21 12:27:08'),
	(33, 33, 15, 1, 1, 1, 60000, NULL, NULL, NULL, 5, '2021-08-21 12:28:49', '2021-08-21 12:28:49'),
	(34, 34, 63, 1, 3, 3, 250000, NULL, NULL, NULL, 5, '2021-08-21 12:29:05', '2021-08-21 12:29:05'),
	(35, 35, 2, 1, 1, 1, 60000, NULL, NULL, NULL, 5, '2021-08-21 12:42:54', '2021-08-21 12:42:54'),
	(36, 36, 2, 1, 3, 3, 60000, NULL, NULL, NULL, 5, '2021-08-21 12:43:33', '2021-08-21 12:43:33'),
	(37, 37, 3, 1, 1, 1, 70000, NULL, NULL, NULL, 16, '2021-08-23 14:17:23', '2021-08-23 14:17:23'),
	(38, 38, 1, 1, 1, 1, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:18:18', '2021-08-23 14:18:18'),
	(39, 39, 1, 1, 1, 1, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:20:00', '2021-08-23 14:20:00'),
	(40, 40, 1, 1, 1, 1, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:20:36', '2021-08-23 14:20:36'),
	(41, 41, 15, 1, 2, 2, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:21:37', '2021-08-23 14:21:37'),
	(42, 42, 2, 1, 2, 2, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:22:16', '2021-08-23 14:22:16'),
	(43, 43, 15, 1, 1, 1, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:23:02', '2021-08-23 14:23:02'),
	(44, 44, 11, 1, 3, 3, 150000, NULL, NULL, NULL, 16, '2021-08-23 14:23:59', '2021-08-23 14:23:59'),
	(45, 45, 2, 1, 1, 1, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:24:30', '2021-08-23 14:24:30'),
	(46, 46, 2, 1, 1, 1, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:26:49', '2021-08-23 14:26:49'),
	(47, 47, 44, 1, 2, 2, 30000, NULL, NULL, NULL, 16, '2021-08-23 14:27:44', '2021-08-23 14:27:44'),
	(48, 48, 3, 1, 1, 1, 70000, NULL, NULL, NULL, 16, '2021-08-23 14:28:49', '2021-08-23 14:28:49'),
	(49, 49, 3, 1, 1, 1, 70000, NULL, NULL, NULL, 16, '2021-08-23 14:29:32', '2021-08-23 14:29:32'),
	(50, 50, 63, 1, 1, 1, 250000, NULL, NULL, NULL, 16, '2021-08-23 14:30:09', '2021-08-23 14:30:09'),
	(51, 51, 63, 1, 1, 1, 250000, NULL, NULL, NULL, 16, '2021-08-23 14:30:33', '2021-08-23 14:30:33'),
	(52, 52, 43, 1, 1, 1, 90000, NULL, NULL, NULL, 16, '2021-08-23 14:31:02', '2021-08-23 14:31:02'),
	(53, 53, 5, 1, 1, 1, 80000, NULL, NULL, NULL, 16, '2021-08-23 14:31:27', '2021-08-23 14:31:27'),
	(54, 54, 43, 1, 1, 1, 90000, NULL, NULL, NULL, 16, '2021-08-23 14:32:09', '2021-08-23 14:32:09'),
	(55, 55, 5, 1, 1, 1, 80000, NULL, NULL, NULL, 16, '2021-08-23 14:32:33', '2021-08-23 14:32:33'),
	(56, 56, 70, 1, 3, 3, 5000, NULL, NULL, NULL, 16, '2021-08-23 14:33:05', '2021-08-23 14:33:05'),
	(57, 57, 15, 1, 2, 2, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:33:28', '2021-08-23 14:33:28'),
	(58, 58, 2, 1, 2, 2, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:33:52', '2021-08-23 14:33:52'),
	(59, 59, 2, 1, 1, 1, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:34:16', '2021-08-23 14:34:16'),
	(60, 60, 2, 1, 4, 4, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:34:43', '2021-08-23 14:34:43'),
	(61, 61, 3, 1, 1, 1, 70000, NULL, NULL, NULL, 16, '2021-08-23 14:35:12', '2021-08-23 14:35:12'),
	(62, 62, 2, 1, 1, 1, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:35:33', '2021-08-23 14:35:33'),
	(63, 63, 2, 1, 1, 1, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:35:53', '2021-08-23 14:35:53'),
	(64, 64, 2, 1, 1, 1, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:36:11', '2021-08-23 14:36:11'),
	(65, 65, 2, 1, 1, 1, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:36:29', '2021-08-23 14:36:29'),
	(66, 66, 2, 1, 1, 1, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:36:51', '2021-08-23 14:36:51'),
	(67, 67, 2, 1, 1, 1, 60000, NULL, NULL, NULL, 16, '2021-08-23 14:37:28', '2021-08-23 14:37:28'),
	(68, 68, 44, 1, 1, 1, 30000, NULL, NULL, NULL, 16, '2021-08-23 14:37:53', '2021-08-23 14:37:53'),
	(69, 69, 3, 1, 3, 3, 70000, NULL, NULL, NULL, 16, '2021-08-23 14:38:41', '2021-08-23 14:38:41'),
	(70, 70, 7, 1, 4, 3, 90000, NULL, NULL, NULL, 16, '2021-08-23 15:31:35', '2021-08-23 15:31:35');
/*!40000 ALTER TABLE `article_retournes` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. article_transferts
CREATE TABLE IF NOT EXISTS `article_transferts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `quantite_depart` int(10) unsigned NOT NULL,
  `quantite_reception` int(10) unsigned NOT NULL,
  `unite_depart` int(10) unsigned NOT NULL,
  `unite_reception` int(10) unsigned NOT NULL,
  `transfert_stock_id` int(10) unsigned NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.article_transferts : ~0 rows (environ)
/*!40000 ALTER TABLE `article_transferts` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_transferts` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. article_ventes
CREATE TABLE IF NOT EXISTS `article_ventes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quantite` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `divers_id` int(10) unsigned DEFAULT NULL,
  `article_id` int(10) unsigned DEFAULT NULL,
  `depot_id` int(10) unsigned DEFAULT NULL,
  `unite_id` int(10) unsigned DEFAULT NULL,
  `vente_id` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `retourne` tinyint(1) NOT NULL DEFAULT '0',
  `remise_sur_ligne` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.article_ventes : ~277 rows (environ)
/*!40000 ALTER TABLE `article_ventes` DISABLE KEYS */;
INSERT INTO `article_ventes` (`id`, `quantite`, `divers_id`, `article_id`, `depot_id`, `unite_id`, `vente_id`, `prix`, `retourne`, `remise_sur_ligne`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, '2', NULL, 1, 1, 1, 1, 60000, 0, 0, NULL, NULL, NULL, 8, '2021-08-20 15:16:52', '2021-08-20 15:16:52'),
	(2, '1', NULL, 1, 1, 1, 2, 60000, 0, 0, NULL, NULL, NULL, 8, '2021-08-20 15:17:29', '2021-08-20 15:17:29'),
	(3, '0', NULL, 2, 1, 1, 3, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-20 23:28:49', '2021-08-21 12:43:33'),
	(4, '0', NULL, 2, 1, 1, 4, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-20 23:34:49', '2021-08-21 12:42:54'),
	(5, '1', NULL, 3, 1, 1, 5, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 00:07:45', '2021-08-21 00:07:45'),
	(6, '0', NULL, 3, 1, 1, 6, 70000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 00:48:28', '2021-08-21 11:47:46'),
	(7, '6', NULL, 2, 1, 1, 7, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 00:51:39', '2021-08-21 00:51:39'),
	(8, '0', NULL, 4, 1, 1, 8, 70000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 00:53:06', '2021-08-21 11:48:11'),
	(9, '0', NULL, 2, 1, 1, 9, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 00:54:32', '2021-08-21 11:48:37'),
	(10, '0', NULL, 2, 1, 1, 10, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 00:55:25', '2021-08-21 11:47:15'),
	(11, '2', NULL, 2, 1, 1, 11, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 00:56:37', '2021-08-21 00:56:37'),
	(12, '2', NULL, 2, 1, 1, 12, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 00:57:42', '2021-08-21 00:57:42'),
	(13, '1', NULL, 3, 1, 1, 13, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 00:58:34', '2021-08-21 00:58:34'),
	(14, '1', NULL, 3, 1, 1, 14, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 00:59:36', '2021-08-21 00:59:36'),
	(15, '2', NULL, 2, 1, 1, 15, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:00:19', '2021-08-21 01:00:19'),
	(16, '2', NULL, 3, 1, 1, 16, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:01:10', '2021-08-21 01:01:10'),
	(17, '1', NULL, 62, 1, 1, 17, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:05:45', '2021-08-21 01:05:45'),
	(18, '1', NULL, 15, 1, 1, 18, 60000, 0, 10000, NULL, NULL, 16, 7, '2021-08-21 01:06:37', '2021-08-21 23:00:16'),
	(19, '1', NULL, 15, 1, 1, 19, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:07:41', '2021-08-21 01:07:41'),
	(20, '1', NULL, 62, 1, 1, 20, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:08:53', '2021-08-21 01:08:53'),
	(21, '1', NULL, 5, 1, 1, 21, 80000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:10:01', '2021-08-21 01:10:01'),
	(22, '0', NULL, 5, 1, 1, 22, 80000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 01:12:39', '2021-08-21 11:49:59'),
	(23, '1', NULL, 19, 1, 1, 23, 110000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:13:26', '2021-08-21 01:13:26'),
	(24, '3', NULL, 17, 1, 1, 23, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:14:06', '2021-08-21 01:14:50'),
	(25, '2', NULL, 17, 1, 1, 24, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:17:01', '2021-08-21 01:17:01'),
	(26, '1', NULL, 5, 1, 1, 25, 80000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:18:11', '2021-08-21 01:18:11'),
	(27, '0', NULL, 5, 1, 1, 26, 80000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 01:19:05', '2021-08-21 12:18:57'),
	(28, '0', NULL, 5, 1, 1, 27, 80000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 01:19:55', '2021-08-21 12:18:49'),
	(29, '1', NULL, 11, 1, 1, 28, 150000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:20:57', '2021-08-21 01:20:57'),
	(30, '1', NULL, 63, 1, 1, 29, 250000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:23:51', '2021-08-21 01:23:51'),
	(31, '8', NULL, 3, 1, 1, 30, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:27:43', '2021-08-21 01:27:43'),
	(32, '1', NULL, 11, 1, 1, 31, 150000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:30:01', '2021-08-21 01:30:01'),
	(33, '1', NULL, 37, 1, 3, 32, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:31:46', '2021-08-21 01:31:46'),
	(34, '1', NULL, 39, 1, 3, 33, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:33:20', '2021-08-21 01:33:20'),
	(35, '1', NULL, 64, 1, 1, 34, 30000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:36:56', '2021-08-21 01:36:56'),
	(36, '0', NULL, 7, 1, 1, 35, 90000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 01:39:29', '2021-08-21 12:07:04'),
	(37, '0', NULL, 2, 1, 1, 36, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 01:40:24', '2021-08-21 12:04:09'),
	(38, '0', NULL, 2, 1, 1, 37, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 01:41:15', '2021-08-21 12:04:25'),
	(39, '1', NULL, 2, 1, 1, 38, 60000, 0, 10000, NULL, NULL, 16, 7, '2021-08-21 01:42:14', '2021-08-21 22:58:10'),
	(40, '1', NULL, 2, 1, 1, 39, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:42:52', '2021-08-21 01:42:52'),
	(41, '2', NULL, 2, 1, 1, 40, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:45:10', '2021-08-21 01:45:10'),
	(42, '0', NULL, 2, 1, 1, 41, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 01:45:51', '2021-08-21 12:04:52'),
	(43, '1', NULL, 2, 1, 1, 42, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:47:04', '2021-08-21 01:47:04'),
	(44, '0', NULL, 2, 1, 1, 43, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 01:47:57', '2021-08-21 12:04:39'),
	(45, '1', NULL, 11, 1, 1, 44, 150000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:49:15', '2021-08-21 01:49:15'),
	(46, '1', NULL, 11, 1, 1, 45, 150000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:50:11', '2021-08-21 01:50:11'),
	(47, '0', NULL, 4, 1, 1, 46, 70000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 01:52:26', '2021-08-21 12:03:55'),
	(48, '0', NULL, 4, 1, 1, 47, 70000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 01:53:24', '2021-08-21 12:05:50'),
	(49, '0', NULL, 3, 1, 1, 48, 70000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 01:54:03', '2021-08-21 12:26:30'),
	(50, '0', NULL, 3, 1, 1, 49, 70000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 01:54:57', '2021-08-21 12:05:31'),
	(51, '1', NULL, 3, 1, 1, 50, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:55:38', '2021-08-21 01:55:38'),
	(52, '0', NULL, 1, 1, 1, 51, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 01:56:44', '2021-08-21 11:24:23'),
	(53, '1', NULL, 15, 1, 1, 52, 60000, 0, 10000, NULL, NULL, 16, 7, '2021-08-21 01:57:29', '2021-08-21 23:03:16'),
	(54, '3', NULL, 39, 1, 3, 53, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:58:27', '2021-08-21 01:58:27'),
	(55, '1', NULL, 65, 1, 3, 54, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:00:22', '2021-08-21 02:00:22'),
	(56, '0', NULL, 2, 1, 1, 55, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 02:01:10', '2021-08-21 12:05:13'),
	(57, '1', NULL, 2, 1, 1, 56, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:04:29', '2021-08-21 02:04:29'),
	(58, '2', NULL, 44, 1, 1, 56, 90000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:04:29', '2021-08-21 02:04:29'),
	(59, '2', NULL, 44, 1, 1, 57, 30000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:07:17', '2021-08-21 02:07:17'),
	(60, '1', NULL, 2, 1, 1, 57, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:07:18', '2021-08-21 02:07:18'),
	(61, '2', NULL, 39, 1, 3, 58, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:08:08', '2021-08-21 02:08:08'),
	(62, '1', NULL, 67, 1, 1, 59, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:10:47', '2021-08-21 02:10:47'),
	(63, '1', NULL, 15, 1, 1, 60, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:12:50', '2021-08-21 02:12:50'),
	(64, '1', NULL, 62, 1, 1, 61, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:13:30', '2021-08-21 02:13:30'),
	(65, '1', NULL, 39, 1, 3, 62, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:14:13', '2021-08-21 02:14:13'),
	(66, '1', NULL, 42, 1, 1, 63, 150000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:16:16', '2021-08-21 02:16:16'),
	(67, '11', NULL, 3, 1, 1, 64, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:17:02', '2021-08-21 02:17:02'),
	(68, '0', NULL, 2, 1, 1, 65, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 02:17:48', '2021-08-21 12:13:22'),
	(69, '1', NULL, 39, 1, 3, 66, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:18:55', '2021-08-21 02:18:55'),
	(70, '1', NULL, 39, 1, 3, 67, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:19:53', '2021-08-21 02:19:53'),
	(71, '1', NULL, 61, 1, 3, 68, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:24:34', '2021-08-21 02:24:34'),
	(72, '0', NULL, 11, 1, 1, 69, 150000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 02:25:24', '2021-08-21 12:27:08'),
	(73, '0', NULL, 11, 1, 1, 70, 150000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 02:26:29', '2021-08-21 12:13:37'),
	(74, '2', NULL, 39, 1, 3, 71, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:27:28', '2021-08-21 02:27:28'),
	(75, '2', NULL, 17, 1, 1, 72, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:35:09', '2021-08-21 02:35:09'),
	(76, '1', NULL, 39, 1, 3, 73, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:36:16', '2021-08-21 02:36:16'),
	(77, '1', NULL, 17, 1, 1, 74, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:39:29', '2021-08-21 02:39:29'),
	(78, '1', NULL, 57, 1, 3, 75, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:40:15', '2021-08-21 02:40:15'),
	(79, '1', NULL, 24, 1, 1, 76, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:41:02', '2021-08-21 02:41:02'),
	(80, '01', NULL, 4, 1, 1, 77, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:42:05', '2021-08-21 02:42:05'),
	(81, '1', NULL, 2, 1, 1, 78, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:42:43', '2021-08-21 02:42:43'),
	(82, '0', NULL, 69, 1, 4, 79, 10000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 02:45:34', '2021-08-21 12:13:06'),
	(83, '1', NULL, 17, 1, 1, 80, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:47:00', '2021-08-21 02:47:00'),
	(84, '2', NULL, 3, 1, 1, 81, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:47:59', '2021-08-21 02:47:59'),
	(85, '1', NULL, 15, 1, 1, 82, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:49:25', '2021-08-21 02:49:25'),
	(86, '0', NULL, 39, 1, 3, 83, 5000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 02:50:45', '2021-08-21 11:50:50'),
	(87, '3', NULL, 3, 1, 1, 84, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:51:29', '2021-08-21 02:51:29'),
	(88, '1', NULL, 39, 1, 3, 85, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:53:18', '2021-08-21 02:53:18'),
	(89, '2', NULL, 62, 1, 1, 85, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:54:51', '2021-08-21 02:54:51'),
	(90, '1', NULL, 70, 1, 1, 86, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:59:40', '2021-08-21 02:59:40'),
	(91, '1', NULL, 42, 1, 1, 87, 50000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:03:26', '2021-08-21 03:03:26'),
	(92, '2', NULL, 39, 1, 3, 88, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:06:53', '2021-08-21 03:06:53'),
	(93, '2', NULL, 4, 1, 1, 89, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:08:47', '2021-08-21 03:08:47'),
	(94, '1', NULL, 62, 1, 1, 90, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:09:36', '2021-08-21 03:09:36'),
	(95, '1', NULL, 39, 1, 3, 91, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:11:27', '2021-08-21 03:11:27'),
	(96, '1', NULL, 70, 1, 1, 92, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:12:15', '2021-08-21 03:12:15'),
	(97, '1', NULL, 69, 1, 4, 93, 10000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:13:32', '2021-08-21 03:13:32'),
	(98, '1', NULL, 65, 1, 3, 94, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:14:26', '2021-08-21 03:14:26'),
	(99, '1', NULL, 39, 1, 3, 95, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:15:10', '2021-08-21 03:15:10'),
	(100, '1', NULL, 69, 1, 4, 96, 10000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:16:11', '2021-08-21 03:16:11'),
	(101, '1', NULL, 62, 1, 1, 97, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:16:56', '2021-08-21 03:16:56'),
	(102, '1', NULL, 67, 1, 1, 98, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:17:53', '2021-08-21 03:17:53'),
	(103, '1', NULL, 15, 1, 1, 99, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:18:36', '2021-08-21 03:18:36'),
	(104, '1', NULL, 64, 1, 1, 100, 30000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:19:49', '2021-08-21 03:19:49'),
	(105, '1', NULL, 4, 1, 1, 101, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:22:34', '2021-08-21 03:22:34'),
	(106, '1', NULL, 4, 1, 1, 102, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:23:49', '2021-08-21 03:23:49'),
	(107, '1', NULL, 17, 1, 1, 102, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:23:49', '2021-08-21 03:23:49'),
	(108, '3', NULL, 4, 1, 1, 103, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:24:53', '2021-08-21 03:24:53'),
	(109, '2', NULL, 69, 1, 4, 104, 10000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:25:52', '2021-08-21 03:25:52'),
	(110, '1', NULL, 13, 1, 1, 105, 40000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:26:46', '2021-08-21 03:26:46'),
	(111, '1', NULL, 13, 1, 1, 106, 50000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:28:36', '2021-08-21 03:28:36'),
	(112, '1', NULL, 69, 1, 4, 107, 10000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:29:14', '2021-08-21 03:29:14'),
	(113, '0', NULL, 24, 1, 1, 108, 70000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 03:31:46', '2021-08-21 11:50:34'),
	(114, '1', NULL, 62, 1, 1, 109, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:32:31', '2021-08-21 03:32:31'),
	(115, '1', NULL, 39, 1, 3, 110, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:33:15', '2021-08-21 03:33:15'),
	(116, '1', NULL, 37, 1, 3, 111, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:34:03', '2021-08-21 03:34:03'),
	(117, '1', NULL, 70, 1, 1, 112, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:34:53', '2021-08-21 03:34:53'),
	(118, '1', NULL, 17, 1, 1, 113, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:35:53', '2021-08-21 03:35:53'),
	(119, '1', NULL, 37, 1, 3, 114, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:37:23', '2021-08-21 03:37:23'),
	(120, '1', NULL, 62, 1, 1, 115, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:38:16', '2021-08-21 03:38:16'),
	(121, '1', NULL, 71, 1, 1, 116, 200000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:43:39', '2021-08-21 03:43:39'),
	(122, '1', NULL, 23, 1, 1, 117, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:44:28', '2021-08-21 03:44:28'),
	(123, '2', NULL, 39, 1, 3, 118, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:45:18', '2021-08-21 03:45:18'),
	(124, '2', NULL, 39, 1, 3, 119, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:46:16', '2021-08-21 03:46:16'),
	(125, '1', NULL, 2, 1, 1, 120, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:47:53', '2021-08-21 03:47:53'),
	(126, '1', NULL, 62, 1, 1, 121, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:48:42', '2021-08-21 03:48:42'),
	(127, '2', NULL, 62, 1, 1, 122, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:49:43', '2021-08-21 03:49:43'),
	(128, '1', NULL, 39, 1, 3, 123, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:50:37', '2021-08-21 03:50:37'),
	(129, '2', NULL, 39, 1, 3, 124, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:51:26', '2021-08-21 03:51:26'),
	(130, '2', NULL, 2, 1, 1, 125, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:52:21', '2021-08-21 03:52:21'),
	(131, '1', NULL, 51, 1, 1, 126, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:56:38', '2021-08-21 03:56:38'),
	(132, '1', NULL, 7, 1, 1, 126, 90000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:56:38', '2021-08-21 03:56:38'),
	(133, '0', NULL, 72, 1, 3, 127, 20000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 04:05:28', '2021-08-21 12:26:40'),
	(134, '1', NULL, 3, 1, 1, 128, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:06:23', '2021-08-21 04:06:23'),
	(135, '1', NULL, 16, 1, 1, 129, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:08:08', '2021-08-21 04:08:08'),
	(136, '1', NULL, 62, 1, 1, 130, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:10:21', '2021-08-21 04:10:21'),
	(137, '1', NULL, 60, 1, 3, 131, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:11:08', '2021-08-21 04:11:08'),
	(138, '1', NULL, 11, 1, 1, 132, 150000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:11:49', '2021-08-21 04:11:49'),
	(139, '1', NULL, 4, 1, 1, 133, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:12:55', '2021-08-21 04:12:55'),
	(140, '1', NULL, 70, 1, 1, 134, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:13:58', '2021-08-21 04:13:58'),
	(141, '2', NULL, 15, 1, 1, 135, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:17:16', '2021-08-21 04:17:16'),
	(142, '0', NULL, 4, 1, 1, 136, 70000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 04:18:01', '2021-08-21 12:20:59'),
	(143, '1', NULL, 62, 1, 1, 137, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:18:57', '2021-08-21 04:18:57'),
	(144, '2', NULL, 39, 1, 3, 138, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:19:57', '2021-08-21 04:19:57'),
	(145, '1', NULL, 39, 1, 3, 139, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:21:03', '2021-08-21 04:21:03'),
	(146, '2', NULL, 2, 1, 1, 140, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:26:44', '2021-08-21 04:26:44'),
	(147, '0', NULL, 73, 1, 1, 141, 40000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 04:27:40', '2021-08-21 11:49:13'),
	(148, '1', NULL, 69, 1, 4, 142, 10000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:28:55', '2021-08-21 04:28:55'),
	(149, '02', NULL, 39, 1, 3, 143, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:29:38', '2021-08-21 04:29:38'),
	(150, '0', NULL, 4, 1, 1, 144, 70000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 04:30:42', '2021-08-21 11:50:19'),
	(151, '2', NULL, 7, 1, 1, 145, 90000, 0, 20000, NULL, NULL, 16, 7, '2021-08-21 04:33:57', '2021-08-21 22:54:49'),
	(152, '2', NULL, 74, 1, 3, 146, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:34:54', '2021-08-21 04:34:54'),
	(153, '1', NULL, 39, 1, 3, 147, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:35:36', '2021-08-21 04:35:36'),
	(154, '1', NULL, 2, 1, 1, 148, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:37:57', '2021-08-21 04:37:57'),
	(155, '1', NULL, 63, 1, 1, 149, 250000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:44:31', '2021-08-21 04:44:31'),
	(156, '1', NULL, 74, 1, 3, 150, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:49:26', '2021-08-21 04:49:26'),
	(157, '1', NULL, 74, 1, 3, 151, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:51:04', '2021-08-21 04:51:04'),
	(158, '2', NULL, 63, 1, 2, 152, 270000, 0, 40000, NULL, NULL, 16, 7, '2021-08-21 04:53:28', '2021-08-21 22:52:21'),
	(159, '0', NULL, 63, 1, 1, 153, 250000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 05:05:08', '2021-08-21 12:29:05'),
	(160, '0', NULL, 15, 1, 1, 154, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 05:06:53', '2021-08-21 11:31:19'),
	(161, '1', NULL, 62, 1, 1, 155, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 05:07:41', '2021-08-21 05:07:41'),
	(162, '2', NULL, 63, 1, 1, 156, 250000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 05:23:16', '2021-08-21 05:23:16'),
	(163, '2', NULL, 3, 1, 1, 157, 70000, 0, 20000, NULL, NULL, 16, 7, '2021-08-21 05:25:09', '2021-08-21 22:48:59'),
	(164, '1', NULL, 2, 1, 1, 158, 60000, 0, 10000, NULL, NULL, 16, 7, '2021-08-21 05:25:56', '2021-08-21 23:01:38'),
	(165, '2', NULL, 2, 1, 1, 159, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 05:27:10', '2021-08-21 05:27:10'),
	(166, '0', NULL, 3, 1, 1, 160, 70000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 05:28:52', '2021-08-21 12:07:22'),
	(167, '1', NULL, 2, 1, 1, 161, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 05:29:57', '2021-08-21 05:29:57'),
	(168, '0', NULL, 16, 1, 1, 162, 70000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 05:40:01', '2021-08-21 11:30:48'),
	(169, '0', NULL, 15, 1, 1, 163, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 05:40:57', '2021-08-21 12:28:49'),
	(170, '1', NULL, 2, 1, 1, 164, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 05:45:22', '2021-08-21 05:45:22'),
	(171, '0', NULL, 63, 1, 1, 165, 250000, 1, 0, NULL, NULL, NULL, 7, '2021-08-21 06:20:31', '2021-08-21 12:19:13'),
	(172, '2', NULL, 5, 1, 1, 166, 80000, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 12:18:20', '2021-08-21 12:18:20'),
	(173, '1', NULL, 63, 1, 1, 166, 250000, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 12:18:20', '2021-08-21 12:18:20'),
	(174, '1', NULL, 4, 1, 1, 167, 70000, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 12:20:45', '2021-08-21 12:20:45'),
	(175, '3', NULL, 63, 1, 1, 168, 250000, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 12:22:27', '2021-08-21 12:22:27'),
	(176, '1', NULL, 15, 1, 1, 169, 60000, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 12:23:27', '2021-08-21 12:23:27'),
	(177, '2', NULL, 11, 1, 1, 170, 150000, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 12:24:22', '2021-08-21 12:24:22'),
	(180, '2', NULL, 62, 1, 1, 172, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 23:48:56', '2021-08-21 23:48:56'),
	(181, '2', NULL, 60, 1, 3, 172, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 23:50:14', '2021-08-21 23:50:14'),
	(182, '1', NULL, 39, 1, 3, 173, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:10:47', '2021-08-22 00:10:47'),
	(183, '1', NULL, 16, 1, 1, 174, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:20:44', '2021-08-22 00:20:44'),
	(184, '1', NULL, 15, 1, 1, 175, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:22:48', '2021-08-22 00:22:48'),
	(185, '0', NULL, 5, 1, 1, 176, 80000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 00:26:27', '2021-08-23 14:32:33'),
	(186, '1', NULL, 2, 1, 1, 177, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:27:25', '2021-08-22 00:27:25'),
	(187, '1', NULL, 2, 1, 1, 178, 60000, 0, 10000, NULL, NULL, 16, 7, '2021-08-22 00:28:06', '2021-08-23 15:13:28'),
	(188, '0', NULL, 2, 1, 1, 179, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 00:28:45', '2021-08-23 14:34:16'),
	(189, '0', NULL, 2, 1, 1, 180, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 00:29:20', '2021-08-23 14:33:53'),
	(190, '0', NULL, 63, 1, 1, 181, 250000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 00:30:06', '2021-08-23 14:30:09'),
	(191, '0', NULL, 5, 1, 1, 182, 80000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 00:30:42', '2021-08-23 14:31:27'),
	(192, '1', NULL, 76, 1, 5, 183, 20000, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 00:31:18', '2021-08-22 00:31:18'),
	(193, '1', NULL, 5, 1, 1, 184, 80000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:31:59', '2021-08-22 00:31:59'),
	(194, '1', NULL, 39, 1, 3, 185, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:32:58', '2021-08-22 00:32:58'),
	(195, '1', NULL, 39, 1, 3, 186, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:33:43', '2021-08-22 00:33:43'),
	(196, '1', NULL, 2, 1, 1, 187, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:34:31', '2021-08-22 00:34:31'),
	(197, '1', NULL, 2, 1, 1, 188, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:35:08', '2021-08-22 00:35:08'),
	(198, '1', NULL, 3, 1, 1, 189, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:39:04', '2021-08-22 00:39:04'),
	(199, '0', NULL, 3, 1, 1, 190, 70000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 00:40:04', '2021-08-23 14:17:23'),
	(200, '1', NULL, 3, 1, 1, 191, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:40:44', '2021-08-22 00:40:44'),
	(201, '0', NULL, 3, 1, 1, 192, 70000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 00:41:21', '2021-08-23 14:35:13'),
	(202, '0', NULL, 2, 1, 1, 193, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 00:42:11', '2021-08-23 14:35:53'),
	(203, '0', NULL, 2, 1, 1, 194, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 00:43:04', '2021-08-23 14:36:51'),
	(204, '0', NULL, 2, 1, 1, 195, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 00:43:54', '2021-08-23 14:36:29'),
	(205, '0', NULL, 2, 1, 1, 196, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 00:44:33', '2021-08-23 14:36:11'),
	(206, '1', NULL, 2, 1, 1, 197, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:45:24', '2021-08-22 00:45:24'),
	(207, '1', NULL, 39, 1, 3, 198, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:46:02', '2021-08-22 00:46:02'),
	(208, '1', NULL, 81, 1, 5, 199, 140000, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 00:53:26', '2021-08-22 00:53:26'),
	(209, '1', NULL, 77, 1, 5, 200, 60000, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 00:56:28', '2021-08-22 00:56:28'),
	(210, '0', NULL, 3, 1, 1, 201, 70000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 00:56:57', '2021-08-23 14:28:49'),
	(211, '1', NULL, 39, 1, 3, 202, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:57:38', '2021-08-22 00:57:38'),
	(212, '2', NULL, 39, 1, 3, 203, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:58:28', '2021-08-22 00:58:28'),
	(213, '1', NULL, 62, 1, 1, 204, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:59:04', '2021-08-22 00:59:04'),
	(214, '0', NULL, 11, 1, 1, 205, 150000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 01:01:09', '2021-08-23 14:23:59'),
	(215, '0', NULL, 3, 1, 1, 206, 70000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 01:01:53', '2021-08-23 14:38:42'),
	(216, '8', NULL, 2, 1, 1, 207, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:03:09', '2021-08-22 01:03:09'),
	(217, '0', NULL, 1, 1, 1, 208, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 01:03:49', '2021-08-23 14:20:36'),
	(218, '0', NULL, 1, 1, 1, 209, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 01:04:21', '2021-08-23 14:18:19'),
	(219, '0', NULL, 1, 1, 1, 210, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 01:10:18', '2021-08-23 14:20:00'),
	(220, '2', NULL, 1, 1, 1, 211, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:11:11', '2021-08-22 01:11:11'),
	(221, '1', NULL, 2, 1, 1, 212, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:11:58', '2021-08-22 01:11:58'),
	(222, '1', NULL, 2, 1, 1, 213, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:12:42', '2021-08-22 01:12:42'),
	(223, '1', NULL, 2, 1, 1, 214, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:13:16', '2021-08-22 01:13:16'),
	(224, '0', NULL, 15, 1, 1, 215, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 01:13:59', '2021-08-23 14:21:37'),
	(225, '0', NULL, 3, 1, 1, 216, 70000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 01:14:35', '2021-08-23 14:29:32'),
	(226, '1', NULL, 64, 1, 1, 217, 30000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:15:36', '2021-08-22 01:15:36'),
	(227, '2', NULL, 15, 1, 1, 218, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:17:28', '2021-08-22 01:17:28'),
	(228, '3', NULL, 3, 1, 1, 218, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:17:28', '2021-08-22 01:17:28'),
	(229, '3', NULL, 2, 1, 1, 219, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:18:15', '2021-08-22 01:18:15'),
	(230, '0', NULL, 2, 1, 1, 220, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 01:19:43', '2021-08-23 14:26:49'),
	(231, '1', NULL, 2, 1, 1, 221, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:20:46', '2021-08-22 01:20:46'),
	(232, '0', NULL, 2, 1, 1, 222, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 01:21:28', '2021-08-23 14:35:33'),
	(233, '0', NULL, 2, 1, 1, 223, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 01:22:17', '2021-08-23 14:24:30'),
	(234, '2', NULL, 2, 1, 1, 224, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:23:20', '2021-08-22 01:23:20'),
	(235, '0', NULL, 2, 1, 1, 225, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 01:24:04', '2021-08-23 14:22:16'),
	(236, '2', NULL, 4, 1, 1, 226, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:24:59', '2021-08-22 01:24:59'),
	(237, '2', NULL, 15, 1, 1, 227, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:26:03', '2021-08-22 01:26:03'),
	(238, '1', NULL, 39, 1, 3, 228, 5000, 0, 5000, NULL, NULL, 16, 7, '2021-08-22 01:26:45', '2021-08-23 15:37:53'),
	(239, '2', NULL, 17, 1, 1, 229, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:28:19', '2021-08-22 01:28:19'),
	(240, '4', NULL, 2, 1, 1, 230, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:29:11', '2021-08-22 01:29:11'),
	(241, '2', NULL, 39, 1, 3, 231, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:31:28', '2021-08-22 01:31:28'),
	(242, '1', NULL, 39, 1, 3, 232, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:32:11', '2021-08-22 01:32:11'),
	(243, '0', NULL, 2, 1, 1, 233, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 01:34:49', '2021-08-23 14:37:28'),
	(244, '0', NULL, 44, 1, 1, 233, 30000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 01:34:50', '2021-08-23 14:37:53'),
	(245, '1', NULL, 76, 1, 5, 234, 20000, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 01:39:10', '2021-08-22 01:39:10'),
	(246, '1', NULL, 2, 1, 1, 235, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:40:34', '2021-08-22 01:40:34'),
	(247, '1', NULL, 39, 1, 3, 236, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:41:37', '2021-08-22 01:41:37'),
	(248, '5', NULL, 39, 1, 3, 237, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:42:56', '2021-08-22 01:42:56'),
	(249, '0', NULL, 44, 1, 1, 238, 30000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 01:44:39', '2021-08-23 14:27:44'),
	(250, '1', NULL, 75, 1, 4, 239, 10000, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 01:46:56', '2021-08-22 01:46:56'),
	(251, '1', NULL, 2, 1, 1, 240, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:52:12', '2021-08-22 01:52:12'),
	(252, '1', NULL, 39, 1, 3, 241, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:53:08', '2021-08-22 01:53:08'),
	(253, '3', NULL, 39, 1, 3, 242, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:56:09', '2021-08-22 01:56:09'),
	(255, '1', NULL, 39, 1, 3, 244, 5000, 0, 5000, NULL, NULL, 16, 7, '2021-08-22 02:02:50', '2021-08-23 15:40:48'),
	(256, '1', NULL, 60, 1, 3, 245, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:03:40', '2021-08-22 02:03:40'),
	(257, '1', NULL, 62, 1, 1, 246, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:05:33', '2021-08-22 02:05:33'),
	(258, '1', NULL, 76, 1, 5, 247, 20000, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:06:06', '2021-08-22 02:06:06'),
	(259, '1', NULL, 39, 1, 3, 248, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:06:42', '2021-08-22 02:06:42'),
	(260, '1', NULL, 60, 1, 3, 248, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:06:42', '2021-08-22 02:06:42'),
	(261, '1', NULL, 75, 1, 4, 249, 10000, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:08:04', '2021-08-22 02:08:04'),
	(262, '1', NULL, 4, 1, 1, 250, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:09:45', '2021-08-22 02:09:45'),
	(263, '2', NULL, 76, 1, 5, 251, 20000, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:16:59', '2021-08-22 02:16:59'),
	(264, '1', NULL, 75, 1, 4, 252, 10000, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:17:42', '2021-08-22 02:17:42'),
	(265, '1', NULL, 76, 1, 5, 253, 20000, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:22:07', '2021-08-22 02:22:07'),
	(266, '1', NULL, 70, 1, 1, 254, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:22:31', '2021-08-22 02:22:31'),
	(267, '1', NULL, 77, 1, 5, 255, 60000, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:23:09', '2021-08-22 02:23:09'),
	(268, '1', NULL, 2, 1, 1, 256, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:23:12', '2021-08-22 02:23:12'),
	(269, '2', NULL, 85, 1, 6, 257, 3000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:24:08', '2021-08-22 02:24:08'),
	(270, '1', NULL, 76, 1, 5, 258, 20000, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:24:42', '2021-08-22 02:24:42'),
	(271, '1', NULL, 75, 1, 4, 259, 10000, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:25:16', '2021-08-22 02:25:16'),
	(272, '1', NULL, 70, 1, 1, 260, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:25:45', '2021-08-22 02:25:45'),
	(273, '0', NULL, 15, 1, 1, 261, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 02:26:34', '2021-08-23 14:23:02'),
	(274, '1', NULL, 77, 1, 5, 262, 60000, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:29:11', '2021-08-22 02:29:11'),
	(275, '1', NULL, 70, 1, 1, 263, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:29:37', '2021-08-22 02:29:37'),
	(276, '1', NULL, 62, 1, 1, 264, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:30:19', '2021-08-22 02:30:19'),
	(277, '1', NULL, 77, 1, 5, 265, 60000, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:30:27', '2021-08-22 02:30:27'),
	(278, '1', NULL, 39, 1, 3, 266, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:31:05', '2021-08-22 02:31:05'),
	(279, '1', NULL, 70, 1, 1, 267, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:32:11', '2021-08-22 02:32:11'),
	(280, '1', NULL, 86, 1, 1, 268, 110000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:35:46', '2021-08-22 02:35:46'),
	(281, '2', NULL, 11, 1, 1, 269, 150000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:36:32', '2021-08-22 02:36:32'),
	(282, '1', NULL, 2, 1, 1, 270, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:37:11', '2021-08-22 02:37:11'),
	(283, '1', NULL, 43, 1, 1, 271, 90000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:40:11', '2021-08-22 02:40:11'),
	(284, '1', NULL, 43, 1, 1, 272, 90000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:40:56', '2021-08-22 02:40:56'),
	(285, '0', NULL, 43, 1, 1, 273, 90000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 02:41:56', '2021-08-23 14:31:02'),
	(286, '0', NULL, 43, 1, 1, 274, 90000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 02:42:38', '2021-08-23 14:32:09'),
	(287, '2', NULL, 2, 1, 1, 275, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:44:08', '2021-08-22 02:44:08'),
	(288, '1', NULL, 62, 1, 1, 276, 5000, 0, 5000, NULL, NULL, 16, 7, '2021-08-22 02:46:50', '2021-08-23 15:41:53'),
	(289, '1', NULL, 70, 1, 1, 277, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:47:28', '2021-08-22 02:47:28'),
	(290, '0', NULL, 2, 1, 1, 278, 60000, 1, 0, NULL, NULL, 17, 7, '2021-08-22 02:48:09', '2021-08-23 14:34:43'),
	(291, '1', NULL, 62, 1, 1, 279, 5000, 0, 5000, NULL, NULL, 16, 7, '2021-08-22 02:51:45', '2021-08-23 15:35:36'),
	(292, '1', NULL, 62, 1, 1, 280, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:52:30', '2021-08-22 02:52:30'),
	(293, '1', NULL, 70, 1, 1, 281, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:53:18', '2021-08-22 02:53:18'),
	(294, '1', NULL, 39, 1, 3, 282, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:53:50', '2021-08-22 02:53:50'),
	(295, '2', NULL, 39, 1, 3, 283, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:54:29', '2021-08-22 02:54:29'),
	(296, '1', NULL, 70, 1, 1, 284, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:55:23', '2021-08-22 02:55:23'),
	(297, '1', NULL, 8, 1, 1, 285, 110000, 0, 0, NULL, NULL, 17, 7, '2021-08-22 02:56:27', '2021-08-22 02:58:35'),
	(298, '3', NULL, 2, 1, 1, 286, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 03:00:34', '2021-08-22 03:00:34'),
	(299, '1', NULL, 17, 1, 1, 287, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 03:01:22', '2021-08-22 03:01:22'),
	(300, '5', NULL, 2, 1, 1, 288, 60000, 0, 25000, NULL, NULL, 16, 7, '2021-08-22 03:02:09', '2021-08-23 15:27:20'),
	(301, '2', NULL, 62, 1, 1, 289, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 03:12:04', '2021-08-22 03:12:04'),
	(302, '1', NULL, 70, 1, 1, 290, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 03:13:18', '2021-08-22 03:13:18'),
	(303, '0', NULL, 63, 1, 1, 291, 250000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 03:16:59', '2021-08-23 14:30:33'),
	(304, '1', NULL, 51, 1, 1, 292, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:14:27', '2021-08-22 04:14:27'),
	(305, '1', NULL, 15, 1, 1, 293, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:15:26', '2021-08-22 04:15:26'),
	(306, '1', NULL, 11, 1, 1, 294, 150000, 0, 20000, NULL, NULL, 16, 7, '2021-08-22 04:16:14', '2021-08-23 15:19:59'),
	(307, '1', NULL, 2, 1, 1, 295, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:16:51', '2021-08-22 04:16:51'),
	(308, '2', NULL, 85, 1, 6, 296, 3000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:17:43', '2021-08-22 04:17:43'),
	(309, '1', NULL, 17, 1, 1, 297, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:19:28', '2021-08-22 04:19:28'),
	(310, '1', NULL, 3, 1, 1, 298, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:21:00', '2021-08-22 04:21:00'),
	(311, '0', NULL, 15, 1, 1, 299, 60000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 04:21:43', '2021-08-23 14:33:28'),
	(312, '1', NULL, 69, 1, 4, 300, 10000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:23:25', '2021-08-22 04:23:25'),
	(313, '1', NULL, 39, 1, 3, 301, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:24:08', '2021-08-22 04:24:08'),
	(314, '1', NULL, 39, 1, 3, 302, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:24:54', '2021-08-22 04:24:54'),
	(315, '1', NULL, 4, 1, 1, 303, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:25:52', '2021-08-22 04:25:52'),
	(316, '1', NULL, 2, 1, 1, 304, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:30:06', '2021-08-22 04:30:06'),
	(317, '1', NULL, 4, 1, 1, 305, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:35:29', '2021-08-22 04:35:29'),
	(318, '1', NULL, 2, 1, 1, 306, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:36:53', '2021-08-22 04:36:53'),
	(319, '1', NULL, 62, 1, 1, 307, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:38:30', '2021-08-22 04:38:30'),
	(320, '1', NULL, 11, 1, 1, 308, 150000, 0, 20000, NULL, NULL, 16, 7, '2021-08-22 04:39:42', '2021-08-23 15:23:42'),
	(321, '1', NULL, 4, 1, 1, 309, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:40:52', '2021-08-22 04:40:52'),
	(322, '2', NULL, 7, 1, 1, 310, 90000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:41:56', '2021-08-22 04:41:56'),
	(323, '1', NULL, 7, 1, 1, 311, 90000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:44:22', '2021-08-22 04:44:22'),
	(324, '2', NULL, 2, 1, 1, 311, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:44:22', '2021-08-22 04:44:22'),
	(325, '0', NULL, 70, 1, 1, 312, 5000, 1, 0, NULL, NULL, NULL, 7, '2021-08-22 04:45:24', '2021-08-23 14:33:05'),
	(326, '1', NULL, 15, 1, 1, 313, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:46:36', '2021-08-22 04:46:36'),
	(327, '1', NULL, 2, 1, 1, 314, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:51:19', '2021-08-22 04:51:19'),
	(328, '1', NULL, 2, 1, 1, 315, 60000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:52:25', '2021-08-22 04:52:25'),
	(329, '1', NULL, 11, 1, 1, 316, 150000, 0, 20000, NULL, NULL, 16, 7, '2021-08-22 05:43:55', '2021-08-23 15:17:18'),
	(330, '1', NULL, 11, 1, 1, 317, 150000, 0, 20000, NULL, NULL, 16, 7, '2021-08-22 05:44:56', '2021-08-23 15:22:13'),
	(331, '1', NULL, 64, 1, 1, 318, 30000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 05:45:55', '2021-08-22 05:45:55'),
	(332, '1', NULL, 4, 1, 1, 319, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 05:46:42', '2021-08-22 05:46:42'),
	(333, '1', NULL, 44, 1, 1, 320, 30000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 05:47:37', '2021-08-22 05:47:37'),
	(334, '1', NULL, 16, 1, 1, 321, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 05:48:46', '2021-08-22 05:48:46'),
	(335, '1', NULL, 17, 1, 1, 321, 70000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 05:48:46', '2021-08-22 05:48:46'),
	(336, '1', NULL, 62, 1, 1, 322, 5000, 0, 5000, NULL, NULL, 16, 7, '2021-08-22 05:50:00', '2021-08-23 15:39:16'),
	(337, '1', NULL, 70, 1, 1, 323, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 05:51:00', '2021-08-22 05:51:00'),
	(338, '1', NULL, 70, 1, 1, 324, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 05:51:55', '2021-08-22 05:51:55'),
	(339, '1', NULL, 70, 1, 1, 325, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 05:52:56', '2021-08-22 05:52:56'),
	(340, '1', NULL, 62, 1, 1, 325, 5000, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 05:52:56', '2021-08-22 05:52:56'),
	(341, '3', NULL, 43, 1, 1, 166, 90000, 0, 0, NULL, NULL, NULL, 16, '2021-08-23 15:50:45', '2021-08-23 15:55:44');
/*!40000 ALTER TABLE `article_ventes` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. banques
CREATE TABLE IF NOT EXISTS `banques` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_banque` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.banques : ~0 rows (environ)
/*!40000 ALTER TABLE `banques` DISABLE KEYS */;
/*!40000 ALTER TABLE `banques` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. billetages
CREATE TABLE IF NOT EXISTS `billetages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `caisse_ouverte_id` int(10) unsigned NOT NULL,
  `billet` int(10) unsigned NOT NULL DEFAULT '0',
  `quantite` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.billetages : ~0 rows (environ)
/*!40000 ALTER TABLE `billetages` DISABLE KEYS */;
INSERT INTO `billetages` (`id`, `caisse_ouverte_id`, `billet`, `quantite`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 1, 10000, 6, NULL, NULL, NULL, 5, '2021-08-20 17:45:24', '2021-08-20 17:45:24'),
	(2, 2, 10000, 18, NULL, NULL, NULL, 7, '2021-08-20 23:29:36', '2021-08-20 23:29:36'),
	(3, 3, 10000, 1020, NULL, NULL, NULL, 16, '2021-08-21 23:05:38', '2021-08-21 23:05:38');
/*!40000 ALTER TABLE `billetages` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. bon_commandes
CREATE TABLE IF NOT EXISTS `bon_commandes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `numero_bon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scan_facture_commande` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_bon_commande` date NOT NULL,
  `date_reception_commande` date NOT NULL,
  `fournisseur_id` int(10) unsigned NOT NULL,
  `accompteFournisseur` bigint(20) unsigned NOT NULL DEFAULT '0',
  `livrer` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.bon_commandes : ~0 rows (environ)
/*!40000 ALTER TABLE `bon_commandes` DISABLE KEYS */;
/*!40000 ALTER TABLE `bon_commandes` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. caisses
CREATE TABLE IF NOT EXISTS `caisses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_caisse` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `depot_id` int(11) NOT NULL,
  `ouvert` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.caisses : ~2 rows (environ)
/*!40000 ALTER TABLE `caisses` DISABLE KEYS */;
INSERT INTO `caisses` (`id`, `libelle_caisse`, `depot_id`, `ouvert`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Principale', 1, 1, NULL, NULL, 7, 2, '2021-08-17 15:48:47', '2021-08-21 23:47:09'),
	(2, 'SACE', 1, 1, NULL, NULL, 19, 2, '2021-08-17 15:48:53', '2021-08-22 00:29:03');
/*!40000 ALTER TABLE `caisses` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. caisse_ouvertes
CREATE TABLE IF NOT EXISTS `caisse_ouvertes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `montant_ouverture` bigint(20) unsigned NOT NULL,
  `solde_fermeture` bigint(20) unsigned NOT NULL DEFAULT '0',
  `entree` bigint(20) unsigned NOT NULL DEFAULT '0',
  `sortie` bigint(20) unsigned NOT NULL DEFAULT '0',
  `caisse_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `motif_non_conformite` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_ouverture` datetime NOT NULL,
  `date_fermeture` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.caisse_ouvertes : ~5 rows (environ)
/*!40000 ALTER TABLE `caisse_ouvertes` DISABLE KEYS */;
INSERT INTO `caisse_ouvertes` (`id`, `montant_ouverture`, `solde_fermeture`, `entree`, `sortie`, `caisse_id`, `user_id`, `motif_non_conformite`, `date_ouverture`, `date_fermeture`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 0, 60000, 0, 0, 1, 8, NULL, '2021-08-20 14:34:47', '2021-08-20 17:45:24', NULL, NULL, 5, 8, '2021-08-20 14:34:47', '2021-08-20 17:45:24'),
	(2, 0, 180000, 0, 0, 1, 7, NULL, '2021-08-20 23:26:31', '2021-08-20 23:29:36', NULL, NULL, 7, 7, '2021-08-20 23:26:31', '2021-08-20 23:29:36'),
	(3, 0, 10200000, 0, 0, 1, 7, NULL, '2021-08-20 23:30:09', '2021-08-21 23:05:38', NULL, NULL, 16, 7, '2021-08-20 23:30:09', '2021-08-21 23:05:38'),
	(4, 0, 0, 0, 0, 1, 7, NULL, '2021-08-21 23:47:09', NULL, NULL, NULL, NULL, 7, '2021-08-21 23:47:09', '2021-08-21 23:47:09'),
	(5, 0, 0, 0, 0, 2, 19, NULL, '2021-08-22 00:29:03', NULL, NULL, NULL, NULL, 19, '2021-08-22 00:29:03', '2021-08-22 00:29:03');
/*!40000 ALTER TABLE `caisse_ouvertes` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. casiers
CREATE TABLE IF NOT EXISTS `casiers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_casier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.casiers : ~0 rows (environ)
/*!40000 ALTER TABLE `casiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `casiers` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_categorie` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.categories : ~9 rows (environ)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `libelle_categorie`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Champagnes', NULL, NULL, 2, 2, '2021-08-17 15:40:41', '2021-08-17 15:40:58'),
	(2, 'Whiskies', NULL, NULL, NULL, 2, '2021-08-17 15:41:01', '2021-08-17 15:41:01'),
	(3, 'Cognac', NULL, NULL, NULL, 2, '2021-08-17 15:41:07', '2021-08-17 15:41:07'),
	(4, 'Vodkas', NULL, NULL, NULL, 2, '2021-08-17 15:41:13', '2021-08-17 15:41:13'),
	(5, 'Gins', NULL, NULL, NULL, 2, '2021-08-17 15:41:18', '2021-08-17 15:41:18'),
	(6, 'Rhums', NULL, NULL, NULL, 2, '2021-08-17 15:41:22', '2021-08-17 15:41:22'),
	(7, 'Liqueurs', NULL, NULL, NULL, 2, '2021-08-17 15:41:26', '2021-08-17 15:41:26'),
	(8, 'Apéritifs', NULL, NULL, NULL, 2, '2021-08-17 15:41:33', '2021-08-17 15:41:33'),
	(9, 'Vins', NULL, NULL, NULL, 2, '2021-08-17 15:41:38', '2021-08-17 15:41:38'),
	(10, 'Soda', NULL, NULL, NULL, 5, '2021-08-21 01:03:42', '2021-08-21 01:03:42'),
	(11, 'Bières', NULL, NULL, NULL, 5, '2021-08-21 02:57:55', '2021-08-21 02:57:55'),
	(12, 'Conso', NULL, NULL, NULL, 5, '2021-08-22 00:19:00', '2021-08-22 00:19:00'),
	(13, 'Tequila', NULL, NULL, NULL, 5, '2021-08-22 02:15:02', '2021-08-22 02:15:02');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. categorie_depenses
CREATE TABLE IF NOT EXISTS `categorie_depenses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_categorie_depense` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.categorie_depenses : ~0 rows (environ)
/*!40000 ALTER TABLE `categorie_depenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorie_depenses` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. caution_agences
CREATE TABLE IF NOT EXISTS `caution_agences` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `deposant` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_versement` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_versement` date NOT NULL,
  `montant_depose` bigint(20) unsigned NOT NULL,
  `type_caution_id` int(10) unsigned NOT NULL,
  `agence_id` int(10) unsigned NOT NULL,
  `moyen_reglement_id` int(10) unsigned NOT NULL,
  `recu_versement` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmer` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.caution_agences : ~0 rows (environ)
/*!40000 ALTER TABLE `caution_agences` DISABLE KEYS */;
/*!40000 ALTER TABLE `caution_agences` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. clients
CREATE TABLE IF NOT EXISTS `clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `full_name_client` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_client` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_client` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nation_id` int(10) unsigned NOT NULL,
  `regime_id` int(10) unsigned NOT NULL,
  `email_client` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plafond_client` bigint(20) unsigned NOT NULL DEFAULT '0',
  `compte_contribuable_client` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `boite_postale_client` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_client` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax_client` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.clients : ~8 rows (environ)
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`id`, `full_name_client`, `code_client`, `contact_client`, `nation_id`, `regime_id`, `email_client`, `plafond_client`, `compte_contribuable_client`, `boite_postale_client`, `adresse_client`, `fax_client`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'TEGBE', '411TEG1', '(00) 00-00-00-00', 51, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 07:59:45', '2021-08-21 07:59:45'),
	(2, 'Malick DRAME', '411MAL2', '(00) 00-00-00-00', 51, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 08:00:27', '2021-08-21 08:00:27'),
	(3, 'TCHEGBA', '411TCH3', '(00) 00-00-00-00', 51, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 08:01:02', '2021-08-21 08:01:02'),
	(4, 'Jean Yves KOFFI', '411JEA4', '(00) 00-00-00-00', 51, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 08:01:33', '2021-08-21 08:01:33'),
	(5, 'JONESS', '411JON5', '(00) 00-00-00-00', 51, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 08:02:12', '2021-08-21 08:02:12'),
	(6, 'Junior de doubai', '411JUN6', '(00) 00-00-00-00', 51, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2021-08-21 08:03:21', '2021-08-21 08:03:21'),
	(7, 'Mr fabrice tia', '411MRF7', '(00) 00-00-00-00', 51, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, '2021-08-23 15:58:04', '2021-08-23 15:58:04'),
	(8, 'Fabrice tia', '411FAB8', '(00) 00-00-00-00', 51, 1, NULL, 1000000, NULL, 'Abidjan Plateau angle avenue Chardy et Bd Lagunaire', NULL, NULL, NULL, NULL, NULL, 16, '2021-08-23 16:02:50', '2021-08-23 16:02:50');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. configurations
CREATE TABLE IF NOT EXISTS `configurations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nom_compagnie` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commune_compagnie` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_responsable` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_responsable` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cellulaire` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone_fixe` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone_faxe` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_web_compagnie` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_compagnie` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_compagnie` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_compagnie` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital` bigint(20) DEFAULT NULL,
  `rccm` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ncc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_compte_banque` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nc_tresor` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banque` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.configurations : ~0 rows (environ)
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
INSERT INTO `configurations` (`id`, `nom_compagnie`, `commune_compagnie`, `nom_responsable`, `contact_responsable`, `logo`, `cellulaire`, `telephone_fixe`, `telephone_faxe`, `site_web_compagnie`, `adresse_compagnie`, `email_compagnie`, `type_compagnie`, `capital`, `rccm`, `ncc`, `numero_compte_banque`, `nc_tresor`, `banque`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Life Star', 'Abidjan', 'Basile KOFFI', '00 00-00-00-00', 'images/Logo_Life_Star_Texte.png', '07 49-20-20-20', NULL, '07 49-20-20-20', NULL, 'Abidjan Plateau angle avenue Chardy et Bd Lagunaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, '2021-08-17 15:00:14', '2021-08-19 16:15:31');
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. demande_approvi_canals
CREATE TABLE IF NOT EXISTS `demande_approvi_canals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `numero_demande` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deposant` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_versement` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_demande` date NOT NULL,
  `montant_depose` bigint(20) unsigned NOT NULL,
  `type_caution_id` int(10) unsigned NOT NULL,
  `recu_versement` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvisionne` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.demande_approvi_canals : ~0 rows (environ)
/*!40000 ALTER TABLE `demande_approvi_canals` DISABLE KEYS */;
/*!40000 ALTER TABLE `demande_approvi_canals` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. depenses
CREATE TABLE IF NOT EXISTS `depenses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_operation` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `montant_depense` bigint(20) unsigned NOT NULL DEFAULT '0',
  `categorie_depense_id` int(10) unsigned NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.depenses : ~0 rows (environ)
/*!40000 ALTER TABLE `depenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `depenses` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. depots
CREATE TABLE IF NOT EXISTS `depots` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_depot` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse_depot` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_depot` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.depots : ~0 rows (environ)
/*!40000 ALTER TABLE `depots` DISABLE KEYS */;
INSERT INTO `depots` (`id`, `libelle_depot`, `adresse_depot`, `contact_depot`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'LIFE STAR', 'Abidjan Plateau', '07 49-20-20-20', NULL, NULL, 2, 2, '2021-08-17 15:44:58', '2021-08-18 11:26:41');
/*!40000 ALTER TABLE `depots` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. depot_articles
CREATE TABLE IF NOT EXISTS `depot_articles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quantite_disponible` int(11) NOT NULL DEFAULT '0',
  `article_id` int(11) NOT NULL,
  `depot_id` int(11) NOT NULL,
  `prix_vente` int(11) NOT NULL,
  `unite_id` int(11) DEFAULT NULL,
  `date_peremption` date DEFAULT NULL,
  `date_debut_promotion` date DEFAULT NULL,
  `date_fin_promotion` date DEFAULT NULL,
  `promotion` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.depot_articles : ~117 rows (environ)
/*!40000 ALTER TABLE `depot_articles` DISABLE KEYS */;
INSERT INTO `depot_articles` (`id`, `quantite_disponible`, `article_id`, `depot_id`, `prix_vente`, `unite_id`, `date_peremption`, `date_debut_promotion`, `date_fin_promotion`, `promotion`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 50, 1, 1, 60000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 15:51:43', '2021-08-23 14:20:36'),
	(2, 0, 1, 1, 80000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 15:54:22', '2021-08-17 15:54:22'),
	(3, 65, 2, 1, 60000, 1, NULL, NULL, NULL, 0, NULL, NULL, 2, 2, '2021-08-17 15:59:59', '2021-08-23 15:27:20'),
	(4, 0, 2, 1, 90000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:00:41', '2021-08-17 16:00:41'),
	(5, 57, 3, 1, 70000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:01:29', '2021-08-23 15:53:48'),
	(6, 50, 3, 1, 90000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:01:30', '2021-08-21 01:27:08'),
	(7, 42, 4, 1, 70000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:02:14', '2021-08-22 05:46:42'),
	(8, 50, 4, 1, 90000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:02:14', '2021-08-21 01:52:10'),
	(9, 16, 5, 1, 80000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:03:16', '2021-08-23 14:32:33'),
	(10, 20, 5, 1, 100000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:03:16', '2021-08-21 01:12:06'),
	(11, 1, 6, 1, 80000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:06:34', '2021-08-20 14:13:53'),
	(12, 0, 6, 1, 100000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:06:34', '2021-08-17 16:06:34'),
	(13, 16, 7, 1, 90000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:07:48', '2021-08-23 16:37:03'),
	(14, 20, 7, 1, 110000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:07:48', '2021-08-21 01:39:10'),
	(15, 0, 8, 1, 110000, 1, NULL, NULL, NULL, 0, NULL, NULL, 17, 2, '2021-08-17 16:14:47', '2021-08-22 02:58:35'),
	(16, 0, 8, 1, 130000, 2, NULL, NULL, NULL, 0, NULL, NULL, 17, 2, '2021-08-17 16:14:47', '2021-08-22 02:57:57'),
	(17, 0, 9, 1, 100000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:17:39', '2021-08-17 16:17:39'),
	(18, 0, 9, 1, 120000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:17:39', '2021-08-17 16:17:39'),
	(19, 0, 10, 1, 130000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:19:43', '2021-08-17 16:19:43'),
	(20, 0, 10, 1, 150000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:19:43', '2021-08-17 16:19:43'),
	(21, 38, 11, 1, 150000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:20:30', '2021-08-23 15:23:42'),
	(22, 0, 11, 1, 170000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:20:31', '2021-08-17 16:20:31'),
	(23, 1, 12, 1, 250000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:24:05', '2021-08-20 14:13:53'),
	(24, 0, 12, 1, 270000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:24:05', '2021-08-17 16:24:05'),
	(25, 2, 13, 1, 50000, 1, NULL, NULL, NULL, 0, NULL, NULL, 5, 2, '2021-08-17 16:25:34', '2021-08-21 23:32:26'),
	(26, 0, 13, 1, 70000, 2, NULL, NULL, NULL, 0, NULL, NULL, 5, 2, '2021-08-17 16:25:34', '2021-08-21 03:27:47'),
	(27, 1, 14, 1, 60000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:26:35', '2021-08-20 14:13:54'),
	(28, 0, 14, 1, 80000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:26:35', '2021-08-17 16:26:35'),
	(29, 42, 15, 1, 60000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:27:42', '2021-08-23 14:33:28'),
	(30, 50, 15, 1, 80000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:27:42', '2021-08-21 02:12:28'),
	(31, 18, 16, 1, 70000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:28:31', '2021-08-22 05:48:46'),
	(32, 0, 16, 1, 90000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:28:55', '2021-08-17 16:28:55'),
	(33, 20, 17, 1, 70000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:31:56', '2021-08-22 05:48:46'),
	(34, 20, 17, 1, 90000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:31:56', '2021-08-21 01:16:48'),
	(35, 0, 18, 1, 90000, 1, NULL, NULL, NULL, 0, NULL, NULL, 2, 2, '2021-08-17 16:33:14', '2021-08-17 16:35:20'),
	(36, 0, 18, 1, 110000, 2, NULL, NULL, NULL, 0, NULL, NULL, 2, 2, '2021-08-17 16:33:14', '2021-08-17 16:35:25'),
	(37, 0, 19, 1, 110000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:34:38', '2021-08-21 01:13:26'),
	(38, 0, 19, 1, 130000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:35:00', '2021-08-17 16:35:00'),
	(39, 1, 20, 1, 150000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:38:06', '2021-08-20 14:21:21'),
	(40, 0, 20, 1, 170000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:38:06', '2021-08-17 16:38:06'),
	(41, 1, 21, 1, 250000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:38:56', '2021-08-20 14:21:21'),
	(42, 0, 21, 1, 270000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:39:26', '2021-08-17 16:39:26'),
	(43, 11, 22, 1, 60000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:40:59', '2021-08-20 14:21:21'),
	(44, 0, 22, 1, 80000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:40:59', '2021-08-17 16:40:59'),
	(45, 2, 23, 1, 60000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:41:45', '2021-08-21 03:44:28'),
	(46, 0, 23, 1, 80000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:41:45', '2021-08-17 16:41:45'),
	(47, 2, 24, 1, 70000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:42:29', '2021-08-21 11:50:34'),
	(48, 0, 24, 1, 90000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:42:29', '2021-08-17 16:42:29'),
	(49, 2, 25, 1, 50000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:43:34', '2021-08-20 14:13:54'),
	(50, 0, 25, 1, 70000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:43:34', '2021-08-17 16:43:34'),
	(51, 6, 26, 1, 40000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:44:28', '2021-08-21 23:32:26'),
	(52, 0, 26, 1, 60000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:44:28', '2021-08-17 16:44:28'),
	(53, 7, 27, 1, 40000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:45:22', '2021-08-20 14:21:22'),
	(54, 0, 27, 1, 60000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:45:22', '2021-08-17 16:45:22'),
	(55, 0, 28, 1, 40000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:46:01', '2021-08-17 16:46:01'),
	(56, 0, 28, 1, 60000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:46:01', '2021-08-17 16:46:01'),
	(57, 3, 29, 1, 50000, 1, NULL, NULL, NULL, 0, NULL, NULL, 2, 2, '2021-08-17 16:47:45', '2021-08-21 23:32:26'),
	(58, 0, 29, 1, 80000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:47:46', '2021-08-17 16:47:46'),
	(59, 0, 30, 1, 50000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:48:18', '2021-08-17 16:48:18'),
	(60, 0, 30, 1, 70000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:48:18', '2021-08-17 16:48:18'),
	(61, 3, 31, 1, 40000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:49:34', '2021-08-20 14:13:52'),
	(62, 0, 31, 1, 60000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:49:34', '2021-08-17 16:49:34'),
	(63, 0, 32, 1, 40000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:50:13', '2021-08-17 16:50:13'),
	(64, 0, 32, 1, 60000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:50:13', '2021-08-17 16:50:13'),
	(65, 3, 33, 1, 40000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:50:45', '2021-08-20 14:13:52'),
	(66, 0, 33, 1, 60000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:50:45', '2021-08-17 16:50:45'),
	(67, 0, 34, 1, 30000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:52:02', '2021-08-17 16:52:02'),
	(68, 0, 34, 1, 50000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:52:02', '2021-08-17 16:52:02'),
	(69, 6, 35, 1, 30000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:52:34', '2021-08-20 14:21:22'),
	(70, 0, 35, 1, 50000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:52:34', '2021-08-17 16:52:34'),
	(71, 0, 36, 1, 30000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:53:14', '2021-08-17 16:53:14'),
	(72, 0, 36, 1, 50000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:53:14', '2021-08-17 16:53:14'),
	(73, 0, 37, 1, 5000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-19 16:10:47', '2021-08-19 16:10:47'),
	(74, 0, 38, 1, 5000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-19 16:11:51', '2021-08-19 16:11:51'),
	(75, 0, 39, 1, 5000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-19 16:12:35', '2021-08-19 16:12:35'),
	(78, 1, 41, 1, 300000, 1, NULL, NULL, NULL, 0, NULL, NULL, 2, 2, '2021-08-20 12:49:47', '2021-08-20 14:13:53'),
	(79, 19, 42, 1, 50000, 1, NULL, NULL, NULL, 0, NULL, NULL, 5, 2, '2021-08-20 12:55:19', '2021-08-21 03:03:26'),
	(80, 20, 42, 1, 70000, 2, NULL, NULL, NULL, 0, NULL, NULL, 5, 2, '2021-08-20 12:55:19', '2021-08-21 03:00:41'),
	(81, 19, 43, 1, 90000, 1, NULL, NULL, NULL, 0, NULL, NULL, 5, 2, '2021-08-20 13:05:43', '2021-08-23 14:32:09'),
	(82, 20, 43, 1, 110000, 2, NULL, NULL, NULL, 0, NULL, NULL, 5, 2, '2021-08-20 13:05:43', '2021-08-22 02:39:41'),
	(83, 0, 44, 1, 30000, 2, NULL, NULL, NULL, 0, NULL, NULL, 5, 2, '2021-08-20 13:14:05', '2021-08-21 02:05:42'),
	(84, 20, 44, 1, 30000, 1, NULL, NULL, NULL, 0, NULL, NULL, 5, 2, '2021-08-20 13:14:05', '2021-08-23 14:37:53'),
	(85, 3, 45, 1, 30000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 13:15:19', '2021-08-20 14:13:52'),
	(86, 0, 46, 1, 150000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 13:42:15', '2021-08-20 13:42:15'),
	(87, 0, 46, 1, 130000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 13:42:15', '2021-08-20 13:42:15'),
	(88, 2, 47, 1, 250000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 13:49:34', '2021-08-20 14:21:21'),
	(89, 0, 47, 1, 270000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 13:49:48', '2021-08-20 13:49:48'),
	(90, 1, 49, 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(91, 2, 50, 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(92, 7, 51, 1, 70000, 1, NULL, NULL, NULL, 0, NULL, NULL, 5, 2, '2021-08-20 14:21:21', '2021-08-22 04:14:27'),
	(93, 1, 53, 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(94, 1, 55, 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(95, 1, 56, 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(96, 2, 54, 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(97, 0, 57, 1, 5000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-20 17:27:41', '2021-08-20 17:27:41'),
	(98, 0, 58, 1, 5000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-20 17:28:35', '2021-08-20 17:28:35'),
	(99, 0, 59, 1, 5000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-20 17:29:39', '2021-08-20 17:29:39'),
	(100, 0, 60, 1, 5000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-20 17:30:48', '2021-08-20 17:30:48'),
	(101, 0, 61, 1, 5000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-20 17:33:46', '2021-08-20 17:33:46'),
	(102, 42, 62, 1, 5000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 01:03:19', '2021-08-23 15:41:53'),
	(103, 20, 62, 1, 5000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 01:03:19', '2021-08-21 01:04:39'),
	(104, 22, 63, 1, 250000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 01:22:43', '2021-08-23 14:30:33'),
	(105, 18, 63, 1, 270000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 01:22:43', '2021-08-21 22:52:21'),
	(106, 50, 41, 1, 0, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 01:29:11', '2021-08-21 01:29:11'),
	(107, 46, 64, 1, 30000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 01:35:00', '2021-08-22 05:45:55'),
	(108, 50, 64, 1, 50000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 01:35:00', '2021-08-21 01:36:15'),
	(109, 0, 65, 1, 5000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 01:35:34', '2021-08-21 01:35:34'),
	(110, 0, 66, 1, 30000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 02:03:55', '2021-08-21 02:03:55'),
	(111, 0, 66, 1, 30000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 02:03:55', '2021-08-21 02:03:55'),
	(112, 48, 67, 1, 5000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 02:09:47', '2021-08-21 03:17:53'),
	(114, 0, 69, 1, 10000, 4, NULL, NULL, NULL, 0, NULL, NULL, 5, 5, '2021-08-21 02:44:36', '2021-08-21 02:45:04'),
	(115, 5, 70, 1, 5000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 02:57:20', '2021-08-23 14:33:05'),
	(116, 49, 71, 1, 200000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 03:40:23', '2021-08-21 03:43:39'),
	(117, 0, 71, 1, 220000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 03:40:23', '2021-08-21 03:40:23'),
	(118, 0, 72, 1, 20000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 03:41:11', '2021-08-21 03:41:11'),
	(119, 0, 51, 1, 90000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 03:55:36', '2021-08-21 03:55:36'),
	(120, 30, 73, 1, 40000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 04:23:47', '2021-08-21 11:49:12'),
	(121, 0, 74, 1, 5000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-21 04:24:33', '2021-08-21 04:24:33'),
	(122, 0, 75, 1, 10000, 4, NULL, NULL, NULL, 0, NULL, NULL, 5, 5, '2021-08-22 00:18:41', '2021-08-22 00:40:49'),
	(123, 0, 76, 1, 20000, 5, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-22 00:20:21', '2021-08-22 00:20:21'),
	(124, 0, 77, 1, 60000, 5, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-22 00:21:14', '2021-08-22 00:21:14'),
	(125, 0, 78, 1, 70000, 5, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-22 00:21:47', '2021-08-22 00:21:47'),
	(126, 0, 79, 1, 80000, 5, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-22 00:22:17', '2021-08-22 00:22:17'),
	(127, 0, 80, 1, 90000, 5, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-22 00:22:58', '2021-08-22 00:22:58'),
	(128, 0, 81, 1, 140000, 5, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-22 00:41:42', '2021-08-22 00:41:42'),
	(129, 0, 82, 1, 150000, 5, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-22 00:42:26', '2021-08-22 00:42:26'),
	(130, 0, 84, 1, 5000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-22 02:18:03', '2021-08-22 02:18:03'),
	(131, 0, 85, 1, 3000, 6, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-22 02:19:38', '2021-08-22 02:19:38'),
	(132, 29, 86, 1, 110000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-22 02:34:31', '2021-08-22 02:35:46'),
	(133, 30, 86, 1, 130000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-22 02:34:31', '2021-08-22 02:35:11');
/*!40000 ALTER TABLE `depot_articles` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. destockages
CREATE TABLE IF NOT EXISTS `destockages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `motif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_destockage` date NOT NULL,
  `depot_id` int(10) unsigned NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.destockages : ~0 rows (environ)
/*!40000 ALTER TABLE `destockages` DISABLE KEYS */;
/*!40000 ALTER TABLE `destockages` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. detail_inventaires
CREATE TABLE IF NOT EXISTS `detail_inventaires` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `unite_id` int(10) unsigned NOT NULL,
  `inventaire_id` int(10) unsigned NOT NULL,
  `quantite_denombree` int(10) unsigned NOT NULL,
  `quantite_en_stocke` int(10) unsigned NOT NULL,
  `date_peremption` date DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.detail_inventaires : ~0 rows (environ)
/*!40000 ALTER TABLE `detail_inventaires` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_inventaires` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. divers
CREATE TABLE IF NOT EXISTS `divers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_divers` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.divers : ~0 rows (environ)
/*!40000 ALTER TABLE `divers` DISABLE KEYS */;
/*!40000 ALTER TABLE `divers` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.failed_jobs : ~0 rows (environ)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. fournisseurs
CREATE TABLE IF NOT EXISTS `fournisseurs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `full_name_fournisseur` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_fournisseur` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fournisseur` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_fournisseur` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compte_banque_fournisseur` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compte_contribuable_fournisseur` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `boite_postale_fournisseur` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_fournisseur` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax_fournisseur` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nation_id` int(10) unsigned NOT NULL,
  `banque_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.fournisseurs : ~0 rows (environ)
/*!40000 ALTER TABLE `fournisseurs` DISABLE KEYS */;
INSERT INTO `fournisseurs` (`id`, `full_name_fournisseur`, `code_fournisseur`, `contact_fournisseur`, `email_fournisseur`, `compte_banque_fournisseur`, `compte_contribuable_fournisseur`, `boite_postale_fournisseur`, `adresse_fournisseur`, `fax_fournisseur`, `nation_id`, `banque_id`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Alexnadre', '401ALE1', '(00) 00-00-00-00', NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, '2021-08-20 10:48:25', 2, NULL, 1, '2021-08-19 16:47:44', '2021-08-20 10:48:25');
/*!40000 ALTER TABLE `fournisseurs` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. inventaires
CREATE TABLE IF NOT EXISTS `inventaires` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_inventaire` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_inventaire` date NOT NULL,
  `depot_id` int(10) unsigned NOT NULL,
  `categorie_id` int(10) unsigned DEFAULT NULL,
  `sous_categorie_id` int(10) unsigned DEFAULT NULL,
  `article_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.inventaires : ~0 rows (environ)
/*!40000 ALTER TABLE `inventaires` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventaires` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. localites
CREATE TABLE IF NOT EXISTS `localites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_localite` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.localites : ~0 rows (environ)
/*!40000 ALTER TABLE `localites` DISABLE KEYS */;
/*!40000 ALTER TABLE `localites` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. materiels
CREATE TABLE IF NOT EXISTS `materiels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_materiel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_materiel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prix_achat_materiel` int(10) unsigned DEFAULT NULL,
  `prix_vente_materiel` int(10) unsigned DEFAULT NULL,
  `image_materiel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.materiels : ~0 rows (environ)
/*!40000 ALTER TABLE `materiels` DISABLE KEYS */;
/*!40000 ALTER TABLE `materiels` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. materiel_retournes
CREATE TABLE IF NOT EXISTS `materiel_retournes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `retour_article_id` int(11) NOT NULL,
  `materiel_id` int(11) NOT NULL,
  `quantite_vendue` int(11) NOT NULL DEFAULT '0',
  `quantite` int(11) NOT NULL,
  `prix_unitaire` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.materiel_retournes : ~0 rows (environ)
/*!40000 ALTER TABLE `materiel_retournes` DISABLE KEYS */;
/*!40000 ALTER TABLE `materiel_retournes` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. materiel_vendues
CREATE TABLE IF NOT EXISTS `materiel_vendues` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `materiel_id` int(11) NOT NULL,
  `prix` bigint(20) NOT NULL,
  `quantite` int(11) NOT NULL,
  `vente_materiel_id` int(11) NOT NULL,
  `retourne` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.materiel_vendues : ~0 rows (environ)
/*!40000 ALTER TABLE `materiel_vendues` DISABLE KEYS */;
/*!40000 ALTER TABLE `materiel_vendues` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.migrations : ~72 rows (environ)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(6, '2016_06_01_000004_create_oauth_clients_table', 1),
	(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(8, '2019_08_19_000000_create_failed_jobs_table', 1),
	(9, '2021_01_21_135006_create_nations_table', 1),
	(10, '2021_01_30_085345_create_categories_table', 1),
	(11, '2021_01_30_091039_create_depots_table', 1),
	(12, '2021_01_30_092638_create_fournisseurs_table', 1),
	(13, '2021_01_30_095041_create_clients_table', 1),
	(14, '2021_01_30_102200_create_articles_table', 1),
	(15, '2021_01_30_115509_create_approvisionnements_table', 1),
	(16, '2021_01_30_121349_create_article_approvisionnements_table', 1),
	(17, '2021_01_30_180131_create_ventes_table', 1),
	(18, '2021_01_30_191746_create_article_ventes_table', 1),
	(19, '2021_01_31_085933_create_depot_articles_table', 1),
	(20, '2021_02_01_053205_create_reglements_table', 1),
	(21, '2021_02_01_053731_create_moyen_reglements_table', 1),
	(22, '2021_02_02_113556_create_inventaires_table', 1),
	(23, '2021_02_02_125709_create_detail_inventaires_table', 1),
	(24, '2021_02_06_135832_create_remises_table', 1),
	(25, '2021_02_08_161009_create_casiers_table', 1),
	(26, '2021_02_08_162042_create_rangees_table', 1),
	(27, '2021_02_08_162330_create_rayons_table', 1),
	(28, '2021_02_08_163413_create_unites_table', 1),
	(29, '2021_02_08_180333_create_param_tvas_table', 1),
	(30, '2021_02_08_203316_create_article_fournisseur_table', 1),
	(31, '2021_02_10_070644_create_destockages_table', 1),
	(32, '2021_02_10_100123_create_transfert_stocks_table', 1),
	(33, '2021_02_10_163147_create_bon_commandes_table', 1),
	(34, '2021_02_10_164452_create_article_bons_table', 1),
	(35, '2021_02_11_183432_create_sous_categories_table', 1),
	(36, '2021_02_11_210145_create_regimes_table', 1),
	(37, '2021_02_11_213336_create_banques_table', 1),
	(38, '2021_02_15_094739_create_caisses_table', 1),
	(39, '2021_02_19_105959_create_promotions_table', 1),
	(40, '2021_02_20_084508_create_caisse_ouvertes_table', 1),
	(41, '2021_02_26_175100_create_article_transferts_table', 1),
	(42, '2021_02_26_234139_create_article_destockers_table', 1),
	(43, '2021_03_02_113314_create_divers_table', 1),
	(44, '2021_03_02_164041_create_operations_table', 1),
	(45, '2021_03_03_215621_create_mouvement_stocks_table', 1),
	(46, '2021_03_05_190117_create_billetages_table', 1),
	(47, '2021_03_31_115035_create_configurations_table', 1),
	(48, '2021_04_01_113047_create_retour_articles_table', 1),
	(49, '2021_04_01_113942_create_article_retournes_table', 1),
	(50, '2021_05_06_112753_create_tailles_table', 1),
	(51, '2021_05_18_102954_create_type_abonnements_table', 1),
	(52, '2021_05_18_111056_create_option_canals_table', 1),
	(53, '2021_05_18_173452_create_type_cautions_table', 1),
	(54, '2021_05_18_183258_create_materiels_table', 1),
	(55, '2021_05_18_194527_create_agences_table', 1),
	(56, '2021_05_18_200640_create_localites_table', 1),
	(57, '2021_05_19_134148_create_demande_approvi_canals_table', 1),
	(58, '2021_05_19_180257_create_rebis_table', 1),
	(59, '2021_05_20_133921_create_caution_agences_table', 1),
	(60, '2021_05_22_130915_create_abonnes_table', 1),
	(61, '2021_05_23_082707_create_type_pieces_table', 1),
	(62, '2021_05_25_083454_create_abonnements_table', 1),
	(63, '2021_05_26_110122_create_abonnement_option_canal_table', 1),
	(64, '2021_05_26_160110_create_reabonnements_table', 1),
	(65, '2021_05_26_181522_create_option_canal_reabonnement_table', 1),
	(66, '2021_06_17_161821_create_depenses_table', 1),
	(67, '2021_06_17_164013_create_categorie_depenses_table', 1),
	(68, '2021_06_19_135722_create_tva_declarees_table', 1),
	(69, '2021_06_19_162940_create_ticket_in_tvas_table', 1),
	(70, '2021_06_24_171818_create_vente_materiels_table', 1),
	(71, '2021_06_24_184502_create_materiel_vendues_table', 1),
	(72, '2021_06_30_184247_create_materiel_retournes_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. mouvement_stocks
CREATE TABLE IF NOT EXISTS `mouvement_stocks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_mouvement` date NOT NULL,
  `date_peremption` date DEFAULT NULL,
  `article_id` int(10) unsigned NOT NULL,
  `depot_id` int(10) unsigned NOT NULL,
  `unite_id` int(10) unsigned NOT NULL,
  `quantite_initiale` int(10) unsigned NOT NULL DEFAULT '0',
  `quantite_approvisionnee` int(10) unsigned NOT NULL DEFAULT '0',
  `quantite_vendue` int(10) unsigned NOT NULL DEFAULT '0',
  `quantite_destocker` int(10) unsigned NOT NULL DEFAULT '0',
  `quantite_transferee` int(10) unsigned NOT NULL DEFAULT '0',
  `quantite_retoutnee` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.mouvement_stocks : ~86 rows (environ)
/*!40000 ALTER TABLE `mouvement_stocks` DISABLE KEYS */;
INSERT INTO `mouvement_stocks` (`id`, `date_mouvement`, `date_peremption`, `article_id`, `depot_id`, `unite_id`, `quantite_initiale`, `quantite_approvisionnee`, `quantite_vendue`, `quantite_destocker`, `quantite_transferee`, `quantite_retoutnee`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, '2021-08-20', NULL, 31, 1, 1, 0, 3, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:13:52'),
	(2, '2021-08-20', NULL, 33, 1, 1, 0, 3, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:13:52'),
	(3, '2021-08-20', NULL, 44, 1, 1, 0, 2, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:13:52'),
	(4, '2021-08-20', NULL, 45, 1, 1, 0, 3, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:13:52'),
	(5, '2021-08-20', NULL, 27, 1, 1, 0, 7, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:21:22'),
	(6, '2021-08-20', NULL, 26, 1, 1, 0, 5, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:21:22'),
	(7, '2021-08-20', NULL, 1, 1, 1, 0, 3, 1, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 17:44:35'),
	(8, '2021-08-20', NULL, 8, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:13:52'),
	(9, '2021-08-20', NULL, 19, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:13:52'),
	(10, '2021-08-20', NULL, 12, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(11, '2021-08-20', NULL, 41, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(12, '2021-08-20', NULL, 5, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(13, '2021-08-20', NULL, 42, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(14, '2021-08-20', NULL, 11, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(15, '2021-08-20', NULL, 6, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(16, '2021-08-20', NULL, 3, 1, 1, 0, 6, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(17, '2021-08-20', NULL, 2, 1, 1, 67, 6, 4, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 23:34:49'),
	(18, '2021-08-20', NULL, 4, 1, 1, 0, 3, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(19, '2021-08-20', NULL, 7, 1, 1, 0, 2, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
	(20, '2021-08-20', NULL, 15, 1, 1, 0, 3, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(21, '2021-08-20', NULL, 23, 1, 1, 0, 3, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(22, '2021-08-20', NULL, 16, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(23, '2021-08-20', NULL, 17, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(24, '2021-08-20', NULL, 14, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(25, '2021-08-20', NULL, 25, 1, 1, 0, 2, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(26, '2021-08-20', NULL, 13, 1, 1, 0, 2, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(27, '2021-08-20', NULL, 43, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(28, '2021-08-20', NULL, 29, 1, 1, 0, 2, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:54', '2021-08-20 14:13:54'),
	(29, '2021-08-20', NULL, 21, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(30, '2021-08-20', NULL, 20, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(31, '2021-08-20', NULL, 47, 1, 1, 0, 2, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(32, '2021-08-20', NULL, 22, 1, 1, 0, 11, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(33, '2021-08-20', NULL, 49, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(34, '2021-08-20', NULL, 50, 1, 1, 0, 2, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(35, '2021-08-20', NULL, 51, 1, 1, 0, 9, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(36, '2021-08-20', NULL, 24, 1, 1, 0, 3, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(37, '2021-08-20', NULL, 53, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(38, '2021-08-20', NULL, 55, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(39, '2021-08-20', NULL, 56, 1, 1, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(40, '2021-08-20', NULL, 35, 1, 1, 0, 6, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(41, '2021-08-20', NULL, 54, 1, 1, 0, 2, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(42, '2021-08-21', NULL, 3, 1, 1, 6, 70, 51, 0, 0, 18, NULL, NULL, NULL, 7, '2021-08-21 00:07:45', '2021-08-23 15:53:48'),
	(43, '2021-08-21', NULL, 2, 1, 1, 69, 20, 45, 0, 0, 18, NULL, NULL, NULL, 5, '2021-08-21 00:50:57', '2021-08-21 23:01:38'),
	(44, '2021-08-21', NULL, 4, 1, 1, 3, 56, 17, 0, 0, 7, NULL, NULL, NULL, 7, '2021-08-21 00:53:06', '2021-08-21 23:32:26'),
	(45, '2021-08-21', NULL, 62, 1, 1, 0, 20, 17, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 01:04:39', '2021-08-21 23:48:56'),
	(46, '2021-08-21', NULL, 62, 1, 2, 0, 20, 0, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 01:04:39', '2021-08-21 01:04:39'),
	(47, '2021-08-21', NULL, 15, 1, 1, 3, 55, 11, 0, 0, 2, NULL, NULL, NULL, 7, '2021-08-21 01:06:37', '2021-08-21 23:32:26'),
	(48, '2021-08-21', NULL, 5, 1, 1, 1, 20, 7, 0, 0, 3, NULL, NULL, NULL, 7, '2021-08-21 01:10:01', '2021-08-21 12:18:57'),
	(49, '2021-08-21', NULL, 5, 1, 2, 0, 20, 0, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 01:12:06', '2021-08-21 01:12:06'),
	(50, '2021-08-21', NULL, 19, 1, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 01:13:26', '2021-08-21 01:13:26'),
	(51, '2021-08-21', NULL, 17, 1, 1, 1, 32, 8, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 01:16:48', '2021-08-21 23:32:26'),
	(52, '2021-08-21', NULL, 17, 1, 2, 0, 20, 0, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 01:16:48', '2021-08-21 01:16:48'),
	(53, '2021-08-21', NULL, 11, 1, 1, 1, 50, 11, 0, 0, 4, NULL, NULL, NULL, 7, '2021-08-21 01:20:58', '2021-08-21 12:27:08'),
	(54, '2021-08-21', NULL, 63, 1, 1, 0, 30, 12, 0, 0, 4, NULL, NULL, NULL, 5, '2021-08-21 01:23:21', '2021-08-21 23:32:26'),
	(55, '2021-08-21', NULL, 63, 1, 2, 0, 20, 2, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 01:23:21', '2021-08-21 22:52:21'),
	(56, '2021-08-21', NULL, 3, 1, 2, 0, 50, 0, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 01:27:08', '2021-08-21 01:27:08'),
	(57, '2021-08-21', NULL, 41, 1, 2, 0, 50, 0, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 01:29:11', '2021-08-21 01:29:11'),
	(58, '2021-08-21', NULL, 64, 1, 1, 0, 50, 2, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 01:36:15', '2021-08-21 03:19:49'),
	(59, '2021-08-21', NULL, 64, 1, 2, 0, 50, 0, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 01:36:15', '2021-08-21 01:36:15'),
	(60, '2021-08-21', NULL, 7, 1, 1, 2, 20, 6, 0, 0, 3, NULL, NULL, NULL, 5, '2021-08-21 01:39:10', '2021-08-21 22:54:49'),
	(61, '2021-08-21', NULL, 7, 1, 2, 0, 20, 0, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 01:39:10', '2021-08-21 01:39:10'),
	(62, '2021-08-21', NULL, 4, 1, 2, 0, 50, 0, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 01:52:10', '2021-08-21 01:52:10'),
	(63, '2021-08-21', NULL, 1, 1, 1, 2, 0, 2, 0, 0, 2, NULL, NULL, NULL, 7, '2021-08-21 01:56:44', '2021-08-21 11:24:23'),
	(64, '2021-08-21', NULL, 44, 1, 1, 2, 23, 4, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 02:04:29', '2021-08-21 23:32:26'),
	(65, '2021-08-21', NULL, 67, 1, 1, 0, 50, 2, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 02:10:12', '2021-08-21 03:17:53'),
	(66, '2021-08-21', NULL, 15, 1, 2, 0, 50, 0, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 02:12:28', '2021-08-21 02:12:28'),
	(67, '2021-08-21', NULL, 42, 1, 1, 1, 20, 2, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 02:15:43', '2021-08-21 03:03:26'),
	(68, '2021-08-21', NULL, 42, 1, 2, 0, 20, 0, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 02:15:43', '2021-08-21 02:15:43'),
	(69, '2021-08-21', NULL, 24, 1, 1, 3, 0, 2, 0, 0, 1, NULL, NULL, NULL, 7, '2021-08-21 02:41:02', '2021-08-21 11:50:34'),
	(70, '2021-08-21', NULL, 70, 1, 1, 0, 20, 4, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 02:58:33', '2021-08-21 04:13:58'),
	(71, '2021-08-21', NULL, 13, 1, 1, 2, 2, 2, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:26:46', '2021-08-21 23:32:26'),
	(72, '2021-08-21', NULL, 71, 1, 1, 0, 50, 1, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 03:43:00', '2021-08-21 03:43:39'),
	(73, '2021-08-21', NULL, 23, 1, 1, 3, 0, 1, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:44:28', '2021-08-21 03:44:28'),
	(74, '2021-08-21', NULL, 51, 1, 1, 9, 0, 1, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 03:56:38', '2021-08-21 03:56:38'),
	(75, '2021-08-21', NULL, 16, 1, 1, 1, 20, 2, 0, 0, 1, NULL, NULL, NULL, 7, '2021-08-21 04:08:08', '2021-08-21 11:30:48'),
	(76, '2021-08-21', NULL, 73, 1, 1, 0, 30, 1, 0, 0, 1, NULL, NULL, NULL, 5, '2021-08-21 04:25:07', '2021-08-21 11:49:12'),
	(77, '2021-08-21', NULL, 29, 1, 1, 2, 1, 0, 0, 0, 0, NULL, NULL, NULL, 18, '2021-08-21 23:32:26', '2021-08-21 23:32:26'),
	(78, '2021-08-21', NULL, 26, 1, 1, 5, 1, 0, 0, 0, 0, NULL, NULL, NULL, 18, '2021-08-21 23:32:26', '2021-08-21 23:32:26'),
	(79, '2021-08-22', NULL, 16, 1, 1, 20, 0, 2, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:20:44', '2021-08-22 05:48:46'),
	(80, '2021-08-22', NULL, 15, 1, 1, 49, 0, 12, 0, 0, 5, NULL, NULL, NULL, 7, '2021-08-22 00:22:48', '2021-08-23 14:33:28'),
	(81, '2021-08-22', NULL, 5, 1, 1, 17, 0, 3, 0, 0, 2, NULL, NULL, NULL, 7, '2021-08-22 00:26:27', '2021-08-23 14:32:33'),
	(82, '2021-08-22', NULL, 2, 1, 1, 62, 50, 64, 0, 0, 17, NULL, NULL, NULL, 7, '2021-08-22 00:27:26', '2021-08-23 15:27:20'),
	(83, '2021-08-22', NULL, 63, 1, 1, 22, 0, 2, 0, 0, 2, NULL, NULL, NULL, 7, '2021-08-22 00:30:06', '2021-08-23 14:30:33'),
	(84, '2021-08-22', NULL, 3, 1, 1, 42, 20, 13, 0, 0, 6, NULL, NULL, NULL, 7, '2021-08-22 00:39:04', '2021-08-23 14:38:42'),
	(85, '2021-08-22', NULL, 62, 1, 1, 3, 50, 11, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:59:04', '2021-08-23 15:41:53'),
	(86, '2021-08-22', NULL, 11, 1, 1, 44, 0, 9, 0, 0, 3, NULL, NULL, NULL, 7, '2021-08-22 01:01:09', '2021-08-23 15:23:42'),
	(87, '2021-08-22', NULL, 1, 1, 1, 2, 50, 5, 0, 0, 3, NULL, NULL, NULL, 7, '2021-08-22 01:03:49', '2021-08-23 14:20:36'),
	(88, '2021-08-22', NULL, 64, 1, 1, 48, 0, 2, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:15:36', '2021-08-22 05:45:55'),
	(89, '2021-08-22', NULL, 4, 1, 1, 49, 0, 7, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:24:59', '2021-08-22 05:46:42'),
	(90, '2021-08-22', NULL, 17, 1, 1, 25, 0, 5, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:28:19', '2021-08-22 05:48:47'),
	(91, '2021-08-22', NULL, 44, 1, 1, 21, 0, 4, 0, 0, 3, NULL, NULL, NULL, 7, '2021-08-22 01:34:50', '2021-08-23 14:37:53'),
	(92, '2021-08-22', NULL, 7, 1, 1, 19, 0, 6, 0, 0, 3, NULL, NULL, NULL, 7, '2021-08-22 02:02:02', '2021-08-23 16:37:03'),
	(93, '2021-08-22', NULL, 70, 1, 1, 16, 0, 14, 0, 0, 3, NULL, NULL, NULL, 7, '2021-08-22 02:22:31', '2021-08-23 14:33:05'),
	(94, '2021-08-22', NULL, 86, 1, 1, 0, 30, 1, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-22 02:35:11', '2021-08-22 02:35:46'),
	(95, '2021-08-22', NULL, 86, 1, 2, 0, 30, 0, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-22 02:35:11', '2021-08-22 02:35:11'),
	(96, '2021-08-22', NULL, 43, 1, 1, 1, 20, 4, 0, 0, 2, NULL, NULL, NULL, 5, '2021-08-22 02:39:41', '2021-08-23 14:32:09'),
	(97, '2021-08-22', NULL, 43, 1, 2, 0, 20, 0, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-22 02:39:41', '2021-08-22 02:39:41'),
	(98, '2021-08-22', NULL, 8, 1, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:56:27', '2021-08-22 02:58:35'),
	(99, '2021-08-22', NULL, 51, 1, 1, 8, 0, 1, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:14:27', '2021-08-22 04:14:27'),
	(100, '2021-08-23', NULL, 3, 1, 1, 50, 0, 0, 0, 0, 1, NULL, NULL, NULL, 16, '2021-08-23 14:28:49', '2021-08-23 14:28:49');
/*!40000 ALTER TABLE `mouvement_stocks` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. moyen_reglements
CREATE TABLE IF NOT EXISTS `moyen_reglements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_moyen_reglement` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.moyen_reglements : ~3 rows (environ)
/*!40000 ALTER TABLE `moyen_reglements` DISABLE KEYS */;
INSERT INTO `moyen_reglements` (`id`, `libelle_moyen_reglement`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'ESPECE', NULL, NULL, 5, 2, '2021-08-17 15:49:08', '2021-08-21 22:27:22'),
	(2, 'CHEQUE', NULL, NULL, 5, 2, '2021-08-17 15:49:45', '2021-08-21 22:27:17'),
	(3, 'TPE', NULL, NULL, 5, 2, '2021-08-17 15:49:48', '2021-08-21 22:27:27');
/*!40000 ALTER TABLE `moyen_reglements` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. nations
CREATE TABLE IF NOT EXISTS `nations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_nation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.nations : ~253 rows (environ)
/*!40000 ALTER TABLE `nations` DISABLE KEYS */;
INSERT INTO `nations` (`id`, `libelle_nation`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Afghanistan', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(2, 'Afrique du Sud', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(3, 'Albanie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(4, 'Algérie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(5, 'Allemagne', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(6, 'Andorre', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(7, 'Angola', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(8, 'Anguilla', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(9, 'Antarctique', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(10, 'Antigua-et-Barbuda', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(11, 'Antilles néerlandaises', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(12, 'Arabie saoudite', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(13, 'Argentine', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(14, 'Arménie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(15, 'Aruba', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(16, 'Australie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(17, 'Autriche', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(18, 'Azerbaïdjan', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(19, 'Bahamas', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(20, 'Bahreïn', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(21, 'Bangladesh', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(22, 'Barbade', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(23, 'Bélarus', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(24, 'Belgique', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(25, 'Belize', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(26, 'Bénin', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(27, 'Bermudes', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(28, 'Bhoutan', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(29, 'Bolivie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(30, 'Bosnie-Herzégovine', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(31, 'Botswana', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(32, 'Brésil', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(33, 'Brunéi Darussalam', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(34, 'Bulgarie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(35, 'Burkina Faso', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(36, 'Burundi', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(37, 'Cambodge', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(38, 'Cameroun', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(39, 'Canada', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(40, 'Cap-Vert', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(41, 'Ceuta et Melilla', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(42, 'Chili', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(43, 'Chine', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(44, 'Chypre', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(45, 'Colombie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(46, 'Comores', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(47, 'Congo-Brazzaville', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(48, 'Corée du Nord', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(49, 'Corée du Sud', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(50, 'Costa Rica', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(51, 'Côte d’Ivoire', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(52, 'Croatie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(53, 'Cuba', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(54, 'Danemark', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(55, 'Diego Garcia', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(56, 'Djibouti', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(57, 'Dominique', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(58, 'Égypte', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(59, 'El Salvador', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(60, 'Émirats arabes unis', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(61, 'Équateur', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(62, 'Érythrée', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(63, 'Espagne', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(64, 'Estonie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(65, 'État de la Cité du Vatican', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(66, 'États fédérés de Micronésie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(67, 'États Unis d\'Amerique', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(68, 'Éthiopie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(69, 'Fidji', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(70, 'Finlande', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(71, 'France', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(72, 'Gabon', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(73, 'Gambie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(74, 'Géorgie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(75, 'Géorgie du Sud et les îles Sandwich du Sud', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(76, 'Ghana', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(77, 'Gibraltar', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(78, 'Grèce', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(79, 'Grenade', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(80, 'Groenland', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(81, 'Guadeloupe', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(82, 'Guam', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(83, 'Guatemala', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(84, 'Guernesey', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(85, 'Guinée', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(86, 'Guinée équatoriale', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(87, 'Guinée-Bissau', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(88, 'Guyana', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(89, 'Guyane française', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(90, 'Haïti', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(91, 'Honduras', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(92, 'Hongrie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(93, 'Île Bouvet', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(94, 'Île Christmas', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(95, 'Île Clipperton', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(96, 'Île de l\'Ascension', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(97, 'Île de Man', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(98, 'Île Norfolk', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(99, 'Îles Åland', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(100, 'Îles Caïmans', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(101, 'Îles Canaries', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(102, 'Îles Cocos - Keeling', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(103, 'Îles Cook', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(104, 'Îles Féroé', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(105, 'Îles Heard et MacDonald', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(106, 'Îles Malouines', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(107, 'Îles Mariannes du Nord', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(108, 'Îles Marshall', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(109, 'Îles Mineures Éloignées des États-Unis', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(110, 'Îles Salomon', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(111, 'Îles Turks et Caïques', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(112, 'Îles Vierges britanniques', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(113, 'Îles Vierges des États-Unis', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(114, 'Inde', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(115, 'Indonésie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(116, 'Irak', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(117, 'Iran', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(118, 'Irlande', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(119, 'Islande', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(120, 'Israël', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(121, 'Italie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(122, 'Jamaïque', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(123, 'Japon', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(124, 'Jersey', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(125, 'Jordanie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(126, 'Kazakhstan', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(127, 'Kenya', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(128, 'Kirghizistan', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(129, 'Kiribati', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(130, 'Koweït', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(131, 'Laos', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(132, 'Lesotho', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(133, 'Lettonie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(134, 'Liban', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(135, 'Libéria', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(136, 'Libye', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(137, 'Liechtenstein', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(138, 'Lituanie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(139, 'Luxembourg', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(140, 'Macédoine', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(141, 'Madagascar', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(142, 'Malaisie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(143, 'Malawi', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(144, 'Maldives', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(145, 'Mali', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(146, 'Malte', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(147, 'Maroc', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(148, 'Martinique', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(149, 'Maurice', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(150, 'Mauritanie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(151, 'Mayotte', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(152, 'Mexique', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(153, 'Moldavie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(154, 'Monaco', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(155, 'Mongolie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(156, 'Monténégro', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(157, 'Montserrat', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(158, 'Mozambique', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(159, 'Myanmar', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(160, 'Namibie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(161, 'Nauru', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(162, 'Népal', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(163, 'Nicaragua', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(164, 'Niger', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(165, 'Nigéria', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(166, 'Niue', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(167, 'Norvège', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(168, 'Nouvelle-Calédonie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(169, 'Nouvelle-Zélande', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(170, 'Oman', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(171, 'Ouganda', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(172, 'Ouzbékistan', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(173, 'Pakistan', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(174, 'Palaos', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(175, 'Panama', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(176, 'Papouasie-Nouvelle-Guinée', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(177, 'Paraguay', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(178, 'Pays-Bas', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(179, 'Pérou', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(180, 'Philippines', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(181, 'Pitcairn', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(182, 'Pologne', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(183, 'Polynésie française', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(184, 'Porto Rico', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(185, 'Portugal', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(186, 'Qatar', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(187, 'Hong Kong', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(188, 'Macao', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(189, 'République centrafricaine', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(190, 'République démocratique du Congo', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(191, 'République dominicaine', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(192, 'République tchèque', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(193, 'Réunion', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(194, 'Roumanie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(195, 'Royaume-Uni', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(196, 'Russie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(197, 'Rwanda', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(198, 'Sahara occidental', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(199, 'Saint-Barthélémy', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(200, 'Saint-Kitts-et-Nevis', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(201, 'Saint-Marin', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(202, 'Saint-Martin', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(203, 'Saint-Pierre-et-Miquelon', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(204, 'Saint-Vincent-et-les Grenadines', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(205, 'Sainte-Hélène', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(206, 'Sainte-Lucie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(207, 'Samoa', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(208, 'Samoa américaines', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(209, 'Sao Tomé-et-Principe', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(210, 'Sénégal', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(211, 'Serbie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(212, 'Serbie-et-Monténégro', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(213, 'Seychelles', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(214, 'Sierra Leone', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(215, 'Singapour', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(216, 'Slovaquie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(217, 'Slovénie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(218, 'Somalie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(219, 'Soudan', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(220, 'Sri Lanka', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(221, 'Suède', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(222, 'Suisse', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(223, 'Suriname', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(224, 'Svalbard et Île Jan Mayen', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(225, 'Swaziland', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(226, 'Syrie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(227, 'Tadjikistan', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(228, 'Taïwan', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(229, 'Tanzanie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(230, 'Tchad', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(231, 'Terres australes françaises', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(232, 'Territoire britannique de l\'océan Indien', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(233, 'Palestine', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(234, 'Thaïlande', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(235, 'Timor oriental', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(236, 'Togo', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(237, 'Tokelau', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(238, 'Tonga', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(239, 'Trinité-et-Tobago', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(240, 'Tristan da Cunha', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(241, 'Tunisie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(242, 'Turkménistan', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(243, 'Turquie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(244, 'Tuvalu', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(245, 'Ukraine', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(246, 'Uruguay', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(247, 'Vanuatu', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(248, 'Venezuela', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(249, 'Viêt Nam', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(250, 'Wallis-et-Futuna', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(251, 'Yémen', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(252, 'Zambie', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL),
	(253, 'Zimbabwe', NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', NULL);
/*!40000 ALTER TABLE `nations` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.oauth_access_tokens : ~0 rows (environ)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.oauth_auth_codes : ~0 rows (environ)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.oauth_clients : ~0 rows (environ)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.oauth_personal_access_clients : ~0 rows (environ)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.oauth_refresh_tokens : ~0 rows (environ)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. operations
CREATE TABLE IF NOT EXISTS `operations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `objet_operation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant_operation` bigint(20) unsigned NOT NULL,
  `caisse_ouverte_id` int(10) unsigned NOT NULL,
  `date_operation` datetime NOT NULL,
  `type_operation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `concerne` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vente_id` int(11) DEFAULT NULL,
  `bon_commande_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.operations : ~0 rows (environ)
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. option_canals
CREATE TABLE IF NOT EXISTS `option_canals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_option` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix_option` int(10) unsigned NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.option_canals : ~0 rows (environ)
/*!40000 ALTER TABLE `option_canals` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_canals` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. option_canal_reabonnement
CREATE TABLE IF NOT EXISTS `option_canal_reabonnement` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_canal_id` bigint(20) unsigned NOT NULL,
  `reabonnement_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `option_canal_reabonnement_option_canal_id_foreign` (`option_canal_id`),
  KEY `option_canal_reabonnement_reabonnement_id_foreign` (`reabonnement_id`),
  CONSTRAINT `option_canal_reabonnement_option_canal_id_foreign` FOREIGN KEY (`option_canal_id`) REFERENCES `option_canals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `option_canal_reabonnement_reabonnement_id_foreign` FOREIGN KEY (`reabonnement_id`) REFERENCES `reabonnements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.option_canal_reabonnement : ~0 rows (environ)
/*!40000 ALTER TABLE `option_canal_reabonnement` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_canal_reabonnement` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. param_tvas
CREATE TABLE IF NOT EXISTS `param_tvas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `montant_tva` double(8,2) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.param_tvas : ~0 rows (environ)
/*!40000 ALTER TABLE `param_tvas` DISABLE KEYS */;
INSERT INTO `param_tvas` (`id`, `montant_tva`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 0.18, NULL, NULL, NULL, 2, '2021-08-17 15:48:23', '2021-08-17 15:48:23');
/*!40000 ALTER TABLE `param_tvas` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.password_resets : ~0 rows (environ)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. promotions
CREATE TABLE IF NOT EXISTS `promotions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `article_id` int(10) unsigned NOT NULL,
  `depot_id` int(10) unsigned NOT NULL,
  `unite_id` int(10) unsigned NOT NULL,
  `prix_promotion` int(10) unsigned NOT NULL,
  `en_promotion` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.promotions : ~0 rows (environ)
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. rangees
CREATE TABLE IF NOT EXISTS `rangees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_rangee` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.rangees : ~0 rows (environ)
/*!40000 ALTER TABLE `rangees` DISABLE KEYS */;
/*!40000 ALTER TABLE `rangees` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. rayons
CREATE TABLE IF NOT EXISTS `rayons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_rayon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.rayons : ~0 rows (environ)
/*!40000 ALTER TABLE `rayons` DISABLE KEYS */;
/*!40000 ALTER TABLE `rayons` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. reabonnements
CREATE TABLE IF NOT EXISTS `reabonnements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `abonnement_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_reabonnement` date NOT NULL,
  `duree` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_debut` date NOT NULL,
  `montant_reabonnement` bigint(20) unsigned DEFAULT NULL,
  `type_abonnement_id` int(10) unsigned NOT NULL,
  `agence_id` int(10) unsigned NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.reabonnements : ~0 rows (environ)
/*!40000 ALTER TABLE `reabonnements` DISABLE KEYS */;
/*!40000 ALTER TABLE `reabonnements` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. rebis
CREATE TABLE IF NOT EXISTS `rebis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_operation` date NOT NULL,
  `concerne` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `demande_approvi_canal_id` int(10) unsigned DEFAULT NULL,
  `caution_agence_id` int(10) unsigned DEFAULT NULL,
  `abonnement_id` int(10) unsigned DEFAULT NULL,
  `reabonnement_id` int(10) unsigned DEFAULT NULL,
  `vente_materiel_id` int(10) unsigned DEFAULT NULL,
  `montant_recharge` bigint(20) unsigned NOT NULL DEFAULT '0',
  `montant_recharge_agence` bigint(20) unsigned NOT NULL DEFAULT '0',
  `montant_recharge_client` bigint(20) unsigned NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.rebis : ~0 rows (environ)
/*!40000 ALTER TABLE `rebis` DISABLE KEYS */;
/*!40000 ALTER TABLE `rebis` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. regimes
CREATE TABLE IF NOT EXISTS `regimes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_regime` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.regimes : ~0 rows (environ)
/*!40000 ALTER TABLE `regimes` DISABLE KEYS */;
INSERT INTO `regimes` (`id`, `libelle_regime`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Particulier', NULL, NULL, NULL, 5, '2021-08-21 07:57:42', '2021-08-21 07:57:42');
/*!40000 ALTER TABLE `regimes` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. reglements
CREATE TABLE IF NOT EXISTS `reglements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `montant_reglement` bigint(20) NOT NULL,
  `reste_a_payer` bigint(20) unsigned DEFAULT NULL,
  `moyen_reglement_id` int(11) NOT NULL,
  `date_reglement` date NOT NULL,
  `caisse_ouverte_id` int(10) unsigned DEFAULT NULL,
  `commande_id` int(10) unsigned DEFAULT NULL,
  `vente_id` int(10) unsigned DEFAULT NULL,
  `scan_cheque` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_cheque_virement` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.reglements : ~289 rows (environ)
/*!40000 ALTER TABLE `reglements` DISABLE KEYS */;
INSERT INTO `reglements` (`id`, `montant_reglement`, `reste_a_payer`, `moyen_reglement_id`, `date_reglement`, `caisse_ouverte_id`, `commande_id`, `vente_id`, `scan_cheque`, `numero_cheque_virement`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 120000, NULL, 3, '2021-08-20', 1, NULL, 1, NULL, NULL, '2021-08-20 17:44:35', 5, 5, 8, '2021-08-20 15:16:52', '2021-08-20 17:44:35'),
	(2, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-20 17:44:55', '2021-08-20 17:44:55'),
	(3, 180000, NULL, 1, '2021-08-20', 2, NULL, 3, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-20 23:28:49', '2021-08-20 23:28:49'),
	(4, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-20 23:38:51', '2021-08-20 23:38:51'),
	(5, 50000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 03:21:26', '2021-08-21 03:21:26'),
	(6, 120000, NULL, 1, '2021-08-21', 3, NULL, 140, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-21 04:26:44', '2021-08-21 04:26:44'),
	(7, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 06:44:43', '2021-08-21 06:44:43'),
	(8, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 06:45:40', '2021-08-21 06:45:40'),
	(9, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 06:46:16', '2021-08-21 06:46:16'),
	(10, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 06:48:53', '2021-08-21 06:48:53'),
	(11, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 06:49:17', '2021-08-21 06:49:17'),
	(12, 140000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 06:50:58', '2021-08-21 06:50:58'),
	(13, 10000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 06:51:45', '2021-08-21 06:51:45'),
	(14, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 06:52:29', '2021-08-21 06:52:29'),
	(15, 5000, NULL, 3, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 06:53:35', '2021-08-21 06:53:35'),
	(16, 5000, NULL, 3, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 06:54:01', '2021-08-21 06:54:01'),
	(17, 5000, NULL, 3, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 06:54:28', '2021-08-21 06:54:28'),
	(18, 70000, NULL, 3, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 06:56:03', '2021-08-21 06:56:03'),
	(19, 160000, NULL, 3, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 06:57:24', '2021-08-21 06:57:24'),
	(20, 50000, NULL, 3, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 06:58:26', '2021-08-21 06:58:26'),
	(21, 10000, NULL, 3, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 06:59:28', '2021-08-21 06:59:28'),
	(22, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:00:45', '2021-08-21 07:00:45'),
	(23, 5000, NULL, 3, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:02:10', '2021-08-21 07:02:10'),
	(24, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:03:43', '2021-08-21 07:03:43'),
	(25, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:04:05', '2021-08-21 07:04:05'),
	(26, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:04:57', '2021-08-21 07:04:57'),
	(27, 60000, NULL, 3, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:07:47', '2021-08-21 07:07:47'),
	(28, 150000, NULL, 3, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:09:31', '2021-08-21 07:09:31'),
	(29, 150000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:10:15', '2021-08-21 07:10:15'),
	(30, 140000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:15:11', '2021-08-21 07:15:11'),
	(31, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:15:39', '2021-08-21 07:15:39'),
	(32, 80000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:16:19', '2021-08-21 07:16:19'),
	(33, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:17:11', '2021-08-21 07:17:11'),
	(34, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:17:49', '2021-08-21 07:17:49'),
	(35, 250000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:19:43', '2021-08-21 07:19:43'),
	(36, 120000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:20:48', '2021-08-21 07:20:48'),
	(37, 210000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:21:19', '2021-08-21 07:21:19'),
	(38, 150000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:22:01', '2021-08-21 07:22:01'),
	(39, 150000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:22:35', '2021-08-21 07:22:35'),
	(40, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:24:54', '2021-08-21 07:24:54'),
	(41, 140000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:25:23', '2021-08-21 07:25:23'),
	(42, 120000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:25:56', '2021-08-21 07:25:56'),
	(43, 150000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:26:38', '2021-08-21 07:26:38'),
	(44, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:27:42', '2021-08-21 07:27:42'),
	(45, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:28:36', '2021-08-21 07:28:36'),
	(46, 560000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:29:32', '2021-08-21 07:29:32'),
	(47, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:30:42', '2021-08-21 07:30:42'),
	(48, 150000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:32:16', '2021-08-21 07:32:16'),
	(49, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:33:11', '2021-08-21 07:33:11'),
	(50, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:34:00', '2021-08-21 07:34:00'),
	(51, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:34:29', '2021-08-21 07:34:29'),
	(52, 140000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 07:35:04', '2021-08-21 07:35:04'),
	(53, 120000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:23:39', '2021-08-21 11:23:39'),
	(54, 250000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:25:28', '2021-08-21 11:25:28'),
	(55, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:25:36', '2021-08-21 11:25:36'),
	(56, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:25:47', '2021-08-21 11:25:47'),
	(57, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:26:04', '2021-08-21 11:26:04'),
	(58, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:26:19', '2021-08-21 11:26:19'),
	(59, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:26:37', '2021-08-21 11:26:37'),
	(60, 140000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:26:50', '2021-08-21 11:26:50'),
	(61, 500000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:27:04', '2021-08-21 11:27:04'),
	(62, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:27:19', '2021-08-21 11:27:19'),
	(63, 750000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:27:51', '2021-08-21 11:27:51'),
	(64, 540000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:28:08', '2021-08-21 11:28:08'),
	(65, 250000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:28:18', '2021-08-21 11:28:18'),
	(66, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:28:30', '2021-08-21 11:28:30'),
	(67, 10000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:28:43', '2021-08-21 11:28:43'),
	(68, 180000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:28:57', '2021-08-21 11:28:57'),
	(69, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:29:12', '2021-08-21 11:29:12'),
	(70, 10000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:29:25', '2021-08-21 11:29:25'),
	(71, 10000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:29:38', '2021-08-21 11:29:38'),
	(72, 40000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:29:53', '2021-08-21 11:29:53'),
	(73, 10000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:30:04', '2021-08-21 11:30:04'),
	(74, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:30:14', '2021-08-21 11:30:14'),
	(75, 120000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:32:12', '2021-08-21 11:32:12'),
	(76, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:32:29', '2021-08-21 11:32:29'),
	(77, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:32:55', '2021-08-21 11:32:55'),
	(78, 20000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:33:12', '2021-08-21 11:33:12'),
	(79, 120000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:33:25', '2021-08-21 11:33:25'),
	(80, 10000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:33:39', '2021-08-21 11:33:39'),
	(81, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:33:56', '2021-08-21 11:33:56'),
	(82, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:34:13', '2021-08-21 11:34:13'),
	(83, 10000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:36:14', '2021-08-21 11:36:14'),
	(84, 10000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:36:27', '2021-08-21 11:36:27'),
	(85, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:36:39', '2021-08-21 11:36:39'),
	(86, 200000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:36:53', '2021-08-21 11:36:53'),
	(87, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:37:11', '2021-08-21 11:37:11'),
	(88, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:37:25', '2021-08-21 11:37:25'),
	(89, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:37:41', '2021-08-21 11:37:41'),
	(90, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:38:22', '2021-08-21 11:38:22'),
	(91, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:38:33', '2021-08-21 11:38:33'),
	(92, 40000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:38:45', '2021-08-21 11:38:45'),
	(93, 20000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:39:00', '2021-08-21 11:39:00'),
	(94, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:39:22', '2021-08-21 11:39:22'),
	(95, 30000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:39:42', '2021-08-21 11:39:42'),
	(96, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:40:02', '2021-08-21 11:40:02'),
	(97, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:40:13', '2021-08-21 11:40:13'),
	(98, 10000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:40:26', '2021-08-21 11:40:26'),
	(99, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:40:41', '2021-08-21 11:40:41'),
	(100, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:41:01', '2021-08-21 11:41:01'),
	(101, 10000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:41:26', '2021-08-21 11:41:26'),
	(102, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:41:43', '2021-08-21 11:41:43'),
	(103, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:42:07', '2021-08-21 11:42:07'),
	(104, 10000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:42:18', '2021-08-21 11:42:18'),
	(105, 15000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:42:29', '2021-08-21 11:42:29'),
	(106, 210000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:42:44', '2021-08-21 11:42:44'),
	(107, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:43:04', '2021-08-21 11:43:04'),
	(108, 120000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:43:20', '2021-08-21 11:43:20'),
	(109, 120000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:43:44', '2021-08-21 11:43:44'),
	(110, 120000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:44:09', '2021-08-21 11:44:09'),
	(111, 180000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:44:20', '2021-08-21 11:44:20'),
	(112, 210000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:44:30', '2021-08-21 11:44:30'),
	(113, 360000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:44:40', '2021-08-21 11:44:40'),
	(114, 1050000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:44:54', '2021-08-21 11:44:54'),
	(115, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:45:09', '2021-08-21 11:45:09'),
	(116, 120000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:45:26', '2021-08-21 11:45:26'),
	(117, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:45:41', '2021-08-21 11:45:41'),
	(118, 80000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:46:04', '2021-08-21 11:46:04'),
	(119, 80000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:51:21', '2021-08-21 11:51:21'),
	(120, 80000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:51:35', '2021-08-21 11:51:35'),
	(121, 80000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:51:44', '2021-08-21 11:51:44'),
	(122, 140000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:51:57', '2021-08-21 11:51:57'),
	(123, 320000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:52:13', '2021-08-21 11:52:13'),
	(124, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:52:29', '2021-08-21 11:52:29'),
	(125, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:52:42', '2021-08-21 11:52:42'),
	(126, 30000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:52:52', '2021-08-21 11:52:52'),
	(127, 270000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:53:03', '2021-08-21 11:53:03'),
	(128, 120000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:53:16', '2021-08-21 11:53:16'),
	(129, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:53:37', '2021-08-21 11:53:37'),
	(130, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:54:01', '2021-08-21 11:54:01'),
	(131, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:54:18', '2021-08-21 11:54:18'),
	(132, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:54:33', '2021-08-21 11:54:33'),
	(133, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:54:52', '2021-08-21 11:54:52'),
	(134, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:55:07', '2021-08-21 11:55:07'),
	(135, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:56:11', '2021-08-21 11:56:11'),
	(136, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:56:27', '2021-08-21 11:56:27'),
	(137, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:57:06', '2021-08-21 11:57:06'),
	(138, 10000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 11:59:50', '2021-08-21 11:59:50'),
	(139, 120000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:00:19', '2021-08-21 12:00:19'),
	(140, 240000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:00:32', '2021-08-21 12:00:32'),
	(141, 120000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:00:55', '2021-08-21 12:00:55'),
	(142, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:01:13', '2021-08-21 12:01:13'),
	(143, 15000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:01:37', '2021-08-21 12:01:37'),
	(144, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:02:05', '2021-08-21 12:02:05'),
	(145, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:02:23', '2021-08-21 12:02:23'),
	(146, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:02:44', '2021-08-21 12:02:44'),
	(147, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:03:02', '2021-08-21 12:03:02'),
	(148, 140000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:03:17', '2021-08-21 12:03:17'),
	(149, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:03:30', '2021-08-21 12:03:30'),
	(150, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:08:01', '2021-08-21 12:08:01'),
	(151, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:08:17', '2021-08-21 12:08:17'),
	(152, 120000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:08:30', '2021-08-21 12:08:30'),
	(153, 770000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:08:43', '2021-08-21 12:08:43'),
	(154, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:09:05', '2021-08-21 12:09:05'),
	(155, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:09:19', '2021-08-21 12:09:19'),
	(156, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:09:30', '2021-08-21 12:09:30'),
	(157, 10000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:09:51', '2021-08-21 12:09:51'),
	(158, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:10:06', '2021-08-21 12:10:06'),
	(159, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:10:28', '2021-08-21 12:10:28'),
	(160, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:10:58', '2021-08-21 12:10:58'),
	(161, 70000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:11:14', '2021-08-21 12:11:14'),
	(162, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:11:25', '2021-08-21 12:11:25'),
	(163, 10000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:11:36', '2021-08-21 12:11:36'),
	(164, 300000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:11:51', '2021-08-21 12:11:51'),
	(165, 300000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 12:12:07', '2021-08-21 12:12:07'),
	(166, 75000, 225000, 1, '2021-08-21', NULL, NULL, 170, NULL, NULL, NULL, NULL, 5, 5, '2021-08-21 12:28:03', '2021-08-21 12:28:03'),
	(167, 60000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 22:27:50', '2021-08-21 22:27:50'),
	(168, 60000, NULL, 3, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 22:27:59', '2021-08-21 22:27:59'),
	(169, 60000, NULL, 2, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2021-08-21 22:28:08', '2021-08-21 22:28:08'),
	(170, 120000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, '2021-08-21 22:49:23', '2021-08-21 22:49:23'),
	(171, 500000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, '2021-08-21 22:52:44', '2021-08-21 22:52:44'),
	(172, 160000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, '2021-08-21 22:55:04', '2021-08-21 22:55:04'),
	(173, 50000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, '2021-08-21 22:58:26', '2021-08-21 22:58:26'),
	(174, 50000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, '2021-08-21 23:00:25', '2021-08-21 23:00:25'),
	(175, 50000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, '2021-08-21 23:01:48', '2021-08-21 23:01:48'),
	(176, 50000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, '2021-08-21 23:03:24', '2021-08-21 23:03:24'),
	(177, 20000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-21 23:52:00', '2021-08-21 23:52:00'),
	(178, 5000, NULL, 1, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, '2021-08-22 00:12:11', '2021-08-22 00:12:11'),
	(179, 70000, NULL, 1, '2021-08-22', 4, NULL, 174, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:20:44', '2021-08-22 00:20:44'),
	(180, 60000, NULL, 1, '2021-08-22', 4, NULL, 175, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:22:48', '2021-08-22 00:22:48'),
	(181, 80000, NULL, 1, '2021-08-22', 4, NULL, 176, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:26:27', '2021-08-22 00:26:27'),
	(182, 60000, NULL, 1, '2021-08-22', 4, NULL, 177, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:27:26', '2021-08-22 00:27:26'),
	(183, 50000, NULL, 1, '2021-08-22', 4, NULL, 178, NULL, NULL, NULL, NULL, 16, 7, '2021-08-22 00:28:06', '2021-08-23 15:13:52'),
	(184, 60000, NULL, 1, '2021-08-22', 4, NULL, 179, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:28:45', '2021-08-22 00:28:45'),
	(185, 120000, NULL, 1, '2021-08-22', 4, NULL, 180, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:29:20', '2021-08-22 00:29:20'),
	(186, 250000, NULL, 1, '2021-08-22', 4, NULL, 181, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:30:06', '2021-08-22 00:30:06'),
	(187, 80000, NULL, 1, '2021-08-22', 4, NULL, 182, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:30:43', '2021-08-22 00:30:43'),
	(188, 20000, NULL, 1, '2021-08-22', 5, NULL, 183, NULL, NULL, NULL, NULL, NULL, 19, '2021-08-22 00:31:18', '2021-08-22 00:31:18'),
	(189, 80000, NULL, 1, '2021-08-22', 4, NULL, 184, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:32:00', '2021-08-22 00:32:00'),
	(190, 5000, NULL, 1, '2021-08-22', 4, NULL, 185, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:32:58', '2021-08-22 00:32:58'),
	(191, 5000, NULL, 1, '2021-08-22', 4, NULL, 186, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:33:43', '2021-08-22 00:33:43'),
	(192, 60000, NULL, 1, '2021-08-22', 4, NULL, 187, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:34:31', '2021-08-22 00:34:31'),
	(193, 60000, NULL, 1, '2021-08-22', 4, NULL, 188, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:35:08', '2021-08-22 00:35:08'),
	(194, 70000, NULL, 1, '2021-08-22', 4, NULL, 189, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:39:04', '2021-08-22 00:39:04'),
	(195, 70000, NULL, 1, '2021-08-22', 4, NULL, 190, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:40:04', '2021-08-22 00:40:04'),
	(196, 70000, NULL, 1, '2021-08-22', 4, NULL, 191, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:40:44', '2021-08-22 00:40:44'),
	(197, 70000, NULL, 1, '2021-08-22', 4, NULL, 192, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:41:21', '2021-08-22 00:41:21'),
	(198, 60000, NULL, 1, '2021-08-22', 4, NULL, 193, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:42:11', '2021-08-22 00:42:11'),
	(199, 60000, NULL, 1, '2021-08-22', 4, NULL, 194, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:43:04', '2021-08-22 00:43:04'),
	(200, 60000, NULL, 1, '2021-08-22', 4, NULL, 195, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:43:54', '2021-08-22 00:43:54'),
	(201, 60000, NULL, 1, '2021-08-22', 4, NULL, 196, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:44:33', '2021-08-22 00:44:33'),
	(202, 60000, NULL, 1, '2021-08-22', 4, NULL, 197, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:45:24', '2021-08-22 00:45:24'),
	(203, 5000, NULL, 1, '2021-08-22', 4, NULL, 198, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:46:02', '2021-08-22 00:46:02'),
	(204, 140000, NULL, 1, '2021-08-22', 5, NULL, 199, NULL, NULL, NULL, NULL, NULL, 19, '2021-08-22 00:53:26', '2021-08-22 00:53:26'),
	(205, 60000, NULL, 1, '2021-08-22', 5, NULL, 200, NULL, NULL, NULL, NULL, NULL, 19, '2021-08-22 00:56:28', '2021-08-22 00:56:28'),
	(206, 70000, NULL, 1, '2021-08-22', 4, NULL, 201, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:56:57', '2021-08-22 00:56:57'),
	(207, 5000, NULL, 1, '2021-08-22', 4, NULL, 202, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:57:38', '2021-08-22 00:57:38'),
	(208, 10000, NULL, 1, '2021-08-22', 4, NULL, 203, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:58:28', '2021-08-22 00:58:28'),
	(209, 5000, NULL, 1, '2021-08-22', 4, NULL, 204, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 00:59:04', '2021-08-22 00:59:04'),
	(210, 450000, NULL, 1, '2021-08-22', 4, NULL, 205, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:01:09', '2021-08-22 01:01:09'),
	(211, 210000, NULL, 1, '2021-08-22', 4, NULL, 206, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:01:53', '2021-08-22 01:01:53'),
	(212, 480000, NULL, 1, '2021-08-22', 4, NULL, 207, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:03:09', '2021-08-22 01:03:09'),
	(213, 60000, NULL, 1, '2021-08-22', 4, NULL, 208, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:03:49', '2021-08-22 01:03:49'),
	(214, 60000, NULL, 1, '2021-08-22', 4, NULL, 209, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:04:21', '2021-08-22 01:04:21'),
	(215, 60000, NULL, 1, '2021-08-22', 4, NULL, 210, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:10:18', '2021-08-22 01:10:18'),
	(216, 120000, NULL, 1, '2021-08-22', 4, NULL, 211, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:11:11', '2021-08-22 01:11:11'),
	(217, 60000, NULL, 1, '2021-08-22', 4, NULL, 212, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:11:59', '2021-08-22 01:11:59'),
	(218, 60000, NULL, 1, '2021-08-22', 4, NULL, 213, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:12:42', '2021-08-22 01:12:42'),
	(219, 60000, NULL, 1, '2021-08-22', 4, NULL, 214, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:13:16', '2021-08-22 01:13:16'),
	(220, 120000, NULL, 1, '2021-08-22', 4, NULL, 215, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:13:59', '2021-08-22 01:13:59'),
	(221, 70000, NULL, 1, '2021-08-22', 4, NULL, 216, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:14:35', '2021-08-22 01:14:35'),
	(222, 30000, NULL, 1, '2021-08-22', 4, NULL, 217, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:15:36', '2021-08-22 01:15:36'),
	(223, 330000, NULL, 1, '2021-08-22', 4, NULL, 218, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:17:28', '2021-08-22 01:17:28'),
	(224, 180000, NULL, 1, '2021-08-22', 4, NULL, 219, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:18:15', '2021-08-22 01:18:15'),
	(225, 60000, NULL, 1, '2021-08-22', 4, NULL, 220, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:19:43', '2021-08-22 01:19:43'),
	(226, 60000, NULL, 1, '2021-08-22', 4, NULL, 221, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:20:46', '2021-08-22 01:20:46'),
	(227, 60000, NULL, 1, '2021-08-22', 4, NULL, 222, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:21:28', '2021-08-22 01:21:28'),
	(228, 60000, NULL, 1, '2021-08-22', 4, NULL, 223, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:22:17', '2021-08-22 01:22:17'),
	(229, 120000, NULL, 1, '2021-08-22', 4, NULL, 224, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:23:20', '2021-08-22 01:23:20'),
	(230, 120000, NULL, 1, '2021-08-22', 4, NULL, 225, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:24:04', '2021-08-22 01:24:04'),
	(231, 140000, NULL, 1, '2021-08-22', 4, NULL, 226, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:24:59', '2021-08-22 01:24:59'),
	(232, 120000, NULL, 1, '2021-08-22', 4, NULL, 227, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:26:03', '2021-08-22 01:26:03'),
	(233, 0, NULL, 1, '2021-08-22', 4, NULL, 228, NULL, NULL, NULL, NULL, 16, 7, '2021-08-22 01:26:45', '2021-08-23 15:37:56'),
	(234, 140000, NULL, 1, '2021-08-22', 4, NULL, 229, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:28:19', '2021-08-22 01:28:19'),
	(235, 240000, NULL, 1, '2021-08-22', 4, NULL, 230, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:29:11', '2021-08-22 01:29:11'),
	(236, 10000, NULL, 1, '2021-08-22', 4, NULL, 231, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:31:28', '2021-08-22 01:31:28'),
	(237, 5000, NULL, 1, '2021-08-22', 4, NULL, 232, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:32:11', '2021-08-22 01:32:11'),
	(238, 90000, NULL, 1, '2021-08-22', 4, NULL, 233, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:34:50', '2021-08-22 01:34:50'),
	(239, 20000, NULL, 1, '2021-08-22', 5, NULL, 234, NULL, NULL, NULL, NULL, NULL, 19, '2021-08-22 01:39:10', '2021-08-22 01:39:10'),
	(240, 60000, NULL, 1, '2021-08-22', 4, NULL, 235, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:40:34', '2021-08-22 01:40:34'),
	(241, 5000, NULL, 1, '2021-08-22', 4, NULL, 236, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:41:38', '2021-08-22 01:41:38'),
	(242, 25000, NULL, 1, '2021-08-22', 4, NULL, 237, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:42:56', '2021-08-22 01:42:56'),
	(243, 60000, NULL, 1, '2021-08-22', 4, NULL, 238, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:44:39', '2021-08-22 01:44:39'),
	(244, 10000, NULL, 1, '2021-08-22', 5, NULL, 239, NULL, NULL, NULL, NULL, NULL, 19, '2021-08-22 01:46:56', '2021-08-22 01:46:56'),
	(245, 60000, NULL, 1, '2021-08-22', 4, NULL, 240, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:52:12', '2021-08-22 01:52:12'),
	(246, 5000, NULL, 1, '2021-08-22', 4, NULL, 241, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:53:08', '2021-08-22 01:53:08'),
	(247, 15000, NULL, 1, '2021-08-22', 4, NULL, 242, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 01:56:09', '2021-08-22 01:56:09'),
	(248, 360000, NULL, 1, '2021-08-22', 4, NULL, 243, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:02:02', '2021-08-22 02:02:02'),
	(249, 0, NULL, 1, '2021-08-22', 4, NULL, 244, NULL, NULL, NULL, NULL, 16, 7, '2021-08-22 02:02:50', '2021-08-23 15:40:53'),
	(250, 5000, NULL, 1, '2021-08-22', 4, NULL, 245, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:03:40', '2021-08-22 02:03:40'),
	(251, 5000, NULL, 1, '2021-08-22', 4, NULL, 246, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:05:33', '2021-08-22 02:05:33'),
	(252, 20000, NULL, 1, '2021-08-22', 5, NULL, 247, NULL, NULL, NULL, NULL, NULL, 19, '2021-08-22 02:06:06', '2021-08-22 02:06:06'),
	(253, 10000, NULL, 1, '2021-08-22', 4, NULL, 248, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:06:43', '2021-08-22 02:06:43'),
	(254, 10000, NULL, 1, '2021-08-22', 5, NULL, 249, NULL, NULL, NULL, NULL, NULL, 19, '2021-08-22 02:08:04', '2021-08-22 02:08:04'),
	(255, 70000, NULL, 1, '2021-08-22', 4, NULL, 250, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:09:45', '2021-08-22 02:09:45'),
	(256, 40000, NULL, 1, '2021-08-22', 5, NULL, 251, NULL, NULL, NULL, NULL, NULL, 19, '2021-08-22 02:16:59', '2021-08-22 02:16:59'),
	(257, 10000, NULL, 1, '2021-08-22', 5, NULL, 252, NULL, NULL, NULL, NULL, NULL, 19, '2021-08-22 02:17:42', '2021-08-22 02:17:42'),
	(258, 20000, NULL, 1, '2021-08-22', 5, NULL, 253, NULL, NULL, NULL, NULL, NULL, 19, '2021-08-22 02:22:07', '2021-08-22 02:22:07'),
	(259, 5000, NULL, 1, '2021-08-22', 4, NULL, 254, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:22:31', '2021-08-22 02:22:31'),
	(260, 60000, NULL, 1, '2021-08-22', 5, NULL, 255, NULL, NULL, NULL, NULL, NULL, 19, '2021-08-22 02:23:09', '2021-08-22 02:23:09'),
	(261, 60000, NULL, 1, '2021-08-22', 4, NULL, 256, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:23:13', '2021-08-22 02:23:13'),
	(262, 6000, NULL, 1, '2021-08-22', 4, NULL, 257, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:24:08', '2021-08-22 02:24:08'),
	(263, 20000, NULL, 1, '2021-08-22', 5, NULL, 258, NULL, NULL, NULL, NULL, NULL, 19, '2021-08-22 02:24:42', '2021-08-22 02:24:42'),
	(264, 10000, NULL, 1, '2021-08-22', 5, NULL, 259, NULL, NULL, NULL, NULL, NULL, 19, '2021-08-22 02:25:16', '2021-08-22 02:25:16'),
	(265, 5000, NULL, 1, '2021-08-22', 4, NULL, 260, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:25:45', '2021-08-22 02:25:45'),
	(266, 60000, NULL, 1, '2021-08-22', 4, NULL, 261, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:26:34', '2021-08-22 02:26:34'),
	(267, 60000, NULL, 1, '2021-08-22', 5, NULL, 262, NULL, NULL, NULL, NULL, NULL, 19, '2021-08-22 02:29:11', '2021-08-22 02:29:11'),
	(268, 5000, NULL, 1, '2021-08-22', 4, NULL, 263, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:29:37', '2021-08-22 02:29:37'),
	(269, 5000, NULL, 1, '2021-08-22', 4, NULL, 264, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:30:19', '2021-08-22 02:30:19'),
	(270, 60000, NULL, 1, '2021-08-22', 5, NULL, 265, NULL, NULL, NULL, NULL, NULL, 19, '2021-08-22 02:30:27', '2021-08-22 02:30:27'),
	(271, 5000, NULL, 1, '2021-08-22', 4, NULL, 266, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:31:05', '2021-08-22 02:31:05'),
	(272, 5000, NULL, 1, '2021-08-22', 4, NULL, 267, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:32:11', '2021-08-22 02:32:11'),
	(273, 110000, NULL, 1, '2021-08-22', 4, NULL, 268, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:35:46', '2021-08-22 02:35:46'),
	(274, 300000, NULL, 1, '2021-08-22', 4, NULL, 269, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:36:32', '2021-08-22 02:36:32'),
	(275, 60000, NULL, 1, '2021-08-22', 4, NULL, 270, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:37:11', '2021-08-22 02:37:11'),
	(276, 90000, NULL, 1, '2021-08-22', 4, NULL, 271, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:40:11', '2021-08-22 02:40:11'),
	(277, 90000, NULL, 1, '2021-08-22', 4, NULL, 272, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:40:56', '2021-08-22 02:40:56'),
	(278, 90000, NULL, 1, '2021-08-22', 4, NULL, 273, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:41:56', '2021-08-22 02:41:56'),
	(279, 90000, NULL, 1, '2021-08-22', 4, NULL, 274, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:42:38', '2021-08-22 02:42:38'),
	(280, 120000, NULL, 1, '2021-08-22', 4, NULL, 275, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:44:08', '2021-08-22 02:44:08'),
	(281, 0, NULL, 1, '2021-08-22', 4, NULL, 276, NULL, NULL, NULL, NULL, 16, 7, '2021-08-22 02:46:50', '2021-08-23 15:41:55'),
	(282, 5000, NULL, 1, '2021-08-22', 4, NULL, 277, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:47:28', '2021-08-22 02:47:28'),
	(283, 240000, NULL, 1, '2021-08-22', 4, NULL, 278, NULL, NULL, NULL, NULL, 17, 7, '2021-08-22 02:48:09', '2021-08-22 02:49:40'),
	(284, 0, NULL, 1, '2021-08-22', 4, NULL, 279, NULL, NULL, NULL, NULL, 16, 7, '2021-08-22 02:51:45', '2021-08-23 15:35:53'),
	(285, 5000, NULL, 1, '2021-08-22', 4, NULL, 280, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:52:30', '2021-08-22 02:52:30'),
	(286, 5000, NULL, 1, '2021-08-22', 4, NULL, 281, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:53:18', '2021-08-22 02:53:18'),
	(287, 5000, NULL, 1, '2021-08-22', 4, NULL, 282, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:53:50', '2021-08-22 02:53:50'),
	(288, 10000, NULL, 1, '2021-08-22', 4, NULL, 283, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:54:29', '2021-08-22 02:54:29'),
	(289, 5000, NULL, 1, '2021-08-22', 4, NULL, 284, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 02:55:23', '2021-08-22 02:55:23'),
	(290, 110000, NULL, 1, '2021-08-22', 4, NULL, 285, NULL, NULL, NULL, NULL, 17, 7, '2021-08-22 02:56:27', '2021-08-22 02:58:47'),
	(291, 180000, NULL, 1, '2021-08-22', 4, NULL, 286, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 03:00:34', '2021-08-22 03:00:34'),
	(292, 70000, NULL, 1, '2021-08-22', 4, NULL, 287, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 03:01:22', '2021-08-22 03:01:22'),
	(293, 275000, NULL, 1, '2021-08-22', 4, NULL, 288, NULL, NULL, NULL, NULL, 16, 7, '2021-08-22 03:02:09', '2021-08-23 15:28:06'),
	(294, 10000, NULL, 1, '2021-08-22', 4, NULL, 289, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 03:12:04', '2021-08-22 03:12:04'),
	(295, 5000, NULL, 1, '2021-08-22', 4, NULL, 290, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 03:13:18', '2021-08-22 03:13:18'),
	(296, 250000, NULL, 1, '2021-08-22', 4, NULL, 291, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 03:16:59', '2021-08-22 03:16:59'),
	(297, 70000, NULL, 1, '2021-08-22', 4, NULL, 292, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:14:27', '2021-08-22 04:14:27'),
	(298, 60000, NULL, 1, '2021-08-22', 4, NULL, 293, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:15:27', '2021-08-22 04:15:27'),
	(299, 130000, NULL, 1, '2021-08-22', 4, NULL, 294, NULL, NULL, NULL, NULL, 16, 7, '2021-08-22 04:16:14', '2021-08-23 15:20:17'),
	(300, 60000, NULL, 1, '2021-08-22', 4, NULL, 295, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:16:51', '2021-08-22 04:16:51'),
	(301, 6000, NULL, 1, '2021-08-22', 4, NULL, 296, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:17:43', '2021-08-22 04:17:43'),
	(302, 70000, NULL, 1, '2021-08-22', 4, NULL, 297, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:19:28', '2021-08-22 04:19:28'),
	(303, 70000, NULL, 1, '2021-08-22', 4, NULL, 298, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:21:00', '2021-08-22 04:21:00'),
	(304, 120000, NULL, 1, '2021-08-22', 4, NULL, 299, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:21:43', '2021-08-22 04:21:43'),
	(305, 10000, NULL, 1, '2021-08-22', 4, NULL, 300, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:23:25', '2021-08-22 04:23:25'),
	(306, 5000, NULL, 1, '2021-08-22', 4, NULL, 301, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:24:08', '2021-08-22 04:24:08'),
	(307, 5000, NULL, 1, '2021-08-22', 4, NULL, 302, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:24:54', '2021-08-22 04:24:54'),
	(308, 70000, NULL, 1, '2021-08-22', 4, NULL, 303, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:25:52', '2021-08-22 04:25:52'),
	(309, 60000, NULL, 1, '2021-08-22', 4, NULL, 304, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:30:06', '2021-08-22 04:30:06'),
	(310, 70000, NULL, 1, '2021-08-22', 4, NULL, 305, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:35:29', '2021-08-22 04:35:29'),
	(311, 60000, NULL, 1, '2021-08-22', 4, NULL, 306, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:36:53', '2021-08-22 04:36:53'),
	(312, 5000, NULL, 1, '2021-08-22', 4, NULL, 307, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:38:30', '2021-08-22 04:38:30'),
	(313, 130000, NULL, 1, '2021-08-22', 4, NULL, 308, NULL, NULL, NULL, NULL, 16, 7, '2021-08-22 04:39:42', '2021-08-23 15:23:51'),
	(314, 70000, NULL, 1, '2021-08-22', 4, NULL, 309, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:40:53', '2021-08-22 04:40:53'),
	(315, 180000, NULL, 1, '2021-08-22', 4, NULL, 310, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:41:56', '2021-08-22 04:41:56'),
	(316, 210000, NULL, 1, '2021-08-22', 4, NULL, 311, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:44:22', '2021-08-22 04:44:22'),
	(317, 15000, NULL, 1, '2021-08-22', 4, NULL, 312, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:45:24', '2021-08-22 04:45:24'),
	(318, 60000, NULL, 1, '2021-08-22', 4, NULL, 313, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:46:36', '2021-08-22 04:46:36'),
	(319, 60000, NULL, 1, '2021-08-22', 4, NULL, 314, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:51:20', '2021-08-22 04:51:20'),
	(320, 60000, NULL, 1, '2021-08-22', 4, NULL, 315, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 04:52:25', '2021-08-22 04:52:25'),
	(321, 130000, NULL, 1, '2021-08-22', 4, NULL, 316, NULL, NULL, NULL, NULL, 16, 7, '2021-08-22 05:43:55', '2021-08-23 15:17:48'),
	(322, 130000, NULL, 1, '2021-08-22', 4, NULL, 317, NULL, NULL, NULL, NULL, 16, 7, '2021-08-22 05:44:56', '2021-08-23 15:22:21'),
	(323, 30000, NULL, 1, '2021-08-22', 4, NULL, 318, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 05:45:55', '2021-08-22 05:45:55'),
	(324, 70000, NULL, 1, '2021-08-22', 4, NULL, 319, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 05:46:42', '2021-08-22 05:46:42'),
	(325, 30000, NULL, 1, '2021-08-22', 4, NULL, 320, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 05:47:37', '2021-08-22 05:47:37'),
	(326, 140000, NULL, 1, '2021-08-22', 4, NULL, 321, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 05:48:47', '2021-08-22 05:48:47'),
	(327, 0, NULL, 1, '2021-08-22', 4, NULL, 322, NULL, NULL, NULL, NULL, 16, 7, '2021-08-22 05:50:00', '2021-08-23 15:39:18'),
	(328, 5000, NULL, 1, '2021-08-22', 4, NULL, 323, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 05:51:01', '2021-08-22 05:51:01'),
	(329, 5000, NULL, 1, '2021-08-22', 4, NULL, 324, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 05:51:55', '2021-08-22 05:51:55'),
	(330, 10000, NULL, 1, '2021-08-22', 4, NULL, 325, NULL, NULL, NULL, NULL, NULL, 7, '2021-08-22 05:52:56', '2021-08-22 05:52:56');
/*!40000 ALTER TABLE `reglements` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. remises
CREATE TABLE IF NOT EXISTS `remises` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_remise` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vente_id` int(11) NOT NULL,
  `montan_remise` bigint(20) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.remises : ~0 rows (environ)
/*!40000 ALTER TABLE `remises` DISABLE KEYS */;
INSERT INTO `remises` (`id`, `libelle_remise`, `vente_id`, `montan_remise`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Remise\r\n', 158, 10000, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `remises` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. retour_articles
CREATE TABLE IF NOT EXISTS `retour_articles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vente_id` int(11) DEFAULT NULL,
  `vente_materiel_id` int(11) DEFAULT NULL,
  `date_retour` date NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.retour_articles : ~62 rows (environ)
/*!40000 ALTER TABLE `retour_articles` DISABLE KEYS */;
INSERT INTO `retour_articles` (`id`, `vente_id`, `vente_materiel_id`, `date_retour`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 51, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 11:24:22', '2021-08-21 11:24:22'),
	(2, 162, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 11:30:48', '2021-08-21 11:30:48'),
	(3, 154, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 11:31:19', '2021-08-21 11:31:19'),
	(4, 10, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 11:47:14', '2021-08-21 11:47:14'),
	(5, 6, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 11:47:46', '2021-08-21 11:47:46'),
	(6, 8, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 11:48:11', '2021-08-21 11:48:11'),
	(7, 9, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 11:48:37', '2021-08-21 11:48:37'),
	(8, 141, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 11:49:12', '2021-08-21 11:49:12'),
	(9, 22, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 11:49:59', '2021-08-21 11:49:59'),
	(10, 144, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 11:50:19', '2021-08-21 11:50:19'),
	(11, 108, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 11:50:34', '2021-08-21 11:50:34'),
	(12, 83, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 11:50:50', '2021-08-21 11:50:50'),
	(13, 46, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:03:55', '2021-08-21 12:03:55'),
	(14, 36, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:04:09', '2021-08-21 12:04:09'),
	(15, 37, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:04:24', '2021-08-21 12:04:24'),
	(16, 43, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:04:39', '2021-08-21 12:04:39'),
	(17, 41, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:04:52', '2021-08-21 12:04:52'),
	(18, 55, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:05:13', '2021-08-21 12:05:13'),
	(19, 49, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:05:31', '2021-08-21 12:05:31'),
	(20, 47, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:05:50', '2021-08-21 12:05:50'),
	(21, 35, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:07:04', '2021-08-21 12:07:04'),
	(22, 160, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:07:22', '2021-08-21 12:07:22'),
	(23, 79, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:13:06', '2021-08-21 12:13:06'),
	(24, 65, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:13:22', '2021-08-21 12:13:22'),
	(25, 70, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:13:37', '2021-08-21 12:13:37'),
	(26, 27, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:18:49', '2021-08-21 12:18:49'),
	(27, 26, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:18:57', '2021-08-21 12:18:57'),
	(28, 165, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:19:13', '2021-08-21 12:19:13'),
	(29, 136, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:20:59', '2021-08-21 12:20:59'),
	(30, 48, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:26:30', '2021-08-21 12:26:30'),
	(31, 127, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:26:40', '2021-08-21 12:26:40'),
	(32, 69, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:27:08', '2021-08-21 12:27:08'),
	(33, 163, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:28:49', '2021-08-21 12:28:49'),
	(34, 153, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:29:05', '2021-08-21 12:29:05'),
	(35, 4, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:42:54', '2021-08-21 12:42:54'),
	(36, 3, NULL, '2021-08-21', NULL, NULL, NULL, 5, '2021-08-21 12:43:33', '2021-08-21 12:43:33'),
	(37, 190, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:17:23', '2021-08-23 14:17:23'),
	(38, 209, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:18:18', '2021-08-23 14:18:18'),
	(39, 210, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:20:00', '2021-08-23 14:20:00'),
	(40, 208, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:20:36', '2021-08-23 14:20:36'),
	(41, 215, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:21:37', '2021-08-23 14:21:37'),
	(42, 225, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:22:16', '2021-08-23 14:22:16'),
	(43, 261, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:23:02', '2021-08-23 14:23:02'),
	(44, 205, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:23:59', '2021-08-23 14:23:59'),
	(45, 223, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:24:30', '2021-08-23 14:24:30'),
	(46, 220, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:26:49', '2021-08-23 14:26:49'),
	(47, 238, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:27:44', '2021-08-23 14:27:44'),
	(48, 201, NULL, '2021-08-23', NULL, NULL, NULL, 16, '2021-08-23 14:28:49', '2021-08-23 14:28:49'),
	(49, 216, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:29:32', '2021-08-23 14:29:32'),
	(50, 181, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:30:09', '2021-08-23 14:30:09'),
	(51, 291, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:30:33', '2021-08-23 14:30:33'),
	(52, 273, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:31:02', '2021-08-23 14:31:02'),
	(53, 182, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:31:27', '2021-08-23 14:31:27'),
	(54, 274, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:32:09', '2021-08-23 14:32:09'),
	(55, 176, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:32:32', '2021-08-23 14:32:32'),
	(56, 312, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:33:05', '2021-08-23 14:33:05'),
	(57, 299, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:33:28', '2021-08-23 14:33:28'),
	(58, 180, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:33:52', '2021-08-23 14:33:52'),
	(59, 179, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:34:16', '2021-08-23 14:34:16'),
	(60, 278, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:34:43', '2021-08-23 14:34:43'),
	(61, 192, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:35:12', '2021-08-23 14:35:12'),
	(62, 222, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:35:33', '2021-08-23 14:35:33'),
	(63, 193, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:35:53', '2021-08-23 14:35:53'),
	(64, 196, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:36:11', '2021-08-23 14:36:11'),
	(65, 195, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:36:29', '2021-08-23 14:36:29'),
	(66, 194, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:36:51', '2021-08-23 14:36:51'),
	(67, 233, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:37:28', '2021-08-23 14:37:28'),
	(68, 233, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:37:53', '2021-08-23 14:37:53'),
	(69, 206, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 14:38:41', '2021-08-23 14:38:41'),
	(70, 243, NULL, '2021-08-22', NULL, NULL, NULL, 16, '2021-08-23 15:31:35', '2021-08-23 15:31:35');
/*!40000 ALTER TABLE `retour_articles` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. sous_categories
CREATE TABLE IF NOT EXISTS `sous_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_sous_categorie` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorie_id` int(10) unsigned NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.sous_categories : ~0 rows (environ)
/*!40000 ALTER TABLE `sous_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `sous_categories` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. tailles
CREATE TABLE IF NOT EXISTS `tailles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_taille` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.tailles : ~0 rows (environ)
/*!40000 ALTER TABLE `tailles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tailles` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. ticket_in_tvas
CREATE TABLE IF NOT EXISTS `ticket_in_tvas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ticket` int(11) NOT NULL,
  `declaration` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.ticket_in_tvas : ~0 rows (environ)
/*!40000 ALTER TABLE `ticket_in_tvas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_in_tvas` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. transfert_stocks
CREATE TABLE IF NOT EXISTS `transfert_stocks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_transfert` date NOT NULL,
  `depot_depart_id` int(10) unsigned NOT NULL,
  `depot_arrivee_id` int(10) unsigned NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.transfert_stocks : ~0 rows (environ)
/*!40000 ALTER TABLE `transfert_stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfert_stocks` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. tva_declarees
CREATE TABLE IF NOT EXISTS `tva_declarees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_declaration` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.tva_declarees : ~0 rows (environ)
/*!40000 ALTER TABLE `tva_declarees` DISABLE KEYS */;
/*!40000 ALTER TABLE `tva_declarees` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. type_abonnements
CREATE TABLE IF NOT EXISTS `type_abonnements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_type_abonnement` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix_type_abonnement` int(10) unsigned NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.type_abonnements : ~0 rows (environ)
/*!40000 ALTER TABLE `type_abonnements` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_abonnements` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. type_cautions
CREATE TABLE IF NOT EXISTS `type_cautions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_type_caution` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.type_cautions : ~0 rows (environ)
/*!40000 ALTER TABLE `type_cautions` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_cautions` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. type_pieces
CREATE TABLE IF NOT EXISTS `type_pieces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_type_piece` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.type_pieces : ~0 rows (environ)
/*!40000 ALTER TABLE `type_pieces` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_pieces` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. unites
CREATE TABLE IF NOT EXISTS `unites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_unite` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantite_unite` int(10) unsigned NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.unites : ~6 rows (environ)
/*!40000 ALTER TABLE `unites` DISABLE KEYS */;
INSERT INTO `unites` (`id`, `libelle_unite`, `quantite_unite`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Bouteille salle', 1, NULL, NULL, 2, 2, '2021-08-17 15:50:12', '2021-08-19 16:09:01'),
	(2, 'Bouteille VIP', 1, NULL, NULL, NULL, 2, '2021-08-17 15:53:59', '2021-08-17 15:53:59'),
	(3, 'Verre', 1, NULL, NULL, NULL, 2, '2021-08-19 16:09:18', '2021-08-19 16:09:18'),
	(4, 'Coupe', 1, NULL, NULL, NULL, 5, '2021-08-21 02:44:50', '2021-08-21 02:44:50'),
	(5, 'Conso', 1, NULL, NULL, NULL, 5, '2021-08-22 00:19:10', '2021-08-22 00:19:10'),
	(6, 'Short', 1, NULL, NULL, NULL, 5, '2021-08-22 02:15:20', '2021-08-22 02:15:20');
/*!40000 ALTER TABLE `unites` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agence_id` int(10) unsigned DEFAULT NULL,
  `localite_id` int(10) unsigned DEFAULT NULL,
  `depot_id` int(10) unsigned DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `last_login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut_compte` tinyint(1) NOT NULL DEFAULT '1',
  `etat_user` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_login_unique` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.users : ~10 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `full_name`, `contact`, `email`, `login`, `role`, `agence_id`, `localite_id`, `depot_id`, `email_verified_at`, `password`, `last_login_at`, `last_login_ip`, `confirmation_token`, `statut_compte`, `etat_user`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Concepteur de l\'application', '00000000', 'Concepteur@app.com', 'Concepteur', 'Concepteur', NULL, NULL, NULL, NULL, '$2y$10$JoSAcmr9O1HWbeJO5Xm4huhl/qjmVj2Jg5y/gA7rRmAPIxyX1PaoG', '2021-08-19 17:20:46', '::1', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', '2021-08-19 17:20:46'),
	(2, 'Alexandre TAHI', '(05) 84-64-98-25', 'alexandretahi7@gmail.com', 'alexandretahi7@gmail.com', 'Concepteur', NULL, NULL, 0, NULL, '$2y$10$aDkvcFf2vNSQuF0BQCPGRObRs3M2KFf3VvcSsleGH/vGdrpyx10sW', '2021-08-21 12:56:37', '192.168.1.179', NULL, 1, 0, NULL, NULL, 1, NULL, NULL, '2021-08-17 14:56:41', '2021-08-21 12:56:37'),
	(5, 'Alfred KOUANSAN', '(07) 48-36-56-90', 'alfredkouansan@groupsmarty.com', 'alfredkouansan@groupsmarty.com', 'Concepteur', NULL, NULL, NULL, NULL, '$2y$10$9lBN46ufNc2HKzCg4ManFeqv7Vl1cny8dmQXRdXMlr5.FTKxrGcDy', '2021-08-22 02:48:56', '::1', NULL, 1, 0, NULL, NULL, NULL, 2, NULL, '2021-08-18 11:31:47', '2021-08-22 02:48:56'),
	(6, 'Basile KOFFI', '(00) 00-00-00-00', 'basile.koffi@nvllesoda-com.net', 'basile.koffi@nvllesoda-com.net', 'Administrateur', NULL, NULL, NULL, NULL, '$2y$10$jhesZhLmY4e5W.BCrXW3c.elV0MaHzPk6gh8qBFXeNgpefWRPuEkS', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 2, NULL, '2021-08-18 11:37:25', '2021-08-18 11:37:25'),
	(7, 'Elisa KOUAKOU', '(00) 00-00-00-00', 'elisa.kouakou@gmail.com', 'elisa.kouakou@gmail.com', 'Caissier', NULL, NULL, 1, NULL, '$2y$10$OFRCeipKKQdeP4lGoLa2Bulw6hHBF1.wxd21GGKN6Ei/2QK9NlO0i', '2021-08-21 10:26:45', '::1', NULL, 1, 1, NULL, NULL, 7, 5, NULL, '2021-08-18 11:42:31', '2021-08-21 23:42:44'),
	(8, 'Anasthasie EHUENI', '(00) 00-00-00-00', 'ehuenianita@yahoo.fr', 'ehuenianita@yahoo.fr', 'Caissier', NULL, NULL, 1, NULL, '$2y$10$eo1GxnK57Pg4yp/c3DNx8u0dleLhxn9yEvy4VA4mdMW1HC9DsA8PO', '2021-08-21 09:59:37', '::1', NULL, 1, 0, NULL, NULL, NULL, 5, NULL, '2021-08-18 11:45:40', '2021-08-21 09:59:37'),
	(11, 'Hurry ADJOVI', '(00) 00-00-00-00', 'hurry.adjovi@voodoo-com.net', 'hurry.adjovi@voodoo-com.net', 'Administrateur', NULL, NULL, NULL, NULL, '$2y$10$zIF0wAnT31p4CdhUSpGEwuK4X2JQ1BSdmK1hr80DAJelJZg7JZ98S', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 5, NULL, '2021-08-18 12:23:07', '2021-08-18 12:23:07'),
	(16, 'Michel Kouame', '(00) 00-00-00-00', 'wilfredkouame93@gmail.com', 'wilfredkouame93@gmail.com', 'Gerant', NULL, NULL, 1, NULL, '$2y$10$XCzgHs1QdVC8q9003L8XiOFHudK374soEMUwRenk/kpMJf1Uz9e2K', '2021-08-23 16:50:40', '::1', NULL, 1, 0, NULL, NULL, 1, NULL, NULL, '2021-08-19 16:31:24', '2021-08-23 16:50:40'),
	(17, 'Stéphane IRIE', '(07) 79-50-57-42', 'iriemizan@gmail.com', 'iriemizan', 'Administrateur', NULL, NULL, NULL, NULL, '$2y$10$nRCciXUkQZ8yVmprEYRBuuv22GX/vXRuUit5hJ99tSzAN2HYIGYmK', '2021-08-21 22:33:30', '::1', NULL, 1, 1, NULL, NULL, NULL, 5, NULL, '2021-08-21 22:06:02', '2021-08-22 02:49:07'),
	(18, 'Eric ZOGOUA', '(07) 08-86-75-06', 'ericzogoua@gmail.com', 'ericzogoua@gmail.com', 'Logistic', NULL, NULL, 0, NULL, '$2y$10$Ok1KIxOW5SxyDwvOk0qpPOWSRlJoW06F6mU4yNWim9d3iLS9cucVK', '2021-08-21 23:41:53', '::1', NULL, 1, 0, NULL, NULL, 5, 5, NULL, '2021-08-21 23:17:54', '2021-08-21 23:41:53'),
	(19, 'Mariam RACINE SOW', '(00) 00-00-00-00', 'mimisow97@gmail.com', 'mimisow97@gmail.com', 'Caissier', NULL, NULL, 1, NULL, '$2y$10$wl6iEEkanDRIADC1mG.uKeGtd1emGXKs0p7w4UzYnZvrJEJg1gQn.', '2021-08-22 00:40:13', '192.168.1.179', NULL, 1, 1, NULL, NULL, NULL, 5, NULL, '2021-08-22 00:17:12', '2021-08-22 00:47:33');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. ventes
CREATE TABLE IF NOT EXISTS `ventes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `numero_facture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_ticket` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_vente` datetime NOT NULL,
  `depot_id` int(10) unsigned DEFAULT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `caisse_ouverte_id` int(10) unsigned DEFAULT NULL,
  `acompte_facture` bigint(20) NOT NULL DEFAULT '0',
  `montant_a_payer` bigint(20) NOT NULL DEFAULT '0',
  `montant_payer` bigint(20) NOT NULL DEFAULT '0',
  `remise_id` int(11) DEFAULT NULL,
  `proformat` tinyint(1) NOT NULL DEFAULT '0',
  `attente` tinyint(1) NOT NULL DEFAULT '0',
  `divers` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.ventes : ~266 rows (environ)
/*!40000 ALTER TABLE `ventes` DISABLE KEYS */;
INSERT INTO `ventes` (`id`, `numero_facture`, `numero_ticket`, `date_vente`, `depot_id`, `client_id`, `caisse_ouverte_id`, `acompte_facture`, `montant_a_payer`, `montant_payer`, `remise_id`, `proformat`, `attente`, `divers`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'TICKET2021000001', '2021-08-20 15:16:52', 1, NULL, 1, 0, 0, 120000, NULL, 0, 0, 0, '2021-08-20 17:44:35', 5, 5, 8, '2021-08-20 15:16:52', '2021-08-20 17:44:35'),
	(2, NULL, 'TICKET2021000002', '2021-08-20 15:17:29', 1, NULL, 1, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 5, 8, '2021-08-20 15:17:29', '2021-08-20 17:44:55'),
	(3, NULL, 'TICKET2021000003', '2021-08-20 23:28:49', 1, NULL, 2, 0, 0, 180000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-20 23:28:49', '2021-08-20 23:28:49'),
	(4, NULL, 'TICKET2021000004', '2021-08-20 23:34:49', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-20 23:34:49', '2021-08-20 23:38:51'),
	(5, NULL, 'TICKET2021000005', '2021-08-21 00:07:45', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 00:07:45', '2021-08-21 11:45:09'),
	(6, NULL, 'TICKET2021000006', '2021-08-21 00:48:28', 1, NULL, 3, 0, 0, 1050000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 00:48:28', '2021-08-21 11:44:54'),
	(7, NULL, 'TICKET2021000007', '2021-08-21 00:51:39', 1, NULL, 3, 0, 0, 360000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 00:51:39', '2021-08-21 11:44:40'),
	(8, NULL, 'TICKET2021000008', '2021-08-21 00:53:06', 1, NULL, 3, 0, 0, 210000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 00:53:06', '2021-08-21 11:44:30'),
	(9, NULL, 'TICKET2021000009', '2021-08-21 00:54:32', 1, NULL, 3, 0, 0, 180000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 00:54:32', '2021-08-21 11:44:20'),
	(10, NULL, 'TICKET2021000010', '2021-08-21 00:55:25', 1, NULL, 3, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 00:55:25', '2021-08-21 11:44:09'),
	(11, NULL, 'TICKET2021000011', '2021-08-21 00:56:37', 1, NULL, 3, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 00:56:37', '2021-08-21 11:43:44'),
	(12, NULL, 'TICKET2021000012', '2021-08-21 00:57:42', 1, NULL, 3, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 00:57:42', '2021-08-21 11:43:20'),
	(13, NULL, 'TICKET2021000013', '2021-08-21 00:58:34', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 00:58:34', '2021-08-21 07:34:00'),
	(14, NULL, 'TICKET2021000014', '2021-08-21 00:59:36', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 00:59:36', '2021-08-21 07:34:29'),
	(15, NULL, 'TICKET2021000015', '2021-08-21 01:00:19', 1, NULL, 3, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:00:19', '2021-08-21 11:45:26'),
	(16, NULL, 'TICKET2021000016', '2021-08-21 01:01:10', 1, NULL, 3, 0, 0, 140000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 01:01:10', '2021-08-21 07:35:04'),
	(17, NULL, 'TICKET2021000017', '2021-08-21 01:05:45', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 01:05:45', '2021-08-21 06:46:16'),
	(18, NULL, 'TICKET2021000018', '2021-08-21 01:06:37', 1, NULL, 3, 0, 0, 50000, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-21 01:06:37', '2021-08-21 23:00:25'),
	(19, NULL, 'TICKET2021000019', '2021-08-21 01:07:41', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 01:07:41', '2021-08-21 06:44:43'),
	(20, NULL, 'TICKET2021000020', '2021-08-21 01:08:53', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 01:08:53', '2021-08-21 07:17:11'),
	(21, NULL, 'TICKET2021000021', '2021-08-21 01:10:01', 1, NULL, 3, 0, 0, 80000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 01:10:01', '2021-08-21 07:16:19'),
	(22, NULL, 'TICKET2021000022', '2021-08-21 01:12:39', 1, NULL, 3, 0, 0, 80000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:12:39', '2021-08-21 11:46:04'),
	(23, NULL, 'TICKET2021000023', '2021-08-21 01:13:26', 1, NULL, 3, 0, 0, 320000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:13:26', '2021-08-21 11:52:13'),
	(24, NULL, 'TICKET2021000024', '2021-08-21 01:17:01', 1, NULL, 3, 0, 0, 140000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:17:01', '2021-08-21 11:51:57'),
	(25, NULL, 'TICKET2021000025', '2021-08-21 01:18:11', 1, NULL, 3, 0, 0, 80000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:18:11', '2021-08-21 11:51:44'),
	(26, NULL, 'TICKET2021000026', '2021-08-21 01:19:05', 1, NULL, 3, 0, 0, 80000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:19:05', '2021-08-21 11:51:35'),
	(27, NULL, 'TICKET2021000027', '2021-08-21 01:19:55', 1, NULL, 3, 0, 0, 80000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:19:55', '2021-08-21 11:51:21'),
	(28, NULL, 'TICKET2021000028', '2021-08-21 01:20:57', 1, NULL, 3, 0, 0, 150000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 01:20:57', '2021-08-21 07:22:35'),
	(29, NULL, 'TICKET2021000029', '2021-08-21 01:23:51', 1, NULL, 3, 0, 0, 250000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 01:23:51', '2021-08-21 07:19:43'),
	(30, NULL, 'TICKET2021000030', '2021-08-21 01:27:43', 1, NULL, 3, 0, 0, 560000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 01:27:43', '2021-08-21 07:29:32'),
	(31, NULL, 'TICKET2021000031', '2021-08-21 01:30:01', 1, NULL, 3, 0, 0, 150000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 01:30:01', '2021-08-21 07:10:15'),
	(32, NULL, 'TICKET2021000032', '2021-08-21 01:31:46', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:31:46', '2021-08-21 11:52:29'),
	(33, NULL, 'TICKET2021000033', '2021-08-21 01:33:20', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:33:20', '2021-08-21 11:52:42'),
	(34, NULL, 'TICKET2021000034', '2021-08-21 01:36:56', 1, NULL, 3, 0, 0, 30000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:36:56', '2021-08-21 11:52:52'),
	(35, NULL, 'TICKET2021000035', '2021-08-21 01:39:29', 1, NULL, 3, 0, 0, 270000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:39:29', '2021-08-21 11:53:03'),
	(36, NULL, 'TICKET2021000036', '2021-08-21 01:40:24', 1, NULL, 3, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:40:24', '2021-08-21 11:53:16'),
	(37, NULL, 'TICKET2021000037', '2021-08-21 01:41:15', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:41:15', '2021-08-21 11:53:37'),
	(38, NULL, 'TICKET2021000038', '2021-08-21 01:42:13', 1, NULL, 3, 0, 0, 50000, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-21 01:42:13', '2021-08-21 22:58:26'),
	(39, NULL, 'TICKET2021000039', '2021-08-21 01:42:52', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:42:52', '2021-08-21 11:54:18'),
	(40, NULL, 'TICKET2021000040', '2021-08-21 01:45:10', 1, NULL, 3, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 01:45:10', '2021-08-21 07:20:48'),
	(41, NULL, 'TICKET2021000041', '2021-08-21 01:45:51', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:45:51', '2021-08-21 11:54:33'),
	(42, NULL, 'TICKET2021000042', '2021-08-21 01:47:04', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 01:47:04', '2021-08-21 07:07:47'),
	(43, NULL, 'TICKET2021000043', '2021-08-21 01:47:57', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:47:57', '2021-08-21 11:54:52'),
	(44, NULL, 'TICKET2021000044', '2021-08-21 01:49:15', 1, NULL, 3, 0, 0, 150000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 01:49:15', '2021-08-21 07:09:31'),
	(45, NULL, 'TICKET2021000045', '2021-08-21 01:50:11', 1, NULL, 3, 0, 0, 150000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 01:50:11', '2021-08-21 07:22:01'),
	(46, NULL, 'TICKET2021000046', '2021-08-21 01:52:26', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:52:26', '2021-08-21 11:55:07'),
	(47, NULL, 'TICKET2021000047', '2021-08-21 01:53:24', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:53:24', '2021-08-21 11:56:11'),
	(48, NULL, 'TICKET2021000048', '2021-08-21 01:54:03', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:54:03', '2021-08-21 11:56:27'),
	(49, NULL, 'TICKET2021000049', '2021-08-21 01:54:57', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:54:57', '2021-08-21 12:02:44'),
	(50, NULL, 'TICKET2021000050', '2021-08-21 01:55:37', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:55:37', '2021-08-21 12:02:23'),
	(51, NULL, 'TICKET2021000051', '2021-08-21 01:56:44', 1, NULL, 3, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:56:44', '2021-08-21 11:23:39'),
	(52, NULL, 'TICKET2021000052', '2021-08-21 01:57:29', 1, NULL, 3, 0, 0, 50000, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-21 01:57:29', '2021-08-21 23:03:23'),
	(53, NULL, 'TICKET2021000053', '2021-08-21 01:58:26', 1, NULL, 3, 0, 0, 15000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 01:58:26', '2021-08-21 12:01:37'),
	(54, NULL, 'TICKET2021000054', '2021-08-21 02:00:22', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:00:22', '2021-08-21 12:01:13'),
	(55, NULL, 'TICKET2021000055', '2021-08-21 02:01:09', 1, NULL, 3, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:01:09', '2021-08-21 12:00:55'),
	(56, NULL, 'TICKET2021000056', '2021-08-21 02:04:29', 1, NULL, 3, 0, 0, 240000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:04:29', '2021-08-21 12:00:32'),
	(57, NULL, 'TICKET2021000057', '2021-08-21 02:07:17', 1, NULL, 3, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:07:17', '2021-08-21 12:00:19'),
	(58, NULL, 'TICKET2021000058', '2021-08-21 02:08:08', 1, NULL, 3, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:08:08', '2021-08-21 11:59:50'),
	(59, NULL, 'TICKET2021000059', '2021-08-21 02:10:47', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:10:47', '2021-08-21 11:57:06'),
	(60, NULL, 'TICKET2021000060', '2021-08-21 02:12:50', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:12:50', '2021-08-21 12:09:30'),
	(61, NULL, 'TICKET2021000061', '2021-08-21 02:13:30', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:13:30', '2021-08-21 12:09:19'),
	(62, NULL, 'TICKET2021000062', '2021-08-21 02:14:13', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:14:13', '2021-08-21 12:09:05'),
	(63, NULL, 'TICKET2021000063', '2021-08-21 02:16:16', 1, NULL, 3, 0, 0, 150000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 02:16:16', '2021-08-21 07:32:16'),
	(64, NULL, 'TICKET2021000064', '2021-08-21 02:17:02', 1, NULL, 3, 0, 0, 770000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:17:02', '2021-08-21 12:08:43'),
	(65, NULL, 'TICKET2021000065', '2021-08-21 02:17:48', 1, NULL, 3, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:17:48', '2021-08-21 12:08:30'),
	(66, NULL, 'TICKET2021000066', '2021-08-21 02:18:55', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:18:55', '2021-08-21 12:08:17'),
	(67, NULL, 'TICKET2021000067', '2021-08-21 02:19:53', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 02:19:53', '2021-08-21 06:53:35'),
	(68, NULL, 'TICKET2021000068', '2021-08-21 02:24:34', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:24:34', '2021-08-21 12:08:01'),
	(69, NULL, 'TICKET2021000069', '2021-08-21 02:25:24', 1, NULL, 3, 0, 0, 300000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:25:24', '2021-08-21 12:12:07'),
	(70, NULL, 'TICKET2021000070', '2021-08-21 02:26:29', 1, NULL, 3, 0, 0, 300000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:26:29', '2021-08-21 12:11:50'),
	(71, NULL, 'TICKET2021000071', '2021-08-21 02:27:28', 1, NULL, 3, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:27:28', '2021-08-21 12:11:36'),
	(72, NULL, 'TICKET2021000072', '2021-08-21 02:35:09', 1, NULL, 3, 0, 0, 140000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 02:35:09', '2021-08-21 07:25:23'),
	(73, NULL, 'TICKET2021000073', '2021-08-21 02:36:16', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:36:16', '2021-08-21 12:11:25'),
	(74, NULL, 'TICKET2021000074', '2021-08-21 02:39:29', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:39:29', '2021-08-21 12:11:14'),
	(75, NULL, 'TICKET2021000075', '2021-08-21 02:40:15', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:40:15', '2021-08-21 12:10:58'),
	(76, NULL, 'TICKET2021000076', '2021-08-21 02:41:02', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:41:02', '2021-08-21 12:10:28'),
	(77, NULL, 'TICKET2021000077', '2021-08-21 02:42:05', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 02:42:05', '2021-08-21 06:56:03'),
	(78, NULL, 'TICKET2021000078', '2021-08-21 02:42:43', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:42:43', '2021-08-21 12:10:06'),
	(79, NULL, 'TICKET2021000079', '2021-08-21 02:45:34', 1, NULL, 3, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:45:34', '2021-08-21 12:09:51'),
	(80, NULL, 'TICKET2021000080', '2021-08-21 02:47:00', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:47:00', '2021-08-21 12:03:30'),
	(81, NULL, 'TICKET2021000081', '2021-08-21 02:47:59', 1, NULL, 3, 0, 0, 140000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:47:59', '2021-08-21 12:03:17'),
	(82, NULL, 'TICKET2021000082', '2021-08-21 02:49:25', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:49:25', '2021-08-21 12:03:02'),
	(83, NULL, 'TICKET2021000083', '2021-08-21 02:50:45', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:50:45', '2021-08-21 11:43:04'),
	(84, NULL, 'TICKET2021000084', '2021-08-21 02:51:29', 1, NULL, 3, 0, 0, 210000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:51:29', '2021-08-21 11:42:44'),
	(85, NULL, 'TICKET2021000085', '2021-08-21 02:53:18', 1, NULL, 3, 0, 0, 15000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 02:53:18', '2021-08-21 11:42:29'),
	(86, NULL, 'TICKET2021000086', '2021-08-21 02:59:40', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 02:59:40', '2021-08-21 07:17:49'),
	(87, NULL, 'TICKET2021000087', '2021-08-21 03:03:26', 1, NULL, 3, 0, 0, 50000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 03:03:26', '2021-08-21 03:21:26'),
	(88, NULL, 'TICKET2021000088', '2021-08-21 03:06:53', 1, NULL, 3, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:06:53', '2021-08-21 11:42:18'),
	(89, NULL, 'TICKET2021000089', '2021-08-21 03:08:47', 1, NULL, 3, 0, 0, 140000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 03:08:47', '2021-08-21 07:15:11'),
	(90, NULL, 'TICKET2021000090', '2021-08-21 03:09:36', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 03:09:36', '2021-08-21 06:52:29'),
	(91, NULL, 'TICKET2021000091', '2021-08-21 03:11:27', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:11:27', '2021-08-21 11:42:07'),
	(92, NULL, 'TICKET2021000092', '2021-08-21 03:12:15', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:12:15', '2021-08-21 11:41:43'),
	(93, NULL, 'TICKET2021000093', '2021-08-21 03:13:32', 1, NULL, 3, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:13:32', '2021-08-21 11:41:26'),
	(94, NULL, 'TICKET2021000094', '2021-08-21 03:14:26', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:14:26', '2021-08-21 11:41:01'),
	(95, NULL, 'TICKET2021000095', '2021-08-21 03:15:10', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:15:10', '2021-08-21 11:40:41'),
	(96, NULL, 'TICKET2021000096', '2021-08-21 03:16:11', 1, NULL, 3, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:16:11', '2021-08-21 11:40:26'),
	(97, NULL, 'TICKET2021000097', '2021-08-21 03:16:56', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:16:56', '2021-08-21 11:40:13'),
	(98, NULL, 'TICKET2021000098', '2021-08-21 03:17:53', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:17:53', '2021-08-21 11:40:02'),
	(99, NULL, 'TICKET2021000099', '2021-08-21 03:18:36', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 03:18:36', '2021-08-21 07:30:42'),
	(100, NULL, 'TICKET2021000100', '2021-08-21 03:19:49', 1, NULL, 3, 0, 0, 30000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:19:49', '2021-08-21 11:39:42'),
	(101, NULL, 'TICKET2021000101', '2021-08-21 03:22:34', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:22:34', '2021-08-21 11:39:22'),
	(102, NULL, 'TICKET2021000102', '2021-08-21 03:23:49', 1, NULL, 3, 0, 0, 140000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 03:23:49', '2021-08-21 06:50:58'),
	(103, NULL, 'TICKET2021000103', '2021-08-21 03:24:53', 1, NULL, 3, 0, 0, 210000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 03:24:53', '2021-08-21 07:21:19'),
	(104, NULL, 'TICKET2021000104', '2021-08-21 03:25:52', 1, NULL, 3, 0, 0, 20000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:25:52', '2021-08-21 11:39:00'),
	(105, NULL, 'TICKET2021000105', '2021-08-21 03:26:46', 1, NULL, 3, 0, 0, 40000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:26:46', '2021-08-21 11:38:45'),
	(106, NULL, 'TICKET2021000106', '2021-08-21 03:28:36', 1, NULL, 3, 0, 0, 50000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 03:28:36', '2021-08-21 06:58:26'),
	(107, NULL, 'TICKET2021000107', '2021-08-21 03:29:14', 1, NULL, 3, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 03:29:14', '2021-08-21 06:59:28'),
	(108, NULL, 'TICKET2021000108', '2021-08-21 03:31:46', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:31:46', '2021-08-21 11:38:33'),
	(109, NULL, 'TICKET2021000109', '2021-08-21 03:32:31', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 03:32:31', '2021-08-21 06:48:53'),
	(110, NULL, 'TICKET2021000110', '2021-08-21 03:33:15', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:33:15', '2021-08-21 11:38:22'),
	(111, NULL, 'TICKET2021000111', '2021-08-21 03:34:03', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 03:34:03', '2021-08-21 07:24:54'),
	(112, NULL, 'TICKET2021000112', '2021-08-21 03:34:53', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 03:34:53', '2021-08-21 07:02:10'),
	(113, NULL, 'TICKET2021000113', '2021-08-21 03:35:53', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:35:53', '2021-08-21 11:37:41'),
	(114, NULL, 'TICKET2021000114', '2021-08-21 03:37:23', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:37:23', '2021-08-21 11:37:25'),
	(115, NULL, 'TICKET2021000115', '2021-08-21 03:38:16', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:38:16', '2021-08-21 11:37:11'),
	(116, NULL, 'TICKET2021000116', '2021-08-21 03:43:39', 1, NULL, 3, 0, 0, 200000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:43:39', '2021-08-21 11:36:53'),
	(117, NULL, 'TICKET2021000117', '2021-08-21 03:44:28', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:44:28', '2021-08-21 11:36:39'),
	(118, NULL, 'TICKET2021000118', '2021-08-21 03:45:18', 1, NULL, 3, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:45:18', '2021-08-21 11:36:27'),
	(119, NULL, 'TICKET2021000119', '2021-08-21 03:46:16', 1, NULL, 3, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:46:16', '2021-08-21 11:36:14'),
	(120, NULL, 'TICKET2021000120', '2021-08-21 03:47:53', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:47:53', '2021-08-21 11:34:13'),
	(121, NULL, 'TICKET2021000121', '2021-08-21 03:48:42', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:48:42', '2021-08-21 11:33:56'),
	(122, NULL, 'TICKET2021000122', '2021-08-21 03:49:43', 1, NULL, 3, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 03:49:43', '2021-08-21 06:51:45'),
	(123, NULL, 'TICKET2021000123', '2021-08-21 03:50:37', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 03:50:37', '2021-08-21 07:04:57'),
	(124, NULL, 'TICKET2021000124', '2021-08-21 03:51:26', 1, NULL, 3, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:51:26', '2021-08-21 11:33:39'),
	(125, NULL, 'TICKET2021000125', '2021-08-21 03:52:21', 1, NULL, 3, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 03:52:21', '2021-08-21 11:33:25'),
	(126, NULL, 'TICKET2021000126', '2021-08-21 03:56:38', 1, NULL, 3, 0, 0, 160000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 03:56:38', '2021-08-21 06:57:24'),
	(127, NULL, 'TICKET2021000127', '2021-08-21 04:05:27', 1, NULL, 3, 0, 0, 20000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 04:05:27', '2021-08-21 11:33:12'),
	(128, NULL, 'TICKET2021000128', '2021-08-21 04:06:23', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 04:06:23', '2021-08-21 07:33:11'),
	(129, NULL, 'TICKET2021000129', '2021-08-21 04:08:08', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 04:08:08', '2021-08-21 07:28:36'),
	(130, NULL, 'TICKET2021000130', '2021-08-21 04:10:21', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 04:10:21', '2021-08-21 11:32:55'),
	(131, NULL, 'TICKET2021000131', '2021-08-21 04:11:08', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 04:11:08', '2021-08-21 11:32:29'),
	(132, NULL, 'TICKET2021000132', '2021-08-21 04:11:49', 1, NULL, 3, 0, 0, 150000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 04:11:49', '2021-08-21 07:26:38'),
	(133, NULL, 'TICKET2021000133', '2021-08-21 04:12:55', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 04:12:55', '2021-08-21 07:27:42'),
	(134, NULL, 'TICKET2021000134', '2021-08-21 04:13:58', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 04:13:58', '2021-08-21 07:03:43'),
	(135, NULL, 'TICKET2021000135', '2021-08-21 04:17:16', 1, NULL, 3, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 04:17:16', '2021-08-21 11:32:12'),
	(136, NULL, 'TICKET2021000136', '2021-08-21 04:18:01', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 04:18:01', '2021-08-21 11:30:14'),
	(137, NULL, 'TICKET2021000137', '2021-08-21 04:18:57', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 04:18:57', '2021-08-21 06:45:40'),
	(138, NULL, 'TICKET2021000138', '2021-08-21 04:19:57', 1, NULL, 3, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 04:19:57', '2021-08-21 11:30:04'),
	(139, NULL, 'TICKET2021000139', '2021-08-21 04:21:03', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 04:21:03', '2021-08-21 07:04:05'),
	(140, NULL, 'TICKET2021000140', '2021-08-21 04:26:44', 1, NULL, 3, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-21 04:26:44', '2021-08-21 04:26:44'),
	(141, NULL, 'TICKET2021000141', '2021-08-21 04:27:40', 1, NULL, 3, 0, 0, 40000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 04:27:40', '2021-08-21 11:29:53'),
	(142, NULL, 'TICKET2021000142', '2021-08-21 04:28:55', 1, NULL, 3, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 04:28:55', '2021-08-21 11:29:38'),
	(143, NULL, 'TICKET2021000143', '2021-08-21 04:29:38', 1, NULL, 3, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 04:29:38', '2021-08-21 11:29:25'),
	(144, NULL, 'TICKET2021000144', '2021-08-21 04:30:42', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 04:30:42', '2021-08-21 11:29:11'),
	(145, NULL, 'TICKET2021000145', '2021-08-21 04:33:57', 1, NULL, 3, 0, 0, 160000, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-21 04:33:57', '2021-08-21 22:55:04'),
	(146, NULL, 'TICKET2021000146', '2021-08-21 04:34:54', 1, NULL, 3, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 04:34:54', '2021-08-21 11:28:43'),
	(147, NULL, 'TICKET2021000147', '2021-08-21 04:35:36', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 04:35:36', '2021-08-21 11:28:30'),
	(148, NULL, 'TICKET2021000148', '2021-08-21 04:37:57', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 04:37:57', '2021-08-21 07:00:45'),
	(149, NULL, 'TICKET2021000149', '2021-08-21 04:44:31', 1, NULL, 3, 0, 0, 250000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 04:44:31', '2021-08-21 11:28:18'),
	(150, NULL, 'TICKET2021000150', '2021-08-21 04:49:26', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 04:49:26', '2021-08-21 06:54:01'),
	(151, NULL, 'TICKET2021000151', '2021-08-21 04:51:04', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 04:51:04', '2021-08-21 06:54:28'),
	(152, NULL, 'TICKET2021000152', '2021-08-21 04:53:28', 1, NULL, 3, 0, 0, 500000, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-21 04:53:28', '2021-08-21 22:52:44'),
	(153, NULL, 'TICKET2021000153', '2021-08-21 05:05:08', 1, NULL, 3, 0, 0, 750000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 05:05:08', '2021-08-21 11:27:51'),
	(154, NULL, 'TICKET2021000154', '2021-08-21 05:06:53', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 05:06:53', '2021-08-21 11:27:19'),
	(155, NULL, 'TICKET2021000155', '2021-08-21 05:07:41', 1, NULL, 3, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 05:07:41', '2021-08-21 07:15:39'),
	(156, NULL, 'TICKET2021000156', '2021-08-21 05:23:16', 1, NULL, 3, 0, 0, 500000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 05:23:16', '2021-08-21 11:27:04'),
	(157, NULL, 'TICKET2021000157', '2021-08-21 05:25:09', 1, NULL, 3, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-21 05:25:09', '2021-08-21 22:49:23'),
	(158, NULL, 'TICKET2021000158', '2021-08-21 05:25:56', 1, NULL, 3, 0, 0, 50000, 1, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-21 05:25:56', '2021-08-21 23:01:48'),
	(159, NULL, 'TICKET2021000159', '2021-08-21 05:27:10', 1, NULL, 3, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 05:27:10', '2021-08-21 07:25:56'),
	(160, NULL, 'TICKET2021000160', '2021-08-21 05:28:52', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 05:28:52', '2021-08-21 11:26:19'),
	(161, NULL, 'TICKET2021000161', '2021-08-21 05:29:57', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 05:29:57', '2021-08-21 06:49:17'),
	(162, NULL, 'TICKET2021000162', '2021-08-21 05:40:01', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 05:40:01', '2021-08-21 11:26:04'),
	(163, NULL, 'TICKET2021000163', '2021-08-21 05:40:57', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 05:40:57', '2021-08-21 11:25:47'),
	(164, NULL, 'TICKET2021000164', '2021-08-21 05:45:22', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 05:45:22', '2021-08-21 22:28:08'),
	(165, NULL, 'TICKET2021000165', '2021-08-21 06:20:31', 1, NULL, 3, 0, 0, 250000, NULL, 0, 0, 0, NULL, NULL, 5, 7, '2021-08-21 06:20:31', '2021-08-21 11:25:28'),
	(166, '000166', NULL, '2021-08-21 15:51:43', 1, 6, NULL, 0, 0, 0, NULL, 0, 0, 0, NULL, NULL, 16, 5, '2021-08-21 12:18:20', '2021-08-23 15:51:43'),
	(167, '000167', NULL, '2021-08-21 12:20:45', 1, 1, NULL, 0, 0, 0, NULL, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 12:20:45', '2021-08-21 12:20:45'),
	(168, '000168', NULL, '2021-08-21 12:22:27', 1, 3, NULL, 0, 0, 0, NULL, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 12:22:27', '2021-08-21 12:22:27'),
	(169, '000169', NULL, '2021-08-21 12:23:27', 1, 5, NULL, 0, 0, 0, NULL, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 12:23:27', '2021-08-21 12:23:27'),
	(170, '000170', NULL, '2021-08-21 12:24:22', 1, 4, NULL, 75000, 0, 0, NULL, 0, 0, 0, NULL, NULL, NULL, 5, '2021-08-21 12:24:22', '2021-08-21 12:28:03'),
	(171, '000171', NULL, '2021-08-21 15:53:59', 1, 2, NULL, 0, 0, 0, NULL, 0, 0, 0, NULL, NULL, 16, 5, '2021-08-21 12:26:01', '2021-08-23 15:53:59'),
	(172, NULL, 'TICKET2021000172', '2021-08-21 23:48:56', 1, NULL, 4, 0, 0, 20000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-21 23:48:56', '2021-08-21 23:52:00'),
	(173, NULL, 'TICKET2021000173', '2021-08-22 00:10:47', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, 7, 7, '2021-08-22 00:10:47', '2021-08-22 00:12:11'),
	(174, NULL, 'TICKET2021000174', '2021-08-22 00:20:44', 1, NULL, 4, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:20:44', '2021-08-22 00:20:44'),
	(175, NULL, 'TICKET2021000175', '2021-08-22 00:22:48', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:22:48', '2021-08-22 00:22:48'),
	(176, NULL, 'TICKET2021000176', '2021-08-22 00:26:27', 1, NULL, 4, 0, 0, 80000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:26:27', '2021-08-22 00:26:27'),
	(177, NULL, 'TICKET2021000177', '2021-08-22 00:27:25', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:27:25', '2021-08-22 00:27:25'),
	(178, NULL, 'TICKET2021000178', '2021-08-22 00:28:06', 1, NULL, 4, 0, 0, 50000, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-22 00:28:06', '2021-08-23 15:13:52'),
	(179, NULL, 'TICKET2021000179', '2021-08-22 00:28:45', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:28:45', '2021-08-22 00:28:45'),
	(180, NULL, 'TICKET2021000180', '2021-08-22 00:29:20', 1, NULL, 4, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:29:20', '2021-08-22 00:29:20'),
	(181, NULL, 'TICKET2021000181', '2021-08-22 00:30:06', 1, NULL, 4, 0, 0, 250000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:30:06', '2021-08-22 00:30:06'),
	(182, NULL, 'TICKET2021000182', '2021-08-22 00:30:42', 1, NULL, 4, 0, 0, 80000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:30:42', '2021-08-22 00:30:42'),
	(183, NULL, 'TICKET2021000183', '2021-08-22 00:31:18', 1, NULL, 5, 0, 0, 20000, NULL, 0, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 00:31:18', '2021-08-22 00:31:18'),
	(184, NULL, 'TICKET2021000184', '2021-08-22 00:31:59', 1, NULL, 4, 0, 0, 80000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:31:59', '2021-08-22 00:31:59'),
	(185, NULL, 'TICKET2021000185', '2021-08-22 00:32:58', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:32:58', '2021-08-22 00:32:58'),
	(186, NULL, 'TICKET2021000186', '2021-08-22 00:33:43', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:33:43', '2021-08-22 00:33:43'),
	(187, NULL, 'TICKET2021000187', '2021-08-22 00:34:31', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:34:31', '2021-08-22 00:34:31'),
	(188, NULL, 'TICKET2021000188', '2021-08-22 00:35:08', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:35:08', '2021-08-22 00:35:08'),
	(189, NULL, 'TICKET2021000189', '2021-08-22 00:39:04', 1, NULL, 4, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:39:04', '2021-08-22 00:39:04'),
	(190, NULL, 'TICKET2021000190', '2021-08-22 00:40:04', 1, NULL, 4, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:40:04', '2021-08-22 00:40:04'),
	(191, NULL, 'TICKET2021000191', '2021-08-22 00:40:44', 1, NULL, 4, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:40:44', '2021-08-22 00:40:44'),
	(192, NULL, 'TICKET2021000192', '2021-08-22 00:41:21', 1, NULL, 4, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:41:21', '2021-08-22 00:41:21'),
	(193, NULL, 'TICKET2021000193', '2021-08-22 00:42:11', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:42:11', '2021-08-22 00:42:11'),
	(194, NULL, 'TICKET2021000194', '2021-08-22 00:43:04', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:43:04', '2021-08-22 00:43:04'),
	(195, NULL, 'TICKET2021000195', '2021-08-22 00:43:54', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:43:54', '2021-08-22 00:43:54'),
	(196, NULL, 'TICKET2021000196', '2021-08-22 00:44:33', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:44:33', '2021-08-22 00:44:33'),
	(197, NULL, 'TICKET2021000197', '2021-08-22 00:45:24', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:45:24', '2021-08-22 00:45:24'),
	(198, NULL, 'TICKET2021000198', '2021-08-22 00:46:02', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:46:02', '2021-08-22 00:46:02'),
	(199, NULL, 'TICKET2021000199', '2021-08-22 00:53:26', 1, NULL, 5, 0, 0, 140000, NULL, 0, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 00:53:26', '2021-08-22 00:53:26'),
	(200, NULL, 'TICKET2021000200', '2021-08-22 00:56:28', 1, NULL, 5, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 00:56:28', '2021-08-22 00:56:28'),
	(201, NULL, 'TICKET2021000201', '2021-08-22 00:56:57', 1, NULL, 4, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:56:57', '2021-08-22 00:56:57'),
	(202, NULL, 'TICKET2021000202', '2021-08-22 00:57:38', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:57:38', '2021-08-22 00:57:38'),
	(203, NULL, 'TICKET2021000203', '2021-08-22 00:58:28', 1, NULL, 4, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:58:28', '2021-08-22 00:58:28'),
	(204, NULL, 'TICKET2021000204', '2021-08-22 00:59:04', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 00:59:04', '2021-08-22 00:59:04'),
	(205, NULL, 'TICKET2021000205', '2021-08-22 01:01:09', 1, NULL, 4, 0, 0, 450000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:01:09', '2021-08-22 01:01:09'),
	(206, NULL, 'TICKET2021000206', '2021-08-22 01:01:53', 1, NULL, 4, 0, 0, 210000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:01:53', '2021-08-22 01:01:53'),
	(207, NULL, 'TICKET2021000207', '2021-08-22 01:03:09', 1, NULL, 4, 0, 0, 480000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:03:09', '2021-08-22 01:03:09'),
	(208, NULL, 'TICKET2021000208', '2021-08-22 01:03:49', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:03:49', '2021-08-22 01:03:49'),
	(209, NULL, 'TICKET2021000209', '2021-08-22 01:04:21', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:04:21', '2021-08-22 01:04:21'),
	(210, NULL, 'TICKET2021000210', '2021-08-22 01:10:18', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:10:18', '2021-08-22 01:10:18'),
	(211, NULL, 'TICKET2021000211', '2021-08-22 01:11:11', 1, NULL, 4, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:11:11', '2021-08-22 01:11:11'),
	(212, NULL, 'TICKET2021000212', '2021-08-22 01:11:58', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:11:58', '2021-08-22 01:11:58'),
	(213, NULL, 'TICKET2021000213', '2021-08-22 01:12:42', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:12:42', '2021-08-22 01:12:42'),
	(214, NULL, 'TICKET2021000214', '2021-08-22 01:13:16', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:13:16', '2021-08-22 01:13:16'),
	(215, NULL, 'TICKET2021000215', '2021-08-22 01:13:59', 1, NULL, 4, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:13:59', '2021-08-22 01:13:59'),
	(216, NULL, 'TICKET2021000216', '2021-08-22 01:14:35', 1, NULL, 4, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:14:35', '2021-08-22 01:14:35'),
	(217, NULL, 'TICKET2021000217', '2021-08-22 01:15:36', 1, NULL, 4, 0, 0, 30000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:15:36', '2021-08-22 01:15:36'),
	(218, NULL, 'TICKET2021000218', '2021-08-22 01:17:28', 1, NULL, 4, 0, 0, 3300000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:17:28', '2021-08-22 01:17:28'),
	(219, NULL, 'TICKET2021000219', '2021-08-22 01:18:15', 1, NULL, 4, 0, 0, 180000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:18:15', '2021-08-22 01:18:15'),
	(220, NULL, 'TICKET2021000220', '2021-08-22 01:19:43', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:19:43', '2021-08-22 01:19:43'),
	(221, NULL, 'TICKET2021000221', '2021-08-22 01:20:46', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:20:46', '2021-08-22 01:20:46'),
	(222, NULL, 'TICKET2021000222', '2021-08-22 01:21:28', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:21:28', '2021-08-22 01:21:28'),
	(223, NULL, 'TICKET2021000223', '2021-08-22 01:22:17', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:22:17', '2021-08-22 01:22:17'),
	(224, NULL, 'TICKET2021000224', '2021-08-22 01:23:20', 1, NULL, 4, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:23:20', '2021-08-22 01:23:20'),
	(225, NULL, 'TICKET2021000225', '2021-08-22 01:24:04', 1, NULL, 4, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:24:04', '2021-08-22 01:24:04'),
	(226, NULL, 'TICKET2021000226', '2021-08-22 01:24:59', 1, NULL, 4, 0, 0, 140000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:24:59', '2021-08-22 01:24:59'),
	(227, NULL, 'TICKET2021000227', '2021-08-22 01:26:03', 1, NULL, 4, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:26:03', '2021-08-22 01:26:03'),
	(228, NULL, 'TICKET2021000228', '2021-08-22 01:26:45', 1, NULL, 4, 0, 0, 0, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-22 01:26:45', '2021-08-23 15:37:56'),
	(229, NULL, 'TICKET2021000229', '2021-08-22 01:28:19', 1, NULL, 4, 0, 0, 140000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:28:19', '2021-08-22 01:28:19'),
	(230, NULL, 'TICKET2021000230', '2021-08-22 01:29:11', 1, NULL, 4, 0, 0, 240000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:29:11', '2021-08-22 01:29:11'),
	(231, NULL, 'TICKET2021000231', '2021-08-22 01:31:28', 1, NULL, 4, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:31:28', '2021-08-22 01:31:28'),
	(232, NULL, 'TICKET2021000232', '2021-08-22 01:32:11', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:32:11', '2021-08-22 01:32:11'),
	(233, NULL, 'TICKET2021000233', '2021-08-22 01:34:49', 1, NULL, 4, 0, 0, 90000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:34:49', '2021-08-22 01:34:49'),
	(234, NULL, 'TICKET2021000234', '2021-08-22 01:39:10', 1, NULL, 5, 0, 0, 20000, NULL, 0, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 01:39:10', '2021-08-22 01:39:10'),
	(235, NULL, 'TICKET2021000235', '2021-08-22 01:40:34', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:40:34', '2021-08-22 01:40:34'),
	(236, NULL, 'TICKET2021000236', '2021-08-22 01:41:37', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:41:37', '2021-08-22 01:41:37'),
	(237, NULL, 'TICKET2021000237', '2021-08-22 01:42:56', 1, NULL, 4, 0, 0, 25000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:42:56', '2021-08-22 01:42:56'),
	(238, NULL, 'TICKET2021000238', '2021-08-22 01:44:39', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:44:39', '2021-08-22 01:44:39'),
	(239, NULL, 'TICKET2021000239', '2021-08-22 01:46:56', 1, NULL, 5, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 01:46:56', '2021-08-22 01:46:56'),
	(240, NULL, 'TICKET2021000240', '2021-08-22 01:52:11', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:52:11', '2021-08-22 01:52:11'),
	(241, NULL, 'TICKET2021000241', '2021-08-22 01:53:08', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:53:08', '2021-08-22 01:53:08'),
	(242, NULL, 'TICKET2021000242', '2021-08-22 01:56:09', 1, NULL, 4, 0, 0, 15000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 01:56:09', '2021-08-22 01:56:09'),
	(243, NULL, 'TICKET2021000243', '2021-08-22 02:02:02', 1, NULL, 4, 0, 0, 360000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:02:02', '2021-08-22 02:02:02'),
	(244, NULL, 'TICKET2021000244', '2021-08-22 02:02:50', 1, NULL, 4, 0, 0, 0, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-22 02:02:50', '2021-08-23 15:40:53'),
	(245, NULL, 'TICKET2021000245', '2021-08-22 02:03:40', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:03:40', '2021-08-22 02:03:40'),
	(246, NULL, 'TICKET2021000246', '2021-08-22 02:05:33', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:05:33', '2021-08-22 02:05:33'),
	(247, NULL, 'TICKET2021000247', '2021-08-22 02:06:06', 1, NULL, 5, 0, 0, 20000, NULL, 0, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:06:06', '2021-08-22 02:06:06'),
	(248, NULL, 'TICKET2021000248', '2021-08-22 02:06:42', 1, NULL, 4, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:06:42', '2021-08-22 02:06:42'),
	(249, NULL, 'TICKET2021000249', '2021-08-22 02:08:04', 1, NULL, 5, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:08:04', '2021-08-22 02:08:04'),
	(250, NULL, 'TICKET2021000250', '2021-08-22 02:09:45', 1, NULL, 4, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:09:45', '2021-08-22 02:09:45'),
	(251, NULL, 'TICKET2021000251', '2021-08-22 02:16:58', 1, NULL, 5, 0, 0, 40000, NULL, 0, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:16:58', '2021-08-22 02:16:58'),
	(252, NULL, 'TICKET2021000252', '2021-08-22 02:17:42', 1, NULL, 5, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:17:42', '2021-08-22 02:17:42'),
	(253, NULL, 'TICKET2021000253', '2021-08-22 02:22:07', 1, NULL, 5, 0, 0, 20000, NULL, 0, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:22:07', '2021-08-22 02:22:07'),
	(254, NULL, 'TICKET2021000254', '2021-08-22 02:22:31', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:22:31', '2021-08-22 02:22:31'),
	(255, NULL, 'TICKET2021000255', '2021-08-22 02:23:09', 1, NULL, 5, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:23:09', '2021-08-22 02:23:09'),
	(256, NULL, 'TICKET2021000256', '2021-08-22 02:23:12', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:23:12', '2021-08-22 02:23:12'),
	(257, NULL, 'TICKET2021000257', '2021-08-22 02:24:08', 1, NULL, 4, 0, 0, 6000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:24:08', '2021-08-22 02:24:08'),
	(258, NULL, 'TICKET2021000258', '2021-08-22 02:24:42', 1, NULL, 5, 0, 0, 20000, NULL, 0, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:24:42', '2021-08-22 02:24:42'),
	(259, NULL, 'TICKET2021000259', '2021-08-22 02:25:16', 1, NULL, 5, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:25:16', '2021-08-22 02:25:16'),
	(260, NULL, 'TICKET2021000260', '2021-08-22 02:25:45', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:25:45', '2021-08-22 02:25:45'),
	(261, NULL, 'TICKET2021000261', '2021-08-22 02:26:34', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:26:34', '2021-08-22 02:26:34'),
	(262, NULL, 'TICKET2021000262', '2021-08-22 02:29:11', 1, NULL, 5, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:29:11', '2021-08-22 02:29:11'),
	(263, NULL, 'TICKET2021000263', '2021-08-22 02:29:37', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:29:37', '2021-08-22 02:29:37'),
	(264, NULL, 'TICKET2021000264', '2021-08-22 02:30:19', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:30:19', '2021-08-22 02:30:19'),
	(265, NULL, 'TICKET2021000265', '2021-08-22 02:30:27', 1, NULL, 5, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 19, '2021-08-22 02:30:27', '2021-08-22 02:30:27'),
	(266, NULL, 'TICKET2021000266', '2021-08-22 02:31:05', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:31:05', '2021-08-22 02:31:05'),
	(267, NULL, 'TICKET2021000267', '2021-08-22 02:32:11', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:32:11', '2021-08-22 02:32:11'),
	(268, NULL, 'TICKET2021000268', '2021-08-22 02:35:46', 1, NULL, 4, 0, 0, 110000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:35:46', '2021-08-22 02:35:46'),
	(269, NULL, 'TICKET2021000269', '2021-08-22 02:36:32', 1, NULL, 4, 0, 0, 300000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:36:32', '2021-08-22 02:36:32'),
	(270, NULL, 'TICKET2021000270', '2021-08-22 02:37:11', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:37:11', '2021-08-22 02:37:11'),
	(271, NULL, 'TICKET2021000271', '2021-08-22 02:40:11', 1, NULL, 4, 0, 0, 90000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:40:11', '2021-08-22 02:40:11'),
	(272, NULL, 'TICKET2021000272', '2021-08-22 02:40:56', 1, NULL, 4, 0, 0, 90000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:40:56', '2021-08-22 02:40:56'),
	(273, NULL, 'TICKET2021000273', '2021-08-22 02:41:56', 1, NULL, 4, 0, 0, 90000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:41:56', '2021-08-22 02:41:56'),
	(274, NULL, 'TICKET2021000274', '2021-08-22 02:42:37', 1, NULL, 4, 0, 0, 90000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:42:37', '2021-08-22 02:42:37'),
	(275, NULL, 'TICKET2021000275', '2021-08-22 02:44:08', 1, NULL, 4, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:44:08', '2021-08-22 02:44:08'),
	(276, NULL, 'TICKET2021000276', '2021-08-22 02:46:50', 1, NULL, 4, 0, 0, 0, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-22 02:46:50', '2021-08-23 15:41:55'),
	(277, NULL, 'TICKET2021000277', '2021-08-22 02:47:28', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:47:28', '2021-08-22 02:47:28'),
	(278, NULL, 'TICKET2021000278', '2021-08-22 02:48:09', 1, NULL, 4, 0, 0, 240000, NULL, 0, 0, 0, NULL, NULL, 17, 7, '2021-08-22 02:48:09', '2021-08-22 02:49:40'),
	(279, NULL, 'TICKET2021000279', '2021-08-22 02:51:45', 1, NULL, 4, 0, 0, 0, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-22 02:51:45', '2021-08-23 15:35:53'),
	(280, NULL, 'TICKET2021000280', '2021-08-22 02:52:30', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:52:30', '2021-08-22 02:52:30'),
	(281, NULL, 'TICKET2021000281', '2021-08-22 02:53:18', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:53:18', '2021-08-22 02:53:18'),
	(282, NULL, 'TICKET2021000282', '2021-08-22 02:53:50', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:53:50', '2021-08-22 02:53:50'),
	(283, NULL, 'TICKET2021000283', '2021-08-22 02:54:29', 1, NULL, 4, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:54:29', '2021-08-22 02:54:29'),
	(284, NULL, 'TICKET2021000284', '2021-08-22 02:55:23', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 02:55:23', '2021-08-22 02:55:23'),
	(285, NULL, 'TICKET2021000285', '2021-08-22 02:56:27', 1, NULL, 4, 0, 0, 110000, NULL, 0, 0, 0, NULL, NULL, 17, 7, '2021-08-22 02:56:27', '2021-08-22 02:58:47'),
	(286, NULL, 'TICKET2021000286', '2021-08-22 03:00:34', 1, NULL, 4, 0, 0, 180000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 03:00:34', '2021-08-22 03:00:34'),
	(287, NULL, 'TICKET2021000287', '2021-08-22 03:01:22', 1, NULL, 4, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 03:01:22', '2021-08-22 03:01:22'),
	(288, NULL, 'TICKET2021000288', '2021-08-22 03:02:09', 1, NULL, 4, 0, 0, 275000, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-22 03:02:09', '2021-08-23 15:28:06'),
	(289, NULL, 'TICKET2021000289', '2021-08-22 03:12:04', 1, NULL, 4, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 03:12:04', '2021-08-22 03:12:04'),
	(290, NULL, 'TICKET2021000290', '2021-08-22 03:13:18', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 03:13:18', '2021-08-22 03:13:18'),
	(291, NULL, 'TICKET2021000291', '2021-08-22 03:16:59', 1, NULL, 4, 0, 0, 250000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 03:16:59', '2021-08-22 03:16:59'),
	(292, NULL, 'TICKET2021000292', '2021-08-22 04:14:27', 1, NULL, 4, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:14:27', '2021-08-22 04:14:27'),
	(293, NULL, 'TICKET2021000293', '2021-08-22 04:15:26', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:15:26', '2021-08-22 04:15:26'),
	(294, NULL, 'TICKET2021000294', '2021-08-22 04:16:14', 1, NULL, 4, 0, 0, 130000, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-22 04:16:14', '2021-08-23 15:20:17'),
	(295, NULL, 'TICKET2021000295', '2021-08-22 04:16:51', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:16:51', '2021-08-22 04:16:51'),
	(296, NULL, 'TICKET2021000296', '2021-08-22 04:17:43', 1, NULL, 4, 0, 0, 6000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:17:43', '2021-08-22 04:17:43'),
	(297, NULL, 'TICKET2021000297', '2021-08-22 04:19:28', 1, NULL, 4, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:19:28', '2021-08-22 04:19:28'),
	(298, NULL, 'TICKET2021000298', '2021-08-22 04:21:00', 1, NULL, 4, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:21:00', '2021-08-22 04:21:00'),
	(299, NULL, 'TICKET2021000299', '2021-08-22 04:21:43', 1, NULL, 4, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:21:43', '2021-08-22 04:21:43'),
	(300, NULL, 'TICKET2021000300', '2021-08-22 04:23:25', 1, NULL, 4, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:23:25', '2021-08-22 04:23:25'),
	(301, NULL, 'TICKET2021000301', '2021-08-22 04:24:08', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:24:08', '2021-08-22 04:24:08'),
	(302, NULL, 'TICKET2021000302', '2021-08-22 04:24:54', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:24:54', '2021-08-22 04:24:54'),
	(303, NULL, 'TICKET2021000303', '2021-08-22 04:25:52', 1, NULL, 4, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:25:52', '2021-08-22 04:25:52'),
	(304, NULL, 'TICKET2021000304', '2021-08-22 04:30:06', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:30:06', '2021-08-22 04:30:06'),
	(305, NULL, 'TICKET2021000305', '2021-08-22 04:35:29', 1, NULL, 4, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:35:29', '2021-08-22 04:35:29'),
	(306, NULL, 'TICKET2021000306', '2021-08-22 04:36:53', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:36:53', '2021-08-22 04:36:53'),
	(307, NULL, 'TICKET2021000307', '2021-08-22 04:38:30', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:38:30', '2021-08-22 04:38:30'),
	(308, NULL, 'TICKET2021000308', '2021-08-22 04:39:42', 1, NULL, 4, 0, 0, 130000, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-22 04:39:42', '2021-08-23 15:23:51'),
	(309, NULL, 'TICKET2021000309', '2021-08-22 04:40:52', 1, NULL, 4, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:40:52', '2021-08-22 04:40:52'),
	(310, NULL, 'TICKET2021000310', '2021-08-22 04:41:56', 1, NULL, 4, 0, 0, 180000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:41:56', '2021-08-22 04:41:56'),
	(311, NULL, 'TICKET2021000311', '2021-08-22 04:44:22', 1, NULL, 4, 0, 0, 210000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:44:22', '2021-08-22 04:44:22'),
	(312, NULL, 'TICKET2021000312', '2021-08-22 04:45:24', 1, NULL, 4, 0, 0, 15000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:45:24', '2021-08-22 04:45:24'),
	(313, NULL, 'TICKET2021000313', '2021-08-22 04:46:36', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:46:36', '2021-08-22 04:46:36'),
	(314, NULL, 'TICKET2021000314', '2021-08-22 04:51:19', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:51:19', '2021-08-22 04:51:19'),
	(315, NULL, 'TICKET2021000315', '2021-08-22 04:52:25', 1, NULL, 4, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 04:52:25', '2021-08-22 04:52:25'),
	(316, NULL, 'TICKET2021000316', '2021-08-22 05:43:55', 1, NULL, 4, 0, 0, 130000, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-22 05:43:55', '2021-08-23 15:17:48'),
	(317, NULL, 'TICKET2021000317', '2021-08-22 05:44:56', 1, NULL, 4, 0, 0, 130000, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-22 05:44:56', '2021-08-23 15:22:21'),
	(318, NULL, 'TICKET2021000318', '2021-08-22 05:45:55', 1, NULL, 4, 0, 0, 30000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 05:45:55', '2021-08-22 05:45:55'),
	(319, NULL, 'TICKET2021000319', '2021-08-22 05:46:42', 1, NULL, 4, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 05:46:42', '2021-08-22 05:46:42'),
	(320, NULL, 'TICKET2021000320', '2021-08-22 05:47:37', 1, NULL, 4, 0, 0, 30000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 05:47:37', '2021-08-22 05:47:37'),
	(321, NULL, 'TICKET2021000321', '2021-08-22 05:48:46', 1, NULL, 4, 0, 0, 140000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 05:48:46', '2021-08-22 05:48:46'),
	(322, NULL, 'TICKET2021000322', '2021-08-22 05:50:00', 1, NULL, 4, 0, 0, 0, NULL, 0, 0, 0, NULL, NULL, 16, 7, '2021-08-22 05:50:00', '2021-08-23 15:39:18'),
	(323, NULL, 'TICKET2021000323', '2021-08-22 05:51:00', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 05:51:00', '2021-08-22 05:51:00'),
	(324, NULL, 'TICKET2021000324', '2021-08-22 05:51:55', 1, NULL, 4, 0, 0, 5000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 05:51:55', '2021-08-22 05:51:55'),
	(325, NULL, 'TICKET2021000325', '2021-08-22 05:52:56', 1, NULL, 4, 0, 0, 10000, NULL, 0, 0, 0, NULL, NULL, NULL, 7, '2021-08-22 05:52:56', '2021-08-22 05:52:56');
/*!40000 ALTER TABLE `ventes` ENABLE KEYS */;

-- Listage de la structure de la table smart-sfv-life-star-bd. vente_materiels
CREATE TABLE IF NOT EXISTS `vente_materiels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_vente` date NOT NULL,
  `numero_facture` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agence_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.vente_materiels : ~0 rows (environ)
/*!40000 ALTER TABLE `vente_materiels` DISABLE KEYS */;
/*!40000 ALTER TABLE `vente_materiels` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
