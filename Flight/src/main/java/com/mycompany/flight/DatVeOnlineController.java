/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight;

import com.mycompany.pojo.ChuyenBay;
import com.mycompany.pojo.VeMayBay;
import com.mycompany.service.ChuyenBayService;
import com.mycompany.service.JdbcUtils;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;

/**
 *
 * @author Admin
 */
public class DatVeOnlineController implements Initializable {
    @FXML private ChoiceBox<ChuyenBay> cbMaCB;
    @FXML private ChoiceBox<VeMayBay> cbHangve;
    @FXML private ChoiceBox<VeMayBay> cbViTri;
    @FXML private TextField txtGiaTien;
    @FXML private TextField txtHoTen;
    @FXML private TextField txtIDCard;
    @FXML private TextField txtSDT;
    @FXML private TextField txtEmail;
    

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        try {
            Connection conn = JdbcUtils.getConn();
            ChuyenBayService s = new ChuyenBayService(conn);
            
            this.cbMaCB.setItems(FXCollections.observableList(s.getMaChuyenBay()));
            
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DangNhapController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}

