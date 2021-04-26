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
    
    public boolean login(Users u) throws SQLException{
        String sql = "SELECT * FROM users WHERE tenTK=? AND matKhau=?";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, u.getTenTK());
        stm.setString(2, u.getMatKhau());
        ResultSet rs = stm.executeQuery();
        
        if (rs.next())
            return true;
        return false;
    }
    
    public List<Users> getUsers(String tenTK) throws SQLException {
        String sql = "SELECT id, hoTen, tenTK FROM users WHERE tenTK=?";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, tenTK);
        
        ResultSet rs = stm.executeQuery();
        List<Users> users = new ArrayList<>();
        while (rs.next()) {
            Users u = new Users();
            u.setId(rs.getInt("id"));
            u.setHoTen(rs.getString("hoTen"));
            u.setTenTK(rs.getString("tenTK"));
            
            users.add(u);
        }
        return users;
    }
}
