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
import java.sql.Statement;
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
        Statement stm = this.conn.createStatement();
        ResultSet r = stm.executeQuery("SELECT * FROM chuyenbay");
        
        
        List<ChuyenBay> chuyenbay = new ArrayList<>();
        while (r.next()) {
            ChuyenBay cb = new ChuyenBay();
            cb.setMaChuyenBay(r.getString("maChuyenBay"));
            cb.setSoHieuMayBay(r.getString("soHieuMayBay"));
            cb.setNgayGioKhoiHanh(r.getDate("ngayGioKhoiHanh"));
            cb.setNgayGioDen(r.getDate("ngayGioDen"));
            cb.setMaSanBayDi(r.getString("maSanBayDi"));
            cb.setMaSanBayDen(r.getString("maSanBayDen"));
            cb.setSanBayTrungGian(r.getString("sanBayTrungGian"));
            
            chuyenbay.add(cb);
        }
        return chuyenbay;
    }
    
    public ChuyenBay getChuyenBayByMaCB(String maCB) throws SQLException {
        String sql = "SELECT * FROM chuyenbay WHERE maChuyenBay=?";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, maCB);
        
        ResultSet r = stm.executeQuery();
        ChuyenBay cb = null;
        while (r.next()) {
            cb = new ChuyenBay();
            cb.setMaChuyenBay(r.getString("maChuyenBay"));
            cb.setSoHieuMayBay(r.getString("soHieuMayBay"));
            cb.setNgayGioKhoiHanh(r.getDate("ngayGioKhoiHanh"));
            cb.setNgayGioDen(r.getDate("ngayGioDen"));
            cb.setMaSanBayDi(r.getString("maSanBayDi"));
            cb.setMaSanBayDen(r.getString("maSanBayDen"));
            cb.setSanBayTrungGian(r.getString("sanBayTrungGian"));
            
        }
        
        return cb;
    }
}
