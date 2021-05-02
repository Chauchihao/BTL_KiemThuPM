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
    
    public List<VeMayBay> getVeMayBay() throws SQLException {
        Statement stm = this.conn.createStatement();
        ResultSet r = stm.executeQuery("SELECT * FROM vemaybay");
        
        
        List<VeMayBay> vemaybay = new ArrayList<>();
        while (r.next()) {
            VeMayBay vmb = new VeMayBay();
            vmb.setMaVe(r.getInt("maVe"));
            vmb.setIdHangVe(r.getInt("idHangVe"));
            vmb.setGiaVe(r.getBigDecimal("giaVe"));
            vmb.setNgayXuatVe(r.getDate("ngayXuatVe"));
            vmb.setMaCB(r.getString("maChuyenBay"));
            vmb.setMaGhe(r.getString("maGhe"));
            vmb.setMaKH(r.getInt("maKH"));
            vmb.setMaNguoiDat(r.getInt("maNguoiDat"));
            
            vemaybay.add(vmb);
        }
        return vemaybay;
    }
    
    public boolean addVeMayBay(VeMayBay vmb) throws SQLException {
        String sql = "INSERT INTO vemaybay(idHangVe, giaVe, maGhe, ngayXuatVe"
                + ", maNguoiDat, maKH, maChuyenBay) VALUES(?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setInt(1, vmb.getIdHangVe());
        stm.setBigDecimal(2, vmb.getGiaVe());
        stm.setString(3, vmb.getMaGhe());
        stm.setDate(4, vmb.getNgayXuatVe());
        stm.setInt(5, vmb.getMaNguoiDat());
        stm.setInt(6, vmb.getMaKH());
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
