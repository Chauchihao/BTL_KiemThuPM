/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.pojo.KhachHangTest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author M
 */
public class KhachHangTestService {
    private Connection conn;

    public KhachHangTestService(Connection conn) {
        this.conn = conn;
    }
     
    public List<KhachHangTest> getKhachHangTests(String kw) throws SQLException {
        if (kw == null)
            throw new SQLDataException();
        
        String sql = "SELECT * FROM khachhang WHERE name like concat('%', ?, '%') ORDER BY id DESC";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, kw);
        
        ResultSet rs = stm.executeQuery();
        List<KhachHangTest> khachhang = new ArrayList<>();
        while (rs.next()) {
            KhachHangTest p = new KhachHangTest();
            p.setMaKH(rs.getInt("maKH"));
            p.setTenKH(rs.getString("tenKH"));
            p.setEmail(rs.getString("email"));
            p.setSdt(rs.getString("sdt"));
            
            khachhang.add(p);
        }
        return khachhang;
    }
}
