SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;

CREATE TABLE IF NOT EXISTS `affiliate_earnings` (
  `id` bigint NOT NULL,
  `referrer_id` bigint NOT NULL,
  `referee_id` bigint NOT NULL,
  `transaction_id` bigint NOT NULL,
  `commission_percent` bigint NOT NULL,
  `commission_value` bigint NOT NULL DEFAULT '0',
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `amount` float NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `cashouts` (
  `id` bigint NOT NULL,
  `earning_ids` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payout_batch_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `icon` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `parent` int DEFAULT NULL,
  `range` int DEFAULT '1',
  `for` tinyint(1) DEFAULT '1' COMMENT '0 for posts / 1 for products',
  `featured` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int DEFAULT NULL,
  `approved` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `read_by_admin` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` float NOT NULL,
  `is_percentage` tinyint(1) DEFAULT '0',
  `users_ids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `starts_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `used_by` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `products_ids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `subscriptions_ids` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `once` tinyint(1) DEFAULT '0',
  `for` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'products',
  `regular_license_only` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `custom_routes` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `view` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'get',
  `csrf_protection` tinyint(1) DEFAULT '0',
  `views` bigint DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int NOT NULL,
  `question` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `answer` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `key_s` (
  `id` bigint NOT NULL,
  `code` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `purchased_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `licenses` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `regular` int DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT IGNORE INTO `licenses` (`id`, `name`, `regular`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Regular licenses', 1, '2024-02-01 00:11:38', '2024-02-01 00:11:38', NULL),
(2, 'Extended license', 0, '2024-02-01 00:11:38', '2024-02-01 00:11:38', NULL);

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `newsletter_subscribers` (
  `id` bigint NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deletet_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `users_ids` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `for` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tags` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `views` int DEFAULT '0',
  `deletable` tinyint(1) DEFAULT '1',
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `payment_links` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '0',
  `processor` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_link` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `reference` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `amount` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb3_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tags` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `active` tinyint(1) DEFAULT '1',
  `views` int DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `category` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `prepaid_credits` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `specs` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `popular` tinyint(1) DEFAULT '0',
  `order` tinyint DEFAULT '0',
  `discount` float DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `pricing_table` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `products` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `categories` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `price` float DEFAULT '0',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `specifications` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `days` int DEFAULT '0',
  `limit_downloads` int DEFAULT '0',
  `color` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `limit_downloads_per_day` int DEFAULT '0',
  `limit_downloads_same_item` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '0',
  `position` int DEFAULT '0',
  `popular` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `overview` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `active` tinyint(1) DEFAULT '1',
  `category` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subcategories` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `screenshots` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `version` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `included_files` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `tags` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `software` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `db` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `compatible_browsers` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `compatible_os` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `high_resolution` tinyint(1) DEFAULT '0',
  `documentation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `preview` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `file_size` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file_host` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'local',
  `file_extension` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `free` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) DEFAULT '0',
  `trending` tinyint(1) DEFAULT '0',
  `views` int DEFAULT '0',
  `faq` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `promotional_price_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `hidden_content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `enable_license` tinyint(1) DEFAULT NULL,
  `direct_download_link` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `newest` tinyint(1) DEFAULT '0',
  `for_subscriptions` tinyint(1) DEFAULT '0',
  `bpm` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bit_rate` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `table_of_contents` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `pages` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `words` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `formats` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `authors` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `preview_url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `additional_fields` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `country_city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `preview_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `preview_extension` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `minimum_price` float DEFAULT NULL,
  `fake_sales` bigint DEFAULT NULL,
  `fake_comments` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `fake_reviews` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `affiliate_link` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `permalink` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tmp_direct_link` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `group_buy_price` float DEFAULT NULL,
  `group_buy_min_buyers` int DEFAULT NULL,
  `group_buy_expiry` int DEFAULT NULL,
  `meta_tags` text COLLATE utf8mb3_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `product_price` (
  `product_id` int NOT NULL,
  `license_id` int NOT NULL,
  `price` float DEFAULT '0',
  `promo_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `reactions` (
  `id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `item_id` int NOT NULL,
  `item_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT 'comment',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `rating` float DEFAULT '0',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `approved` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `read_by_admin` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `searches` (
  `id` bigint NOT NULL,
  `keywords` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int NOT NULL,
  `general` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `mailer` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `payments` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `search_engines` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `adverts` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `files_host` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `social_login` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `chat` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `captcha` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `database` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `affiliate` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `maintenance` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT IGNORE INTO `settings` (`general`, `mailer`, `payments`, `search_engines`, `adverts`, `files_host`, `social_login`, `chat`, `captcha`, `database`, `affiliate`, `maintenance`) VALUES
  ('{"name":"Valexa","title":"Valexa - PHP Script For Selling Digital Products","description":"Valexa, a single vendor php script for selling digital products, software, graphics, audios, videos, fonts, icons, templates and any downloadable items.","email":"example@gmail.com","keywords":"digital downloads php script, shopping cart php script, ecommerce php script, paypal php script, stripe php script, digital store php script, gpl store php script, gpl licence php script, paypal digital download","items_per_page":"12","favicon":"favicon.svg","logo":"tendra_logo.svg","search_cover":"search_cover.png","env":"production","debug":"0","timezone":"Europe\\/Amsterdam","facebook":"#","twitter":"#","pinterest":"#","youtube":"#","tumblr":"#","search_header":"Templates, PHP Scripts, Graphics and Codes starting from $2","search_subheader":null,"cover":"cover.png","blog":{"enabled":"1","title":"Valexa - PHP Script For Selling Digital Products","description":"Valexa, a single vendor php script for selling digital products, software, graphics, audios, videos, fonts, icons, templates and any downloadable items.","disqus":"0"},"blog_cover":"blog_cover.jpg","fb_app_id":null,"langs":"en","template":"tendra","fonts":{"ltr":"@font-face {\\r\\n  font-family: \'Spartan\';\\r\\n  src: url(\'\\/assets\\/fonts\\/Spartan\\/Spartan-Regular.ttf\');\\r\\n  font-weight: 400;\\r\\n  font-style: normal;\\r\\n}\\r\\n\\r\\n@font-face {\\r\\n  font-family: \'Spartan\';\\r\\n  src: url(\'\\/assets\\/fonts\\/Spartan\\/Spartan-Medium.ttf\');\\r\\n  font-weight: 500;\\r\\n  font-style: normal;\\r\\n}\\r\\n\\r\\n@font-face {\\r\\n  font-family: \'Spartan\';\\r\\n  src: url(\'\\/assets\\/fonts\\/Spartan\\/Spartan-SemiBold.ttf\');\\r\\n  font-weight: 600;\\r\\n  font-style: normal;\\r\\n}\\r\\n\\r\\n@font-face {\\r\\n  font-family: \'Spartan\';\\r\\n  src: url(\'\\/assets\\/fonts\\/Spartan\\/Spartan-Bold.ttf\');\\r\\n  font-weight: 700;\\r\\n  font-style: normal;\\r\\n}\\r\\n\\r\\n@font-face {\\r\\n  font-family: \'Spartan\';\\r\\n  src: url(\'\\/assets\\/fonts\\/Spartan\\/Spartan-ExtraBold.ttf\');\\r\\n  font-weight: 800;\\r\\n  font-style: normal;\\r\\n}\\r\\n\\r\\n@font-face {\\r\\n  font-family: \'Spartan\';\\r\\n  src: url(\'\\/assets\\/fonts\\/Spartan\\/Spartan-Black.ttf\');\\r\\n  font-weight: 900;\\r\\n  font-style: normal;\\r\\n}","rtl":"https:\\/\\/fonts.googleapis.com\\/css2?family=Almarai:wght@400;700&display=swap"},"subscriptions":"{\\"enabled\\":\\"1\\",\\"accumulative\\":\\"1\\"}","watermark":null,"users_notif":"Lorem ipsum dolor sit amet consectetur adipisicing elit. Odio, nisi maiores praesentium delectus animi.","valexa_top_cover":null,"tendra_top_cover":"tendra_top_cover.jpg","purchase_code":"","tendra_top_cover_mask":null,"maintenance_mode":"1","maintenance_time":"2021-01-20 12:00:00","maintenance":"{\\"enabled\\":\\"0\\",\\"exception\\":\\"127.0.0.1\\",\\"expires_at\\":\\"2025-03-25 15:30:00\\",\\"auto_disable\\":\\"1\\",\\"title\\":\\"Under maintenance\\",\\"header\\":\\"Our website is under maintenance\\",\\"subheader\\":\\"We are adding more features, stay tuned\\",\\"text\\":\\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\\",\\"bg_color\\":\\"#042f86\\"}","email_verification":"1","auto_approve":"{\\"support\\":\\"1\\",\\"reviews\\":\\"1\\"}","admin_notifications":"{\\"comments\\":\\"1\\",\\"reviews\\":\\"1\\",\\"sales\\":\\"1\\"}","default_product_type":"-","default_top_cover":null,"homepage_items":"null","products_by_country_city":"0","recently_viewed_items":"1","cookie_text":"<p>We use cookies to understand how you use our website and to improve your experience. This includes personalizing content and advertising. To learn more, please click <a href=\\"https:\\/\\/tendra.codemayer.tech\\/page\\/privacy-policy\\" target=\\"_blank\\"><b style=\\"color: rgb(49, 24, 115);\\">Here<\\/b><\\/a>. By continuing to use our website, you accept our use of cookies, Privacy policy and terms &amp; conditions.<br><\\/p>","cookie":"{\\"text\\":\\"<p>We use cookies to understand how you use our website and to improve your experience. This includes personalizing content and advertising. To learn more, please click Here. By continuing to use our website, you accept our use of cookies, Privacy policy and terms &amp; conditions.<br><\\\\\\/p>\\",\\"background\\":\\"#9550a5\\",\\"color\\":\\"#ffffff\\",\\"button_bg\\":\\"#e8e8e8\\"}","masonry_layout":null,"randomize_homepage_items":"0","direct_download_links":null,"pricing_cover":null,"template_color":"dark","html_editor":"tinymce","can_delete_own_comments":"1","show_rating":"product_page,product_card","show_sales":"product_page","registration_fields":"name,email,password,password_confirmation","required_registration_fields":"email,password,password_confirmation","show_streaming_player":"1","enable_comments":"1","enable_reviews":"1","enable_reactions_on_comments":"1","enable_subcomments":"1","realtime_views":"{\\"website\\":{\\"enabled\\":\\"0\\",\\"fake\\":\\"1\\",\\"range\\":\\"15,30\\"},\\"product\\":{\\"enabled\\":\\"0\\",\\"fake\\":\\"1\\",\\"range\\":\\"50,60\\"},\\"refresh\\":\\"30\\"}","counters":"products,categories,online_users,affiliate_earnings,orders","fake_profiles":{"17415c4d59a82f5b4fae2d0089194181":{"name":"\\u9093\\u9e4f","avatar":"17415c4d59a82f5b4fae2d0089194181.webp","country":"china"},"74b71b819650fa7b7b67ff09950c6c9a":{"name":"\\u6751\\u5c71 \\u821e","avatar":"74b71b819650fa7b7b67ff09950c6c9a.webp","country":"japan"},"1299cb41207c611c88fb3bc00a5d9e70":{"name":"Srta. Ta\\u00eds Jasmin Sep\\u00falveda Sobrinho","avatar":"1299cb41207c611c88fb3bc00a5d9e70.webp","country":"japan"},"20a749a135b7a21eb02764a6cd3c2b90":{"name":"Srta. Violeta M\\u00e1rquez L\\u00f3pez","avatar":"20a749a135b7a21eb02764a6cd3c2b90.webp","country":"japan"},"fba9397810cbabc03d881856c485ce2e":{"name":"Giovana Bezerra Jr.","avatar":"fba9397810cbabc03d881856c485ce2e.webp","country":"japan"},"6819a46b32b166add7b903adf7ae0297":{"name":"Karol\\u00edna H\\u00fdblov\\u00e1","avatar":"6819a46b32b166add7b903adf7ae0297.webp","country":"czech-republic"},"2aabb0b1b686c2f8c178e4077c81e8c5":{"name":"Irma Sundqvist","avatar":"2aabb0b1b686c2f8c178e4077c81e8c5.webp","country":"sweden"},"9e52c7be4b39473bb7ed8ca1c337be85":{"name":"Brigitte du De Oliveira","avatar":"9e52c7be4b39473bb7ed8ca1c337be85.webp","country":"sweden"},"4bccdc2fb3e48646fb8d11fb67d07072":{"name":"Juliette Urbain","avatar":"4bccdc2fb3e48646fb8d11fb67d07072.webp","country":"sweden"},"ca149de3018925fd68b0b8400bed0a99":{"name":"\\u0406\\u0440\\u0438\\u043d\\u0430 \\u0422\\u0430\\u0440\\u0430\\u0441\\u043e\\u0432\\u0438\\u0447 \\u0422\\u0430\\u0440\\u0430\\u0449\\u0443\\u043a","avatar":"ca149de3018925fd68b0b8400bed0a99.webp","country":"sweden"},"5010138e2a152a5c2d8a24c155a25159":{"name":"Zena Collier","avatar":"5010138e2a152a5c2d8a24c155a25159.webp","country":"sweden"},"a6fb15a7743961c191c9ccd6e81b71b8":{"name":"\\u0418\\u0441\\u0430\\u049b\\u044b\\u0437\\u044b \\u0424\\u0438\\u0440\\u0443\\u0437\\u0430","avatar":"a6fb15a7743961c191c9ccd6e81b71b8.webp","country":"sweden"},"62388b48349fa76650de03fc38aa558f":{"name":"Nadine Schulz B.A.","avatar":"62388b48349fa76650de03fc38aa558f.webp","country":"sweden"},"7f21d5ca6becc11bb5bbbb4ae3ad831d":{"name":"\\u041a\\u0440\\u0430\\u0432\\u0447\\u0435\\u043d\\u043a\\u043e \\u0422\\u0430\\u043c\\u0430\\u0440\\u0430 \\u041e\\u043b\\u0435\\u043a\\u0441\\u0430\\u043d\\u0434\\u0440\\u043e\\u0432\\u0438\\u0447","avatar":"7f21d5ca6becc11bb5bbbb4ae3ad831d.webp","country":"sweden"},"2d0c5907121d7a1edbafee8eace25d3c":{"name":"Bojana \\u0160trukelj","avatar":"2d0c5907121d7a1edbafee8eace25d3c.webp","country":"sweden"},"b55bad7c4828ce777ea607ed0d09ed59":{"name":"Marie De Smedt","avatar":"b55bad7c4828ce777ea607ed0d09ed59.webp","country":"sweden"},"edb598bd6fb89e5fb09b1bfad1bce1ab":{"name":"Elisa Aryani","avatar":"edb598bd6fb89e5fb09b1bfad1bce1ab.webp","country":"indonesian-indonesia"},"b8a6fa85a07484b68cb84da40157efe2":{"name":"Padma Lestari M.M.","avatar":"b8a6fa85a07484b68cb84da40157efe2.webp","country":"indonesian-indonesia"},"fe1cfcae705122aedf4de56667b19c4b":{"name":"Hesti Puspasari M.Farm","avatar":"fe1cfcae705122aedf4de56667b19c4b.webp","country":"indonesian-indonesia"},"1223b3915f665d178bcad1143b01b842":{"name":"Genta Suartini S.I.Kom","avatar":"1223b3915f665d178bcad1143b01b842.webp","country":"indonesian-indonesia"},"28a9196a288dbff27641724c12b65289":{"name":"Bella Handayani","avatar":"28a9196a288dbff27641724c12b65289.webp","country":"indonesian-indonesia"},"56ce01461b1d5773e998d0dcb9b355c6":{"name":"Irma Mayasari","avatar":"56ce01461b1d5773e998d0dcb9b355c6.webp","country":"indonesian-indonesia"},"721115be6e01baef41ddf770df71aa58":{"name":"Ulva Agustina S.H.","avatar":"721115be6e01baef41ddf770df71aa58.webp","country":"indonesian-indonesia"},"91cc164b959a169fa25f717556752509":{"name":"Ratih Haryanti","avatar":"91cc164b959a169fa25f717556752509.webp","country":"indonesian-indonesia"},"190ee052f19f2ee6848b7d688064c5f3":{"name":"Keisha Usada","avatar":"190ee052f19f2ee6848b7d688064c5f3.webp","country":"indonesian-indonesia"},"1933b00e117fa26a2c75227ddb94ade3":{"name":"Zelda Mayasari","avatar":"1933b00e117fa26a2c75227ddb94ade3.webp","country":"indonesian-indonesia"},"63198b458ec8afb40171c98578b84cc0":{"name":"Roscoe Rogahn","avatar":"63198b458ec8afb40171c98578b84cc0.webp","country":"united-states"},"8e42a82d2bb8eba76f9d5db6271fd3a6":{"name":"Karianne Wilderman","avatar":"8e42a82d2bb8eba76f9d5db6271fd3a6.webp","country":"united-states"},"1dd0ca9703535a503716df1ef89c2954":{"name":"Mrs. Nikki Turcotte IV","avatar":"1dd0ca9703535a503716df1ef89c2954.webp","country":"united-states"},"0bbc92775399e4224698e75463df4782":{"name":"Emmet Murazik","avatar":"0bbc92775399e4224698e75463df4782.webp","country":"united-states"},"238a7e7ec32da3ffcc80aabdb909e178":{"name":"Amy Farrell","avatar":"238a7e7ec32da3ffcc80aabdb909e178.webp","country":"united-states"},"6eb88fe1da174a5e4c4af222158169cc":{"name":"Prof. Gabe Connelly I","avatar":"6eb88fe1da174a5e4c4af222158169cc.webp","country":"united-states"},"57e50f3fd007fd7545656f6fa7611ed4":{"name":"Dr. Kole Leuschke I","avatar":"57e50f3fd007fd7545656f6fa7611ed4.webp","country":"united-states"},"2b08567007a152ce0a8e619da4dc3503":{"name":"Mr. Raven Stamm PhD","avatar":"2b08567007a152ce0a8e619da4dc3503.webp","country":"united-states"},"a808889df9d00a9962a7f3dbeb1b36a6":{"name":"Mariana Roberts","avatar":"a808889df9d00a9962a7f3dbeb1b36a6.webp","country":"united-states"},"f426ae47caa6c6e28fff8880feb4bcb5":{"name":"Myah Hyatt","avatar":"f426ae47caa6c6e28fff8880feb4bcb5.webp","country":"united-states"},"e26e8ace79069e8778048ba26ad286de":{"name":"Bailey Korey","avatar":"e26e8ace79069e8778048ba26ad286de.webp","country":null},"649bcaa86f80a4a23e9c519ad296413b":{"name":"Graham Cara","avatar":"649bcaa86f80a4a23e9c519ad296413b.webp","country":null},"8f5fffd55a6ce9fe387b810386b7e9e7":{"name":"Auer Katheryn","avatar":"8f5fffd55a6ce9fe387b810386b7e9e7.webp","country":null},"a216352516746704edb0a2b0611ba5b5":{"name":"Hettinger Bernita","avatar":"a216352516746704edb0a2b0611ba5b5.webp","country":null},"c0e5d9e210c8f2d32bc3f777a2d9f78f":{"name":"Quigley Agnes","avatar":"c0e5d9e210c8f2d32bc3f777a2d9f78f.webp","country":null},"764a7ceadf5852e539fcc7c06ec18f3b":{"name":"Herzog Talia","avatar":"764a7ceadf5852e539fcc7c06ec18f3b.webp","country":null},"5ec635b660d2cb7dd64e53c65f221056":{"name":"Waelchi Alessia","avatar":"5ec635b660d2cb7dd64e53c65f221056.webp","country":null},"09edc10f3f9450ccf238bac16f4ea1fb":{"name":"Homenick Itzel","avatar":"09edc10f3f9450ccf238bac16f4ea1fb.webp","country":null}},"fake_purchases":"{\\"enabled\\":\\"0\\",\\"pages\\":\\"product,home,products,checkout\\",\\"interval\\":\\"60,120\\"}","prepaid_credits":"{\\"enabled\\":\\"0\\",\\"expires_in\\":null}","js_css_code":"{\\"frontend\\":\\"<style>\\\\r\\\\n#item .l-side {\\\\r\\\\n    overflow: hidden;\\\\r\\\\n}\\\\r\\\\n<\\\\\\/style>\\",\\"backend\\":null}","permalink_url_identifer":"p","invoice":"{\\"template\\":\\"2\\",\\"tos\\":\\"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Deleniti eaque omnis quod, rerum magnam, corrupti, modi veritatis necessitatibus commodi, minus sunt? Error porro velit qui, commodi expedita, consectetur? Illum, ex.\\"}","fullwide":"0","enable_upload_links":"0","enable_blade_cache":"1","enable_data_cache":"0","categories_on_homepage":"1","fake_counters":"0","color_cursor":"0","authorized_bots":null,"user_views_per_minute":"60","axies_top_cover":null,"force_download":"1","allow_download_in_test_mode":"0","available_via_subscriptions_only_message":"This item is available via subscriptions only","authentication_required_to_download_free_items":"0","generate_download_links_for_missing_files":"1","show_add_to_cart_button_on_the_product_card":"1","show_badges_on_the_product_card":"1","product_card_cover_mask":"card-mask-2.webp","tiktok":null,"report_errors":"1","email_verification_required":"0","default_lang":"en","facebook_pixel":null,"two_factor_authentication":"0","two_factor_authentication_expiry":"60"}', '{"mail":{"username":null,"password":null,"host":null,"port":"465","encryption":"tls","reply_to":null,"forward_to":"","use_queue":"0","from":{"name":null,"address":null}}}', '{"gateways":{"paypal":{"name":"paypal","enabled":"on","icon":"\\/assets\\/images\\/payment\\/paypal_icon.png","description":"PayPal balance, Bank account, PayPal Credit, Debit\\/Credit cards, Rewards balance","order":"1","mode":"sandbox","client_id":"AcNJxK8uTNW0LydCVAQ1iex_pffZSWQiv1z2skmP9Bv5p_xSd2LK1wr7hSCQ_HjreReDvjvOOD8_-CmJ","secret_id":"EM7Alo8vtWMTGajDLgAMwBzzkRFCGcUUHVHkDUtCUDDz90wtKibKyNso5YX1P-AwTWapCsIuSHhFf1z7","fee":"3","minimum":null,"auto_exchange_to":null},"paymongo":{"name":"paymongo","icon":"\\/assets\\/images\\/payment\\/paymongo_icon.png","description":"Visa \\/ Mastercard, GCash, GrabPay, Maya, BPI, UBP, ...","order":"2","mode":"sandbox","public_key":"pk_test_iXKqafemX5YcGR5taAHBv7tT","secret_key":"sk_test_v4mvpgoz1qS1n9PCSBbnQzkw","method":"card","fee":null,"minimum":null,"auto_exchange_to":"PHP"},"tazapay":{"name":"tazapay","icon":"\\/assets\\/images\\/payment\\/tazapay_icon.JPG","description":"PayPal, SEPA, iDEAL, VISA, Klarna, MasterCard, Przelewy24, EPS, Sepa Direct Debit, Maestro ...","order":"3","mode":"sandbox","public_key":"pk_test_B2zbmd5djaSrOfmBcnfl","api_key":"ak_test_II5XEBFGCVWJK9MCTOP6","secret_key":"sk_test_9ZBXNAVwLO3yebi3oC9997P3Wxla5iNPSh2sNM9kZla8zvnrOx2it2QoAH85sKHSofoE0eheVAc41QMasUCkvdo2XLdJsg6wAnTPaHEvYjMXn78e0VyWtTwTYuZVGmx3","method":"card","fee":null,"minimum":null,"auto_exchange_to":null},"mollie":{"name":"mollie","icon":"\\/assets\\/images\\/payment\\/mollie_icon.png","description":"PayPal, SEPA, iDEAL, VISA, Klarna, MasterCard, Przelewy24, EPS, Sepa Direct Debit, Maestro ...","order":"4","mode":"sandbox","api_key":"test_fNK8e6VURh9sqmuEGfS6vEzbzbF6st","profile_id":"pfl_yRhaN65CXs","method":"creditcard,directdebit","fee":null,"minimum":null,"auto_exchange_to":null},"youcanpay":{"name":"youcanpay","icon":"\\/assets\\/images\\/payment\\/youcanpay_icon.ico","description":"Debit or Credit Cards","order":"5","mode":"sandbox","public_key":"pub_sandbox_d40016fd-8503-40eb-961e-1d332","private_key":"pri_sandbox_159eb0f6-71c1-44b2-a14a-2ffab","fee":"5","minimum":null,"auto_exchange_to":null},"sslcommerz":{"name":"sslcommerz","icon":"\\/assets\\/images\\/payment\\/sslcommerz_icon.png","description":"Credit \\/ Debit Cards, Mobile Banking, Internet Banking, E-Wallets, Easy Monthly Installments","order":"6","mode":"sandbox","store_id":"codem613bb607ea725","store_passwd":"codem613bb607ea725@ssl","use_ipn":"1","fee":"5","minimum":null,"auto_exchange_to":null},"stripe":{"name":"stripe","icon":"\\/assets\\/images\\/payment\\/stripe_icon.png","description":"Card, Ideal, Giropay, FPX, EPS, Alipay, P24, Bancontact","order":"7","mode":"sandbox","client_id":"pk_test_AXJnsLZeYQLe5L2qzA8FI94o00HCMh14t5","secret_id":"sk_test_WlDtXCea4H8cKRFk7bgzW3xq00hcfmF73r","methods":"card","fee":"5","minimum":"10","auto_exchange_to":null},"spankpay":{"name":"spankpay","icon":"\\/assets\\/images\\/payment\\/spankpay_icon.png","description":"BTC, ETH, LTC, USDC","order":"8","public_key":"test_pk_juicy_veins_yzeXyqgFqHRa8hKCqSqj40pytOYQ2JyaQbZpnVGq","secret_key":"test_pk_juicy_veins_yzeXyqgFqHRa8hKCqSqj40pytOYQ2JyaQbZpnVGq","fee":"20","minimum":"90","auto_exchange_to":null},"skrill":{"name":"skrill","icon":"\\/assets\\/images\\/payment\\/skrill_icon.png","description":"iDEAL, Maestro, Neteller, Skrill Digital Wallet, Credit or Debit Card","order":"9","mode":"sandbox","merchant_account":"demoqco@sun-fish.com","mqiapi_secret_word":"skrill","mqiapi_password":"skrill123","methods":"ACC","fee":"5","minimum":null,"auto_exchange_to":null},"razorpay":{"name":"razorpay","icon":"\\/assets\\/images\\/payment\\/razorpay_icon.png","description":"Debit or Credit Card, Netbanking, Bank Transfer, EMI, UPI","order":"10","client_id":"rzp_test_YcD8vXJrPt3pxA","secret_id":"3Ea5BOGUgCEpSBkuSh1OKvf2","webhook_secret":"CX1f%&V7>2t(q0yW","fee":"2","minimum":"12","auto_exchange_to":null},"paystack":{"name":"paystack","icon":"\\/assets\\/images\\/payment\\/paystack_icon.png","description":"Cards, Mobile money, QR codes, Bank transfer, USSD","order":"11","public_key":"pk_test_762f08f728fbd0191221a7b1a06ac10b6017be24","secret_key":"sk_test_f525daf950659e2c2cac6dfec9b3bf1fdc4b76b9","channels":"ussd,bank,card,bank_transfer,qr,mobile_money","fee":"15","minimum":"5","auto_exchange_to":null},"paymentwall":{"name":"paymentwall","icon":"\\/assets\\/images\\/payment\\/paymentwall_icon.png","description":"Visa, MasterCard, American Express, Discover, Diners Club, Genie, Frimi, eZcash, mCash, Sampath Vishwa","order":"12","mode":"sandbox","project_key":"7cecc2cd0afbf06ab02bd80c2c02a04f","secret_key":"2b248184d50275c8a029195ebdeecc3f","fee":"3","minimum":"18","auto_exchange_to":null},"payhere":{"name":"payhere","icon":"\\/assets\\/images\\/payment\\/payhere_icon.png","description":"Visa, MasterCard, American Express, Discover, Diners Club, Genie, Frimi, eZcash, mCash, Sampath Vishwa","order":"13","mode":"sandbox","merchant_secret":"4PbGDIJhC1S8hdoYb2TUq94UtjpU5RFOi4JAgPiEKrpp","merchant_id":"1216755","fee":"3","minimum":"15","auto_exchange_to":null},"omise":{"name":"omise","icon":"\\/assets\\/images\\/payment\\/omise_icon.png","description":"Credit\\/Debit card, Installment payments, Internet Banking, PromptPay, TrueMoney Wallet, Rabbit Line Pay, PayNow, OCBC Pay Anyone, Alipay, WeChat Pay, Bill payment, Pay-easy, FPX","order":"14","mode":"sandbox","public_key":"pkey_test_5tkhbr0shz1czgwojdz","secret_key":"skey_test_5tkhc9f3puagru3ql1s","fee":"5","minimum":"55","auto_exchange_to":null},"midtrans":{"name":"midtrans","icon":"\\/assets\\/images\\/payment\\/midtrans_icon.png","description":"Credit \\/ Debit card, Danamon online, CIMB clicks, BCA klikpay, Mandiri, Alfamart, Permata va ...","order":"15","mode":"sandbox","client_key":"SB-Mid-client-00bey5wDW4gegw2v","server_key":"SB-Mid-server-Of11wIF_KhZ0db20jSIF2iqI","merchant_id":"G397932390","methods":"credit_card,danamon_online,bca_klikpay,mandiri_clickpay,bri_epay,bca_klikbca","fee":"5","minimum":"10","auto_exchange_to":null},"iyzico":{"name":"iyzico","icon":"\\/assets\\/images\\/payment\\/iyzico_icon.png","description":"MasterCard, MasterCard Debit, American Express, Visa Electron, Visa Debit ...","order":"16","mode":"sandbox","client_id":"sandbox-Z4STxfm3iwuGpAcxlChyEYg2xUKCgzkE","secret_id":"sandbox-zN3RR9gg2kVg2KbmD9ixhOz67EtWBKy3","fee":"5","minimum":null,"auto_exchange_to":null},"instamojo":{"name":"instamojo","icon":"\\/assets\\/images\\/payment\\/instamojo_icon.png","description":"Bank transfer, Debit\\/ Credit Cards, Netbanking, Wallets, UPI, EMI","order":"17","mode":"sandbox","private_salt":"8f1c7b5c2ddd4930a55866fb48a4359a","client_id":"test_w2olHRJKuXK0T6iwis5TFKY8REO8tEcLhpi","secret_id":"test_OMMWYdTJlxNdYBw9eEcwnYSMuUkfMWD06TG2zTLF6RCYhd0w4dFccRQi4v2CbNaQCEDviUvSYpzfhb1nwxoEt9gfwIpbie618HN28miQzFInBcr5HrtanPnpyu3","fee":"5","minimum":"60","auto_exchange_to":null},"flutterwave":{"name":"flutterwave","icon":"\\/assets\\/images\\/payment\\/flutterwave_icon.png","description":"Credit\\/Debit card, Bank transfer, Mobile money, M-Pesa, QR payment, USSD, Barter","order":"18","mode":"sandbox","public_key":"FLWPUBK_TEST-935855b5bd668dbda1b04eb09fb70b6b-X","secret_key":"FLWSECK_TEST-7f19b573e405f594a56d0a6510d00881-X","encryption_key":"FLWSECK_TEST859ffbb2b244","secret_hash":"codemayer_test_hash","methods":"banktransfer,mpesa,mobilemoneyrwanda,card,ussd,credit,account,barter,qr,mobilemoneyuganda","fee":"2","minimum":"55","auto_exchange_to":null},"coingate":{"name":"coingate","icon":"\\/assets\\/images\\/payment\\/coingate_icon.png","description":"BTC, ETH, USDT, LTC","order":"19","mode":"sandbox","auth_token":"3JaWv7vyvY9EBkTL7bKBtyP6-c1uEQTahuE3gNg2","receive_currency":"USD","fee":"2","minimum":"30","auto_exchange_to":null},"authorizenet":{"name":"authorizenet","icon":"\\/assets\\/images\\/payment\\/authorizenet_icon.png","description":"Debit cards, Credit cards, Apple Pay, PayPal ...","order":"20","mode":"sandbox","api_login_id":"8a9zESU6T","client_key":"6FePq5r35rJ67V9zwK593vTbeTY88JmCQBg93E5aDmFa72XFjNeK4NfkQjcgjagH","transaction_key":"2E5qz6x428LQA683","signature_key":"4C2B52AAC7F4327AF5D9BCB092599EB391471568C2B64AE825C81FBB26FF316D121D4D5715B1919C8F331D61428C797D9E132917AFDD41A430C740197DB5081F","fee":"5","minimum":null,"auto_exchange_to":null},"adyen":{"name":"adyen","icon":"\\/assets\\/images\\/payment\\/adyen_icon.png","description":"Klarna, iDEAL, Oney, Amazon Pay, Alipay, Visa, American Express (AMEX), Cartes Bancaires, Diners, ...","order":"21","mode":"sandbox","api_key":"AQEuhmfxKYvHbRVAw0m\\/n3Q5qf3Va4RJCJ5LQWBEniv5IP9E\\/Y+W5tcf2p7vi12KzhDBXVsNvuR83LVYjEgiTGAH-YxSTZToyzLv50LqS38rAhNePdvFORy52RXZbqHYXRsM=-V,39@I$y<Z{{gbtN","client_key":"test_OJFPB6WNCJF2BMA76S7V4PIVMUGYZVE4","merchant_account":"Codemayer832ECOM","hmac_key":"1D0F437B4DCECC845418004F492E41C5E06906D867ABEF41BC30D79EB0ECEA72","fee":"5","minimum":"10","auto_exchange_to":null},"credits":{"name":"credits","icon":"\\/assets\\/images\\/payment\\/credits_icon.png","description":"Pay with your available credits.","order":"22","fee":"5","minimum":null,"auto_exchange_to":null},"offlinepayment":{"name":"offlinepayment","icon":"\\/assets\\/images\\/payment\\/offlinepayment_icon.png","description":"Bank transfer, Cash, Check, ACH credit transfer, SEPA credit transfer","order":"23","instructions":"<p>Bank code: 654987 Account Number: 7654852321 [b]IBAN[\\/b]: 97752784819916461767I4 Please add your order number to your payment description.<\\/p>","fee":"5","minimum":"79","auto_exchange_to":null}},"tos":"1","tos_url":"\\/page\\/terms-and-conditions","vat":"20","buyer_note":"1","currency_code":"USD","currency_symbol":"$","currency_position":"left","exchange_rate":1,"currencies":"eur,usd,USD","allow_foreign_currencies":"1","exchanger":"pro_api_coinmarketcap_com","currencyscoop_api_key":null,"exchangeratesapi_io_key":null,"coinmarketcap_api_key":"63a2ac91-9f20-44c6-809b-bd22547e6a2f","guest_checkout":"1","pay_what_you_want":{"enabled":"1","for":"products"},"currency_by_country":"0","enable_add_to_cart":"1","show_prices_in_k_format":"0","delete_pending_orders":"500","exchangers":{"pro_api_coinmarketcap_com":{"api_key":"63a2ac91-9f20-44c6-809b-bd22547e6a2f"},"api_exchangeratesapi_io":{"api_key":null},"api_currencyscoop_com":{"api_key":null},"api_exchangerate_host":{"api_key":null},"api_coingate_com":{"api_key":null}},"enable_webhooks":"0","update_pending_transactions":"0"}', '{"google":null,"bing":null,"yandex":null,"google_analytics":null,"robots":"follow, index","main_locale":"en","json_ld":"1","site_verification":null,"analytics_code":null,"indexnow_key":null}', '{"responsive_ad":null,"auto_ad":null,"ad_728x90":null,"ad_468x60":null,"ad_300x250":null,"ad_320x100":null,"popup_ad":null}', '{"google_drive":{"folder_id":null,"api_key":null,"client_id":null,"secret_id":null,"chunk_size":"4","refresh_token":"","connected_email":"","id_token":""},"google_cloud_storage":{"project_id":null,"private_key_id":null,"private_key":null,"client_email":null,"client_id":null,"auth_provider_x509_cert_url":"https://www.googleapis.com/oauth2/v1/certs","client_x509_cert_url":"https://www.googleapis.com/robot/v1/metadata/x509/codemayer-g-cloud-storage%40optical-empire-373721.iam.gserviceaccount.com","bucket":null},"dropbox":{"folder_path":null,"app_key":null,"app_secret":null,"access_token":null,"current_account":""},"yandex":{"folder_path":null,"client_id":null,"secret_id":null,"refresh_token":""},"amazon_s3":{"access_key_id":null,"secret_key":null,"bucket":null,"region":"us-west-2","version":"latest"},"wasabi":{"access_key":null,"secret_key":null,"bucket":null,"region":"eu-central-1","version":"latest"},"working_with":null,"remote_files":{"headers":null,"body":null}}', '{"google":{"client_id":null,"secret_id":null,"redirect":""},"github":{"client_id":null,"secret_id":null,"redirect":""},"linkedin":{"client_id":null,"secret_id":null,"redirect":""},"facebook":{"client_id":null,"secret_id":null,"redirect":""},"vkontakte":{"client_id":null,"secret_id":null,"redirect":""},"twitter":{"client_id":null,"secret_id":null,"redirect":""},"dribbble":{"client_id":null,"secret_id":null,"redirect":""},"tiktok":{"enabled":"on","client_id":null,"secret_id":null,"redirect":""},"reddit":{"client_id":null,"secret_id":null,"redirect":""}}', '{"code":null}', '{"enable_on":"","google":{"secret":null,"sitekey":null,"attributes":{"data-theme":"light","data-size":"normal"},"options":{"timeout":"30"}},"mewebstudio":{"length":"4","math":false,"width":"150","height":"40","quality":"90"}}', '{"host":"127.0.0.1","database":null,"username":null,"password":null,"charset":"utf8","collation":"utf8_unicode_ci","port":"3306","sort_buffer_size":"5","sql_mode":"STRICT_TRANS_TABLES","timezone":"+00:00"}', '{"enabled":"1","commission":"10","expire":"30","cashout_methods":"paypal_account,bank_account","minimum_cashout":{"paypal":"10","bank_transfer":"280"},"cashout_description":"<p>All earnings will be transferred to your account based on the selected method, whether via PayPal or Bank transfer.<\\/p><ul><li>The minimum amount to&nbsp;<span style=\\"font-size: 1.14286rem;\\">cash out via<\\/span><span style=\\"font-size: 1.14286rem;\\">&nbsp;PayPal&nbsp; : USD 50.00<\\/span><\\/li><li>The minimum amount to&nbsp;<span style=\\"font-size: 1.14286rem;\\">cash out via<\\/span><span style=\\"font-size: 1.14286rem;\\">&nbsp;bank transfer : USD 240.00<\\/span><\\/li><\\/ul><p><span style=\\"font-size: 1.14286rem;\\">Earnings are paid automatically be the end of each month, as long as, your balance has the minimum amount.<\\/span><\\/p><p><span style=\\"font-size: 1.14286rem;\\">Your earnings, in case of an&nbsp;<\\/span><span style=\\"font-size: 16px;\\">insufficiency, will be reported to the next month.<\\/span><\\/p>"}', '{"enabled":"0","exception":"127.0.0.1","expires_at":"2023-03-02T19:53","auto_disable":"1","title":"Under maintenance","header":"Our website is under maintenance","subheader":"We are adding more features, stay tuned","text":"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","bg_color":"#4d24bc"}');

CREATE TABLE IF NOT EXISTS `statistics` (
  `id` bigint NOT NULL,
  `traffic` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `browsers` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `devices` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `oss` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `subscription_same_item_downloads` (
  `subscription_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `downloads` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `support` (
  `id` int NOT NULL,
  `email_id` int NOT NULL,
  `subject` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `read` tinyint(1) DEFAULT '0',
  `parent` tinyint DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `read_by_admin` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `support_email` (
  `id` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `temp_direct_urls` (
  `product_id` bigint DEFAULT NULL,
  `host` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `expiry` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int NOT NULL,
  `processor` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `products_ids` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `licenses_ids` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `coupon_id` int DEFAULT NULL,
  `reference_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `amount` float NOT NULL,
  `discount` float DEFAULT NULL,
  `refunded` tinyint(1) DEFAULT '0',
  `refund` float DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `items_count` int NOT NULL,
  `is_subscription` tinyint(1) DEFAULT '0',
  `guest_token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `guest_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'paid',
  `confirmed` tinyint(1) DEFAULT '1',
  `exchange_rate` float DEFAULT NULL,
  `details` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `licenses` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `custom_amount` float DEFAULT NULL,
  `payment_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `read_by_admin` tinyint(1) DEFAULT '0',
  `referrer_id` bigint DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sandbox` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `transaction_note` (
  `id` bigint NOT NULL,
  `transaction_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `affiliate_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_verified_at` date DEFAULT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT '0',
  `receive_notifs` tinyint(1) DEFAULT '1',
  `cashout_method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `paypal_account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_account` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `prepaid_credits` float DEFAULT NULL,
  `affiliate_credits` float DEFAULT NULL,
  `credits_sources` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `two_factor_auth` tinyint(1) DEFAULT '0',
  `two_factor_auth_expiry` int DEFAULT NULL,
  `two_factor_auth_secret` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `two_factor_auth_ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `user_prepaid_credits` (
  `id` bigint NOT NULL,
  `prepaid_credits_id` bigint NOT NULL,
  `transaction_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `credits` float NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `user_shopping_cart_item` (
  `user_ip` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `item_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE IF NOT EXISTS `user_subscription` (
  `id` int NOT NULL,
  `subscription_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `starts_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `ends_at` datetime DEFAULT NULL,
  `downloads` int DEFAULT '0',
  `transaction_id` bigint DEFAULT '0',
  `daily_downloads` int DEFAULT '0',
  `daily_downloads_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;


ALTER TABLE `affiliate_earnings`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `referrer_id` (`referrer_id`) USING BTREE,
  ADD KEY `referee_id` (`referee_id`) USING BTREE,
  ADD KEY `transaction_id` (`transaction_id`) USING BTREE,
  ADD KEY `paid` (`paid`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE,
  ADD KEY `updated_at` (`updated_at`) USING BTREE;

ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

ALTER TABLE `cashouts`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`parent`,`slug`,`for`),
  ADD KEY `range` (`range`),
  ADD KEY `for` (`for`),
  ADD KEY `parent` (`parent`),
  ADD KEY `slug` (`slug`),
  ADD KEY `featured` (`featured`);
ALTER TABLE `categories` ADD FULLTEXT KEY `description` (`description`);

ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `approved` (`approved`),
  ADD KEY `parent` (`parent`),
  ADD KEY `read_by_admin` (`read_by_admin`) USING BTREE;

ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `value` (`value`),
  ADD KEY `starts_at` (`starts_at`),
  ADD KEY `expires_at` (`expires_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `deleted_at` (`deleted_at`),
  ADD KEY `once` (`once`) USING BTREE,
  ADD KEY `for` (`for`) USING BTREE,
  ADD KEY `regular_license_only` (`regular_license_only`) USING BTREE;
ALTER TABLE `coupons` ADD FULLTEXT KEY `users_ids` (`users_ids`);
ALTER TABLE `coupons` ADD FULLTEXT KEY `used_by` (`used_by`);

ALTER TABLE `custom_routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `method` (`method`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `slug` (`slug`),
  ADD KEY `active` (`active`),
  ADD KEY `views` (`views`);

ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `active` (`active`);

ALTER TABLE `key_s`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE,
  ADD KEY `updated_at` (`updated_at`) USING BTREE,
  ADD KEY `purchased_at` (`purchased_at`) USING BTREE,
  ADD KEY `product_id` (`product_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE,
  ADD KEY `updated_at` (`updated_at`) USING BTREE,
  ADD KEY `deleted_at` (`deleted_at`) USING BTREE,
  ADD KEY `regular` (`regular`) USING BTREE;

ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`);

ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `deleted_at` (`deleted_at`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `for` (`for`);
ALTER TABLE `notifications` ADD FULLTEXT KEY `users_ids` (`users_ids`);

ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `active` (`active`),
  ADD KEY `views` (`views`),
  ADD KEY `deletable` (`deletable`);
ALTER TABLE `pages` ADD FULLTEXT KEY `description` (`name`,`slug`,`short_description`,`content`,`tags`);

ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

ALTER TABLE `payment_links`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `short_link` (`short_link`) USING BTREE,
  ADD KEY `name` (`name`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE,
  ADD KEY `updated_at` (`updated_at`) USING BTREE,
  ADD KEY `deleted_at` (`deleted_at`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `processor` (`processor`) USING BTREE,
  ADD KEY `reference` (`reference`) USING BTREE,
  ADD KEY `amount` (`amount`) USING BTREE;

ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`id`,`name`,`slug`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `active` (`active`),
  ADD KEY `views` (`views`),
  ADD KEY `slug` (`slug`),
  ADD KEY `category` (`category`);
ALTER TABLE `posts` ADD FULLTEXT KEY `search` (`name`,`short_description`,`content`,`tags`);
ALTER TABLE `posts` ADD FULLTEXT KEY `tags` (`tags`);

ALTER TABLE `prepaid_credits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `popular` (`popular`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `amount` (`amount`),
  ADD KEY `order` (`order`),
  ADD KEY `discount` (`discount`);

ALTER TABLE `pricing_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `limit_downloads_per_day` (`limit_downloads_per_day`) USING BTREE,
  ADD KEY `limit_downloads` (`limit_downloads`) USING BTREE,
  ADD KEY `price` (`price`) USING BTREE,
  ADD KEY `days` (`days`) USING BTREE,
  ADD KEY `position` (`position`) USING BTREE;

ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permalink` (`permalink`),
  ADD KEY `category` (`category`),
  ADD KEY `subcategories` (`subcategories`),
  ADD KEY `documentation` (`documentation`),
  ADD KEY `release_date` (`release_date`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `deleted_at` (`deleted_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `active` (`active`),
  ADD KEY `file_name` (`file_name`),
  ADD KEY `file_host` (`file_host`),
  ADD KEY `featured` (`featured`),
  ADD KEY `trending` (`trending`),
  ADD KEY `free` (`free`),
  ADD KEY `promotional_price_time` (`promotional_price_time`) USING BTREE,
  ADD KEY `stock` (`stock`) USING BTREE,
  ADD KEY `enable_license` (`enable_license`) USING BTREE,
  ADD KEY `views` (`views`) USING BTREE,
  ADD KEY `for_subscriptions` (`for_subscriptions`) USING BTREE,
  ADD KEY `pages` (`pages`) USING BTREE,
  ADD KEY `words` (`words`) USING BTREE,
  ADD KEY `language` (`language`) USING BTREE,
  ADD KEY `formats` (`formats`) USING BTREE,
  ADD KEY `authors` (`authors`) USING BTREE,
  ADD KEY `bpm` (`bpm`) USING BTREE,
  ADD KEY `bit_rate` (`bit_rate`) USING BTREE,
  ADD KEY `country_city` (`country_city`) USING BTREE,
  ADD KEY `newest` (`newest`) USING BTREE,
  ADD KEY `minimum_price` (`minimum_price`),
  ADD KEY `fake_sales` (`fake_sales`);
ALTER TABLE `products` ADD FULLTEXT KEY `name_slug_short_description` (`name`,`slug`,`short_description`);

ALTER TABLE `product_price`
  ADD UNIQUE KEY `product_id_license_id` (`product_id`,`license_id`) USING BTREE,
  ADD KEY `price` (`price`) USING BTREE,
  ADD KEY `promo_price` (`promo_price`) USING BTREE;

ALTER TABLE `reactions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE,
  ADD KEY `deleted_at` (`deleted_at`) USING BTREE,
  ADD KEY `updated_at` (`updated_at`) USING BTREE,
  ADD KEY `product_id` (`product_id`) USING BTREE;

ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_product` (`user_id`,`product_id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `deleted_at` (`deleted_at`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `approved` (`approved`),
  ADD KEY `read_by_admin` (`read_by_admin`) USING BTREE;

ALTER TABLE `searches`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `created_at` (`created_at`) USING BTREE,
  ADD KEY `updated_at` (`updated_at`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `keywords` (`keywords`) USING BTREE;

ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

ALTER TABLE `settings`
  ADD UNIQUE KEY `id` (`id`);

ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `date` (`date`);

ALTER TABLE `subscription_same_item_downloads`
  ADD UNIQUE KEY `sub_unique` (`subscription_id`,`product_id`) USING BTREE,
  ADD KEY `subscription_id` (`subscription_id`) USING BTREE,
  ADD KEY `product_id` (`product_id`) USING BTREE,
  ADD KEY `downloads` (`downloads`) USING BTREE;

ALTER TABLE `support`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_id` (`email_id`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `read` (`read`),
  ADD KEY `parent` (`parent`),
  ADD KEY `read_by_admin` (`read_by_admin`) USING BTREE;
ALTER TABLE `support` ADD FULLTEXT KEY `search` (`subject`,`message`);

ALTER TABLE `support_email`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

ALTER TABLE `temp_direct_urls`
  ADD UNIQUE KEY `product_id` (`product_id`);

ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `processor_transaction_id` (`processor`,`transaction_id`) USING BTREE,
  ADD KEY `products_ids` (`products_ids`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `refunded` (`refunded`),
  ADD KEY `refund` (`refund`),
  ADD KEY `processor` (`processor`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `deleted_at` (`deleted_at`),
  ADD KEY `amount` (`amount`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `search` (`processor`,`order_id`,`transaction_id`,`amount`,`reference_id`),
  ADD KEY `items_count` (`items_count`),
  ADD KEY `is_subscription` (`is_subscription`),
  ADD KEY `guest_token` (`guest_token`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `exchange_rate` (`exchange_rate`) USING BTREE,
  ADD KEY `confirmed` (`confirmed`) USING BTREE,
  ADD KEY `reference_id` (`reference_id`) USING BTREE,
  ADD KEY `licenses_ids` (`licenses_ids`) USING BTREE,
  ADD KEY `payment_url` (`payment_url`) USING BTREE,
  ADD KEY `custom_amount` (`custom_amount`) USING BTREE,
  ADD KEY `read_by_admin` (`read_by_admin`) USING BTREE,
  ADD KEY `referrer_id` (`referrer_id`) USING BTREE,
  ADD KEY `sandbox` (`sandbox`);

ALTER TABLE `transaction_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `created_at` (`created_at`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `user` (`name`,`email`),
  ADD KEY `name` (`name`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `verified` (`email_verified_at`),
  ADD KEY `role` (`role`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `blocked` (`blocked`) USING BTREE,
  ADD KEY `receive_notifs` (`receive_notifs`) USING BTREE,
  ADD KEY `affiliate_name` (`affiliate_name`) USING BTREE,
  ADD KEY `cashout_method` (`cashout_method`) USING BTREE,
  ADD KEY `paypal_account` (`paypal_account`) USING BTREE,
  ADD KEY `credits` (`prepaid_credits`) USING BTREE,
  ADD KEY `affiliate_credits` (`affiliate_credits`);

ALTER TABLE `user_prepaid_credits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `prepaid_credits_id` (`prepaid_credits_id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `user_shopping_cart_item`
  ADD UNIQUE KEY `user_ip_item_id` (`user_ip`,`item_id`);

ALTER TABLE `user_subscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscription_id` (`subscription_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `starts_at` (`starts_at`),
  ADD KEY `downloads` (`downloads`),
  ADD KEY `transaction_id` (`transaction_id`) USING BTREE,
  ADD KEY `daily_downloads` (`daily_downloads`) USING BTREE,
  ADD KEY `daily_downloads_date` (`daily_downloads_date`) USING BTREE,
  ADD KEY `ends_at` (`ends_at`) USING BTREE;


ALTER TABLE `affiliate_earnings`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `cashouts`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `coupons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `custom_routes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `faqs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `key_s`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `licenses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `newsletter_subscribers`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `payment_links`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `prepaid_credits`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `pricing_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `reactions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `searches`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `statistics`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `support`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `support_email`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `transaction_note`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `user_prepaid_credits`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `user_subscription`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;