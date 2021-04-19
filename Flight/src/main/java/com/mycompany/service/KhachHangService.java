/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.pojo.KhachHang;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class KhachHangService {
    private Connection conn;

    public KhachHangService(Connection conn) {
        this.conn = conn;
    }
     
    public List<KhachHang> getKhachHang(String kw) throws SQLException {
        if (kw == null)
            throw new SQLDataException();
        
        String sql = "SELECT * FROM khachhang WHERE tenKH like concat('%', ?, '%') ORDER BY maKH DESC";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, kw);
        
        ResultSet rs = stm.executeQuery();
        List<KhachHang> khachhang = new ArrayList<>();
        while (rs.next()) {
            KhachHang kh = new KhachHang();
            kh.setMaKH(rs.getInt("maKH"));
            kh.setTenKH(rs.getString("tenKH"));
            kh.setEmail(rs.getString("email"));
            kh.setSdt(rs.getString("sdt"));
            
            khachhang.add(kh);
        }
        return khachhang;
    }
    
    public boolean addKhachHang(KhachHang kh) throws SQLException {
        String sql = "INSERT INTO khachhang(tenKH, email, sdt) VALUES(?, ?, ?)";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, kh.getTenKH());
        stm.setString(2, kh.getEmail());
        stm.setString(3, kh.getSdt());
        
        int row = stm.executeUpdate();
        
        return row > 0;
    }
    
    public boolean deleleKhachHang(int maKH) throws SQLException {
        String sql = "DELETE FROM khachhang WHERE maKH=?";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setInt(1, maKH);
        
        int row = stm.executeUpdate();
        
        return row > 0;
    }
}
