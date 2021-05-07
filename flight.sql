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
  `maChuyenBay` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngayGioKhoiHanh` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngayGioDen` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenSanBayDi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenSanBayDen` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soHieuMayBay` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sanBayTrungGian` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`maChuyenBay`),
  KEY `FK_chuyenbay_sanBayTrungGian_idx` (`sanBayTrungGian`),
  KEY `FK_chuyenbay_tenSanBayDi_idx` (`tenSanBayDi`),
  KEY `FK_chuyenbay_tenSanBayDen_idx` (`tenSanBayDen`),
  KEY `FK_chuyenbay_soHieuMayBay_idx` (`soHieuMayBay`),
  KEY `FK_chuyenbay_maChuyenBay_idx` (`maChuyenBay`),
  CONSTRAINT `FK_chuyenbay_sanBayTrungGian` FOREIGN KEY (`sanBayTrungGian`) REFERENCES `sanbay` (`maSanBay`),
  CONSTRAINT `FK_chuyenbay_soHieuMayBay` FOREIGN KEY (`soHieuMayBay`) REFERENCES `maybay` (`soHieuMayBay`),
  CONSTRAINT `FK_chuyenbay_tenSanBayDen` FOREIGN KEY (`tenSanBayDen`) REFERENCES `sanbay` (`tenSanBay`),
  CONSTRAINT `FK_chuyenbay_tenSanBayDi` FOREIGN KEY (`tenSanBayDi`) REFERENCES `sanbay` (`tenSanBay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuyenbay`
--

LOCK TABLES `chuyenbay` WRITE;
/*!40000 ALTER TABLE `chuyenbay` DISABLE KEYS */;
INSERT INTO `chuyenbay` VALUES ('1','07:00:00 2020-05-20','12:00:00 2020-05-20','Mộc Bài','Tân Sơn Nhất','VNA01',NULL),('2','17:00:00 2020-06-25','20:00:00 2020-06-27','Tân Sơn Nhất','Mộc Bài','BA01',NULL);
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
  `hangVe` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maGhe`),
  KEY `FK_ghe_hangVe_idx` (`hangVe`),
  CONSTRAINT `FK_ghe_hangVe` FOREIGN KEY (`hangVe`) REFERENCES `hangve` (`hangVe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghe`
--

LOCK TABLES `ghe` WRITE;
/*!40000 ALTER TABLE `ghe` DISABLE KEYS */;
INSERT INTO `ghe` VALUES ('1',1,'Thương gia'),('2',1,'Phổ thông'),('3',1,'Phổ thông đặc biệt'),('4',1,'Phổ thông đặc biệt');
/*!40000 ALTER TABLE `ghe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giave`
--

DROP TABLE IF EXISTS `giave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giave` (
  `tenSanBayDi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenSanBayDen` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hangBay` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hangVe` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `giaVe` decimal(10,0) NOT NULL,
  PRIMARY KEY (`tenSanBayDi`,`tenSanBayDen`,`hangBay`,`hangVe`),
  KEY `FK_giave_chuyenbay_tenSanBayDi_idx` (`tenSanBayDi`),
  KEY `FK_giave_chuyenbay_tenSanBayDen_idx` (`tenSanBayDen`),
  KEY `FK_giave_maybay_hangBay_idx` (`hangBay`),
  KEY `FK_giave_hangve_hangVe_idx` (`hangVe`),
  KEY `FK_giave_vemaybay_idx` (`giaVe`),
  CONSTRAINT `FK_giave_chuyenbay_tenSanBayDen` FOREIGN KEY (`tenSanBayDen`) REFERENCES `chuyenbay` (`tenSanBayDen`),
  CONSTRAINT `FK_giave_chuyenbay_tenSanBayDi` FOREIGN KEY (`tenSanBayDi`) REFERENCES `chuyenbay` (`tenSanBayDi`),
  CONSTRAINT `FK_giave_hangve_hangVe` FOREIGN KEY (`hangVe`) REFERENCES `hangve` (`hangVe`),
  CONSTRAINT `FK_giave_maybay_hangBay` FOREIGN KEY (`hangBay`) REFERENCES `maybay` (`hangBay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giave`
--

LOCK TABLES `giave` WRITE;
/*!40000 ALTER TABLE `giave` DISABLE KEYS */;
INSERT INTO `giave` VALUES ('Mộc Bài','Tân Sơn Nhất','Bamboo Airways','Phổ thông',90000),('Tân Sơn Nhất','Mộc Bài','Bamboo Airways','Phổ thông',90000),('Mộc Bài','Tân Sơn Nhất','Bamboo Airways','Phổ thông đặc biệt',100000),('Mộc Bài','Tân Sơn Nhất','Vietnam Airlines','Phổ thông',100000),('Tân Sơn Nhất','Mộc Bài','Bamboo Airways','Phổ thông đặc biệt',100000),('Tân Sơn Nhất','Mộc Bài','Vietnam Airlines','Phổ thông',100000),('Mộc Bài','Tân Sơn Nhất','Vietnam Airlines','Phổ thông đặc biệt',120000),('Tân Sơn Nhất','Mộc Bài','Vietnam Airlines','Phổ thông đặc biệt',120000),('Mộc Bài','Tân Sơn Nhất','Bamboo Airways','Thương gia',150000),('Tân Sơn Nhất','Mộc Bài','Bamboo Airways','Thương gia',150000),('Mộc Bài','Tân Sơn Nhất','Vietnam Airlines','Thương gia',200000),('Tân Sơn Nhất','Mộc Bài','Vietnam Airlines','Thương gia',200000);
/*!40000 ALTER TABLE `giave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hangve`
--

DROP TABLE IF EXISTS `hangve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hangve` (
  `id` int NOT NULL,
  `hangVe` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_id_idx` (`id`),
  KEY `FK_hangVe_idx` (`hangVe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hangve`
--

LOCK TABLES `hangve` WRITE;
/*!40000 ALTER TABLE `hangve` DISABLE KEYS */;
INSERT INTO `hangve` VALUES (1,'Phổ thông'),(2,'Phổ thông đặc biệt'),(3,'Thương gia');
/*!40000 ALTER TABLE `hangve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `maKH` int NOT NULL AUTO_INCREMENT,
  `tenKH` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idCard` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sdt` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`tenKH`),
  KEY `FK_khachhang_maKH_idx` (`maKH`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (3,'Lê Thị B','012345678777','lethib@gmail.com','0988775555'),(2,'Nguyễn Thị Diễm M','012345678911','nguyenthidiemm@gmail.com','0345678922'),(4,'Nguyễn Văn A','012345678999','nguyenvana@gmail.com','0988775544'),(1,'Phạm Anh D','012345678910','phamanhdg@gmail.com','0345678921'),(5,'Trần Thị C','012345678888','tranthic@gmail.com','0988775511');
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
  `tk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  PRIMARY KEY (`soHieuMayBay`),
  KEY `FK_maybay_giave_hangBay_idx` (`hangBay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maybay`
--

LOCK TABLES `maybay` WRITE;
/*!40000 ALTER TABLE `maybay` DISABLE KEYS */;
INSERT INTO `maybay` VALUES ('BA01','Bamboo Airways'),('VNA01','Vietnam Airlines');
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
INSERT INTO `maybay_ghe` VALUES ('VNA01','1'),('BA01','2');
/*!40000 ALTER TABLE `maybay_ghe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieudatcho`
--

DROP TABLE IF EXISTS `phieudatcho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieudatcho` (
  `maPhieu` int NOT NULL AUTO_INCREMENT,
  `maVe` int NOT NULL,
  `tenKH` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngayDatVe` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maPhieu`),
  KEY `FK_phieudatcho_maVe_idx` (`maVe`),
  KEY `FK_phieudatcho_tenKH_idx` (`tenKH`),
  CONSTRAINT `FK_phieudatcho_maVe` FOREIGN KEY (`maVe`) REFERENCES `vemaybay` (`maVe`),
  CONSTRAINT `FK_phieudatcho_tenKH` FOREIGN KEY (`tenKH`) REFERENCES `khachhang` (`tenKH`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieudatcho`
--

LOCK TABLES `phieudatcho` WRITE;
/*!40000 ALTER TABLE `phieudatcho` DISABLE KEYS */;
INSERT INTO `phieudatcho` VALUES (1,1,'Lê Thị B','04:00:00 2021-01-20'),(2,4,'Nguyễn Văn A','12:30:00 2021-04-01'),(3,5,'Trần Thị C','18:22:31 2021-04-20');
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
  `tenSanBay` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diaDiem` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quocGia` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trangThai` tinyint(1) NOT NULL,
  PRIMARY KEY (`maSanBay`),
  KEY `FK_sanbay_maSanBay_idx` (`maSanBay`),
  KEY `FK_sanbay_tenSanBay_idx` (`tenSanBay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanbay`
--

LOCK TABLES `sanbay` WRITE;
/*!40000 ALTER TABLE `sanbay` DISABLE KEYS */;
INSERT INTO `sanbay` VALUES ('1','Tân Sơn Nhất','HCM','VN',1),('2','Mộc Bài','HN','VN',1);
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
  `ngayDauTaiSanBay` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `sanbay_maybay` VALUES ('1','VNA01','05:50:002021-03-20'),('2','BA01','20:30:002021-01-01');
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
  `hoTen` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenTK` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matKhau` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trangThai` tinyint(1) NOT NULL DEFAULT '1',
  `idLoaiTK` int NOT NULL,
  `idCard` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sdt` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users_id_idx` (`id`),
  KEY `FK_users_hoTen_idx` (`hoTen`),
  KEY `FK_users_idLoaiTK_idx` (`idLoaiTK`),
  CONSTRAINT `FK_users_loaitk` FOREIGN KEY (`idLoaiTK`) REFERENCES `loaitk` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nhân Viên 01','NV01','1234',1,1,'023456789','nhanvien01@gmail.com','0987654321'),(2,'Nhân Viên 02','NV02','1234',1,1,'023456799','nhanvien02@gmail.com','0987654322'),(3,'Phạm Anh D','DPham','1234',1,2,'012345678910','phamanhdg@gmail.com','0345678921'),(4,'Nguyễn Thị Diễm M','MNguyen','1234',1,2,'012345678911','nguyenthidiemm@gmail.com','0345678922');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vemaybay`
--

DROP TABLE IF EXISTS `vemaybay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vemaybay` (
  `maVe` int NOT NULL AUTO_INCREMENT,
  `hangVe` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `giaVe` decimal(10,0) NOT NULL,
  `maGhe` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngayXuatVe` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenNguoiDat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenKH` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maChuyenBay` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maVe`),
  KEY `FK_vemaybay_maGhe_idx` (`maGhe`),
  KEY `FK_vemaybay_maChuyenBay_idx` (`maChuyenBay`),
  KEY `FK_vemaybay_khachhang_tenKH_idx` (`tenKH`),
  KEY `FK_vemaybay_users_tenNguoiDat_idx` (`tenNguoiDat`),
  KEY `FK_vemaybay_maVe_idx` (`maVe`),
  KEY `FK_vemaybay_hangVe_idx` (`hangVe`),
  KEY `FK_vemaybay_giaVe_idx` (`giaVe`),
  CONSTRAINT `FK_vemaybay_giaVe` FOREIGN KEY (`giaVe`) REFERENCES `giave` (`giaVe`),
  CONSTRAINT `FK_vemaybay_hangVe` FOREIGN KEY (`hangVe`) REFERENCES `hangve` (`hangVe`),
  CONSTRAINT `FK_vemaybay_khachhang_tenKH` FOREIGN KEY (`tenKH`) REFERENCES `khachhang` (`tenKH`),
  CONSTRAINT `FK_vemaybay_maChuyenBay` FOREIGN KEY (`maChuyenBay`) REFERENCES `chuyenbay` (`maChuyenBay`),
  CONSTRAINT `FK_vemaybay_maGhe` FOREIGN KEY (`maGhe`) REFERENCES `ghe` (`maGhe`),
  CONSTRAINT `FK_vemaybay_users_tenNguoiDat` FOREIGN KEY (`tenNguoiDat`) REFERENCES `users` (`hoTen`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vemaybay`
--

LOCK TABLES `vemaybay` WRITE;
/*!40000 ALTER TABLE `vemaybay` DISABLE KEYS */;
INSERT INTO `vemaybay` VALUES (1,'Phổ thông đặc biệt',120000,'4','04:00:00 2021-01-20','Nhân Viên 01','Lê Thị B','1'),(2,'Phổ thông',100000,'1','05:50:00 2021-03-10','Phạm Anh D','Phạm Anh D','1'),(3,'Thương gia',150000,'4','22:20:21 2021-03-15','Nguyễn Thị Diễm M','Nguyễn Thị Diễm M','2'),(4,'Phổ thông đặc biệt',100000,'4','12:30:00 2021-04-01','Nguyễn Thị Diễm M','Nguyễn Văn A','2'),(5,'Thương gia',200000,'4','18:22:31 2021-04-20','Phạm Anh D','Trần Thị C','1');
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

-- Dump completed on 2021-05-07 15:21:39
