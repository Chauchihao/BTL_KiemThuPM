CREATE DATABASE flight /*!40100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE flight;

#Tạo Bảng maybay
CREATE TABLE maybay (
  soHieuMayBay varchar(10) NOT NULL,
  hangBay varchar(100) NOT NULL,
  
  PRIMARY KEY (soHieuMayBay),
  KEY FK_maybay_giave_hangBay_idx (hangBay)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo bảng hangve
CREATE TABLE hangve (
	id int NOT NULL,
    hangVe varchar(255) NOT NULL,
    
    PRIMARY KEY (id),
	KEY FK_id_idx (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo Bảng ghe
CREATE TABLE ghe (
  maGhe varchar(5) NOT NULL,
  trangThai bool NOT NULL,
  idHangVe int NOT NULL,
  
  PRIMARY KEY (maGhe),
  KEY FK_ghe_idHangve_idx (idHangVe),
  CONSTRAINT FK_ghe_idHangve FOREIGN KEY (idHangVe) REFERENCES hangve(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#Tạo bảng maybay_ghe
CREATE TABLE maybay_ghe (
  soHieuMayBay varchar(10) NOT NULL,
  maGhe varchar(5) NOT NULL,
  
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
  KEY FK_sanbay_maSanBay_idx (maSanBay)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#Tạo bảng sanbay_maybay
CREATE TABLE sanbay_maybay (
  maSanBay varchar(10) NOT NULL,
  soHieuMayBay varchar(10) NOT NULL,
  ngayDauTaiSanBay varchar(19) NOT NULL,
  
  PRIMARY KEY (maSanBay, soHieuMayBay),
  
  KEY FK_sanbay_maybay_maSanBay_idx (maSanBay),
  CONSTRAINT FK_sanbay_maybay_maSanBay FOREIGN KEY (maSanBay) REFERENCES sanbay (maSanBay),
  KEY FK_sanbay_maybay_soHieuMayBay_idx (soHieuMayBay),
  CONSTRAINT FK_sanbay_maybay_soHieuMayBay FOREIGN KEY (soHieuMayBay) REFERENCES maybay (soHieuMayBay)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



#Tạo Bảng chuyenbay
CREATE TABLE chuyenbay (
  maChuyenBay varchar(10) NOT NULL,
  ngayGioKhoiHanh varchar(19) NOT NULL,
  ngayGioDen varchar(19) NOT NULL,
  maSanBayDi varchar(10) NOT NULL,
  maSanBayDen varchar(10) NOT NULL, 
  soHieuMayBay varchar(10) NOT NULL,
  sanBayTrungGian varchar(10) NULL,
  
  PRIMARY KEY (maChuyenBay),
  KEY FK_chuyenbay_sanBayTrungGian_idx (sanBayTrungGian),
  KEY FK_chuyenbay_maSanBayDi_idx (maSanBayDi),
  KEY FK_chuyenbay_maSanBayDen_idx (maSanBayDen),
  KEY FK_chuyenbay_soHieuMayBay_idx (soHieuMayBay),
  KEY FK_chuyenbay_maChuyenBay_idx (maChuyenBay),
  CONSTRAINT FK_chuyenbay_sanBayTrungGian FOREIGN KEY (sanBayTrungGian) REFERENCES sanbay(maSanBay),
  CONSTRAINT FK_chuyenbay_maSanBayDi FOREIGN KEY (maSanBayDi) REFERENCES sanbay(maSanBay),
  CONSTRAINT FK_chuyenbay_maSanBayDen FOREIGN KEY (maSanBayDen) REFERENCES sanbay(maSanBay),
  CONSTRAINT FK_chuyenbay_soHieuMayBay FOREIGN KEY (soHieuMayBay) REFERENCES maybay(soHieuMayBay)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#Tạo bảng giave
CREATE TABLE giave (
  maSanBayDi varchar(10) NOT NULL,
  maSanBayDen varchar(10) NOT NULL,
  hangBay varchar(100) NOT NULL,
  idHangVe int NOT NULL,
  giaVe decimal NOT NULL,
  
  PRIMARY KEY (maSanBayDi,maSanBayDen,hangBay,idHangVe),
  
  KEY FK_giave_chuyenbay_maSanBayDi_idx (maSanBayDi),
  KEY FK_giave_chuyenbay_maSanBayDen_idx (maSanBayDen),
  KEY FK_giave_maybay_hangBay_idx (hangBay),
  KEY FK_giave_hangve_idHangVe_idx (idHangVe),
  KEY FK_giave_vemaybay_idx (giaVe),
  CONSTRAINT FK_giave_chuyenbay_maSanBayDi FOREIGN KEY (maSanBayDi) REFERENCES chuyenbay(maSanBayDi),
  CONSTRAINT FK_giave_chuyenbay_maSanBayDen FOREIGN KEY (maSanBayDen) REFERENCES chuyenbay(maSanBayDen),
  CONSTRAINT FK_giave_maybay_hangBay FOREIGN KEY (hangBay) REFERENCES maybay(hangBay),
  CONSTRAINT FK_giave_hangve_idHangVe FOREIGN KEY (idHangVe) REFERENCES hangve(id)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo bảng loaitk
CREATE TABLE loaitk (
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
  idLoaiTK int NOT NULL,
  idCard varchar(12) NOT NULL,
  email varchar(255) NULL,
  sdt varchar(10) NULL,
  
  PRIMARY KEY (id),
  
  KEY FK_users_id_idx (id),
  KEY FK_users_idLoaiTK_idx (idLoaiTK),
  CONSTRAINT FK_users_loaitk FOREIGN KEY (idLoaiTK) REFERENCES loaitk(id)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo Bảng khachhang
CREATE TABLE khachhang (
  maKH int NOT NULL AUTO_INCREMENT,
  tenKH varchar(255) NOT NULL,
  idCard varchar(12) NOT NULL,
  email varchar(100) NULL,
  sdt varchar(10) NULL,
  
  PRIMARY KEY (maKH),
  
  KEY FK_khachhang_maKH_idx (maKH)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo Bảng vemaybay
CREATE TABLE vemaybay (
  maVe int NOT NULL AUTO_INCREMENT,
  idHangVe int NOT NULL,
  giaVe decimal NOT NULL,
  maGhe varchar(5) NOT NULL,
  ngayXuatVe varchar(19) NOT NULL,
  maNguoiDat int NOT NULL,
  maKH int NOT NULL,
  maChuyenBay varchar(10) NOT NULL,
  
  PRIMARY KEY (maVe),
  
  KEY FK_vemaybay_maGhe_idx (maGhe),
  KEY FK_vemaybay_maChuyenBay_idx (maChuyenBay),
  KEY FK_vemaybay_khachhang_maKH_idx (maKH),
  KEY FK_vemaybay_maNguoiDat_idx (maNguoiDat),
  KEY FK_vemaybay_maVe_idx (maVe),
  KEY FK_vemaybay_idHangVe_idx (idHangVe),
  KEY FK_vemaybay_giaVe_idx (giaVe),
  CONSTRAINT FK_vemaybay_maGhe FOREIGN KEY (maGhe) REFERENCES ghe(maGhe),
  CONSTRAINT FK_vemaybay_maChuyenBay FOREIGN KEY (maChuyenBay) REFERENCES chuyenbay(maChuyenBay),
  CONSTRAINT FK_vemaybay_khachhang_maKH FOREIGN KEY (maKH) REFERENCES khachhang(maKH),
  CONSTRAINT FK_vemaybay_maNguoiDat FOREIGN KEY (maNguoiDat) REFERENCES users(id),
  CONSTRAINT FK_vemaybay_hangVe FOREIGN KEY (idHangVe) REFERENCES hangve(id),
  CONSTRAINT FK_vemaybay_giaVe FOREIGN KEY (giaVe) REFERENCES giave(giaVe)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo Bảng phieudatcho
CREATE TABLE phieudatcho (
  maPhieu int NOT NULL AUTO_INCREMENT,
  maVe int NOT NULL,
  maKH int NOT NULL,
  ngayDatVe varchar(19) NOT NULL,
  
  PRIMARY KEY (maPhieu),
  
  KEY FK_phieudatcho_maVe_idx (maVe),
  KEY FK_phieudatcho_maKH_idx (maKH),
  CONSTRAINT FK_phieudatcho_maVe FOREIGN KEY (maVe) REFERENCES vemaybay(maVe),
  CONSTRAINT FK_phieudatcho_maKH FOREIGN KEY (maKH) REFERENCES khachhang(maKH)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO flight.loaitk (id, tk) VALUES ('1', 'Nhân Viên');
INSERT INTO flight.loaitk (id, tk) VALUES ('2', 'Khách Hàng');

INSERT INTO flight.users (id, hoTen, tenTK, matKhau, idLoaiTK, idCard, email, sdt) VALUES ('1', 'Nhân Viên 01', 'NV01', '1234', '1', '023456789', 'nhanvien01@gmail.com', '0987654321');
INSERT INTO flight.users (id, hoTen, tenTK, matKhau, idLoaiTK, idCard, email, sdt) VALUES ('2', 'Nhân Viên 02', 'NV02', '1234', '1', '023456799', 'nhanvien02@gmail.com', '0987654322');
INSERT INTO flight.users (id, hoTen, tenTK, matKhau, idLoaiTK, idCard, email, sdt) VALUES ('3', 'Phạm Anh D', 'DPham', '1234', '2', '012345678910', 'phamanhdg@gmail.com', '0345678921');
INSERT INTO flight.users (id, hoTen, tenTK, matKhau, idLoaiTK, idCard, email, sdt) VALUES ('4', 'Nguyễn Thị Diễm M', 'MNguyen', '1234', '2', '012345678911', 'nguyenthidiemm@gmail.com', '0345678922');

INSERT INTO flight.khachhang (tenKH, idCard, email, sdt) VALUES ('Phạm Anh D', '012345678910', 'phamanhdg@gmail.com', '0345678921');
INSERT INTO flight.khachhang (tenKH, idCard, email, sdt) VALUES ('Nguyễn Thị Diễm M', '012345678911', 'nguyenthidiemm@gmail.com', '0345678922');
INSERT INTO flight.khachhang (tenKH, idCard, email, sdt) VALUES ('Nguyễn Văn A', '012345678999', 'nguyenvana@gmail.com', '0988775544');
INSERT INTO flight.khachhang (tenKH, idCard) VALUES ('Trần Thị C', '012345678888');

INSERT INTO flight.hangve (id, hangVe) VALUES ('1', 'Phổ thông');
INSERT INTO flight.hangve (id, hangVe) VALUES ('2', 'Phổ thông đặc biệt');
INSERT INTO flight.hangve (id, hangVe) VALUES ('3', 'Thương gia');

INSERT INTO flight.ghe (maGhe, trangThai, idHangVe) VALUES ('1', '1', '3');
INSERT INTO flight.ghe (maGhe, trangThai, idHangVe) VALUES ('2', '1', '1');
INSERT INTO flight.ghe (maGhe, trangThai, idHangVe) VALUES ('3', '1', '2');
INSERT INTO flight.ghe (maGhe, trangThai, idHangVe) VALUES ('4', '1', '2');

INSERT INTO flight.maybay (soHieuMayBay, hangBay) VALUES ('AB1', 'Vietnam Airlines');
INSERT INTO flight.maybay (soHieuMayBay, hangBay) VALUES ('YZ5', 'Bamboo Airways');

INSERT INTO flight.sanbay (maSanBay, tenSanBay, diaDiem, quocGia, trangThai) VALUES ('1', 'TSN', 'HCM', 'VN', '1');
INSERT INTO flight.sanbay (maSanBay, tenSanBay, diaDiem, quocGia, trangThai) VALUES ('2', 'MB', 'HN', 'VN', '1');

INSERT INTO flight.maybay_ghe (soHieuMayBay, maGhe) VALUES ('AB1', '1');
INSERT INTO flight.maybay_ghe (soHieuMayBay, maGhe) VALUES ('YZ5', '2');

INSERT INTO flight.chuyenbay (maChuyenBay,ngayGioKhoiHanh,ngayGioDen,maSanBayDi,maSanBayDen,soHieuMayBay) VALUES ('1','07:00:00 2020-05-20','12:00:00 2020-05-20','2','1','AB1');
INSERT INTO flight.chuyenbay (maChuyenBay,ngayGioKhoiHanh,ngayGioDen,maSanBayDi,maSanBayDen,soHieuMayBay) VALUES ('2','17:00:00 2020-06-25','20:00:00 2020-06-27','1','2','YZ5');

INSERT INTO flight.giave (maSanBayDi,maSanBayDen,hangBay,idHangVe,giaVe) VALUES ('1','2','Vietnam Airlines','1','100000');
INSERT INTO flight.giave (maSanBayDi,maSanBayDen,hangBay,idHangVe,giaVe) VALUES ('1','2','Vietnam Airlines','2','120000');
INSERT INTO flight.giave (maSanBayDi,maSanBayDen,hangBay,idHangVe,giaVe) VALUES ('1','2','Vietnam Airlines','3','200000');
INSERT INTO flight.giave (maSanBayDi,maSanBayDen,hangBay,idHangVe,giaVe) VALUES ('2','1','Vietnam Airlines','1','100000');
INSERT INTO flight.giave (maSanBayDi,maSanBayDen,hangBay,idHangVe,giaVe) VALUES ('2','1','Vietnam Airlines','2','120000');
INSERT INTO flight.giave (maSanBayDi,maSanBayDen,hangBay,idHangVe,giaVe) VALUES ('2','1','Vietnam Airlines','3','200000');
INSERT INTO flight.giave (maSanBayDi,maSanBayDen,hangBay,idHangVe,giaVe) VALUES ('2','1','Bamboo Airways','1','90000');
INSERT INTO flight.giave (maSanBayDi,maSanBayDen,hangBay,idHangVe,giaVe) VALUES ('2','1','Bamboo Airways','2','100000');
INSERT INTO flight.giave (maSanBayDi,maSanBayDen,hangBay,idHangVe,giaVe) VALUES ('2','1','Bamboo Airways','3','150000');
INSERT INTO flight.giave (maSanBayDi,maSanBayDen,hangBay,idHangVe,giaVe) VALUES ('1','2','Bamboo Airways','1','90000');
INSERT INTO flight.giave (maSanBayDi,maSanBayDen,hangBay,idHangVe,giaVe) VALUES ('1','2','Bamboo Airways','2','100000');
INSERT INTO flight.giave (maSanBayDi,maSanBayDen,hangBay,idHangVe,giaVe) VALUES ('1','2','Bamboo Airways','3','150000');

INSERT INTO flight.sanbay_maybay (maSanBay, soHieuMayBay, ngayDauTaiSanBay) VALUES ('1', 'AB1', '05:50:002021-03-20');
INSERT INTO flight.sanbay_maybay (maSanBay, soHieuMayBay, ngayDauTaiSanBay) VALUES ('2', 'YZ5', '20:30:002021-01-01');

INSERT INTO flight.vemaybay (idHangVe, giaVe, maGhe, ngayXuatVe, maNguoiDat, maKH, maChuyenBay) VALUES ('1', '100000', '1', '05:50:00 2021-03-10', '3', '1', '1');
INSERT INTO flight.vemaybay (idHangVe, giaVe, maGhe, ngayXuatVe, maNguoiDat, maKH, maChuyenBay) VALUES ('3', '150000', '4', '22:20:21 2021-03-15', '4', '2', '2');
INSERT INTO flight.vemaybay (idHangVe, giaVe, maGhe, ngayXuatVe, maNguoiDat, maKH, maChuyenBay) VALUES ('2', '100000', '4', '12:30:00 2021-04-01', '4', '3', '2');
INSERT INTO flight.vemaybay (idHangVe, giaVe, maGhe, ngayXuatVe, maNguoiDat, maKH, maChuyenBay) VALUES ('3', '200000', '4', '18:22:31 2021-04-20', '3', '4', '1');

INSERT INTO flight.phieudatcho (maVe, maKH, ngayDatVe) VALUES ('1', '1', '05:50:00 2021-03-20');
INSERT INTO flight.phieudatcho (maVe, maKH, ngayDatVe) VALUES ('2', '2', '09:40:00 2021-01-30');


