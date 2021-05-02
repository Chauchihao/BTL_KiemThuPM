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
     
    public KhachHang getKhachHang(String tenKH) throws SQLException {
        
        String sql = "SELECT * FROM khachhang WHERE tenKH=?";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, tenKH);
        
        ResultSet rs = stm.executeQuery();
        KhachHang kh = null;
        while (rs.next()) {
            kh = new KhachHang();
            kh.setMaKH(rs.getInt("maKH"));
            kh.setTenKH(rs.getString("tenKH"));
            kh.setIdCard(rs.getString("idCard"));
            kh.setEmail(rs.getString("email"));
            kh.setSdt(rs.getString("sdt"));
            
        }
        return kh;
    }
    
    public boolean addKhachHang(KhachHang kh) throws SQLException {
        String sql = "INSERT INTO khachhang(tenKH, idCard, email, sdt) VALUES(?, ?, ?, ?)";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, kh.getTenKH());
        stm.setString(2, kh.getIdCard());
        stm.setString(3, kh.getEmail());
        stm.setString(4, kh.getSdt());
        
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
