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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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
) ENGINE=InnoDB AUTO_INCREMENT=588 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table smart-sfv-life-star-bd. migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table smart-sfv-life-star-bd. oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table smart-sfv-life-star-bd. oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table smart-sfv-life-star-bd. password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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
  `client_impayer_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table smart-sfv-life-star-bd. ticket_in_tvas
CREATE TABLE IF NOT EXISTS `ticket_in_tvas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ticket` int(11) NOT NULL,
  `declaration` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table smart-sfv-life-star-bd. tva_declarees
CREATE TABLE IF NOT EXISTS `tva_declarees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_declaration` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

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
  `pass_utiliser` tinyint(1) unsigned DEFAULT '0',
  `impayer` tinyint(1) unsigned DEFAULT '0',
  `pass_entree_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=564 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Les données exportées n'étaient pas sélectionnées.

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

-- Les données exportées n'étaient pas sélectionnées.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
