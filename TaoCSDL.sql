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
  hangVe varchar(100) NOT NULL,
  
  PRIMARY KEY (maGhe),
  KEY FK_ghe_hangVe_idx (hangVe),
  CONSTRAINT FK_ghe_hangVe FOREIGN KEY (hangVe) REFERENCES hangve(hangVe)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#Tạo bảng maybay_ghe
CREATE TABLE maybay_ghe (
  soHieuMayBay varchar(10) NOT NULL,
  maGhe varchar(5) NOT NULL,
  trangThai bool NOT NULL DEFAULT FALSE,
  
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
INSERT INTO flight.loaitk (id, tk) VALUES ('3', 'Admin');

INSERT INTO flight.users (id, hoTen, tenTK, matKhau, idLoaiTK, idCard, email, sdt) VALUES ('0', 'ADMIN', 'Admin', '123456', '3', '000000000000', 'admin@gmail.com', '1111111111');
INSERT INTO flight.users (id, hoTen, tenTK, matKhau, idLoaiTK, idCard, email, sdt) VALUES ('1', 'Nhân Viên 01', 'NV01', '123456', '1', '023456789', 'nhanvien01@gmail.com', '0987654321');
INSERT INTO flight.users (id, hoTen, tenTK, matKhau, idLoaiTK, idCard, email, sdt) VALUES ('2', 'Nhân Viên 02', 'NV02', '123456', '1', '023456799', 'nhanvien02@gmail.com', '0987654322');
INSERT INTO flight.users (id, hoTen, tenTK, matKhau, idLoaiTK, idCard, email, sdt) VALUES ('3', 'Phạm Anh D', 'DPham', '123456', '2', '012345678910', 'phamanhdg@gmail.com', '0345678921');
INSERT INTO flight.users (id, hoTen, tenTK, matKhau, idLoaiTK, idCard, email, sdt) VALUES ('4', 'Nguyễn Thị Diễm M', 'MNguyen', '1234', '2', '012345678911', 'nguyenthidiemm@gmail.com', '0345678922');

INSERT INTO flight.khachhang (tenKH, idCard, email, sdt) VALUES ('Lê Thị B', '012345678777', 'lethib@gmail.com', '0988775555');
INSERT INTO flight.khachhang (tenKH, idCard, email, sdt) VALUES ('Hoành Văn E', '012345678666', 'hoangvane@gmail.com', '0988775444');
INSERT INTO flight.khachhang (tenKH, idCard, email, sdt) VALUES ('Trương G', '012345678555', 'truongg@gmail.com', '0988775333');
INSERT INTO flight.khachhang (tenKH, idCard, email, sdt) VALUES ('Huỳnh N', '012345678444', 'huynhn@gmail.com', '0988775222');
INSERT INTO flight.khachhang (tenKH, idCard, email, sdt) VALUES ('Phạm Anh D', '012345678910', 'phamanhdg@gmail.com', '0345678921');
INSERT INTO flight.khachhang (tenKH, idCard, email, sdt) VALUES ('Nguyễn Thị Diễm M', '012345678911', 'nguyenthidiemm@gmail.com', '0345678922');
INSERT INTO flight.khachhang (tenKH, idCard, email, sdt) VALUES ('Nguyễn Văn A', '012345678999', 'nguyenvana@gmail.com', '0988775544');
INSERT INTO flight.khachhang (tenKH, idCard, email, sdt) VALUES ('Trần Thị C', '012345678888', 'tranthic@gmail.com', '0988775511');

INSERT INTO flight.hangve (id, hangVe) VALUES ('1', 'Phổ thông');
INSERT INTO flight.hangve (id, hangVe) VALUES ('2', 'Phổ thông đặc biệt');
INSERT INTO flight.hangve (id, hangVe) VALUES ('3', 'Thương gia');

INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S01', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S02', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S03', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S04', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S05', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S06', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S07', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S08', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S09', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S10', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S11', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S12', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S13', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S14', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S15', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S16', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S17', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S18', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S19', 'Thương gia');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('S20', 'Thương gia');

INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A01', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A02', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A03', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A04', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A05', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A06', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A07', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A08', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A09', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A10', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A11', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A12', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A13', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A14', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A15', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A16', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A17', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A18', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A19', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A20', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A21', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A22', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A23', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A24', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('A25', 'Phổ thông đặc biệt');

INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B01', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B02', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B03', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B04', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B05', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B06', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B07', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B08', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B09', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B10', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B11', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B12', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B13', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B14', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B15', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B16', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B17', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B18', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B19', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B20', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B21', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B22', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B23', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B24', 'Phổ thông đặc biệt');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('B25', 'Phổ thông đặc biệt');

INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C01', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C02', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C03', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C04', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C05', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C06', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C07', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C08', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C09', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C10', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C11', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C12', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C13', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C14', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C15', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C16', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C17', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C18', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C19', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C20', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C21', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C22', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C23', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C24', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('C25', 'Phổ Thông');

INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D01', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D02', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D03', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D04', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D05', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D06', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D07', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D08', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D09', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D10', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D11', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D12', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D13', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D14', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D15', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D16', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D17', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D18', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D19', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D20', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D21', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D22', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D23', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D24', 'Phổ Thông');
INSERT INTO flight.ghe (maGhe, hangVe) VALUES ('D25', 'Phổ Thông');


INSERT INTO flight.maybay (soHieuMayBay, hangBay) VALUES ('VNA01', 'Vietnam Airlines');
INSERT INTO flight.maybay (soHieuMayBay, hangBay) VALUES ('BA01', 'Bamboo Airways');

INSERT INTO flight.sanbay (maSanBay, tenSanBay, diaDiem, quocGia, trangThai) VALUES ('1', 'Tân Sơn Nhất', 'HCM', 'VN', '1');
INSERT INTO flight.sanbay (maSanBay, tenSanBay, diaDiem, quocGia, trangThai) VALUES ('2', 'Mộc Bài', 'HN', 'VN', '1');

INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S01');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S02');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 1, 'S03');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S04');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S05');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S06');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S07');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S08');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S09');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S10');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S11');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S12');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S13');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S14');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S15');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S16');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S17');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S18');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S19');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'S20');

INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 1, 'A01');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A02');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A03');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A04');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A05');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A06');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A07');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A08');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A09');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A10');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A11');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A12');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A13');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A14');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A15');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A16');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A17');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A18');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A19');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A20');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A21');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A22');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A23');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A24');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'A25');

INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B01');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B02');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B03');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B04');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B05');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B06');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B07');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B08');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B09');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B10');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B11');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B12');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B13');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B14');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B15');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B16');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B17');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B18');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B19');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B20');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B21');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B22');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B23');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B24');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'B25');

INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 1, 'C01');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C02');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C03');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C04');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C05');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C06');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C07');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C08');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C09');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C10');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C11');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C12');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C13');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C14');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C15');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C16');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C17');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C18');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C19');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C20');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C21');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C22');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C23');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C24');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'C25');

INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 1, 'D01');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D02');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D03');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D04');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D05');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D06');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D07');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D08');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D09');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D10');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D11');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D12');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D13');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D14');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D15');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D16');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D17');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D18');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D19');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D20');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D21');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D22');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D23');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D24');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('VNA01', 0, 'D25');

INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 1, 'S01');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 1, 'S02');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S03');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S04');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S05');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S06');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S07');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S08');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S09');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S10');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S11');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S12');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S13');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S14');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S15');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S16');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S17');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S18');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S19');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'S20');

INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A01');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 1, 'A02');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A03');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A04');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A05');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A06');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A07');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A08');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A09');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A10');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A11');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A12');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A13');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A14');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A15');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A16');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A17');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A18');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A19');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A20');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A21');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A22');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A23');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A24');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'A25');

INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B01');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 1, 'B02');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B03');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B04');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B05');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B06');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B07');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B08');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B09');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B10');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B11');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B12');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B13');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B14');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B15');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B16');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B17');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B18');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B19');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B20');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B21');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B22');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B23');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B24');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'B25');

INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C01');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C02');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C03');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C04');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C05');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C06');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C07');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C08');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C09');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C10');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C11');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C12');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C13');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C14');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C15');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C16');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C17');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C18');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C19');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C20');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C21');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C22');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C23');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C24');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'C25');

INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D01');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D02');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D03');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D04');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D05');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D06');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D07');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D08');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D09');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D10');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D11');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D12');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D13');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D14');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D15');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D16');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D17');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D18');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D19');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D20');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D21');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D22');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D23');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D24');
INSERT INTO flight.maybay_ghe (soHieuMayBay, trangThai, maGhe) VALUES ('BA01', 0, 'D25');


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

INSERT INTO flight.vemaybay (hangVe, giaVe, maGhe, ngayXuatVe, tenNguoiDat, tenKH, maChuyenBay) VALUES ('Phổ thông đặc biệt', '120000', 'A01', '04:00:00 2021-01-20', 'Nhân Viên 01', 'Lê Thị B', '1');
INSERT INTO flight.vemaybay (hangVe, giaVe, maGhe, ngayXuatVe, tenNguoiDat, tenKH, maChuyenBay) VALUES ('Phổ thông', '100000', 'C01', '05:00:00 2021-02-15', 'Nhân Viên 02', 'Hoành Văn E', '1');
INSERT INTO flight.vemaybay (hangVe, giaVe, maGhe, ngayXuatVe, tenNguoiDat, tenKH, maChuyenBay) VALUES ('Thương gia', '150000', 'S01', '06:00:00 2021-02-27', 'Nhân Viên 01', 'Trương G', '2');
INSERT INTO flight.vemaybay (hangVe, giaVe, maGhe, ngayXuatVe, tenNguoiDat, tenKH, maChuyenBay) VALUES ('Phổ thông đặc biệt', '100000', 'B01', '07:00:00 2021-03-02', 'Nhân Viên 02', 'Huỳnh N', '2');
INSERT INTO flight.vemaybay (hangVe, giaVe, maGhe, ngayXuatVe, tenNguoiDat, tenKH, maChuyenBay) VALUES ('Phổ thông', '100000', 'D01', '05:50:00 2021-03-10', 'Phạm Anh D', 'Phạm Anh D', '1');
INSERT INTO flight.vemaybay (hangVe, giaVe, maGhe, ngayXuatVe, tenNguoiDat, tenKH, maChuyenBay) VALUES ('Thương gia', '150000', 'S02', '22:20:21 2021-03-15', 'Nguyễn Thị Diễm M', 'Nguyễn Thị Diễm M', '2');
INSERT INTO flight.vemaybay (hangVe, giaVe, maGhe, ngayXuatVe, tenNguoiDat, tenKH, maChuyenBay) VALUES ('Phổ thông đặc biệt', '100000', 'A02', '12:30:00 2021-04-01', 'Phạm Anh D', 'Nguyễn Văn A', '2');
INSERT INTO flight.vemaybay (hangVe, giaVe, maGhe, ngayXuatVe, tenNguoiDat, tenKH, maChuyenBay) VALUES ('Thương gia', '200000', 'S03', '18:22:31 2021-04-20', 'Nguyễn Thị Diễm M', 'Trần Thị C', '1');

INSERT INTO flight.phieudatcho (maVe, tenKH, ngayDatVe) VALUES ('1', 'Lê Thị B', '04:00:00 2021-01-20');
INSERT INTO flight.phieudatcho (maVe, tenKH, ngayDatVe) VALUES ('2', 'Hoành Văn E', '05:00:00 2021-02-15');
INSERT INTO flight.phieudatcho (maVe, tenKH, ngayDatVe) VALUES ('3', 'Trương G', '06:00:00 2021-02-27');
INSERT INTO flight.phieudatcho (maVe, tenKH, ngayDatVe) VALUES ('4', 'Huỳnh N', '07:00:00 2021-03-02');



