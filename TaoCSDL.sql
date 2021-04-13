CREATE DATABASE `flight` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE flight;

CREATE TABLE `maybay` (
  `soHieu` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hangBay` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soGheHang1` int NOT NULL,
  `soGheHang2` int NOT NULL,
  PRIMARY KEY (`soHieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sanbay` (
  `maSanBay` int NOT NULL,
  `tenSanBay` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quocGia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trangThai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maSanBay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user` (
  `id` int NOT NULL,
  `hoTen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenTK` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matKhau` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trangThai` tinyint(1) NOT NULL,
  `loaiTK` enum('Admin','NV') COLLATE utf8mb4_unicode_ci NOT NULL,
  `diaChi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sdt` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ghe` (
  `maGhe` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trangThai` tinyint(1) NOT NULL,
  `hangGhe` int NOT NULL,
  `soHieuMayBay` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maGhe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `khachhang` (
  `maKH` int NOT NULL,
  `tenKH` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sdt` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`maKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `chuyenbay` (
  `maChuyenBay` int NOT NULL,
  `ngayGioiKhoiHanh` datetime NOT NULL,
  `thoiGianBay` datetime NOT NULL,
  `thoiGianDung` datetime NOT NULL,
  `maNoiDi` int NOT NULL,
  `maNoiDen` int NOT NULL,
  `soHieuMayBay` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sanBayTrungGian` int DEFAULT NULL,
  PRIMARY KEY (`maChuyenBay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `phieudatcho` (
  `maPhieu` int NOT NULL,
  `maVe` int NOT NULL,
  `maKH` int NOT NULL,
  `ngayDatVe` datetime NOT NULL,
  PRIMARY KEY (`maPhieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





CREATE TABLE `vemaybay` (
  `maVe` int NOT NULL,
  `hangVe` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `giaVe` float NOT NULL,
  `ngayXuatVe` datetime NOT NULL,
  `maNV` int NOT NULL,
  `maKH` int NOT NULL,
  `maChuyenBay` int NOT NULL,
  PRIMARY KEY (`maVe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



ALTER TABLE `vemaybay` ADD CONSTRAINT `maChuyenBay` FOREIGN KEY (`maChuyenBay`) REFERENCES `chuyenbay` (`maChuyenBay`);
ALTER TABLE `vemaybay` ADD CONSTRAINT `maKH` FOREIGN KEY (`maKH`) REFERENCES `khachhang` (`maKH`);
ALTER TABLE `vemaybay` ADD CONSTRAINT `maNV` FOREIGN KEY (`maNV`) REFERENCES `user` (`id`);

ALTER TABLE `chuyenbay` ADD CONSTRAINT `maNoiDi` FOREIGN KEY (`maNoiDi`) REFERENCES `sanbay` (`maSanBay`);
ALTER TABLE `chuyenbay` ADD CONSTRAINT `maNoiDen` FOREIGN KEY (`maNoiDen`) REFERENCES `sanbay` (`maSanBay`);
ALTER TABLE `chuyenbay` ADD CONSTRAINT `soHieuMayBay` FOREIGN KEY (`soHieuMayBay`) REFERENCES `maybay` (`soHieu`);

#ALTER TABLE `ghe` ADD CONSTRAINT `soHieuMayBay` FOREIGN KEY (`soHieuMayBay`) REFERENCES `sanbay` (`soHieu`);

ALTER TABLE `phieudatcho` ADD CONSTRAINT `maVe` FOREIGN KEY (`maVe`) REFERENCES `vemaybay` (`maVe`);
#ALTER TABLE `phieudatcho` ADD CONSTRAINT `maKH` FOREIGN KEY (`maKH`) REFERENCES `khachhang` (`maKH`); #Lỗi dòng này ahuhu


