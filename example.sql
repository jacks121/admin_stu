-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.32 - MySQL Community Server - GPL
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



-- 导出  表 swetelove.advertisements 结构
CREATE TABLE IF NOT EXISTS `cadon_stunring_advertisements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL, 
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在导出表  swetelove.advertisements 的数据：~2 rows (大约)
DELETE FROM `cadon_stunring_advertisements`;
INSERT INTO `cadon_stunring_advertisements` (`id`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'banner', '2023-06-01 01:28:17', '2023-06-01 01:28:17', NULL),
	(2, 'category_banner', '2023-06-01 01:28:17', '2023-06-01 01:28:17', NULL);

-- 导出  表 swetelove.attributes 结构
CREATE TABLE IF NOT EXISTS `cadon_stunring_attributes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(255) DEFAULT NULL COMMENT '属性名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='属性表';

-- 正在导出表  swetelove.attributes 的数据：~10 rows (大约)
DELETE FROM `cadon_stunring_attributes`;
INSERT INTO `cadon_stunring_attributes` (`id`, `attribute_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
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

-- 导出  表 swetelove.attribute_values 结构
CREATE TABLE IF NOT EXISTS `cadon_stunring_attribute_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attribute_id` int NOT NULL,
  `value` varchar(255) DEFAULT NULL COMMENT '属性值',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='属性值表';

-- 正在导出表  swetelove.attribute_values 的数据：~47 rows (大约)
DELETE FROM `cadon_stunring_attribute_values`;
INSERT INTO `cadon_stunring_attribute_values` (`id`, `attribute_id`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
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
	(29, 6, 'Valentine\'s Day', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
	(30, 6, 'Christmas', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
	(31, 7, 'Women\'s', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
	(32, 7, 'Men\'s', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL),
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
	(47, 10, '$500-$1000', '2023-06-04 13:05:35', '2023-06-04 13:05:35', NULL);

-- 导出  表 swetelove.categories 结构
CREATE TABLE IF NOT EXISTS `cadon_stunring_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT '0',
  `category_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分类表';

-- 正在导出表  swetelove.categories 的数据：~31 rows (大约)
DELETE FROM `cadon_stunring_categories`;
INSERT INTO `cadon_stunring_categories` (`id`, `parent_id`, `category_name`, `url`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 0, 'Wedding', '/wedding.html', NULL, NULL, NULL),
	(2, 1, 'Engagement Rings', '/wedding/engagement-rings.html', NULL, NULL, NULL),
	(3, 1, 'Wedding Band', '/wedding/wedding-band.html', NULL, NULL, NULL),
	(4, 1, 'Wedding Set', '/wedding/wedding-set.html', NULL, NULL, NULL),
	(5, 1, 'Wedding Rings', '/wedding/wedding-rings.html', NULL, NULL, NULL),
	(6, 1, 'Jewelry Set', '/wedding/jewelry-set.html', NULL, NULL, NULL),
	(7, 1, 'Gift Packaging', '/wedding/gift-packaging.html', NULL, NULL, NULL),
	(8, 0, 'Earrings', '/earrings.html', NULL, NULL, NULL),
	(9, 8, 'Studs', '/earrings/studs.html', NULL, NULL, NULL),
	(10, 8, 'Drops', '/earrings/drops.html', NULL, NULL, NULL),
	(11, 8, 'Hoops', '/earrings/hoops.html', NULL, NULL, NULL),
	(12, 0, 'Necklaces', '/necklaces.html', NULL, NULL, NULL),
	(13, 12, 'Pendants', '/necklaces/pendants.html', NULL, NULL, NULL),
	(14, 12, 'Chokers & Tennis Necklace', '/necklaces/chokers-tennis-necklace.html', NULL, NULL, NULL),
	(15, 12, 'Lariat & Y Necklace', '/necklaces/lariat-y-necklace.html', NULL, NULL, NULL),
	(16, 12, 'Layered Necklace', '/necklaces/layered-necklace.html', NULL, NULL, NULL),
	(17, 12, 'Pear Necklace', '/necklaces/statement-necklace.html', NULL, NULL, NULL),
	(18, 0, 'Bracelets', '/bracelets.html', NULL, NULL, NULL),
	(19, 0, 'Men\'s', '/men.html', NULL, NULL, NULL),
	(20, 19, 'Men\'s Rings', '/men/men-s-rings.html', NULL, NULL, NULL),
	(21, 19, 'Men\'s Necklaces', '/men/men-s-necklaces.html', NULL, NULL, NULL),
	(22, 19, 'Cufflinks', '/men/cufflinks.html', NULL, NULL, NULL),
	(23, 0, 'COLLECTION', '/collection.html', NULL, NULL, NULL),
	(24, 23, 'Back to School', '/collection/back-to-school.html', NULL, NULL, NULL),
	(25, 23, 'The Spirit Snake', '/collection/the-spirit-snake.html', NULL, NULL, NULL),
	(26, 23, 'The Vintage Art Deco', '/collection/the-vintage-art-deco-ring.html', NULL, NULL, NULL),
	(27, 23, 'The Snow Band Ring', '/collection/the-snow-band-ring.html', NULL, NULL, NULL),
	(28, 23, 'The Starry Night', '/collection/the-starry-night.html', NULL, NULL, NULL),
	(29, 23, 'Mother\'s Day', '/collection/mother-s-day.html', NULL, NULL, NULL),
	(30, 23, 'Merry Christmas', '/collection/merry-christmas.html', NULL, NULL, NULL),
	(31, 23, 'Father\'s Day', '/collection/father-s-day.html', NULL, NULL, NULL);

-- 导出  表 swetelove.collections 结构
CREATE TABLE IF NOT EXISTS `cadon_stunring_collections` (
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

-- 正在导出表  swetelove.collections 的数据：~2 rows (大约)
DELETE FROM `cadon_stunring_collections`;
INSERT INTO `cadon_stunring_collections` (`id`, `created_at`, `updated_at`, `deleted_at`, `name`, `code`, `type`, `rule`) VALUES
	(1, '2023-06-04 13:19:20', '2023-06-05 13:53:11', NULL, 'Newest Releases', 'newin', 'new', '{"limit": 10}'),
	(2, '2023-06-06 14:21:17', '2023-06-05 13:54:40', NULL, 'top sellers', 'top', 'sales', '{"limit": 10}');

-- 导出  表 swetelove.currencies 结构
CREATE TABLE IF NOT EXISTS `cadon_stunring_currencies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `exchange` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  swetelove.currencies 的数据：~9 rows (大约)
DELETE FROM `cadon_stunring_currencies`;
INSERT INTO `cadon_stunring_currencies` (`id`, `created_at`, `updated_at`, `deleted_at`, `code`, `exchange`) VALUES
	(1, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', NULL, 'AUD', 5.00),
	(2, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', NULL, 'GBP', 9.00),
	(3, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', NULL, 'CAD', 5.50),
	(4, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', NULL, 'EUR', 8.50),
	(5, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', NULL, 'JPY', 0.07),
	(6, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', NULL, 'MXN', 0.40),
	(7, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', NULL, 'NZD', 4.50),
	(8, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', NULL, 'PHP', 0.16),
	(9, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', NULL, 'SGD', 5.00);

-- 导出  表 swetelove.images 结构
CREATE TABLE IF NOT EXISTS `cadon_stunring_images` (
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

-- 正在导出表  swetelove.images 的数据：~47 rows (大约)
DELETE FROM `cadon_stunring_images`;
INSERT INTO `cadon_stunring_images` (`id`, `image_url`, `link`, `imageable_id`, `imageable_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
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

-- 导出  表 swetelove.products 结构
CREATE TABLE IF NOT EXISTS `cadon_stunring_products` (
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品表';

-- 正在导出表  swetelove.products 的数据：~21 rows (大约)
DELETE FROM `cadon_stunring_products`;
INSERT INTO `cadon_stunring_products` (`id`, `product_name`, `sku`, `original_price`, `current_price`, `on_sale`, `description`, `video_url`, `sales`, `created_at`, `updated_at`, `deleted_at`, `detail`) VALUES
	(4, 'Product 1', 'SKU-4', 100.00, 99.50, 1, 'This is product 1', 'http://product1.video', 99, '2023-05-11 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(5, 'Product 24343', 'SKU-5', 110.00, 2.00, 1, 'This is product 2', 'http://product2.video', 98, '2023-05-12 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(6, 'Product 3', 'SKU-6', 110.00, 2.00, 1, 'This is product 2', 'http://product2.video', 97, '2023-05-13 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(7, 'Product 4', 'SKU-7', 110.00, 3.00, 1, 'This is product 2', 'http://product2.video', 96, '2023-05-14 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(8, 'Product 5', 'SKU-8', 110.00, 4.00, 1, 'This is product 2', 'http://product2.video', 95, '2023-05-15 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(9, 'Product 6', 'SKU-9', 110.00, 5.00, 1, 'This is product 2', 'http://product2.video', 94, '2023-05-16 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "HAHA", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(10, 'Product 7', 'SKU-10', 110.00, 6.00, 1, 'This is product 2', 'http://product2.video', 88, '2023-05-17 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(11, 'Product 8', 'SKU-11', 110.00, 7.00, 1, 'This is product 2', 'http://product2.video', 89, '2023-05-18 14:01:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(12, 'Product 9', 'SKU-12', 110.00, 8.00, 1, 'This is product 2', 'http://product2.video', 87, '2023-05-18 14:02:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "HAHA", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(13, 'Product 10', 'SKU-13', 110.00, 11.00, 1, 'This is product 2', 'http://product2.video', 987, '2023-05-18 14:03:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(14, 'Product d', 'SKU-14', 110.00, 12.00, 1, 'This is product 2', 'http://product2.video', 12, '2023-05-18 14:04:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(15, 'Product 32', 'SKU-15', 110.00, 13.00, 1, 'This is product 2', 'http://product2.video', 13, '2023-05-18 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(16, 'Product fd4', 'SKU-16', 110.00, 14.00, 1, 'This is product 2', 'http://product2.video', 14, '2023-06-18 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "HAHA", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(17, 'Product 35', 'SKU-17', 110.00, 15.00, 1, 'This is product 2', 'http://product2.video', 15, '2023-05-21 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(18, 'Product jk89', 'SKU-18', 110.00, 16.00, 1, 'This is product 2', 'http://product2.video', 21, '2023-05-22 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(19, 'Product d6', 'SKU-19', 110.00, 21.00, 1, 'This is product 2', 'http://product2.video', 22, '2023-05-23 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(20, 'Product l;9', 'SKU-20', 110.00, 22.00, 1, 'This is product 2', 'http://product2.video', 23, '2023-05-24 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(21, 'Product d5', 'SKU-21', 110.00, 23.00, 1, 'This is product 2', 'http://product2.video', 24, '2023-05-25 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(22, 'Product j90', 'SKU-22', 110.00, 24.00, 1, 'This is product 2', 'http://product2.video', 25, '2023-05-26 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(23, 'Product ds712', 'SKU-23', 110.00, 25.00, 1, 'This is product 2', 'http://product2.video', 31, '2023-05-26 23:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}'),
	(24, 'Product p9', 'SKU-24', 110.00, 99.00, 1, 'This is product 2', 'http://product2.video', 32, '2023-05-28 14:05:26', '2023-05-18 14:05:26', NULL, '{"Size": "17", "Metal": "Pseudo Gold", "Width": "13.5mm", "Weight": "23g", "Rhodium": "Yes", "Stone Cut": "Round", "Thickness": "2.5mm", "Stone Size": "1.0*1.0mm", "Stone Type": "Lab Created gemstone", "Stone Color": "White", "Carat Weight": "0.02CT/pcs", "Plating Color": "Rosegold/Platinum"}');

-- 导出  表 swetelove.product_attributes 结构
CREATE TABLE IF NOT EXISTS `cadon_stunring_product_attributes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL COMMENT '商品ID',
  `attribute_id` int NOT NULL COMMENT '属性ID',
  `value_id` int NOT NULL COMMENT '属性值ID',
  `price_adjustment` decimal(10,2) DEFAULT NULL COMMENT '价格调整',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品属性表';

-- 正在导出表  swetelove.product_attributes 的数据：~29 rows (大约)
DELETE FROM `cadon_stunring_product_attributes`;
INSERT INTO `cadon_stunring_product_attributes` (`id`, `product_id`, `attribute_id`, `value_id`, `price_adjustment`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 4, 1, 1, 0.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(2, 4, 1, 2, 0.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(3, 4, 1, 3, 0.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(4, 4, 1, 4, 0.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(5, 4, 1, 5, 0.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(6, 4, 2, 6, -50.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(7, 4, 2, 7, -50.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(8, 4, 2, 8, -50.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(9, 4, 2, 9, -50.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(10, 4, 2, 10, -50.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(11, 5, 3, 11, 0.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(12, 5, 3, 12, 0.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(13, 5, 3, 13, 0.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(14, 5, 3, 14, -20.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(15, 5, 3, 15, -20.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(16, 5, 4, 16, 100.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(17, 5, 4, 17, -50.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(18, 5, 4, 18, -100.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(19, 5, 4, 19, -50.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(20, 5, 4, 20, -50.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(21, 6, 5, 21, -10.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(22, 6, 5, 22, -10.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(23, 6, 5, 23, -10.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(24, 6, 5, 24, -10.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(25, 6, 5, 25, -10.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(26, 6, 6, 26, -10.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(27, 6, 6, 27, -10.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(28, 6, 6, 28, -10.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL),
	(29, 6, 6, 29, -10.00, '2023-06-04 13:11:49', '2023-06-04 13:11:49', NULL);

-- 导出  表 swetelove.product_categories 结构
CREATE TABLE IF NOT EXISTS `cadon_stunring_product_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL COMMENT '商品ID',
  `category_id` int NOT NULL COMMENT '分类ID',
  `parent_id` int DEFAULT NULL COMMENT '父级分类ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品分类表';

-- 正在导出表  swetelove.product_categories 的数据：~23 rows (大约)
DELETE FROM `cadon_stunring_product_categories`;
INSERT INTO `cadon_stunring_product_categories` (`id`, `product_id`, `category_id`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(8, 5, 2, NULL, '2023-05-18 14:11:11', '2023-05-18 14:11:11', NULL),
	(9, 4, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(10, 5, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(11, 6, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(12, 7, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(13, 8, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(14, 9, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(15, 10, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(16, 11, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(17, 12, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(18, 13, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(19, 14, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(20, 15, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(21, 16, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(22, 17, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(23, 18, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(24, 19, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(25, 20, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(26, 21, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(27, 22, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(28, 23, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL),
	(29, 24, 1, NULL, '2023-06-12 11:58:37', '2023-06-12 11:58:37', NULL);

-- 导出  表 swetelove.product_extensions 结构
CREATE TABLE IF NOT EXISTS `cadon_stunring_product_extensions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carat` float DEFAULT NULL,
  `stone_cut` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stone_color` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `plating_color` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `style` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `occasion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `recipient` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  swetelove.product_extensions 的数据：~21 rows (大约)
DELETE FROM `cadon_stunring_product_extensions`;
INSERT INTO `cadon_stunring_product_extensions` (`id`, `product_id`, `sku`, `carat`, `stone_cut`, `stone_color`, `plating_color`, `style`, `occasion`, `recipient`, `created_at`, `updated_at`) VALUES
	(1, 4, 'SKU-4', 1, 'Round', 'White', 'Silver', 'Classic', 'Anniversary', 'Mother', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
	(2, 5, 'SKU-5', 1.5, 'Princess', 'Blue', 'Gold', 'Modern', 'Birthday', 'Father', '2023-06-25 01:56:16', '2023-06-25 01:56:16'),
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
	(21, 24, 'SKU-24', 1, 'Princess', 'Indigo', 'Silver', 'Casual', 'Graduation', 'Co-worker', '2023-06-25 01:56:16', '2023-06-25 01:56:16');

-- 导出  表 swetelove.reviews 结构
CREATE TABLE IF NOT EXISTS `cadon_stunring_reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL COMMENT '商品ID',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `rating` int DEFAULT NULL COMMENT '评分',
  `review_text` text COMMENT '评价文本',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评价表';

-- 正在导出表  swetelove.reviews 的数据：~12 rows (大约)
DELETE FROM `cadon_stunring_reviews`;
INSERT INTO `cadon_stunring_reviews` (`id`, `product_id`, `user_id`, `rating`, `review_text`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 4, 1, 5, 'Great product!', '2023-05-18 14:10:44', '2023-05-18 14:10:44', NULL),
	(2, 5, 2, 4, 'Good product!', '2023-05-18 14:10:44', '2023-05-18 14:10:44', NULL),
	(3, 1, 1, 5, 'I love this ring! It is so beautiful and sparkly.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL),
	(4, 1, 2, 4, 'This ring is very nice but a bit too expensive for me.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL),
	(5, 1, 3, 3, 'The ring is okay but the color is not what I expected.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL),
	(6, 1, 4, 2, 'I don’t like this ring at all. It looks cheap and fake.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL),
	(7, 1, 5, 1, 'This ring is terrible! It broke after one week of wearing it.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL),
	(8, 2, 6, 5, 'This necklace is amazing! It is so elegant and classy.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL),
	(9, 2, 7, 4, 'This necklace is pretty but a bit too long for me.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL),
	(10, 2, 8, 3, 'The necklace is fine but the pearls are not very shiny.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL),
	(17, 2, 9, 2, 'I hate this necklace! It is so heavy and uncomfortable.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL),
	(18, 2, 10, 1, 'This necklace is awful! It gave me a rash on my neck.', '2023-06-04 13:14:09', '2023-06-04 13:14:09', NULL);

-- 导出  表 swetelove.settings 结构
CREATE TABLE IF NOT EXISTS `cadon_stunring_settings` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设置代码',
  `value` json DEFAULT NULL COMMENT '设置值',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间戳',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  swetelove.settings 的数据：~0 rows (大约)
DELETE FROM `cadon_stunring_settings`;
INSERT INTO `cadon_stunring_settings` (`id`, `code`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'filter', '{"price": [{"label": "0.00-50.00", "value": "0-50"}, {"label": "50.00-100.00", "value": "50-100"}, {"label": "100.00-150.00", "value": "100-150"}, {"label": "150.00-200.00", "value": "150-200"}, {"label": "200.00-250.00", "value": "200-250"}, {"label": "250.00-300.00", "value": "250-300"}, {"label": "300.00-350.00", "value": "300-350"}, {"label": "350.00-400.00", "value": "350-400"}, {"label": "400.00-450.00", "value": "400-450"}, {"label": "600.00 and above", "value": "600-9999"}], "style": [{"label": "Classic", "value": "classic"}, {"label": "Vintage", "value": "vintage"}, {"label": "Cocktail Rings", "value": "cocktail_rings"}, {"label": "Anniversary", "value": "anniversary"}, {"label": "Art Deco", "value": "art_deco"}, {"label": "Heart", "value": "heart"}, {"label": "Knot, Bowknot, Rope", "value": "knot_bowknot_rope"}, {"label": "Solitaire", "value": "solitaire"}, {"label": "Eternity", "value": "eternity"}, {"label": "Half Eternity", "value": "half_eternity"}, {"label": "Halo", "value": "halo"}, {"label": "Three Stone", "value": "three_stone"}, {"label": "Multi Row", "value": "multi_row"}, {"label": "Single Row", "value": "single_row"}, {"label": "Split Shank", "value": "split_shank"}, {"label": "Promise Rings", "value": "promise_rings"}, {"label": "Trio Wedding Sets", "value": "trio_wedding_sets"}, {"label": "Skull", "value": "skull"}, {"label": "Animal", "value": "animal"}, {"label": "Nature", "value": "nature"}], "occasion": [{"label": "Valentine\'s Day", "value": "valentines_day"}, {"label": "Mother\'s Day", "value": "mothers_day"}, {"label": "Father\'s Day", "value": "fathers_day"}, {"label": "Birthday", "value": "birthday"}, {"label": "Thanksgiving Day", "value": "thanksgiving_day"}, {"label": "Merry Christmas", "value": "merry_christmas"}, {"label": "Halloween", "value": "halloween"}, {"label": "Graduation", "value": "graduation"}], "recipient": [{"label": "For Her", "value": "for_her"}, {"label": "For Him", "value": "for_him"}, {"label": "For Mom", "value": "for_mom"}, {"label": "For Dad", "value": "for_dad"}, {"label": "For Kids", "value": "for_kids"}, {"label": "For Friends", "value": "for_friends"}, {"label": "For Couples", "value": "for_couples"}], "stone_cut": [{"label": "Round", "value": "round"}, {"label": "Oval", "value": "oval"}, {"label": "Cushion", "value": "cushion"}, {"label": "Emerald", "value": "emerald"}, {"label": "Pear", "value": "pear"}, {"label": "Heart", "value": "heart"}, {"label": "Radiant", "value": "radiant"}, {"label": "Asscher", "value": "asscher"}, {"label": "Baguette", "value": "baguette"}, {"label": "Triangle", "value": "triangle"}, {"label": "Marquise", "value": "marquise"}, {"label": "Princess", "value": "princess"}], "carat_range": [{"label": "0-1.00", "value": "0-1"}, {"label": "1.00-1.50", "value": "1-1.5"}, {"label": "1.50-2.00", "value": "1.5-2"}, {"label": "2.00-3.00", "value": "2-3"}, {"label": "3.00-4.00", "value": "3-4"}, {"label": "4.00 and above", "value": "4-1000"}], "stone_color": [{"label": "White", "value": "white"}, {"label": "Ruby Red", "value": "ruby_red"}, {"label": "Aquamarine Blue", "value": "aquamarine_blue"}, {"label": "Sapphire Blue", "value": "sapphire_blue"}, {"label": "Blue Topaz", "value": "blue_topaz"}, {"label": "Emerald Green", "value": "emerald_green"}, {"label": "Peridot Green", "value": "peridot_green"}, {"label": "Fancy Pink", "value": "fancy_pink"}, {"label": "Yellow", "value": "yellow"}, {"label": "Multicolor", "value": "multicolor"}, {"label": "Champagne Morganite", "value": "champagne_morganite"}, {"label": "Black", "value": "black"}, {"label": "Orange", "value": "orange"}, {"label": "Amethyst Purple", "value": "amethyst_purple"}, {"label": "Chocolate", "value": "chocolate"}, {"label": "Watermelon", "value": "watermelon"}, {"label": "Pearl", "value": "pearl"}], "plating_color": [{"label": "Platinum", "value": "platinum"}, {"label": "Yellow Gold", "value": "yellow_gold"}, {"label": "Rose Gold", "value": "rose_gold"}, {"label": "Black", "value": "black"}, {"label": "Two Tone", "value": "two_tone"}]}', '2023-06-15 06:47:39', '2023-06-15 16:21:10');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;