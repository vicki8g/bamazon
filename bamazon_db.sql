-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.11-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for bamazon_db
CREATE DATABASE IF NOT EXISTS `bamazon_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bamazon_db`;


-- Dumping structure for table bamazon_db.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(50) NOT NULL,
  `DepartmentName` varchar(30) NOT NULL,
  `Price` decimal(8,2) DEFAULT NULL,
  `StockQuantity` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table bamazon_db.products: ~8 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `ProductName`, `DepartmentName`, `Price`, `StockQuantity`) VALUES
	(1, 'Pink Flamingo', 'Outdoors', 10.00, 9),
	(2, 'Linen Loveseat', 'Home Decor', 600.00, 3),
	(3, '36" HD Flatscreen TV', 'Electronics', 580.00, 7),
	(4, 'Original Pac Man Video Game', 'Electronics', 25.00, 9),
	(5, 'Harry Josh Hair Dryer', 'Beauty', 290.00, 2),
	(6, 'Hand-Woven Hammock', 'Outdoors', 65.00, 7),
	(7, 'Longhorn Sweatshirt', 'Apparel', 35.00, 9),
	(9, 'Lord of the Rings Monopoly', 'Entertainment', 32.00, 4),
	(10, 'Russian Oak Dining Table', 'Home Decor', 999.00, 1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
