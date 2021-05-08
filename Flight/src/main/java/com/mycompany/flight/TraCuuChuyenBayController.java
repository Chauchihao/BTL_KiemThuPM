/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight;

import com.mycompany.pojo.Users;
import com.mycompany.service.SanBayService;
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
import javafx.scene.control.ComboBox;

/**
 *
 * @author Admin
 */
public class TraCuuChuyenBayController implements Initializable {
    @FXML private ChoiceBox cbNoiDi_KH;
    @FXML private ChoiceBox cbNoiDen_KH;

    
    Users nd;
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        try {
            Connection conn = JdbcUtils.getConn();
            SanBayService sbs = new SanBayService(conn);
            this.cbNoiDi_KH.setItems(FXCollections.observableList(sbs.getSanBay()));
            this.cbNoiDen_KH.setItems(FXCollections.observableList(sbs.getSanBay()));
            
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatVeOnlineController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void setTTUser(Users u){
        nd = u;
    }
    
}
