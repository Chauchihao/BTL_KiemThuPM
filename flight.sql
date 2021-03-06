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
-- Table structure for table `chitiethoadon`
--

DROP TABLE IF EXISTS `chitiethoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitiethoadon` (
  `maHD` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maVe` int NOT NULL,
  `giaVe` decimal(10,0) NOT NULL,
  PRIMARY KEY (`maHD`,`maVe`),
  KEY `FK_chitiethoadon_maHD_idx` (`maHD`),
  KEY `FK_chitiethoadon_maVe_idx` (`maVe`),
  KEY `FK_chitiethoadon_giaVe_idx` (`giaVe`),
  CONSTRAINT `FK_chitiethoadon_giaVe` FOREIGN KEY (`giaVe`) REFERENCES `giave` (`giaVe`),
  CONSTRAINT `FK_chitiethoadon_idKH` FOREIGN KEY (`maVe`) REFERENCES `vemaybay` (`maVe`),
  CONSTRAINT `FK_chitiethoadon_idNguoiTT` FOREIGN KEY (`maHD`) REFERENCES `hoadonthanhtoan` (`maHD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitiethoadon`
--

LOCK TABLES `chitiethoadon` WRITE;
/*!40000 ALTER TABLE `chitiethoadon` DISABLE KEYS */;
INSERT INTO `chitiethoadon` VALUES ('1eead382-18bd-4319-9251-a913a2d77771',14,90000),('40e3ebdf-0939-47b3-9861-1499aa3471c4',14,90000),('ad735366-5de8-4b6f-9070-18c13bbe65dd',4,90000),('bf468fe9-6006-4445-a2ce-7fa15dafc7d7',13,90000),('c8e4a187-7bb9-4ceb-8760-c1738ca03e71',16,90000),('0349681f-228a-4311-9eb5-d2a6b723acb9',5,100000),('0f91a17a-5dd4-4398-a0fe-1c5782a52dff',15,100000),('386a92eb-a82a-46c9-812e-b4cc32085a8c',10,100000),('3baa0f10-2006-418f-b0d7-0f55a3b62022',8,100000),('bcd6e38d-8970-4820-ade4-dc2b0e6ef989',9,100000),('c89e9cb9-64c8-45d5-83f6-ff20d11fa7d7',2,100000),('ed5baeed-e0cc-4cc7-9058-5800d83414f8',11,100000),('2029c49d-8a42-4389-aed1-f2c30b9b9061',12,150000),('54b872bb-1b1f-4170-b300-9574c3273c3e',19,150000),('77459a52-4d63-4cd7-8216-3eb0b31de227',18,150000),('8cc4dc5d-0556-4a01-b285-b113661c6e46',3,150000),('5f4b505a-c6e1-44e7-b4d9-2d6babcf7783',17,200000),('8b3079d0-26b3-4480-8299-19be8943a643',1,200000),('e179995b-4bf8-43bb-8dd2-f31ae7cfc6ae',20,200000);
/*!40000 ALTER TABLE `chitiethoadon` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `chuyenbay` VALUES ('1','07:00:00 20-05-2020','12:00:00 20-05-2020','M???c B??i','T??n S??n Nh???t','VNA01',NULL),('2','17:00:00 26-06-2020','20:00:00 26-06-2020','T??n S??n Nh???t','M???c B??i','BA01',NULL);
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
INSERT INTO `ghe` VALUES ('A01','Ph??? th??ng'),('A02','Ph??? th??ng'),('A03','Ph??? th??ng'),('A04','Ph??? th??ng'),('A05','Ph??? th??ng'),('A06','Ph??? th??ng'),('A07','Ph??? th??ng'),('A08','Ph??? th??ng'),('A09','Ph??? th??ng'),('A10','Ph??? th??ng'),('A11','Ph??? th??ng'),('A12','Ph??? th??ng'),('A13','Ph??? th??ng'),('A14','Ph??? th??ng'),('A15','Ph??? th??ng'),('A16','Ph??? th??ng'),('A17','Ph??? th??ng'),('A18','Ph??? th??ng'),('A19','Ph??? th??ng'),('A20','Ph??? th??ng'),('B01','Ph??? th??ng'),('B02','Ph??? th??ng'),('B03','Ph??? th??ng'),('B04','Ph??? th??ng'),('B05','Ph??? th??ng'),('B06','Ph??? th??ng'),('B07','Ph??? th??ng'),('B08','Ph??? th??ng'),('B09','Ph??? th??ng'),('B10','Ph??? th??ng'),('B11','Ph??? th??ng'),('B12','Ph??? th??ng'),('B13','Ph??? th??ng'),('B14','Ph??? th??ng'),('B15','Ph??? th??ng'),('B16','Ph??? th??ng'),('B17','Ph??? th??ng'),('B18','Ph??? th??ng'),('B19','Ph??? th??ng'),('B20','Ph??? th??ng'),('C01','Ph??? Th??ng'),('C02','Ph??? Th??ng'),('C03','Ph??? Th??ng'),('C04','Ph??? Th??ng'),('C05','Ph??? Th??ng'),('C06','Ph??? Th??ng'),('C07','Ph??? Th??ng'),('C08','Ph??? Th??ng'),('C09','Ph??? Th??ng'),('C10','Ph??? Th??ng'),('C11','Ph??? Th??ng'),('C12','Ph??? Th??ng'),('C13','Ph??? Th??ng'),('C14','Ph??? Th??ng'),('C15','Ph??? Th??ng'),('C16','Ph??? Th??ng'),('C17','Ph??? Th??ng'),('C18','Ph??? Th??ng'),('C19','Ph??? Th??ng'),('C20','Ph??? Th??ng'),('D01','Ph??? Th??ng'),('D02','Ph??? Th??ng'),('D03','Ph??? Th??ng'),('D04','Ph??? Th??ng'),('D05','Ph??? Th??ng'),('D06','Ph??? Th??ng'),('D07','Ph??? Th??ng'),('D08','Ph??? Th??ng'),('D09','Ph??? Th??ng'),('D10','Ph??? Th??ng'),('D11','Ph??? Th??ng'),('D12','Ph??? Th??ng'),('D13','Ph??? Th??ng'),('D14','Ph??? Th??ng'),('D15','Ph??? Th??ng'),('D16','Ph??? Th??ng'),('D17','Ph??? Th??ng'),('D18','Ph??? Th??ng'),('D19','Ph??? Th??ng'),('D20','Ph??? Th??ng'),('S01','Th????ng gia'),('S02','Th????ng gia'),('S03','Th????ng gia'),('S04','Th????ng gia'),('S05','Th????ng gia'),('S06','Th????ng gia'),('S07','Th????ng gia'),('S08','Th????ng gia'),('S09','Th????ng gia'),('S10','Th????ng gia'),('S11','Th????ng gia'),('S12','Th????ng gia'),('S13','Th????ng gia'),('S14','Th????ng gia'),('S15','Th????ng gia'),('S16','Th????ng gia'),('S17','Th????ng gia'),('S18','Th????ng gia'),('S19','Th????ng gia'),('S20','Th????ng gia'),('S21','Th????ng gia'),('S22','Th????ng gia'),('S23','Th????ng gia'),('S24','Th????ng gia'),('S25','Th????ng gia'),('S26','Th????ng gia'),('S27','Th????ng gia'),('S28','Th????ng gia'),('S29','Th????ng gia'),('S30','Th????ng gia');
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
INSERT INTO `giave` VALUES ('M???c B??i','T??n S??n Nh???t','Bamboo Airways','Ph??? th??ng',90000),('T??n S??n Nh???t','M???c B??i','Bamboo Airways','Ph??? th??ng',90000),('M???c B??i','T??n S??n Nh???t','Vietnam Airlines','Ph??? th??ng',100000),('T??n S??n Nh???t','M???c B??i','Vietnam Airlines','Ph??? th??ng',100000),('M???c B??i','T??n S??n Nh???t','Bamboo Airways','Th????ng gia',150000),('T??n S??n Nh???t','M???c B??i','Bamboo Airways','Th????ng gia',150000),('M???c B??i','T??n S??n Nh???t','Vietnam Airlines','Th????ng gia',200000),('T??n S??n Nh???t','M???c B??i','Vietnam Airlines','Th????ng gia',200000);
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
INSERT INTO `hangve` VALUES (2,'Ph??? th??ng'),(1,'Th????ng gia');
/*!40000 ALTER TABLE `hangve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadonthanhtoan`
--

DROP TABLE IF EXISTS `hoadonthanhtoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadonthanhtoan` (
  `maHD` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenNguoiTT` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenKH` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngayTT` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maHD`,`tenKH`,`tenNguoiTT`,`ngayTT`),
  KEY `FK_hoadonthanhtoan_tenNguoiTT_idx` (`tenNguoiTT`),
  KEY `FK_hoadonthanhtoan_tenKH_idx` (`tenKH`),
  CONSTRAINT `FK_hoadonthanhtoan_tenKH` FOREIGN KEY (`tenKH`) REFERENCES `khachhang` (`tenKH`),
  CONSTRAINT `FK_hoadonthanhtoan_tenNguoiTT` FOREIGN KEY (`tenNguoiTT`) REFERENCES `users` (`hoTen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadonthanhtoan`
--

LOCK TABLES `hoadonthanhtoan` WRITE;
/*!40000 ALTER TABLE `hoadonthanhtoan` DISABLE KEYS */;
INSERT INTO `hoadonthanhtoan` VALUES ('0f91a17a-5dd4-4398-a0fe-1c5782a52dff','Nh??n Vi??n 01','q??qwqwqw','04:16:55 10-05-2021'),('1eead382-18bd-4319-9251-a913a2d77771','Nh??n Vi??n 01','e3432','04:16:55 10-05-2021'),('2029c49d-8a42-4389-aed1-f2c30b9b9061','Nh??n Vi??n 01','sadds','04:01:21 10-05-2021'),('386a92eb-a82a-46c9-812e-b4cc32085a8c','Nh??n Vi??n 01','d??qeeqw','03:59:50 10-05-2021'),('40e3ebdf-0939-47b3-9861-1499aa3471c4','Nh??n Vi??n 01','e3432','04:16:54 10-05-2021'),('54b872bb-1b1f-4170-b300-9574c3273c3e','Nh??n Vi??n 01','121212','04:33:08 10-05-2021'),('5f4b505a-c6e1-44e7-b4d9-2d6babcf7783','Nh??n Vi??n 01','ewqqw','04:16:56 10-05-2021'),('77459a52-4d63-4cd7-8216-3eb0b31de227','Nh??n Vi??n 01','dssdas','04:33:08 10-05-2021'),('8b3079d0-26b3-4480-8299-19be8943a643','Nh??n Vi??n 01','L?? Th??? B','04:00:00 20-01-2021'),('8cc4dc5d-0556-4a01-b285-b113661c6e46','Nh??n Vi??n 01','Tr????ng G','06:00:00 27-02-2021'),('bf468fe9-6006-4445-a2ce-7fa15dafc7d7','Nh??n Vi??n 01','23','04:01:21 10-05-2021'),('c8e4a187-7bb9-4ceb-8760-c1738ca03e71','Nh??n Vi??n 01','sadsadsad','04:16:55 10-05-2021'),('e179995b-4bf8-43bb-8dd2-f31ae7cfc6ae','Nh??n Vi??n 01','??sasasas','04:33:09 10-05-2021'),('ed5baeed-e0cc-4cc7-9058-5800d83414f8','Nh??n Vi??n 01','dfdfds','04:01:21 10-05-2021'),('3baa0f10-2006-418f-b0d7-0f55a3b62022','Nh??n Vi??n 02','r??erwe','03:46:04 10-05-2021'),('ad735366-5de8-4b6f-9070-18c13bbe65dd','Nh??n Vi??n 02','Hu???nh N','07:00:00 02-03-2021'),('bcd6e38d-8970-4820-ade4-dc2b0e6ef989','Nh??n Vi??n 02','???ewrew','03:53:48 10-05-2021'),('c89e9cb9-64c8-45d5-83f6-ff20d11fa7d7','Nh??n Vi??n 02','Ho??nh V??n E','05:00:00 15-02-2021'),('0349681f-228a-4311-9eb5-d2a6b723acb9','Ph???m Anh D','Ph???m Anh D','05:50:00 10-03-2021');
/*!40000 ALTER TABLE `hoadonthanhtoan` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (24,'12','121212121212','12@','1212212121'),(23,'1212','121212121212','@','1212121212'),(20,'121212','121212211212','@','1212121212'),(25,'213','121212121212','@','1212121212'),(14,'23','323232323222','@','2323232323'),(21,'??sasasas','121212121212','@','1212121212'),(12,'dfdfds','324234343434','@','3434343434'),(19,'dssdas','121212121221','@','1212121212'),(11,'d??qeeqw','121212121212','@','1212121212'),(15,'e3432','121212121212','@','1212121212'),(18,'ewqqw','121212121212','@','1212121212'),(2,'Ho??nh V??n E','012345678666','hoangvane@gmail.com','0988775444'),(4,'Hu???nh N','012345678444','huynhn@gmail.com','0988775222'),(1,'L?? Th??? B','012345678777','lethib@gmail.com','0988775555'),(6,'Nguy???n Th??? Di???m M','012345678911','nguyenthidiemm@gmail.com','0345678922'),(7,'Nguy???n V??n A','012345678999','nguyenvana@gmail.com','0988775544'),(5,'Ph???m Anh D','012345678910','phamanhdg@gmail.com','0345678921'),(16,'q??qwqwqw','121212121212','@','1212121212'),(9,'r??erwe','121212121','sads@','1212121212'),(13,'sadds','342434343434','@','3434343434'),(17,'sadsadsad','030303030301','@','1010101010'),(22,'sdsad','232423433434','@','1212121212'),(8,'Tr???n Th??? C','012345678888','tranthic@gmail.com','0988775511'),(3,'Tr????ng G','012345678555','truongg@gmail.com','0988775333'),(10,'???ewrew','324323232323','????@','2323232323'),(26,'??qe','121212121212','@','1212121212'),(27,'??qewqe','121212121212','@','1212121212');
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
INSERT INTO `loaitk` VALUES (1,'Nh??n Vi??n'),(2,'Kh??ch H??ng'),(3,'Admin');
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
  `trangThai` tinyint(1) NOT NULL DEFAULT '0',
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
INSERT INTO `maybay_ghe` VALUES ('BA01','A01',1),('BA01','A02',1),('BA01','A03',1),('BA01','A04',1),('BA01','A05',1),('BA01','A06',0),('BA01','A07',0),('BA01','A08',0),('BA01','A09',0),('BA01','A10',0),('BA01','A11',0),('BA01','A12',0),('BA01','A13',0),('BA01','A14',0),('BA01','A15',0),('BA01','A16',0),('BA01','A17',0),('BA01','A18',0),('BA01','A19',0),('BA01','A20',0),('BA01','B01',1),('BA01','B02',0),('BA01','B03',0),('BA01','B04',0),('BA01','B05',0),('BA01','B06',0),('BA01','B07',0),('BA01','B08',0),('BA01','B09',0),('BA01','B10',0),('BA01','B11',0),('BA01','B12',0),('BA01','B13',0),('BA01','B14',0),('BA01','B15',0),('BA01','B16',0),('BA01','B17',0),('BA01','B18',0),('BA01','B19',0),('BA01','C01',0),('BA01','C02',0),('BA01','C03',0),('BA01','C04',0),('BA01','C05',0),('BA01','C06',0),('BA01','C07',0),('BA01','C08',0),('BA01','C09',0),('BA01','C10',0),('BA01','C11',0),('BA01','C12',0),('BA01','C13',0),('BA01','C14',0),('BA01','C15',0),('BA01','C16',0),('BA01','C17',0),('BA01','C18',0),('BA01','C19',0),('BA01','C20',0),('BA01','D01',0),('BA01','D02',0),('BA01','D03',0),('BA01','D04',0),('BA01','D05',0),('BA01','D06',0),('BA01','D07',0),('BA01','D08',0),('BA01','D09',0),('BA01','D10',0),('BA01','D11',0),('BA01','D12',0),('BA01','D13',0),('BA01','D14',0),('BA01','D15',0),('BA01','D16',0),('BA01','D17',0),('BA01','D18',0),('BA01','D19',0),('BA01','S01',1),('BA01','S02',1),('BA01','S03',0),('BA01','S04',1),('BA01','S05',1),('BA01','S06',0),('BA01','S07',1),('BA01','S08',1),('BA01','S09',0),('BA01','S10',0),('BA01','S11',0),('BA01','S12',0),('BA01','S13',0),('BA01','S14',0),('BA01','S15',0),('BA01','S16',0),('BA01','S17',0),('BA01','S18',0),('BA01','S19',0),('BA01','S20',0),('BA01','S21',0),('BA01','S22',0),('BA01','S23',0),('BA01','S24',0),('BA01','S25',0),('BA01','S26',0),('BA01','S27',0),('BA01','S28',0),('BA01','S29',0),('BA01','S30',0),('VNA01','A01',1),('VNA01','A02',1),('VNA01','A03',1),('VNA01','A04',1),('VNA01','A05',0),('VNA01','A06',1),('VNA01','A07',1),('VNA01','A08',1),('VNA01','A09',1),('VNA01','A10',0),('VNA01','A11',0),('VNA01','A12',0),('VNA01','A13',0),('VNA01','A14',0),('VNA01','A15',0),('VNA01','A16',0),('VNA01','A17',0),('VNA01','A18',0),('VNA01','A19',0),('VNA01','A20',0),('VNA01','B01',0),('VNA01','B02',0),('VNA01','B03',0),('VNA01','B04',0),('VNA01','B05',0),('VNA01','B06',0),('VNA01','B07',0),('VNA01','B08',0),('VNA01','B09',0),('VNA01','B10',0),('VNA01','B11',0),('VNA01','B12',0),('VNA01','B13',0),('VNA01','B14',0),('VNA01','B15',0),('VNA01','B16',0),('VNA01','B17',0),('VNA01','B18',0),('VNA01','B19',0),('VNA01','B20',0),('VNA01','C01',1),('VNA01','C02',0),('VNA01','C03',0),('VNA01','C04',0),('VNA01','C05',0),('VNA01','C06',0),('VNA01','C07',0),('VNA01','C08',0),('VNA01','C09',0),('VNA01','C10',0),('VNA01','C11',0),('VNA01','C12',0),('VNA01','C13',0),('VNA01','C14',0),('VNA01','C15',0),('VNA01','C16',0),('VNA01','C17',0),('VNA01','C18',0),('VNA01','C19',0),('VNA01','C20',0),('VNA01','D01',1),('VNA01','D02',0),('VNA01','D03',0),('VNA01','D04',0),('VNA01','D05',0),('VNA01','D06',0),('VNA01','D07',0),('VNA01','D08',0),('VNA01','D09',0),('VNA01','D10',0),('VNA01','D11',0),('VNA01','D12',0),('VNA01','D13',0),('VNA01','D14',0),('VNA01','D15',0),('VNA01','D16',0),('VNA01','D17',0),('VNA01','D18',0),('VNA01','D19',0),('VNA01','D20',0),('VNA01','S01',0),('VNA01','S02',1),('VNA01','S03',1),('VNA01','S04',1),('VNA01','S05',1),('VNA01','S06',1),('VNA01','S07',1),('VNA01','S08',0),('VNA01','S09',0),('VNA01','S10',0),('VNA01','S11',0),('VNA01','S12',0),('VNA01','S13',0),('VNA01','S14',0),('VNA01','S15',0),('VNA01','S16',0),('VNA01','S17',0),('VNA01','S18',0),('VNA01','S19',0),('VNA01','S20',0),('VNA01','S21',0),('VNA01','S22',0),('VNA01','S23',0),('VNA01','S24',0),('VNA01','S25',0),('VNA01','S26',0),('VNA01','S27',0),('VNA01','S28',0),('VNA01','S29',0),('VNA01','S30',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieudatcho`
--

LOCK TABLES `phieudatcho` WRITE;
/*!40000 ALTER TABLE `phieudatcho` DISABLE KEYS */;
INSERT INTO `phieudatcho` VALUES (1,1,'L?? Th??? B','04:00:00 20-01-2021'),(2,2,'Ho??nh V??n E','05:00:00 15-02-2021'),(3,3,'Tr????ng G','06:00:00 27-02-2021'),(4,4,'Hu???nh N','07:00:00 02-03-2021'),(5,8,'r??erwe','03:41:26 10-05-2021'),(6,9,'???ewrew','03:41:57 10-05-2021'),(7,10,'d??qeeqw','03:42:59 10-05-2021'),(8,11,'dfdfds','04:00:37 10-05-2021'),(9,12,'sadds','04:00:55 10-05-2021'),(10,13,'23','04:01:15 10-05-2021'),(11,14,'e3432','04:01:57 10-05-2021'),(12,15,'q??qwqwqw','04:02:31 10-05-2021'),(13,16,'sadsadsad','04:02:57 10-05-2021'),(14,17,'ewqqw','04:03:12 10-05-2021'),(15,18,'dssdas','04:03:27 10-05-2021'),(16,19,'121212','04:03:47 10-05-2021'),(17,20,'??sasasas','04:04:23 10-05-2021'),(18,21,'sdsad','04:33:29 10-05-2021'),(19,22,'1212','04:33:44 10-05-2021'),(20,23,'12','04:34:08 10-05-2021'),(21,24,'213','04:34:23 10-05-2021'),(22,25,'??qe','04:35:16 10-05-2021'),(23,26,'23','04:35:29 10-05-2021'),(24,27,'??qewqe','04:35:50 10-05-2021');
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
INSERT INTO `sanbay` VALUES ('1','T??n S??n Nh???t','TP.H??? Ch?? Minh','Vi???t Nam',1),('2','M???c B??i','H?? N???i','Vi???t Nam',1);
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
INSERT INTO `sanbay_maybay` VALUES ('1','VNA01','05:50:00 20-03-2021'),('2','BA01','20:30:00 01-01-2021');
/*!40000 ALTER TABLE `sanbay_maybay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trangthaive`
--

DROP TABLE IF EXISTS `trangthaive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trangthaive` (
  `loaiTrangThai` tinyint(1) NOT NULL DEFAULT '0',
  `trangThai` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`loaiTrangThai`),
  KEY `FK_trangThai_idx` (`trangThai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trangthaive`
--

LOCK TABLES `trangthaive` WRITE;
/*!40000 ALTER TABLE `trangthaive` DISABLE KEYS */;
INSERT INTO `trangthaive` VALUES (0,'Ch??a thanh to??n'),(1,'???? thanh to??n');
/*!40000 ALTER TABLE `trangthaive` ENABLE KEYS */;
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
INSERT INTO `users` VALUES (0,'ADMIN','Admin','123456',1,3,'000000000000','admin@gmail.com','1111111111'),(1,'Nh??n Vi??n 01','NV01','123456',1,1,'023456789','nhanvien01@gmail.com','0987654321'),(2,'Nh??n Vi??n 02','NV02','123456',1,1,'023456799','nhanvien02@gmail.com','0987654322'),(3,'Ph???m Anh D','DPham','123456',1,2,'012345678910','phamanhdg@gmail.com','0345678921'),(4,'Nguy???n Th??? Di???m M','MNguyen','123456',1,2,'012345678911','nguyenthidiemm@gmail.com','0345678922');
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
  `trangThai` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maVe`),
  KEY `FK_vemaybay_maGhe_idx` (`maGhe`),
  KEY `FK_vemaybay_maChuyenBay_idx` (`maChuyenBay`),
  KEY `FK_vemaybay_khachhang_tenKH_idx` (`tenKH`),
  KEY `FK_vemaybay_users_tenNguoiDat_idx` (`tenNguoiDat`),
  KEY `FK_vemaybay_maVe_idx` (`maVe`),
  KEY `FK_vemaybay_hangVe_idx` (`hangVe`),
  KEY `FK_vemaybay_giaVe_idx` (`giaVe`),
  KEY `FK_vemaybay_trangThai_idx` (`trangThai`),
  CONSTRAINT `FK_vemaybay_giaVe` FOREIGN KEY (`giaVe`) REFERENCES `giave` (`giaVe`),
  CONSTRAINT `FK_vemaybay_hangVe` FOREIGN KEY (`hangVe`) REFERENCES `hangve` (`hangVe`),
  CONSTRAINT `FK_vemaybay_khachhang_tenKH` FOREIGN KEY (`tenKH`) REFERENCES `khachhang` (`tenKH`),
  CONSTRAINT `FK_vemaybay_maChuyenBay` FOREIGN KEY (`maChuyenBay`) REFERENCES `chuyenbay` (`maChuyenBay`),
  CONSTRAINT `FK_vemaybay_maGhe` FOREIGN KEY (`maGhe`) REFERENCES `ghe` (`maGhe`),
  CONSTRAINT `FK_vemaybay_trangThai` FOREIGN KEY (`trangThai`) REFERENCES `trangthaive` (`trangThai`),
  CONSTRAINT `FK_vemaybay_users_tenNguoiDat` FOREIGN KEY (`tenNguoiDat`) REFERENCES `users` (`hoTen`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vemaybay`
--

LOCK TABLES `vemaybay` WRITE;
/*!40000 ALTER TABLE `vemaybay` DISABLE KEYS */;
INSERT INTO `vemaybay` VALUES (1,'Th????ng gia',200000,'A01','04:00:00 20-01-2021','Nh??n Vi??n 01','L?? Th??? B','1','???? thanh to??n'),(2,'Ph??? th??ng',100000,'C01','05:00:00 15-02-2021','Nh??n Vi??n 02','Ho??nh V??n E','1','???? thanh to??n'),(3,'Th????ng gia',150000,'S01','06:00:00 27-02-2021','Nh??n Vi??n 01','Tr????ng G','2','???? thanh to??n'),(4,'Ph??? th??ng',90000,'B01','07:00:00 02-03-2021','Nh??n Vi??n 02','Hu???nh N','2','???? thanh to??n'),(5,'Ph??? th??ng',100000,'D01','05:50:00 10-03-2021','Ph???m Anh D','Ph???m Anh D','1','???? thanh to??n'),(6,'Th????ng gia',150000,'S02','22:20:21 15-03-2021','Nguy???n Th??? Di???m M','Nguy???n Th??? Di???m M','2','Ch??a thanh to??n'),(7,'Ph??? th??ng',90000,'S03','18:22:31 20-04-2021','Nguy???n Th??? Di???m M','Tr???n Th??? C','1','Ch??a thanh to??n'),(8,'Ph??? th??ng',100000,'A03','03:41:26 10-05-2021','Nh??n Vi??n 01','r??erwe','1','???? thanh to??n'),(9,'Ph??? th??ng',100000,'A04','03:41:57 10-05-2021','Nh??n Vi??n 01','???ewrew','1','???? thanh to??n'),(10,'Ph??? th??ng',100000,'A02','03:42:59 10-05-2021','Nh??n Vi??n 02','d??qeeqw','1','???? thanh to??n'),(11,'Ph??? th??ng',100000,'A08','04:00:37 10-05-2021','Nh??n Vi??n 01','dfdfds','1','???? thanh to??n'),(12,'Th????ng gia',150000,'S05','04:00:55 10-05-2021','Nh??n Vi??n 01','sadds','2','???? thanh to??n'),(13,'Ph??? th??ng',90000,'A03','04:01:15 10-05-2021','Nh??n Vi??n 01','23','2','???? thanh to??n'),(14,'Ph??? th??ng',90000,'A01','04:01:57 10-05-2021','Nh??n Vi??n 01','e3432','2','???? thanh to??n'),(15,'Ph??? th??ng',100000,'A06','04:02:31 10-05-2021','Nh??n Vi??n 02','q??qwqwqw','1','???? thanh to??n'),(16,'Ph??? th??ng',90000,'A04','04:02:57 10-05-2021','Nh??n Vi??n 02','sadsadsad','2','???? thanh to??n'),(17,'Th????ng gia',200000,'S04','04:03:12 10-05-2021','Nh??n Vi??n 02','ewqqw','1','???? thanh to??n'),(18,'Th????ng gia',150000,'S04','04:03:27 10-05-2021','Nh??n Vi??n 02','dssdas','2','???? thanh to??n'),(19,'Th????ng gia',150000,'S08','04:03:47 10-05-2021','Nh??n Vi??n 02','121212','2','???? thanh to??n'),(20,'Th????ng gia',200000,'S02','04:04:23 10-05-2021','Nh??n Vi??n 02','??sasasas','1','???? thanh to??n'),(21,'Th????ng gia',200000,'S06','04:33:29 10-05-2021','Nh??n Vi??n 01','sdsad','1','Ch??a thanh to??n'),(22,'Ph??? th??ng',100000,'A07','04:33:44 10-05-2021','Nh??n Vi??n 01','1212','1','Ch??a thanh to??n'),(23,'Th????ng gia',200000,'S05','04:34:08 10-05-2021','Nh??n Vi??n 01','12','1','Ch??a thanh to??n'),(24,'Ph??? th??ng',90000,'A05','04:34:23 10-05-2021','Nh??n Vi??n 01','213','2','Ch??a thanh to??n'),(25,'Ph??? th??ng',100000,'A09','04:35:16 10-05-2021','Nh??n Vi??n 02','??qe','1','Ch??a thanh to??n'),(26,'Th????ng gia',150000,'S07','04:35:29 10-05-2021','Nh??n Vi??n 02','23','2','Ch??a thanh to??n'),(27,'Th????ng gia',200000,'S07','04:35:50 10-05-2021','Nh??n Vi??n 02','??qewqe','1','Ch??a thanh to??n');
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

-- Dump completed on 2021-05-10 10:16:01
