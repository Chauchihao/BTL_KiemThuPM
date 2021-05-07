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
    hangVe varchar(100) NOT NULL,
    
    PRIMARY KEY (id),
	KEY FK_id_idx (id),
    KEY FK_hangVe_idx (hangVe)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo Bảng ghe
CREATE TABLE ghe (
  maGhe varchar(5) NOT NULL,
  trangThai bool NOT NULL,
  hangVe varchar(100) NOT NULL,
  
  PRIMARY KEY (maGhe),
  KEY FK_ghe_hangVe_idx (hangVe),
  CONSTRAINT FK_ghe_hangVe FOREIGN KEY (hangVe) REFERENCES hangve(hangVe)
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
  tenSanBay varchar(100) NOT NULL,
  diaDiem varchar(100) NOT NULL,
  quocGia varchar(100) NOT NULL,
  trangThai bool NOT NULL,
  
  PRIMARY KEY (maSanBay),
  KEY FK_sanbay_maSanBay_idx (maSanBay),
  KEY FK_sanbay_tenSanBay_idx (tenSanBay)
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
  tenSanBayDi varchar(100) NOT NULL,
  tenSanBayDen varchar(100) NOT NULL, 
  soHieuMayBay varchar(10) NOT NULL,
  sanBayTrungGian varchar(10) NULL,
  
  PRIMARY KEY (maChuyenBay),
  KEY FK_chuyenbay_sanBayTrungGian_idx (sanBayTrungGian),
  KEY FK_chuyenbay_tenSanBayDi_idx (tenSanBayDi),
  KEY FK_chuyenbay_tenSanBayDen_idx (tenSanBayDen),
  KEY FK_chuyenbay_soHieuMayBay_idx (soHieuMayBay),
  KEY FK_chuyenbay_maChuyenBay_idx (maChuyenBay),
  CONSTRAINT FK_chuyenbay_sanBayTrungGian FOREIGN KEY (sanBayTrungGian) REFERENCES sanbay(maSanBay),
  CONSTRAINT FK_chuyenbay_tenSanBayDi FOREIGN KEY (tenSanBayDi) REFERENCES sanbay(tenSanBay),
  CONSTRAINT FK_chuyenbay_tenSanBayDen FOREIGN KEY (tenSanBayDen) REFERENCES sanbay(tenSanBay),
  CONSTRAINT FK_chuyenbay_soHieuMayBay FOREIGN KEY (soHieuMayBay) REFERENCES maybay(soHieuMayBay)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#Tạo bảng giave
CREATE TABLE giave (
  tenSanBayDi varchar(100) NOT NULL,
  tenSanBayDen varchar(100) NOT NULL,
  hangBay varchar(100) NOT NULL,
  hangVe varchar(100) NOT NULL,
  giaVe decimal NOT NULL,
  
  PRIMARY KEY (tenSanBayDi,tenSanBayDen,hangBay,hangVe),
  
  KEY FK_giave_chuyenbay_tenSanBayDi_idx (tenSanBayDi),
  KEY FK_giave_chuyenbay_tenSanBayDen_idx (tenSanBayDen),
  KEY FK_giave_maybay_hangBay_idx (hangBay),
  KEY FK_giave_hangve_hangVe_idx (hangVe),
  KEY FK_giave_vemaybay_idx (giaVe),
  CONSTRAINT FK_giave_chuyenbay_tenSanBayDi FOREIGN KEY (tenSanBayDi) REFERENCES chuyenbay(tenSanBayDi),
  CONSTRAINT FK_giave_chuyenbay_tenSanBayDen FOREIGN KEY (tenSanBayDen) REFERENCES chuyenbay(tenSanBayDen),
  CONSTRAINT FK_giave_maybay_hangBay FOREIGN KEY (hangBay) REFERENCES maybay(hangBay),
  CONSTRAINT FK_giave_hangve_hangVe FOREIGN KEY (hangVe) REFERENCES hangve(hangVe)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo bảng loaitk
CREATE TABLE loaitk (
	id int NOT NULL,
    tk varchar(100) NOT NULL,
    
    PRIMARY KEY (id),
	KEY FK_id_idx (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo Bảng users
CREATE TABLE users (
  id int NOT NULL,
  hoTen varchar(100) NOT NULL,
  tenTK varchar(100) NOT NULL,
  matKhau varchar(100) NOT NULL,
  trangThai bool DEFAULT TRUE NOT NULL ,
  idLoaiTK int NOT NULL,
  idCard varchar(12) NOT NULL,
  email varchar(100) NULL,
  sdt varchar(10) NULL,
  
  PRIMARY KEY (id),
  
  KEY FK_users_id_idx (id),
  KEY FK_users_hoTen_idx (hoTen),
  KEY FK_users_idLoaiTK_idx (idLoaiTK),
  CONSTRAINT FK_users_loaitk FOREIGN KEY (idLoaiTK) REFERENCES loaitk(id)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo Bảng khachhang
CREATE TABLE khachhang (
  maKH int NOT NULL AUTO_INCREMENT,
  tenKH varchar(100) NOT NULL,
  idCard varchar(12) NOT NULL,
  email varchar(100) NULL,
  sdt varchar(10) NULL,
  
  PRIMARY KEY (tenKH),
  
  KEY FK_khachhang_maKH_idx (maKH)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo Bảng vemaybay
CREATE TABLE vemaybay (
  maVe int NOT NULL AUTO_INCREMENT,
  hangVe varchar(100) NOT NULL,
  giaVe decimal NOT NULL,
  maGhe varchar(5) NOT NULL,
  ngayXuatVe varchar(19) NOT NULL,
  tenNguoiDat varchar(100) NOT NULL,
  tenKH varchar(100) NOT NULL,
  maChuyenBay varchar(10) NOT NULL,
  
  PRIMARY KEY (maVe),
  
  KEY FK_vemaybay_maGhe_idx (maGhe),
  KEY FK_vemaybay_maChuyenBay_idx (maChuyenBay),
  KEY FK_vemaybay_khachhang_tenKH_idx (tenKH),
  KEY FK_vemaybay_users_tenNguoiDat_idx (tenNguoiDat),
  KEY FK_vemaybay_maVe_idx (maVe),
  KEY FK_vemaybay_hangVe_idx (hangVe),
  KEY FK_vemaybay_giaVe_idx (giaVe),
  CONSTRAINT FK_vemaybay_maGhe FOREIGN KEY (maGhe) REFERENCES ghe(maGhe),
  CONSTRAINT FK_vemaybay_maChuyenBay FOREIGN KEY (maChuyenBay) REFERENCES chuyenbay(maChuyenBay),
  CONSTRAINT FK_vemaybay_khachhang_tenKH FOREIGN KEY (tenKH) REFERENCES khachhang(tenKH),
  CONSTRAINT FK_vemaybay_users_tenNguoiDat FOREIGN KEY (tenNguoiDat) REFERENCES users(hoTen),
  CONSTRAINT FK_vemaybay_hangVe FOREIGN KEY (hangVe) REFERENCES hangve(hangVe),
  CONSTRAINT FK_vemaybay_giaVe FOREIGN KEY (giaVe) REFERENCES giave(giaVe)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#Tạo Bảng phieudatcho
CREATE TABLE phieudatcho (
  maPhieu int NOT NULL AUTO_INCREMENT,
  maVe int NOT NULL,
  tenKH varchar(100) NOT NULL,
  ngayDatVe varchar(19) NOT NULL,
  
  PRIMARY KEY (maPhieu),
  
  KEY FK_phieudatcho_maVe_idx (maVe),
  KEY FK_phieudatcho_tenKH_idx (tenKH),
  CONSTRAINT FK_phieudatcho_maVe FOREIGN KEY (maVe) REFERENCES vemaybay(maVe),
  CONSTRAINT FK_phieudatcho_tenKH FOREIGN KEY (tenKH) REFERENCES khachhang(tenKH)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO flight.loaitk (id, tk) VALUES ('1', 'Nhân Viên');
INSERT INTO flight.loaitk (id, tk) VALUES ('2', 'Khách Hàng');

INSERT INTO flight.users (id, hoTen, tenTK, matKhau, idLoaiTK, idCard, email, sdt) VALUES ('1', 'Nhân Viên 01', 'NV01', '1234', '1', '023456789', 'nhanvien01@gmail.com', '0987654321');
INSERT INTO flight.users (id, hoTen, tenTK, matKhau, idLoaiTK, idCard, email, sdt) VALUES ('2', 'Nhân Viên 02', 'NV02', '1234', '1', '023456799', 'nhanvien02@gmail.com', '0987654322');
INSERT INTO flight.users (id, hoTen, tenTK, matKhau, idLoaiTK, idCard, email, sdt) VALUES ('3', 'Phạm Anh D', 'DPham', '1234', '2', '012345678910', 'phamanhdg@gmail.com', '0345678921');
INSERT INTO flight.users (id, hoTen, tenTK, matKhau, idLoaiTK, idCard, email, sdt) VALUES ('4', 'Nguyễn Thị Diễm M', 'MNguyen', '1234', '2', '012345678911', 'nguyenthidiemm@gmail.com', '0345678922');

INSERT INTO flight.khachhang (tenKH, idCard, email, sdt) VALUES ('Phạm Anh D', '012345678910', 'phamanhdg@gmail.com', '0345678921');
INSERT INTO flight.khachhang (tenKH, idCard, email, sdt) VALUES ('Nguyễn Thị Diễm M', '012345678911', 'nguyenthidiemm@gmail.com', '0345678922');
INSERT INTO flight.khachhang (tenKH, idCard, email, sdt) VALUES ('Lê Thị B', '012345678777', 'lethib@gmail.com', '0988775555');
INSERT INTO flight.khachhang (tenKH, idCard, email, sdt) VALUES ('Nguyễn Văn A', '012345678999', 'nguyenvana@gmail.com', '0988775544');
INSERT INTO flight.khachhang (tenKH, idCard, email, sdt) VALUES ('Trần Thị C', '012345678888', 'tranthic@gmail.com', '0988775511');

INSERT INTO flight.hangve (id, hangVe) VALUES ('1', 'Phổ thông');
INSERT INTO flight.hangve (id, hangVe) VALUES ('2', 'Phổ thông đặc biệt');
INSERT INTO flight.hangve (id, hangVe) VALUES ('3', 'Thương gia');

INSERT INTO flight.ghe (maGhe, trangThai, hangVe) VALUES ('1', '1', 'Thương gia');
INSERT INTO flight.ghe (maGhe, trangThai, hangVe) VALUES ('2', '1', 'Phổ thông');
INSERT INTO flight.ghe (maGhe, trangThai, hangVe) VALUES ('3', '1', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, trangThai, hangVe) VALUES ('4', '1', 'Phổ thông đặc biệt');

INSERT INTO flight.maybay (soHieuMayBay, hangBay) VALUES ('VNA01', 'Vietnam Airlines');
INSERT INTO flight.maybay (soHieuMayBay, hangBay) VALUES ('BA01', 'Bamboo Airways');

INSERT INTO flight.sanbay (maSanBay, tenSanBay, diaDiem, quocGia, trangThai) VALUES ('1', 'Tân Sơn Nhất', 'HCM', 'VN', '1');
INSERT INTO flight.sanbay (maSanBay, tenSanBay, diaDiem, quocGia, trangThai) VALUES ('2', 'Mộc Bài', 'HN', 'VN', '1');

INSERT INTO flight.maybay_ghe (soHieuMayBay, maGhe) VALUES ('VNA01', '1');
INSERT INTO flight.maybay_ghe (soHieuMayBay, maGhe) VALUES ('BA01', '2');

INSERT INTO flight.chuyenbay (maChuyenBay,ngayGioKhoiHanh,ngayGioDen,tenSanBayDi,tenSanBayDen,soHieuMayBay) VALUES ('1','07:00:00 2020-05-20','12:00:00 2020-05-20','Mộc Bài','Tân Sơn Nhất','VNA01');
INSERT INTO flight.chuyenbay (maChuyenBay,ngayGioKhoiHanh,ngayGioDen,tenSanBayDi,tenSanBayDen,soHieuMayBay) VALUES ('2','17:00:00 2020-06-25','20:00:00 2020-06-27','Tân Sơn Nhất','Mộc Bài','BA01');

INSERT INTO flight.giave (tenSanBayDi,tenSanBayDen,hangBay,hangVe,giaVe) VALUES ('Tân Sơn Nhất','Mộc Bài','Vietnam Airlines','Phổ thông','100000');
INSERT INTO flight.giave (tenSanBayDi,tenSanBayDen,hangBay,hangVe,giaVe) VALUES ('Tân Sơn Nhất','Mộc Bài','Vietnam Airlines','Phổ thông đặc biệt','120000');
INSERT INTO flight.giave (tenSanBayDi,tenSanBayDen,hangBay,hangVe,giaVe) VALUES ('Tân Sơn Nhất','Mộc Bài','Vietnam Airlines','Thương gia','200000');
INSERT INTO flight.giave (tenSanBayDi,tenSanBayDen,hangBay,hangVe,giaVe) VALUES ('Mộc Bài','Tân Sơn Nhất','Vietnam Airlines','Phổ thông','100000');
INSERT INTO flight.giave (tenSanBayDi,tenSanBayDen,hangBay,hangVe,giaVe) VALUES ('Mộc Bài','Tân Sơn Nhất','Vietnam Airlines','Phổ thông đặc biệt','120000');
INSERT INTO flight.giave (tenSanBayDi,tenSanBayDen,hangBay,hangVe,giaVe) VALUES ('Mộc Bài','Tân Sơn Nhất','Vietnam Airlines','Thương gia','200000');
INSERT INTO flight.giave (tenSanBayDi,tenSanBayDen,hangBay,hangVe,giaVe) VALUES ('Mộc Bài','Tân Sơn Nhất','Bamboo Airways','Phổ thông','90000');
INSERT INTO flight.giave (tenSanBayDi,tenSanBayDen,hangBay,hangVe,giaVe) VALUES ('Mộc Bài','Tân Sơn Nhất','Bamboo Airways','Phổ thông đặc biệt','100000');
INSERT INTO flight.giave (tenSanBayDi,tenSanBayDen,hangBay,hangVe,giaVe) VALUES ('Mộc Bài','Tân Sơn Nhất','Bamboo Airways','Thương gia','150000');
INSERT INTO flight.giave (tenSanBayDi,tenSanBayDen,hangBay,hangVe,giaVe) VALUES ('Tân Sơn Nhất','Mộc Bài','Bamboo Airways','Phổ thông','90000');
INSERT INTO flight.giave (tenSanBayDi,tenSanBayDen,hangBay,hangVe,giaVe) VALUES ('Tân Sơn Nhất','Mộc Bài','Bamboo Airways','Phổ thông đặc biệt','100000');
INSERT INTO flight.giave (tenSanBayDi,tenSanBayDen,hangBay,hangVe,giaVe) VALUES ('Tân Sơn Nhất','Mộc Bài','Bamboo Airways','Thương gia','150000');

INSERT INTO flight.sanbay_maybay (maSanBay, soHieuMayBay, ngayDauTaiSanBay) VALUES ('1', 'VNA01', '05:50:002021-03-20');
INSERT INTO flight.sanbay_maybay (maSanBay, soHieuMayBay, ngayDauTaiSanBay) VALUES ('2', 'BA01', '20:30:002021-01-01');

INSERT INTO flight.vemaybay (hangVe, giaVe, maGhe, ngayXuatVe, tenNguoiDat, tenKH, maChuyenBay) VALUES ('Phổ thông đặc biệt', '120000', '4', '04:00:00 2021-01-20', 'Nhân Viên 01', 'Lê Thị B', '1');
INSERT INTO flight.vemaybay (hangVe, giaVe, maGhe, ngayXuatVe, tenNguoiDat, tenKH, maChuyenBay) VALUES ('Phổ thông', '100000', '1', '05:50:00 2021-03-10', 'Phạm Anh D', 'Phạm Anh D', '1');
INSERT INTO flight.vemaybay (hangVe, giaVe, maGhe, ngayXuatVe, tenNguoiDat, tenKH, maChuyenBay) VALUES ('Thương gia', '150000', '4', '22:20:21 2021-03-15', 'Nguyễn Thị Diễm M', 'Nguyễn Thị Diễm M', '2');
INSERT INTO flight.vemaybay (hangVe, giaVe, maGhe, ngayXuatVe, tenNguoiDat, tenKH, maChuyenBay) VALUES ('Phổ thông đặc biệt', '100000', '4', '12:30:00 2021-04-01', 'Nguyễn Thị Diễm M', 'Nguyễn Văn A', '2');
INSERT INTO flight.vemaybay (hangVe, giaVe, maGhe, ngayXuatVe, tenNguoiDat, tenKH, maChuyenBay) VALUES ('Thương gia', '200000', '4', '18:22:31 2021-04-20', 'Phạm Anh D', 'Trần Thị C', '1');

INSERT INTO flight.phieudatcho (maVe, tenKH, ngayDatVe) VALUES ('1', 'Lê Thị B', '04:00:00 2021-01-20');
INSERT INTO flight.phieudatcho (maVe, tenKH, ngayDatVe) VALUES ('4', 'Nguyễn Văn A', '12:30:00 2021-04-01');
INSERT INTO flight.phieudatcho (maVe, tenKH, ngayDatVe) VALUES ('5', 'Trần Thị C', '18:22:31 2021-04-20');


