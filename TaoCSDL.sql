CREATE DATABASE flight /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE flight;

CREATE TABLE maybay (
  soHieuMayBay varchar(10) NOT NULL,
  hangBay varchar(100) NOT NULL,
  soGheHang1 int NOT NULL,
  soGheHang2 int NOT NULL,
  PRIMARY KEY (soHieuMayBay)
) ENGINE=InnoDB;

CREATE TABLE sanbay (
  maSanBay int NOT NULL,
  tenSanBay varchar(255) NOT NULL,
  quocGia varchar(255) NOT NULL,
  trangThai varchar(255) NOT NULL,
  PRIMARY KEY (maSanBay)
) ENGINE=InnoDB;

CREATE TABLE users (
  id int NOT NULL,
  hoTen varchar(255) NOT NULL,
  tenTK varchar(255) NOT NULL,
  matKhau varchar(255) NOT NULL,
  trangThai bool NOT NULL,
  loaiTK enum('Admin','NV') NOT NULL,
  diaChi varchar(255) DEFAULT NULL,
  sdt varchar(10) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE ghe (
  maGhe varchar(5) NOT NULL,
  trangThai bool NOT NULL,
  hangGhe int NOT NULL,
  soHieuMayBay varchar(10) NOT NULL,
  PRIMARY KEY (maGhe)
) ENGINE=InnoDB;

CREATE TABLE khachhang (
  maKH int NOT NULL,
  tenKH varchar(255) NOT NULL,
  email varchar(100) NULL,
  sdt varchar(10) NULL,
  PRIMARY KEY (maKH)
) ENGINE=InnoDB;

CREATE TABLE chuyenbay (
  maChuyenBay int NOT NULL,
  ngayGioiKhoiHanh datetime NOT NULL,
  thoiGianBay datetime NOT NULL,
  thoiGianDung datetime NOT NULL,
  maNoiDi int NOT NULL,
  maNoiDen int NOT NULL,
  soHieuMayBay varchar(10) NOT NULL,
  sanBayTrungGian int DEFAULT NULL,
  PRIMARY KEY (maChuyenBay)
) ENGINE=InnoDB;

CREATE TABLE phieudatcho (
  maPhieu int NOT NULL,
  maVe int NOT NULL,
  maKH int NOT NULL,
  ngayDatVe datetime NOT NULL,
  PRIMARY KEY (maPhieu)
) ENGINE=InnoDB;





CREATE TABLE vemaybay (
  maVe int NOT NULL,
  hangVe varchar(10) NOT NULL,
  giaVe float NOT NULL,
  ngayXuatVe datetime NOT NULL,
  maNV int NOT NULL,
  maKH int NOT NULL,
  maChuyenBay int NOT NULL,
  PRIMARY KEY (maVe)
) ENGINE=InnoDB;



ALTER TABLE vemaybay ADD FOREIGN KEY (maChuyenBay) REFERENCES chuyenbay (maChuyenBay);
ALTER TABLE vemaybay ADD FOREIGN KEY (maKH) REFERENCES khachhang (maKH);
ALTER TABLE vemaybay ADD FOREIGN KEY (maNV) REFERENCES users (id);

ALTER TABLE chuyenbay ADD FOREIGN KEY (maNoiDi) REFERENCES sanbay (maSanBay);
ALTER TABLE chuyenbay ADD FOREIGN KEY (maNoiDen) REFERENCES sanbay (maSanBay);
ALTER TABLE chuyenbay ADD  FOREIGN KEY (soHieuMayBay) REFERENCES maybay (soHieuMayBay);

ALTER TABLE ghe ADD FOREIGN KEY (soHieuMayBay) REFERENCES maybay (soHieuMayBay);

ALTER TABLE phieudatcho ADD FOREIGN KEY (maVe) REFERENCES vemaybay (maVe);
ALTER TABLE phieudatcho ADD FOREIGN KEY (maKH) REFERENCES khachhang (maKH);



