-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Mar 16, 2021 at 10:30 AM
-- Server version: 8.0.23
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Table structure for table `lc_attribute_groups`
--

CREATE TABLE `lc_attribute_groups` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sort` enum('alphabetical','priority') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'alphabetical',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_attribute_groups_info`
--

CREATE TABLE `lc_attribute_groups_info` (
  `id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL DEFAULT '0',
  `language_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_attribute_values`
--

CREATE TABLE `lc_attribute_values` (
  `id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_attribute_values_info`
--

CREATE TABLE `lc_attribute_values_info` (
  `id` int UNSIGNED NOT NULL,
  `value_id` int UNSIGNED NOT NULL DEFAULT '0',
  `language_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_cart_items`
--

CREATE TABLE `lc_cart_items` (
  `id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL DEFAULT '0',
  `cart_uid` varchar(13) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0',
  `options` varchar(2048) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `quantity` decimal(11,4) NOT NULL DEFAULT '0.0000',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_categories`
--

CREATE TABLE `lc_categories` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `google_taxonomy_id` int UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `list_style` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keywords` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `priority` int NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_categories`
--

INSERT INTO `lc_categories` (`id`, `parent_id`, `google_taxonomy_id`, `status`, `code`, `list_style`, `keywords`, `image`, `priority`, `date_updated`, `date_created`) VALUES
(1, 0, 0, 1, '', 'columns', '', 'categories/1-ordekler.png', 0, '2021-03-07 02:18:44', '2021-03-07 01:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `lc_categories_filters`
--

CREATE TABLE `lc_categories_filters` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL DEFAULT '0',
  `attribute_group_id` int UNSIGNED NOT NULL DEFAULT '0',
  `select_multiple` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_categories_info`
--

CREATE TABLE `lc_categories_info` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL DEFAULT '0',
  `language_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `short_description` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `head_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `h1_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `meta_description` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_categories_info`
--

INSERT INTO `lc_categories_info` (`id`, `category_id`, `language_code`, `name`, `short_description`, `description`, `head_title`, `h1_title`, `meta_description`) VALUES
(1, 1, 'tr', '??rdekler', '', '', '', '', ''),
(2, 1, 'en', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `lc_countries`
--

CREATE TABLE `lc_countries` (
  `id` int UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `domestic_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `iso_code_1` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `iso_code_2` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_id_format` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address_format` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `postcode_format` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `postcode_required` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `language_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency_code` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone_code` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_countries`
--

INSERT INTO `lc_countries` (`id`, `status`, `name`, `domestic_name`, `iso_code_1`, `iso_code_2`, `iso_code_3`, `tax_id_format`, `address_format`, `postcode_format`, `postcode_required`, `language_code`, `currency_code`, `phone_code`, `date_updated`, `date_created`) VALUES
(215, 1, 'T??rkiye', '', '792', 'TR', 'TUR', '', '%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name', '[0-9]{5}', 0, 'tr', 'TRY', '90', '2021-03-07 02:06:02', '2021-03-06 21:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `lc_currencies`
--

CREATE TABLE `lc_currencies` (
  `id` tinyint UNSIGNED NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `code` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `number` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` decimal(11,6) UNSIGNED NOT NULL DEFAULT '0.000000',
  `decimals` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `prefix` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `suffix` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `priority` int NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_currencies`
--

INSERT INTO `lc_currencies` (`id`, `status`, `code`, `number`, `name`, `value`, `decimals`, `prefix`, `suffix`, `priority`, `date_updated`, `date_created`) VALUES
(3, 1, 'TRY', '949', 'TRY', '1.000000', 0, '', '???', 0, '2021-03-07 00:31:00', '2021-03-07 00:30:41');

-- --------------------------------------------------------

--
-- Table structure for table `lc_customers`
--

CREATE TABLE `lc_customers` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_hash` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address1` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address2` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `postcode` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `zone_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `different_shipping_address` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `shipping_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_firstname` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_lastname` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_address1` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_address2` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_postcode` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_country_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_zone_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_phone` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newsletter` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `num_logins` int UNSIGNED NOT NULL DEFAULT '0',
  `last_ip` varchar(39) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_host` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_agent` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_login` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_customers`
--

INSERT INTO `lc_customers` (`id`, `code`, `status`, `email`, `password_hash`, `tax_id`, `company`, `firstname`, `lastname`, `address1`, `address2`, `postcode`, `city`, `country_code`, `zone_code`, `phone`, `different_shipping_address`, `shipping_company`, `shipping_firstname`, `shipping_lastname`, `shipping_address1`, `shipping_address2`, `shipping_city`, `shipping_postcode`, `shipping_country_code`, `shipping_zone_code`, `shipping_phone`, `newsletter`, `notes`, `password_reset_token`, `num_logins`, `last_ip`, `last_host`, `last_agent`, `date_login`, `date_updated`, `date_created`) VALUES
(1, '', 1, 'h4kbas@gmail.com', '$2y$10$E75AzfnhIiWF6kbkq9ON8OZBcsAwLJo158Ec0dPtcZxcmqE6z3/56', '', '', 'H??seyin', 'Akba??', '??ehit Cevdet ??zdemir 1059 Cad', 'No: 2/16', '06460', 'Ankara', 'TR', '06', '0532 695 3130', 0, '', 'H??seyin', 'Akba??', '??ehit Cevdet ??zdemir 1059 Cad', 'No: 2/16', 'Ankara', '06460', 'TR', '06', '', 0, '', '', 3, '172.18.0.1', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:86.0) Gecko/20100101 Firefox/86.0', '2021-03-16 12:23:24', '2021-03-07 02:07:08', '2021-03-07 01:23:30');

-- --------------------------------------------------------

--
-- Table structure for table `lc_delivery_statuses`
--

CREATE TABLE `lc_delivery_statuses` (
  `id` int UNSIGNED NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_delivery_statuses`
--

INSERT INTO `lc_delivery_statuses` (`id`, `date_updated`, `date_created`) VALUES
(1, '2021-03-07 00:23:26', '2021-03-06 21:05:35'),
(2, '2021-03-07 00:23:36', '2021-03-06 21:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `lc_delivery_statuses_info`
--

CREATE TABLE `lc_delivery_statuses_info` (
  `id` int UNSIGNED NOT NULL,
  `delivery_status_id` int UNSIGNED NOT NULL DEFAULT '0',
  `language_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_delivery_statuses_info`
--

INSERT INTO `lc_delivery_statuses_info` (`id`, `delivery_status_id`, `language_code`, `name`, `description`) VALUES
(1, 1, 'en', '1-3 days', ''),
(2, 2, 'en', '3-5 days', ''),
(3, 1, 'tr', '1-3 g??n', ''),
(4, 2, 'tr', '3-5 g??n', '');

-- --------------------------------------------------------

--
-- Table structure for table `lc_emails`
--

CREATE TABLE `lc_emails` (
  `id` int UNSIGNED NOT NULL,
  `status` enum('draft','scheduled','sent','error') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `code` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `charset` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recipients` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ccs` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `bccs` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `multiparts` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_scheduled` timestamp NULL DEFAULT NULL,
  `date_sent` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_emails`
--

INSERT INTO `lc_emails` (`id`, `status`, `code`, `charset`, `sender`, `recipients`, `ccs`, `bccs`, `subject`, `multiparts`, `date_scheduled`, `date_sent`, `date_updated`, `date_created`) VALUES
(1, 'sent', '', 'UTF-8', '{\"email\":\"store@email.com\",\"name\":\"Mutlulu\\u011fun Habercisi\"}', '[{\"email\":\"h4kbas@gmail.com\",\"name\":\"H\\u00fcseyin Akba\\u015f\"}]', '[]', '[]', 'Customer Account Created', '[\"Content-Type: text/plain; charset=UTF-8\\r\\nContent-Transfer-Encoding: 8bit\\r\\n\\r\\nWelcome H\\u00fcseyin Akba\\u015f to Mutlulu\\u011fun Habercisi!\\r\\n\\r\\nYour account has been created. You can now make purchases in our online store and keep track of history.\\r\\n\\r\\nLogin using your email address h4kbas@gmail.com.\\r\\n\\r\\nMutlulu\\u011fun Habercisi\\r\\n\\r\\nhttp://localhost/\"]', '0000-00-00 00:00:00', '2021-03-07 01:24:31', '2021-03-07 01:24:31', '2021-03-07 01:23:31');

-- --------------------------------------------------------

--
-- Table structure for table `lc_geo_zones`
--

CREATE TABLE `lc_geo_zones` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_geo_zones`
--

INSERT INTO `lc_geo_zones` (`id`, `code`, `name`, `description`, `date_updated`, `date_created`) VALUES
(2, 'TR', 'T??rkiye', 'T??rkiye Cumhuriyeti', '2021-03-07 00:21:34', '2021-03-07 00:21:34');

-- --------------------------------------------------------

--
-- Table structure for table `lc_languages`
--

CREATE TABLE `lc_languages` (
  `id` int UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `code2` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `locale` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `charset` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `domain_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `raw_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `raw_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `raw_datetime` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `format_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `format_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `format_datetime` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `decimal_point` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `thousands_sep` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency_code` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `priority` int NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_languages`
--

INSERT INTO `lc_languages` (`id`, `status`, `code`, `code2`, `name`, `locale`, `charset`, `url_type`, `domain_name`, `raw_date`, `raw_time`, `raw_datetime`, `format_date`, `format_time`, `format_datetime`, `decimal_point`, `thousands_sep`, `currency_code`, `priority`, `date_updated`, `date_created`) VALUES
(1, 1, 'en', 'eng', 'English', 'en_US.utf8,en_US.UTF-8,english', 'UTF-8', 'none', '', 'm/d/y', 'h:i A', 'm/d/y h:i A', '%b %e %Y', '%I:%M %P', '%b %e %Y %I:%M %P', '.', ',', '', 1, '2021-03-16 12:10:33', '2021-03-06 21:05:35'),
(2, 1, 'tr', 'tur', 'T??rk??e', 'tr_TR.utf8,tr-TR.UTF-8,turkish', 'UTF-8', 'none', '', 'd/m/Y', 'H:i', 'd/m/Y H:i', '%e %b %Y', '%H:%M', '%e %b %Y %H:%M', '.', ',', '', 0, '2021-03-16 12:09:06', '2021-03-06 23:06:45');

-- --------------------------------------------------------

--
-- Table structure for table `lc_manufacturers`
--

CREATE TABLE `lc_manufacturers` (
  `id` int UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `featured` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keywords` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_manufacturers_info`
--

CREATE TABLE `lc_manufacturers_info` (
  `id` int UNSIGNED NOT NULL,
  `manufacturer_id` int UNSIGNED NOT NULL DEFAULT '0',
  `language_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `short_description` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `h1_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `head_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `meta_description` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_modules`
--

CREATE TABLE `lc_modules` (
  `id` int UNSIGNED NOT NULL,
  `module_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '0',
  `settings` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_log` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_pushed` timestamp NULL DEFAULT NULL,
  `date_processed` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_modules`
--

INSERT INTO `lc_modules` (`id`, `module_id`, `type`, `status`, `priority`, `settings`, `last_log`, `date_pushed`, `date_processed`, `date_updated`, `date_created`) VALUES
(1, 'ot_subtotal', 'order_total', 1, 1, '{\"status\":\"1\",\"priority\":\"1\"}', '', NULL, NULL, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(2, 'ot_shipping_fee', 'order_total', 1, 20, '{\"status\":\"1\",\"free_shipping_amount\":\"0\",\"priority\":\"20\"}', '', NULL, NULL, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(3, 'ot_payment_fee', 'order_total', 1, 30, '{\"status\":\"1\",\"priority\":\"30\"}', '', NULL, NULL, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(4, 'job_error_reporter', 'job', 1, 0, '{\"status\":\"1\",\"report_frequency\":\"Weekly\",\"email_receipient\":\"\",\"priority\":\"0\"}', '', NULL, NULL, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(5, 'job_cache_cleaner', 'job', 1, 0, '{\"status\":\"1\",\"priority\":\"0\"}', '', NULL, NULL, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(6, 'job_mysql_optimizer', 'job', 1, 0, '{\"status\":\"1\",\"frequency\":\"monthly\",\"priority\":\"0\"}', '', NULL, NULL, '2021-03-06 21:05:35', '2021-03-06 21:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `lc_orders`
--

CREATE TABLE `lc_orders` (
  `id` int UNSIGNED NOT NULL,
  `uid` varchar(13) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `starred` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `unread` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `order_status_id` int UNSIGNED NOT NULL DEFAULT '0',
  `customer_id` int UNSIGNED NOT NULL DEFAULT '0',
  `customer_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customer_firstname` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customer_lastname` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customer_email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customer_phone` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customer_tax_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customer_address1` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customer_address2` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customer_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customer_postcode` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customer_country_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customer_zone_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_firstname` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_lastname` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_address1` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_address2` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_postcode` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_country_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_zone_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_phone` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_option_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_option_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_tracking_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shipping_tracking_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_option_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_option_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_transaction_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reference` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `language_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight_total` decimal(11,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `weight_class` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency_code` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency_value` decimal(11,6) UNSIGNED NOT NULL DEFAULT '0.000000',
  `display_prices_including_tax` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `payment_due` decimal(11,4) NOT NULL DEFAULT '0.0000',
  `tax_total` decimal(11,4) NOT NULL DEFAULT '0.0000',
  `client_ip` varchar(39) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_agent` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `domain` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `public_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_orders_comments`
--

CREATE TABLE `lc_orders_comments` (
  `id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL DEFAULT '0',
  `author` enum('system','staff','customer') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'system',
  `text` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hidden` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_orders_items`
--

CREATE TABLE `lc_orders_items` (
  `id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED NOT NULL DEFAULT '0',
  `option_stock_combination` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` varchar(4096) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sku` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gtin` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `taric` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `quantity` decimal(11,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(11,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(11,4) NOT NULL DEFAULT '0.0000',
  `weight` decimal(11,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `weight_class` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dim_x` decimal(11,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `dim_y` decimal(11,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `dim_z` decimal(11,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `dim_class` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_orders_totals`
--

CREATE TABLE `lc_orders_totals` (
  `id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL DEFAULT '0',
  `module_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` decimal(11,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(11,4) NOT NULL DEFAULT '0.0000',
  `calculate` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_order_statuses`
--

CREATE TABLE `lc_order_statuses` (
  `id` int UNSIGNED NOT NULL,
  `icon` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `color` varchar(7) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keywords` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_sale` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `is_archived` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `notify` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_order_statuses`
--

INSERT INTO `lc_order_statuses` (`id`, `icon`, `color`, `keywords`, `is_sale`, `is_archived`, `notify`, `priority`, `date_updated`, `date_created`) VALUES
(1, 'fa-money', '#c0c0c0', '', 0, 0, 0, 1, '2021-03-07 01:01:48', '2021-03-06 21:05:35'),
(2, 'fa-clock-o', '#d7d96f', '', 1, 0, 0, 2, '2021-03-07 01:02:06', '2021-03-06 21:05:35'),
(3, 'fa-cog', '#ffa851', '', 1, 0, 0, 3, '2021-03-07 01:02:13', '2021-03-06 21:05:35'),
(4, 'fa-truck', '#99cc66', '', 1, 1, 0, 4, '2021-03-07 01:02:27', '2021-03-06 21:05:35'),
(5, 'fa-times', '#ff6666', '', 0, 1, 0, 5, '2021-03-07 01:02:36', '2021-03-06 21:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `lc_order_statuses_info`
--

CREATE TABLE `lc_order_statuses_info` (
  `id` int UNSIGNED NOT NULL,
  `order_status_id` int UNSIGNED NOT NULL DEFAULT '0',
  `language_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email_subject` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email_message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_order_statuses_info`
--

INSERT INTO `lc_order_statuses_info` (`id`, `order_status_id`, `language_code`, `name`, `description`, `email_subject`, `email_message`) VALUES
(1, 1, 'en', 'Awaiting payment', '', '', ''),
(2, 2, 'en', 'Pending', '', '', ''),
(3, 3, 'en', 'Processing', '', '', ''),
(4, 4, 'en', 'Dispatched', '', '', ''),
(5, 5, 'en', 'Cancelled', '', '', ''),
(6, 1, 'tr', '??deme Bekleniyor', '', '', ''),
(7, 2, 'tr', 'Bekliyor', '', '', ''),
(8, 3, 'tr', '????leniyor', '', '', ''),
(9, 4, 'tr', 'G??nderildi', '', '', ''),
(10, 5, 'tr', '??ptal Edildi', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `lc_pages`
--

CREATE TABLE `lc_pages` (
  `id` int UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `dock` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `priority` int NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_pages_info`
--

CREATE TABLE `lc_pages_info` (
  `id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL DEFAULT '0',
  `language_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `head_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `meta_description` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_products`
--

CREATE TABLE `lc_products` (
  `id` int UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `manufacturer_id` int UNSIGNED NOT NULL DEFAULT '0',
  `supplier_id` int UNSIGNED NOT NULL DEFAULT '0',
  `delivery_status_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sold_out_status_id` int UNSIGNED NOT NULL DEFAULT '0',
  `default_category_id` int UNSIGNED NOT NULL DEFAULT '0',
  `keywords` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sku` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mpn` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `upc` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Deprecated, use GTIN',
  `gtin` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `taric` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `quantity` decimal(11,4) NOT NULL DEFAULT '0.0000',
  `quantity_unit_id` int UNSIGNED NOT NULL DEFAULT '0',
  `weight` decimal(10,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `weight_class` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dim_x` decimal(11,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `dim_y` decimal(11,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `dim_z` decimal(11,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `dim_class` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `purchase_price` decimal(11,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `purchase_price_currency_code` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recommended_price` decimal(11,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `tax_class_id` int UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `views` int UNSIGNED NOT NULL DEFAULT '0',
  `purchases` int UNSIGNED NOT NULL DEFAULT '0',
  `date_valid_from` date DEFAULT NULL,
  `date_valid_to` date DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_products`
--

INSERT INTO `lc_products` (`id`, `status`, `manufacturer_id`, `supplier_id`, `delivery_status_id`, `sold_out_status_id`, `default_category_id`, `keywords`, `code`, `sku`, `mpn`, `upc`, `gtin`, `taric`, `quantity`, `quantity_unit_id`, `weight`, `weight_class`, `dim_x`, `dim_y`, `dim_z`, `dim_class`, `purchase_price`, `purchase_price_currency_code`, `recommended_price`, `tax_class_id`, `image`, `views`, `purchases`, `date_valid_from`, `date_valid_to`, `date_updated`, `date_created`) VALUES
(1, 1, 0, 0, 0, 0, 1, '', '', '100', '', '', '', '', '1.0000', 1, '0.0000', 'kg', '0.0000', '0.0000', '0.0000', 'cm', '0.0000', '', '0.0000', 1, 'products/1-sari-ordek-1.jpg', 27, 0, NULL, NULL, '2021-03-16 12:08:43', '2021-03-07 01:26:16');

-- --------------------------------------------------------

--
-- Table structure for table `lc_products_attributes`
--

CREATE TABLE `lc_products_attributes` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL DEFAULT '0',
  `group_id` int UNSIGNED NOT NULL DEFAULT '0',
  `value_id` int UNSIGNED NOT NULL DEFAULT '0',
  `custom_value` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_products_campaigns`
--

CREATE TABLE `lc_products_campaigns` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL DEFAULT '0',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `TRY` decimal(11,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_products_images`
--

CREATE TABLE `lc_products_images` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL DEFAULT '0',
  `filename` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `checksum` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_products_images`
--

INSERT INTO `lc_products_images` (`id`, `product_id`, `filename`, `checksum`, `priority`) VALUES
(2, 1, 'products/1-sari-ordek-1.jpg', '53c402be2b096aeb08fbd9668acbed0b', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lc_products_info`
--

CREATE TABLE `lc_products_info` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL DEFAULT '0',
  `language_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `short_description` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `technical_data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `head_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `meta_description` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_products_info`
--

INSERT INTO `lc_products_info` (`id`, `product_id`, `language_code`, `name`, `short_description`, `description`, `technical_data`, `head_title`, `meta_description`) VALUES
(1, 1, 'tr', 'Sar?? ??rdek', '', '', '', '', ''),
(2, 1, 'en', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `lc_products_options`
--

CREATE TABLE `lc_products_options` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL DEFAULT '0',
  `group_id` int UNSIGNED NOT NULL DEFAULT '0',
  `function` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `required` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `sort` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `priority` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_products_options_stock`
--

CREATE TABLE `lc_products_options_stock` (
  `id` int NOT NULL,
  `product_id` int UNSIGNED NOT NULL DEFAULT '0',
  `combination` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sku` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` decimal(11,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `weight_class` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dim_x` decimal(11,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `dim_y` decimal(11,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `dim_z` decimal(11,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `dim_class` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `quantity` decimal(11,4) NOT NULL DEFAULT '0.0000',
  `priority` int NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_products_options_values`
--

CREATE TABLE `lc_products_options_values` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL DEFAULT '0',
  `group_id` int UNSIGNED NOT NULL DEFAULT '0',
  `value_id` int UNSIGNED NOT NULL DEFAULT '0',
  `custom_value` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `price_operator` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TRY` decimal(11,4) NOT NULL,
  `priority` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_products_prices`
--

CREATE TABLE `lc_products_prices` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL DEFAULT '0',
  `TRY` decimal(11,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_products_prices`
--

INSERT INTO `lc_products_prices` (`id`, `product_id`, `TRY`) VALUES
(1, 1, '500.0000');

-- --------------------------------------------------------

--
-- Table structure for table `lc_products_to_categories`
--

CREATE TABLE `lc_products_to_categories` (
  `product_id` int UNSIGNED NOT NULL DEFAULT '0',
  `category_id` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_products_to_categories`
--

INSERT INTO `lc_products_to_categories` (`product_id`, `category_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lc_quantity_units`
--

CREATE TABLE `lc_quantity_units` (
  `id` int UNSIGNED NOT NULL,
  `decimals` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `separate` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_quantity_units`
--

INSERT INTO `lc_quantity_units` (`id`, `decimals`, `separate`, `priority`, `date_updated`, `date_created`) VALUES
(1, 0, 0, 0, '2021-03-07 00:25:38', '2021-03-06 21:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `lc_quantity_units_info`
--

CREATE TABLE `lc_quantity_units_info` (
  `id` int UNSIGNED NOT NULL,
  `quantity_unit_id` int UNSIGNED NOT NULL DEFAULT '0',
  `language_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_quantity_units_info`
--

INSERT INTO `lc_quantity_units_info` (`id`, `quantity_unit_id`, `language_code`, `name`, `description`) VALUES
(1, 1, 'en', 'pcs', ''),
(2, 1, 'tr', 'adet', '');

-- --------------------------------------------------------

--
-- Table structure for table `lc_settings`
--

CREATE TABLE `lc_settings` (
  `id` int UNSIGNED NOT NULL,
  `setting_group_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` enum('global','local') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `key` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(8192) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `function` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `priority` int NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_settings`
--

INSERT INTO `lc_settings` (`id`, `setting_group_key`, `type`, `key`, `value`, `title`, `description`, `function`, `priority`, `date_updated`, `date_created`) VALUES
(1, '', 'global', 'platform_database_version', '2.2.8', 'Platform Database Version', 'The platform version of the database', '', 0, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(2, 'store_info', 'global', 'store_name', 'Mutlulu??un Habercisi', 'Store Name', 'The name of your store.', 'text()', 10, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(3, 'store_info', 'global', 'store_email', 'store@email.com', 'Store Email', 'The store\'s email address.', 'text()', 11, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(4, 'store_info', 'local', 'store_tax_id', 'XX000000000000', 'Store Tax ID', 'The store\'s tax ID or VATIN.', 'text()', 12, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(5, 'store_info', 'local', 'store_postal_address', 'My Store\r\nStreet\r\nPostcode City\r\nCountry', 'Store Postal Address', 'The store\'s postal address.', 'bigtext()', 13, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(6, 'store_info', 'local', 'store_visiting_address', '', 'Store Visiting Address', 'The physical store address, if applicable.', 'bigtext()', 14, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(7, 'store_info', 'local', 'store_phone', '+1-212-555-DUCK', 'Store Phone Number', 'The store\'s phone number.', 'text()', 15, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(8, 'store_info', 'global', 'store_country_code', 'TR', 'Store Country', 'The country of your store.', 'country()', 16, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(9, 'store_info', 'global', 'store_zone_code', '', 'Store Zone', 'The zone of your store.', 'zone(\"default_zone_code\")', 17, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(10, 'store_info', 'global', 'store_postcode', '', 'Store Postcode', 'The postcode of your store.', 'text()', 18, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(11, 'store_info', 'global', 'store_timezone', 'Africa/Cairo', 'Store Time Zone', 'The store\'s time zone.', 'timezone()', 19, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(12, 'store_info', 'local', 'store_language_code', 'tr', 'Store Language', 'The spoken language of your organization.', 'language()', 20, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(13, 'store_info', 'global', 'store_currency_code', 'TRY', 'Store Currency', 'The currency which all prices conform to.', 'currency()', 21, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(14, 'store_info', 'global', 'store_weight_class', 'kg', 'Store Weight Class', 'The preferred weight class.', 'weight_class()', 22, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(15, 'store_info', 'global', 'store_length_class', 'cm', 'Store Length Class', 'The preferred length class.', 'length_class()', 23, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(16, 'defaults', 'global', 'default_language_code', 'tr', 'Default Language', 'The default language, if not identified.', 'language()', 10, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(17, 'defaults', 'global', 'default_currency_code', 'TRY', 'Default Currency', 'The default currency, if not identified.', 'currency()', 11, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(18, 'defaults', 'global', 'default_country_code', 'TR', 'Default Country', 'The default country, if not otherwise set.', 'country()', 12, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(19, 'defaults', 'global', 'default_zone_code', '', 'Default Zone', 'The default zone, if not otherwise set.', 'zone(\"default_country_code\")', 13, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(20, 'defaults', 'local', 'default_tax_class_id', '1', 'Default Tax Class', 'The default tax class that will be preset when creating new products.', 'tax_class()', 14, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(21, 'defaults', 'global', 'default_display_prices_including_tax', '1', 'Default Display Prices Including Tax', 'Display prices including tax by default.', 'toggle()', 15, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(22, 'defaults', 'global', 'default_quantity_unit_id', '1', 'Default Quantity Unit', 'The default quantity unit, if not otherwise set.', 'quantity_unit()', 16, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(23, 'defaults', 'global', 'default_sold_out_status_id', '1', 'Default Sold Out Status', 'The default sold-out status, if not otherwise set.', 'sold_out_status()', 17, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(24, 'defaults', 'global', 'default_delivery_status_id', '1', 'Default Delivery Status', 'The default delivery status, if not otherwise set.', 'delivery_status()', 18, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(25, 'email', 'local', 'email_status', '1', 'Send Emails', 'Whether or not the platform should deliver outgoing emails.', 'toggle(\"y/n\")', 1, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(26, 'email', 'local', 'smtp_status', '0', 'SMTP Enabled', 'Whether or not to use an SMTP server for delivering email.', 'toggle(\"e/d\")', 10, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(27, 'email', 'local', 'smtp_host', 'localhost', 'SMTP Host', 'SMTP hostname, e.g. smtp.myprovider.com.', 'text()', 11, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(28, 'email', 'local', 'smtp_port', '25', 'SMTP Port', 'SMTP port, e.g. 25, 465 (SSL/TLS), or 587 (STARTTLS).', 'number()', 12, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(29, 'email', 'local', 'smtp_username', '', 'SMTP Username', 'Username for SMTP authentication.', 'text()', 13, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(30, 'email', 'local', 'smtp_password', '', 'SMTP Password', 'Password for SMTP authentication.', 'password()', 14, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(31, 'customer_details', 'global', 'regional_settings_screen', '0', 'Regional Settings Screen', 'Enables the regional settings screen upon first visit.', 'toggle(\"e/d\")', 10, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(32, 'customer_details', 'global', 'accounts_enabled', '1', 'Enable Customer Accounts', 'Allow customers to create an account and sign in.', 'toggle(\"e/d\")', 11, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(33, 'customer_details', 'local', 'customer_field_company', '1', 'Company Field', 'Display the field for the customer\'s company name.', 'toggle(\"y/n\")', 21, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(34, 'customer_details', 'local', 'customer_field_tax_id', '1', 'Tax ID Field', 'Display the field for the customer\'s tax ID.', 'toggle(\"y/n\")', 22, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(35, 'customer_details', 'local', 'customer_field_zone', '1', 'Zone/State/Province Field', 'Display the field for the customer\'s zone/state.', 'toggle(\"y/n\")', 23, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(36, 'listings', 'global', 'maintenance_mode', '0', 'Maintenance Mode', 'Setting the store in maintenance mode will prevent users from browsing your site.', 'toggle()', 2, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(37, 'listings', 'global', 'catalog_only_mode', '0', 'Catalog Only Mode', 'Disables the cart and checkout features leaving only a browsable catalog.', 'toggle(\"t/f\")', 1, '2021-03-07 01:43:52', '2021-03-06 21:05:35'),
(38, 'listings', 'local', 'items_per_page', '20', 'Items Per Page', 'The number of items to be displayed per page.', 'number()', 10, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(39, 'listings', 'local', 'data_table_rows_per_page', '25', 'Data Table Rows', 'The number of data table rows to be displayed per page.', 'text()', 11, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(40, 'listings', 'local', 'display_stock_count', '1', 'Display Stock Count', 'Show the available amount of products in stock.', 'toggle()', 12, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(41, 'listings', 'local', 'display_cheapest_shipping', '1', 'Cheapest Shipping', 'Display the cheapest shipping cost on product page.', 'toggle()', 13, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(42, 'listings', 'local', 'new_products_max_age', '1 month', 'Max Age for New Products', 'Display the \"New\" sticker for products less than the given age. E.g. 1 month or 14 days', 'text()', 14, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(43, 'listings', 'local', 'box_similar_products_num_items', '8', 'Similar Products Box: Number of Items', 'The maximum number of items to be displayed in the box.', 'number()', 15, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(44, 'listings', 'local', 'box_recently_viewed_products_num_items', '6', 'Recently Viewed Products Box: Number of Items', 'The maximum number of items to be displayed in the box.', 'number()', 16, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(45, 'listings', 'local', 'box_latest_products_num_items', '8', 'Latest Products Box: Number of Items', 'The maximum number of items to be displayed in the box.', 'number()', 17, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(46, 'listings', 'local', 'box_popular_products_num_items', '8', 'Popular Products Box: Number of Items', 'The maximum number of items to be displayed in the box.', 'number()', 18, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(47, 'listings', 'local', 'box_campaign_products_num_items', '4', 'Campaign Products Box: Number of Items', 'The maximum number of items to be displayed in the box.', 'number()', 19, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(48, 'listings', 'local', 'box_also_purchased_products_num_items', '4', 'Also Purchased Products Box: Number of Items', 'The maximum number of items to be display in the box.', 'number()', 20, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(49, 'listings', 'local', 'auto_decimals', '1', 'Auto Decimals', 'Don\'t show decimals for integers. Will turn 99.00 into 99 but leave 99.99.', 'toggle(\"e/d\")', 21, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(50, 'listings', 'global', 'category_tree_product_count', '0', 'Show Product Count In Category Tree', 'Show the number of products inside each category in the category tree.', 'toggle(\"y/n\")', 22, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(51, 'legal', 'global', 'cookie_policy', '', 'Cookie Policy', 'Select a page for the cookie policy or leave blank to disable.', 'page()', 10, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(52, 'legal', 'local', 'privacy_policy', '', 'Privacy Policy', 'Select a page for the privacy policy consent or leave blank to disable.', 'page()', 11, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(53, 'legal', 'local', 'terms_of_purchase', '', 'Terms of Purchase', 'Select a page for the terms of purchase or leave blank to disable.', 'page()', 12, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(54, 'images', 'global', 'cache_clear_thumbnails', '0', 'Clear Thumbnails Cache', 'Remove all cached image thumbnails from disk.', 'toggle()', 1, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(55, 'images', 'local', 'category_image_ratio', '3:2', 'Category Images: Aspect Ratio', 'The aspect ratio of the category thumbnails', 'select(\"1:1\",\"2:3\",\"3:2\",\"3:4\",\"4:3\",\"16:9\")', 10, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(56, 'images', 'local', 'category_image_clipping', 'CROP', 'Category Images: Clipping Method', 'The clipping method used for scaled category thumbnails.', 'select(\"CROP\",\"FIT\",\"FIT_USE_WHITESPACING\")', 11, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(57, 'images', 'local', 'product_image_ratio', '1:1', 'Product Images: Aspect Ratio', 'The aspect ratio of the product thumbnails', 'select(\"1:1\",\"2:3\",\"3:2\",\"3:4\",\"4:3\",\"16:9\")', 30, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(58, 'images', 'local', 'product_image_clipping', 'FIT_USE_WHITESPACING', 'Product Images: Clipping Method', 'The clipping method used for scaled product thumbnails.', 'select(\"CROP\",\"FIT\",\"FIT_USE_WHITESPACING\")', 31, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(59, 'images', 'local', 'product_image_trim', '0', 'Product Images: Trim Whitespace', 'Trim whitespace before generating thumbnail images.', 'toggle(\"y/n\")', 33, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(60, 'images', 'local', 'product_image_watermark', '0', 'Product Images: Watermark', 'Watermark product images with the store logo.', 'toggle(\"y/n\")', 34, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(61, 'images', 'local', 'image_downsample_size', '2048,2048', 'Downsample', 'Downsample large uploaded images to best fit within the given dimensions of \"width,height\" or leave empty. Default: 2048,2048', 'text()', 34, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(62, 'images', 'local', 'image_quality', '90', 'Image Quality', 'The JPEG quality for uploaded images (0-100). Default: 90', 'number()', 40, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(63, 'images', 'local', 'image_thumbnail_quality', '65', 'Thumbnail Quality', 'The JPEG quality for thumbnail images (0-100). Default: 65', 'number()', 41, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(64, 'images', 'local', 'image_thumbnail_interlaced', '0', 'Interlaced Thumbnails', 'Generate interlaced thumbnail images for progressive loading. Increases the filesize by 10-20% but improves user experience.', 'toggle()', 42, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(65, 'images', 'local', 'image_whitespace_color', '255,255,255', 'Whitespace Color', 'Set the color of any generated whitespace to the given RGB value. Default: 255,255,255', 'text()', 43, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(66, 'images', 'local', 'webp_enabled', '0', 'WebP Enabled', 'Use WebP images if supported by the browser.', 'toggle(\"e/d\")', 44, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(67, 'checkout', 'local', 'send_order_confirmation', '1', 'Send Order Confirmation', 'Send order confirmations via email.', 'toggle(\"y/n\")', 11, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(68, 'checkout', 'local', 'email_order_copy', 'store@email.com', 'Order Copy Recipients', 'Send an email of the order copy to the given recipients. Separated by coma or semicolon.', 'text()', 12, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(69, 'checkout', 'global', 'round_amounts', '1', 'Round Amounts', 'Round currency amounts to prevent exceeding decimals. Turns 29.9915 to 29.99', 'toggle()', 13, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(70, 'advanced', 'global', 'cache_enabled', '1', 'System Cache Enabled', 'Enables the system cache module which caches frequently used data.', 'toggle()', 10, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(71, 'advanced', 'global', 'cache_clear', '0', 'Clear System Cache', 'Remove all cached system information.', 'toggle()', 11, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(72, 'advanced', 'global', 'gzip_enabled', '1', 'GZIP Enabled', 'Compresses browser data. Increases the load on the server but decreases the bandwidth.', 'toggle()', 15, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(73, 'advanced', 'global', 'jobs_last_run', '2021-03-06 21:05:35', 'Jobs Last Run', 'Time when background jobs were last executed.', 'text()', 16, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(74, 'advanced', 'local', 'jobs_interval', '60', 'Jobs Interval', 'The amount of minutes between each execution of jobs.', 'number()', 17, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(75, 'advanced', 'local', 'control_panel_link', '?app=settings&doc=advanced&action=edit&key=control_panel_link', 'Control Panel Link', 'The URL to your control panel, e.g. cPanel.', 'text()', 18, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(76, 'advanced', 'local', 'database_admin_link', '?app=settings&doc=advanced&action=edit&key=database_admin_link', 'Database Admin Link', 'The URL to your database manager, e.g. phpMyAdmin.', 'text()', 19, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(77, 'advanced', 'local', 'webmail_link', '?app=settings&doc=advanced&action=edit&key=webmail_link', 'Webmail Link', 'The URL to your webmail client.', 'text()', 20, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(78, 'security', 'local', 'captcha_enabled', '1', 'CAPTCHA', 'Prevent robots from posting form data by enabling CAPTCHA security.', 'toggle()', 16, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(79, '', 'global', 'store_template_catalog', 'default.catalog', 'Catalog Template', '', 'template(\"catalog\")', 0, '2021-03-07 02:26:26', '2021-03-06 21:05:35'),
(80, '', 'global', 'store_template_catalog_settings', '{\"sidebar_parallax_effect\":\"1\",\"compact_category_tree\":\"0\"}', 'Catalog Template Settings', '', 'text()', 0, '2021-03-07 02:26:26', '2021-03-06 21:05:35'),
(81, '', 'global', 'store_template_admin', 'default.admin', 'Admin Template', '', 'template(\"admin\")', 0, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(82, '', 'global', 'jobs_last_push', '2021-03-16 12:03:51', 'Jobs Last Push', 'Time when background jobs were last pushed for execution.', 'text()', 0, '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(83, '', 'local', 'cache_system_breakpoint', '2021-03-16 12:30:07', 'Date Cache Cleared', 'Do not use system cache older than breakpoint.', 'text()', 0, '2021-03-06 21:05:35', '2021-03-06 21:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `lc_settings_groups`
--

CREATE TABLE `lc_settings_groups` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `priority` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_settings_groups`
--

INSERT INTO `lc_settings_groups` (`id`, `key`, `name`, `description`, `priority`) VALUES
(1, 'store_info', 'Store Info', 'Store information', 10),
(2, 'defaults', 'Defaults', 'Store default settings', 20),
(3, 'email', 'Email', 'Email and SMTP', 30),
(4, 'listings', 'Listings', 'Settings for the catalog listing', 40),
(5, 'customer_details', 'Customer Details', 'Settings for the catalog listing', 45),
(6, 'legal', 'Legal', 'Legal settings and information', 50),
(7, 'images', 'Images', 'Settings for graphical elements', 60),
(8, 'checkout', 'Checkout', 'Checkout settings', 70),
(9, 'advanced', 'Advanced', 'Advanced settings', 80),
(10, 'security', 'Security', 'Site security and protection against threats', 90);

-- --------------------------------------------------------

--
-- Table structure for table `lc_slides`
--

CREATE TABLE `lc_slides` (
  `id` int UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `languages` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `priority` int NOT NULL DEFAULT '0',
  `date_valid_from` timestamp NULL DEFAULT NULL,
  `date_valid_to` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_slides`
--

INSERT INTO `lc_slides` (`id`, `status`, `languages`, `name`, `image`, `priority`, `date_valid_from`, `date_valid_to`, `date_updated`, `date_created`) VALUES
(1, 0, '', 'Slider', 'slides/1-rocket-cart.svg', 1, NULL, NULL, '2021-03-07 02:07:27', '2021-03-06 21:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `lc_slides_info`
--

CREATE TABLE `lc_slides_info` (
  `id` int UNSIGNED NOT NULL,
  `slide_id` int UNSIGNED NOT NULL DEFAULT '0',
  `language_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caption` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_slides_info`
--

INSERT INTO `lc_slides_info` (`id`, `slide_id`, `language_code`, `caption`, `link`) VALUES
(1, 1, 'en', '', 'https://vheatris.tumblr.com/'),
(2, 1, 'tr', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `lc_sold_out_statuses`
--

CREATE TABLE `lc_sold_out_statuses` (
  `id` int UNSIGNED NOT NULL,
  `hidden` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `orderable` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_sold_out_statuses`
--

INSERT INTO `lc_sold_out_statuses` (`id`, `hidden`, `orderable`, `date_updated`, `date_created`) VALUES
(1, 0, 0, '2021-03-07 00:23:46', '2021-03-06 21:05:35'),
(2, 0, 1, '2021-03-07 00:25:10', '2021-03-06 21:05:35'),
(3, 0, 1, '2021-03-07 00:25:27', '2021-03-06 21:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `lc_sold_out_statuses_info`
--

CREATE TABLE `lc_sold_out_statuses_info` (
  `id` int UNSIGNED NOT NULL,
  `sold_out_status_id` int UNSIGNED NOT NULL DEFAULT '0',
  `language_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_sold_out_statuses_info`
--

INSERT INTO `lc_sold_out_statuses_info` (`id`, `sold_out_status_id`, `language_code`, `name`, `description`) VALUES
(1, 1, 'en', 'Sold Out', ''),
(2, 2, 'en', 'Temporarily Sold Out', ''),
(3, 3, 'en', 'Backorder Item', ''),
(4, 1, 'tr', 'T??kendi', ''),
(5, 3, 'tr', 'Temin Edilecek T??kenmi?? ??r??n', ''),
(6, 2, 'tr', 'Ge??ici S??reyle T??kendi', '');

-- --------------------------------------------------------

--
-- Table structure for table `lc_suppliers`
--

CREATE TABLE `lc_suppliers` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc_tax_classes`
--

CREATE TABLE `lc_tax_classes` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_tax_classes`
--

INSERT INTO `lc_tax_classes` (`id`, `code`, `name`, `description`, `date_updated`, `date_created`) VALUES
(1, '', 'Standart Vergiler', '', '2021-03-07 01:04:05', '2021-03-07 01:04:05');

-- --------------------------------------------------------

--
-- Table structure for table `lc_tax_rates`
--

CREATE TABLE `lc_tax_rates` (
  `id` int UNSIGNED NOT NULL,
  `tax_class_id` int UNSIGNED NOT NULL DEFAULT '0',
  `geo_zone_id` int UNSIGNED NOT NULL DEFAULT '0',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `type` enum('fixed','percent') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'percent',
  `address_type` enum('shipping','payment') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'shipping',
  `rule_companies_with_tax_id` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `rule_companies_without_tax_id` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `rule_individuals_with_tax_id` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `rule_individuals_without_tax_id` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_tax_rates`
--

INSERT INTO `lc_tax_rates` (`id`, `tax_class_id`, `geo_zone_id`, `code`, `name`, `description`, `rate`, `type`, `address_type`, `rule_companies_with_tax_id`, `rule_companies_without_tax_id`, `rule_individuals_with_tax_id`, `rule_individuals_without_tax_id`, `date_updated`, `date_created`) VALUES
(1, 1, 2, 'KDV', 'Katma De??er Vergisi', '', '18.0000', 'percent', 'shipping', 1, 1, 1, 1, '2021-03-07 01:04:20', '2021-03-07 01:04:20');

-- --------------------------------------------------------

--
-- Table structure for table `lc_translations`
--

CREATE TABLE `lc_translations` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `text_en` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text_tr` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `html` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `frontend` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `backend` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `date_accessed` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_translations`
--

INSERT INTO `lc_translations` (`id`, `code`, `text_en`, `text_tr`, `html`, `frontend`, `backend`, `date_accessed`, `date_updated`, `date_created`) VALUES
(1, 'template:title_sidebar_parallax_effect', 'Sidebar Parallax Effect', 'Kayd??rma ??ubu??u Paralaks Efekti', 0, 1, 1, '2021-03-16 12:30:31', '2021-03-07 01:14:34', '2021-03-06 23:05:40'),
(2, 'template:description_sidebar_parallax_effect', 'Enables or disables the sidebar parallax effect.', 'Kenar ??ubu??u paralaks etkisini etkinle??tirir veya devre d?????? b??rak??r.', 0, 1, 1, '2021-03-16 12:30:31', '2021-03-07 01:14:34', '2021-03-06 23:05:40'),
(3, 'template:title_compact_category_tree', 'Compact Category Tree', 'Birle??ik Kategori A??ac??', 0, 1, 1, '2021-03-16 12:30:31', '2021-03-06 23:55:04', '2021-03-06 23:05:40'),
(4, 'template:description_compact_category_tree', 'Hide the other main categories while browsing a category branch.', 'Bir kategori dal??n?? gezerken di??er ana kategorileri gizle', 0, 1, 1, '2021-03-16 12:30:31', '2021-03-07 01:14:34', '2021-03-06 23:05:40'),
(5, 'title_username', 'Username', 'Kullan??c?? Ad??', 0, 0, 1, '2021-03-16 12:25:53', '2021-03-07 01:14:34', '2021-03-06 23:05:40'),
(6, 'title_password', 'Password', '??ifre', 0, 1, 1, '2021-03-16 12:25:40', '2021-03-07 01:14:34', '2021-03-06 23:05:40'),
(7, 'title_remember_me', 'Remember Me', 'Beni Hat??rla', 0, 1, 1, '2021-03-16 12:25:40', '2021-03-07 01:14:34', '2021-03-06 23:05:40'),
(8, 'title_login', 'Login', 'Giri??', 0, 1, 1, '2021-03-16 12:25:40', '2021-03-07 01:14:34', '2021-03-06 23:05:40'),
(9, 'success_now_logged_in_as', 'You are now logged in as %username', 'Giri?? Yapt??????n??z Hesap: %username', 0, 0, 0, NULL, '2021-03-06 23:33:30', '2021-03-06 23:05:45'),
(10, 'title_home', 'Home', 'Ana Sayfa', 0, 1, 1, '2021-03-16 12:30:31', '2021-03-06 23:33:30', '2021-03-06 23:05:45'),
(11, 'title_dashboard', 'Dashboard', 'Y??netim Paneli', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:33:30', '2021-03-06 23:05:45'),
(12, 'title_appearance', 'Appearance', 'G??r??n??m', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:33:30', '2021-03-06 23:05:45'),
(13, 'title_template', 'Template', 'Temalar', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:33:30', '2021-03-06 23:05:45'),
(14, 'title_logotype', 'Logotype', 'Logo Tipi', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:33:30', '2021-03-06 23:05:45'),
(15, 'title_catalog', 'Catalog', 'Katalog', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:33:30', '2021-03-06 23:05:45'),
(16, 'title_attributes', 'Attributes', '??zellikler', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:33:30', '2021-03-06 23:05:45'),
(17, 'title_manufacturers', 'Manufacturers', '??reticiler', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:33:30', '2021-03-06 23:05:45'),
(18, 'title_suppliers', 'Suppliers', 'Tedarik??iler', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:33:30', '2021-03-06 23:05:45'),
(19, 'title_delivery_statuses', 'Delivery Statuses', 'Teslimat Durumlar??', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:33:30', '2021-03-06 23:05:45'),
(20, 'title_sold_out_statuses', 'Sold Out Statuses', 'Sat???? Durumlar??', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:33:30', '2021-03-06 23:05:45'),
(21, 'title_quantity_units', 'Quantity Units', 'Miktar Birimleri', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:33:30', '2021-03-06 23:05:45'),
(22, 'title_csv_import_export', 'CSV Import/Export', 'CSV ????e/D????ar Aktar', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:33:30', '2021-03-06 23:05:45'),
(23, 'title_countries', 'Countries', '??lkeler', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-16 12:29:12', '2021-03-06 23:05:45'),
(24, 'title_currencies', 'Currencies', 'Para Birimleri', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(25, 'title_customers', 'Customers', 'M????teriler', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(26, 'title_newsletter', 'Newsletter', 'B??lten', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(27, 'title_geo_zones', 'Geo Zones', 'Co??rafi B??lgeler', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-16 12:28:00', '2021-03-06 23:05:45'),
(28, 'title_languages', 'Languages', 'Dil', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(29, 'title_storage_encoding', 'Storage Encoding', 'Depolama Kodlamas??', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(30, 'title_modules', 'Modules', 'Mod??ller', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(31, 'title_customer_modules', 'Customer Modules', 'M????teri Mod??lleri', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(32, 'title_shipping_modules', 'Shipping Modules', 'Kargo Mod??lleri', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(33, 'title_payment_modules', 'Payment Modules', '??deme Mod??lleri', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(34, 'title_order_modules', 'Order Modules', 'Sipari?? Mod??lleri', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(35, 'title_order_total_modules', 'Order Total Modules', 'Toplam Sipari?? Mod??lleri', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(36, 'title_job_modules', 'Job Modules', '???? Mod??lleri', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(37, 'title_orders', 'Orders', 'Sipari??ler', 0, 0, 1, '2021-03-16 12:30:26', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(38, 'title_order_statuses', 'Order Statuses', 'Sipari?? Durumlar??', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(39, 'title_pages', 'Pages', 'Sayfalar', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(40, 'title_reports', 'Reports', 'Raporlar', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(41, 'title_monthly_sales', 'Monthly Sales', 'Ayl??k Sat????lar', 0, 0, 1, '2021-03-16 12:30:14', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(42, 'title_most_sold_products', 'Most Sold Products', '??ok Satanlar', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(43, 'title_most_shopping_customers', 'Most Shopping Customers', '??ok Al????veri?? Yapan M????teriler', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(44, 'title_settings', 'Settings', 'Ayarlar', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(45, 'settings_group:title_store_info', 'Store Info', 'Ma??aza Bilgileri', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(46, 'settings_group:title_defaults', 'Defaults', 'Varsay??lanlar', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(47, 'settings_group:title_email', 'Email', 'Email', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-06 23:55:04', '2021-03-06 23:05:45'),
(48, 'settings_group:title_listings', 'Listings', 'Listeler', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-06 23:37:28', '2021-03-06 23:05:45'),
(49, 'settings_group:title_customer_details', 'Customer Details', 'M????teri Detaylar??', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(50, 'settings_group:title_legal', 'Legal', 'Yasal', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-07 01:14:34', '2021-03-06 23:05:45'),
(51, 'settings_group:title_images', 'Images', 'Resimler', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-07 01:14:34', '2021-03-06 23:05:45'),
(52, 'settings_group:title_checkout', 'Checkout', '??deme', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(53, 'settings_group:title_advanced', 'Advanced', 'ileri', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(54, 'settings_group:title_security', 'Security', 'G??venlik', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(55, 'title_slides', 'Slides', 'Slaytlar', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-07 01:20:57', '2021-03-06 23:05:45'),
(56, 'title_tax', 'Tax', 'Vergi', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-07 01:20:57', '2021-03-06 23:05:45'),
(57, 'title_tax_rates', 'Tax Rates', 'Vergi oran??', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-07 01:20:57', '2021-03-06 23:05:45'),
(58, 'title_tax_classes', 'Tax Classes', 'Vergi s??n??f??', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-07 01:20:57', '2021-03-06 23:05:45'),
(59, 'title_translations', 'Translations', '??eviriler', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(60, 'title_search_translations', 'Search Translations', 'Arama ??evirileri', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(61, 'title_scan_files', 'Scan Files', 'Dosyalar?? Tara', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(62, 'title_users', 'Users', 'Kullan??c??lar', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(63, 'title_vqmods', 'vQmods', 'vqmods', 0, 0, 1, '2021-03-16 12:30:07', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(64, 'warning_install_folder_exists', 'Warning: The installation directory is still available and should be deleted.', 'Attention??: kurulum dizini hala mevcut ve dizin y??netici silinmesi gerekti??ini hi??bir koruma .htaccess dosyas?? vard??r', 0, 0, 1, '2021-03-16 12:30:26', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(65, 'title_addons', 'Add-ons', 'Uzant??lar??', 0, 0, 1, '2021-03-16 12:30:14', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(66, 'title_discussions', 'Discussions', 'Tart????malar', 0, 0, 1, '2021-03-16 12:30:14', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(67, 'title_graphs', 'Graphs', 'Grafikler', 0, 0, 1, '2021-03-16 12:30:14', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(68, 'title_statistics', 'Statistics', '??statistik', 0, 0, 1, '2021-03-16 12:30:14', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(69, 'title_daily_sales', 'Daily Sales', 'G??nl??k Sat????', 0, 0, 1, '2021-03-16 12:30:14', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(70, 'title_total_sales', 'Total Sales', 'Toplam sat????', 0, 0, 1, '2021-03-16 12:30:14', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(71, 'title_total_number_of_customers', 'Total Number of Customers', 'Toplam M????teri Say??s??', 0, 0, 1, '2021-03-16 12:30:14', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(72, 'title_total_number_of_orders', 'Total Number of Orders', 'Toplam Sipari?? Say??s??', 0, 0, 1, '2021-03-16 12:30:14', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(73, 'title_monthly_average_number_of_orders', 'Monthly Average Number of Orders', 'Ayl??k Ortalama Sipari?? Say??s??', 0, 0, 1, '2021-03-16 12:30:14', '2021-03-06 23:55:29', '2021-03-06 23:05:45'),
(74, 'title_average_order_amount', 'Average Order Amount', 'Ortalama Sipari?? Miktar??', 0, 0, 1, '2021-03-16 12:30:14', '2021-03-07 00:14:36', '2021-03-06 23:05:45'),
(75, 'title_highest_order_amount', 'Highest Order Amount', 'En Y??ksek Sipari?? Miktar??', 0, 0, 1, '2021-03-16 12:30:14', '2021-03-07 00:14:36', '2021-03-06 23:05:45'),
(76, 'title_id', 'ID', 'ID', 0, 0, 1, '2021-03-16 12:30:26', '2021-03-07 00:14:36', '2021-03-06 23:05:45'),
(77, 'title_customer', 'Customer', 'M????teriler', 0, 0, 1, '2021-03-16 12:30:26', '2021-03-07 00:14:36', '2021-03-06 23:05:45'),
(78, 'title_country', 'Country', '??lke', 0, 1, 1, '2021-03-16 12:30:26', '2021-03-16 12:29:12', '2021-03-06 23:05:45'),
(79, 'title_payment_method', 'Payment Method', '??deme Y??ntemi', 0, 0, 1, '2021-03-16 12:30:26', '2021-03-07 00:14:36', '2021-03-06 23:05:45'),
(80, 'title_order_status', 'Order Status', 'Sipari?? Durumu', 0, 1, 1, '2021-03-16 12:30:26', '2021-03-07 00:14:36', '2021-03-06 23:05:45'),
(81, 'title_amount', 'Amount', 'Miktar', 0, 1, 1, '2021-03-16 12:30:26', '2021-03-07 00:14:36', '2021-03-06 23:05:45'),
(82, 'title_date', 'Date', 'Tarih', 0, 1, 1, '2021-03-16 12:30:26', '2021-03-07 01:14:34', '2021-03-06 23:05:45'),
(83, 'title_latest_addons', 'Latest Add-ons', 'Son Eklentiler', 0, 0, 1, '2021-03-16 12:30:14', '2021-03-06 23:33:30', '2021-03-06 23:05:46'),
(84, 'title_most_recent_forum_topics', 'Most Recent Forum Topics', 'En son forum ba??l??klar??', 0, 0, 1, '2021-03-16 12:30:14', '2021-03-06 23:33:30', '2021-03-06 23:05:47'),
(85, 'text_by', 'by', 'taraf??ndan', 0, 0, 1, '2021-03-16 12:30:14', '2021-03-06 23:33:30', '2021-03-06 23:05:47'),
(86, 'title_search', 'Search', 'Ara', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:33:30', '2021-03-06 23:05:47'),
(87, 'title_webmail', 'Webmail', 'Webmail', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:33:30', '2021-03-06 23:05:47'),
(88, 'title_control_panel', 'Control Panel', 'Kontrol Paneli', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:33:30', '2021-03-06 23:05:47'),
(89, 'title_database_manager', 'Database Manager', 'Veritaban?? Y??neticisi', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:33:30', '2021-03-06 23:05:47'),
(90, 'title_frontend', 'Frontend', 'Site Aray??z??', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:33:30', '2021-03-06 23:05:47'),
(91, 'title_help', 'Help', 'Yard??m', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:33:30', '2021-03-06 23:05:47'),
(92, 'title_logout', 'Logout', '????k????', 0, 1, 1, '2021-03-16 12:30:31', '2021-03-06 23:55:29', '2021-03-06 23:05:47'),
(93, 'title_add_new_language', 'Add New Language', 'Yeni Dil Ekle', 0, 0, 1, '2021-03-16 12:27:25', '2021-03-06 23:34:21', '2021-03-06 23:05:52'),
(94, 'title_code', 'Code', 'Kod', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:34:21', '2021-03-06 23:05:52'),
(95, 'title_name', 'Name', '??sim', 0, 1, 1, '2021-03-16 12:27:31', '2021-03-06 23:34:21', '2021-03-06 23:05:52'),
(96, 'title_url_type', 'URL Type', 'URL T??r??', 0, 0, 1, '2021-03-16 12:27:25', '2021-03-06 23:34:21', '2021-03-06 23:05:52'),
(97, 'title_default_language', 'Default Language', 'Varsay??lan dil', 0, 0, 1, '2021-03-16 12:27:25', '2021-03-06 23:34:21', '2021-03-06 23:05:52'),
(98, 'title_store_language', 'Store Language', 'Ma??aza dili', 0, 0, 1, '2021-03-16 12:27:25', '2021-03-06 23:34:21', '2021-03-06 23:05:52'),
(99, 'title_priority', 'Priority', '??ncelik', 0, 0, 1, '2021-03-16 12:27:25', '2021-03-06 23:34:21', '2021-03-06 23:05:52'),
(100, 'title_edit', 'Edit', 'D??zenle', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-06 23:34:21', '2021-03-06 23:05:52'),
(101, 'title_enable', 'Enable', 'Etkinle??tir', 0, 0, 1, '2021-03-16 12:27:25', '2021-03-06 23:34:21', '2021-03-06 23:05:52'),
(102, 'title_disable', 'Disable', 'Devre D?????? B??rak', 0, 0, 1, '2021-03-16 12:27:25', '2021-03-06 23:55:29', '2021-03-06 23:05:52'),
(103, 'title_status', 'Status', 'Durum', 0, 0, 1, '2021-03-16 12:25:53', '2021-03-06 23:35:57', '2021-03-06 23:05:54'),
(104, 'title_enabled', 'Enabled', 'Etkin', 0, 0, 1, '2021-03-16 12:25:53', '2021-03-06 23:35:57', '2021-03-06 23:05:54'),
(105, 'title_hidden', 'Hidden', 'Gizle', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:35:57', '2021-03-06 23:05:54'),
(106, 'title_disabled', 'Disabled', 'Devred??????', 0, 0, 1, '2021-03-16 12:25:53', '2021-03-06 23:35:57', '2021-03-06 23:05:54'),
(107, 'title_charset', 'Charset', 'Karakter k??mesi', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:35:57', '2021-03-06 23:05:54'),
(108, 'title_system_locale', 'System Locale', 'Sistem Yerel Ayar??', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:35:57', '2021-03-06 23:05:54'),
(109, 'title_none', 'None', 'Hi??biri', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:35:57', '2021-03-06 23:05:54'),
(110, 'title_path_prefix', 'Path Prefix', 'Dizin ??neki', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:35:57', '2021-03-06 23:05:54'),
(111, 'title_domain', 'Domain', 'Alanad??', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:35:57', '2021-03-06 23:05:54'),
(112, 'title_domain_name', 'Domain Name', 'Alanad?? ??smi', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:35:57', '2021-03-06 23:05:54'),
(113, 'title_date_format', 'Date Format', 'Tarih Bi??imi', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:34:21', '2021-03-06 23:05:54'),
(114, 'title_time_format', 'Time Format', 'Zaman Bi??imi', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:34:21', '2021-03-06 23:05:54'),
(115, 'title_raw_date_format', 'Raw Date Format', 'Ham Tarih Bi??imi', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:34:21', '2021-03-06 23:05:54'),
(116, 'title_raw_time_format', 'Raw Time Format', 'Ham Saat Bi??imi', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:34:21', '2021-03-06 23:05:54'),
(117, 'title_decimal_point', 'Decimal Point', 'Ondal??k Nokta', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:34:21', '2021-03-06 23:05:54'),
(118, 'char_dot', 'Dot', 'Nokta', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:34:21', '2021-03-06 23:05:54'),
(119, 'char_comma', 'Comma', 'Virg??l', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:34:21', '2021-03-06 23:05:54'),
(120, 'title_thousands_sep', 'Thousands Separator', 'Bin Ay??r??c??', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:34:21', '2021-03-06 23:05:54'),
(121, 'char_space', 'Space', 'Bo??luk', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:34:21', '2021-03-06 23:05:54'),
(122, 'char_nonbreaking_space', 'Non-Breaking Space', 'Kesilmeyen Alan', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:34:21', '2021-03-06 23:05:54'),
(123, 'char_single_quote', 'Single quote', 'Tek fiyat teklifi', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:34:21', '2021-03-06 23:05:54'),
(124, 'title_force_currency_code', 'Force Currency Code', 'Para Birimi Kodunu Zorla', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:34:21', '2021-03-06 23:05:54'),
(125, 'description_set_as_default_language', 'Set as default language', 'Varsay??lan dil olarak ayarla', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:34:21', '2021-03-06 23:05:54'),
(126, 'description_set_as_store_language', 'Set as store language', 'Ma??aza dili olarak ayarla', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:34:21', '2021-03-06 23:05:54'),
(127, 'title_save', 'Save', 'Kaydet', 0, 1, 1, '2021-03-16 12:30:31', '2021-03-06 23:34:21', '2021-03-06 23:05:54'),
(128, 'title_cancel', 'Cancel', '??ptal', 0, 0, 1, '2021-03-16 12:25:53', '2021-03-06 23:34:21', '2021-03-06 23:05:54'),
(129, 'success_changes_saved', 'Changes saved', 'De??i??iklikler ba??ar??yla kaydedildi', 0, 0, 0, NULL, '2021-03-06 23:35:57', '2021-03-06 23:06:45'),
(130, 'title_translator_tool', 'Translator Tool', '??evirmen Arac??', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:39:06', '2021-03-06 23:06:50'),
(131, 'text_search_phrase_or_keyword', 'Search phrase or keyword', 'Aranacak anahtar kelime', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:39:06', '2021-03-06 23:06:50'),
(132, 'title_all', 'All', 'Hepsi', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:39:06', '2021-03-06 23:06:50'),
(133, 'title_backend', 'Backend', 'Arka u??', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:35:57', '2021-03-06 23:06:50'),
(134, 'text_inlcude_modules', 'Include modules', 'Mod??lleri i??er', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:35:57', '2021-03-06 23:06:50'),
(135, 'text_only_untranslated', 'Only untranslated', 'Sadece ??evrilmemi??', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:35:57', '2021-03-06 23:06:50'),
(136, 'text_html_enabled', 'HTML enabled', 'HTML etkin', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:35:57', '2021-03-06 23:06:50'),
(137, 'title_remove', 'Remove', 'Kald??r', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:35:57', '2021-03-06 23:06:50'),
(138, 'title_previous', 'Previous', '??nceki', 0, 0, 1, '2021-03-16 12:30:29', '2021-03-06 23:35:57', '2021-03-06 23:06:50'),
(139, 'title_next', 'Next', 'Sonraki', 0, 0, 1, '2021-03-16 12:30:29', '2021-03-06 23:35:57', '2021-03-06 23:06:50'),
(140, 'title_from_language', 'From Language', 'Dilden', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:35:57', '2021-03-06 23:06:50'),
(141, 'title_select', 'Select', 'Se??', 0, 1, 1, '2021-03-16 12:30:31', '2021-03-06 23:35:57', '2021-03-06 23:06:50'),
(142, 'title_to_language', 'To Language', 'Dile', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:35:57', '2021-03-06 23:06:50'),
(143, 'text_copy_below_to_translation_service', 'Copy below to translation service', '??eviri hizmetine a??a????ya kopyalay??n', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:35:57', '2021-03-06 23:06:50'),
(144, 'text_paste_your_translated_result_below', 'Paste your translated result below', '??evrilmi?? sonucunuzu a??a????ya yap????t??r??n', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:35:57', '2021-03-06 23:06:50'),
(145, 'title_prefill_fields', 'Prefill Fields', 'Alanlar?? doldur', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:35:57', '2021-03-06 23:06:50'),
(146, 'text_are_you_sure', 'Are you sure?', 'Emin misiniz?', 0, 0, 1, '2021-03-16 12:30:31', '2021-03-06 23:35:57', '2021-03-06 23:06:50'),
(147, 'title_import_export_csv', 'Import/Export CSV', 'CSV ????e/D????a Aktar', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(148, 'title_import_from_csv', 'Import From CSV', 'CSV\'den Aktar', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(149, 'title_export_to_csv', 'Export To CSV', 'CSV\'ye Aktar', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(150, 'title_csv_file', 'CSV File', 'CSV Dosyas??', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(151, 'title_delimiter', 'Delimiter', 'Ayra??', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(152, 'title_auto', 'Auto', 'Otomatik', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(153, 'text_default', 'default', 'Varsay??lan', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(154, 'title_enclosure', 'Enclosure', '??evreleme', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-16 12:12:36', '2021-03-06 23:06:53'),
(155, 'title_escape_character', 'Escape Character', 'Ka?????? Karakteri', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(156, 'title_update_existing', 'Update Existing', 'Varolan?? G??ncelle', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(157, 'text_insert_new', 'Insert New', 'Yeni Ekle', 0, 0, 1, '2021-03-07 00:16:01', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(158, 'text_append_missing', 'Append Missing', 'Olmayan?? Sona Ekle', 0, 0, 1, '2021-03-07 00:16:01', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(159, 'description_scan_before_importing_translations', 'It is recommended to always scan your installation for unregistered translations before performing an import or export.', 'Bir i??e aktarma veya d????a aktarma i??lemine ba??lamadan ??nce, kayd??n??z??n kay??ts??z ??eviriler i??in her zaman taranmas?? ??nerilir.', 0, 0, 1, '2021-03-07 00:16:01', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(160, 'title_import', 'Import', '????e Aktar', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(161, 'title_line_ending', 'Line Ending', 'Biti?? Noktas??', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(162, 'title_output', 'Output', '????kt??', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(163, 'title_file', 'File', 'Dosya', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(164, 'title_screen', 'Screen', 'Ekran', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(165, 'title_export', 'Export', 'D????a Aktar', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-06 23:39:06', '2021-03-06 23:06:53'),
(166, 'success_updated_n_existing_entries', 'Updated %n existing entries', '%n var olan kay??t g??ncellendi', 0, 0, 0, NULL, '2021-03-06 23:39:06', '2021-03-06 23:06:58'),
(167, 'success_insert_n_new_entries', 'Inserted %n new entries', '%n yeni kay??t eklendi', 0, 0, 0, NULL, '2021-03-06 23:39:06', '2021-03-06 23:06:58'),
(168, 'title_edit_language', 'Edit Language', 'Dili D??zenle', 0, 0, 1, '2021-03-16 12:10:30', '2021-03-06 23:43:29', '2021-03-06 23:07:36'),
(169, 'title_delete', 'Delete', 'Kald??r', 0, 0, 1, '2021-03-16 12:26:13', '2021-03-06 23:39:06', '2021-03-06 23:07:36'),
(170, 'description_set_mysql_collation', 'This will recursively convert the charset and collation for all selected database tables and belonging columns.', 'Bu ??z yinelemeli bir ??ekilde karakter k??mesi ve tan??mlamalar?? se??ili t??m veritaban?? tablo ve ait olan kolonlar??na uygulayacakt??r.', 0, 0, 1, '2021-03-07 00:21:59', '2021-03-06 23:43:29', '2021-03-06 23:08:01'),
(171, 'title_database_tables', 'Database Tables', 'Veritaban?? Tablolar??', 0, 0, 1, '2021-03-07 00:21:59', '2021-03-06 23:43:29', '2021-03-06 23:08:01'),
(172, 'title_table', 'Table', 'Tablo', 0, 0, 1, '2021-03-07 00:21:59', '2021-03-06 23:43:29', '2021-03-06 23:08:01'),
(173, 'title_collation', 'Collation', 'Tan??mlama', 0, 0, 1, '2021-03-07 00:21:59', '2021-03-06 23:43:29', '2021-03-06 23:08:01'),
(174, 'title_engine', 'Engine', 'Motor', 0, 0, 1, '2021-03-07 00:21:59', '2021-03-06 23:43:29', '2021-03-06 23:08:01'),
(175, 'title_tables', 'Tables', 'Tablolar', 0, 0, 1, '2021-03-07 00:21:59', '2021-03-06 23:43:29', '2021-03-06 23:08:01'),
(176, 'text_also_set_as_database_default', 'Also set as database default (when new tables are created)', 'Ayr??ca veritaban?? varsay??lan?? ayarla', 0, 0, 1, '2021-03-07 00:21:59', '2021-03-06 23:43:29', '2021-03-06 23:08:01'),
(177, 'title_convert', 'Convert', 'D??n????t??r', 0, 0, 1, '2021-03-07 00:21:59', '2021-03-06 23:43:29', '2021-03-06 23:08:01'),
(178, 'title_key', 'Key', 'Anahtar', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-06 23:48:58', '2021-03-06 23:08:05'),
(179, 'title_value', 'Value', 'De??er', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-06 23:48:58', '2021-03-06 23:08:05'),
(180, 'settings_key:title_store_name', 'Store Name', 'Ma??aza Ad??', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(181, 'settings_key:description_store_name', 'The name of your store.', 'Ma??azan??n ad??', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(182, 'settings_key:title_store_email', 'Store Email', 'Ma??aza Email Adresi', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(183, 'settings_key:description_store_email', 'The store\'s email address.', 'Ma??azan??n email adresi', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(184, 'settings_key:title_store_tax_id', 'Store Tax ID', 'Ma??aza Vergi Numaras??', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(185, 'settings_key:description_store_tax_id', 'The store\'s tax ID or VATIN.', 'Ma??azan??z??n TC ya da vergi numaras??', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(186, 'settings_key:title_store_postal_address', 'Store Postal Address', 'Ma??aza Posta Adresi', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(187, 'settings_key:description_store_postal_address', 'The store\'s postal address.', 'Ma??azan??z??n posta adresi', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(188, 'settings_key:title_store_visiting_address', 'Store Visiting Address', 'Ma??aza Ziyaret Adresi', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(189, 'settings_key:description_store_visiting_address', 'The physical store address, if applicable.', 'Fiziksel ma??azan??z??n adresi varsa', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(190, 'settings_key:title_store_phone', 'Store Phone Number', 'Ma??aza Telefon Numaras??', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(191, 'settings_key:description_store_phone', 'The store\'s phone number.', 'Ma??aza telefon numaras??', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(192, 'settings_key:title_store_country_code', 'Store Country', 'Ma??aza ??lkesi', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:29:12', '2021-03-06 23:08:05'),
(193, 'settings_key:description_store_country_code', 'The country of your store.', 'Ma??azan??z??n ??lkesi', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:29:12', '2021-03-06 23:08:05'),
(194, 'settings_key:title_store_zone_code', 'Store Zone', 'Ma??aza ??ehri', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-08 04:24:43', '2021-03-06 23:08:05'),
(195, 'settings_key:description_store_zone_code', 'The zone of your store.', 'Ma??azan??z??n bulundu??u b??lge', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:30:07', '2021-03-06 23:08:05'),
(196, 'settings_key:title_store_postcode', 'Store Postcode', 'Ma??aza Posta Kodu', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(197, 'settings_key:description_store_postcode', 'The postcode of your store.', 'Ma??azan??z??n postakodu', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(198, 'settings_key:title_store_timezone', 'Store Time Zone', 'Ma??aza Zaman Dilimi', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(199, 'settings_key:description_store_timezone', 'The store\'s time zone.', 'Ma??azan??z??n zaman dilimi', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-08 04:27:24', '2021-03-06 23:08:05'),
(200, 'settings_key:title_store_language_code', 'Store Language', 'Ma??aza Dili', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(201, 'settings_key:description_store_language_code', 'The spoken language of your organization.', 'Organizasyonunuzda konu??ulan dil', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-06 23:43:29', '2021-03-06 23:08:05'),
(202, 'settings_key:title_store_currency_code', 'Store Currency', 'Ma??aza Para Birimi', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-08 04:27:24', '2021-03-06 23:08:05'),
(203, 'settings_key:description_store_currency_code', 'The currency which all prices conform to.', 'T??m fiyatlar??n kar????l??k gelece??i para birimi', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-06 23:43:29', '2021-03-06 23:08:05'),
(204, 'settings_key:title_store_weight_class', 'Store Weight Class', 'Ma??aza A????rl??k S??n??f??', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-08 04:27:24', '2021-03-06 23:08:05'),
(205, 'settings_key:description_store_weight_class', 'The preferred weight class.', 'Tercih etti??iniz a????rl??k s??n??f??', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-06 23:43:29', '2021-03-06 23:08:05'),
(206, 'settings_key:title_store_length_class', 'Store Length Class', 'Ma??aza Uzunluk S??n??f??', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-16 12:12:36', '2021-03-06 23:08:05'),
(207, 'settings_key:description_store_length_class', 'The preferred length class.', 'Tercih etti??iniz uzunluk s??n??f??', 0, 0, 1, '2021-03-16 12:30:15', '2021-03-06 23:43:29', '2021-03-06 23:08:05'),
(208, 'title_true', 'True', 'Evet', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:55:04', '2021-03-06 23:08:07'),
(209, 'settings_key:title_default_language_code', 'Default Language', 'Varsay??lan Dil', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-06 23:21:38', '2021-03-06 23:08:07'),
(210, 'settings_key:description_default_language_code', 'The default language, if not identified.', 'Varsay??lan Dil', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-06 23:55:04', '2021-03-06 23:08:07'),
(211, 'settings_key:title_default_currency_code', 'Default Currency', 'Varsay??lan Para Birimi', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-06 23:55:04', '2021-03-06 23:08:07'),
(212, 'settings_key:description_default_currency_code', 'The default currency, if not identified.', 'Varsay??lan para birimi', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-06 23:55:04', '2021-03-06 23:08:07'),
(213, 'settings_key:title_default_country_code', 'Default Country', 'Varsay??lan ??lke', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-16 12:29:12', '2021-03-06 23:08:07'),
(214, 'settings_key:description_default_country_code', 'The default country, if not otherwise set.', 'Varsay??lan ??lke', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-16 12:29:12', '2021-03-06 23:08:07'),
(215, 'settings_key:title_default_zone_code', 'Default Zone', 'Varsay??lan B??lge', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-16 12:30:07', '2021-03-06 23:08:07'),
(216, 'settings_key:description_default_zone_code', 'The default zone, if not otherwise set.', 'Varsay??lan b??lge', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-16 12:30:07', '2021-03-06 23:08:07'),
(217, 'settings_key:title_default_tax_class_id', 'Default Tax Class', 'Varsay??lan Vergi S??n??f??', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-07 01:20:57', '2021-03-06 23:08:07'),
(218, 'settings_key:description_default_tax_class_id', 'The default tax class that will be preset when creating new products.', 'Yeni ??r??n eklenirken kullan??lacak varsay??lan vergi s??n??f??', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-07 01:20:57', '2021-03-06 23:08:07'),
(219, 'settings_key:title_default_display_prices_including_tax', 'Default Display Prices Including Tax', 'Vergi Eklenmi?? Varsay??lan G??r??nen Fiyatlar', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-07 01:20:57', '2021-03-06 23:08:07'),
(220, 'settings_key:description_default_display_prices_including_tax', 'Display prices including tax by default.', 'Varsay??lan olarak fiyatlar vergi dahildir', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-08 04:21:20', '2021-03-06 23:08:07'),
(221, 'settings_key:title_default_quantity_unit_id', 'Default Quantity Unit', 'Varsay??lan Miktar Birimi', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-06 23:48:58', '2021-03-06 23:08:07'),
(222, 'settings_key:description_default_quantity_unit_id', 'The default quantity unit, if not otherwise set.', 'Varsay??lan miktar birimi', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-06 23:48:58', '2021-03-06 23:08:07'),
(223, 'settings_key:title_default_sold_out_status_id', 'Default Sold Out Status', 'Varsay??lan T??kendi Durumu', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-06 23:48:58', '2021-03-06 23:08:07'),
(224, 'settings_key:description_default_sold_out_status_id', 'The default sold-out status, if not otherwise set.', 'Varsay??lan t??kendi durumu', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-06 23:48:58', '2021-03-06 23:08:07'),
(225, 'settings_key:title_default_delivery_status_id', 'Default Delivery Status', 'Varsay??lan Ta????mada Durumu', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-06 23:48:58', '2021-03-06 23:08:07'),
(226, 'settings_key:description_default_delivery_status_id', 'The default delivery status, if not otherwise set.', 'Varsay??lan ta????ma durumu', 0, 0, 1, '2021-03-16 12:15:46', '2021-03-06 23:48:58', '2021-03-06 23:08:07'),
(227, 'title_false', 'False', 'Hay??r', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:55:04', '2021-03-06 23:08:13'),
(228, 'settings_key:title_email_status', 'Send Emails', 'Email G??nder', 0, 0, 1, '2021-03-16 12:15:49', '2021-03-06 23:55:04', '2021-03-06 23:08:13'),
(229, 'settings_key:description_email_status', 'Whether or not the platform should deliver outgoing emails.', 'Platform giden mailleri iletecek mi?', 0, 0, 1, '2021-03-16 12:15:49', '2021-03-06 23:55:04', '2021-03-06 23:08:13'),
(230, 'settings_key:title_smtp_status', 'SMTP Enabled', 'SMTP Aktif', 0, 0, 1, '2021-03-16 12:15:49', '2021-03-06 23:55:04', '2021-03-06 23:08:13'),
(231, 'settings_key:description_smtp_status', 'Whether or not to use an SMTP server for delivering email.', 'Mailleri g??ndermek i??in SMTP kullan??lacak m???', 0, 0, 1, '2021-03-16 12:15:49', '2021-03-06 23:55:04', '2021-03-06 23:08:13'),
(232, 'settings_key:title_smtp_host', 'SMTP Host', 'SMTP Host', 0, 0, 1, '2021-03-16 12:15:49', '2021-03-06 23:55:04', '2021-03-06 23:08:13'),
(233, 'settings_key:description_smtp_host', 'SMTP hostname, e.g. smtp.myprovider.com.', 'SMTP Hostname ??r smtp.site.com', 0, 0, 1, '2021-03-16 12:15:49', '2021-03-06 23:55:04', '2021-03-06 23:08:13'),
(234, 'settings_key:title_smtp_port', 'SMTP Port', 'SMTP Port', 0, 0, 1, '2021-03-16 12:15:49', '2021-03-06 23:55:04', '2021-03-06 23:08:13'),
(235, 'settings_key:description_smtp_port', 'SMTP port, e.g. 25, 465 (SSL/TLS), or 587 (STARTTLS).', 'SMTP port, ??r. 25', 0, 0, 1, '2021-03-16 12:15:49', '2021-03-06 23:55:04', '2021-03-06 23:08:13'),
(236, 'settings_key:title_smtp_username', 'SMTP Username', 'SMTP Kullan??c?? Ad??', 0, 0, 1, '2021-03-16 12:15:49', '2021-03-06 23:55:04', '2021-03-06 23:08:13'),
(237, 'settings_key:description_smtp_username', 'Username for SMTP authentication.', 'SMTP i??in kullan??c?? ad??', 0, 0, 1, '2021-03-16 12:15:49', '2021-03-06 23:55:04', '2021-03-06 23:08:13'),
(238, 'settings_key:title_smtp_password', 'SMTP Password', 'SMTP ??ifresi', 0, 0, 1, '2021-03-16 12:15:49', '2021-03-06 23:55:04', '2021-03-06 23:08:13'),
(239, 'settings_key:description_smtp_password', 'Password for SMTP authentication.', 'SMTP i??in ??ifre', 0, 0, 1, '2021-03-16 12:15:49', '2021-03-06 23:55:04', '2021-03-06 23:08:13'),
(240, 'settings_key:title_catalog_only_mode', 'Catalog Only Mode', 'Sadece Katalog Modu', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(241, 'settings_key:description_catalog_only_mode', 'Disables the cart and checkout features leaving only a browsable catalog.', 'Sepet ve sat??n alma ??zelliklerini devre d?????? b??rak??p gezilebilir bir katalog sunar', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(242, 'settings_key:title_maintenance_mode', 'Maintenance Mode', 'Bak??m Modu', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(243, 'settings_key:description_maintenance_mode', 'Setting the store in maintenance mode will prevent users from browsing your site.', 'Bak??m modu kullan??c??lar??n siteyi kullanmas??n?? engeller.', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(244, 'settings_key:title_items_per_page', 'Items Per Page', 'Sayfa Ba????na Kay??t', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(245, 'settings_key:description_items_per_page', 'The number of items to be displayed per page.', 'Sayfa ba????na ka?? kay??t g??sterilece??inin say??s??', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(246, 'settings_key:title_data_table_rows_per_page', 'Data Table Rows', 'Veri Tablosu Sat??rlar??', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(247, 'settings_key:description_data_table_rows_per_page', 'The number of data table rows to be displayed per page.', 'Sayfa ba????na ka?? kay??t g??sterilece??inin say??s??', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(248, 'settings_key:title_display_stock_count', 'Display Stock Count', 'Stok Say??s??n?? G??ster', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(249, 'settings_key:description_display_stock_count', 'Show the available amount of products in stock.', 'Bulunan ??r??nlerin stok say??s??n?? g??ster', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(250, 'settings_key:title_display_cheapest_shipping', 'Cheapest Shipping', 'En Ucuz Kargo', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(251, 'settings_key:description_display_cheapest_shipping', 'Display the cheapest shipping cost on product page.', 'En ucuz kargo fiyat??n?? ??r??n sayfas??nda g??ster', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(252, 'settings_key:title_new_products_max_age', 'Max Age for New Products', 'Yeni ??r??nler i??in Maks Ya??', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(253, 'settings_key:description_new_products_max_age', 'Display the \"New\" sticker for products less than the given age. E.g. 1 month or 14 days', 'Yeni damgas??n?? verilen s??reden az ??r??nler i??in g??ster', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(254, 'settings_key:title_box_similar_products_num_items', 'Similar Products Box: Number of Items', 'Benzer ??r??n Kutular??: ??r??nlerin Say??s??', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(255, 'settings_key:description_box_similar_products_num_items', 'The maximum number of items to be displayed in the box.', 'Kutuda g??sterilecek ??r??nlerin maks say??s??', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(256, 'settings_key:title_box_recently_viewed_products_num_items', 'Recently Viewed Products Box: Number of Items', 'Yak??nda G??r??nt??lenen ??r??nler Kutusu: ??r??nlerin Say??s??', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(257, 'settings_key:description_box_recently_viewed_products_num_items', 'The maximum number of items to be displayed in the box.', 'Kutuda g??sterilecek ??r??nlerin maks say??s??', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(258, 'settings_key:title_box_latest_products_num_items', 'Latest Products Box: Number of Items', 'En Yeni ??r??nler Kutusu: ??r??nlerin Say??s??', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(259, 'settings_key:description_box_latest_products_num_items', 'The maximum number of items to be displayed in the box.', 'Kutuda g??sterilecek ??r??nlerin maks say??s??', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(260, 'settings_key:title_box_popular_products_num_items', 'Popular Products Box: Number of Items', 'Pop??ler ??r??nler Kutusu: ??r??nlerin Say??s??', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(261, 'settings_key:description_box_popular_products_num_items', 'The maximum number of items to be displayed in the box.', 'Kutuda g??sterilecek ??r??nlerin maks say??s??', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(262, 'settings_key:title_box_campaign_products_num_items', 'Campaign Products Box: Number of Items', 'Kampanyal?? ??r??nler Kutusu: ??r??nlerin Say??s??', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-07 00:13:59', '2021-03-06 23:08:14'),
(263, 'settings_key:description_box_campaign_products_num_items', 'The maximum number of items to be displayed in the box.', 'Kutuda g??sterilecek maksimum kay??t say??s??', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-06 23:55:04', '2021-03-06 23:08:14'),
(264, 'settings_key:title_box_also_purchased_products_num_items', 'Also Purchased Products Box: Number of Items', 'Ayr??ca Sat??n Al??nm???? ??r??nlerin Kutusu: Kay??tlar??n Say??s??', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-06 23:55:04', '2021-03-06 23:08:14'),
(265, 'settings_key:description_box_also_purchased_products_num_items', 'The maximum number of items to be display in the box.', 'Kutuda g??sterilecek maksimum kay??t say??s??', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-06 23:55:04', '2021-03-06 23:08:14'),
(266, 'settings_key:title_auto_decimals', 'Auto Decimals', 'Otomatik Say??lar', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-06 23:55:04', '2021-03-06 23:08:14'),
(267, 'settings_key:description_auto_decimals', 'Don\'t show decimals for integers. Will turn 99.00 into 99 but leave 99.99.', 'Tam say??larda virg??lden sonras??n?? g??sterme. 99.00 99 a d??n??????r fakat 99.99 oldu??u gibi kals??n', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-06 23:55:04', '2021-03-06 23:08:14'),
(268, 'settings_key:title_category_tree_product_count', 'Show Product Count In Category Tree', 'Kategori A??ac??nda ??r??n Say??s??n?? G??ster', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-06 23:54:21', '2021-03-06 23:08:14'),
(269, 'settings_key:description_category_tree_product_count', 'Show the number of products inside each category in the category tree.', '??r??nlerin say??s??n?? kategori a??ac??ndaki her kategoride g??ster', 0, 0, 1, '2021-03-16 12:15:51', '2021-03-06 23:54:21', '2021-03-06 23:08:14'),
(270, 'settings_key:title_regional_settings_screen', 'Regional Settings Screen', 'B??lgesel Ayarlar Ekran??', 0, 0, 1, '2021-03-16 12:15:52', '2021-03-08 04:24:43', '2021-03-06 23:08:15'),
(271, 'settings_key:description_regional_settings_screen', 'Enables the regional settings screen upon first visit.', '??lk ziyarette b??lgesel ayarlar?? ekran??n ??st??nde g??ster', 0, 0, 1, '2021-03-16 12:15:52', '2021-03-08 04:24:43', '2021-03-06 23:08:15'),
(272, 'settings_key:title_accounts_enabled', 'Enable Customer Accounts', 'M????teri Hesaplar??n?? Etkinle??tir', 0, 0, 1, '2021-03-16 12:15:52', '2021-03-07 00:08:44', '2021-03-06 23:08:15'),
(273, 'settings_key:description_accounts_enabled', 'Allow customers to create an account and sign in.', 'M????terilerin hesap olu??turup giri?? yapmas??na izin ver', 0, 0, 1, '2021-03-16 12:15:52', '2021-03-07 00:08:44', '2021-03-06 23:08:15'),
(274, 'settings_key:title_customer_field_company', 'Company Field', '??irket Alan??', 0, 0, 1, '2021-03-16 12:15:52', '2021-03-07 00:08:44', '2021-03-06 23:08:15'),
(275, 'settings_key:description_customer_field_company', 'Display the field for the customer\'s company name.', 'M????terinin ??irketinin ad?? i??in alan g??ster', 0, 0, 1, '2021-03-16 12:15:52', '2021-03-07 00:08:44', '2021-03-06 23:08:15'),
(276, 'settings_key:title_customer_field_tax_id', 'Tax ID Field', 'Vergi Numaras?? Alan??', 0, 0, 1, '2021-03-16 12:15:52', '2021-03-07 01:20:57', '2021-03-06 23:08:15'),
(277, 'settings_key:description_customer_field_tax_id', 'Display the field for the customer\'s tax ID.', 'M????terinin ??irketinin vergi numaras?? i??in alan g??ster', 0, 0, 1, '2021-03-16 12:15:52', '2021-03-07 01:20:57', '2021-03-06 23:08:15'),
(278, 'settings_key:title_customer_field_zone', 'Zone/State/Province Field', 'B??lge/??lke/??ehir Alan??', 0, 0, 1, '2021-03-16 12:15:52', '2021-03-16 12:30:07', '2021-03-06 23:08:15'),
(279, 'settings_key:description_customer_field_zone', 'Display the field for the customer\'s zone/state.', 'M????terinin ??irketinin b??lge/??lkesi i??in alan g??ster', 0, 0, 1, '2021-03-16 12:15:52', '2021-03-16 12:29:12', '2021-03-06 23:08:15'),
(280, 'settings_key:title_cookie_policy', 'Cookie Policy', '??erezler Politikas??', 0, 0, 1, '2021-03-16 12:15:53', '2021-03-07 00:08:44', '2021-03-06 23:08:16'),
(281, 'settings_key:description_cookie_policy', 'Select a page for the cookie policy or leave blank to disable.', '??erezler Politikas?? i??in bir sayfa se?? ya da pasif etmek i??in bo?? b??rak', 0, 0, 1, '2021-03-16 12:15:53', '2021-03-07 00:08:44', '2021-03-06 23:08:16'),
(282, 'settings_key:title_privacy_policy', 'Privacy Policy', 'Gizlilik Politikas??', 0, 0, 1, '2021-03-16 12:15:53', '2021-03-07 00:08:44', '2021-03-06 23:08:16'),
(283, 'settings_key:description_privacy_policy', 'Select a page for the privacy policy consent or leave blank to disable.', 'Gizlilik Politikas?? i??in bir sayfa se?? ya da pasif etmek i??in bo?? b??rak', 0, 0, 1, '2021-03-16 12:15:53', '2021-03-07 00:08:44', '2021-03-06 23:08:16'),
(284, 'settings_key:title_terms_of_purchase', 'Terms of Purchase', 'Sat??n Alma Kurallar??', 0, 0, 1, '2021-03-16 12:15:53', '2021-03-07 00:08:44', '2021-03-06 23:08:16'),
(285, 'settings_key:description_terms_of_purchase', 'Select a page for the terms of purchase or leave blank to disable.', 'Sat??n Alma Kurallar?? i??in bir sayfa se?? ya da pasif etmek i??in bo?? b??rak', 0, 0, 1, '2021-03-16 12:15:53', '2021-03-07 00:08:44', '2021-03-06 23:08:16'),
(286, 'settings_key:title_cache_clear_thumbnails', 'Clear Thumbnails Cache', 'K??????k Foto??raf ??nbelle??ini Temizle', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:02:10', '2021-03-06 23:08:17'),
(287, 'settings_key:description_cache_clear_thumbnails', 'Remove all cached image thumbnails from disk.', 'T??m ??nbelleklenmi?? k??????k foto??raflar?? diskten sil', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:02:10', '2021-03-06 23:08:17'),
(288, 'settings_key:title_category_image_ratio', 'Category Images: Aspect Ratio', 'Kategori Resimleri: G??r??nt?? Oran??', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:02:10', '2021-03-06 23:08:17'),
(289, 'settings_key:description_category_image_ratio', 'The aspect ratio of the category thumbnails', 'Kategori k??????k foto??raflar??n??n g??r??nt?? oran??', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:02:10', '2021-03-06 23:08:17'),
(290, 'settings_key:title_category_image_clipping', 'Category Images: Clipping Method', 'Kategori Resimleri: Kesim Metodu', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:02:10', '2021-03-06 23:08:17'),
(291, 'settings_key:description_category_image_clipping', 'The clipping method used for scaled category thumbnails.', '??l??eklendirilmi?? kategori k??????k foto??raflar?? i??in kullan??lacak kesim metodu', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:02:10', '2021-03-06 23:08:17'),
(292, 'settings_key:title_product_image_ratio', 'Product Images: Aspect Ratio', '??r??n Resimleri: G??r??nt?? Oran??', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:02:10', '2021-03-06 23:08:17'),
(293, 'settings_key:description_product_image_ratio', 'The aspect ratio of the product thumbnails', '??r??n k??????k foto??raflar?? i??in g??r??nt?? oran??', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:02:10', '2021-03-06 23:08:17'),
(294, 'settings_key:title_product_image_clipping', 'Product Images: Clipping Method', '??r??n Resimleri: Kesim Metodu', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:02:10', '2021-03-06 23:08:17'),
(295, 'settings_key:description_product_image_clipping', 'The clipping method used for scaled product thumbnails.', '??l??eklendirilmi?? ??r??n k??????k foto??raflar?? i??in kullan??lacak kesim metodu', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:02:10', '2021-03-06 23:08:17'),
(296, 'settings_key:title_product_image_trim', 'Product Images: Trim Whitespace', '??r??n Resimleri: Beyaz Bo??lu??u K??rp', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:02:10', '2021-03-06 23:08:17'),
(297, 'settings_key:description_product_image_trim', 'Trim whitespace before generating thumbnail images.', 'K??????k foto??raf olu??turmadan ??nce beyaz bo??lu??u k??rpar', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:02:10', '2021-03-06 23:08:17'),
(298, 'settings_key:title_image_downsample_size', 'Downsample', 'Downsample', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:02:10', '2021-03-06 23:08:17'),
(299, 'settings_key:description_image_downsample_size', 'Downsample large uploaded images to best fit within the given dimensions of \"width,height\" or leave empty. Default: 2048,2048', 'Downsample b??y??k y??klenmi?? foto??raflar?? verilen ??l????lere g??re en uygun hale getirir en. boy Varsay??lan 2048,2048', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:02:10', '2021-03-06 23:08:17'),
(300, 'settings_key:title_product_image_watermark', 'Product Images: Watermark', '??r??n Resimleri: Watermark', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:02:10', '2021-03-06 23:08:17'),
(301, 'settings_key:description_product_image_watermark', 'Watermark product images with the store logo.', '??r??n resimlerini ma??aza logosu ile watermarkla', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-08 04:27:24', '2021-03-06 23:08:17');
INSERT INTO `lc_translations` (`id`, `code`, `text_en`, `text_tr`, `html`, `frontend`, `backend`, `date_accessed`, `date_updated`, `date_created`) VALUES
(302, 'settings_key:title_image_quality', 'Image Quality', 'Resim Kalitesi', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:08:44', '2021-03-06 23:08:17'),
(303, 'settings_key:description_image_quality', 'The JPEG quality for uploaded images (0-100). Default: 90', 'Y??klenen resimler i??in JPEG kalitesi (0-100) Varsay??lan:90', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:08:44', '2021-03-06 23:08:17'),
(304, 'settings_key:title_image_thumbnail_quality', 'Thumbnail Quality', 'K??????k resim kalitesi', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:08:44', '2021-03-06 23:08:17'),
(305, 'settings_key:description_image_thumbnail_quality', 'The JPEG quality for thumbnail images (0-100). Default: 65', 'Y??klenen k??????k resimler i??in JPEG kalitesi (0-100) Varsay??lan:65', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:08:44', '2021-03-06 23:08:17'),
(306, 'settings_key:title_image_thumbnail_interlaced', 'Interlaced Thumbnails', 'Birbirine Ge??mi?? K??????k Resimler', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:08:44', '2021-03-06 23:08:17'),
(307, 'settings_key:description_image_thumbnail_interlaced', 'Generate interlaced thumbnail images for progressive loading. Increases the filesize by 10-20% but improves user experience.', '??lerlemeli y??kleme i??in i?? i??e ge??mi?? k??????k resimler ??ret. Dosya boyutunu 10-20% art??r??r ama kullan??c?? deneyimini art??r??r.', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:08:44', '2021-03-06 23:08:17'),
(308, 'settings_key:title_image_whitespace_color', 'Whitespace Color', 'Bo??luk Rengi', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:08:44', '2021-03-06 23:08:17'),
(309, 'settings_key:description_image_whitespace_color', 'Set the color of any generated whitespace to the given RGB value. Default: 255,255,255', 'Bo?? b??lgeler i??in bir RGB renk girin Varsay??lan: 255,255,255', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-08 04:24:43', '2021-03-06 23:08:17'),
(310, 'settings_key:title_webp_enabled', 'WebP Enabled', 'WebP Aktif', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:08:44', '2021-03-06 23:08:17'),
(311, 'settings_key:description_webp_enabled', 'Use WebP images if supported by the browser.', 'E??er taray??c?? destekliyorsa WebP resimleri kullan', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:08:44', '2021-03-06 23:08:17'),
(312, 'settings_key:title_send_order_confirmation', 'Send Order Confirmation', 'Sipari?? Onay?? G??nder', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 01:14:34', '2021-03-06 23:08:18'),
(313, 'settings_key:description_send_order_confirmation', 'Send order confirmations via email.', 'Sipari?? onaylar??n?? emaille g??nder', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 01:14:34', '2021-03-06 23:08:18'),
(314, 'settings_key:title_email_order_copy', 'Order Copy Recipients', 'Sipari?? Kopyas?? Al??c?? Listesi', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 01:14:34', '2021-03-06 23:08:18'),
(315, 'settings_key:description_email_order_copy', 'Send an email of the order copy to the given recipients. Separated by coma or semicolon.', 'Sipari??in kopyas??n?? verilen listedeki al??c??lara email g??nder. Virg??l ya da noktal??virg??l ile ayr??l??r', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 01:14:34', '2021-03-06 23:08:18'),
(316, 'settings_key:title_round_amounts', 'Round Amounts', 'Ortalanm???? Miktarlar', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 01:14:34', '2021-03-06 23:08:18'),
(317, 'settings_key:description_round_amounts', 'Round currency amounts to prevent exceeding decimals. Turns 29.9915 to 29.99', 'Tam say??y?? a??mas??n?? engellemesi i??in yuvarlak para birimi miktarlar??. 29.9915\'i 29.99\'a ??evirir.', 0, 0, 1, '2021-03-16 12:15:54', '2021-03-07 00:02:10', '2021-03-06 23:08:18'),
(318, 'settings_key:title_cache_enabled', 'System Cache Enabled', 'Sistem ??nbelle??i Aktif', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-07 01:14:34', '2021-03-06 23:08:19'),
(319, 'settings_key:description_cache_enabled', 'Enables the system cache module which caches frequently used data.', 'Kullan??c??lar??n s??kl??kla kullan?????? veri olan sistem ??nbelle??ini etkinle??tirir', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:55:53', '2021-03-06 23:08:19'),
(320, 'settings_key:title_cache_clear', 'Clear System Cache', 'Sistem ??nbelle??ini Temizle', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:55:53', '2021-03-06 23:08:19'),
(321, 'settings_key:description_cache_clear', 'Remove all cached system information.', 'T??m ??nbelleklenmi?? sistem verisini temizle', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:55:53', '2021-03-06 23:08:19'),
(322, 'settings_key:title_gzip_enabled', 'GZIP Enabled', 'GZIP Aktif', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:55:53', '2021-03-06 23:08:19'),
(323, 'settings_key:description_gzip_enabled', 'Compresses browser data. Increases the load on the server but decreases the bandwidth.', 'Taray??c?? verisini s??k????t??r??r. Sunucu y??k??n?? art??r??r ama bandwidthi azalt??r', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:55:53', '2021-03-06 23:08:19'),
(324, 'settings_key:title_jobs_last_run', 'Jobs Last Run', 'Son Y??r??t??len ????ler', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:55:53', '2021-03-06 23:08:19'),
(325, 'settings_key:description_jobs_last_run', 'Time when background jobs were last executed.', 'Arkaplan i??lerinin en son i??letildi??i zaman', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:55:53', '2021-03-06 23:08:19'),
(326, 'settings_key:title_jobs_interval', 'Jobs Interval', '????lerin s??kl??????', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:55:53', '2021-03-06 23:08:19'),
(327, 'settings_key:description_jobs_interval', 'The amount of minutes between each execution of jobs.', 'Her i?? ??al????t??rma aras??ndaki dakika miktar??', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:31:26', '2021-03-06 23:08:19'),
(328, 'settings_key:title_control_panel_link', 'Control Panel Link', 'Kontrol Panel Linki', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:31:26', '2021-03-06 23:08:19'),
(329, 'settings_key:description_control_panel_link', 'The URL to your control panel, e.g. cPanel.', 'Kontrol Panelininin URLi ??r. cPanel', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:31:26', '2021-03-06 23:08:19'),
(330, 'settings_key:title_database_admin_link', 'Database Admin Link', 'Veritaban?? Y??netimi Linki', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:31:26', '2021-03-06 23:08:19'),
(331, 'settings_key:description_database_admin_link', 'The URL to your database manager, e.g. phpMyAdmin.', 'Veritaban?? Y??neticisi URLi ??r phpMyAdm??n', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:31:26', '2021-03-06 23:08:19'),
(332, 'settings_key:title_webmail_link', 'Webmail Link', 'Webmail Linki', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:31:26', '2021-03-06 23:08:19'),
(333, 'settings_key:description_webmail_link', 'The URL to your webmail client.', 'Webmail Client URLi', 0, 0, 1, '2021-03-16 12:15:56', '2021-03-06 23:31:26', '2021-03-06 23:08:19'),
(334, 'settings_key:title_captcha_enabled', 'CAPTCHA', 'CAPTCHA', 0, 0, 1, '2021-03-08 04:28:21', '2021-03-06 23:31:26', '2021-03-06 23:08:20'),
(335, 'settings_key:description_captcha_enabled', 'Prevent robots from posting form data by enabling CAPTCHA security.', 'CAPTCHA ??zelli??ini etkinle??tirerek robotlar??n sitenize form verisi g??ndermesini engelleyin', 0, 0, 1, '2021-03-08 04:28:21', '2021-03-06 23:31:26', '2021-03-06 23:08:20'),
(336, 'title_add_new_geo_zone', 'Add New Geo Zone', 'Yeni Co??rafi B??lge Ekle', 0, 0, 1, '2021-03-16 12:27:31', '2021-03-16 12:29:12', '2021-03-06 23:08:22'),
(337, 'title_zones', 'Zones', 'B??lgeler', 0, 0, 1, '2021-03-16 12:27:31', '2021-03-16 12:30:07', '2021-03-06 23:08:22'),
(338, 'title_duplicate', 'Duplicate', 'Kopyala', 0, 0, 1, '2021-03-16 12:27:31', '2021-03-06 23:31:26', '2021-03-06 23:08:22'),
(339, 'title_catalog_template', 'Catalog Template', 'Site Temas??', 0, 0, 1, '2021-03-16 12:09:28', '2021-03-06 23:24:05', '2021-03-06 23:08:30'),
(340, 'title_admin_template', 'Admin Template', 'Admin Temas??', 0, 0, 1, '2021-03-16 12:09:28', '2021-03-06 23:24:05', '2021-03-06 23:08:30'),
(341, 'title_total', 'Total', 'Toplam', 0, 0, 1, '2021-03-16 12:26:08', '2021-03-06 23:24:05', '2021-03-06 23:09:30'),
(342, 'title_template_settings', 'Template Settings', 'Tema Ayarlar??', 0, 0, 1, '2021-03-07 02:26:26', '2021-03-06 23:24:05', '2021-03-06 23:10:19'),
(343, 'boomstore.catalog:title_sidebar_parallax_effect', 'Kayd??rma ??ubu??u Paralaks Efekti', 'Kayd??rma ??ubu??u Paralaks Efekti', 0, 0, 1, '2021-03-06 23:10:19', '2021-03-06 23:24:05', '2021-03-06 23:10:19'),
(344, 'boomstore.catalog:title_compact_category_tree', 'Compact Category Tree', 'Birle??ik Kategori A??ac??', 0, 0, 1, '2021-03-06 23:10:19', '2021-03-06 23:24:05', '2021-03-06 23:10:19'),
(345, 'index:head_title', 'Online Store', 'Online Sat????', 0, 1, 0, '2021-03-16 12:23:59', '2021-03-06 23:24:05', '2021-03-06 23:10:23'),
(346, 'index:meta_description', '', '', 0, 1, 0, '2021-03-16 12:23:59', '2021-03-16 12:15:35', '2021-03-06 23:10:23'),
(347, 'title_change', 'Change', 'De??i??tir', 0, 1, 1, '2021-03-16 12:26:13', '2021-03-06 23:24:05', '2021-03-06 23:10:23'),
(348, 'text_find_products', 'Find products', '??r??nleri bul', 0, 1, 0, '2021-03-07 02:19:31', '2021-03-06 23:24:05', '2021-03-06 23:10:23'),
(349, 'title_categories', 'Categories', 'Kategoriler', 0, 1, 1, '2021-03-16 12:26:13', '2021-03-06 23:24:05', '2021-03-06 23:10:23'),
(350, 'title_account', 'Account', 'Hesap', 0, 1, 0, '2021-03-16 12:23:49', '2021-03-06 23:24:05', '2021-03-06 23:10:23'),
(351, 'title_customer_service', 'Customer Service', 'M????teri Hizmetleri', 0, 1, 1, '2021-03-16 12:26:09', '2021-03-06 23:24:05', '2021-03-06 23:10:23'),
(352, 'title_regional_settings', 'Regional Settings', 'B??lgesel Ayarlar', 0, 1, 0, '2021-03-16 12:23:55', '2021-03-08 04:24:43', '2021-03-06 23:10:23'),
(353, 'title_create_account', 'Create Account', 'Hesap Olu??tur', 0, 1, 0, '2021-03-16 12:16:31', '2021-03-06 23:24:05', '2021-03-06 23:10:23'),
(354, 'title_information', 'Information', 'Bilgi', 0, 1, 1, '2021-03-16 12:26:09', '2021-03-06 23:24:05', '2021-03-06 23:10:23'),
(355, 'title_contact', 'Contact', '??leti??im', 0, 1, 0, '2021-03-16 12:23:24', '2021-03-06 23:24:05', '2021-03-06 23:10:23'),
(356, 'regional_settings:head_title', 'Regional Settings', 'B??lgesel Ayarlar', 0, 1, 0, '2021-03-16 12:23:55', '2021-03-08 04:24:43', '2021-03-06 23:10:26'),
(357, 'title_language', 'Language', 'Dil', 0, 1, 1, '2021-03-16 12:23:55', '2021-03-06 23:21:38', '2021-03-06 23:10:26'),
(358, 'title_currency', 'Currency', 'Para Birimi', 0, 1, 1, '2021-03-16 12:09:42', '2021-03-06 23:24:05', '2021-03-06 23:10:26'),
(359, 'title_zone_state_province', 'Zone/State/Province', 'B??lge/??lke/??ehir', 0, 1, 0, '2021-03-16 12:23:55', '2021-03-16 12:30:07', '2021-03-06 23:10:26'),
(360, 'title_display_prices_including_tax', 'Display Prices Including Tax', 'Vergi Dahil Fiyatlar?? G??ster', 0, 1, 0, '2021-03-16 12:23:55', '2021-03-08 04:21:20', '2021-03-06 23:10:26'),
(361, 'title_yes', 'Yes', 'Evet', 0, 1, 0, '2021-03-16 12:23:55', '2021-03-06 23:24:05', '2021-03-06 23:10:26'),
(362, 'title_no', 'No', 'Hay??r', 0, 1, 0, '2021-03-16 12:23:55', '2021-03-06 23:24:05', '2021-03-06 23:10:26'),
(363, 'checkout:head_title', 'Checkout', 'Sat??n Al', 0, 1, 0, '2021-03-16 12:23:57', '2021-03-06 23:21:38', '2021-03-06 23:10:40'),
(364, 'title_checkout', 'Checkout', 'Sat??n Al', 0, 1, 0, '2021-03-16 12:23:57', '2021-03-06 23:21:38', '2021-03-06 23:10:40'),
(365, 'warning_your_customer_information_unsaved', 'Your customer information contains unsaved changes.', 'M????teri bilgileriniz kaydedilmemi?? de??i??iklikler i??eriyor.', 0, 1, 0, '2021-03-16 12:23:57', '2021-03-06 23:21:38', '2021-03-06 23:10:40'),
(366, 'text_please_wait', 'Please wait', 'L??tfen bekleyin', 0, 1, 0, '2021-03-16 12:23:57', '2021-03-06 23:21:38', '2021-03-06 23:10:40'),
(367, 'description_no_items_in_cart', 'There are no items in your cart.', 'Sepetinizde hi??bir ??r??n bulunmuyor', 0, 1, 0, '2021-03-16 12:23:57', '2021-03-06 23:21:38', '2021-03-06 23:10:40'),
(368, 'title_back', 'Back', 'Geri', 0, 1, 0, '2021-03-16 12:23:57', '2021-03-06 23:21:38', '2021-03-06 23:10:40'),
(369, 'title_create_new_order', 'Create New Order', 'Yeni ??ipari?? Olu??tur', 0, 0, 1, '2021-03-16 12:26:11', '2021-03-06 23:21:38', '2021-03-06 23:11:32'),
(370, 'title_customer_name', 'Customer Name', 'M????teri Ad??', 0, 0, 1, '2021-03-16 12:26:11', '2021-03-06 23:21:38', '2021-03-06 23:11:32'),
(371, 'title_create_new_user', 'Create New User', 'Yeni Kullan??c?? Ekle', 0, 0, 1, '2021-03-16 12:25:21', '2021-03-06 23:21:38', '2021-03-06 23:11:37'),
(372, 'title_add_new_customer', 'Add New Customer', 'Yeni M????teri Ekle', 0, 0, 1, '2021-03-16 12:26:07', '2021-03-06 23:21:38', '2021-03-06 23:11:38'),
(373, 'title_email', 'Email', 'Email', 0, 1, 1, '2021-03-16 12:26:07', '2021-03-06 23:21:38', '2021-03-06 23:11:38'),
(374, 'title_company', 'Company', '??irket', 0, 1, 1, '2021-03-16 12:26:07', '2021-03-06 23:21:38', '2021-03-06 23:11:38'),
(375, 'title_date_registered', 'Date Registered', 'Kaydedildi??i Tarih', 0, 0, 1, '2021-03-16 12:26:07', '2021-03-06 23:21:38', '2021-03-06 23:11:38'),
(376, 'title_version', 'Version', 'Versiyon', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-06 23:21:38', '2021-03-06 23:11:39'),
(377, 'title_developer', 'Developer', 'Geli??tirici', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-06 23:21:38', '2021-03-06 23:11:39'),
(378, 'title_external_link', 'External Link', 'Harici Link', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-06 23:21:38', '2021-03-06 23:11:39'),
(379, 'title_date_period', 'Date Period', 'Tarih Noktas??', 0, 0, 1, '2021-03-16 12:26:08', '2021-03-06 23:19:12', '2021-03-06 23:11:41'),
(380, 'title_filter_now', 'Filter', 'Filtrele', 0, 0, 1, '2021-03-16 12:26:08', '2021-03-06 23:19:12', '2021-03-06 23:11:41'),
(381, 'title_download', 'Download', '??ndir', 0, 0, 1, '2021-03-16 12:26:08', '2021-03-06 23:21:38', '2021-03-06 23:11:41'),
(382, 'title_month', 'Month', 'Ay', 0, 0, 1, '2021-03-16 12:26:08', '2021-03-06 23:21:38', '2021-03-06 23:11:41'),
(383, 'title_subtotal', 'Subtotal', 'Ara toplam', 0, 0, 1, '2021-03-16 12:26:08', '2021-03-06 23:21:38', '2021-03-06 23:11:41'),
(384, 'title_shipping_fees', 'Shipping Fees', 'Kargo ??creti', 0, 0, 1, '2021-03-16 12:26:08', '2021-03-06 23:21:38', '2021-03-06 23:11:41'),
(385, 'title_payment_fees', 'Payment Fees', '??deme ??creti', 0, 0, 1, '2021-03-16 12:26:08', '2021-03-06 23:21:38', '2021-03-06 23:11:41'),
(386, 'title_site_menu', 'Site Menu', 'Site Men??s??', 0, 0, 1, '2021-03-16 12:26:09', '2021-03-06 23:19:12', '2021-03-06 23:11:44'),
(387, 'title_create_new_page', 'Create New Page', 'Yeni Sayfa Olu??tur', 0, 0, 1, '2021-03-16 12:26:09', '2021-03-06 23:19:12', '2021-03-06 23:11:44'),
(388, 'title_title', 'Title', 'Ba??l??k', 0, 0, 1, '2021-03-16 12:26:09', '2021-03-06 23:19:12', '2021-03-06 23:11:44'),
(389, 'text_with_selected', 'With selected', 'Se??ili', 0, 0, 1, '2021-03-16 12:26:13', '2021-03-06 23:19:12', '2021-03-06 23:11:44'),
(390, 'title_root', 'Root', 'K??k', 0, 0, 1, '2021-03-16 12:26:13', '2021-03-06 23:19:12', '2021-03-06 23:11:44'),
(391, 'title_move', 'Move', 'Ta????', 0, 0, 1, '2021-03-16 12:26:13', '2021-03-06 23:19:12', '2021-03-06 23:11:44'),
(392, 'title_add_new_category', 'Add New Category', 'Yeni Kategori Ekle', 0, 0, 1, '2021-03-16 12:26:13', '2021-03-06 23:19:12', '2021-03-06 23:11:49'),
(393, 'title_add_new_product', 'Add New Product', 'Yeni ??r??n Ekle', 0, 0, 1, '2021-03-16 12:26:13', '2021-03-06 23:19:12', '2021-03-06 23:11:49'),
(394, 'title_products', 'Products', '??r??nler', 0, 0, 1, '2021-03-16 12:26:13', '2021-03-06 23:19:12', '2021-03-06 23:11:49'),
(395, 'warning_mounting_points_will_be_replaced', 'Warning: All current mounting points will be replaced.', 'Dikkat: ??uanki birle??tirilmi?? noktalar de??i??tirilecek', 0, 0, 1, '2021-03-16 12:26:13', '2021-03-06 23:19:12', '2021-03-06 23:11:49'),
(396, 'title_copy', 'Copy', 'Kopyala', 0, 0, 1, '2021-03-16 12:26:13', '2021-03-06 23:19:12', '2021-03-06 23:11:49'),
(397, 'title_unmount', 'Unmount', 'Ay??r', 0, 0, 1, '2021-03-16 12:26:13', '2021-03-06 23:19:12', '2021-03-06 23:11:49'),
(398, 'title_add_new_manufacturer', 'Add New Manufacturer', 'Yeni ??retici Ekle', 0, 0, 1, '2021-03-16 12:09:38', '2021-03-06 23:19:12', '2021-03-06 23:11:53'),
(399, 'title_attribute_groups', 'Attribute Groups', '??zellik Gruplar??', 0, 0, 1, '2021-03-16 12:09:34', '2021-03-06 23:19:12', '2021-03-06 23:11:56'),
(400, 'title_create_new_group', 'Create New Group', 'Yeni Grup Ekle', 0, 0, 1, '2021-03-16 12:09:34', '2021-03-06 23:19:12', '2021-03-06 23:11:56'),
(401, 'title_values', 'Values', 'De??erler', 0, 0, 1, '2021-03-16 12:09:34', '2021-03-06 23:19:12', '2021-03-06 23:11:56'),
(402, 'title_add_new_currency', 'Add New Currency', 'Yeni Para Birimi Ekle', 0, 0, 1, '2021-03-08 04:28:56', '2021-03-06 23:19:12', '2021-03-06 23:11:58'),
(403, 'title_decimals', 'Decimals', 'Ondal??klar', 0, 0, 1, '2021-03-08 04:28:56', '2021-03-06 23:19:12', '2021-03-06 23:11:58'),
(404, 'title_prefix', 'Prefix', '??nek', 0, 0, 1, '2021-03-08 04:28:56', '2021-03-06 23:19:12', '2021-03-06 23:11:58'),
(405, 'title_suffix', 'Suffix', 'Sonek', 0, 0, 1, '2021-03-08 04:28:56', '2021-03-06 23:19:12', '2021-03-06 23:11:58'),
(406, 'title_default_currency', 'Default Currency', 'Varsay??lan Para Birimi', 0, 0, 1, '2021-03-08 04:28:56', '2021-03-06 23:19:12', '2021-03-06 23:11:58'),
(407, 'title_store_currency', 'Store Currency', 'Ma??aza Para Birimi', 0, 0, 1, '2021-03-08 04:28:56', '2021-03-16 12:12:36', '2021-03-06 23:11:58'),
(408, 'title_add_new_tax_rate', 'Add New Tax Rate', 'Yeni Vergi Oran?? Ekle', 0, 0, 1, '2021-03-07 02:07:21', '2021-03-07 01:20:57', '2021-03-06 23:12:01'),
(409, 'title_tax_class', 'Tax Class', 'Vergi S??n??f??', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:20:57', '2021-03-06 23:12:01'),
(410, 'title_geo_zone', 'Geo Zone', 'Co??rafi B??lge', 0, 0, 1, '2021-03-07 02:07:21', '2021-03-16 12:29:12', '2021-03-06 23:12:01'),
(411, 'title_description', 'Description', 'A????klama', 0, 1, 1, '2021-03-16 12:23:32', '2021-03-06 23:16:15', '2021-03-06 23:12:01'),
(412, 'title_rate', 'Rate', 'Oran', 0, 0, 1, '2021-03-07 02:07:21', '2021-03-06 23:16:15', '2021-03-06 23:12:01'),
(413, 'title_type', 'Type', 'T??r', 0, 0, 1, '2021-03-07 02:07:21', '2021-03-06 23:19:12', '2021-03-06 23:12:01'),
(414, 'title_add_new_slide', 'Add New Slide', 'Yeni Slayt Ekle', 0, 0, 1, '2021-03-07 02:07:27', '2021-03-06 23:16:15', '2021-03-06 23:12:04'),
(415, 'title_valid_from', 'Valid From', 'Ge??erlilik Ba??lang??c??', 0, 0, 1, '2021-03-16 12:25:53', '2021-03-06 23:16:15', '2021-03-06 23:12:04'),
(416, 'title_valid_to', 'Valid To', 'Ge??erlilik Biti??i', 0, 0, 1, '2021-03-16 12:25:53', '2021-03-06 23:16:15', '2021-03-06 23:12:04'),
(417, 'title_add_new_tax_class', 'Add New Tax Class', 'Yeni Vergi S??n??f?? Ekle', 0, 0, 1, '2021-03-07 01:04:05', '2021-03-07 01:20:57', '2021-03-06 23:12:10'),
(418, 'title_filename', 'Filename', 'Dosya Ad??', 0, 0, 1, '2021-03-07 01:48:44', '2021-03-06 23:16:15', '2021-03-06 23:12:12'),
(419, 'title_author', 'Author', 'Olu??turan', 0, 0, 1, '2021-03-07 01:48:44', '2021-03-06 23:16:15', '2021-03-06 23:12:12'),
(420, 'title_upload_new_vqmod', 'Upload a New vQmod', 'Yeni vQmod Ekle', 0, 0, 1, '2021-03-07 01:48:44', '2021-03-06 23:16:15', '2021-03-06 23:12:12'),
(421, 'title_upload', 'Upload', 'Y??kle', 0, 0, 1, '2021-03-07 01:48:44', '2021-03-06 23:16:15', '2021-03-06 23:12:12'),
(422, 'title_add_new_country', 'Add New Country', 'Yeni ??lke Ekle', 0, 0, 1, '2021-03-16 12:27:17', '2021-03-16 12:29:12', '2021-03-06 23:12:20'),
(423, 'title_edit_country', 'Edit Country', '??lke D??zenle', 0, 0, 1, '2021-03-08 04:29:09', '2021-03-16 12:29:12', '2021-03-06 23:12:51'),
(424, 'title_number', 'Number', 'Say??', 0, 0, 1, '2021-03-08 04:29:09', '2021-03-07 01:14:34', '2021-03-06 23:12:51'),
(425, 'title_domestic_name', 'Domestic Name', 'Lokal Ad??', 0, 0, 1, '2021-03-08 04:29:09', '2021-03-07 01:14:34', '2021-03-06 23:12:51'),
(426, 'title_address_format', 'Address Format', 'Adres Format??', 0, 0, 1, '2021-03-08 04:29:09', '2021-03-07 00:14:56', '2021-03-06 23:12:51'),
(427, 'title_tax_id_format', 'Tax ID Format', 'Vergi Numaras?? Format??', 0, 0, 1, '2021-03-08 04:29:09', '2021-03-07 01:16:13', '2021-03-06 23:12:51'),
(428, 'title_postcode_format', 'Postcode Format', 'Posta Kodu Format??', 0, 0, 1, '2021-03-08 04:29:09', '2021-03-07 00:14:56', '2021-03-06 23:12:51'),
(429, 'title_language_code', 'Language Code', 'Dil Kodu', 0, 0, 1, '2021-03-08 04:29:09', '2021-03-07 00:14:56', '2021-03-06 23:12:51'),
(430, 'title_currency_code', 'Currency Code', 'Para Birimi Kodu', 0, 0, 1, '2021-03-08 04:29:09', '2021-03-07 00:14:56', '2021-03-06 23:12:51'),
(431, 'title_phone_country_code', 'Phone Country Code', '??lke Telefon Kodu', 0, 0, 1, '2021-03-08 04:29:09', '2021-03-16 12:29:12', '2021-03-06 23:12:51'),
(432, 'title_add_zone', 'Add Zone', 'B??lge Ekle', 0, 0, 1, '2021-03-08 04:29:09', '2021-03-16 12:30:07', '2021-03-06 23:12:51'),
(433, 'title_syntax', 'Syntax', 'Yaz??m Kural??', 0, 0, 1, '2021-03-08 04:29:09', '2021-03-06 23:24:05', '2021-03-06 23:12:51'),
(434, 'title_new_password', 'New Password', 'Yeni ??ifre', 0, 1, 1, '2021-03-16 12:25:53', '2021-03-07 01:14:34', '2021-03-07 00:16:48'),
(435, 'title_confirm_password', 'Confirm Password', '??ifreyi Onayla', 0, 1, 1, '2021-03-16 12:25:53', '2021-03-07 01:14:34', '2021-03-07 00:16:48'),
(436, 'title_apps', 'Apps', 'Uygulamalar', 0, 0, 1, '2021-03-16 12:25:53', '2021-03-07 01:14:34', '2021-03-07 00:16:48'),
(437, 'title_widgets', 'Widgets', 'Widgetlar', 0, 0, 1, '2021-03-16 12:25:53', '2021-03-07 01:14:34', '2021-03-07 00:16:48'),
(438, 'title_access_denied', 'Access Denied', 'Eri??im Reddedildi', 0, 0, 1, '2021-03-07 02:19:53', '2021-03-07 01:14:34', '2021-03-07 00:18:42'),
(439, 'title_edit_user', 'Edit User', 'Kullan??c??y?? D??zenle', 0, 0, 1, '2021-03-16 12:25:53', '2021-03-07 01:13:49', '2021-03-07 00:19:03'),
(440, 'title_last_ip', 'Last IP', 'Son IP', 0, 0, 1, '2021-03-16 12:25:53', '2021-03-07 01:13:49', '2021-03-07 00:19:03'),
(441, 'title_last_host', 'Last Host', 'Son Host', 0, 0, 1, '2021-03-16 12:25:53', '2021-03-07 01:13:49', '2021-03-07 00:19:03'),
(442, 'title_last_login', 'Last Login', 'Son Giri??', 0, 0, 1, '2021-03-16 12:25:53', '2021-03-07 01:14:34', '2021-03-07 00:19:03'),
(443, 'title_insert_new', 'Insert New', 'Yeni Ekle', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-07 01:07:45', '2021-03-07 00:20:20'),
(444, 'title_list_of_subscribers', 'List of Subscribers', 'Takip??i Listesi', 0, 0, 1, '2021-03-08 04:28:56', '2021-03-07 01:13:49', '2021-03-07 00:20:20'),
(445, 'title_guests', 'Guests', 'Ziyaret??iler', 0, 0, 1, '2021-03-08 04:28:56', '2021-03-07 01:13:49', '2021-03-07 00:20:20'),
(446, 'title_item_name', 'Item Name', 'Kay??t Ad??', 0, 0, 1, '2021-03-07 01:01:16', '2021-03-07 01:13:49', '2021-03-07 00:20:24'),
(447, 'title_product', 'Product', '??r??n', 0, 0, 1, '2021-03-07 01:01:16', '2021-03-07 01:13:49', '2021-03-07 00:20:24'),
(448, 'title_quantity', 'Quantity', 'Miktar', 0, 1, 1, '2021-03-16 12:23:32', '2021-03-07 01:13:49', '2021-03-07 00:20:24'),
(449, 'title_sales', 'Sales', 'Sat????lar', 0, 0, 1, '2021-03-07 01:30:26', '2021-03-07 01:13:49', '2021-03-07 00:20:24'),
(450, 'title_email_address', 'Email Address', 'Email Adresi', 0, 1, 1, '2021-03-16 12:23:49', '2021-03-07 01:13:49', '2021-03-07 00:20:24'),
(451, 'title_total_amount', 'Total Amount', 'Toplam Miktar', 0, 0, 1, '2021-03-07 01:01:16', '2021-03-07 01:13:49', '2021-03-07 00:20:24'),
(452, 'title_create_new_order_status', 'Create New Order Status', 'Yeni Sipari?? Durumu Olu??tur', 0, 0, 1, '2021-03-07 01:30:26', '2021-03-07 01:13:49', '2021-03-07 00:20:30'),
(453, 'title_archived', 'Archived', 'Ar??ivlenmi??', 0, 0, 1, '2021-03-07 01:30:26', '2021-03-07 01:13:49', '2021-03-07 00:20:30'),
(454, 'title_notify', 'Notify', 'Haber Ver', 0, 0, 1, '2021-03-07 01:30:26', '2021-03-07 01:13:49', '2021-03-07 00:20:30'),
(455, 'title_edit_order_status', 'Edit Order Status', 'Sipari?? Durumunu D??zenle', 0, 0, 1, '2021-03-07 01:02:30', '2021-03-07 01:10:39', '2021-03-07 00:20:35'),
(456, 'title_keywords', 'Keywords', 'Anahtar Kelimeler', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:10:39', '2021-03-07 00:20:35'),
(457, 'title_icon', 'Icon', 'Ikon', 0, 0, 1, '2021-03-07 01:02:30', '2021-03-07 01:13:49', '2021-03-07 00:20:35'),
(458, 'title_color', 'Color', 'REnk', 0, 0, 1, '2021-03-07 01:02:30', '2021-03-07 01:13:49', '2021-03-07 00:20:35'),
(459, 'title_properties', 'Properties', '??zellikler', 0, 0, 1, '2021-03-07 01:02:30', '2021-03-07 01:13:49', '2021-03-07 00:20:35'),
(460, 'text_is_sale', 'Is sale', 'Sat??l??k m???', 0, 0, 1, '2021-03-07 01:02:30', '2021-03-07 01:13:49', '2021-03-07 00:20:35'),
(461, 'order_status:description_is_sale', 'Reserve/withdraw stock and include in sales reports', 'Sto??u rezerve et ya da geri ??ek ve bunu sat???? raporlar??na yans??t', 0, 0, 1, '2021-03-07 01:02:30', '2021-03-07 01:13:49', '2021-03-07 00:20:35'),
(462, 'text_is_archived', 'Is archived', 'Ar??ivli mi?', 0, 0, 1, '2021-03-07 01:02:30', '2021-03-07 01:13:49', '2021-03-07 00:20:35'),
(463, 'order_status:description_is_archived', 'Exclude from the default list of orders', 'Varsay??lan sipari?? listesinden hari?? tut', 0, 0, 1, '2021-03-07 01:02:30', '2021-03-07 01:13:49', '2021-03-07 00:20:35'),
(464, 'title_email_notification', 'Email Notification', 'Email Bildirim', 0, 0, 1, '2021-03-07 01:02:30', '2021-03-07 01:13:49', '2021-03-07 00:20:35'),
(465, 'title_subject', 'Subject', 'Konu', 0, 1, 1, '2021-03-07 02:27:16', '2021-03-07 01:13:49', '2021-03-07 00:20:35'),
(466, 'title_message', 'Message', 'Mesaj', 0, 1, 1, '2021-03-07 02:27:16', '2021-03-07 01:13:49', '2021-03-07 00:20:35'),
(467, 'title_aliases', 'Aliases', 'Takma Adlar', 0, 0, 1, '2021-03-07 01:02:30', '2021-03-07 01:13:49', '2021-03-07 00:20:35'),
(468, 'title_all_zones', 'All Zones', 'T??m B??lgeler', 0, 0, 1, '2021-03-08 04:22:51', '2021-03-16 12:30:07', '2021-03-07 00:21:00'),
(469, 'title_edit_geo_zone', 'Edit Geo Zone', 'Co??rafi B??lgeyi D??zenle', 0, 0, 1, '2021-03-08 04:22:51', '2021-03-16 12:29:12', '2021-03-07 00:21:00'),
(470, 'title_zone', 'Zone', 'B??lge', 0, 0, 1, '2021-03-08 04:22:51', '2021-03-16 12:30:07', '2021-03-07 00:21:00'),
(471, 'title_add', 'Add', 'Ekle', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:10:39', '2021-03-07 00:21:00'),
(472, 'title_new_geo_zone', 'Create New Geo Zone', 'Co??rafi B??lge Olu??tur', 0, 0, 1, '2021-03-07 00:21:10', '2021-03-16 12:29:12', '2021-03-07 00:21:10'),
(473, 'error_cannot_delete_framework_language', 'You cannot delete the PHP framework language. But you can disable it.', 'PHP framework dilini silemezsin. Fakat pasif yapabilirsin.', 0, 0, 1, '2021-03-07 00:21:53', '2021-03-07 01:10:39', '2021-03-07 00:21:53'),
(474, 'title_new_image', 'New Image', 'Yeni Resim', 0, 0, 1, '2021-03-07 02:21:49', '2021-03-07 01:10:39', '2021-03-07 00:22:07'),
(475, 'title_add_new_supplier', 'Add New Supplier', 'Yeni Tedarik??i Ekle', 0, 0, 1, '2021-03-16 12:09:38', '2021-03-07 01:10:39', '2021-03-07 00:23:14'),
(476, 'title_create_new_status', 'Create New Status', 'Yeni Durum Ekle', 0, 0, 1, '2021-03-16 12:09:40', '2021-03-07 01:10:39', '2021-03-07 00:23:14'),
(477, 'title_orderable', 'Orderable', 'Sipari?? Edilebilir', 0, 0, 1, '2021-03-16 12:09:40', '2021-03-07 01:10:39', '2021-03-07 00:23:15'),
(478, 'title_add_new_unit', 'Add New Unit', 'Yeni Birim Ekle', 0, 0, 1, '2021-03-16 12:09:41', '2021-03-07 01:10:39', '2021-03-07 00:23:16'),
(479, 'title_edit_delivery_status', 'Edit Delivery Status', 'Ta????ma Durumunu D??zenle', 0, 0, 1, '2021-03-07 02:22:02', '2021-03-07 01:10:39', '2021-03-07 00:23:19'),
(480, 'title_edit_sold_out_status', 'Edit Sold Out Status', 'T??kenmi?? Durumunu D??zenle', 0, 0, 1, '2021-03-07 00:25:15', '2021-03-07 01:10:39', '2021-03-07 00:23:43'),
(481, 'text_hide_from_listing', 'Hide from listing', 'Listelemeden kald??r', 0, 0, 1, '2021-03-07 00:25:15', '2021-03-07 01:10:39', '2021-03-07 00:23:43'),
(482, 'text_product_is_orderable', 'Product is orderable', '??r??n s??pari?? edilebilir', 0, 0, 1, '2021-03-07 00:25:15', '2021-03-07 01:10:39', '2021-03-07 00:23:43'),
(483, 'title_edit_quantity_unit', 'Edit Quantity Unit', 'Miktar Birimini D??zenle', 0, 0, 1, '2021-03-07 00:25:35', '2021-03-07 01:10:39', '2021-03-07 00:25:35'),
(484, 'text_separate_added_cart_items', 'Separate added cart items', 'Sepete eklenmi??leri ay??r', 0, 0, 1, '2021-03-07 00:25:35', '2021-03-07 01:10:39', '2021-03-07 00:25:35'),
(485, 'title_brands', 'Brands', 'Markalar', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-07 01:10:39', '2021-03-07 00:25:39'),
(486, 'text_insert_new_entries', 'Insert new entries', 'Yeni kay??tlar gir', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-07 01:10:39', '2021-03-07 00:25:39'),
(487, 'text_overwrite_existing_entries', 'Overwrite existing entries', 'Varolan kay??tlar?? d??zenle', 0, 0, 1, '2021-03-16 12:09:42', '2021-03-07 01:10:39', '2021-03-07 00:25:39'),
(488, 'sm_zone_weight:title', 'Zone Based Shipping', 'B??lge Bazl?? Ta????ma', 0, 0, 1, '2021-03-08 04:28:45', '2021-03-16 12:15:35', '2021-03-07 00:26:00'),
(489, 'title_install', 'Install', 'Kur', 0, 0, 1, '2021-03-08 04:28:45', '2021-03-07 01:10:39', '2021-03-07 00:26:00'),
(490, 'pm_cod:title', 'Cash on Delivery', 'Kap??da ??deme', 0, 0, 1, '2021-03-08 04:28:45', '2021-03-16 12:15:35', '2021-03-07 00:26:04'),
(491, 'ot_subtotal:title', 'Subtotal', 'Ara toplam', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:27:07', '2021-03-07 00:26:09'),
(492, 'ot_subtotal:title_status', 'Status', 'Durum', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:27:07', '2021-03-07 00:26:09'),
(493, 'ot_subtotal:description_status', 'Enables or disables the module.', 'Mod??l?? aktif ya da pasif hale getirir', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:27:07', '2021-03-07 00:26:09'),
(494, 'ot_subtotal:title_priority', 'Priority', '??ncelik', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:27:07', '2021-03-07 00:26:09'),
(495, 'ot_subtotal:description_priority', 'Process this module by the given priority value.', 'Bu mod??l?? verilen ??nceli??e g??re i??le', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:27:07', '2021-03-07 00:26:09'),
(496, 'ot_shipping_fee:title', 'Shipping Fee', 'Kargo ??creti', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:28:34', '2021-03-07 00:26:09'),
(497, 'ot_shipping_fee:title_status', 'Status', 'Durum', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:28:34', '2021-03-07 00:26:09'),
(498, 'ot_shipping_fee:description_status', 'Enables or disables the module.', 'Mod??l?? aktif ya da pasif hale getirir', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:28:34', '2021-03-07 00:26:09'),
(499, 'ot_shipping_fee:title_free_shipping_table', 'Free Shipping Table', '??cretsiz Kargo Tablosu', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:28:34', '2021-03-07 00:26:09'),
(500, 'ot_shipping_fee:description_free_shipping_table', 'Free shipping table in standard CSV format with column headers.', '??cretsiz kargo tablosu standart CSV format??nda', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:28:34', '2021-03-07 00:26:09'),
(501, 'ot_shipping_fee:title_priority', 'Priority', '??ncelik', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:28:34', '2021-03-07 00:26:09'),
(502, 'ot_shipping_fee:description_priority', 'Process this module by the given priority value.', 'Bu mod??l?? verilen ??ncelik s??ras??na g??re i??le', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:28:34', '2021-03-07 00:26:09'),
(503, 'ot_payment_fee:title', 'Payment Fee', '??deme ??creti', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:29:19', '2021-03-07 00:26:09'),
(504, 'ot_payment_fee:title_status', 'Status', 'Durum', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:29:19', '2021-03-07 00:26:09'),
(505, 'ot_payment_fee:description_status', 'Enables or disables the module.', 'Bu mod??l?? aktif ya da pasif hale getir', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:29:19', '2021-03-07 00:26:09'),
(506, 'ot_payment_fee:title_priority', 'Priority', '??ncelik', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:29:19', '2021-03-07 00:26:09'),
(507, 'ot_payment_fee:description_priority', 'Process this module by the given priority value.', 'Bu mod??l?? ??ncelik s??ras??na g??re i??le', 0, 0, 1, '2021-03-08 04:28:49', '2021-03-07 00:29:19', '2021-03-07 00:26:09'),
(508, 'title_edit_module', 'Edit Module', 'Mod??l?? D??zenle', 0, 0, 1, '2021-03-07 00:28:43', '2021-03-07 01:07:45', '2021-03-07 00:26:12'),
(509, 'title_developed_by', 'Developed by', 'Geli??tiren', 0, 0, 1, '2021-03-07 00:28:43', '2021-03-07 01:07:45', '2021-03-07 00:26:12'),
(510, 'title_edit_translations', 'Edit Translations', '??evirileri D??zenle', 0, 0, 1, '2021-03-07 00:28:43', '2021-03-07 01:10:39', '2021-03-07 00:26:12'),
(511, 'title_uninstall', 'Uninstall', 'Kald??r', 0, 0, 1, '2021-03-07 00:28:43', '2021-03-07 01:10:39', '2021-03-07 00:26:12'),
(512, 'job_error_reporter:title_status', 'Status', 'Durum', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(513, 'job_error_reporter:description_status', 'Enables or disables the module.', 'Mod??l?? aktif ya da pasif yapar.', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(514, 'job_error_reporter:title_working_hours', 'Working Hours', '??al????ma Saatleri', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(515, 'job_error_reporter:description_working_hours', 'During what hours of the day the job would operate e.g. 07:00-21:00.', 'G??n??n hangi saatlerinde bu i?? ??al????t??r??lmal?? ??rn 07:00-21:00', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(516, 'job_error_reporter:title_report_frequency', 'Report Frequency', 'Rapor S??kl??????', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(517, 'job_error_reporter:description_report_frequency', 'How often the reports should be sent.', 'Bu rapor ne kadar s??kl??kla g??nderilmeli', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(518, 'job_error_reporter:title_email_recipient', 'Email Recipient', 'Email Al??c??s??', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(519, 'job_error_reporter:description_email_recipient', 'The email address where reports will be sent.', 'Raporlar??n g??nderilece??i email adresi', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(520, 'job_error_reporter:title_priority', 'Priority', '??ncelik', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(521, 'job_error_reporter:description_priority', 'Process this module in the given priority order.', 'Bu mod??l?? verilen ??ncelikle i??let', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(522, 'job_cache_cleaner:title_status', 'Status', 'Durum', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(523, 'job_cache_cleaner:description_status', 'Enables or disables the module.', 'Mod??l?? aktif ya da pasif yapar.', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(524, 'job_cache_cleaner:title_priority', 'Priority', '??ncelik', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(525, 'job_cache_cleaner:description_priority', 'Process this module in the given priority order.', 'Bu mod??l?? verilen ??ncelikle i??let', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(526, 'job_mysql_optimizer:title_status', 'Status', 'Durum', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(527, 'job_mysql_optimizer:description_status', 'Enables or disables the module.', 'Mod??l?? aktif ya da pasif yapar.', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(528, 'job_mysql_optimizer:title_frequency', 'Frequency', 'S??kl??k', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(529, 'job_mysql_optimizer:description_frequency', 'How often the job should be processed.', 'Bu i?? ne kadar s??kl??kla i??letilmeli', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(530, 'job_mysql_optimizer:title_priority', 'Priority', '??ncelik', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(531, 'job_mysql_optimizer:description_priority', 'Process this module in the given priority order.', 'Bu mod??l?? verilen ??ncelikle i??let', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-16 12:15:35', '2021-03-07 00:29:22'),
(532, 'title_run_now', 'Run Now', '??imdi Ba??lat', 0, 0, 1, '2021-03-08 04:28:48', '2021-03-07 01:07:45', '2021-03-07 00:29:22'),
(533, 'description_set_as_default_currency', 'Set as default currency', 'Varsay??lan para birimi yap', 0, 0, 1, '2021-03-07 01:00:24', '2021-03-07 01:07:45', '2021-03-07 00:29:33'),
(534, 'description_set_as_store_currency', 'Set as store currency', 'Ma??azan??n para birimi yap', 0, 0, 1, '2021-03-07 01:00:24', '2021-03-08 04:27:24', '2021-03-07 00:29:33'),
(535, 'error_must_enter_value', 'You must enter a value', 'Bir de??er girmelisin', 0, 0, 1, '2021-03-07 00:30:36', '2021-03-07 01:07:45', '2021-03-07 00:30:36'),
(536, 'title_edit_currency', 'Edit Currency', 'Para Birimini D??zenle', 0, 0, 1, '2021-03-07 01:00:24', '2021-03-07 01:07:45', '2021-03-07 00:30:47'),
(537, 'error_store_currency_must_have_value_1', 'The store currency must always have the currency value 1.0.', 'Ma??aza para biriminin de??eri her zaman 1.0 olmal??d??r.', 0, 0, 1, '2021-03-07 00:30:51', '2021-03-08 04:27:24', '2021-03-07 00:30:51'),
(538, 'title_edit_slide', 'Edit Slide', 'Slayt?? D??zenle', 0, 0, 1, '2021-03-07 02:07:25', '2021-03-07 01:07:45', '2021-03-07 01:02:42'),
(539, 'text_leave_blank_for_all', 'Leave blank for all', 'T??m?? i??in bo?? b??rak', 0, 0, 1, '2021-03-07 02:07:25', '2021-03-07 01:07:45', '2021-03-07 01:02:42'),
(540, 'title_image', 'Image', 'Resim', 0, 0, 1, '2021-03-07 02:18:39', '2021-03-07 01:07:45', '2021-03-07 01:02:42'),
(541, 'title_caption', 'Caption', 'Ba??l??k', 0, 0, 1, '2021-03-07 02:07:25', '2021-03-07 01:07:45', '2021-03-07 01:02:42'),
(542, 'title_link', 'Link', 'Link', 0, 0, 1, '2021-03-07 02:07:25', '2021-03-07 01:07:45', '2021-03-07 01:02:42'),
(543, 'title_date_valid_from', 'Date Valid From', 'Ge??erlilik Ba??lang??c??', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:07:45', '2021-03-07 01:02:42'),
(544, 'title_date_valid_to', 'Date Valid To', 'Ge??erlilik Biti??i', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:07:45', '2021-03-07 01:02:42'),
(545, 'title_address_type', 'Address Type', 'Adres T??r??', 0, 0, 1, '2021-03-07 01:04:08', '2021-03-07 01:07:45', '2021-03-07 01:02:58'),
(546, 'title_shipping_address', 'Shipping Address', 'Kargo Adresi', 0, 0, 1, '2021-03-07 01:04:08', '2021-03-07 01:07:45', '2021-03-07 01:02:58'),
(547, 'title_payment_address', 'Payment Address', '??deme Adresi', 0, 0, 1, '2021-03-07 01:04:08', '2021-03-07 01:07:45', '2021-03-07 01:02:58'),
(548, 'title_conditions', 'Conditions', 'Ko??ullar', 0, 0, 1, '2021-03-07 01:04:08', '2021-03-07 01:07:45', '2021-03-07 01:02:58'),
(549, 'text_applies_to_companies_with_tax_id', 'Applies to companies with a tax ID', 'Vergi numaras?? olan ??irketlere uygulan??r', 0, 0, 1, '2021-03-07 01:04:08', '2021-03-07 01:16:13', '2021-03-07 01:02:58'),
(550, 'rule_applies_to_companies_without_tax_id', 'Applies to companies without a tax ID', 'Vergi numaras?? olmayan ??irketlere uygulan??r', 0, 0, 1, '2021-03-07 01:04:08', '2021-03-07 01:16:13', '2021-03-07 01:02:58'),
(551, 'text_applies_to_individuals_with_tax_id', 'Applies to individuals with a tax ID', 'Vergi numaras?? olan bireylere uygulan??r', 0, 0, 1, '2021-03-07 01:04:08', '2021-03-07 01:16:13', '2021-03-07 01:02:58'),
(552, 'rule_applies_to_individuals_without_tax_id', 'Applies to individuals without a tax ID', 'Verg?? numaras?? olmayan bireylere uygulan??r', 0, 0, 1, '2021-03-07 01:04:08', '2021-03-07 01:07:45', '2021-03-07 01:02:58'),
(553, 'error_must_select_tax_class', 'You must select a tax class', 'Bir vergi s??n??f?? se??melisin', 0, 0, 1, '2021-03-07 01:03:48', '2021-03-07 01:16:13', '2021-03-07 01:03:48'),
(554, 'title_sign_in', 'Sign In', 'Giri?? Yap', 0, 1, 0, '2021-03-16 12:16:34', '2021-03-07 01:20:57', '2021-03-07 01:18:39'),
(555, 'text_lost_your_password', 'Lost your password?', '??ifremi unuttum', 0, 1, 0, '2021-03-16 12:16:34', '2021-03-07 01:20:57', '2021-03-07 01:18:39'),
(556, 'title_create_an_account', 'Create an Account', 'Hesap Olu??tur', 0, 1, 0, '2021-03-07 02:19:19', '2021-03-07 01:20:57', '2021-03-07 01:18:39'),
(557, 'description_get_access_to_all_order_history', 'Get access to all your order history.', 'Sipari?? ge??mi??ine eri??im sa??la', 0, 1, 0, '2021-03-07 02:19:19', '2021-03-07 01:20:57', '2021-03-07 01:18:39'),
(558, 'description_save_your_cart_items', 'Save your shopping cart for a later visit.', 'Sepetini sonraki ziyaretin i??in kaydet', 0, 1, 0, '2021-03-07 02:19:19', '2021-03-07 01:20:57', '2021-03-07 01:18:39'),
(559, 'description_access_your_cart_simultaneously', 'Access your shopping cart from different computers. Even simultaneously!', 'Sepetine farkl?? cihazlardan eri??im sa??la. Hem de anl??k olarak!', 0, 1, 0, '2021-03-07 02:19:19', '2021-03-07 01:20:57', '2021-03-07 01:18:39'),
(560, 'description_faster_checkout_with_prefilled_details', 'Faster checkout with prefilled customer details.', '??nceden doldurulmu?? kullan??c?? bilgisiyle daha h??zl?? sat??n alma', 0, 1, 0, '2021-03-07 02:19:19', '2021-03-07 01:20:57', '2021-03-07 01:18:39'),
(561, 'description_receive_new_offers', 'Receive information about new offers and great deals.', 'Yeni f??rsatlar i??in bilgi al', 0, 1, 0, '2021-03-07 02:19:19', '2021-03-07 01:20:57', '2021-03-07 01:18:39'),
(562, 'title_register_now', 'Register Now', '??imdi Kaydol', 0, 1, 0, '2021-03-07 02:19:19', '2021-03-07 01:20:57', '2021-03-07 01:18:39'),
(563, 'title_contact_us', 'Contact Us', '??leti??ime Ge??', 0, 1, 0, '2021-03-16 12:23:49', '2021-03-07 01:22:19', '2021-03-07 01:21:20'),
(564, 'text_or_leave_blank', 'Or leave blank', 'Ya da bo?? b??rak', 0, 1, 0, '2021-03-16 12:23:49', '2021-03-07 01:22:19', '2021-03-07 01:21:20'),
(565, 'title_tax_id', 'Tax ID', 'Vergi Numaras??', 0, 1, 0, '2021-03-16 12:23:49', '2021-03-07 01:22:19', '2021-03-07 01:21:20'),
(566, 'title_firstname', 'First Name', 'Ad', 0, 1, 0, '2021-03-16 12:23:49', '2021-03-07 01:22:19', '2021-03-07 01:21:20'),
(567, 'title_lastname', 'Last Name', 'Soyad', 0, 1, 0, '2021-03-16 12:23:49', '2021-03-07 01:22:19', '2021-03-07 01:21:20'),
(568, 'title_address1', 'Address 1', 'Adres 1', 0, 1, 0, '2021-03-16 12:23:49', '2021-03-07 01:22:19', '2021-03-07 01:21:20'),
(569, 'title_address2', 'Address 2', 'Adres 2', 0, 1, 0, '2021-03-16 12:23:49', '2021-03-07 01:22:19', '2021-03-07 01:21:20'),
(570, 'title_postcode', 'Postal Code', 'Posta Kodu', 0, 1, 0, '2021-03-16 12:23:49', '2021-03-07 01:22:19', '2021-03-07 01:21:20'),
(571, 'title_city', 'City', '??ehir', 0, 1, 0, '2021-03-16 12:23:49', '2021-03-16 12:30:07', '2021-03-07 01:21:20'),
(572, 'title_phone', 'Phone', 'Telefon', 0, 1, 0, '2021-03-16 12:23:49', '2021-03-07 01:22:19', '2021-03-07 01:21:20'),
(573, 'title_desired_password', 'Desired Password', '??ifre', 0, 1, 0, '2021-03-07 01:24:31', '2021-03-07 01:22:19', '2021-03-07 01:21:20'),
(574, 'consent_newsletter', 'I would like to be notified occasionally via e-mail when there are new products or campaigns.', 'Yeni ??r??n ve kampanyalardan haberdar olmak istiyorum.', 0, 1, 0, '2021-03-16 12:23:49', '2021-03-07 01:22:19', '2021-03-07 01:21:20'),
(575, 'title_captcha', 'CAPTCHA', 'CAPTCHA', 0, 1, 0, '2021-03-07 02:27:16', '2021-03-07 01:22:19', '2021-03-07 01:21:20'),
(576, 'email_subject_customer_account_created', 'Customer Account Created', 'M????teri Hesab?? Olu??turuldu', 0, 0, 0, NULL, '2021-03-08 04:21:20', '2021-03-07 01:23:31'),
(577, 'email_account_created', 'Welcome %customer_firstname %customer_lastname to %store_name!\r\n\r\nYour account has been created. You can now make purchases in our online store and keep track of history.\r\n\r\nLogin using your email address %customer_email.\r\n\r\n%store_name\r\n\r\n%store_link', 'Merhaba %customer_firstname %customer_lastname\r\n\r\n%store_name\'e ho??geldin\r\n\r\nHesab??n olu??turuldu. Art??k ma??azam??zda al????veri?? yapabilirsin ve ge??mi??ini takip edebilirsin.\r\n\r\n%customer_email adresini kullanarak giri?? yapabilirsin\r\n\r\n%store_name\r\n\r\n%store_link', 0, 0, 0, NULL, '2021-03-08 04:21:20', '2021-03-07 01:23:31'),
(578, 'success_your_customer_account_has_been_created', 'Your customer account has been created.', 'M????teriniz olu??turuldu', 0, 0, 0, NULL, '2021-03-08 04:21:20', '2021-03-07 01:24:31'),
(579, 'error_already_logged_in', 'You are already logged in', 'Zaten giri?? yapt??n??z', 0, 1, 0, '2021-03-07 01:24:31', '2021-03-08 04:21:20', '2021-03-07 01:24:31'),
(580, 'error_invalid_captcha', 'Invalid CAPTCHA given', 'Ge??ersiz CAPTCHA', 0, 1, 0, '2021-03-07 01:24:31', '2021-03-08 04:21:20', '2021-03-07 01:24:31'),
(581, 'title_order_history', 'Order History', 'Sipari?? Ge??mi??i', 0, 1, 0, '2021-03-16 12:23:59', '2021-03-07 01:45:45', '2021-03-07 01:24:31'),
(582, 'title_edit_account', 'Edit Account', 'Kullan??c??y?? D??zenle', 0, 1, 0, '2021-03-16 12:23:59', '2021-03-07 01:45:45', '2021-03-07 01:24:31'),
(583, 'text_already_logged_in', 'You are already logged in', 'Zaten giri?? yapt??n??z', 0, 1, 0, '2021-03-07 02:18:58', '2021-03-07 01:45:45', '2021-03-07 01:24:38'),
(584, 'error_wrong_password_or_account', 'Wrong password or the account does not exist', 'Hatal?? ??ifre ya da kullan??c?? mevcut de??il', 0, 1, 0, '2021-03-07 01:24:49', '2021-03-07 01:45:45', '2021-03-07 01:24:49'),
(585, 'success_logged_in_as_user', 'You are now logged in as %firstname %lastname.', '??uan %firstname %lastname ad??na giri?? yap??ld??', 0, 0, 0, NULL, '2021-03-07 01:45:45', '2021-03-07 01:24:53'),
(586, 'title_general', 'General', 'Genel', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:18'),
(587, 'title_filters', 'Filters', 'Filtreler', 0, 0, 1, '2021-03-07 02:18:39', '2021-03-07 01:45:45', '2021-03-07 01:25:18'),
(588, 'title_parent_category', 'Parent Category', '??st Kategori', 0, 0, 1, '2021-03-07 02:18:39', '2021-03-07 01:45:45', '2021-03-07 01:25:18'),
(589, 'title_google_taxonomy_id', 'Google Taxonomy ID', 'Google Taxonomy ID', 0, 0, 1, '2021-03-07 02:18:39', '2021-03-07 01:45:45', '2021-03-07 01:25:18'),
(590, 'title_list_style', 'List Style', 'Liste Stili', 0, 0, 1, '2021-03-07 02:18:39', '2021-03-07 01:41:51', '2021-03-07 01:25:18'),
(591, 'title_columns', 'Columns', 'S??tunlar', 0, 0, 1, '2021-03-07 02:18:39', '2021-03-07 01:41:51', '2021-03-07 01:25:18'),
(592, 'title_rows', 'Rows', 'Sat??rlar', 0, 0, 1, '2021-03-07 02:18:39', '2021-03-07 01:41:51', '2021-03-07 01:25:18'),
(593, 'title_h1_title', 'H1 Title', 'H1 Ba??l??k', 0, 0, 1, '2021-03-07 02:18:39', '2021-03-07 01:41:51', '2021-03-07 01:25:18'),
(594, 'title_short_description', 'Short Description', 'K??sa A????klama', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:41:51', '2021-03-07 01:25:18'),
(595, 'title_head_title', 'Head Title', 'Ba??l??k Yaz??s??', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:41:51', '2021-03-07 01:25:18'),
(596, 'title_meta_description', 'Meta Description', 'Meta A????klamas??', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:18'),
(597, 'title_attribute_group', 'Attribute Group', '??zellik Grubu', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:18'),
(598, 'title_select_multiple', 'Select Multiple', '??oklu Se??', 0, 0, 1, '2021-03-07 02:18:39', '2021-03-07 01:38:04', '2021-03-07 01:25:18'),
(599, 'error_must_select_attribute_group', 'You must select an attribute group', 'Bir ??zellik grubu se??melisin', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:18'),
(600, 'text_move_up', 'Move up', 'Yukar??', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:18'),
(601, 'text_move_down', 'Move down', 'A??a????', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:18'),
(602, 'title_empty', 'Empty', 'Bo??', 0, 0, 1, '2021-03-07 01:25:58', '2021-03-07 01:38:04', '2021-03-07 01:25:44'),
(603, 'title_edit_category', 'Edit Category', 'Kategori D??zenle', 0, 0, 1, '2021-03-07 02:18:39', '2021-03-07 01:38:04', '2021-03-07 01:25:53'),
(604, 'title_date_updated', 'Date Updated', 'G??ncelleme Tarihi', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:53'),
(605, 'title_date_created', 'Date Created', 'Olu??turulma Tarihi', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:53'),
(606, 'title_list_order', 'List Order', 'Sipari??i Listele', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:32:44', '2021-03-07 01:25:59'),
(607, 'title_alphabetical', 'Alphabetical', 'Alfabetik', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:32:44', '2021-03-07 01:25:59'),
(608, 'title_prices', 'Prices', 'Fiyatlar', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:32:44', '2021-03-07 01:25:59'),
(609, 'title_options', 'Options', 'Se??enekler', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:32:44', '2021-03-07 01:25:59'),
(610, 'title_stock', 'Stock', 'Stok', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:32:44', '2021-03-07 01:25:59'),
(611, 'title_default_category', 'Default Category', 'Varsay??lan Kategori', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:32:44', '2021-03-07 01:25:59'),
(612, 'title_sku', 'SKU', 'SKU', 0, 1, 1, '2021-03-16 12:23:32', '2021-03-07 01:32:44', '2021-03-07 01:25:59'),
(613, 'title_mpn', 'MPN', 'MPN', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:32:44', '2021-03-07 01:25:59'),
(614, 'title_gtin', 'GTIN', 'GTIN', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:32:44', '2021-03-07 01:25:59'),
(615, 'title_taric', 'TARIC', 'TARIC', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:59'),
(616, 'title_manufacturer', 'Manufacturer', '??retici', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:59'),
(617, 'title_supplier', 'Supplier', 'Sa??lay??c??', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:59'),
(618, 'title_images', 'Images', 'Foto??raflar', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:32:44', '2021-03-07 01:25:59'),
(619, 'text_add', 'Add', 'Ekle', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:32:44', '2021-03-07 01:25:59'),
(620, 'title_technical_data', 'Technical Data', 'Teknik Veri', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:59'),
(621, 'title_group', 'Group', 'Grup', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:59');
INSERT INTO `lc_translations` (`id`, `code`, `text_en`, `text_tr`, `html`, `frontend`, `backend`, `date_accessed`, `date_updated`, `date_created`) VALUES
(622, 'title_custom_value', 'Custom Value', '??zel De??er', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(623, 'title_purchase_price', 'Purchase Price', 'Al??m Fiyat??', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(624, 'title_recommended_price', 'Recommended Price', '??nerilen Fiyat', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(625, 'title_price', 'Price', 'Fiyat', 0, 1, 1, '2021-03-16 12:23:29', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(626, 'title_price_incl_tax', 'Price Incl. Tax', 'Vergi Dahil Fiyat', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:45:45', '2021-03-07 01:25:59'),
(627, 'title_campaigns', 'Campaigns', 'Kampanyalar', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(628, 'text_add_campaign', 'Add Campaign', 'Kampanya Ekle', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(629, 'title_add_predefined_option', 'Add Predefined Option', '??ntan??ml?? Se??enek Ekle', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(630, 'title_add_user_input_option', 'Add User Input Option', 'Kullan??c?? Girdi Se??ene??i Ekle', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(631, 'title_quantity_unit', 'Quantity Unit', 'Miktar Birimi', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(632, 'title_delivery_status', 'Delivery Status', 'Ta????m Durumu', 0, 1, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(633, 'title_sold_out_status', 'Sold Out Status', 'T??kenmi?? Durumu', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(634, 'title_option', 'Option', 'Se??enek', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(635, 'title_weight', 'Weight', 'A????rl??k', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(636, 'title_dimensions', 'Dimensions', 'Boyutlar', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(637, 'title_adjust', 'Adjust', 'Ayarla', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(638, 'title_default_item', 'Default Item', 'Varsay??lan Kay??t', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(639, 'title_add_stock_option', 'Add Stock Option', 'Stok Se??ene??i Ekle', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(640, 'title_new_stock_option', 'New Stock Option', 'Yeni Stok Se??ene??i', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:59'),
(641, 'title_add_to_combination', 'Add To Combination', 'Kombinasyona Ekle', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:59'),
(642, 'error_must_select_attribute_value', 'You must select an attribute value', 'Bir ??zellik de??eri se??melisin', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:59'),
(643, 'error_cannot_define_both_value_and_custom_value', 'You can not define both a value and a custom value', 'Hem de??er hem de  ??zel de??er tan??mlayamazs??n', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:59'),
(644, 'tooltip_field_price_incl_tax', 'This field helps you calculate gross price based on the store region tax. All prices input to database are always excluding tax.', 'Bu alan br??t fiyat?? ma??aza b??lgesinin vergisine dayanarak hesaplamana yard??mc?? olur. Veritaban??na girilen t??m fiyatlar her zaman vergisizdir.', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-16 12:12:36', '2021-03-07 01:25:59'),
(645, 'title_start_date', 'Start Date', 'Ba??lang???? Tarihi', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:59'),
(646, 'title_end_date', 'End Date', 'Biti?? Tarihi', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:59'),
(647, 'error_option_already_defined', 'This option is already defined', 'Bu se??enek zaten tan??ml??', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(648, 'title_function', 'Function', 'Fonksiyon', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:59'),
(649, 'title_sort_values', 'Sort Values', 'De??erleri S??rala', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:38:04', '2021-03-07 01:25:59'),
(650, 'title_required', 'Required', 'Gerekli', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(651, 'title_price_operator', 'Price Operator', 'Fiyat Operat??r??', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(652, 'title_price_adjustment', 'Price Adjustment', 'Fiyat Ayarlamas??', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(653, 'error_group_already_defined', 'This group is already defined', 'Bu grup zaten tan??ml??', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(654, 'error_empty_option_group', 'Error: Empty option group', 'Hata: Bo?? se??enek grubu', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(655, 'error_empty_option_value', 'Error: Empty option value', 'Hata: Bo?? se??enek de??eri', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:35:17', '2021-03-07 01:25:59'),
(656, 'text_product_is_out_of_stock', 'The product is out of stock', '??r??n sto??u t??kenmi??tir', 0, 0, 1, '2021-03-07 01:26:37', '2021-03-07 01:32:44', '2021-03-07 01:26:16'),
(657, 'title_view', 'View', 'G??r??nt??le', 0, 0, 1, '2021-03-16 12:08:43', '2021-03-07 01:32:44', '2021-03-07 01:26:16'),
(658, 'title_edit_product', 'Edit Product', '??r??n?? D??zenle', 0, 0, 1, '2021-03-16 12:08:49', '2021-03-07 01:32:44', '2021-03-07 01:26:18'),
(659, 'title_popular_products', 'Popular Products', 'Pop??ler ??r??nler', 0, 1, 0, '2021-03-16 12:16:33', '2021-03-07 01:32:44', '2021-03-07 01:26:22'),
(660, 'title_new', 'New', 'Yeni', 0, 1, 0, '2021-03-16 12:23:32', '2021-03-07 01:32:44', '2021-03-07 01:26:22'),
(661, 'sticker_new', 'New', 'Yeni', 0, 1, 0, '2021-03-16 12:23:32', '2021-03-07 01:32:44', '2021-03-07 01:26:22'),
(662, 'title_latest_products', 'Latest Products', 'Yeni ??r??nler', 0, 1, 0, '2021-03-16 12:16:33', '2021-03-07 01:32:44', '2021-03-07 01:26:22'),
(663, 'text_no_product_description', 'There is no description for this product yet.', 'Bu ??r??n i??in hen??z bir a????klama bulunmuyor', 0, 1, 0, '2021-03-16 12:23:32', '2021-03-07 01:32:44', '2021-03-07 01:26:25'),
(664, 'title_stock_status', 'Stock Status', 'Stok Durumu', 0, 1, 0, '2021-03-16 12:23:32', '2021-03-07 01:32:44', '2021-03-07 01:26:25'),
(665, 'title_excluding_tax', 'Excluding Tax', 'Vergi Hari??', 0, 1, 0, '2021-03-07 01:28:12', '2021-03-07 01:32:44', '2021-03-07 01:26:25'),
(666, 'title_add_to_cart', 'Add To Cart', 'Sepete Ekle', 0, 1, 0, '2021-03-16 12:23:32', '2021-03-07 01:32:44', '2021-03-07 01:26:25'),
(667, 'text_share_on_s', 'Share on %s', '%s\'de payla??', 0, 1, 0, '2021-03-16 12:23:32', '2021-03-07 01:32:44', '2021-03-07 01:26:25'),
(668, 'text_link_to_this_product', 'Link to this product', 'Bu ??r??ne ba??la', 0, 1, 0, '2021-03-16 12:23:32', '2021-03-07 01:32:44', '2021-03-07 01:26:25'),
(669, 'title_including_tax', 'Including Tax', 'Vergi', 0, 1, 0, '2021-03-16 12:23:32', '2021-03-07 01:45:45', '2021-03-07 01:28:25'),
(670, 'categories:head_title', 'Categories', 'Kategoriler', 0, 1, 0, '2021-03-07 01:44:21', '2021-03-07 01:45:45', '2021-03-07 01:44:21'),
(671, 'categories:meta_description', '', '', 0, 1, 0, '2021-03-07 01:44:21', '2021-03-16 12:15:35', '2021-03-07 01:44:21'),
(672, 'title_search_results_for_s', 'Search Results for &quot;%s&quot;', '&quot;%s&quot; i??in arama sonu??lar??', 0, 1, 0, '2021-03-07 01:45:54', '2021-03-07 01:45:45', '2021-03-07 01:44:30'),
(673, 'title_search_results', 'Search Results', 'Arama Sonu??lar??', 0, 1, 0, '2021-03-07 01:45:54', '2021-03-07 01:45:45', '2021-03-07 01:44:30'),
(674, 'title_relevance', 'Relevance', 'Alaka', 0, 1, 0, '2021-03-07 01:45:54', '2021-03-07 01:45:45', '2021-03-07 01:44:30'),
(675, 'title_popularity', 'Popularity', 'Pop??lerite', 0, 1, 0, '2021-03-16 12:23:29', '2021-03-07 01:45:45', '2021-03-07 01:44:30'),
(676, 'text_no_matching_results', 'No matching results', 'E??le??en sonu?? bulumamad??', 0, 1, 0, '2021-03-07 01:45:54', '2021-03-07 01:45:45', '2021-03-07 01:44:42'),
(677, 'title_sign_in_and_security', 'Sign-In and Security', 'Giri?? ve G??venlik', 0, 1, 0, '2021-03-16 12:23:49', '2021-03-08 04:21:20', '2021-03-07 01:46:15'),
(678, 'title_confirm_new_password', 'Confirm New Password', 'Yeni ??ifreyi Onayla', 0, 1, 0, '2021-03-16 12:23:49', '2021-03-08 04:21:20', '2021-03-07 01:46:15'),
(679, 'title_customer_profile', 'Customer Profile', 'M????teri Profili', 0, 1, 0, '2021-03-16 12:23:49', '2021-03-08 04:21:20', '2021-03-07 01:46:15'),
(680, 'order_history:head_title', 'Order History', 'Sipari?? Ge??mi??i', 0, 1, 0, '2021-03-07 02:27:19', '2021-03-08 04:21:20', '2021-03-07 01:46:18'),
(681, 'title_order', 'Order', 'Sipari?? Ver', 0, 1, 0, '2021-03-07 02:27:19', '2021-03-08 04:21:20', '2021-03-07 01:46:18'),
(682, 'customer_service:head_title', 'Customer Service', 'M????teri Hizmetleri', 0, 1, 0, '2021-03-07 02:27:16', '2021-03-08 04:21:20', '2021-03-07 01:46:22'),
(683, 'customer_service:meta_description', '', '', 0, 1, 0, '2021-03-07 02:27:16', '2021-03-16 12:15:35', '2021-03-07 01:46:22'),
(684, 'title_send', 'Send', 'G??nder', 0, 1, 0, '2021-03-07 02:27:16', '2021-03-08 04:21:20', '2021-03-07 01:46:22'),
(685, 'error_d_login_attempts_left', 'You have %d login attempts left until your account is temporarily blocked', 'Hesab??n??z??n ge??i??i olarak bloke edilmesine %d deneme hakk??n??z kald??.', 0, 0, 1, '2021-03-16 12:04:24', '2021-03-08 04:21:20', '2021-03-07 02:14:56'),
(686, 'error_wrong_username_password_combination', 'Wrong combination of username and password or the account does not exist.', 'Kullan??c?? ad?? ve ??ifrenin yanl???? kombinasyonu ya da b??yle bir hesap bulunamad??.', 0, 0, 1, '2021-03-16 12:04:24', '2021-03-08 04:21:20', '2021-03-07 02:14:56'),
(687, 'description_logged_out', 'You are now logged out.', '????k???? yapt??n??z', 0, 0, 0, NULL, '2021-03-08 04:21:20', '2021-03-07 02:19:07'),
(688, 'default.catalog:title_sidebar_parallax_effect', 'Kayd??rma ??ubu??u Paralaks Efekti', 'Kayd??rma ??ubu??u Paralaks Efekti', 0, 0, 1, '2021-03-07 02:26:26', '2021-03-08 04:21:20', '2021-03-07 02:26:26'),
(689, 'default.catalog:title_compact_category_tree', 'Birle??ik Kategori A??ac??', 'Birle??ik Kategori A??ac??', 0, 0, 1, '2021-03-07 02:26:26', '2021-03-08 04:21:20', '2021-03-07 02:26:26'),
(690, 'title_recently_viewed', 'Recently Viewed', 'Yak??nda G??r??nt??lenenler', 0, 1, 0, '2021-03-16 12:23:59', '2021-03-08 04:21:20', '2021-03-07 02:26:29'),
(691, 'text_search_products', 'Search products', '??r??nlerde ara', 0, 1, 0, '2021-03-16 12:23:59', '2021-03-08 04:21:20', '2021-03-07 02:26:29'),
(692, 'title_contact_details', 'Contact Details', '??leti??im Detaylar??', 0, 1, 0, '2021-03-07 02:27:16', '2021-03-08 04:21:20', '2021-03-07 02:27:16'),
(693, 'text_new_customers_click_here', 'New customers click here', 'Yeni m????teriler buraya t??klay??n', 0, 1, 0, '2021-03-16 12:16:34', '2021-03-16 12:12:36', '2021-03-16 12:03:56'),
(694, 'warning_account_previously_used_by_another_host', 'Your account was previously used by another location or hostname (%hostname). If this was not you then your login credentials might be compromised.', 'Hesab??n??z ba??ka bir lokasyon ya da ip (%hostname) ??zerinden kullan??ld??. E??er bu siz de??ilseniz, giri?? bilgileriniz ba??kalar?? taraf??ndan ele ge??irilmi?? olabilir.', 0, 0, 0, NULL, '2021-03-16 12:12:36', '2021-03-16 12:04:28'),
(695, 'error_passwords_missmatch', 'The passwords did not match', '', 0, 0, 1, '2021-03-16 12:24:21', '2021-03-16 12:24:21', '2021-03-16 12:24:21');

-- --------------------------------------------------------

--
-- Table structure for table `lc_users`
--

CREATE TABLE `lc_users` (
  `id` int UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_hash` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `apps` varchar(4096) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `widgets` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_ip` varchar(39) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_host` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `login_attempts` int UNSIGNED NOT NULL DEFAULT '0',
  `total_logins` int UNSIGNED NOT NULL DEFAULT '0',
  `date_valid_from` timestamp NULL DEFAULT NULL,
  `date_valid_to` timestamp NULL DEFAULT NULL,
  `date_active` timestamp NULL DEFAULT NULL,
  `date_login` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_users`
--

INSERT INTO `lc_users` (`id`, `status`, `username`, `email`, `password_hash`, `apps`, `widgets`, `last_ip`, `last_host`, `login_attempts`, `total_logins`, `date_valid_from`, `date_valid_to`, `date_active`, `date_login`, `date_updated`, `date_created`) VALUES
(1, 1, 'admin', '', '$2y$10$ZFv0da1uhF2Bl8nmCJodH.kBNRkwfh.gdZH9lfbbFyPG.Dx99OdB.', '[]', '[]', '172.18.0.1', '172.18.0.1', 0, 5, NULL, NULL, '2021-03-16 12:30:31', '2021-03-16 12:04:28', '2021-03-16 12:24:59', '2021-03-06 23:05:35'),
(2, 1, 'mutlulugunhabercisi', 'info@mutlulugunhabercisi.com', '$2y$10$TGSLrq7OdsoBpZgD.Bz4Z.wBRJuVNx0UP1EMMm337A/Bq7EdetXXm', '{\"catalog\":{\"status\":\"1\",\"docs\":[\"attribute_groups\",\"attribute_values.json\",\"catalog\",\"category_picker\",\"csv\",\"delivery_statuses\",\"edit_attribute_group\",\"edit_category\",\"edit_delivery_status\",\"edit_manufacturer\",\"edit_product\",\"edit_quantity_unit\",\"edit_sold_out_status\",\"edit_supplier\",\"manufacturers\",\"product_picker\",\"products.json\",\"quantity_units\",\"sold_out_statuses\",\"suppliers\"]},\"customers\":{\"status\":\"1\",\"docs\":[\"customer_picker\",\"customers\",\"customers.json\",\"csv\",\"edit_customer\",\"get_address.json\",\"newsletter\"]},\"reports\":{\"status\":\"1\",\"docs\":[\"monthly_sales\",\"most_sold_products\",\"most_shopping_customers\"]},\"pages\":{\"status\":\"1\",\"docs\":[\"pages\",\"edit_page\",\"csv\"]},\"orders\":{\"status\":\"1\",\"docs\":[\"orders\",\"edit_order\",\"order_statuses\",\"edit_order_status\",\"add_product\",\"product_picker\"]}}', '[]', '172.18.0.1', '172.18.0.1', 0, 4, NULL, NULL, '2021-03-16 12:30:13', '2021-03-16 12:25:44', '2021-03-16 12:25:21', '2021-03-07 00:18:14');

-- --------------------------------------------------------

--
-- Table structure for table `lc_zones`
--

CREATE TABLE `lc_zones` (
  `id` int UNSIGNED NOT NULL,
  `country_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_zones`
--

INSERT INTO `lc_zones` (`id`, `country_code`, `code`, `name`, `date_updated`, `date_created`) VALUES
(1, 'AU', 'ACT', 'Australian Capital Territory', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(2, 'AU', 'NSW', 'New South Wales', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(3, 'AU', 'NT', 'Northern Territory', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(4, 'AU', 'QLD', 'Queensland', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(5, 'AU', 'SA', 'South Australia', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(6, 'AU', 'TAS', 'Tasmania', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(7, 'AU', 'VIC', 'Victoria', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(8, 'AU', 'WA', 'Western Australia', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(9, 'CA', 'AB', 'Alberta', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(10, 'CA', 'BC', 'British Columbia', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(11, 'CA', 'MB', 'Manitoba', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(12, 'CA', 'NB', 'New Brunswick', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(13, 'CA', 'NL', 'Newfoundland and Labrador', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(14, 'CA', 'NT', 'Northwest Territories', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(15, 'CA', 'NS', 'Nova Scotia', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(16, 'CA', 'NU', 'Nunavut', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(17, 'CA', 'ON', 'Ontario', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(18, 'CA', 'PE', 'Prince Edward Island', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(19, 'CA', 'QC', 'Qu??bec', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(20, 'CA', 'SK', 'Saskatchewan', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(21, 'CA', 'YT', 'Yukon Territory', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(22, 'US', 'AL', 'Alabama', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(23, 'US', 'AK', 'Alaska', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(24, 'US', 'AZ', 'Arizona', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(25, 'US', 'AR', 'Arkansas', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(26, 'US', 'CA', 'California', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(27, 'US', 'CO', 'Colorado', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(28, 'US', 'CT', 'Connecticut', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(29, 'US', 'DE', 'Delaware', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(30, 'US', 'FL', 'Florida', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(31, 'US', 'GA', 'Georgia', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(32, 'US', 'HI', 'Hawaii', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(33, 'US', 'ID', 'Idaho', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(34, 'US', 'IL', 'Illinois', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(35, 'US', 'IN', 'Indiana', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(36, 'US', 'IA', 'Iowa', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(37, 'US', 'KS', 'Kansas', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(38, 'US', 'KY', 'Kentucky', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(39, 'US', 'LA', 'Louisiana', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(40, 'US', 'ME', 'Maine', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(41, 'US', 'MD', 'Maryland', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(42, 'US', 'MA', 'Massachusetts', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(43, 'US', 'MI', 'Michigan', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(44, 'US', 'MN', 'Minnesota', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(45, 'US', 'MS', 'Mississippi', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(46, 'US', 'MO', 'Missouri', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(47, 'US', 'MT', 'Montana', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(48, 'US', 'NE', 'Nebraska', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(49, 'US', 'NV', 'Nevada', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(50, 'US', 'NH', 'New Hampshire', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(51, 'US', 'NJ', 'New Jersey', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(52, 'US', 'NM', 'New Mexico', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(53, 'US', 'NY', 'New York', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(54, 'US', 'NC', 'North Carolina', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(55, 'US', 'ND', 'North Dakota', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(56, 'US', 'OH', 'Ohio', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(57, 'US', 'OK', 'Oklahoma', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(58, 'US', 'OR', 'Oregon', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(59, 'US', 'PA', 'Pennsylvania', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(60, 'US', 'RI', 'Rhode Island', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(61, 'US', 'SC', 'South Carolina', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(62, 'US', 'SD', 'South Dakota', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(63, 'US', 'TN', 'Tennessee', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(64, 'US', 'TX', 'Texas', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(65, 'US', 'UT', 'Utah', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(66, 'US', 'VT', 'Vermont', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(67, 'US', 'VA', 'Virginia', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(68, 'US', 'WA', 'Washington', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(69, 'US', 'WV', 'West Virginia', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(70, 'US', 'WI', 'Wisconsin', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(71, 'US', 'WY', 'Wyoming', '2021-03-06 21:05:35', '2021-03-06 21:05:35'),
(72, 'TR', '01', 'Adana', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(73, 'TR', '02', 'Ad??yaman', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(74, 'TR', '03', 'Afyon', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(75, 'TR', '04', 'A??r??', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(76, 'TR', '05', 'Amasya', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(77, 'TR', '06', 'Ankara', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(78, 'TR', '07', 'Antalya', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(79, 'TR', '08', 'Artvin', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(80, 'TR', '09', 'Ayd??n', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(81, 'TR', '10', 'Bal??kesir', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(82, 'TR', '11', 'Bilecik', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(83, 'TR', '12', 'Bing??l', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(84, 'TR', '13', 'Bitlis', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(85, 'TR', '14', 'Bolu', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(86, 'TR', '15', 'Burdur', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(87, 'TR', '16', 'Bursa', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(88, 'TR', '17', '??anakkale', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(89, 'TR', '18', '??ank??r??', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(90, 'TR', '19', '??orum', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(91, 'TR', '20', 'Denizli', '2021-03-07 02:06:02', '2021-03-07 01:55:10'),
(92, 'TR', '21', 'Diyarbak??r', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(93, 'TR', '22', 'Edirne', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(94, 'TR', '23', 'Elaz????', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(95, 'TR', '24', 'Erzincan', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(96, 'TR', '25', 'Erzurum', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(97, 'TR', '26', 'Eski??ehir', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(98, 'TR', '27', 'Gaziantep', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(99, 'TR', '28', 'Giresun', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(100, 'TR', '29', 'G??m????hane', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(101, 'TR', '30', 'Hakkari', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(102, 'TR', '31', 'Hatay', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(103, 'TR', '32', 'Isparta', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(104, 'TR', '33', 'Mersin', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(105, 'TR', '34', '??stanbul', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(106, 'TR', '35', '??zmir', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(107, 'TR', '36', 'Kars', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(108, 'TR', '37', 'Kastamonu', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(109, 'TR', '38', 'Kayseri', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(110, 'TR', '39', 'K??rklareli', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(111, 'TR', '40', 'K??r??ehir', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(112, 'TR', '41', 'Kocaeli', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(113, 'TR', '42', 'Konya', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(114, 'TR', '43', 'K??tahya', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(115, 'TR', '44', 'Malatya', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(116, 'TR', '45', 'Manisa', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(117, 'TR', '46', 'K. Mara??', '2021-03-07 02:06:02', '2021-03-07 01:58:38'),
(118, 'TR', '47', 'Mardin', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(119, 'TR', '48', 'Mu??la', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(120, 'TR', '49', 'Mu??', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(121, 'TR', '50', 'Nev??ehir', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(122, 'TR', '51', 'Ni??de', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(123, 'TR', '52', 'Ordu', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(124, 'TR', '53', 'Rize', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(125, 'TR', '54', 'Sakarya', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(126, 'TR', '55', 'Samsun', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(127, 'TR', '56', 'Siirt', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(128, 'TR', '57', 'Sinop', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(129, 'TR', '58', 'Sivas', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(130, 'TR', '59', 'Tekirda??', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(131, 'TR', '60', 'Tokat', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(132, 'TR', '61', 'Trabzon', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(133, 'TR', '62', 'Tunceli', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(134, 'TR', '63', '??anl??urfa', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(135, 'TR', '64', 'U??ak', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(136, 'TR', '65', 'Van', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(137, 'TR', '66', 'Yozgat', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(138, 'TR', '67', 'Zonguldak', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(139, 'TR', '68', 'Aksaray', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(140, 'TR', '69', 'Bayburt', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(141, 'TR', '70', 'Karaman', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(142, 'TR', '71', 'K??r??kkale', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(143, 'TR', '72', 'Batman', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(144, 'TR', '73', '????rnak', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(145, 'TR', '74', 'Bart??n', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(146, 'TR', '75', 'Ardahan', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(147, 'TR', '76', 'I??d??r', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(148, 'TR', '77', 'Yalova', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(149, 'TR', '78', 'Karab??k', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(150, 'TR', '79', 'Kilis', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(151, 'TR', '80', 'Osmaniye', '2021-03-07 02:06:02', '2021-03-07 02:06:02'),
(152, 'TR', '81', 'D??zce', '2021-03-07 02:06:02', '2021-03-07 02:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `lc_zones_to_geo_zones`
--

CREATE TABLE `lc_zones_to_geo_zones` (
  `id` int UNSIGNED NOT NULL,
  `geo_zone_id` int UNSIGNED NOT NULL DEFAULT '0',
  `country_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `zone_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lc_zones_to_geo_zones`
--

INSERT INTO `lc_zones_to_geo_zones` (`id`, `geo_zone_id`, `country_code`, `zone_code`, `date_updated`, `date_created`) VALUES
(29, 2, 'TR', '', '2021-03-07 00:21:34', '2021-03-07 00:21:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lc_attribute_groups`
--
ALTER TABLE `lc_attribute_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `lc_attribute_groups_info`
--
ALTER TABLE `lc_attribute_groups_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_group` (`group_id`,`language_code`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `language_code` (`language_code`);

--
-- Indexes for table `lc_attribute_values`
--
ALTER TABLE `lc_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `lc_attribute_values_info`
--
ALTER TABLE `lc_attribute_values_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_value` (`value_id`,`language_code`),
  ADD KEY `value_id` (`value_id`),
  ADD KEY `language_code` (`language_code`);

--
-- Indexes for table `lc_cart_items`
--
ALTER TABLE `lc_cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `cart_uid` (`cart_uid`);

--
-- Indexes for table `lc_categories`
--
ALTER TABLE `lc_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `lc_categories_filters`
--
ALTER TABLE `lc_categories_filters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_filter` (`category_id`,`attribute_group_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `lc_categories_info`
--
ALTER TABLE `lc_categories_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category` (`category_id`,`language_code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `language_code` (`language_code`);

--
-- Indexes for table `lc_countries`
--
ALTER TABLE `lc_countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iso_code_1` (`iso_code_1`),
  ADD UNIQUE KEY `iso_code_2` (`iso_code_2`),
  ADD UNIQUE KEY `iso_code_3` (`iso_code_3`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `lc_currencies`
--
ALTER TABLE `lc_currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `lc_customers`
--
ALTER TABLE `lc_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `lc_delivery_statuses`
--
ALTER TABLE `lc_delivery_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lc_delivery_statuses_info`
--
ALTER TABLE `lc_delivery_statuses_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_status` (`delivery_status_id`,`language_code`),
  ADD KEY `delivery_status_id` (`delivery_status_id`),
  ADD KEY `language_code` (`language_code`);

--
-- Indexes for table `lc_emails`
--
ALTER TABLE `lc_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_scheduled` (`date_scheduled`),
  ADD KEY `code` (`code`),
  ADD KEY `date_created` (`date_created`),
  ADD KEY `sender_email` (`sender`);

--
-- Indexes for table `lc_geo_zones`
--
ALTER TABLE `lc_geo_zones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lc_languages`
--
ALTER TABLE `lc_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `lc_manufacturers`
--
ALTER TABLE `lc_manufacturers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `lc_manufacturers_info`
--
ALTER TABLE `lc_manufacturers_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brand_info` (`manufacturer_id`,`language_code`),
  ADD KEY `manufacturer_id` (`manufacturer_id`),
  ADD KEY `language_code` (`language_code`);

--
-- Indexes for table `lc_modules`
--
ALTER TABLE `lc_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_id` (`module_id`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `lc_orders`
--
ALTER TABLE `lc_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_status_id` (`order_status_id`),
  ADD KEY `starred` (`starred`),
  ADD KEY `unread` (`unread`);

--
-- Indexes for table `lc_orders_comments`
--
ALTER TABLE `lc_orders_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `lc_orders_items`
--
ALTER TABLE `lc_orders_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `lc_orders_totals`
--
ALTER TABLE `lc_orders_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `lc_order_statuses`
--
ALTER TABLE `lc_order_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_sale` (`is_sale`),
  ADD KEY `is_archived` (`is_archived`);

--
-- Indexes for table `lc_order_statuses_info`
--
ALTER TABLE `lc_order_statuses_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_status_info` (`order_status_id`,`language_code`),
  ADD KEY `order_status_id` (`order_status_id`),
  ADD KEY `language_code` (`language_code`);

--
-- Indexes for table `lc_pages`
--
ALTER TABLE `lc_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `dock` (`dock`);

--
-- Indexes for table `lc_pages_info`
--
ALTER TABLE `lc_pages_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_info` (`page_id`,`language_code`),
  ADD KEY `page_id` (`page_id`),
  ADD KEY `language_code` (`language_code`);

--
-- Indexes for table `lc_products`
--
ALTER TABLE `lc_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `default_category_id` (`default_category_id`),
  ADD KEY `manufacturer_id` (`manufacturer_id`),
  ADD KEY `keywords` (`keywords`),
  ADD KEY `code` (`code`),
  ADD KEY `sku` (`sku`),
  ADD KEY `mpn` (`mpn`),
  ADD KEY `gtin` (`gtin`),
  ADD KEY `taric` (`taric`),
  ADD KEY `date_valid_from` (`date_valid_from`),
  ADD KEY `date_valid_to` (`date_valid_to`),
  ADD KEY `purchases` (`purchases`),
  ADD KEY `views` (`views`);

--
-- Indexes for table `lc_products_attributes`
--
ALTER TABLE `lc_products_attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`,`product_id`,`group_id`,`value_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `value_id` (`value_id`);

--
-- Indexes for table `lc_products_campaigns`
--
ALTER TABLE `lc_products_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `lc_products_images`
--
ALTER TABLE `lc_products_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `lc_products_info`
--
ALTER TABLE `lc_products_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_info` (`product_id`,`language_code`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `language_code` (`language_code`);
ALTER TABLE `lc_products_info` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `lc_products_info` ADD FULLTEXT KEY `short_description` (`short_description`);
ALTER TABLE `lc_products_info` ADD FULLTEXT KEY `description` (`description`);

--
-- Indexes for table `lc_products_options`
--
ALTER TABLE `lc_products_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_option` (`product_id`,`group_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `priority` (`priority`);

--
-- Indexes for table `lc_products_options_stock`
--
ALTER TABLE `lc_products_options_stock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_option_stock` (`product_id`,`combination`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `lc_products_options_values`
--
ALTER TABLE `lc_products_options_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_option_value` (`product_id`,`group_id`,`value_id`,`custom_value`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `priority` (`priority`);

--
-- Indexes for table `lc_products_prices`
--
ALTER TABLE `lc_products_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `lc_products_to_categories`
--
ALTER TABLE `lc_products_to_categories`
  ADD PRIMARY KEY (`product_id`,`category_id`);

--
-- Indexes for table `lc_quantity_units`
--
ALTER TABLE `lc_quantity_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lc_quantity_units_info`
--
ALTER TABLE `lc_quantity_units_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `quantity_unit_info` (`quantity_unit_id`,`language_code`),
  ADD KEY `quantity_unit_id` (`quantity_unit_id`),
  ADD KEY `language_code` (`language_code`);

--
-- Indexes for table `lc_settings`
--
ALTER TABLE `lc_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `setting_group_key` (`setting_group_key`);

--
-- Indexes for table `lc_settings_groups`
--
ALTER TABLE `lc_settings_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `lc_slides`
--
ALTER TABLE `lc_slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lc_slides_info`
--
ALTER TABLE `lc_slides_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slide_info` (`slide_id`,`language_code`),
  ADD KEY `slide_id` (`slide_id`),
  ADD KEY `language_code` (`language_code`);

--
-- Indexes for table `lc_sold_out_statuses`
--
ALTER TABLE `lc_sold_out_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hidden` (`hidden`),
  ADD KEY `orderable` (`orderable`);

--
-- Indexes for table `lc_sold_out_statuses_info`
--
ALTER TABLE `lc_sold_out_statuses_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sold_out_status_info` (`sold_out_status_id`,`language_code`),
  ADD KEY `sold_out_status_id` (`sold_out_status_id`),
  ADD KEY `language_code` (`language_code`);

--
-- Indexes for table `lc_suppliers`
--
ALTER TABLE `lc_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `lc_tax_classes`
--
ALTER TABLE `lc_tax_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lc_tax_rates`
--
ALTER TABLE `lc_tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_class_id` (`tax_class_id`),
  ADD KEY `geo_zone_id` (`geo_zone_id`);

--
-- Indexes for table `lc_translations`
--
ALTER TABLE `lc_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `frontend` (`frontend`),
  ADD KEY `backend` (`backend`),
  ADD KEY `date_created` (`date_created`);

--
-- Indexes for table `lc_users`
--
ALTER TABLE `lc_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `lc_zones`
--
ALTER TABLE `lc_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `lc_zones_to_geo_zones`
--
ALTER TABLE `lc_zones_to_geo_zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `region` (`geo_zone_id`,`country_code`,`zone_code`),
  ADD KEY `geo_zone_id` (`geo_zone_id`),
  ADD KEY `country_code` (`country_code`),
  ADD KEY `zone_code` (`zone_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lc_attribute_groups`
--
ALTER TABLE `lc_attribute_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_attribute_groups_info`
--
ALTER TABLE `lc_attribute_groups_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_attribute_values`
--
ALTER TABLE `lc_attribute_values`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_attribute_values_info`
--
ALTER TABLE `lc_attribute_values_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_cart_items`
--
ALTER TABLE `lc_cart_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_categories`
--
ALTER TABLE `lc_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc_categories_filters`
--
ALTER TABLE `lc_categories_filters`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_categories_info`
--
ALTER TABLE `lc_categories_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lc_countries`
--
ALTER TABLE `lc_countries`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `lc_currencies`
--
ALTER TABLE `lc_currencies`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lc_customers`
--
ALTER TABLE `lc_customers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc_delivery_statuses`
--
ALTER TABLE `lc_delivery_statuses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lc_delivery_statuses_info`
--
ALTER TABLE `lc_delivery_statuses_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lc_emails`
--
ALTER TABLE `lc_emails`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc_geo_zones`
--
ALTER TABLE `lc_geo_zones`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lc_languages`
--
ALTER TABLE `lc_languages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lc_manufacturers`
--
ALTER TABLE `lc_manufacturers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_manufacturers_info`
--
ALTER TABLE `lc_manufacturers_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_modules`
--
ALTER TABLE `lc_modules`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lc_orders`
--
ALTER TABLE `lc_orders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_orders_comments`
--
ALTER TABLE `lc_orders_comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_orders_items`
--
ALTER TABLE `lc_orders_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_orders_totals`
--
ALTER TABLE `lc_orders_totals`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_order_statuses`
--
ALTER TABLE `lc_order_statuses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lc_order_statuses_info`
--
ALTER TABLE `lc_order_statuses_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `lc_pages`
--
ALTER TABLE `lc_pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_pages_info`
--
ALTER TABLE `lc_pages_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_products`
--
ALTER TABLE `lc_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc_products_attributes`
--
ALTER TABLE `lc_products_attributes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_products_campaigns`
--
ALTER TABLE `lc_products_campaigns`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_products_images`
--
ALTER TABLE `lc_products_images`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lc_products_info`
--
ALTER TABLE `lc_products_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lc_products_options`
--
ALTER TABLE `lc_products_options`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_products_options_stock`
--
ALTER TABLE `lc_products_options_stock`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_products_options_values`
--
ALTER TABLE `lc_products_options_values`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_products_prices`
--
ALTER TABLE `lc_products_prices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc_quantity_units`
--
ALTER TABLE `lc_quantity_units`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc_quantity_units_info`
--
ALTER TABLE `lc_quantity_units_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lc_settings`
--
ALTER TABLE `lc_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `lc_settings_groups`
--
ALTER TABLE `lc_settings_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `lc_slides`
--
ALTER TABLE `lc_slides`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc_slides_info`
--
ALTER TABLE `lc_slides_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lc_sold_out_statuses`
--
ALTER TABLE `lc_sold_out_statuses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lc_sold_out_statuses_info`
--
ALTER TABLE `lc_sold_out_statuses_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lc_suppliers`
--
ALTER TABLE `lc_suppliers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc_tax_classes`
--
ALTER TABLE `lc_tax_classes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc_tax_rates`
--
ALTER TABLE `lc_tax_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc_translations`
--
ALTER TABLE `lc_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=696;

--
-- AUTO_INCREMENT for table `lc_users`
--
ALTER TABLE `lc_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lc_zones`
--
ALTER TABLE `lc_zones`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `lc_zones_to_geo_zones`
--
ALTER TABLE `lc_zones_to_geo_zones`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
