-- -------------------------------------------------------------
-- TablePlus 2.10(268)
--
-- https://tableplus.com/
--
-- Database: test
-- Generation Time: 2020-07-04 11:08:45.2200
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `io_pdf_table`;
CREATE TABLE `io_pdf_table` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '列表名',
  `editable` tinyint(1) DEFAULT NULL COMMENT '可编辑',
  `type` varchar(50) DEFAULT NULL COMMENT '类别(api 或 statistics)',
  `api` varchar(255) DEFAULT NULL COMMENT '绑定api',
  `api_field` varchar(255) DEFAULT NULL COMMENT 'api 中字段',
  `api_list` varchar(255) DEFAULT NULL COMMENT 'api 中的列表字段',
  `header_field` varchar(255) DEFAULT NULL COMMENT 'api返回数据的键值',
  `field` varchar(50) DEFAULT NULL COMMENT '自动报表的field',
  `template_content` text COMMENT '模版内容',
  `origin_config` text COMMENT '前端模版内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

