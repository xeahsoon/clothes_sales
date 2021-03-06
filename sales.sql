-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sales_db
-- ------------------------------------------------------
-- Server version	5.7.17-log

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

--
-- Table structure for table `good`
--

DROP TABLE IF EXISTS `good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '款号',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `fabric` varchar(20) NOT NULL,
  `price` double(6,2) NOT NULL COMMENT '价格',
  `picture` varchar(15) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18040002 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good`
--

LOCK TABLES `good` WRITE;
/*!40000 ALTER TABLE `good` DISABLE KEYS */;
INSERT INTO `good` VALUES (17020101,'T恤','95%棉+5%氨纶',99.00,'17020101.jpg'),(17020102,'T恤','100%棉',145.00,''),(17020201,'衬衫','100%棉',125.00,''),(17021101,'短裤','100%棉',110.00,''),(17021102,'短裤','100%棉',105.00,''),(17021201,'长裤','100%棉',199.00,'17021201.jpg'),(17202010,'长裤','100%棉',225.00,''),(17207003,'风衣','100%棉',99.00,''),(18030020,'外套','100%棉',259.00,NULL),(18032020,'长裤','100%棉',259.00,NULL),(18033020,'鞋子','100%棉布面+胶底',436.00,NULL),(18040001,'鞋子','100%棉',439.00,NULL);
/*!40000 ALTER TABLE `good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good_color`
--

DROP TABLE IF EXISTS `good_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `good_id` int(8) NOT NULL COMMENT '商品编号',
  `good_color` varchar(8) NOT NULL COMMENT '商品颜色',
  PRIMARY KEY (`id`),
  KEY `fk_gc_good` (`good_id`),
  CONSTRAINT `fk_gc_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good_color`
--

LOCK TABLES `good_color` WRITE;
/*!40000 ALTER TABLE `good_color` DISABLE KEYS */;
INSERT INTO `good_color` VALUES (1,17020101,'黑色'),(2,17020101,'白色'),(3,17020101,'绿色'),(4,17020101,'粉色'),(5,17020101,'灰色'),(24,18033020,'白色'),(25,18033020,'蓝色'),(26,18030020,'黑色'),(27,18030020,'蓝色'),(28,18030020,'浅蓝色'),(29,17207003,'军绿色'),(30,17207003,'蓝色'),(31,17207003,'藏青色'),(38,17202010,'黑色'),(39,17202010,'蓝色'),(40,17202010,'棕色'),(41,17021201,'黑色'),(42,17021201,'军绿色'),(43,17021201,'藏青色'),(44,17021201,'棕色'),(45,17021102,'黑色'),(46,17021102,'浅灰色'),(47,17021102,'军绿色'),(48,17020201,'白色'),(49,17020201,'粉色'),(50,17020201,'浅蓝色'),(51,17021101,'黑色'),(52,17021101,'灰色'),(53,17021101,'浅灰色'),(54,17021101,'藏青色'),(55,18032020,'黑色'),(56,18032020,'灰色'),(57,18032020,'浅灰色'),(58,18032020,'军绿色'),(59,18032020,'藏青色'),(60,18040001,'黑色'),(61,18040001,'白色'),(62,18040001,'红色'),(63,17020102,'黑色'),(64,17020102,'白色'),(65,17020102,'灰色');
/*!40000 ALTER TABLE `good_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good_size`
--

DROP TABLE IF EXISTS `good_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `good_id` int(8) NOT NULL COMMENT '商品编号',
  `good_size` varchar(4) NOT NULL COMMENT '商品尺码',
  PRIMARY KEY (`id`),
  KEY `good_id` (`good_id`),
  CONSTRAINT `fk_gs_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good_size`
--

LOCK TABLES `good_size` WRITE;
/*!40000 ALTER TABLE `good_size` DISABLE KEYS */;
INSERT INTO `good_size` VALUES (1,17020101,'S'),(2,17020101,'M'),(3,17020101,'L'),(4,17020101,'XL'),(5,17020101,'XXL'),(31,18033020,'38'),(32,18033020,'39'),(33,18033020,'40'),(34,18033020,'41'),(35,18033020,'42'),(36,18033020,'43'),(37,18030020,'S'),(38,18030020,'M'),(39,18030020,'L'),(40,18030020,'XL'),(41,18030020,'XXL'),(46,17207003,'S'),(47,17207003,'M'),(48,17207003,'L'),(49,17207003,'XL'),(62,17202010,'28'),(63,17202010,'29'),(64,17202010,'30'),(65,17202010,'31'),(66,17202010,'32'),(67,17202010,'33'),(68,17202010,'34'),(69,17202010,'35'),(70,17202010,'36'),(71,17021201,'28'),(72,17021201,'29'),(73,17021201,'30'),(74,17021201,'31'),(75,17021201,'32'),(76,17021201,'33'),(77,17021201,'34'),(78,17021201,'35'),(79,17021201,'36'),(80,17021102,'28'),(81,17021102,'29'),(82,17021102,'30'),(83,17021102,'31'),(84,17021102,'32'),(85,17021102,'34'),(86,17021102,'36'),(87,17020201,'M'),(88,17020201,'L'),(89,17020201,'XL'),(90,17020201,'XXL'),(91,17020201,'XXXL'),(92,17021101,'28'),(93,17021101,'29'),(94,17021101,'30'),(95,17021101,'31'),(96,17021101,'32'),(97,17021101,'34'),(98,17021101,'36'),(99,18032020,'28'),(100,18032020,'29'),(101,18032020,'30'),(102,18032020,'31'),(103,18032020,'32'),(104,18032020,'33'),(105,18032020,'34'),(106,18032020,'36'),(107,18040001,'38'),(108,18040001,'39'),(109,18040001,'40'),(110,18040001,'41'),(111,18040001,'42'),(112,18040001,'43'),(113,17020102,'S'),(114,17020102,'M'),(115,17020102,'L'),(116,17020102,'XL'),(117,17020102,'XXL');
/*!40000 ALTER TABLE `good_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loginname` varchar(8) NOT NULL COMMENT '登录名',
  `password` varchar(12) NOT NULL COMMENT '密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_loginname` (`loginname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'admin','admin','管理员');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(13) NOT NULL COMMENT '会员卡号',
  `name` varchar(20) NOT NULL COMMENT '会员姓名',
  `birthday` date NOT NULL COMMENT '会员生日',
  `discount` double(4,2) NOT NULL DEFAULT '1.00' COMMENT '会员折扣',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '会员积分',
  `intime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入会时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'13257453246','张三','2017-12-12',1.00,0,'2017-12-26 00:41:45'),(2,'13578907894','李四','2017-12-12',1.00,0,'2017-12-26 00:41:45'),(3,'13213414143','王五','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(4,'15270926232','谢松','1996-07-11',0.75,500,'2017-12-26 00:41:45'),(5,'17234245234','熊铨叙','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(6,'15521342349','吴超忠','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(7,'18624242234','许建雄','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(8,'13223535643','占柳剑','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(9,'15290734505','胡竞宇','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(10,'15723452890','余文涛','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(11,'18529004523','饶海明','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(12,'13804562356','卢从发','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(18,'12314123132','测试','1994-07-13',1.00,483,'2017-12-26 06:24:34'),(20,'18812386791','尹婷','2005-04-24',0.75,1125,'2017-12-28 03:18:13');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '订单主键',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单日期',
  `print_count` int(11) NOT NULL DEFAULT '1' COMMENT '打印统计',
  `nums` int(11) NOT NULL DEFAULT '0' COMMENT '订单总件数',
  `sum_money` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '订单总金额',
  `pay_mode` int(11) NOT NULL DEFAULT '0' COMMENT '支付方式（1/银行卡 2/支付宝 3/微信 4/现金）',
  `remark` text COMMENT '订单备注',
  `user_id` int(4) unsigned zerofill NOT NULL COMMENT '收银员',
  `member_id` int(11) unsigned DEFAULT NULL COMMENT '会员卡号',
  `return_flag` int(11) DEFAULT '0' COMMENT '退货标记',
  `return_date` timestamp NULL DEFAULT NULL COMMENT '退货日期',
  PRIMARY KEY (`id`),
  KEY `fk_order_user` (`user_id`),
  KEY `fk_order_member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (2,'2017-11-23 05:27:32',2,0,0.00,3,'顾客明天下午四点到店自提，经手人：小明',0003,2,1,'2018-03-08 01:45:33'),(3,'2018-02-02 02:06:34',3,2,89.10,1,'',0004,5,1,'2018-03-08 01:14:04'),(6,'2018-02-05 08:38:20',1,1,99.00,3,'这只是一条测试信息',0004,4,0,NULL),(7,'2018-02-05 08:39:49',3,2,486.00,2,'活动：三件75折',0004,4,1,NULL),(8,'2018-02-06 02:12:29',4,1,84.15,3,'我是备注哈哈\nha哈哈哈哈',0004,NULL,0,NULL),(9,'2018-03-01 08:05:49',2,1,373.15,3,'欢迎光临MyClothes',0004,NULL,0,NULL),(11,'2018-03-09 06:33:02',1,3,222.75,3,'',0004,20,0,NULL),(12,'2018-03-23 06:16:42',1,4,678.75,4,'',0005,20,0,NULL),(13,'2018-03-23 08:05:48',1,3,483.00,3,'',0001,18,0,NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(8) NOT NULL COMMENT '订单号',
  `storage_id` int(11) NOT NULL COMMENT '条形码',
  `good_id` int(8) NOT NULL COMMENT '款号',
  `color` varchar(8) NOT NULL COMMENT '颜色',
  `size` varchar(4) NOT NULL COMMENT '大小',
  `price` double(6,2) NOT NULL COMMENT '单价',
  `discount` double(4,2) NOT NULL DEFAULT '1.00' COMMENT '折扣',
  `dis_price` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '折后价',
  `return_flag` int(11) DEFAULT '0' COMMENT '退货标记',
  PRIMARY KEY (`id`),
  KEY `fk_od_order` (`order_id`),
  KEY `fk_od_good` (`good_id`),
  CONSTRAINT `fk_od_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`),
  CONSTRAINT `fk_od_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (3,2,2,17020101,'红色','XL',99.00,1.00,99.00,1),(4,3,4,17020101,'白色','S',99.00,0.30,29.70,0),(5,3,5,17020101,'白色','S',99.00,1.00,99.00,1),(6,3,6,17020101,'BLACK','XXL',99.00,0.60,59.40,0),(7,3,7,17020101,'BLACK','XXL',99.00,1.00,99.00,1),(8,6,8,17020101,'黑色','M',99.00,1.00,99.00,0),(9,7,9,17020101,'白色','XXL',99.00,0.75,74.25,0),(10,7,10,17021101,'蓝色','30',110.00,0.75,82.50,1),(11,7,11,18040001,'白色','41',439.00,0.75,329.25,0),(12,8,12,17020101,'蓝色','XXXL',99.00,0.85,84.15,0),(13,9,14,18040001,'白色','40',439.00,0.85,373.15,0),(15,11,2,17020101,'红色','XL',99.00,0.75,74.25,0),(16,11,5,17020101,'白色','S',99.00,0.75,74.25,0),(17,11,7,17020101,'BLACK','XXL',99.00,0.75,74.25,0),(18,12,2,18033020,'白色','38',436.00,0.75,327.00,0),(19,12,3,17207003,'军绿色','XL',99.00,0.75,74.25,0),(20,12,5,17020102,'灰色','XXL',145.00,0.75,108.75,0),(21,12,7,17202010,'黑色','28',225.00,0.75,168.75,0),(22,13,15,17020101,'黑色','S',99.00,1.00,99.00,0),(23,13,17,17020201,'白色','M',125.00,1.00,125.00,0),(24,13,23,18030020,'黑色','S',259.00,1.00,259.00,0);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_staff`
--

DROP TABLE IF EXISTS `order_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(8) NOT NULL COMMENT '订单号',
  `staff_id` int(4) NOT NULL COMMENT '员工编号',
  PRIMARY KEY (`id`),
  KEY `fk_os_order` (`order_id`),
  KEY `fk_os_staff` (`staff_id`),
  CONSTRAINT `fk_os_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `fk_os_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_staff`
--

LOCK TABLES `order_staff` WRITE;
/*!40000 ALTER TABLE `order_staff` DISABLE KEYS */;
INSERT INTO `order_staff` VALUES (3,2,1),(6,2,3),(7,3,1),(8,3,2),(9,3,3),(15,6,6),(16,7,3),(17,7,6),(18,8,3),(19,8,6),(20,9,3),(22,11,3),(23,12,1),(24,12,5),(25,13,2),(26,13,4);
/*!40000 ALTER TABLE `order_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_temp`
--

DROP TABLE IF EXISTS `order_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `storage_id` int(11) NOT NULL COMMENT '条形码',
  `good_id` int(8) NOT NULL COMMENT '款号',
  `color` varchar(8) NOT NULL COMMENT '颜色',
  `size` varchar(4) NOT NULL COMMENT '尺码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ot_storage_id` (`storage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_temp`
--

LOCK TABLES `order_temp` WRITE;
/*!40000 ALTER TABLE `order_temp` DISABLE KEYS */;
INSERT INTO `order_temp` VALUES (95,1,17020101,'黑色','M'),(96,4,17020101,'黑色','S');
/*!40000 ALTER TABLE `order_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(10) NOT NULL COMMENT '员工姓名',
  `phone` varchar(12) DEFAULT NULL COMMENT '手机号码',
  `idcard` varchar(18) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '审核状态（0/待审核 1/已审核）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'小黑','13279475234','368729199211084328','江西省九江市浔阳区沿江路***小区18栋1502',1),(2,'倩倩','15279475235','328729198806234327','江西省九江市浔阳区沿江路***小区16栋1502',1),(3,'松子','13279475236','468729199302134326','江西省九江市浔阳区沿江路***小区14栋1502',1),(4,'景云','15279475237','358729199012254325','江西省九江市浔阳区沿江路***小区14栋1502',1),(5,'小霞','18279475238','228729199411244324','江西省九江市浔阳区沿江路***小区12栋1502',1),(6,'婷婷','17279475234','348729199504244323','江西省九江市浔阳区沿江路***小区10栋1101',1),(7,'test','13257028730','1231123','City.Test Road.Test',0),(8,'测试1','123','132511','电费根深蒂固',0),(9,'测试2','123','','',0),(11,'测试23','1234','','',0),(15,'11111','131231231','','',0),(16,'13123','124124234','','',0);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_effort`
--

DROP TABLE IF EXISTS `staff_effort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_effort` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `staff_id` int(4) NOT NULL COMMENT '员工编号',
  `effort` double NOT NULL DEFAULT '0' COMMENT '员工业绩',
  PRIMARY KEY (`id`),
  KEY `fk_se_staff` (`staff_id`),
  CONSTRAINT `fk_se_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_effort`
--

LOCK TABLES `staff_effort` WRITE;
/*!40000 ALTER TABLE `staff_effort` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_effort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '条形码',
  `good_id` int(8) NOT NULL COMMENT '款号',
  `color` varchar(8) NOT NULL COMMENT '颜色',
  `size` varchar(4) NOT NULL COMMENT '大小',
  `check_flag` int(11) NOT NULL DEFAULT '0' COMMENT '盘点标记',
  PRIMARY KEY (`id`),
  KEY `fk_storage_good` (`good_id`),
  CONSTRAINT `fk_storage_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (00000000001,17020101,'黑色','M',1),(00000000004,17020101,'黑色','S',1),(00000000006,17020102,'灰色','XL',1),(00000000008,17202010,'黑色','29',1),(00000000009,17202010,'黑色','30',1),(00000000010,17202010,'黑色','31',1),(00000000011,17202010,'黑色','31',0),(00000000012,17202010,'黑色','32',0),(00000000013,18040001,'白色','40',0),(00000000014,18040001,'黑色','39',0),(00000000016,17020102,'黑色','S',0),(00000000018,17021101,'黑色','28',0),(00000000019,17021102,'黑色','28',0),(00000000020,17021201,'黑色','28',0),(00000000021,17202010,'黑色','28',0),(00000000022,17207003,'军绿色','S',0),(00000000024,18032020,'黑色','28',0),(00000000025,18033020,'白色','38',0),(00000000026,18040001,'黑色','38',0),(00000000123,17020101,'黑色','S',0),(00000000124,17020102,'黑色','S',0);
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storagein`
--

DROP TABLE IF EXISTS `storagein`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storagein` (
  `id` int(6) NOT NULL AUTO_INCREMENT COMMENT '进货单主键',
  `user_id` int(4) NOT NULL COMMENT '操作用户',
  `nums` int(11) NOT NULL COMMENT '件数',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storagein`
--

LOCK TABLES `storagein` WRITE;
/*!40000 ALTER TABLE `storagein` DISABLE KEYS */;
INSERT INTO `storagein` VALUES (1,5,3,'2018-03-21 06:23:54'),(2,5,9,'2018-03-21 07:43:39'),(3,1,12,'2018-03-23 08:02:31'),(4,5,2,'2018-04-02 06:40:09');
/*!40000 ALTER TABLE `storagein` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storagein_detail`
--

DROP TABLE IF EXISTS `storagein_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storagein_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `storagein_id` int(6) NOT NULL COMMENT '入库单号',
  `storage_id` int(11) NOT NULL COMMENT '条形码',
  `good_id` int(8) NOT NULL COMMENT '款号',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `color` varchar(8) NOT NULL COMMENT '颜色',
  `size` varchar(4) NOT NULL COMMENT '尺码',
  PRIMARY KEY (`id`),
  KEY `fk_sid_storagein` (`storagein_id`),
  CONSTRAINT `fk_sid_storagein` FOREIGN KEY (`storagein_id`) REFERENCES `storagein` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storagein_detail`
--

LOCK TABLES `storagein_detail` WRITE;
/*!40000 ALTER TABLE `storagein_detail` DISABLE KEYS */;
INSERT INTO `storagein_detail` VALUES (1,1,1,17020101,'T恤','黑色','M'),(2,1,2,17020101,'T恤','红色','XL'),(3,1,3,17207003,'风衣','军绿色','XL'),(4,2,4,17020101,'T恤','白色','S'),(5,2,5,17020101,'T恤','白色','S'),(6,2,6,17020101,'T恤','BLACK','XXL'),(7,2,7,17020101,'T恤','BLACK','XXL'),(8,2,8,17020101,'T恤','黑色','M'),(9,2,9,17020101,'T恤','白色','XXL'),(10,2,10,17021101,'短裤','蓝色','30'),(11,2,11,18040001,'鞋子','白色','41'),(12,2,12,17020101,'T恤','蓝色','XXXL'),(13,3,15,17020101,'T恤','黑色','S'),(14,3,16,17020102,'T恤','黑色','S'),(15,3,17,17020201,'衬衫','白色','M'),(16,3,18,17021101,'短裤','黑色','28'),(17,3,19,17021102,'短裤','黑色','28'),(18,3,20,17021201,'长裤','黑色','28'),(19,3,21,17202010,'长裤','黑色','28'),(20,3,22,17207003,'风衣','军绿色','S'),(21,3,23,18030020,'外套','黑色','S'),(22,3,24,18032020,'长裤','黑色','28'),(23,3,25,18033020,'鞋子','白色','38'),(24,3,26,18040001,'鞋子','黑色','38'),(25,4,123,17020101,'T恤','黑色','S'),(26,4,124,17020102,'T恤','黑色','S');
/*!40000 ALTER TABLE `storagein_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storagein_temp`
--

DROP TABLE IF EXISTS `storagein_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storagein_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `storage_id` int(11) NOT NULL COMMENT '条形码',
  `good_id` int(8) NOT NULL COMMENT '款号',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `color` varchar(8) NOT NULL COMMENT '颜色',
  `size` varchar(4) NOT NULL COMMENT '大小',
  `price` double(6,2) NOT NULL COMMENT '价格',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_sit_storage_id` (`storage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storagein_temp`
--

LOCK TABLES `storagein_temp` WRITE;
/*!40000 ALTER TABLE `storagein_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `storagein_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loginname` varchar(8) NOT NULL COMMENT '登录名',
  `password` varchar(12) NOT NULL COMMENT '密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `phone` varchar(12) DEFAULT NULL COMMENT '手机号码',
  `status` int(11) DEFAULT '0' COMMENT '审核状态（0/待审核 1/已审核）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_loginname` (`loginname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'J001','123123','店长1','0792-8316800',1),(2,'J002','123123','店长2','0792-8968366',0),(3,'J003','123123','店长3','0792-8135800',1),(4,'test','test','测试用户','123123',1),(5,'admin','123456','谢松','15270926232',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-02 15:11:30
