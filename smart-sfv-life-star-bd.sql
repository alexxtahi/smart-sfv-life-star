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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.approvisionnements : ~2 rows (environ)
/*!40000 ALTER TABLE `approvisionnements` DISABLE KEYS */;
INSERT INTO `approvisionnements` (`id`, `date_approvisionnement`, `depot_id`, `fournisseur_id`, `acompte_approvisionnement`, `numero_conteneur`, `numero_declaration`, `numero_immatriculation`, `remise_id`, `scan_facture_fournisseur`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, '2021-08-20', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:13:52', '2021-08-20 14:13:52'),
	(2, '2021-08-20', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.articles : ~60 rows (environ)
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` (`id`, `description_article`, `categorie_id`, `prix_achat_ttc`, `prix_vente_ttc_base`, `quantite_en_stock`, `sous_categorie_id`, `code_barre`, `reference_interne`, `rayon_id`, `rangee_id`, `unite_id`, `taille_id`, `param_tva_id`, `taux_airsi_achat`, `taux_airsi_vente`, `poids_net`, `poids_brut`, `stock_mini`, `stock_max`, `volume`, `prix_vente_en_gros_base`, `prix_vente_demi_gros_base`, `prix_pond_ttc`, `image_article`, `stockable`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Laurent Perrier Brut', 1, 28000, 60000, 0, NULL, '1', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 15:51:43', '2021-08-20 13:16:13'),
	(2, 'Laurent Perrier Demi-Sec', 1, 27000, 60000, 0, NULL, '2', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 15:59:59', '2021-08-20 13:20:32'),
	(3, 'Moët & Chandon Brut', 1, 28000, 70000, 0, NULL, '3', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:01:29', '2021-08-20 12:58:09'),
	(4, 'Moët & Chandon Nectar', 1, 35000, 70000, 0, NULL, '4', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:02:14', '2021-08-20 12:59:21'),
	(5, 'Moët & Chandon Ice', 1, 40000, 80000, 0, NULL, '5', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:03:16', '2021-08-20 12:56:30'),
	(6, 'Laurent Perrier Rosé', 1, 55000, 80000, 0, NULL, '6', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:06:34', '2021-08-20 12:57:49'),
	(7, 'Veuve Clicquot', 1, 32500, 90000, 0, NULL, '7', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:07:48', '2021-08-20 13:00:44'),
	(8, 'Moët & Chandon Rosé', 1, 40000, 100000, 0, NULL, '8', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:14:47', '2021-08-20 13:18:06'),
	(9, 'Laurent Perrier Brut Magnum', 1, 0, 100000, 0, NULL, '9', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-17 16:17:39', '2021-08-17 16:17:39'),
	(10, 'Moët & Chandon Magnum Brut', 1, 0, 130000, 0, NULL, '10', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:19:43', '2021-08-20 13:21:55'),
	(11, 'Ruinart Brut', 1, 50000, 150000, 0, NULL, '11', NULL, 0, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:20:30', '2021-08-20 12:57:14'),
	(12, 'DON PERIGNON', 1, 125000, 250000, 0, NULL, '12', NULL, 0, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:24:05', '2021-08-20 12:47:59'),
	(13, 'J&B', 2, 11000, 40000, 0, NULL, '13', NULL, 0, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 2, 2, '2021-08-17 16:25:34', '2021-08-20 13:25:14'),
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
	(39, 'Cocktail', 8, 0, 5000, 0, NULL, '40', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-19 16:12:35', '2021-08-19 16:12:35'),
	(40, 'Christal', 1, 125000, 300000, 0, NULL, '71', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 5, 2, '2021-08-20 12:49:47', '2021-08-20 17:27:05'),
	(41, 'Ruinart Blanc', 1, 65000, 150000, 0, NULL, '55', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-20 12:55:19', '2021-08-20 12:55:19'),
	(42, 'Clan Campbell', 2, 9000, 40000, 0, NULL, '56', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-20 13:05:43', '2021-08-20 13:05:43'),
	(43, 'Veuve Rich', 1, 40000, 90000, 0, NULL, '57', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-20 13:14:05', '2021-08-20 13:14:05'),
	(44, 'Magic', 9, 3000, 30000, 0, NULL, '58', NULL, 0, 0, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 2, '2021-08-20 13:15:19', '2021-08-20 13:15:19'),
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
	(62, 'Zozo le barbu', 3, 150000, 350000, 0, NULL, '3647', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 17, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, 16, '2021-08-22 13:35:56', '2021-08-22 13:35:56');
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.article_approvisionnements : ~45 rows (environ)
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
	(45, 2, 54, 1, 2, NULL, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.article_retournes : ~0 rows (environ)
/*!40000 ALTER TABLE `article_retournes` DISABLE KEYS */;
INSERT INTO `article_retournes` (`id`, `retour_article_id`, `article_id`, `unite_id`, `quantite_vendue`, `quantite`, `prix_unitaire`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, 1, 1, 60000, NULL, NULL, NULL, 2, '2021-08-21 10:28:35', '2021-08-21 10:28:35');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.article_ventes : ~18 rows (environ)
/*!40000 ALTER TABLE `article_ventes` DISABLE KEYS */;
INSERT INTO `article_ventes` (`id`, `quantite`, `divers_id`, `article_id`, `depot_id`, `unite_id`, `vente_id`, `prix`, `retourne`, `remise_sur_ligne`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, '2', NULL, 1, 1, 1, 1, 60000, 0, 0, NULL, NULL, NULL, 8, '2021-08-20 15:16:52', '2021-08-20 15:16:52'),
	(2, '0', NULL, 1, 1, 1, 2, 60000, 1, 0, NULL, NULL, NULL, 8, '2021-08-20 15:17:29', '2021-08-21 10:28:35'),
	(3, '1', NULL, 1, 1, 1, 3, 60000, 0, 0, NULL, NULL, NULL, 8, '2021-08-21 09:53:01', '2021-08-21 09:53:01'),
	(4, '1', NULL, 2, 1, 1, 4, 60000, 0, 0, NULL, NULL, NULL, 2, '2021-08-21 10:30:30', '2021-08-21 10:30:30'),
	(5, '2', NULL, 51, 1, 1, 5, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-21 10:50:27', '2021-08-21 10:50:27'),
	(6, '3', NULL, 2, 1, 1, 6, 60000, 0, 0, NULL, NULL, NULL, 2, '2021-08-21 12:21:54', '2021-08-21 12:21:54'),
	(7, '1', NULL, 2, 1, 1, 7, 60000, 0, 0, NULL, NULL, NULL, 2, '2021-08-21 12:26:29', '2021-08-21 12:26:29'),
	(8, '5', NULL, 2, 1, 1, 8, 60000, 0, 0, NULL, NULL, NULL, 2, '2021-08-23 09:34:00', '2021-08-23 09:34:00'),
	(9, '1', NULL, 1, 1, 1, 9, 60000, 0, 0, NULL, NULL, NULL, 2, '2021-08-23 09:35:32', '2021-08-23 09:35:32'),
	(10, '7', NULL, 2, 1, 1, 10, 60000, 0, 0, NULL, NULL, NULL, 2, '2021-08-23 09:37:55', '2021-08-23 09:37:55'),
	(11, '2', NULL, 4, 1, 1, 11, 70000, 0, 0, NULL, NULL, NULL, 2, '2021-08-23 11:22:32', '2021-08-23 11:22:32'),
	(12, '1', NULL, 1, 1, 1, 12, 60000, 0, 0, NULL, NULL, NULL, 2, '2021-08-23 20:47:08', '2021-08-23 20:47:08'),
	(13, '15', NULL, 2, 1, 1, 13, 60000, 0, 0, NULL, NULL, NULL, 2, '2021-08-23 21:11:39', '2021-08-23 21:11:39'),
	(14, '18', NULL, 2, 1, 1, 14, 60000, 0, 0, NULL, NULL, NULL, 2, '2021-08-24 00:25:37', '2021-08-24 00:25:37'),
	(15, '2', NULL, 2, 1, 1, 15, 60000, 0, 0, NULL, NULL, NULL, 2, '2021-08-24 00:31:30', '2021-08-24 00:31:30'),
	(16, '7', NULL, 2, 1, 1, 16, 60000, 0, 0, NULL, NULL, NULL, 2, '2021-08-24 00:39:14', '2021-08-24 00:39:14'),
	(17, '1', NULL, 4, 1, 1, 17, 70000, 0, 0, NULL, NULL, NULL, 2, '2021-08-24 00:50:38', '2021-08-24 00:50:38'),
	(18, '1', NULL, 17, 1, 1, 18, 70000, 0, 0, NULL, NULL, NULL, 2, '2021-08-24 08:48:16', '2021-08-24 08:48:16');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.billetages : ~0 rows (environ)
/*!40000 ALTER TABLE `billetages` DISABLE KEYS */;
INSERT INTO `billetages` (`id`, `caisse_ouverte_id`, `billet`, `quantite`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 1, 10000, 6, NULL, NULL, NULL, 5, '2021-08-20 17:45:24', '2021-08-20 17:45:24');
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
	(1, 'Principale', 1, 1, NULL, NULL, 2, 2, '2021-08-17 15:48:47', '2021-08-21 09:11:20'),
	(2, 'SACE', 1, 1, NULL, NULL, 8, 2, '2021-08-17 15:48:53', '2021-08-21 09:37:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.caisse_ouvertes : ~3 rows (environ)
/*!40000 ALTER TABLE `caisse_ouvertes` DISABLE KEYS */;
INSERT INTO `caisse_ouvertes` (`id`, `montant_ouverture`, `solde_fermeture`, `entree`, `sortie`, `caisse_id`, `user_id`, `motif_non_conformite`, `date_ouverture`, `date_fermeture`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 0, 60000, 0, 0, 1, 8, NULL, '2021-08-20 14:34:47', '2021-08-20 17:45:24', NULL, NULL, 5, 8, '2021-08-20 14:34:47', '2021-08-20 17:45:24'),
	(2, 0, 0, 0, 0, 1, 2, NULL, '2021-08-21 09:11:20', NULL, NULL, NULL, NULL, 2, '2021-08-21 09:11:20', '2021-08-21 09:11:20'),
	(3, 0, 0, 0, 0, 2, 8, NULL, '2021-08-21 09:37:22', NULL, NULL, NULL, NULL, 8, '2021-08-21 09:37:22', '2021-08-21 09:37:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
	(9, 'Vins', NULL, NULL, NULL, 2, '2021-08-17 15:41:38', '2021-08-17 15:41:38');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.clients : ~0 rows (environ)
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.depot_articles : ~99 rows (environ)
/*!40000 ALTER TABLE `depot_articles` DISABLE KEYS */;
INSERT INTO `depot_articles` (`id`, `quantite_disponible`, `article_id`, `depot_id`, `prix_vente`, `unite_id`, `date_peremption`, `date_debut_promotion`, `date_fin_promotion`, `promotion`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, 60000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 15:51:43', '2021-08-23 20:47:08'),
	(2, 0, 1, 1, 80000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 15:54:22', '2021-08-17 15:54:22'),
	(3, 30, 2, 1, 60000, 1, NULL, NULL, NULL, 0, NULL, NULL, 2, 2, '2021-08-17 15:59:59', '2021-08-24 00:39:14'),
	(4, 0, 2, 1, 90000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:00:41', '2021-08-17 16:00:41'),
	(5, 6, 3, 1, 70000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:01:29', '2021-08-20 14:13:53'),
	(6, 0, 3, 1, 90000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:01:30', '2021-08-17 16:01:30'),
	(7, 2, 4, 1, 70000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:02:14', '2021-08-24 00:50:38'),
	(8, 0, 4, 1, 90000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:02:14', '2021-08-17 16:02:14'),
	(9, 1, 5, 1, 80000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:03:16', '2021-08-20 14:13:53'),
	(10, 0, 5, 1, 100000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:03:16', '2021-08-19 16:59:33'),
	(11, 1, 6, 1, 80000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:06:34', '2021-08-20 14:13:53'),
	(12, 0, 6, 1, 100000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:06:34', '2021-08-17 16:06:34'),
	(13, 2, 7, 1, 90000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:07:48', '2021-08-20 14:13:53'),
	(14, 0, 7, 1, 110000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:07:48', '2021-08-17 16:07:48'),
	(15, 1, 8, 1, 100000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:14:47', '2021-08-20 14:13:52'),
	(16, 0, 8, 1, 120000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:14:47', '2021-08-17 16:14:47'),
	(17, 0, 9, 1, 100000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:17:39', '2021-08-17 16:17:39'),
	(18, 0, 9, 1, 120000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:17:39', '2021-08-17 16:17:39'),
	(19, 0, 10, 1, 130000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:19:43', '2021-08-17 16:19:43'),
	(20, 0, 10, 1, 150000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:19:43', '2021-08-17 16:19:43'),
	(21, 1, 11, 1, 150000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:20:30', '2021-08-20 14:13:53'),
	(22, 0, 11, 1, 170000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:20:31', '2021-08-17 16:20:31'),
	(23, 1, 12, 1, 250000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:24:05', '2021-08-20 14:13:53'),
	(24, 0, 12, 1, 270000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:24:05', '2021-08-17 16:24:05'),
	(25, 2, 13, 1, 40000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:25:34', '2021-08-20 14:13:54'),
	(26, 0, 13, 1, 80000, 2, NULL, NULL, NULL, 0, NULL, NULL, 2, 2, '2021-08-17 16:25:34', '2021-08-20 13:25:12'),
	(27, 1, 14, 1, 60000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:26:35', '2021-08-20 14:13:54'),
	(28, 0, 14, 1, 80000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:26:35', '2021-08-17 16:26:35'),
	(29, 3, 15, 1, 60000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:27:42', '2021-08-20 14:13:54'),
	(30, 0, 15, 1, 80000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:27:42', '2021-08-17 16:27:42'),
	(31, 1, 16, 1, 70000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:28:31', '2021-08-20 14:13:54'),
	(32, 0, 16, 1, 90000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:28:55', '2021-08-17 16:28:55'),
	(33, 0, 17, 1, 70000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:31:56', '2021-08-24 08:48:16'),
	(34, 0, 17, 1, 90000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:31:56', '2021-08-17 16:31:56'),
	(35, 0, 18, 1, 90000, 1, NULL, NULL, NULL, 0, NULL, NULL, 2, 2, '2021-08-17 16:33:14', '2021-08-17 16:35:20'),
	(36, 0, 18, 1, 110000, 2, NULL, NULL, NULL, 0, NULL, NULL, 2, 2, '2021-08-17 16:33:14', '2021-08-17 16:35:25'),
	(37, 1, 19, 1, 110000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:34:38', '2021-08-20 14:13:52'),
	(38, 0, 19, 1, 130000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:35:00', '2021-08-17 16:35:00'),
	(39, 1, 20, 1, 150000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:38:06', '2021-08-20 14:21:21'),
	(40, 0, 20, 1, 170000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:38:06', '2021-08-17 16:38:06'),
	(41, 1, 21, 1, 250000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:38:56', '2021-08-20 14:21:21'),
	(42, 0, 21, 1, 270000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:39:26', '2021-08-17 16:39:26'),
	(43, 11, 22, 1, 60000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:40:59', '2021-08-20 14:21:21'),
	(44, 0, 22, 1, 80000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:40:59', '2021-08-17 16:40:59'),
	(45, 3, 23, 1, 60000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:41:45', '2021-08-20 14:13:54'),
	(46, 0, 23, 1, 80000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:41:45', '2021-08-17 16:41:45'),
	(47, 3, 24, 1, 70000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:42:29', '2021-08-20 14:21:21'),
	(48, 0, 24, 1, 90000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:42:29', '2021-08-17 16:42:29'),
	(49, 2, 25, 1, 50000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:43:34', '2021-08-20 14:13:54'),
	(50, 0, 25, 1, 70000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:43:34', '2021-08-17 16:43:34'),
	(51, 5, 26, 1, 40000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:44:28', '2021-08-20 14:21:22'),
	(52, 0, 26, 1, 60000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:44:28', '2021-08-17 16:44:28'),
	(53, 7, 27, 1, 40000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:45:22', '2021-08-20 14:21:22'),
	(54, 0, 27, 1, 60000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:45:22', '2021-08-17 16:45:22'),
	(55, 0, 28, 1, 40000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:46:01', '2021-08-17 16:46:01'),
	(56, 0, 28, 1, 60000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-17 16:46:01', '2021-08-17 16:46:01'),
	(57, 2, 29, 1, 50000, 1, NULL, NULL, NULL, 0, NULL, NULL, 2, 2, '2021-08-17 16:47:45', '2021-08-20 14:13:54'),
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
	(79, 1, 42, 1, 150000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 12:55:19', '2021-08-20 14:13:53'),
	(80, 0, 42, 1, 170000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 12:55:19', '2021-08-20 12:55:19'),
	(81, 1, 43, 1, 40000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 13:05:43', '2021-08-20 14:13:54'),
	(82, 0, 43, 1, 60000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 13:05:43', '2021-08-20 13:05:43'),
	(83, 0, 44, 1, 110000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 13:14:05', '2021-08-20 13:14:05'),
	(84, 2, 44, 1, 90000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 13:14:05', '2021-08-20 14:13:52'),
	(85, 3, 45, 1, 30000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 13:15:19', '2021-08-20 14:13:52'),
	(86, 0, 46, 1, 150000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 13:42:15', '2021-08-20 13:42:15'),
	(87, 0, 46, 1, 130000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 13:42:15', '2021-08-20 13:42:15'),
	(88, 2, 47, 1, 250000, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 13:49:34', '2021-08-20 14:21:21'),
	(89, 0, 47, 1, 270000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 13:49:48', '2021-08-20 13:49:48'),
	(90, 1, 49, 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(91, 2, 50, 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(92, 9, 51, 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-23 09:37:08'),
	(93, 1, 53, 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:21', '2021-08-20 14:21:21'),
	(94, 1, 55, 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(95, 1, 56, 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(96, 2, 54, 1, 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, '2021-08-20 14:21:22', '2021-08-20 14:21:22'),
	(97, 0, 57, 1, 5000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-20 17:27:41', '2021-08-20 17:27:41'),
	(98, 0, 58, 1, 5000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-20 17:28:35', '2021-08-20 17:28:35'),
	(99, 0, 59, 1, 5000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-20 17:29:39', '2021-08-20 17:29:39'),
	(100, 0, 60, 1, 5000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-20 17:30:48', '2021-08-20 17:30:48'),
	(101, 0, 61, 1, 5000, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 5, '2021-08-20 17:33:46', '2021-08-20 17:33:46'),
	(102, 0, 62, 1, 350000, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 16, '2021-08-22 13:35:56', '2021-08-22 13:35:56');
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.mouvement_stocks : ~50 rows (environ)
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
	(17, '2021-08-20', NULL, 2, 1, 1, 67, 6, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-20 14:13:53', '2021-08-20 14:13:53'),
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
	(42, '2021-08-21', NULL, 1, 1, 1, 2, 0, 1, 0, 0, 1, NULL, NULL, NULL, 8, '2021-08-21 09:53:02', '2021-08-21 10:28:35'),
	(43, '2021-08-21', NULL, 2, 1, 1, 73, 0, 1, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-21 10:30:30', '2021-08-23 09:30:22'),
	(44, '2021-08-21', NULL, 51, 1, 1, 9, 0, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-21 10:50:27', '2021-08-23 09:37:08'),
	(45, '2021-08-23', NULL, 2, 1, 1, 72, 0, 15, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-23 09:34:00', '2021-08-23 21:11:39'),
	(46, '2021-08-23', NULL, 1, 1, 1, 2, 0, 1, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-23 09:35:32', '2021-08-23 20:47:08'),
	(47, '2021-08-23', NULL, 4, 1, 1, 3, 0, 0, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-23 11:22:32', '2021-08-23 11:23:48'),
	(48, '2021-08-24', NULL, 2, 1, 1, 57, 0, 27, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-24 00:25:38', '2021-08-24 00:39:14'),
	(49, '2021-08-24', NULL, 4, 1, 1, 3, 0, 1, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-24 00:50:38', '2021-08-24 00:50:38'),
	(50, '2021-08-24', NULL, 17, 1, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-24 08:48:16', '2021-08-24 08:48:16');
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
	(1, 'ESPECE', NULL, NULL, NULL, 2, '2021-08-17 15:49:08', '2021-08-17 15:49:08'),
	(2, 'CHEQUE', NULL, NULL, NULL, 2, '2021-08-17 15:49:45', '2021-08-17 15:49:45'),
	(3, 'TPE', NULL, NULL, NULL, 2, '2021-08-17 15:49:48', '2021-08-17 15:49:48');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.regimes : ~0 rows (environ)
/*!40000 ALTER TABLE `regimes` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.reglements : ~16 rows (environ)
/*!40000 ALTER TABLE `reglements` DISABLE KEYS */;
INSERT INTO `reglements` (`id`, `montant_reglement`, `reste_a_payer`, `moyen_reglement_id`, `date_reglement`, `caisse_ouverte_id`, `commande_id`, `vente_id`, `scan_cheque`, `numero_cheque_virement`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 120000, NULL, 3, '2021-08-20', 1, NULL, 1, NULL, NULL, '2021-08-20 17:44:35', 5, 5, 8, '2021-08-20 15:16:52', '2021-08-20 17:44:35'),
	(2, 60000, NULL, 1, '0000-00-00', NULL, NULL, 5, NULL, NULL, '2021-08-23 09:37:08', 2, 5, NULL, '2021-08-20 17:44:55', '2021-08-23 09:37:08'),
	(3, 180000, NULL, 1, '2021-08-21', 1, NULL, 6, NULL, NULL, '2021-08-21 17:30:50', 2, 2, 2, '2021-08-21 12:21:54', '2021-08-21 17:30:50'),
	(4, 60000, NULL, 1, '0000-00-00', NULL, NULL, 7, NULL, NULL, '2021-08-23 09:30:22', 2, 2, NULL, '2021-08-21 18:52:00', '2021-08-23 09:30:22'),
	(5, 300000, NULL, 2, '2021-08-23', 3, NULL, 8, NULL, NULL, '2021-08-23 09:35:08', 2, NULL, 2, '2021-08-23 09:34:00', '2021-08-23 09:35:08'),
	(6, 60000, NULL, 1, '2021-08-23', 3, NULL, 9, NULL, NULL, '2021-08-23 09:36:16', 2, NULL, 2, '2021-08-23 09:35:32', '2021-08-23 09:36:16'),
	(7, 420000, NULL, 2, '0000-00-00', NULL, NULL, 10, NULL, NULL, '2021-08-23 11:21:09', 2, 2, NULL, '2021-08-23 10:57:59', '2021-08-23 11:21:09'),
	(8, 140000, NULL, 3, '0000-00-00', NULL, NULL, 11, NULL, NULL, '2021-08-23 11:23:47', 2, 2, NULL, '2021-08-23 11:23:15', '2021-08-23 11:23:47'),
	(9, 60000, NULL, 2, '2021-08-23', 3, NULL, 12, NULL, NULL, NULL, NULL, NULL, 2, '2021-08-23 20:47:08', '2021-08-23 20:47:08'),
	(10, 900000, NULL, 2, '0000-00-00', 3, NULL, 13, NULL, NULL, NULL, NULL, 2, NULL, '2021-08-24 00:01:48', '2021-08-24 00:21:45'),
	(11, 1080000, NULL, 1, '2021-08-24', 3, NULL, 14, NULL, NULL, NULL, NULL, 2, 2, '2021-08-24 00:25:38', '2021-08-24 00:29:49'),
	(12, 120000, NULL, 1, '2021-08-24', 3, NULL, 15, NULL, NULL, NULL, NULL, NULL, 2, '2021-08-24 00:31:30', '2021-08-24 00:31:30'),
	(13, 420000, NULL, 1, '2021-08-24', 3, NULL, 16, NULL, NULL, NULL, NULL, 2, 2, '2021-08-24 00:39:14', '2021-08-24 00:42:43'),
	(14, 70000, NULL, 1, '2021-08-24', 3, NULL, 17, NULL, NULL, NULL, NULL, 2, 2, '2021-08-24 00:50:38', '2021-08-24 00:52:13'),
	(15, 60000, NULL, 2, '0000-00-00', 3, NULL, 4, NULL, NULL, NULL, NULL, 2, NULL, '2021-08-24 00:52:50', '2021-08-24 00:52:50'),
	(16, 60000, NULL, 2, '0000-00-00', 3, NULL, 3, NULL, NULL, NULL, NULL, 2, NULL, '2021-08-24 00:59:41', '2021-08-24 00:59:41');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.remises : ~0 rows (environ)
/*!40000 ALTER TABLE `remises` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.retour_articles : ~0 rows (environ)
/*!40000 ALTER TABLE `retour_articles` DISABLE KEYS */;
INSERT INTO `retour_articles` (`id`, `vente_id`, `vente_materiel_id`, `date_retour`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 2, NULL, '2021-08-21', NULL, NULL, NULL, 2, '2021-08-21 10:28:34', '2021-08-21 10:28:34');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.sous_categories : ~0 rows (environ)
/*!40000 ALTER TABLE `sous_categories` DISABLE KEYS */;
INSERT INTO `sous_categories` (`id`, `libelle_sous_categorie`, `categorie_id`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Tchorrr', 1, NULL, NULL, NULL, 16, '2021-08-22 15:22:37', '2021-08-22 15:22:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.unites : ~3 rows (environ)
/*!40000 ALTER TABLE `unites` DISABLE KEYS */;
INSERT INTO `unites` (`id`, `libelle_unite`, `quantite_unite`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Bouteille salle', 1, NULL, NULL, 2, 2, '2021-08-17 15:50:12', '2021-08-19 16:09:01'),
	(2, 'Bouteille VIP', 1, NULL, NULL, NULL, 2, '2021-08-17 15:53:59', '2021-08-17 15:53:59'),
	(3, 'Verre', 1, NULL, NULL, NULL, 2, '2021-08-19 16:09:18', '2021-08-19 16:09:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.users : ~8 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `full_name`, `contact`, `email`, `login`, `role`, `agence_id`, `localite_id`, `depot_id`, `email_verified_at`, `password`, `last_login_at`, `last_login_ip`, `confirmation_token`, `statut_compte`, `etat_user`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Concepteur de l\'application', '00000000', 'Concepteur@app.com', 'Concepteur', 'Concepteur', NULL, NULL, NULL, NULL, '$2y$10$JoSAcmr9O1HWbeJO5Xm4huhl/qjmVj2Jg5y/gA7rRmAPIxyX1PaoG', '2021-08-19 17:20:46', '::1', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, '2021-08-17 14:56:41', '2021-08-19 17:20:46'),
	(2, 'Alexandre TAHI', '(05) 84-64-98-25', 'alexandretahi7@gmail.com', 'alexandretahi7@gmail.com', 'Concepteur', NULL, NULL, 0, NULL, '$2y$10$aDkvcFf2vNSQuF0BQCPGRObRs3M2KFf3VvcSsleGH/vGdrpyx10sW', '2021-08-23 11:29:12', '127.0.0.1', NULL, 1, 1, NULL, NULL, 1, NULL, NULL, '2021-08-17 14:56:41', '2021-08-23 20:46:03'),
	(5, 'Alfred KOUANSAN', '(07) 48-36-56-90', 'alfredkouansan@groupsmarty.com', 'alfredkouansan@groupsmarty.com', 'Concepteur', NULL, NULL, NULL, NULL, '$2y$10$9lBN46ufNc2HKzCg4ManFeqv7Vl1cny8dmQXRdXMlr5.FTKxrGcDy', '2021-08-20 18:28:49', '::1', NULL, 1, 0, NULL, NULL, NULL, 2, NULL, '2021-08-18 11:31:47', '2021-08-20 18:28:49'),
	(6, 'Basile KOFFI', '(00) 00-00-00-00', 'basile.koffi@nvllesoda-com.net', 'basile.koffi@nvllesoda-com.net', 'Administrateur', NULL, NULL, NULL, NULL, '$2y$10$jhesZhLmY4e5W.BCrXW3c.elV0MaHzPk6gh8qBFXeNgpefWRPuEkS', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 2, NULL, '2021-08-18 11:37:25', '2021-08-18 11:37:25'),
	(7, 'Elisa KOUAKOU', '(00) 00-00-00-00', 'elisa.kouakou@gmail.com', 'elisa.kouakou@gmail.com', 'Caissier', NULL, NULL, 1, NULL, '$2y$10$uIz5toW82.QkIfL1yqosJu/neFcDYYMZo3kU5rHQ4cCJEYzx3umzO', '2021-08-19 13:44:56', '::1', NULL, 1, 0, NULL, NULL, NULL, 5, NULL, '2021-08-18 11:42:31', '2021-08-19 13:44:56'),
	(8, 'Anasthasie EHUENI', '(00) 00-00-00-00', 'ehuenianita@yahoo.fr', 'ehuenianita@yahoo.fr', 'Caissier', NULL, NULL, 1, NULL, '$2y$10$hxEpmKSPfQBipQliazAWA.BO3F9VEDMmJt.09PWUpBkEUD7rvqZEG', '2021-08-21 10:24:33', '127.0.0.1', NULL, 1, 1, NULL, NULL, 2, 5, NULL, '2021-08-18 11:45:40', '2021-08-23 11:29:17'),
	(11, 'Hurry ADJOVI', '(00) 00-00-00-00', 'hurry.adjovi@voodoo-com.net', 'hurry.adjovi@voodoo-com.net', 'Administrateur', NULL, NULL, NULL, NULL, '$2y$10$zIF0wAnT31p4CdhUSpGEwuK4X2JQ1BSdmK1hr80DAJelJZg7JZ98S', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 5, NULL, '2021-08-18 12:23:07', '2021-08-18 12:23:07'),
	(16, 'Michel Kouame', '(00) 00-00-00-00', 'wilfredkouame93@gmail.com', 'wilfredkouame93@gmail.com', 'Gerant', NULL, NULL, 1, NULL, '$2y$10$KA6ctywQxP/y.JsPyph3Qey34QahjEJ6vGKfq55tN5p1ieYNruppa', '2021-08-23 11:28:31', '127.0.0.1', NULL, 1, 0, NULL, NULL, 2, NULL, NULL, '2021-08-19 16:31:24', '2021-08-23 11:28:31'),
	(17, 'Logistic', '(00) 00-00-00-00', 'logistic@lifestar.com', 'logistic', 'Logistic', NULL, NULL, NULL, NULL, '$2y$10$XKTjzW8BKizsymaJjlNyxOdmzX.MVB3daM.P5NdCT78CfmpFFxpXO', '2021-08-22 23:45:38', '127.0.0.1', NULL, 1, 0, NULL, NULL, NULL, 2, NULL, '2021-08-22 13:06:07', '2021-08-22 23:45:38');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table smart-sfv-life-star-bd.ventes : ~18 rows (environ)
/*!40000 ALTER TABLE `ventes` DISABLE KEYS */;
INSERT INTO `ventes` (`id`, `numero_facture`, `numero_ticket`, `date_vente`, `depot_id`, `client_id`, `caisse_ouverte_id`, `acompte_facture`, `montant_a_payer`, `montant_payer`, `remise_id`, `proformat`, `attente`, `divers`, `deleted_at`, `deleted_by`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'TICKET2021000001', '2021-08-20 15:16:52', 1, NULL, 1, 0, 0, 120000, NULL, 0, 0, 0, NULL, 5, 5, 8, '2021-08-20 15:16:52', '2021-08-20 17:44:35'),
	(2, NULL, 'TICKET2021000002', '2021-08-20 15:17:29', 1, NULL, 1, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 5, 8, '2021-08-20 15:17:29', '2021-08-20 17:44:55'),
	(3, NULL, 'TICKET2021000003', '2021-08-21 09:53:01', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 2, 8, '2021-08-21 09:53:01', '2021-08-24 00:59:41'),
	(4, NULL, 'TICKET2021000004', '2021-08-21 10:30:30', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, 2, 2, '2021-08-21 10:30:30', '2021-08-24 00:52:50'),
	(5, NULL, 'TICKET2021000005', '2021-08-21 10:50:27', 1, NULL, 3, 0, 0, 0, NULL, 0, 1, 0, '2021-08-23 09:37:08', 2, NULL, 2, '2021-08-21 10:50:27', '2021-08-23 09:37:08'),
	(6, NULL, 'TICKET2021000006', '2021-08-21 12:21:54', 1, NULL, 3, 0, 0, 180000, NULL, 0, 0, 0, '2021-08-21 17:30:50', 2, 2, 2, '2021-08-21 12:21:54', '2021-08-21 17:30:50'),
	(7, NULL, 'TICKET2021000007', '2021-08-21 12:26:29', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, '2021-08-23 09:30:22', 2, 2, 2, '2021-08-21 12:26:29', '2021-08-23 09:30:22'),
	(8, NULL, 'TICKET2021000008', '2021-08-23 09:34:00', 1, NULL, 3, 0, 0, 300000, NULL, 0, 0, 0, '2021-08-23 09:35:08', 2, NULL, 2, '2021-08-23 09:34:00', '2021-08-23 09:35:08'),
	(9, NULL, 'TICKET2021000009', '2021-08-23 09:35:32', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, '2021-08-23 09:36:17', 2, NULL, 2, '2021-08-23 09:35:32', '2021-08-23 09:36:17'),
	(10, NULL, 'TICKET2021000010', '2021-08-23 09:37:55', 1, NULL, 3, 0, 0, 420000, NULL, 0, 0, 0, '2021-08-23 11:21:09', 2, 2, 2, '2021-08-23 09:37:55', '2021-08-23 11:21:09'),
	(11, NULL, 'TICKET2021000011', '2021-08-23 11:22:32', 1, NULL, 3, 0, 0, 140000, NULL, 0, 0, 0, '2021-08-23 11:23:48', 2, 2, 2, '2021-08-23 11:22:32', '2021-08-23 11:23:48'),
	(12, NULL, 'TICKET2021000012', '2021-08-23 20:47:08', 1, NULL, 3, 0, 0, 60000, NULL, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-23 20:47:08', '2021-08-23 20:47:08'),
	(13, NULL, 'TICKET2021000013', '2021-08-23 21:11:39', 1, NULL, 3, 0, 0, 900000, NULL, 0, 0, 0, NULL, NULL, 2, 2, '2021-08-23 21:11:39', '2021-08-24 00:21:45'),
	(14, NULL, 'TICKET2021000014', '2021-08-24 00:25:37', 1, NULL, 3, 0, 0, 1080000, NULL, 0, 0, 0, NULL, NULL, 2, 2, '2021-08-24 00:25:37', '2021-08-24 00:29:49'),
	(15, NULL, 'TICKET2021000015', '2021-08-24 00:31:30', 1, NULL, 3, 0, 0, 120000, NULL, 0, 0, 0, NULL, NULL, NULL, 2, '2021-08-24 00:31:30', '2021-08-24 00:31:30'),
	(16, NULL, 'TICKET2021000016', '2021-08-24 00:39:14', 1, NULL, 3, 0, 0, 420000, NULL, 0, 0, 0, NULL, NULL, 2, 2, '2021-08-24 00:39:14', '2021-08-24 00:42:43'),
	(17, NULL, 'TICKET2021000017', '2021-08-24 00:50:38', 1, NULL, 3, 0, 0, 70000, NULL, 0, 0, 0, NULL, NULL, 2, 2, '2021-08-24 00:50:38', '2021-08-24 00:52:13'),
	(18, NULL, 'TICKET2021000018', '2021-08-24 08:48:16', 1, NULL, 3, 0, 0, 0, NULL, 0, 1, 0, NULL, NULL, NULL, 2, '2021-08-24 08:48:16', '2021-08-24 08:48:16');
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
