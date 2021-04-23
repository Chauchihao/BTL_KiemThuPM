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
        String sql = "SELECT * FROM ghe WHERE maGhe like concat(?) ORDER BY maGhe DESC";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        
        ResultSet rs = stm.executeQuery();
        List<Ghe> ghe = new ArrayList<>();
        while (rs.next()) {
            Ghe g = new Ghe();
            g.setMaGhe(rs.getString("maGhe"));
            //g.setHangGhe(rs.getEnum("hangGhe"));
            g.setTrangThai(rs.getBoolean("trangThai"));
            
            ghe.add(g);
        }
        return ghe;
    }
}
