-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: flight
-- ------------------------------------------------------
-- Server version	8.0.24
CREATE DATABASE flight /*!40100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE flight;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chuyenbay`
--

DROP TABLE IF EXISTS `chuyenbay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chuyenbay` (
  `maChuyenBay` int NOT NULL,
  `thoiGianBay` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `thoiGianDung` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `noiDi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'HCM',
  `noiDen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'HN',
  `soHieuMayBay` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sanBayTrungGian` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`maChuyenBay`),
  KEY `FK_chuyenbay_sanBayTrungGian_idx` (`sanBayTrungGian`),
  KEY `FK_chuyenbay_noiDi_idx` (`noiDi`),
  KEY `FK_chuyenbay_noiDen_idx` (`noiDen`),
  KEY `FK_chuyenbay_soHieuMayBay_idx` (`soHieuMayBay`),
  KEY `FK_chuyenbay_maChuyenBay_idx` (`maChuyenBay`),
  CONSTRAINT `FK_chuyenbay_noiDen` FOREIGN KEY (`noiDen`) REFERENCES `sanbay` (`diaDiem`),
  CONSTRAINT `FK_chuyenbay_noiDi` FOREIGN KEY (`noiDi`) REFERENCES `sanbay` (`diaDiem`),
  CONSTRAINT `FK_chuyenbay_sanBayTrungGian` FOREIGN KEY (`sanBayTrungGian`) REFERENCES `sanbay` (`maSanBay`),
  CONSTRAINT `FK_chuyenbay_soHieuMayBay` FOREIGN KEY (`soHieuMayBay`) REFERENCES `maybay` (`soHieuMayBay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuyenbay`
--

LOCK TABLES `chuyenbay` WRITE;
/*!40000 ALTER TABLE `chuyenbay` DISABLE KEYS */;
INSERT INTO `chuyenbay` VALUES (1,'2020-05-20 07:00:00','2020-05-20 12:00:00','HCM','HN','AB1',NULL),(2,'2020-06-25 17:00:00','2020-06-27 20:00:00','HN','HCM','YZ5',NULL);
/*!40000 ALTER TABLE `chuyenbay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghe`
--

DROP TABLE IF EXISTS `ghe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghe` (
  `maGhe` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trangThai` tinyint(1) NOT NULL,
  `hangGhe` enum('Hạng 1','Hạng 2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Hạng 2',
  PRIMARY KEY (`maGhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghe`
--

LOCK TABLES `ghe` WRITE;
/*!40000 ALTER TABLE `ghe` DISABLE KEYS */;
INSERT INTO `ghe` VALUES ('1',1,'Hạng 1'),('2',1,'Hạng 2');
/*!40000 ALTER TABLE `ghe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `maKH` int NOT NULL,
  `tenKH` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sdt` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`maKH`),
  KEY `FK_khachhang_maKH_idx` (`maKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (1,'test',NULL,NULL),(2,'test2',NULL,NULL);
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaitk`
--

DROP TABLE IF EXISTS `loaitk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaitk` (
  `id` int NOT NULL,
  `tk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_id_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaitk`
--

LOCK TABLES `loaitk` WRITE;
/*!40000 ALTER TABLE `loaitk` DISABLE KEYS */;
INSERT INTO `loaitk` VALUES (1,'Nhân Viên'),(2,'Khách Hàng');
/*!40000 ALTER TABLE `loaitk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maybay`
--

DROP TABLE IF EXISTS `maybay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maybay` (
  `soHieuMayBay` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hangBay` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`soHieuMayBay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maybay`
--

LOCK TABLES `maybay` WRITE;
/*!40000 ALTER TABLE `maybay` DISABLE KEYS */;
INSERT INTO `maybay` VALUES ('AB1','VN'),('YZ5','UK');
/*!40000 ALTER TABLE `maybay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maybay_ghe`
--

DROP TABLE IF EXISTS `maybay_ghe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maybay_ghe` (
  `soHieuMayBay` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maGhe` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soGheHang1` int NOT NULL,
  `soGheHang2` int NOT NULL,
  PRIMARY KEY (`soHieuMayBay`,`maGhe`),
  KEY `FK_maybay_ghe_soHieuMayBay_idx` (`soHieuMayBay`),
  KEY `FK_maybay_ghe_maGhe_idx` (`maGhe`),
  CONSTRAINT `FK_maybay_ghe_maGhe` FOREIGN KEY (`maGhe`) REFERENCES `ghe` (`maGhe`),
  CONSTRAINT `FK_maybay_ghe_soHieuMayBay` FOREIGN KEY (`soHieuMayBay`) REFERENCES `maybay` (`soHieuMayBay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maybay_ghe`
--

LOCK TABLES `maybay_ghe` WRITE;
/*!40000 ALTER TABLE `maybay_ghe` DISABLE KEYS */;
INSERT INTO `maybay_ghe` VALUES ('AB1','1',20,21),('YZ5','2',10,16);
/*!40000 ALTER TABLE `maybay_ghe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieudatcho`
--

DROP TABLE IF EXISTS `phieudatcho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieudatcho` (
  `maPhieu` int NOT NULL,
  `maVe` int NOT NULL,
  `maKH` int NOT NULL,
  `ngayDatVe` datetime NOT NULL,
  PRIMARY KEY (`maPhieu`),
  KEY `FK_phieudatcho_maVe_idx` (`maVe`),
  KEY `FK_phieudatcho_maKH_idx` (`maKH`),
  CONSTRAINT `FK_phieudatcho_maKH` FOREIGN KEY (`maKH`) REFERENCES `khachhang` (`maKH`),
  CONSTRAINT `FK_phieudatcho_maVe` FOREIGN KEY (`maVe`) REFERENCES `vemaybay` (`maVe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieudatcho`
--

LOCK TABLES `phieudatcho` WRITE;
/*!40000 ALTER TABLE `phieudatcho` DISABLE KEYS */;
INSERT INTO `phieudatcho` VALUES (1,1,1,'2021-03-20 05:50:00'),(2,2,2,'2021-01-30 09:40:00');
/*!40000 ALTER TABLE `phieudatcho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanbay`
--

DROP TABLE IF EXISTS `sanbay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanbay` (
  `maSanBay` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenSanBay` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diaDiem` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quocGia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trangThai` tinyint(1) NOT NULL,
  PRIMARY KEY (`maSanBay`),
  KEY `FK_sanbay_diaDiem` (`diaDiem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanbay`
--

LOCK TABLES `sanbay` WRITE;
/*!40000 ALTER TABLE `sanbay` DISABLE KEYS */;
INSERT INTO `sanbay` VALUES ('1','TSN','HCM','VN',1),('2','MB','HN','VN',1);
/*!40000 ALTER TABLE `sanbay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanbay_maybay`
--

DROP TABLE IF EXISTS `sanbay_maybay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanbay_maybay` (
  `maSanBay` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soHieuMayBay` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngayDauTaiSanBay` datetime NOT NULL,
  PRIMARY KEY (`maSanBay`,`soHieuMayBay`),
  KEY `FK_sanbay_maybay_maSanBay_idx` (`maSanBay`),
  KEY `FK_sanbay_maybay_soHieuMayBay_idx` (`soHieuMayBay`),
  CONSTRAINT `FK_sanbay_maybay_maSanBay` FOREIGN KEY (`maSanBay`) REFERENCES `sanbay` (`maSanBay`),
  CONSTRAINT `FK_sanbay_maybay_soHieuMayBay` FOREIGN KEY (`soHieuMayBay`) REFERENCES `maybay` (`soHieuMayBay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanbay_maybay`
--

LOCK TABLES `sanbay_maybay` WRITE;
/*!40000 ALTER TABLE `sanbay_maybay` DISABLE KEYS */;
INSERT INTO `sanbay_maybay` VALUES ('1','AB1','2021-03-20 05:50:00'),('2','YZ5','2021-01-01 20:30:00');
/*!40000 ALTER TABLE `sanbay_maybay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `hoTen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenTK` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matKhau` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trangThai` tinyint(1) NOT NULL DEFAULT '1',
  `idLoaiTK` int NOT NULL,
  `diaChi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sdt` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users_id_idx` (`id`),
  KEY `FK_users_idLoaiTK_idx` (`idLoaiTK`),
  CONSTRAINT `FK_users_loaiTK` FOREIGN KEY (`idLoaiTK`) REFERENCES `loaitk` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Test','testnv','1234',1,1,NULL,NULL),(2,'Test','testkh','1234',1,2,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vemaybay`
--

DROP TABLE IF EXISTS `vemaybay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vemaybay` (
  `maVe` int NOT NULL,
  `hangVe` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `giaVe` float NOT NULL,
  `maGhe` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngayXuatVe` datetime NOT NULL,
  `maNguoiDat` int NOT NULL,
  `maKH` int NOT NULL,
  `maChuyenBay` int NOT NULL,
  PRIMARY KEY (`maVe`),
  KEY `FK_vemaybay_maGhe_idx` (`maGhe`),
  KEY `FK_vemaybay_maChuyenBay_idx` (`maChuyenBay`),
  KEY `FK_vemaybay_maKH_idx` (`maKH`),
  KEY `FK_vemaybay_maNguoiDat_idx` (`maNguoiDat`),
  KEY `FK_vemaybay_maVe_idx` (`maVe`),
  CONSTRAINT `FK_vemaybay_maChuyenBay` FOREIGN KEY (`maChuyenBay`) REFERENCES `chuyenbay` (`maChuyenBay`),
  CONSTRAINT `FK_vemaybay_maGhe` FOREIGN KEY (`maGhe`) REFERENCES `ghe` (`maGhe`),
  CONSTRAINT `FK_vemaybay_maKH` FOREIGN KEY (`maKH`) REFERENCES `khachhang` (`maKH`),
  CONSTRAINT `FK_vemaybay_maNguoiDat` FOREIGN KEY (`maNguoiDat`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vemaybay`
--

LOCK TABLES `vemaybay` WRITE;
/*!40000 ALTER TABLE `vemaybay` DISABLE KEYS */;
INSERT INTO `vemaybay` VALUES (1,'1',20,'1','2021-03-20 05:50:00',1,1,1),(2,'2',10,'2','2021-03-10 22:20:21',2,2,2);
/*!40000 ALTER TABLE `vemaybay` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-26  3:08:47
