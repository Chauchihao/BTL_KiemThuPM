CREATE DATABASE flight /*!40100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE flight;

#Tạo Bảng maybay
CREATE TABLE maybay (
  soHieuMayBay varchar(10) NOT NULL,
  hangBay varchar(100) NOT NULL,
  
  PRIMARY KEY (soHieuMayBay)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo Bảng ghe
CREATE TABLE ghe (
  maGhe varchar(5) NOT NULL,
  trangThai bool NOT NULL,
  hangGhe enum("Hạng 1", "Hạng 2") NOT NULL DEFAULT "Hạng 2",
  
  PRIMARY KEY (maGhe)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#Tạo bảng maybay_ghe
CREATE TABLE maybay_ghe (
  soHieuMayBay varchar(10) NOT NULL,
  maGhe varchar(5) NOT NULL,
  soGheHang1 int NOT NULL,
  soGheHang2 int NOT NULL,
  
  PRIMARY KEY (soHieuMayBay, maGhe),
  
  KEY FK_maybay_ghe_soHieuMayBay_idx (soHieuMayBay),
  KEY FK_maybay_ghe_maGhe_idx (maGhe),
  CONSTRAINT FK_maybay_ghe_soHieuMayBay FOREIGN KEY (soHieuMayBay) REFERENCES maybay (soHieuMayBay),
  CONSTRAINT FK_maybay_ghe_maGhe FOREIGN KEY (maGhe) REFERENCES ghe(maGhe)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



#Tạo Bảng sanbay
CREATE TABLE sanbay (
  maSanBay varchar(10) NOT NULL,
  tenSanBay varchar(255) NOT NULL,
  diaDiem varchar(255) NOT NULL,
  quocGia varchar(255) NOT NULL,
  trangThai bool NOT NULL,
  
  PRIMARY KEY (maSanBay),
  KEY FK_sanbay_diaDiem (diaDiem)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE sanbay_maybay (
  maSanBay varchar(10) NOT NULL,
  soHieuMayBay varchar(10) NOT NULL,
  ngayDauTaiSanBay datetime NOT NULL,
  
  PRIMARY KEY (maSanBay, soHieuMayBay),
  
  KEY FK_sanbay_maybay_maSanBay_idx (maSanBay),
  CONSTRAINT FK_sanbay_maybay_maSanBay FOREIGN KEY (maSanBay) REFERENCES sanbay (maSanBay),
  KEY FK_sanbay_maybay_soHieuMayBay_idx (soHieuMayBay),
  CONSTRAINT FK_sanbay_maybay_soHieuMayBay FOREIGN KEY (soHieuMayBay) REFERENCES maybay (soHieuMayBay)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



#Tạo Bảng chuyenbay
CREATE TABLE chuyenbay (
  maChuyenBay int NOT NULL,
  thoiGianBay datetime NOT NULL,
  thoiGianDung datetime NOT NULL,
  noiDi varchar(255) NOT NULL,
  noiDen varchar(255) NOT NULL, 
  soHieuMayBay varchar(10) NOT NULL,
  sanBayTrungGian varchar(10) NULL,
  
  PRIMARY KEY (maChuyenBay),
  KEY FK_chuyenbay_sanBayTrungGian_idx (sanBayTrungGian),
  KEY FK_chuyenbay_noiDi_idx (noiDi),
  KEY FK_chuyenbay_noiDen_idx (noiDen),
  KEY FK_chuyenbay_soHieuMayBay_idx (soHieuMayBay),
  KEY FK_chuyenbay_maChuyenBay_idx (maChuyenBay),
  CONSTRAINT FK_chuyenbay_sanBayTrungGian FOREIGN KEY (sanBayTrungGian) REFERENCES sanbay(maSanBay),
  CONSTRAINT FK_chuyenbay_noiDi FOREIGN KEY (noiDi) REFERENCES sanbay(diaDiem),
  CONSTRAINT FK_chuyenbay_noiDen FOREIGN KEY (noiDen) REFERENCES sanbay(diaDiem),
  CONSTRAINT FK_chuyenbay_soHieuMayBay FOREIGN KEY (soHieuMayBay) REFERENCES maybay(soHieuMayBay)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE loaiTK (
	id int NOT NULL,
    tk varchar(255) NOT NULL,
    
    PRIMARY KEY (id),
  
	KEY FK_id_idx (id)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo Bảng users
CREATE TABLE users (
  id int NOT NULL,
  hoTen varchar(255) NOT NULL,
  tenTK varchar(255) NOT NULL,
  matKhau varchar(255) NOT NULL,
  trangThai bool DEFAULT TRUE NOT NULL ,
  #loaiTK enum('Khách Hàng','Nhân Viên') NOT NULL DEFAULT 'Nhân Viên',
  idLoaiTK int NOT NULL,
  diaChi varchar(255) NULL,
  sdt varchar(10) NULL,
  
  PRIMARY KEY (id),
  
  KEY FK_users_id_idx (id),
  KEY FK_users_idLoaiTK_idx (idLoaiTK),
  CONSTRAINT FK_users_loaiTK FOREIGN KEY (idLoaiTK) REFERENCES loaiTK(id)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo Bảng khachhang
CREATE TABLE khachhang (
  maKH int NOT NULL,
  tenKH varchar(255) NOT NULL,
  email varchar(100) NULL,
  sdt varchar(10) NULL,
  
  PRIMARY KEY (maKH),
  
  KEY FK_khachhang_maKH_idx (maKH)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo Bảng vemaybay
CREATE TABLE vemaybay (
  maVe int NOT NULL,
  hangVe varchar(10) NOT NULL,
  giaVe float NOT NULL,
  maGhe varchar(5) NOT NULL,
  ngayXuatVe datetime NOT NULL,
  maNguoiDat int NOT NULL,
  maKH int NOT NULL,
  maChuyenBay int NOT NULL,
  
  PRIMARY KEY (maVe),
  
  KEY FK_vemaybay_maGhe_idx (maGhe),
  KEY FK_vemaybay_maChuyenBay_idx (maChuyenBay),
  KEY FK_vemaybay_maKH_idx (maKH),
  KEY FK_vemaybay_maNguoiDat_idx (maNguoiDat),
  KEY FK_vemaybay_maVe_idx (maVe),
  CONSTRAINT FK_vemaybay_maGhe FOREIGN KEY (maGhe) REFERENCES ghe(maGhe),
  CONSTRAINT FK_vemaybay_maChuyenBay FOREIGN KEY (maChuyenBay) REFERENCES chuyenbay(maChuyenBay),
  CONSTRAINT FK_vemaybay_maKH FOREIGN KEY (maKH) REFERENCES khachhang(maKH),
  CONSTRAINT FK_vemaybay_maNguoiDat FOREIGN KEY (maNguoiDat) REFERENCES users(id)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo Bảng phieudatcho
CREATE TABLE phieudatcho (
  maPhieu int NOT NULL,
  maVe int NOT NULL,
  maKH int NOT NULL,
  ngayDatVe datetime NOT NULL,
  
  PRIMARY KEY (maPhieu),
  
  KEY FK_phieudatcho_maVe_idx (maVe),
  KEY FK_phieudatcho_maKH_idx (maKH),
  CONSTRAINT FK_phieudatcho_maVe FOREIGN KEY (maVe) REFERENCES vemaybay(maVe),
  CONSTRAINT FK_phieudatcho_maKH FOREIGN KEY (maKH) REFERENCES khachhang(maKH)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO flight.loaitk (id, tk) VALUES ('1', 'Nhân Viên');
INSERT INTO flight.loaitk (id, tk) VALUES ('2', 'Khách Hàng');

INSERT INTO flight.users (id, hoTen, tenTK, matKhau, idLoaiTK) VALUES ('1', 'Test', 'testnv', '1234', '1');
INSERT INTO flight.users (id, hoTen, tenTK, matKhau, idLoaiTK) VALUES ('2', 'Test', 'testkh', '1234', '2');

INSERT INTO flight.khachhang (maKH, tenKH) VALUES ('1', 'test');
INSERT INTO flight.khachhang (maKH, tenKH) VALUES ('2', 'test2');

INSERT INTO flight.ghe (maGhe, trangThai, hangGhe) VALUES ('1', '1', '1');
INSERT INTO flight.ghe (maGhe, trangThai, hangGhe) VALUES ('2', '1', '2');

INSERT INTO flight.maybay (soHieuMayBay, hangBay) VALUES ('AB1', 'VN');
INSERT INTO flight.maybay (soHieuMayBay, hangBay) VALUES ('YZ5', 'UK');

INSERT INTO flight.sanbay (maSanBay, tenSanBay, diaDiem, quocGia, trangThai) VALUES ('1', 'TSN', 'HCM', 'VN', '1');
INSERT INTO flight.sanbay (maSanBay, tenSanBay, diaDiem, quocGia, trangThai) VALUES ('2', 'MB', 'HN', 'VN', '1');

INSERT INTO flight.maybay_ghe (soHieuMayBay, maGhe, soGheHang1, soGheHang2) VALUES ('AB1', '1', '20', '21');
INSERT INTO flight.maybay_ghe (soHieuMayBay, maGhe, soGheHang1, soGheHang2) VALUES ('YZ5', '2', '10', '16');

INSERT INTO flight.chuyenbay (maChuyenBay,thoiGianBay,thoiGianDung,noiDi,noiDen,soHieuMayBay) VALUES ('1','2020-05-20 07:00:00','2020-05-20 12:00:00','HCM','HN','AB1');
INSERT INTO flight.chuyenbay (maChuyenBay,thoiGianBay,thoiGianDung,noiDi,noiDen,soHieuMayBay) VALUES ('2','2020-06-25 17:00:00','2020-06-27 20:00:00','HN','HCM','YZ5');

INSERT INTO flight.sanbay_maybay (maSanBay, soHieuMayBay, ngayDauTaiSanBay) VALUES ('1', 'AB1', '2021-03-20 05:50:00');
INSERT INTO flight.sanbay_maybay (maSanBay, soHieuMayBay, ngayDauTaiSanBay) VALUES ('2', 'YZ5', '2021-01-01 20:30:00');

INSERT INTO flight.vemaybay (maVe, hangVe, giaVe, maGhe, ngayXuatVe, maNguoiDat, maKH, maChuyenBay) VALUES ('1', '1', '20', '1', '2021-03-20 05:50:00', '1', '1', '1');
INSERT INTO flight.vemaybay (maVe, hangVe, giaVe, maGhe, ngayXuatVe, maNguoiDat, maKH, maChuyenBay) VALUES ('2', '2', '10', '2', '2021-03-10 22:20:21', '2', '2', '2');

INSERT INTO flight.phieudatcho (maPhieu, maVe, maKH, ngayDatVe) VALUES ('1', '1', '1', '2021-03-20 05:50:00');
INSERT INTO flight.phieudatcho (maPhieu, maVe, maKH, ngayDatVe) VALUES ('2', '2', '2', '2021-01-30 09:40:00');


