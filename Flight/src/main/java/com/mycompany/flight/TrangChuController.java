/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight;

import com.mycompany.pojo.Users;
import com.mycompany.service.JdbcUtils;
import com.mycompany.service.UsersService;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.stage.Stage;

/**
 *
 * @author Admin
 */
public class TrangChuController implements Initializable {
    @FXML private Label lbNhanVien;
    @FXML private Label lbKhachHang;
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
    }
    
    public void setTenTK(Users u){
        if (u.getIdLoaiTK() == 1)
            lbNhanVien.setText(u.getTenTK());
        if (u.getIdLoaiTK() == 2)
            lbKhachHang.setText(u.getTenTK());
    }
    
    public void traCuuCBHandler(ActionEvent evt) {
        try {
            Parent cb;
            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(getClass().getResource("tracuuchuyenbay.fxml"));
            cb = loader.load();
            Scene scene = new Scene(cb);
            Stage stage = new Stage();
            stage.setScene(scene);
            stage.show();
        } catch (IOException ex) {
            Logger.getLogger(TrangChuController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void traCuuVeHandler(ActionEvent evt) {
        try {
            Parent v;
            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(getClass().getResource("tracuuve.fxml"));
            v = loader.load();
            Scene scene = new Scene(v);
            Stage stage = new Stage();
            stage.setScene(scene);
            stage.show();
        } catch (IOException ex) {
            Logger.getLogger(TrangChuController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void datVeTaiQuayHandler(ActionEvent evt) {
        try {
            Parent cb;
            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(getClass().getResource("datvetaiquay.fxml"));
            cb = loader.load();
            Scene scene = new Scene(cb);
            Stage stage = new Stage();
            stage.setScene(scene);
            stage.show();
        } catch (IOException ex) {
            Logger.getLogger(TrangChuController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void datVeOnlineHandler(ActionEvent evt) {
        try {
            Parent v;
            FXMLLoader loader = new FXMLLoader();
            loader.setLocation(getClass().getResource("datveonline.fxml"));
            v = loader.load();
            Scene scene = new Scene(v);
            Stage stage = new Stage();
            stage.setScene(scene);
            stage.show();
        } catch (IOException ex) {
            Logger.getLogger(TrangChuController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
