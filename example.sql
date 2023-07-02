-- Database export via SQLPro (https://www.sqlprostudio.com/allapps.html)
-- Exported by joe at 03-07-2023 00:24.
-- WARNING: This file may contain descructive statements such as DROPs.
-- Please ensure that you are running the script at the proper location.


-- BEGIN TABLE backend_access_log
DROP TABLE IF EXISTS backend_access_log;
CREATE TABLE `backend_access_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 3 rows into backend_access_log
-- Insert batch #1
INSERT INTO backend_access_log (id, user_id, ip_address, created_at, updated_at) VALUES
(1, 1, '127.0.0.1', '2023-06-29 13:08:15', '2023-06-29 13:08:15'),
(2, 1, '127.0.0.1', '2023-07-01 04:20:23', '2023-07-01 04:20:23'),
(3, 1, '127.0.0.1', '2023-07-02 13:35:19', '2023-07-02 13:35:19');

-- END TABLE backend_access_log

-- BEGIN TABLE backend_user_groups
DROP TABLE IF EXISTS backend_user_groups;
CREATE TABLE `backend_user_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 1 row into backend_user_groups
-- Insert batch #1
INSERT INTO backend_user_groups (id, name, code, description, is_new_user_default, created_at, updated_at) VALUES
(1, 'Owners', 'owners', 'Default group for website owners.', 0, '2023-06-29 12:52:10', '2023-06-29 12:52:10');

-- END TABLE backend_user_groups

-- BEGIN TABLE backend_user_preferences
DROP TABLE IF EXISTS backend_user_preferences;
CREATE TABLE `backend_user_preferences` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `site_id` int unsigned DEFAULT NULL,
  `site_root_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 3 rows into backend_user_preferences
-- Insert batch #1
INSERT INTO backend_user_preferences (id, user_id, namespace, `group`, item, `value`, site_id, site_root_id) VALUES
(1, 1, 'backend', 'backend', 'preferences', '{"locale":"zh-cn","fallback_locale":"en","timezone":"UTC","editor_theme":"twilight","editor_word_wrap":"off","editor_font_size":"12","editor_tab_size":"4","editor_code_folding":"manual","editor_autocompletion":"manual","editor_use_emmet":"1","editor_show_gutter":"1","editor_highlight_active_line":"1","editor_auto_closing":"1","editor_use_hard_tabs":"0","editor_display_indent_guides":"0","editor_show_invisibles":"0","editor_show_print_margin":"0"}', NULL, NULL),
(2, 1, 'cadon_stunring', 'review', 'lists', '{"visible":["id","image_url","product","user_id","rating","review_text","created_at","updated_at"],"order":["id","image_url","product","user_id","rating","review_text","created_at","updated_at"],"per_page":"20"}', NULL, NULL),
(3, 1, 'cadon_stunring', 'collection', 'lists', '{"visible":["id","name","code","type","rule","created_at","updated_at","deleted_at"],"order":["id","name","code","type","rule","created_at","updated_at","deleted_at"],"per_page":"20"}', NULL, NULL);

-- END TABLE backend_user_preferences

-- BEGIN TABLE backend_user_roles
DROP TABLE IF EXISTS backend_user_roles;
CREATE TABLE `backend_user_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_unique` (`name`),
  KEY `role_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 2 rows into backend_user_roles
-- Insert batch #1
INSERT INTO backend_user_roles (id, name, code, color_background, description, permissions, is_system, sort_order, created_at, updated_at) VALUES
(1, 'Developer', 'developer', '#3498db', 'Site administrator with access to developer tools.', '', 1, 1, '2023-06-29 12:52:10', '2023-06-29 12:52:10'),
(2, 'Publisher', 'publisher', '#1abc9c', 'Site editor with access to publishing tools.', '', 1, 2, '2023-06-29 12:52:10', '2023-06-29 12:52:10');

-- END TABLE backend_user_roles

-- BEGIN TABLE backend_user_throttle
DROP TABLE IF EXISTS backend_user_throttle;
CREATE TABLE `backend_user_throttle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 1 row into backend_user_throttle
-- Insert batch #1
INSERT INTO backend_user_throttle (id, user_id, ip_address, attempts, last_attempt_at, is_suspended, suspended_at, is_banned, banned_at) VALUES
(1, 1, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL);

-- END TABLE backend_user_throttle

-- BEGIN TABLE backend_users
DROP TABLE IF EXISTS backend_users;
CREATE TABLE `backend_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`),
  KEY `admin_role_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 1 row into backend_users
-- Insert batch #1
INSERT INTO backend_users (id, first_name, last_name, login, email, password, activation_code, persist_code, reset_password_code, permissions, is_activated, is_superuser, activated_at, last_login, deleted_at, role_id, created_at, updated_at) VALUES
(1, 'joe', 'j', 'admin', 'jacks12@qq.com', '$2y$10$Ak7P7o3nVUOgRnBgyUjBb.zxVOBtu1P1AgTitdT7YhRzKKBa5AWuq', NULL, '$2y$10$iwS68wJ49BH8Raui4XA/M.v.2Vxr6ys6X5UrWwlYqu24.d301sGRC', NULL, '', 1, 1, NULL, '2023-07-02 13:35:19', NULL, 1, '2023-06-29 13:07:04', '2023-07-02 13:35:19');

-- END TABLE backend_users

-- BEGIN TABLE backend_users_groups
DROP TABLE IF EXISTS backend_users_groups;
CREATE TABLE `backend_users_groups` (
  `user_id` int unsigned NOT NULL,
  `user_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 1 row into backend_users_groups
-- Insert batch #1
INSERT INTO backend_users_groups (user_id, user_group_id) VALUES
(1, 1);

-- END TABLE backend_users_groups

-- BEGIN TABLE cache
DROP TABLE IF EXISTS cache;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table cache contains no data. No inserts have been genrated.
-- Inserting 0 rows into cache


-- END TABLE cache

-- BEGIN TABLE cadon_stunring_advertisements
DROP TABLE IF EXISTS cadon_stunring_advertisements;
CREATE TABLE `cadon_stunring_advertisements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Inserting 2 rows into cadon_stunring_advertisements
-- Insert batch #1
INSERT INTO cadon_stunring_advertisements (id, code, created_at, updated_at, deleted_at) VALUES
(1, 'banner', '2023-06-01 01:28:17', '2023-06-01 01:28:17', NULL),
(2, 'category_banner', '2023-06-01 01:28:17', '2023-06-01 01:28:17', NULL);

-- END TABLE cadon_stunring_advertisements

-- BEGIN TABLE cadon_stunring_attribute_values
DROP TABLE IF EXISTS cadon_stunring_attribute_values;
CREATE TABLE `cadon_stunring_attribute_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attribute_id` int NOT NULL,
  `value` varchar(255) DEFAULT NULL COMMENT '属性值',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='属性值表';

-- Inserting 49 rows into cadon_stunring_attribute_values
-- Insert batch #1
INSERT INTO cadon_stunring_attribute_values (id, attribute_id, `value`, created_at, updated_at, deleted_at) VALUES
(1, 1, '5', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(2, 1, '6', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(3, 1, '7', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(4, 1, '8', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(5, 1, '9', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(6, 2, 'Red', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(7, 2, 'Blue', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(8, 2, 'Green', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(9, 2, 'Yellow', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(10, 2, 'Purple', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(11, 3, 'Round', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(12, 3, 'Square', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(13, 3, 'Oval', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(14, 3, 'Heart', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(15, 3, 'Cushion', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(16, 4, 'Platinum', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(17, 4, 'Gold', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(18, 4, 'Silver', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(19, 4, 'Rose Gold', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(20, 4, 'White Gold', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(21, 5, 'Classic', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(22, 5, 'Modern', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(23, 5, 'Vintage', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(24, 5, 'Minimalist', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(25, 5, 'Bohemian', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(26, 6, 'Wedding', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(27, 6, 'Anniversary', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(28, 6, 'Birthday', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(29, 6, 'Valentine''s Day', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(30, 6, 'Christmas', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(31, 7, 'Women''s', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(32, 7, 'Men''s', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(33, 7, 'Unisex', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(34, 8, 'Tiffany & Co.', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(35, 8, 'Cartier', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(36, 8, 'Swarovski', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(37, 8, 'Pandora', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(38, 8, 'Zales', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(39, 9, '1', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(40, 9, '2', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(41, 9, '3', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(42, 9, '4', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(43, 9, '5', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(44, 10, '<$100', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(45, 10, '$100-$200', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(46, 10, '$200-$500', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(47, 10, '$500-$1000', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
(48, 1, NULL, NULL, NULL, NULL),
(49, 2, '123', NULL, NULL, NULL);

-- END TABLE cadon_stunring_attribute_values

-- BEGIN TABLE cadon_stunring_attributes
DROP TABLE IF EXISTS cadon_stunring_attributes;
CREATE TABLE `cadon_stunring_attributes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(255) DEFAULT NULL COMMENT '属性名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='属性表';

-- Inserting 10 rows into cadon_stunring_attributes
-- Insert batch #1
INSERT INTO cadon_stunring_attributes (id, attribute_name, created_at, updated_at, deleted_at) VALUES
(1, 'Size', '2023-06-04 13:03:43', '2023-06-04 13:03:43', NULL),
(2, 'Color', '2023-06-04 13:03:43', '2023-06-04 13:03:43', NULL),
(3, 'Shape', '2023-06-04 13:03:43', '2023-06-04 13:03:43', NULL),
(4, 'Material', '2023-06-04 13:03:43', '2023-06-04 13:03:43', NULL),
(5, 'Style', '2023-06-04 13:03:43', '2023-06-04 13:03:43', NULL),
(6, 'Occasion', '2023-06-04 13:03:43', '2023-06-04 13:03:43', NULL),
(7, 'Gender', '2023-06-04 13:03:43', '2023-06-04 13:03:43', NULL),
(8, 'Brand', '2023-06-04 13:03:43', '2023-06-04 13:03:43', NULL),
(9, 'Rating', '2023-06-04 13:03:43', '2023-06-04 13:03:43', NULL),
(10, 'Price Range', '2023-06-04 13:03:43', '2023-06-04 13:03:43', NULL);

-- END TABLE cadon_stunring_attributes

-- BEGIN TABLE cadon_stunring_categories
DROP TABLE IF EXISTS cadon_stunring_categories;
CREATE TABLE `cadon_stunring_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT '0',
  `category_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nest_left` int DEFAULT NULL,
  `nest_right` int DEFAULT NULL,
  `nest_depth` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分类表';

-- Inserting 32 rows into cadon_stunring_categories
-- Insert batch #1
INSERT INTO cadon_stunring_categories (id, parent_id, category_name, url, created_at, updated_at, deleted_at, nest_left, nest_right, nest_depth) VALUES
(1, 0, 'Wedding', '/wedding.html', NULL, '2023-06-29 17:20:22', NULL, 1, 14, 0),
(2, 1, 'Engagement Rings', '/wedding/engagement-rings.html', NULL, '2023-06-29 17:20:22', NULL, 2, 3, 1),
(3, 1, 'Wedding Band', '/wedding/wedding-band.html', NULL, '2023-06-29 17:20:12', NULL, 4, 5, 1),
(4, 1, 'Wedding Set', '/wedding/wedding-set.html', NULL, '2023-06-29 17:20:12', NULL, 6, 7, 1),
(5, 1, 'Wedding Rings', '/wedding/wedding-rings.html', NULL, '2023-06-29 17:19:44', NULL, 8, 9, 1),
(6, 1, 'Jewelry Set', '/wedding/jewelry-set.html', NULL, '2023-06-29 17:19:44', NULL, 10, 11, 1),
(7, 1, 'Gift Packaging', '/wedding/gift-packaging.html', NULL, '2023-06-29 17:19:44', NULL, 12, 13, 1),
(8, 0, 'Earrings', '/earrings.html', NULL, '2023-06-29 17:19:44', NULL, 15, 22, 0),
(9, 8, 'Studs', '/earrings/studs.html', NULL, '2023-06-29 17:19:44', NULL, 16, 17, 1),
(10, 8, 'Drops', '/earrings/drops.html', NULL, '2023-06-29 17:19:44', NULL, 18, 19, 1),
(11, 8, 'Hoops', '/earrings/hoops.html', NULL, '2023-06-29 17:19:44', NULL, 20, 21, 1),
(12, 0, 'Necklaces', '/necklaces.html', NULL, '2023-06-29 17:19:44', NULL, 23, 34, 0),
(13, 12, 'Pendants', '/necklaces/pendants.html', NULL, '2023-06-29 17:19:44', NULL, 24, 25, 1),
(14, 12, 'Chokers & Tennis Necklace', '/necklaces/chokers-tennis-necklace.html', NULL, '2023-06-29 17:19:44', NULL, 26, 27, 1),
(15, 12, 'Lariat & Y Necklace', '/necklaces/lariat-y-necklace.html', NULL, '2023-06-29 17:19:44', NULL, 28, 29, 1),
(16, 12, 'Layered Necklace', '/necklaces/layered-necklace.html', NULL, '2023-06-29 17:19:44', NULL, 30, 31, 1),
(17, 12, 'Pear Necklace', '/necklaces/statement-necklace.html', NULL, '2023-06-29 17:19:44', NULL, 32, 33, 1),
(18, 0, 'Bracelets', '/bracelets.html', NULL, NULL, NULL, 35, 36, 0),
(19, 0, 'Men''s', '/men.html', NULL, '2023-06-29 17:19:44', NULL, 37, 44, 0),
(20, 19, 'Men''s Rings', '/men/men-s-rings.html', NULL, '2023-06-29 17:19:44', NULL, 38, 39, 1),
(21, 19, 'Men''s Necklaces', '/men/men-s-necklaces.html', NULL, '2023-06-29 17:19:44', NULL, 40, 41, 1),
(22, 19, 'Cufflinks', '/men/cufflinks.html', NULL, '2023-06-29 17:19:44', NULL, 42, 43, 1),
(23, 0, 'COLLECTION', '/collection.html', NULL, '2023-06-29 17:19:45', NULL, 45, 62, 0),
(24, 23, 'Back to School', '/collection/back-to-school.html', NULL, '2023-06-29 17:19:45', NULL, 46, 47, 1),
(25, 23, 'The Spirit Snake', '/collection/the-spirit-snake.html', NULL, '2023-06-29 17:19:45', NULL, 48, 49, 1),
(26, 23, 'The Vintage Art Deco', '/collection/the-vintage-art-deco-ring.html', NULL, '2023-06-29 17:19:45', NULL, 50, 51, 1),
(27, 23, 'The Snow Band Ring', '/collection/the-snow-band-ring.html', NULL, '2023-06-29 17:19:45', NULL, 52, 53, 1),
(28, 23, 'The Starry Night', '/collection/the-starry-night.html', NULL, '2023-06-29 17:19:45', NULL, 54, 55, 1),
(29, 23, 'Mother''s Day', '/collection/mother-s-day.html', NULL, '2023-06-29 17:19:45', NULL, 56, 57, 1),
(30, 23, 'Merry Christmas', '/collection/merry-christmas.html', NULL, '2023-06-29 17:19:45', NULL, 58, 59, 1),
(31, 23, 'Father''s Day', '/collection/father-s-day.html', NULL, '2023-06-29 17:19:45', NULL, 60, 61, 1),
(32, 0, NULL, NULL, '2023-07-02 14:31:26', '2023-07-02 14:31:26', NULL, 63, 64, 0);

-- END TABLE cadon_stunring_categories

-- BEGIN TABLE cadon_stunring_collections
DROP TABLE IF EXISTS cadon_stunring_collections;
CREATE TABLE `cadon_stunring_collections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rule` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Inserting 2 rows into cadon_stunring_collections
-- Insert batch #1
INSERT INTO cadon_stunring_collections (id, created_at, updated_at, deleted_at, name, code, type, rule) VALUES
(1, '2023-06-04 13:19:20', '2023-06-05 13:53:11', NULL, 'Newest Releases', 'newin', 'new', '{"limit": 10}'),
(2, '2023-06-06 14:21:17', '2023-07-01 16:23:17', NULL, 'top sellers', 'top', 'sales', '[{"value": "value2", "operator": "gt", "condition": "number"}]');

-- END TABLE cadon_stunring_collections

-- BEGIN TABLE cadon_stunring_currencies
DROP TABLE IF EXISTS cadon_stunring_currencies;
CREATE TABLE `cadon_stunring_currencies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `exchange` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 9 rows into cadon_stunring_currencies
-- Insert batch #1
INSERT INTO cadon_stunring_currencies (id, created_at, updated_at, deleted_at, code, exchange) VALUES
(1, '2023-06-29 13:06:15', '2023-06-29 13:06:15', NULL, 'AUD', 5),
(2, '2023-06-29 13:06:15', '2023-06-29 13:06:15', NULL, 'GBP', 9),
(3, '2023-06-29 13:06:15', '2023-06-29 13:06:15', NULL, 'CAD', 5.5),
(4, '2023-06-29 13:06:15', '2023-06-29 13:06:15', NULL, 'EUR', 8.5),
(5, '2023-06-29 13:06:15', '2023-06-29 13:06:15', NULL, 'JPY', 0.07),
(6, '2023-06-29 13:06:15', '2023-06-29 13:06:15', NULL, 'MXN', 0.4),
(7, '2023-06-29 13:06:15', '2023-06-29 13:06:15', NULL, 'NZD', 4.5),
(8, '2023-06-29 13:06:15', '2023-06-29 13:06:15', NULL, 'PHP', 0.16),
(9, '2023-06-29 13:06:15', '2023-06-29 13:06:15', NULL, 'SGD', 5);

-- END TABLE cadon_stunring_currencies

-- BEGIN TABLE cadon_stunring_images
DROP TABLE IF EXISTS cadon_stunring_images;
CREATE TABLE `cadon_stunring_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `link` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `imageable_id` int DEFAULT NULL COMMENT '图片关联对象的ID',
  `imageable_type` varchar(255) DEFAULT NULL COMMENT '图片关联对象的类型',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='图片表';

-- Inserting 47 rows into cadon_stunring_images
-- Insert batch #1
INSERT INTO cadon_stunring_images (id, image_url, link, imageable_id, imageable_type, created_at, updated_at, deleted_at) VALUES
(7, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/WEDDING_BAND.jpg', NULL, 3, 'App\\Models\\Category', '2023-05-18 14:08:06', '2023-05-18 14:08:06', NULL),
(8, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/ENGAGEMENT_RINGS.jpg', NULL, 2, 'App\\Models\\Category', '2023-05-18 14:08:06', '2023-05-18 14:08:06', NULL),
(9, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/WEDDING_SET.jpg', NULL, 4, 'App\\Models\\Category', '2023-05-18 14:08:06', '2023-05-18 14:08:06', NULL),
(10, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/EARRINGS.jpg', NULL, 8, 'App\\Models\\Category', '2023-05-18 14:08:06', '2023-05-18 14:08:06', NULL),
(11, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/NECKLACES.jpg', NULL, 12, 'App\\Models\\Category', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(12, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/BRACELETS.jpg', NULL, 18, 'App\\Models\\Category', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(13, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/MEN_S.jpg', NULL, 19, 'App\\Models\\Category', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(14, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/WEDDING_RINGS.jpg', NULL, 5, 'App\\Models\\Category', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(15, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/2/8/2830530-1.jpg', NULL, 15, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(16, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/2/2/2230529--1.jpg', NULL, 16, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(17, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/2/7/2730528-4.jpg', NULL, 17, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(18, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/2/7/2730531-1.jpg', NULL, 18, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(19, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/2/7/2730527-1.jpg', NULL, 19, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(20, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/2/7/2730526-4.jpg', NULL, 20, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(21, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/2/6/2630518-2.jpg', NULL, 21, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(22, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/2/2/2230522-2.jpg', NULL, 22, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(23, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/2/1/2130523-1.jpg', NULL, 23, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(24, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/2/3/2304416_1_1.jpg', NULL, 24, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(25, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/Wedding_banner-pc.jpg', 'https://www.stunring.com/early-black-friday-sale.html', 1, 'App\\Models\\Advertisement', '2023-06-01 01:28:17', '2023-06-01 01:28:17', NULL),
(26, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/ENGAGEMENT_RINGS.jpg', 'https://www.stunring.com/wedding/engagement-rings.html', 2, 'App\\Models\\Advertisement', '2023-06-01 01:28:17', '2023-06-01 01:28:17', NULL),
(27, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/WEDDING_BAND.jpg', 'https://www.stunring.com/wedding/wedding-band.html', 2, 'App\\Models\\Advertisement', '2023-06-01 01:28:17', '2023-06-01 01:28:17', NULL),
(28, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/WEDDING_SET.jpg', 'https://www.stunring.com/wedding/wedding-set.html', 2, 'App\\Models\\Advertisement', '2023-06-01 01:28:17', '2023-06-01 01:28:17', NULL),
(29, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/EARRINGS.jpg', 'https://www.stunring.com/earrings.html', 2, 'App\\Models\\Advertisement', '2023-06-01 01:28:17', '2023-06-01 01:28:17', NULL),
(30, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/NECKLACES.jpg', 'https://www.stunring.com/necklaces.html', 2, 'App\\Models\\Advertisement', '2023-06-01 01:28:17', '2023-06-01 01:28:17', NULL),
(31, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/BRACELETS.jpg', 'https://www.stunring.com/bracelets.html', 2, 'App\\Models\\Advertisement', '2023-06-01 01:28:17', '2023-06-01 01:28:17', NULL),
(32, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/MEN_S.jpg', 'https://www.stunring.com/men.html', 2, 'App\\Models\\Advertisement', '2023-06-01 01:28:17', '2023-06-01 01:28:17', NULL),
(33, 'https://cdn.stunring.com/media/wysiwyg/2023_wedding_sale/WEDDING_RINGS.jpg', 'https://www.stunring.com/wedding/wedding-rings.html', 2, 'App\\Models\\Advertisement', '2023-06-01 01:28:17', '2023-06-01 01:28:17', NULL),
(34, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/e/k/ek128.4_.jpg', NULL, 4, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(35, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/b/r/brak009_6.jpg', NULL, 5, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(36, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/b/k/bk033_6104dbae4786b.jpg', NULL, 6, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(37, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/1/1/1121101_4.jpg', NULL, 7, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(38, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/b/k/bk033_6104dbae4786b.jpg', NULL, 8, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(39, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/e/k/ek116-1.jpg', NULL, 9, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(40, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/e/a/eark049-5.jpg', NULL, 10, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(41, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/2/9/2930415_4.jpg', NULL, 11, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(42, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/e/l/el294_6104d176baddc.jpg', NULL, 12, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(43, 'https://cdn.stunring.com/media/catalog/product/cache/46f2d94ea07d2b11b96d96cb65477d04/2/1/2130410_2.jpg', NULL, 13, 'App\\Models\\Product', '2023-05-18 14:09:39', '2023-05-18 14:09:39', NULL),
(44, 'https://cdn.stunring.com/media/review_images/d/i/dingtalk_20230602144445.jpg', NULL, 1, 'App\\Models\\Review', '2023-06-07 14:35:46', '2023-06-07 14:35:46', NULL),
(45, 'https://cdn.stunring.com/media/review_images/2/5/2530537-5.jpg', NULL, 2, 'App\\Models\\Review', '2023-06-07 14:35:46', '2023-06-07 14:35:46', NULL),
(46, 'https://cdn.stunring.com/media/review_images/_/_/__20230427154032.png', NULL, 3, 'App\\Models\\Review', '2023-06-07 14:35:46', '2023-06-07 14:35:46', NULL),
(47, 'https://cdn.stunring.com/media/review_images/2/5/2530537-6.jpg', NULL, 4, 'App\\Models\\Review', '2023-06-07 14:35:46', '2023-06-07 14:35:46', NULL),
(48, 'https://cdn.stunring.com/media/review_images/_/1/_1_.jpg', NULL, 5, 'App\\Models\\Review', '2023-06-07 14:35:46', '2023-06-07 14:35:46', NULL),
(49, 'https://cdn.stunring.com/media/review_images/l/q/lqlpjw3dovt4wsjna8dnahywbk6ltad-pcaeeidinodmaa_540_960.png', NULL, 6, 'App\\Models\\Review', '2023-06-07 14:35:46', '2023-06-07 14:35:46', NULL),
(50, 'https://cdn.stunring.com/media/review_images/2/8/284725477_10223201818608621_2801487919247514155_n.jpg', NULL, 7, 'App\\Models\\Review', '2023-06-07 14:35:46', '2023-06-07 14:35:46', NULL),
(51, 'https://cdn.stunring.com/media/review_images/2/5/2530537-8.jpg', NULL, 8, 'App\\Models\\Review', '2023-06-07 14:35:46', '2023-06-07 14:35:46', NULL),
(52, 'https://cdn.stunring.com/media/review_images/_/1/_1080_1920.png', NULL, 9, 'App\\Models\\Review', '2023-06-07 14:35:46', '2023-06-07 14:35:46', NULL),
(53, 'https://cdn.stunring.com/media/review_images/1/_/1.jpg', NULL, 10, 'App\\Models\\Review', '2023-06-07 14:35:46', '2023-06-07 14:35:46', NULL);

-- END TABLE cadon_stunring_images

-- BEGIN TABLE cadon_stunring_product_attributes
DROP TABLE IF EXISTS cadon_stunring_product_attributes;
CREATE TABLE `cadon_stunring_product_attributes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `attribute_id` int NOT NULL DEFAULT '0' COMMENT '属性ID',
  `value_id` int NOT NULL DEFAULT '0' COMMENT '属性值ID',
  `price_adjustment` decimal(10,2) DEFAULT NULL COMMENT '价格调整',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品属性表';

-- Inserting 29 rows into cadon_stunring_product_attributes
-- Insert batch #1
INSERT INTO cadon_stunring_product_attributes (id, product_id, attribute_id, value_id, price_adjustment, created_at, updated_at, deleted_at) VALUES
(1, 4, 1, 1, 0, '2023-06-04 13:11:49', '2023-07-02 15:34:32', NULL),
(2, 4, 1, 2, 0, '2023-06-04 13:11:49', '2023-07-02 15:34:32', NULL),
(3, 4, 1, 3, 0, '2023-06-04 13:11:49', '2023-07-02 15:34:32', NULL),
(4, 4, 1, 4, 0, '2023-06-04 13:11:49', '2023-07-02 15:34:32', NULL),
(5, 4, 1, 5, 0, '2023-06-04 13:11:49', '2023-07-02 15:34:32', NULL),
(6, 4, 2, 6, -50, '2023-06-04 13:11:49', '2023-07-02 15:34:32', NULL),
(7, 4, 2, 7, -50, '2023-06-04 13:11:49', '2023-07-02 15:34:32', NULL),
(8, 4, 2, 8, -50, '2023-06-04 13:11:49', '2023-07-02 15:34:32', NULL),
(9, 4, 2, 9, -50, '2023-06-04 13:11:49', '2023-07-02 15:34:32', NULL),
(10, 4, 2, 10, -50, '2023-06-04 13:11:49', '2023-07-02 15:34:32', NULL),
(11, 5, 3, 11, 123, '2023-06-04 13:11:49', '2023-07-02 16:12:45', NULL),
(12, 5, 3, 12, 321, '2023-06-04 13:11:49', '2023-07-02 16:12:45', NULL),
(14, 5, 3, 14, 333, '2023-06-04 13:11:49', '2023-07-02 16:12:45', NULL),
(15, 5, 3, 15, 111, '2023-06-04 13:11:49', '2023-07-02 16:12:45', NULL),
(16, 5, 4, 16, 100, '2023-06-04 13:11:49', '2023-07-02 16:12:45', NULL),
(17, 5, 4, 17, -50, '2023-06-04 13:11:49', '2023-07-02 16:12:45', NULL),
(18, 5, 4, 18, -100, '2023-06-04 13:11:49', '2023-07-02 16:12:45', NULL),
(19, 5, 4, 19, -50, '2023-06-04 13:11:49', '2023-07-02 16:12:45', NULL),
(20, 5, 4, 20, -50, '2023-06-04 13:11:49', '2023-07-02 16:12:45', NULL),
(21, 6, 5, 21, -10, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
(22, 6, 5, 22, -10, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
(23, 6, 5, 23, -10, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
(24, 6, 5, 24, -10, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
(25, 6, 5, 25, -10, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
(26, 6, 6, 26, -10, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
(27, 6, 6, 27, -10, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
(28, 6, 6, 28, -10, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
(29, 6, 6, 29, -10, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
(30, 0, 0, 0, NULL, '2023-07-01 05:22:13', '2023-07-01 05:22:13', NULL);

-- END TABLE cadon_stunring_product_attributes

-- BEGIN TABLE cadon_stunring_product_categories
DROP TABLE IF EXISTS cadon_stunring_product_categories;
CREATE TABLE `cadon_stunring_product_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL COMMENT '商品ID',
  `category_id` int NOT NULL COMMENT '分类ID',
  `parent_id` int DEFAULT NULL COMMENT '父级分类ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nest_left` int DEFAULT NULL,
  `nest_right` int DEFAULT NULL,
  `nest_depth` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品分类表';

-- Inserting 25 rows into cadon_stunring_product_categories
-- Insert batch #1
INSERT INTO cadon_stunring_product_categories (id, product_id, category_id, parent_id, created_at, updated_at, deleted_at, nest_left, nest_right, nest_depth) VALUES
(8, 5, 2, NULL, '2023-05-18 14:11:11', '2023-05-18 14:11:11', NULL, NULL, NULL, NULL),
(9, 4, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(10, 5, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(11, 6, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(12, 7, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(13, 8, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(14, 9, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(15, 10, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(16, 11, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(17, 12, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(18, 13, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(19, 14, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(20, 15, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(21, 16, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(22, 17, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(23, 18, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(24, 19, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(25, 20, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(26, 21, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(27, 22, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(28, 23, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(29, 24, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL, NULL, NULL, NULL),
(35, 5, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 5, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 5, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- END TABLE cadon_stunring_product_categories

-- BEGIN TABLE cadon_stunring_product_extensions
DROP TABLE IF EXISTS cadon_stunring_product_extensions;
CREATE TABLE `cadon_stunring_product_extensions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carat` float DEFAULT NULL,
  `stone_cut` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stone_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `plating_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `occasion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `recipient` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Inserting 21 rows into cadon_stunring_product_extensions
-- Insert batch #1
INSERT INTO cadon_stunring_product_extensions (id, product_id, sku, carat, stone_cut, stone_color, plating_color, style, occasion, recipient, created_at, updated_at) VALUES
(1, 4, 'SKU-4', 1, 'Round', 'White', 'Silver', 'Classic', 'Anniversary', 'Mother', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(3, 6, 'SKU-6', 2, 'Emerald', 'Green', 'Rose Gold', 'Vintage', 'Wedding', 'Sister', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(4, 7, 'SKU-7', 2.5, 'Asscher', 'Yellow', 'Platinum', 'Art Deco', 'Graduation', 'Brother', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(5, 8, 'SKU-8', 1, 'Oval', 'Red', 'Silver', 'Romantic', 'Promotion', 'Aunt', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(6, 9, 'SKU-9', 1.5, 'Pear', 'Orange', 'Gold', 'Casual', 'New Job', 'Uncle', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(7, 10, 'SKU-10', 2, 'Marquise', 'Pink', 'Rose Gold', 'Formal', 'New Home', 'Cousin', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(8, 11, 'SKU-11', 2.5, 'Heart', 'Purple', 'Platinum', 'Extravagant', 'Baby Birth', 'Grandparent', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(9, 12, 'SKU-12', 1, 'Cushion', 'Violet', 'Silver', 'Classic', 'Achievement', 'Co-worker', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(10, 13, 'SKU-13', 1.5, 'Radiant', 'Indigo', 'Gold', 'Vintage', 'Retirement', 'Boss', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(11, 14, 'SKU-14', 2, 'Princess', 'Blue', 'Rose Gold', 'Modern', 'Wedding', 'Bride', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(12, 15, 'SKU-15', 2.5, 'Round', 'Green', 'Platinum', 'Formal', 'Graduation', 'Groom', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(13, 16, 'SKU-16', 1, 'Asscher', 'Yellow', 'Silver', 'Classic', 'Anniversary', 'Sister', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(14, 17, 'SKU-17', 1.5, 'Emerald', 'White', 'Gold', 'Romantic', 'Promotion', 'Brother', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(15, 18, 'SKU-18', 2, 'Oval', 'Black', 'Rose Gold', 'Casual', 'New Job', 'Mother', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(16, 19, 'SKU-19', 2.5, 'Pear', 'Red', 'Platinum', 'Extravagant', 'New Home', 'Father', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(17, 20, 'SKU-20', 1, 'Marquise', 'Orange', 'Silver', 'Vintage', 'Baby Birth', 'Cousin', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(18, 21, 'SKU-21', 1.5, 'Heart', 'Pink', 'Gold', 'Modern', 'Achievement', 'Aunt', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(19, 22, 'SKU-22', 2, 'Cushion', 'Purple', 'Rose Gold', 'Formal', 'Retirement', 'Uncle', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(20, 23, 'SKU-23', 2.5, 'Radiant', 'Violet', 'Platinum', 'Romantic', 'Wedding', 'Grandparent', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(21, 24, 'SKU-24', 1, 'Princess', 'Indigo', 'Silver', 'Casual', 'Graduation', 'Co-worker', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
(23, 5, NULL, 1.5, '123', '321', 'rew', 'fds', 'fds', 'fds', '2023-07-01 04:30:13', '2023-07-01 04:30:13');

-- END TABLE cadon_stunring_product_extensions

-- BEGIN TABLE cadon_stunring_products
DROP TABLE IF EXISTS cadon_stunring_products;
CREATE TABLE `cadon_stunring_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `sku` varchar(255) DEFAULT NULL,
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '原价',
  `current_price` decimal(10,2) DEFAULT NULL COMMENT '现价',
  `on_sale` tinyint(1) DEFAULT NULL COMMENT '是否上架',
  `description` text COMMENT '商品描述',
  `video_url` varchar(255) DEFAULT NULL COMMENT '商品视频链接',
  `sales` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `detail` json DEFAULT NULL COMMENT '商品详情',
  `product_images` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品表';

-- Inserting 21 rows into cadon_stunring_products
-- Insert batch #1
INSERT INTO cadon_stunring_products (id, product_name, sku, original_price, current_price, on_sale, description, video_url, sales, created_at, updated_at, deleted_at, detail, product_images) VALUES
(4, 'Product 1', 'SKU-4', 100, 99.5, 1, 'This is product 1', 'http://product1.video', 99, '2023-05-11 14:05:26', '2023-07-02 15:34:32', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', '["/2130523-1.jpg", "/2530537-8.jpg"]'),
(5, 'Product 24343', 'SKU-5', 110, 2, 1, 'This is product 2', 'http://product2.video', 98, '2023-05-12 14:05:26', '2023-07-02 16:12:45', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', '["/2230522-2.jpg"]'),
(6, 'Product 3', 'SKU-6', 110, 2, 1, 'This is product 2', 'http://product2.video', 97, '2023-05-13 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(7, 'Product 4', 'SKU-7', 110, 3, 1, 'This is product 2', 'http://product2.video', 96, '2023-05-14 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(8, 'Product 5', 'SKU-8', 110, 4, 1, 'This is product 2', 'http://product2.video', 95, '2023-05-15 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(9, 'Product 6', 'SKU-9', 110, 5, 1, 'This is product 2', 'http://product2.video', 94, '2023-05-16 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "HAHA", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(10, 'Product 7', 'SKU-10', 110, 6, 1, 'This is product 2', 'http://product2.video', 88, '2023-05-17 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(11, 'Product 8', 'SKU-11', 110, 7, 1, 'This is product 2', 'http://product2.video', 89, '2023-05-18 14:01:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(12, 'Product 9', 'SKU-12', 110, 8, 1, 'This is product 2', 'http://product2.video', 87, '2023-05-18 14:02:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "HAHA", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(13, 'Product 10', 'SKU-13', 110, 11, 1, 'This is product 2', 'http://product2.video', 987, '2023-05-18 14:03:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(14, 'Product d', 'SKU-14', 110, 12, 1, 'This is product 2', 'http://product2.video', 12, '2023-05-18 14:04:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(15, 'Product 32', 'SKU-15', 110, 13, 1, 'This is product 2', 'http://product2.video', 13, '2023-05-18 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(16, 'Product fd4', 'SKU-16', 110, 14, 1, 'This is product 2', 'http://product2.video', 14, '2023-06-18 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "HAHA", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(17, 'Product 35', 'SKU-17', 110, 15, 1, 'This is product 2', 'http://product2.video', 15, '2023-05-21 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(18, 'Product jk89', 'SKU-18', 110, 16, 1, 'This is product 2', 'http://product2.video', 21, '2023-05-22 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(19, 'Product d6', 'SKU-19', 110, 21, 1, 'This is product 2', 'http://product2.video', 22, '2023-05-23 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(20, 'Product l;9', 'SKU-20', 110, 22, 1, 'This is product 2', 'http://product2.video', 23, '2023-05-24 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(21, 'Product d5', 'SKU-21', 110, 23, 1, 'This is product 2', 'http://product2.video', 24, '2023-05-25 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(22, 'Product j90', 'SKU-22', 110, 24, 1, 'This is product 2', 'http://product2.video', 25, '2023-05-26 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(23, 'Product ds712', 'SKU-23', 110, 25, 1, 'This is product 2', 'http://product2.video', 31, '2023-05-26 23:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL),
(24, 'Product p9', 'SKU-24', 110, 99, 1, 'This is product 2', 'http://product2.video', 32, '2023-05-28 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}', NULL);

-- END TABLE cadon_stunring_products

-- BEGIN TABLE cadon_stunring_reviews
DROP TABLE IF EXISTS cadon_stunring_reviews;
CREATE TABLE `cadon_stunring_reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL COMMENT '商品ID',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `rating` int DEFAULT NULL COMMENT '评分',
  `review_text` text COMMENT '评价文本',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `review_images` json DEFAULT NULL COMMENT '评价图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评价表';

-- Inserting 12 rows into cadon_stunring_reviews
-- Insert batch #1
INSERT INTO cadon_stunring_reviews (id, product_id, user_id, rating, review_text, created_at, updated_at, deleted_at, review_images) VALUES
(1, 4, 1, 5, 'Great product!', '2023-05-18 14:10:44', '2023-06-29 13:38:45', NULL, '["/1.jpg"]'),
(2, 5, 2, 4, 'Good product!', '2023-05-18 14:10:44', '2023-06-29 13:39:28', NULL, '["/284725477_10223201818608621_2801487919247514155_n.jpg"]'),
(3, 1, 1, 5, 'I love this ring! It is so beautiful and sparkly.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL, NULL),
(4, 1, 2, 4, 'This ring is very nice but a bit too expensive for me.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL, NULL),
(5, 1, 3, 3, 'The ring is okay but the color is not what I expected.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL, NULL),
(6, 1, 4, 2, 'I don’t like this ring at all. It looks cheap and fake.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL, NULL),
(7, 1, 5, 1, 'This ring is terrible! It broke after one week of wearing it.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL, NULL),
(8, 2, 6, 5, 'This necklace is amazing! It is so elegant and classy.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL, NULL),
(9, 2, 7, 4, 'This necklace is pretty but a bit too long for me.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL, NULL),
(10, 2, 8, 3, 'The necklace is fine but the pearls are not very shiny.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL, NULL),
(17, 2, 9, 2, 'I hate this necklace! It is so heavy and uncomfortable.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL, NULL),
(18, 2, 10, 1, 'This necklace is awful! It gave me a rash on my neck.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL, NULL);

-- END TABLE cadon_stunring_reviews

-- BEGIN TABLE cadon_stunring_settings
DROP TABLE IF EXISTS cadon_stunring_settings;
CREATE TABLE `cadon_stunring_settings` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设置代码',
  `value` json DEFAULT NULL COMMENT '设置值',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间戳',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Inserting 1 row into cadon_stunring_settings
-- Insert batch #1
INSERT INTO cadon_stunring_settings (id, code, `value`, created_at, updated_at) VALUES
(1, 'filter', '{"price": [{"label": "0.00-50.00", "value": "0-50"}, {"label": "50.00-100.00", "value": "50-100"}, {"label": "100.00-150.00", "value": "100-150"}, {"label": "150.00-200.00", "value": "150-200"}, {"label": "200.00-250.00", "value": "200-250"}, {"label": "250.00-300.00", "value": "250-300"}, {"label": "300.00-350.00", "value": "300-350"}, {"label": "350.00-400.00", "value": "350-400"}, {"label": "400.00-450.00", "value": "400-450"}, {"label": "600.00 and above", "value": "600-9999"}], "style": [{"label": "Classic", "value": "classic"}, {"label": "Vintage", "value": "vintage"}, {"label": "Cocktail Rings", "value": "cocktail_rings"}, {"label": "Anniversary", "value": "anniversary"}, {"label": "Art Deco", "value": "art_deco"}, {"label": "Heart", "value": "heart"}, {"label": "Knot, Bowknot, Rope", "value": "knot_bowknot_rope"}, {"label": "Solitaire", "value": "solitaire"}, {"label": "Eternity", "value": "eternity"}, {"label": "Half Eternity", "value": "half_eternity"}, {"label": "Halo", "value": "halo"}, {"label": "Three Stone", "value": "three_stone"}, {"label": "Multi Row", "value": "multi_row"}, {"label": "Single Row", "value": "single_row"}, {"label": "Split Shank", "value": "split_shank"}, {"label": "Promise Rings", "value": "promise_rings"}, {"label": "Trio Wedding Sets", "value": "trio_wedding_sets"}, {"label": "Skull", "value": "skull"}, {"label": "Animal", "value": "animal"}, {"label": "Nature", "value": "nature"}], "occasion": [{"label": "Valentine''s Day", "value": "valentines_day"}, {"label": "Mother''s Day", "value": "mothers_day"}, {"label": "Father''s Day", "value": "fathers_day"}, {"label": "Birthday", "value": "birthday"}, {"label": "Thanksgiving Day", "value": "thanksgiving_day"}, {"label": "Merry Christmas", "value": "merry_christmas"}, {"label": "Halloween", "value": "halloween"}, {"label": "Graduation", "value": "graduation"}], "recipient": [{"label": "For Her", "value": "for_her"}, {"label": "For Him", "value": "for_him"}, {"label": "For Mom", "value": "for_mom"}, {"label": "For Dad", "value": "for_dad"}, {"label": "For Kids", "value": "for_kids"}, {"label": "For Friends", "value": "for_friends"}, {"label": "For Couples", "value": "for_couples"}], "stone_cut": [{"label": "Round", "value": "round"}, {"label": "Oval", "value": "oval"}, {"label": "Cushion", "value": "cushion"}, {"label": "Emerald", "value": "emerald"}, {"label": "Pear", "value": "pear"}, {"label": "Heart", "value": "heart"}, {"label": "Radiant", "value": "radiant"}, {"label": "Asscher", "value": "asscher"}, {"label": "Baguette", "value": "baguette"}, {"label": "Triangle", "value": "triangle"}, {"label": "Marquise", "value": "marquise"}, {"label": "Princess", "value": "princess"}], "carat_range": [{"label": "0-1.00", "value": "0-1"}, {"label": "1.00-1.50", "value": "1-1.5"}, {"label": "1.50-2.00", "value": "1.5-2"}, {"label": "2.00-3.00", "value": "2-3"}, {"label": "3.00-4.00", "value": "3-4"}, {"label": "4.00 and above", "value": "4-1000"}], "stone_color": [{"label": "White", "value": "white"}, {"label": "Ruby Red", "value": "ruby_red"}, {"label": "Aquamarine Blue", "value": "aquamarine_blue"}, {"label": "Sapphire Blue", "value": "sapphire_blue"}, {"label": "Blue Topaz", "value": "blue_topaz"}, {"label": "Emerald Green", "value": "emerald_green"}, {"label": "Peridot Green", "value": "peridot_green"}, {"label": "Fancy Pink", "value": "fancy_pink"}, {"label": "Yellow", "value": "yellow"}, {"label": "Multicolor", "value": "multicolor"}, {"label": "Champagne Morganite", "value": "champagne_morganite"}, {"label": "Black", "value": "black"}, {"label": "Orange", "value": "orange"}, {"label": "Amethyst Purple", "value": "amethyst_purple"}, {"label": "Chocolate", "value": "chocolate"}, {"label": "Watermelon", "value": "watermelon"}, {"label": "Pearl", "value": "pearl"}], "plating_color": [{"label": "Platinum", "value": "platinum"}, {"label": "Yellow Gold", "value": "yellow_gold"}, {"label": "Rose Gold", "value": "rose_gold"}, {"label": "Black", "value": "black"}, {"label": "Two Tone", "value": "two_tone"}]}', '2023-06-15 06:47:39', '2023-06-15 16:21:10');

-- END TABLE cadon_stunring_settings

-- BEGIN TABLE cms_theme_data
DROP TABLE IF EXISTS cms_theme_data;
CREATE TABLE `cms_theme_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table cms_theme_data contains no data. No inserts have been genrated.
-- Inserting 0 rows into cms_theme_data


-- END TABLE cms_theme_data

-- BEGIN TABLE cms_theme_logs
DROP TABLE IF EXISTS cms_theme_logs;
CREATE TABLE `cms_theme_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `old_content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_logs_type_index` (`type`),
  KEY `cms_theme_logs_theme_index` (`theme`),
  KEY `cms_theme_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table cms_theme_logs contains no data. No inserts have been genrated.
-- Inserting 0 rows into cms_theme_logs


-- END TABLE cms_theme_logs

-- BEGIN TABLE cms_theme_templates
DROP TABLE IF EXISTS cms_theme_templates;
CREATE TABLE `cms_theme_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_templates_source_index` (`source`),
  KEY `cms_theme_templates_path_index` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table cms_theme_templates contains no data. No inserts have been genrated.
-- Inserting 0 rows into cms_theme_templates


-- END TABLE cms_theme_templates

-- BEGIN TABLE deferred_bindings
DROP TABLE IF EXISTS deferred_bindings;
CREATE TABLE `deferred_bindings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` int NOT NULL,
  `pivot_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `session_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 14 rows into deferred_bindings
-- Insert batch #1
INSERT INTO deferred_bindings (id, master_type, master_field, slave_type, slave_id, pivot_data, session_key, is_bind, created_at, updated_at) VALUES
(2, 'Cadon\\Stunring\\Models\\Product', 'product_attributes', 'Cadon\\Stunring\\Models\\ProductAttribute', 11, NULL, 'RkUdrcOUyk2gYQs5lNRwyjMW4KvcNFvQMKRzLOGg', 0, '2023-07-01 05:26:02', '2023-07-01 05:26:02'),
(3, 'Cadon\\Stunring\\Models\\Product', 'product_attributes', 'Cadon\\Stunring\\Models\\ProductAttribute', 13, NULL, 'RkUdrcOUyk2gYQs5lNRwyjMW4KvcNFvQMKRzLOGg', 0, '2023-07-01 05:26:09', '2023-07-01 05:26:09'),
(4, 'Cadon\\Stunring\\Models\\Product', 'product_attributes', 'Cadon\\Stunring\\Models\\ProductAttribute', 13, NULL, 'TzMZgb0CgbeCKo31yggA78WprIVEs6CcEkGwniVq', 0, '2023-07-01 05:26:20', '2023-07-01 05:26:20'),
(7, 'Cadon\\Stunring\\Models\\Product', 'product_attributes', 'Cadon\\Stunring\\Models\\ProductAttribute', 32, NULL, '2w6XZYmX4oKZeAHxeRUdKLVzKVWaMY8CRdqi4vEZ', 1, '2023-07-01 05:32:10', '2023-07-01 05:32:10'),
(8, 'Cadon\\Stunring\\Models\\Product', 'product_attributes', 'Cadon\\Stunring\\Models\\ProductAttribute', 33, NULL, '2w6XZYmX4oKZeAHxeRUdKLVzKVWaMY8CRdqi4vEZ', 1, '2023-07-01 05:32:12', '2023-07-01 05:32:12'),
(9, 'Cadon\\Stunring\\Models\\Product', 'product_attributes', 'Cadon\\Stunring\\Models\\ProductAttribute', 34, NULL, '2w6XZYmX4oKZeAHxeRUdKLVzKVWaMY8CRdqi4vEZ', 1, '2023-07-01 05:32:14', '2023-07-01 05:32:14'),
(10, 'Cadon\\Stunring\\Models\\Product', 'product_attributes', 'Cadon\\Stunring\\Models\\ProductAttribute', 35, NULL, 'jWR418xQqFFcnLDRbCpqKs5dMUlmFDkpgqJEJCaN', 1, '2023-07-01 05:35:00', '2023-07-01 05:35:00'),
(11, 'Cadon\\Stunring\\Models\\Product', 'product_attributes', 'Cadon\\Stunring\\Models\\ProductAttribute', 36, NULL, '9dzoJm8DA8lXGhrYRMjrPinD12KFNRIS9BoRjwF6', 1, '2023-07-01 05:42:59', '2023-07-01 05:42:59'),
(12, 'Cadon\\Stunring\\Models\\Product', 'product_attributes', 'Cadon\\Stunring\\Models\\ProductAttribute', 37, NULL, '9dzoJm8DA8lXGhrYRMjrPinD12KFNRIS9BoRjwF6', 1, '2023-07-01 05:43:18', '2023-07-01 05:43:18'),
(13, 'Cadon\\Stunring\\Models\\Product', 'product_attributes', 'Cadon\\Stunring\\Models\\ProductAttribute', 38, NULL, 'f8Mm4eDMvEFqrF6lR8URVY0uWBxn9xlJUWnWAdUC', 1, '2023-07-01 06:08:27', '2023-07-01 06:08:27'),
(14, 'Cadon\\Stunring\\Models\\Product', 'product_attributes', 'Cadon\\Stunring\\Models\\ProductAttribute', 39, NULL, 'pTN7HRsAzPcljoXMJ8ggc5AslSzMsSTqhOBa0Cd4', 1, '2023-07-01 06:14:14', '2023-07-01 06:14:14'),
(15, 'Cadon\\Stunring\\Models\\Attribute', 'attribute_values', 'Cadon\\Stunring\\Models\\AttributeValue', 48, NULL, 'YtYBScgYCLvhUDtGXp3ugLnrAeymaa1zwckxwmJl', 1, '2023-07-01 15:34:10', '2023-07-01 15:34:10'),
(16, 'Cadon\\Stunring\\Models\\Attribute', 'attribute_values', 'Cadon\\Stunring\\Models\\AttributeValue', 49, NULL, 'jj2B7K38WIZcplRw0u7odhcDi0KLOiXX0KqFo9Dk', 1, '2023-07-01 15:37:55', '2023-07-01 15:37:55'),
(17, 'Cadon\\Stunring\\Models\\Attribute', 'attribute_values', 'Cadon\\Stunring\\Models\\AttributeValue', 49, NULL, 'Wb9zGCnDSv4HCmO5BRzUYJHbQ4EsMSVi11oVzP6O', 0, '2023-07-01 15:38:14', '2023-07-01 15:38:14');

-- END TABLE deferred_bindings

-- BEGIN TABLE failed_jobs
DROP TABLE IF EXISTS failed_jobs;
CREATE TABLE `failed_jobs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table failed_jobs contains no data. No inserts have been genrated.
-- Inserting 0 rows into failed_jobs


-- END TABLE failed_jobs

-- BEGIN TABLE jobs
DROP TABLE IF EXISTS jobs;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table jobs contains no data. No inserts have been genrated.
-- Inserting 0 rows into jobs


-- END TABLE jobs

-- BEGIN TABLE migrations
DROP TABLE IF EXISTS migrations;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 36 rows into migrations
-- Insert batch #1
INSERT INTO migrations (id, migration, batch) VALUES
(1, '2013_10_01_000001_Db_Deferred_Bindings', 1),
(2, '2013_10_01_000002_Db_System_Files', 1),
(3, '2013_10_01_000003_Db_System_Plugin_Versions', 1),
(4, '2013_10_01_000004_Db_System_Plugin_History', 1),
(5, '2013_10_01_000005_Db_System_Settings', 1),
(6, '2013_10_01_000006_Db_System_Parameters', 1),
(7, '2013_10_01_000008_Db_System_Mail_Templates', 1),
(8, '2013_10_01_000009_Db_System_Mail_Layouts', 1),
(9, '2014_10_01_000010_Db_Jobs', 1),
(10, '2014_10_01_000011_Db_System_Event_Logs', 1),
(11, '2014_10_01_000012_Db_System_Request_Logs', 1),
(12, '2014_10_01_000013_Db_System_Sessions', 1),
(13, '2015_10_01_000016_Db_Cache', 1),
(14, '2015_10_01_000017_Db_System_Revisions', 1),
(15, '2015_10_01_000018_Db_FailedJobs', 1),
(16, '2017_10_01_000023_Db_System_Mail_Partials', 1),
(17, '2021_10_01_000025_Db_Add_Pivot_Data_To_Deferred_Bindings', 1),
(18, '2022_10_01_000026_Db_System_Site_Definitions', 1),
(19, '2023_10_01_000027_Db_Add_Site_To_Settings', 1),
(20, '2013_10_01_000001_Db_Backend_Users', 2),
(21, '2013_10_01_000002_Db_Backend_User_Groups', 2),
(22, '2013_10_01_000003_Db_Backend_Users_Groups', 2),
(23, '2013_10_01_000004_Db_Backend_User_Throttle', 2),
(24, '2014_01_04_000005_Db_Backend_User_Preferences', 2),
(25, '2014_10_01_000006_Db_Backend_Access_Log', 2),
(26, '2017_10_01_000010_Db_Backend_User_Roles', 2),
(27, '2018_12_16_000011_Db_Backend_Add_Deleted_At', 2),
(28, '2022_10_01_000012_Db_Backend_User_Roles_Sortable', 2),
(29, '2023_10_01_000013_Db_Add_Site_To_Preferences', 2),
(30, '2014_10_01_000001_Db_Cms_Theme_Data', 3),
(31, '2017_10_01_000003_Db_Cms_Theme_Logs', 3),
(32, '2018_11_01_000001_Db_Cms_Theme_Templates', 3),
(33, '2021_05_01_000001_Db_Tailor_Globals', 4),
(34, '2021_05_01_000002_Db_Tailor_Content', 4),
(35, '2021_06_01_000003_Db_Tailor_PreviewToken', 4),
(36, '2023_10_01_000004_Db_Tailor_Content_Joins', 4);

-- END TABLE migrations

-- BEGIN TABLE sessions
DROP TABLE IF EXISTS sessions;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table sessions contains no data. No inserts have been genrated.
-- Inserting 0 rows into sessions


-- END TABLE sessions

-- BEGIN TABLE system_event_logs
DROP TABLE IF EXISTS system_event_logs;
CREATE TABLE `system_event_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `details` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 5 rows into system_event_logs
-- Insert batch #1
INSERT INTO system_event_logs (id, `level`, message, details, created_at, updated_at) VALUES
(1, 'error', 'SystemException: 未找到部件 ''_field_nestable''  in /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php:92\nStack trace:\n#0 /Users/joe/Documents/www/admin/modules/backend/widgets/Form.php(299): Backend\\Classes\\WidgetBase->makePartial(''_field_nestable'', Array)\n#1 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_field.php(25): Backend\\Widgets\\Form->renderFieldElement(Object(Backend\\Classes\\FormField))\n#2 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#3 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#4 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_field-container.php(9): Backend\\Classes\\WidgetBase->makePartial(''_field'', Array)\n#5 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#6 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#7 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_form_fields.php(11): Backend\\Classes\\WidgetBase->makePartial(''_field-containe...'', Array)\n#8 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#9 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#10 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_section.php(16): Backend\\Classes\\WidgetBase->makePartial(''_form_fields'', Array)\n#11 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#12 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#13 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_form.php(3): Backend\\Classes\\WidgetBase->makePartial(''_section'', Array)\n#14 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#15 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#16 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_form-container.php(8): Backend\\Classes\\WidgetBase->makePartial(''_form'')\n#17 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#18 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#19 /Users/joe/Documents/www/admin/modules/backend/widgets/Form.php(227): Backend\\Classes\\WidgetBase->makePartial(''_form-container'', Array)\n#20 /Users/joe/Documents/www/admin/modules/backend/behaviors/FormController.php(430): Backend\\Widgets\\Form->render(Array)\n#21 [internal function]: Backend\\Behaviors\\FormController->formRender()\n#22 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/ExtendableTrait.php(506): call_user_func_array(Array, Array)\n#23 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(''formRender'', Array)\n#24 /Users/joe/Documents/www/admin/plugins/cadon/stunring/controllers/product/update.php(13): October\\Rain\\Extension\\Extendable->__call(''formRender'', Array)\n#25 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#26 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(112): Backend\\Classes\\Controller->makeFileContents(''/Users/joe/Docu...'')\n#27 /Users/joe/Documents/www/admin/modules/backend/classes/Controller.php(397): Backend\\Classes\\Controller->makeView(''update'')\n#28 /Users/joe/Documents/www/admin/modules/backend/classes/Controller.php(265): Backend\\Classes\\Controller->execPageAction(''update'', Array)\n#29 /Users/joe/Documents/www/admin/modules/backend/classes/BackendController.php(118): Backend\\Classes\\Controller->run(''update'', Array)\n#30 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): Backend\\Classes\\BackendController->run(''cadon/stunring/...'')\n#31 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(''run'', Array)\n#32 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), ''run'')\n#33 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): Illuminate\\Routing\\Route->runController()\n#34 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(798): Illuminate\\Routing\\Route->run()\n#35 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#42 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#50 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#51 /Users/joe/Documents/www/admin/vendor/october/rain/src/Router/CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#52 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#53 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#54 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 /Users/joe/Documents/www/admin/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#56 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#57 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#58 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#59 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#60 /Users/joe/Documents/www/admin/index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#61 /Users/joe/Documents/www/admin/vendor/october/rain/src/Foundation/resources/server.php(18): require_once(''/Users/joe/Docu...'')\n#62 {main}', '[]', '2023-07-02 15:36:04', '2023-07-02 15:36:04'),
(2, 'error', 'SystemException: 模型 Cadon\\Stunring\\Models\\Product 必须定义一个返回 ''categories'' 表单字段选项的方法 getCategoriesOptions()。 in /Users/joe/Documents/www/admin/modules/backend/classes/FormField.php:525\nStack trace:\n#0 /Users/joe/Documents/www/admin/modules/backend/classes/FormField.php(458): Backend\\Classes\\FormField->getOptionsFromModelAsDefault(Object(Cadon\\Stunring\\Models\\Product), Object(Cadon\\Stunring\\Models\\Product))\n#1 /Users/joe/Documents/www/admin/modules/backend/widgets/form/FieldProcessor.php(147): Backend\\Classes\\FormField->getOptionsFromModel(Object(Cadon\\Stunring\\Models\\Product), NULL, Object(Cadon\\Stunring\\Models\\Product))\n#2 /Users/joe/Documents/www/admin/vendor/october/rain/src/Element/Form/FieldDefinition.php(126): Backend\\Widgets\\Form->Backend\\Widgets\\Form\\{closure}()\n#3 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_field_checkboxlist.php(2): October\\Rain\\Element\\Form\\FieldDefinition->options()\n#4 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#5 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#6 /Users/joe/Documents/www/admin/modules/backend/widgets/Form.php(299): Backend\\Classes\\WidgetBase->makePartial(''_field_checkbox...'', Array)\n#7 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_field.php(25): Backend\\Widgets\\Form->renderFieldElement(Object(Backend\\Classes\\FormField))\n#8 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#9 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#10 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_field-container.php(9): Backend\\Classes\\WidgetBase->makePartial(''_field'', Array)\n#11 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#12 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#13 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_form_fields.php(11): Backend\\Classes\\WidgetBase->makePartial(''_field-containe...'', Array)\n#14 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#15 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#16 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_section.php(16): Backend\\Classes\\WidgetBase->makePartial(''_form_fields'', Array)\n#17 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#18 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#19 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_form.php(3): Backend\\Classes\\WidgetBase->makePartial(''_section'', Array)\n#20 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#21 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#22 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_form-container.php(8): Backend\\Classes\\WidgetBase->makePartial(''_form'')\n#23 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#24 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#25 /Users/joe/Documents/www/admin/modules/backend/widgets/Form.php(227): Backend\\Classes\\WidgetBase->makePartial(''_form-container'', Array)\n#26 /Users/joe/Documents/www/admin/modules/backend/behaviors/FormController.php(430): Backend\\Widgets\\Form->render(Array)\n#27 [internal function]: Backend\\Behaviors\\FormController->formRender()\n#28 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/ExtendableTrait.php(506): call_user_func_array(Array, Array)\n#29 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(''formRender'', Array)\n#30 /Users/joe/Documents/www/admin/plugins/cadon/stunring/controllers/product/update.php(13): October\\Rain\\Extension\\Extendable->__call(''formRender'', Array)\n#31 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#32 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(112): Backend\\Classes\\Controller->makeFileContents(''/Users/joe/Docu...'')\n#33 /Users/joe/Documents/www/admin/modules/backend/classes/Controller.php(397): Backend\\Classes\\Controller->makeView(''update'')\n#34 /Users/joe/Documents/www/admin/modules/backend/classes/Controller.php(265): Backend\\Classes\\Controller->execPageAction(''update'', Array)\n#35 /Users/joe/Documents/www/admin/modules/backend/classes/BackendController.php(118): Backend\\Classes\\Controller->run(''update'', Array)\n#36 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): Backend\\Classes\\BackendController->run(''cadon/stunring/...'')\n#37 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(''run'', Array)\n#38 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), ''run'')\n#39 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): Illuminate\\Routing\\Route->runController()\n#40 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(798): Illuminate\\Routing\\Route->run()\n#41 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#46 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#48 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#51 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#53 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#54 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#55 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#56 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#57 /Users/joe/Documents/www/admin/vendor/october/rain/src/Router/CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#58 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#59 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#60 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#61 /Users/joe/Documents/www/admin/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#62 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#63 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#64 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#65 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#66 /Users/joe/Documents/www/admin/index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#67 /Users/joe/Documents/www/admin/vendor/october/rain/src/Foundation/resources/server.php(18): require_once(''/Users/joe/Docu...'')\n#68 {main}', '[]', '2023-07-02 15:37:36', '2023-07-02 15:37:36'),
(3, 'error', 'SystemException: 模型 Cadon\\Stunring\\Models\\Product 必须定义一个返回 ''categories'' 表单字段选项的方法 getCategoriesOptions()。 in /Users/joe/Documents/www/admin/modules/backend/classes/FormField.php:525\nStack trace:\n#0 /Users/joe/Documents/www/admin/modules/backend/classes/FormField.php(458): Backend\\Classes\\FormField->getOptionsFromModelAsDefault(Object(Cadon\\Stunring\\Models\\Product), Object(Cadon\\Stunring\\Models\\Product))\n#1 /Users/joe/Documents/www/admin/modules/backend/widgets/form/FieldProcessor.php(147): Backend\\Classes\\FormField->getOptionsFromModel(Object(Cadon\\Stunring\\Models\\Product), NULL, Object(Cadon\\Stunring\\Models\\Product))\n#2 /Users/joe/Documents/www/admin/vendor/october/rain/src/Element/Form/FieldDefinition.php(126): Backend\\Widgets\\Form->Backend\\Widgets\\Form\\{closure}()\n#3 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_field_checkboxlist.php(2): October\\Rain\\Element\\Form\\FieldDefinition->options()\n#4 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#5 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#6 /Users/joe/Documents/www/admin/modules/backend/widgets/Form.php(299): Backend\\Classes\\WidgetBase->makePartial(''_field_checkbox...'', Array)\n#7 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_field.php(25): Backend\\Widgets\\Form->renderFieldElement(Object(Backend\\Classes\\FormField))\n#8 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#9 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#10 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_field-container.php(9): Backend\\Classes\\WidgetBase->makePartial(''_field'', Array)\n#11 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#12 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#13 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_form_fields.php(11): Backend\\Classes\\WidgetBase->makePartial(''_field-containe...'', Array)\n#14 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#15 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#16 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_section.php(16): Backend\\Classes\\WidgetBase->makePartial(''_form_fields'', Array)\n#17 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#18 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#19 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_form.php(3): Backend\\Classes\\WidgetBase->makePartial(''_section'', Array)\n#20 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#21 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#22 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_form-container.php(8): Backend\\Classes\\WidgetBase->makePartial(''_form'')\n#23 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#24 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#25 /Users/joe/Documents/www/admin/modules/backend/widgets/Form.php(227): Backend\\Classes\\WidgetBase->makePartial(''_form-container'', Array)\n#26 /Users/joe/Documents/www/admin/modules/backend/behaviors/FormController.php(430): Backend\\Widgets\\Form->render(Array)\n#27 [internal function]: Backend\\Behaviors\\FormController->formRender()\n#28 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/ExtendableTrait.php(506): call_user_func_array(Array, Array)\n#29 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(''formRender'', Array)\n#30 /Users/joe/Documents/www/admin/plugins/cadon/stunring/controllers/product/update.php(13): October\\Rain\\Extension\\Extendable->__call(''formRender'', Array)\n#31 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#32 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(112): Backend\\Classes\\Controller->makeFileContents(''/Users/joe/Docu...'')\n#33 /Users/joe/Documents/www/admin/modules/backend/classes/Controller.php(397): Backend\\Classes\\Controller->makeView(''update'')\n#34 /Users/joe/Documents/www/admin/modules/backend/classes/Controller.php(265): Backend\\Classes\\Controller->execPageAction(''update'', Array)\n#35 /Users/joe/Documents/www/admin/modules/backend/classes/BackendController.php(118): Backend\\Classes\\Controller->run(''update'', Array)\n#36 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): Backend\\Classes\\BackendController->run(''cadon/stunring/...'')\n#37 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(''run'', Array)\n#38 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), ''run'')\n#39 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): Illuminate\\Routing\\Route->runController()\n#40 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(798): Illuminate\\Routing\\Route->run()\n#41 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#46 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#48 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#51 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#53 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#54 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#55 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#56 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#57 /Users/joe/Documents/www/admin/vendor/october/rain/src/Router/CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#58 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#59 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#60 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#61 /Users/joe/Documents/www/admin/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#62 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#63 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#64 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#65 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#66 /Users/joe/Documents/www/admin/index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#67 /Users/joe/Documents/www/admin/vendor/october/rain/src/Foundation/resources/server.php(18): require_once(''/Users/joe/Docu...'')\n#68 {main}', '[]', '2023-07-02 15:41:01', '2023-07-02 15:41:01'),
(4, 'error', 'SystemException: 未找到部件 ''_button_edit''  in /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php:92\nStack trace:\n#0 /Users/joe/Documents/www/admin/modules/backend/behaviors/RelationController.php(492): Backend\\Classes\\ControllerBehavior->makePartial(''_button_edit'', Array)\n#1 [internal function]: Backend\\Behaviors\\RelationController->relationMakePartial(''button_edit'')\n#2 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/ExtendableTrait.php(506): call_user_func_array(Array, Array)\n#3 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(''relationMakePar...'', Array)\n#4 /Users/joe/Documents/www/admin/modules/backend/behaviors/relationcontroller/partials/_toolbar.php(10): October\\Rain\\Extension\\Extendable->__call(''relationMakePar...'', Array)\n#5 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#6 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\Controller->makeFileContents(''/Users/joe/Docu...'', Array)\n#7 /Users/joe/Documents/www/admin/modules/backend/widgets/Toolbar.php(113): Backend\\Classes\\Controller->makePartial(''~/modules/backe...'', Array)\n#8 /Users/joe/Documents/www/admin/modules/backend/widgets/Toolbar.php(93): Backend\\Widgets\\Toolbar->makeControlPanel()\n#9 /Users/joe/Documents/www/admin/modules/backend/widgets/Toolbar.php(82): Backend\\Widgets\\Toolbar->prepareVars()\n#10 /Users/joe/Documents/www/admin/modules/backend/behaviors/RelationController.php(431): Backend\\Widgets\\Toolbar->render()\n#11 /Users/joe/Documents/www/admin/modules/backend/behaviors/RelationController.php(469): Backend\\Behaviors\\RelationController->relationRender(NULL, Array)\n#12 [internal function]: Backend\\Behaviors\\RelationController->relationRenderToolbar()\n#13 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/ExtendableTrait.php(506): call_user_func_array(Array, Array)\n#14 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(''relationRenderT...'', Array)\n#15 /Users/joe/Documents/www/admin/modules/backend/behaviors/relationcontroller/partials/_container.php(6): October\\Rain\\Extension\\Extendable->__call(''relationRenderT...'', Array)\n#16 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#17 /Users/joe/Documents/www/admin/modules/backend/classes/ControllerBehavior.php(134): Backend\\Classes\\Controller->makeFileContents(''/Users/joe/Docu...'', Array)\n#18 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\ControllerBehavior->makeFileContents(''/Users/joe/Docu...'', Array)\n#19 /Users/joe/Documents/www/admin/modules/backend/behaviors/RelationController.php(492): Backend\\Classes\\ControllerBehavior->makePartial(''_container'', Array)\n#20 /Users/joe/Documents/www/admin/modules/backend/behaviors/RelationController.php(437): Backend\\Behaviors\\RelationController->relationMakePartial(''container'')\n#21 [internal function]: Backend\\Behaviors\\RelationController->relationRender(''categories'')\n#22 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/ExtendableTrait.php(506): call_user_func_array(Array, Array)\n#23 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(''relationRender'', Array)\n#24 /Users/joe/Documents/www/admin/modules/backend/formwidgets/relation/partials/_relation.php(2): October\\Rain\\Extension\\Extendable->__call(''relationRender'', Array)\n#25 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#26 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#27 /Users/joe/Documents/www/admin/modules/backend/formwidgets/Relation.php(99): Backend\\Classes\\WidgetBase->makePartial(''_relation'')\n#28 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_field_widget.php(5): Backend\\FormWidgets\\Relation->render()\n#29 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#30 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#31 /Users/joe/Documents/www/admin/modules/backend/widgets/Form.php(299): Backend\\Classes\\WidgetBase->makePartial(''_field_widget'', Array)\n#32 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_field.php(25): Backend\\Widgets\\Form->renderFieldElement(Object(Backend\\Classes\\FormField))\n#33 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#34 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#35 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_field-container.php(9): Backend\\Classes\\WidgetBase->makePartial(''_field'', Array)\n#36 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#37 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#38 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_form_fields.php(11): Backend\\Classes\\WidgetBase->makePartial(''_field-containe...'', Array)\n#39 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#40 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#41 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_section.php(16): Backend\\Classes\\WidgetBase->makePartial(''_form_fields'', Array)\n#42 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#43 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#44 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_form.php(3): Backend\\Classes\\WidgetBase->makePartial(''_section'', Array)\n#45 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#46 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#47 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_form-container.php(8): Backend\\Classes\\WidgetBase->makePartial(''_form'')\n#48 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#49 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#50 /Users/joe/Documents/www/admin/modules/backend/widgets/Form.php(227): Backend\\Classes\\WidgetBase->makePartial(''_form-container'', Array)\n#51 /Users/joe/Documents/www/admin/modules/backend/behaviors/FormController.php(430): Backend\\Widgets\\Form->render(Array)\n#52 [internal function]: Backend\\Behaviors\\FormController->formRender()\n#53 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/ExtendableTrait.php(506): call_user_func_array(Array, Array)\n#54 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(''formRender'', Array)\n#55 /Users/joe/Documents/www/admin/plugins/cadon/stunring/controllers/product/update.php(13): October\\Rain\\Extension\\Extendable->__call(''formRender'', Array)\n#56 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#57 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(112): Backend\\Classes\\Controller->makeFileContents(''/Users/joe/Docu...'')\n#58 /Users/joe/Documents/www/admin/modules/backend/classes/Controller.php(397): Backend\\Classes\\Controller->makeView(''update'')\n#59 /Users/joe/Documents/www/admin/modules/backend/classes/Controller.php(265): Backend\\Classes\\Controller->execPageAction(''update'', Array)\n#60 /Users/joe/Documents/www/admin/modules/backend/classes/BackendController.php(118): Backend\\Classes\\Controller->run(''update'', Array)\n#61 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): Backend\\Classes\\BackendController->run(''cadon/stunring/...'')\n#62 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(''run'', Array)\n#63 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), ''run'')\n#64 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): Illuminate\\Routing\\Route->runController()\n#65 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(798): Illuminate\\Routing\\Route->run()\n#66 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#67 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#68 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#69 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#70 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#71 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#72 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#73 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#74 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#75 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#76 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#77 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#78 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#79 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#80 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#81 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#82 /Users/joe/Documents/www/admin/vendor/october/rain/src/Router/CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#83 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#84 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#85 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#86 /Users/joe/Documents/www/admin/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#87 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#88 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#89 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#90 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#91 /Users/joe/Documents/www/admin/index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#92 /Users/joe/Documents/www/admin/vendor/october/rain/src/Foundation/resources/server.php(18): require_once(''/Users/joe/Docu...'')\n#93 {main}', '[]', '2023-07-02 16:15:13', '2023-07-02 16:15:13'),
(5, 'error', 'SystemException: 未找到部件 ''_button_manage''  in /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php:92\nStack trace:\n#0 /Users/joe/Documents/www/admin/modules/backend/behaviors/RelationController.php(492): Backend\\Classes\\ControllerBehavior->makePartial(''_button_manage'', Array)\n#1 [internal function]: Backend\\Behaviors\\RelationController->relationMakePartial(''button_manage'')\n#2 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/ExtendableTrait.php(506): call_user_func_array(Array, Array)\n#3 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(''relationMakePar...'', Array)\n#4 /Users/joe/Documents/www/admin/modules/backend/behaviors/relationcontroller/partials/_toolbar.php(10): October\\Rain\\Extension\\Extendable->__call(''relationMakePar...'', Array)\n#5 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#6 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\Controller->makeFileContents(''/Users/joe/Docu...'', Array)\n#7 /Users/joe/Documents/www/admin/modules/backend/widgets/Toolbar.php(113): Backend\\Classes\\Controller->makePartial(''~/modules/backe...'', Array)\n#8 /Users/joe/Documents/www/admin/modules/backend/widgets/Toolbar.php(93): Backend\\Widgets\\Toolbar->makeControlPanel()\n#9 /Users/joe/Documents/www/admin/modules/backend/widgets/Toolbar.php(82): Backend\\Widgets\\Toolbar->prepareVars()\n#10 /Users/joe/Documents/www/admin/modules/backend/behaviors/RelationController.php(431): Backend\\Widgets\\Toolbar->render()\n#11 /Users/joe/Documents/www/admin/modules/backend/behaviors/RelationController.php(469): Backend\\Behaviors\\RelationController->relationRender(NULL, Array)\n#12 [internal function]: Backend\\Behaviors\\RelationController->relationRenderToolbar()\n#13 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/ExtendableTrait.php(506): call_user_func_array(Array, Array)\n#14 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(''relationRenderT...'', Array)\n#15 /Users/joe/Documents/www/admin/modules/backend/behaviors/relationcontroller/partials/_container.php(6): October\\Rain\\Extension\\Extendable->__call(''relationRenderT...'', Array)\n#16 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#17 /Users/joe/Documents/www/admin/modules/backend/classes/ControllerBehavior.php(134): Backend\\Classes\\Controller->makeFileContents(''/Users/joe/Docu...'', Array)\n#18 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\ControllerBehavior->makeFileContents(''/Users/joe/Docu...'', Array)\n#19 /Users/joe/Documents/www/admin/modules/backend/behaviors/RelationController.php(492): Backend\\Classes\\ControllerBehavior->makePartial(''_container'', Array)\n#20 /Users/joe/Documents/www/admin/modules/backend/behaviors/RelationController.php(437): Backend\\Behaviors\\RelationController->relationMakePartial(''container'')\n#21 [internal function]: Backend\\Behaviors\\RelationController->relationRender(''categories'')\n#22 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/ExtendableTrait.php(506): call_user_func_array(Array, Array)\n#23 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(''relationRender'', Array)\n#24 /Users/joe/Documents/www/admin/modules/backend/formwidgets/relation/partials/_relation.php(2): October\\Rain\\Extension\\Extendable->__call(''relationRender'', Array)\n#25 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#26 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#27 /Users/joe/Documents/www/admin/modules/backend/formwidgets/Relation.php(99): Backend\\Classes\\WidgetBase->makePartial(''_relation'')\n#28 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_field_widget.php(5): Backend\\FormWidgets\\Relation->render()\n#29 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#30 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#31 /Users/joe/Documents/www/admin/modules/backend/widgets/Form.php(299): Backend\\Classes\\WidgetBase->makePartial(''_field_widget'', Array)\n#32 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_field.php(25): Backend\\Widgets\\Form->renderFieldElement(Object(Backend\\Classes\\FormField))\n#33 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#34 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#35 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_field-container.php(9): Backend\\Classes\\WidgetBase->makePartial(''_field'', Array)\n#36 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#37 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#38 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_form_fields.php(11): Backend\\Classes\\WidgetBase->makePartial(''_field-containe...'', Array)\n#39 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#40 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#41 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_section.php(16): Backend\\Classes\\WidgetBase->makePartial(''_form_fields'', Array)\n#42 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#43 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#44 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_form.php(3): Backend\\Classes\\WidgetBase->makePartial(''_section'', Array)\n#45 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#46 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#47 /Users/joe/Documents/www/admin/modules/backend/widgets/form/partials/_form-container.php(8): Backend\\Classes\\WidgetBase->makePartial(''_form'')\n#48 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#49 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(''/Users/joe/Docu...'', Array)\n#50 /Users/joe/Documents/www/admin/modules/backend/widgets/Form.php(227): Backend\\Classes\\WidgetBase->makePartial(''_form-container'', Array)\n#51 /Users/joe/Documents/www/admin/modules/backend/behaviors/FormController.php(430): Backend\\Widgets\\Form->render(Array)\n#52 [internal function]: Backend\\Behaviors\\FormController->formRender()\n#53 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/ExtendableTrait.php(506): call_user_func_array(Array, Array)\n#54 /Users/joe/Documents/www/admin/vendor/october/rain/src/Extension/Extendable.php(46): October\\Rain\\Extension\\Extendable->extendableCall(''formRender'', Array)\n#55 /Users/joe/Documents/www/admin/plugins/cadon/stunring/controllers/product/update.php(13): October\\Rain\\Extension\\Extendable->__call(''formRender'', Array)\n#56 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(263): include(''/Users/joe/Docu...'')\n#57 /Users/joe/Documents/www/admin/modules/system/traits/ViewMaker.php(112): Backend\\Classes\\Controller->makeFileContents(''/Users/joe/Docu...'')\n#58 /Users/joe/Documents/www/admin/modules/backend/classes/Controller.php(397): Backend\\Classes\\Controller->makeView(''update'')\n#59 /Users/joe/Documents/www/admin/modules/backend/classes/Controller.php(265): Backend\\Classes\\Controller->execPageAction(''update'', Array)\n#60 /Users/joe/Documents/www/admin/modules/backend/classes/BackendController.php(118): Backend\\Classes\\Controller->run(''update'', Array)\n#61 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): Backend\\Classes\\BackendController->run(''cadon/stunring/...'')\n#62 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(43): Illuminate\\Routing\\Controller->callAction(''run'', Array)\n#63 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Route.php(259): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), ''run'')\n#64 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): Illuminate\\Routing\\Route->runController()\n#65 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(798): Illuminate\\Routing\\Route->run()\n#66 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#67 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(50): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#68 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#69 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#70 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#71 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(121): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#72 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(64): Illuminate\\Session\\Middleware\\StartSession->handleStatefulRequest(Object(Illuminate\\Http\\Request), Object(Illuminate\\Session\\Store), Object(Closure))\n#73 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#74 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#75 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#76 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#77 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#78 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#79 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(797): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#80 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#81 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Routing/Router.php(740): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#82 /Users/joe/Documents/www/admin/vendor/october/rain/src/Router/CoreRouter.php(32): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#83 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(190): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#84 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#85 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#86 /Users/joe/Documents/www/admin/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(23): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#87 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#88 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#89 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#90 /Users/joe/Documents/www/admin/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#91 /Users/joe/Documents/www/admin/index.php(42): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#92 /Users/joe/Documents/www/admin/vendor/october/rain/src/Foundation/resources/server.php(18): require_once(''/Users/joe/Docu...'')\n#93 {main}', '[]', '2023-07-02 16:15:25', '2023-07-02 16:15:25');

-- END TABLE system_event_logs

-- BEGIN TABLE system_files
DROP TABLE IF EXISTS system_files;
CREATE TABLE `system_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int NOT NULL,
  `content_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` int DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_master_index` (`attachment_id`,`attachment_type`),
  KEY `system_files_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table system_files contains no data. No inserts have been genrated.
-- Inserting 0 rows into system_files


-- END TABLE system_files

-- BEGIN TABLE system_mail_layouts
DROP TABLE IF EXISTS system_mail_layouts;
CREATE TABLE `system_mail_layouts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `content_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 2 rows into system_mail_layouts
-- Insert batch #1
INSERT INTO system_mail_layouts (id, name, code, content_html, content_text, content_css, is_locked, `options`, created_at, updated_at) VALUES
(1, 'Default layout', 'default', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml">\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0" />\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n</head>\n<body>\n    <style type="text/css" media="screen">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class="wrapper layout-default" width="100%" cellpadding="0" cellspacing="0">\n\n        <!-- Header -->\n        {% partial ''header'' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align="center">\n                <table class="content" width="100%" cellpadding="0" cellspacing="0">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class="body" width="100%" cellpadding="0" cellspacing="0">\n                            <table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class="content-cell">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial ''footer'' body %}\n            &copy; {{ "now"|date("Y") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>', '{{ content|raw }}', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2023-06-29 12:52:10', '2023-06-29 12:52:10'),
(2, 'System layout', 'system', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml">\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0" />\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n</head>\n<body>\n    <style type="text/css" media="screen">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class="wrapper layout-system" width="100%" cellpadding="0" cellspacing="0">\n        <tr>\n            <td align="center">\n                <table class="content" width="100%" cellpadding="0" cellspacing="0">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class="body" width="100%" cellpadding="0" cellspacing="0">\n                            <table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class="content-cell">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial ''subcopy'' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2023-06-29 12:52:10', '2023-06-29 12:52:10');

-- END TABLE system_mail_layouts

-- BEGIN TABLE system_mail_partials
DROP TABLE IF EXISTS system_mail_partials;
CREATE TABLE `system_mail_partials` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table system_mail_partials contains no data. No inserts have been genrated.
-- Inserting 0 rows into system_mail_partials


-- END TABLE system_mail_partials

-- BEGIN TABLE system_mail_templates
DROP TABLE IF EXISTS system_mail_templates;
CREATE TABLE `system_mail_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `layout_id` int DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table system_mail_templates contains no data. No inserts have been genrated.
-- Inserting 0 rows into system_mail_templates


-- END TABLE system_mail_templates

-- BEGIN TABLE system_parameters
DROP TABLE IF EXISTS system_parameters;
CREATE TABLE `system_parameters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 9 rows into system_parameters
-- Insert batch #1
INSERT INTO system_parameters (id, namespace, `group`, item, `value`) VALUES
(1, 'system', 'update', 'count', '0'),
(2, 'system', 'core', 'build', '"20"'),
(3, 'system', 'update', 'retry', '1688363323'),
(4, 'system', 'project', 'id', '277094'),
(5, 'system', 'project', 'key', '"0ZwHkZmLgZwp3ZQx0YGWwLzL1MQAyA2H0BGt3LmZ5BGN3MwZmBJZ2ZJH2AQZ3"'),
(6, 'system', 'project', 'name', '"admin_stu"'),
(7, 'system', 'project', 'owner', '"cadon"'),
(8, 'system', 'project', 'is_active', 'true'),
(9, 'system', 'update', 'versions', '{"count":0,"core":null,"plugins":[]}');

-- END TABLE system_parameters

-- BEGIN TABLE system_plugin_history
DROP TABLE IF EXISTS system_plugin_history;
CREATE TABLE `system_plugin_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 48 rows into system_plugin_history
-- Insert batch #1
INSERT INTO system_plugin_history (id, code, type, version, detail, created_at) VALUES
(2, 'RainLab.Builder', 'comment', '1.0.1', 'Initialize plugin.', '2023-06-29 12:52:10'),
(3, 'RainLab.Builder', 'comment', '1.0.2', 'Fixes the problem with selecting a plugin. Minor localization corrections. Configuration files in the list and form behaviors are now autocomplete.', '2023-06-29 12:52:10'),
(4, 'RainLab.Builder', 'comment', '1.0.3', 'Improved handling of the enum data type.', '2023-06-29 12:52:10'),
(5, 'RainLab.Builder', 'comment', '1.0.4', 'Added user permissions to work with the Builder.', '2023-06-29 12:52:10'),
(6, 'RainLab.Builder', 'comment', '1.0.5', 'Fixed permissions registration.', '2023-06-29 12:52:10'),
(7, 'RainLab.Builder', 'comment', '1.0.6', 'Fixed front-end record ordering in the Record List component.', '2023-06-29 12:52:10'),
(8, 'RainLab.Builder', 'comment', '1.0.7', 'Builder settings are now protected with user permissions. The database table column list is scrollable now. Minor code cleanup.', '2023-06-29 12:52:10'),
(9, 'RainLab.Builder', 'comment', '1.0.8', 'Added the Reorder Controller behavior.', '2023-06-29 12:52:10'),
(10, 'RainLab.Builder', 'comment', '1.0.9', 'Minor API and UI updates.', '2023-06-29 12:52:10'),
(11, 'RainLab.Builder', 'comment', '1.0.10', 'Minor styling update.', '2023-06-29 12:52:10'),
(12, 'RainLab.Builder', 'comment', '1.0.11', 'Fixed a bug where clicking placeholder in a repeater would open Inspector. Fixed a problem with saving forms with repeaters in tabs. Minor style fix.', '2023-06-29 12:52:10'),
(13, 'RainLab.Builder', 'comment', '1.0.12', 'Added support for the Trigger property to the Media Finder widget configuration. Names of form fields and list columns definition files can now contain underscores.', '2023-06-29 12:52:10'),
(14, 'RainLab.Builder', 'comment', '1.0.13', 'Minor styling fix on the database editor.', '2023-06-29 12:52:10'),
(15, 'RainLab.Builder', 'comment', '1.0.14', 'Added support for published_at timestamp field', '2023-06-29 12:52:10'),
(16, 'RainLab.Builder', 'comment', '1.0.15', 'Fixed a bug where saving a localization string in Inspector could cause a JavaScript error. Added support for Timestamps and Soft Deleting for new models.', '2023-06-29 12:52:10'),
(17, 'RainLab.Builder', 'comment', '1.0.16', 'Fixed a bug when saving a form with the Repeater widget in a tab could create invalid fields in the form''s outside area. Added a check that prevents creating localization strings inside other existing strings.', '2023-06-29 12:52:10'),
(18, 'RainLab.Builder', 'comment', '1.0.17', 'Added support Trigger attribute support for RecordFinder and Repeater form widgets.', '2023-06-29 12:52:10'),
(19, 'RainLab.Builder', 'comment', '1.0.18', 'Fixes a bug where ''::class'' notations in a model class definition could prevent the model from appearing in the Builder model list. Added emptyOption property support to the dropdown form control.', '2023-06-29 12:52:10'),
(20, 'RainLab.Builder', 'comment', '1.0.19', 'Added a feature allowing to add all database columns to a list definition. Added max length validation for database table and column names.', '2023-06-29 12:52:10'),
(21, 'RainLab.Builder', 'comment', '1.0.20', 'Fixes a bug where form the builder could trigger the "current.hasAttribute is not a function" error.', '2023-06-29 12:52:10'),
(22, 'RainLab.Builder', 'comment', '1.0.21', 'Back-end navigation sort order updated.', '2023-06-29 12:52:10'),
(23, 'RainLab.Builder', 'comment', '1.0.22', 'Added scopeValue property to the RecordList component.', '2023-06-29 12:52:10'),
(24, 'RainLab.Builder', 'comment', '1.0.23', 'Added support for balloon-selector field type, added Brazilian Portuguese translation, fixed some bugs', '2023-06-29 12:52:10'),
(25, 'RainLab.Builder', 'comment', '1.0.24', 'Added support for tag list field type, added read only toggle for fields. Prevent plugins from using reserved PHP keywords for class names and namespaces', '2023-06-29 12:52:10'),
(26, 'RainLab.Builder', 'comment', '1.0.25', 'Allow editing of migration code in the "Migration" popup when saving changes in the database editor.', '2023-06-29 12:52:10'),
(27, 'RainLab.Builder', 'comment', '1.0.26', 'Allow special default values for columns and added new "Add ID column" button to database editor.', '2023-06-29 12:52:10'),
(28, 'RainLab.Builder', 'comment', '1.0.27', 'Added ability to use ''scope'' in a form relation field, added ability to change the sort order of versions and added additional properties for repeater widget in form builder. Added Polish translation.', '2023-06-29 12:52:10'),
(29, 'RainLab.Builder', 'comment', '1.0.28', 'Fixes support for PHP 8', '2023-06-29 12:52:10'),
(30, 'RainLab.Builder', 'comment', '1.0.29', 'Disable touch device detection', '2023-06-29 12:52:10'),
(31, 'RainLab.Builder', 'comment', '1.0.30', 'Minor styling improvements', '2023-06-29 12:52:10'),
(32, 'RainLab.Builder', 'comment', '1.0.31', 'Added support for more rich editor and file upload properties', '2023-06-29 12:52:10'),
(33, 'RainLab.Builder', 'comment', '1.0.32', 'Minor styling improvements', '2023-06-29 12:52:10'),
(34, 'RainLab.Builder', 'comment', '1.1.0', 'Adds feature for adding database fields to a form definition.', '2023-06-29 12:52:10'),
(35, 'RainLab.Builder', 'comment', '1.1.1', 'Adds DBAL timestamp column type. Adds database prefix support. Fixes various bugs.', '2023-06-29 12:52:10'),
(36, 'RainLab.Builder', 'comment', '1.1.2', 'Compatibility with October CMS v2.2', '2023-06-29 12:52:10'),
(37, 'RainLab.Builder', 'comment', '1.1.3', 'Adds comment support to database tables.', '2023-06-29 12:52:10'),
(38, 'RainLab.Builder', 'comment', '1.1.4', 'Fixes duplication bug saving backend menu permissions.', '2023-06-29 12:52:10'),
(39, 'RainLab.Builder', 'comment', '1.2.0', 'Improve support with October v3.0', '2023-06-29 12:52:10'),
(40, 'RainLab.Builder', 'comment', '1.2.2', 'Compatibility updates.', '2023-06-29 12:52:10'),
(41, 'RainLab.Builder', 'comment', '1.2.3', 'Fixes issue when removing items from permissions and menus.', '2023-06-29 12:52:10'),
(42, 'RainLab.Builder', 'comment', '1.2.5', 'Fixes validator conflict with other plugins.', '2023-06-29 12:52:10'),
(43, 'RainLab.Builder', 'comment', '1.2.6', 'Compatibility with October v3.1', '2023-06-29 12:52:10'),
(44, 'RainLab.Builder', 'comment', '2.0.1', 'Adds Tailor blueprint importer and code editor.', '2023-06-29 12:52:10'),
(45, 'RainLab.Builder', 'comment', '2.0.2', 'Fixes visual bug when tab fields overflow.', '2023-06-29 12:52:10'),
(46, 'RainLab.Builder', 'comment', '2.0.3', 'Fixes missing import in CMS components.', '2023-06-29 12:52:10'),
(47, 'RainLab.Builder', 'comment', '2.0.4', 'Fixes bad method name in controller model.', '2023-06-29 12:52:10'),
(48, 'RainLab.Builder', 'comment', '2.0.5', 'Fixes bug adding data table controls.', '2023-06-29 12:52:10'),
(58, 'Cadon.Stunring', 'comment', '1.0.1', 'Initialize plugin', '2023-06-29 17:19:30');

-- END TABLE system_plugin_history

-- BEGIN TABLE system_plugin_versions
DROP TABLE IF EXISTS system_plugin_versions;
CREATE TABLE `system_plugin_versions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 2 rows into system_plugin_versions
-- Insert batch #1
INSERT INTO system_plugin_versions (id, code, version, is_frozen, is_disabled, created_at) VALUES
(2, 'RainLab.Builder', '2.0.5', 0, 0, '2023-06-29 12:52:10'),
(5, 'Cadon.Stunring', '1.0.1', 0, 0, '2023-06-29 17:19:30');

-- END TABLE system_plugin_versions

-- BEGIN TABLE system_request_logs
DROP TABLE IF EXISTS system_request_logs;
CREATE TABLE `system_request_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci,
  `count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table system_request_logs contains no data. No inserts have been genrated.
-- Inserting 0 rows into system_request_logs


-- END TABLE system_request_logs

-- BEGIN TABLE system_revisions
DROP TABLE IF EXISTS system_revisions;
CREATE TABLE `system_revisions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table system_revisions contains no data. No inserts have been genrated.
-- Inserting 0 rows into system_revisions


-- END TABLE system_revisions

-- BEGIN TABLE system_settings
DROP TABLE IF EXISTS system_settings;
CREATE TABLE `system_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  `site_id` int unsigned DEFAULT NULL,
  `site_root_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table system_settings contains no data. No inserts have been genrated.
-- Inserting 0 rows into system_settings


-- END TABLE system_settings

-- BEGIN TABLE system_site_definitions
DROP TABLE IF EXISTS system_site_definitions;
CREATE TABLE `system_site_definitions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `is_custom_url` tinyint(1) NOT NULL DEFAULT '0',
  `app_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT '0',
  `allow_hosts` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_prefixed` tinyint(1) NOT NULL DEFAULT '0',
  `route_prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_styled` tinyint(1) NOT NULL DEFAULT '0',
  `color_foreground` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_enabled_edit` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_site_definitions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 1 row into system_site_definitions
-- Insert batch #1
INSERT INTO system_site_definitions (id, name, code, sort_order, is_custom_url, app_url, theme, locale, timezone, is_restricted, allow_hosts, is_prefixed, route_prefix, is_styled, color_foreground, color_background, is_primary, is_enabled, is_enabled_edit, created_at, updated_at) VALUES
(1, 'Primary Site', 'primary', 1, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 1, 1, 1, '2023-06-29 12:52:09', '2023-06-29 12:52:09');

-- END TABLE system_site_definitions

-- BEGIN TABLE tailor_content_joins
DROP TABLE IF EXISTS tailor_content_joins;
CREATE TABLE `tailor_content_joins` (
  `parent_id` int DEFAULT NULL,
  `parent_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation_id` int DEFAULT NULL,
  `relation_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  KEY `tailor_content_joins_pidx` (`parent_id`,`parent_type`),
  KEY `tailor_content_joins_ridx` (`relation_id`,`relation_type`),
  KEY `tailor_content_joins_field_name_index` (`field_name`),
  KEY `tailor_content_joins_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table tailor_content_joins contains no data. No inserts have been genrated.
-- Inserting 0 rows into tailor_content_joins


-- END TABLE tailor_content_joins

-- BEGIN TABLE tailor_content_schema
DROP TABLE IF EXISTS tailor_content_schema;
CREATE TABLE `tailor_content_schema` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` mediumtext COLLATE utf8mb4_unicode_ci,
  `fields` mediumtext COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tailor_content_schema_table_name_index` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table tailor_content_schema contains no data. No inserts have been genrated.
-- Inserting 0 rows into tailor_content_schema


-- END TABLE tailor_content_schema

-- BEGIN TABLE tailor_global_joins
DROP TABLE IF EXISTS tailor_global_joins;
CREATE TABLE `tailor_global_joins` (
  `parent_id` int DEFAULT NULL,
  `relation_id` int DEFAULT NULL,
  `relation_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  KEY `tailor_global_joins_idx` (`relation_id`,`relation_type`),
  KEY `tailor_global_joins_field_name_index` (`field_name`),
  KEY `tailor_global_joins_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table tailor_global_joins contains no data. No inserts have been genrated.
-- Inserting 0 rows into tailor_global_joins


-- END TABLE tailor_global_joins

-- BEGIN TABLE tailor_global_repeaters
DROP TABLE IF EXISTS tailor_global_repeaters;
CREATE TABLE `tailor_global_repeaters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `host_id` int DEFAULT NULL,
  `host_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  `content_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_value` mediumtext COLLATE utf8mb4_unicode_ci,
  `content_spawn_path` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tailor_global_repeaters_idx` (`host_id`,`host_field`),
  KEY `tailor_global_repeaters_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table tailor_global_repeaters contains no data. No inserts have been genrated.
-- Inserting 0 rows into tailor_global_repeaters


-- END TABLE tailor_global_repeaters

-- BEGIN TABLE tailor_globals
DROP TABLE IF EXISTS tailor_globals;
CREATE TABLE `tailor_globals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int DEFAULT NULL,
  `site_root_id` int DEFAULT NULL,
  `blueprint_uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tailor_globals_site_id_index` (`site_id`),
  KEY `tailor_globals_site_root_id_index` (`site_root_id`),
  KEY `tailor_globals_blueprint_uuid_index` (`blueprint_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table tailor_globals contains no data. No inserts have been genrated.
-- Inserting 0 rows into tailor_globals


-- END TABLE tailor_globals

-- BEGIN TABLE tailor_preview_tokens
DROP TABLE IF EXISTS tailor_preview_tokens;
CREATE TABLE `tailor_preview_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int DEFAULT NULL,
  `route` mediumtext COLLATE utf8mb4_unicode_ci,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_use` int NOT NULL DEFAULT '0',
  `count_limit` int NOT NULL DEFAULT '0',
  `created_user_id` int unsigned DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tailor_preview_tokens_site_id_index` (`site_id`),
  KEY `tailor_preview_tokens_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table tailor_preview_tokens contains no data. No inserts have been genrated.
-- Inserting 0 rows into tailor_preview_tokens


-- END TABLE tailor_preview_tokens

