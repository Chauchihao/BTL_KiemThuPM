/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.pojo.PhieuDatCho;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */

public class PhieuDatChoService {
    private Connection conn;

    public PhieuDatChoService(Connection conn) {
        this.conn = conn;
    }
    
    public List<PhieuDatCho> getPhieuDatCho() throws SQLException {
        String sql = "SELECT * FROM phieudatcho WHERE maPhieuDatCho=?";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        
        ResultSet rs = stm.executeQuery();
        List<PhieuDatCho> phieudatcho = new ArrayList<>();
        while (rs.next()) {
            PhieuDatCho pdc = new PhieuDatCho();
            pdc.setMaKH(rs.getInt("maKH"));
            pdc.setMaPhieu(rs.getInt("maPhieuDatCho"));
            pdc.setMaVe(rs.getInt("maVe"));
            pdc.setNgayDatVe(rs.getString("ngayDatVe"));
            
            phieudatcho.add(pdc);
        }
        return phieudatcho;
    }
    
    public boolean addPhieuDatCho(PhieuDatCho pdc) throws SQLException {
        String sql = "INSERT INTO phieudatcho(maVe, maKH, ngayDatVe) VALUES(?, ?, ?)";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setInt(1, pdc.getMaVe());
        stm.setInt(2, pdc.getMaKH());
        stm.setString(3, pdc.getNgayDatVe());
        
        int row = stm.executeUpdate();
        
        return row > 0;
    }
    
}
