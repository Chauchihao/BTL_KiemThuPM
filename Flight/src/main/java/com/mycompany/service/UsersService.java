/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.pojo.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.sql.SQLTransactionRollbackException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class UsersService {
    private Connection conn;

    public UsersService(Connection conn) {
        this.conn = conn;
    }
    
     
    public List<Users> getUsers(String kw) throws SQLException {
        if (kw == null)
            throw new SQLDataException();
        
        String sql = "SELECT * FROM users WHERE tenTK like concat('%', ?, '%') ORDER BY id DESC";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, kw);
        
        ResultSet rs = stm.executeQuery();
        List<Users> users = new ArrayList<>();
        while (rs.next()) {
            Users u = new Users();
            u.setId(rs.getInt("id"));
            u.setHoTen(rs.getString("hoTen"));
            u.setTenTK(rs.getString("tenTK"));
            u.setMatKhau(rs.getString("matKhau"));
            u.setTrangThai(rs.getBoolean("trangThai"));
            //Loi
            //.setLoaiTK(rs.getEnum("matKhau"));
            
            users.add(u);
        }
        return users;
    }
    
    
    public boolean addUsers(Users u) throws SQLException {
        String sql = "INSERT INTO users(hoTen, tenTK, matkhau, trangThai, "
                + "loaiTK, diachi, sdt) VALUES(?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, u.getHoTen());
        stm.setString(2, u.getTenTK());
        stm.setString(3, u.getMatKhau());
        stm.setBoolean(4, u.getTrangThai());
        //Loi
        //stm.setEnum(5, u.getLoaiTK());
        stm.setString(6, u.getDiaChi());
        stm.setString(7, u.getSdt());
        
        int row = stm.executeUpdate();
        
        return row > 0;
    }
    
    public boolean deleleUsers(int id) throws SQLException {
        String sql = "DELETE FROM users WHERE id=?";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setInt(1, id);
        
        int row = stm.executeUpdate();
        
        return row > 0;
    }
}
