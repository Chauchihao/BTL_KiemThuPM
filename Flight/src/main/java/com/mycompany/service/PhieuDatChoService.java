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
        String sql = "SELECT * FROM phieudatcho WHERE maPhieuDatCho like concat(?) ORDER BY maPhieuDatCho DESC";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        
        ResultSet rs = stm.executeQuery();
        List<PhieuDatCho> phieudatcho = new ArrayList<>();
        while (rs.next()) {
            PhieuDatCho pdc = new PhieuDatCho();
//            pdc.setMaKH(rs.getInt("maKH"));
//            pdc.setMaPhieu(rs.getString("maPhieu"));
//            pdc.getMaVe(rs.getString("maVe"));
//            pdc.getNgayDatVe(rs.getDate("ngayDatVe"));
//            pdc.setThoiGianDung(rs.getDate("ngayVe"));
//            pdc.setNoiDi(rs.getString("noiDen"));
//            pdc.setNoiDen(rs.getString("noiDi"));
//            pdc.setSanBayTrungGian(rs.getString("sanBayTrungGian"));
            
            phieudatcho.add(pdc);
        }
        return phieudatcho;
    }
}
