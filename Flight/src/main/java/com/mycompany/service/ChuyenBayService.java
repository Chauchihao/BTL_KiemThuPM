/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.pojo.ChuyenBay;
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
public class ChuyenBayService {
    private Connection conn;

    public ChuyenBayService(Connection conn) {
        this.conn = conn;
    }
    
    public List<ChuyenBay> getChuyenBay() throws SQLException {
        String sql = "SELECT * FROM chuyenbay WHERE maChuyenBay like concat(?) ORDER BY maChuyenBay DESC";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        
        ResultSet rs = stm.executeQuery();
        List<ChuyenBay> chuyenbay = new ArrayList<>();
        while (rs.next()) {
            ChuyenBay cb = new ChuyenBay();
            cb.setMaChuyenBay(rs.getString("maChuyenBay"));
            cb.setSoHieuMayBay(rs.getString("soHieuMayBay"));
            cb.setNgayKhoiHanh(rs.getDate("ngayKhoiHanh"));
            cb.setThoiGianBay(rs.getDate("ngayVe"));
            cb.setThoiGianDung(rs.getDate("ngayVe"));
            cb.setNoiDi(rs.getString("noiDen"));
            cb.setNoiDen(rs.getString("noiDi"));
            cb.setSanBayTrungGian(rs.getString("sanBayTrungGian"));
            
            chuyenbay.add(cb);
        }
        return chuyenbay;
    }
}
