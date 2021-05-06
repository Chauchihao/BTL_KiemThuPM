/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.flight.Utils;
import com.mycompany.pojo.VeMayBay;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javafx.scene.control.Alert;

/**
 *
 * @author Admin
 */
public class VeMayBayService {
    private Connection conn;

    public VeMayBayService(Connection conn) {
        this.conn = conn;
    }
    public List<VeMayBay> getVeMayBays(int maVe, String maCB, String tenKH, String ngayXuatVe) throws SQLException{
//        if (maVe <= 0 || maCB == null || tenKH == null || ngayXuatVe == null)
//            throw new SQLDataException();
        
        String sql = "SELECT * FROM vemaybay"
                + " WHERE maVe like concat('%', ?, '%')"
                + " OR tenKH like concat('%', ?, '%')"
                + " OR maChuyenBay like concat('%', ?, '%')"
                + " OR ngayXuatVe like concat('%', ?, '%')";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        if (maVe == 0)
            stm.setString(1, null);
        else
            stm.setInt(1, maVe);
        if (maCB == "")
            stm.setString(2, null);
        else
            stm.setString(2, maCB);
        if (tenKH == "")
            stm.setString(3, null);
        else
            stm.setString(3, tenKH);
        if (ngayXuatVe == "")
            stm.setString(4, null);
        else
            stm.setString(4, ngayXuatVe);
        
        ResultSet rs = stm.executeQuery();
        
        List<VeMayBay> veMayBay = new ArrayList<>();
        while (rs.next()) {
            VeMayBay vmb = new VeMayBay();
            vmb.setMaVe(rs.getInt("maVe"));
            vmb.setHangVe(rs.getString("hangVe"));
            vmb.setGiaVe(rs.getBigDecimal("giaVe"));
            vmb.setMaGhe(rs.getString("maGhe"));
            vmb.setNgayXuatVe(rs.getString("ngayXuatVe"));
            vmb.setTenNguoiDat(rs.getString("tenNguoiDat"));
            vmb.setTenKH(rs.getString("tenKH"));
            vmb.setMaCB(rs.getString("maChuyenBay"));
            
            veMayBay.add(vmb);
        }
        return veMayBay;
    }
    
    public VeMayBay getVeMayBay(String ngayXuatVe, String tenKH) throws SQLException {
        String sql = "SELECT * FROM vemaybay WHERE ngayXuatVe = ? AND tenKH = ?";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, ngayXuatVe);
        stm.setString(2, tenKH);
        
        ResultSet rs = stm.executeQuery();
        VeMayBay vmb = null;
        while (rs.next()) {
            vmb = new VeMayBay();
            vmb.setMaVe(rs.getInt("maVe"));
            vmb.setHangVe(rs.getString("hangVe"));
            vmb.setGiaVe(rs.getBigDecimal("giaVe"));
            vmb.setNgayXuatVe(rs.getString("ngayXuatVe"));
            vmb.setTenNguoiDat(rs.getString("tenNguoiDat"));
            vmb.setTenKH(rs.getString("tenKH"));
            vmb.setMaCB(rs.getString("maChuyenBay"));
        }
        return vmb;
    }
    
    public List<VeMayBay> getVeMayBaysByMaNguoiDat(String tenNguoiDat) throws SQLException {
        String sql = "SELECT * FROM vemaybay WHERE tenNguoiDat = ?";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, tenNguoiDat);
        
        ResultSet rs = stm.executeQuery();
        List<VeMayBay> veMayBay = new ArrayList<>();
        while (rs.next()) {
            VeMayBay vmb = new VeMayBay();
            vmb.setMaVe(rs.getInt("maVe"));
            vmb.setHangVe(rs.getString("hangVe"));
            vmb.setGiaVe(rs.getBigDecimal("giaVe"));
            vmb.setNgayXuatVe(rs.getString("ngayXuatVe"));
            vmb.setTenNguoiDat(rs.getString("tenNguoiDat"));
            vmb.setTenKH(rs.getString("tenKH"));
            vmb.setMaCB(rs.getString("maChuyenBay"));
            veMayBay.add(vmb);
        }
        return veMayBay;
    }
    
    public boolean addVeMayBay(VeMayBay vmb) throws SQLException {
        String sql = "INSERT INTO vemaybay(hangVe, giaVe, maGhe, ngayXuatVe"
                + ", tenNguoiDat, tenKH, maChuyenBay) VALUES(?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, vmb.getHangVe());
        stm.setBigDecimal(2, vmb.getGiaVe());
        stm.setString(3, vmb.getMaGhe());
        stm.setString(4, vmb.getNgayXuatVe());
        stm.setString(5, vmb.getTenNguoiDat());
        stm.setString(6, vmb.getTenKH());
        stm.setString(7, vmb.getMaCB());
        
        int row = stm.executeUpdate();
        
        return row > 0;
    }
    
    public BigDecimal getGiaVeByMaCB(String maChuyenBay) throws SQLException {
        String sql = "SELECT giaVe FROM vemaybay WHERE maChuyenBay=?";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        ResultSet rs = stm.executeQuery();
        VeMayBay vmb = null;
        while (rs.next()) {
            vmb = new VeMayBay();
            vmb.setGiaVe(rs.getBigDecimal("giaVe"));
        }
        return vmb.getGiaVe();
    }
    
}
