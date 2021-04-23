/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight;

import com.mycompany.pojo.Users;
import com.mycompany.service.JdbcUtils;
import com.mycompany.service.UsersService;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextField;

/**
 *
 * @author Amin
 */
public class DangNhapController implements Initializable{
    @FXML private ComboBox<Users> cbLoaiTK;
    @FXML private TextField txtTenTK;
    @FXML private TextField txtMatKhau;
    @FXML private Button btDangNhap;
    

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        
        
    }
    
    public void dangNhapHandle(ActionEvent evt) {
        if (this.txtTenTK.getText().equals("")){
            Utils.getBox("Vui lòng điền tài khoản", Alert.AlertType.INFORMATION).show();
        }
        if (this.txtMatKhau.getText().equals("")){
            Utils.getBox("Vui lòng điền mật khẩu", Alert.AlertType.INFORMATION).show();
        }
        try {
            Connection conn = JdbcUtils.getConn();
            UsersService s = new UsersService(conn);
            
            Users u = new Users();
            u.setTenTK(txtTenTK.getText());
            u.setMatKhau(txtMatKhau.getText());
            
            if (s.login(u) == true) {
                Utils.getBox("Đăng nhập thành công!", Alert.AlertType.INFORMATION).show();
            } else
                Utils.getBox("Đăng nhập thất bại", Alert.AlertType.INFORMATION).show();
            
        } catch (SQLException ex) {
            Logger.getLogger(DangNhapController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    

}
