/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight;

import com.mycompany.pojo.Users;
import com.mycompany.pojo.LoaiTK;
import com.mycompany.service.JdbcUtils;
import com.mycompany.service.LoaiTKService;
import com.mycompany.service.UsersService;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

/**
 *
 * @author Amin
 */
public class DangNhapController implements Initializable {
    @FXML private ChoiceBox<LoaiTK> cbLoaiTK;
    @FXML private TextField txtTenTK;
    @FXML private PasswordField txtMatKhau;
    @FXML private Button btDangNhap;
    

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        try {
            Connection conn = JdbcUtils.getConn();
            LoaiTKService s = new LoaiTKService(conn);
            
            this.cbLoaiTK.setItems(FXCollections.observableList(s.getLoaiTK()));
            
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DangNhapController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void dangNhapHandler(ActionEvent evt) {
        
        try {
            Connection conn = JdbcUtils.getConn();
            UsersService s = new UsersService(conn);
            
            Users u = new Users();
            u.setIdLoaiTK(this.cbLoaiTK.getSelectionModel().getSelectedItem().getId());
            u.setTenTK(this.txtTenTK.getText());
            u.setMatKhau(this.txtMatKhau.getText());
            if (s.login(u) == true){
                Parent trangchu;
                var path= "";
                Utils.getBox("Đăng nhập thành công!", Alert.AlertType.INFORMATION).show();
                try {
                    if (u.getIdLoaiTK() == 1)
                        path = "UInhanvien.fxml";
                    if (u.getIdLoaiTK() == 2)
                        path = "UIkhachhang.fxml";
                    FXMLLoader loader = new FXMLLoader();
                    loader.setLocation(getClass().getResource(path));
                    trangchu = loader.load();
                    Scene scene = new Scene(trangchu);
                    Stage stage = new Stage();
                    TrangChuController controller = loader.getController();
                    controller.setTenTK(u);
                    stage.setScene(scene);
                    stage.show();
                } catch (IOException ex) {
                    Logger.getLogger(DangNhapController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            else if (this.txtTenTK.getText().equals(""))
                Utils.getBox("Vui lòng điền tài khoản", Alert.AlertType.INFORMATION).show();
                else if (this.txtMatKhau.getText().equals(""))
                    Utils.getBox("Vui lòng điền mật khẩu", Alert.AlertType.INFORMATION).show();
                    else
                        Utils.getBox("Đăng nhập thất bại", Alert.AlertType.INFORMATION).show();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DangNhapController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
