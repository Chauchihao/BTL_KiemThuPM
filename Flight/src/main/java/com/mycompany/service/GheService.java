/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.pojo.Ghe;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class GheService {
    private Connection conn;

    public GheService(Connection conn) {
        this.conn = conn;
    }
    
    public List<Ghe> getGhe() throws SQLException {
        Statement stm = this.conn.createStatement();
        ResultSet r = stm.executeQuery("SELECT * FROM ghe");
        
        
        List<Ghe> ghe = new ArrayList<>();
        while (r.next()) {
            Ghe g = new Ghe();
            g.setMaGhe(r.getString("maGhe"));
            g.setTrangThai(r.getBoolean("trangThai"));
            g.setIdHangVe(r.getInt("idHangVe"));
            
            ghe.add(g);
        }
        return ghe;
    }
    
    //    public List<VeMayBay> getVeMayBayByMaCB(String maChuyenBay) throws SQLException {
//        String sql = "SELECT * FROM vemaybay WHERE maChuyenBay=?";
//        PreparedStatement stm = this.conn.prepareStatement(sql);
//        stm.setString(1, maChuyenBay);
//        
//        ResultSet rs = stm.executeQuery();
//        List<VeMayBay> vmb = new ArrayList<>();
//        while (rs.next()) {
//            VeMayBay v = new VeMayBay();
//            v.setHangVe(rs.getInt("hangVe"));
//            v.setMaGhe(rs.getString("maGhe"));
//            
//            vmb.add(v);
//        }
//        
//        return vmb;
//    }
}
