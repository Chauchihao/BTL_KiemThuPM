/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight;

import com.mycompany.pojo.ChuyenBay;
import com.mycompany.pojo.MayBay;
import com.mycompany.pojo.SanBay;
import com.mycompany.service.SanBayService;
import com.mycompany.pojo.Users;
import com.mycompany.service.ChuyenBayService;
import com.mycompany.service.JdbcUtils;
import com.mycompany.service.MayBayService;
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
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;

/**
 *
 * @author Admin
 */
public class TraCuuChuyenBayController implements Initializable {
    @FXML private ComboBox cbNoiDi_KH;
    @FXML private ComboBox cbNoiDen_KH;
    @FXML private ComboBox cbNoiDi_MC;
    @FXML private ComboBox cbNoiDen_MC;
    @FXML private DatePicker ngayKhoiHanh;
    @FXML private DatePicker ngayVe;
    @FXML private Button btTraCuu;
    @FXML private Button btTiepTuc;
    @FXML private Button btThoat;
    Users nd;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        try {
            Connection conn = JdbcUtils.getConn();
            SanBayService sbs = new SanBayService(conn);
            SanBay sb = new SanBay();
            this.cbNoiDi_KH.setItems(FXCollections.observableList(sbs.getSanBay()));
            this.cbNoiDen_KH.setItems(FXCollections.observableList(sbs.getSanBay()));
            this.cbNoiDi_MC.setItems(FXCollections.observableList(sbs.getSanBay()));
            this.cbNoiDen_MC.setItems(FXCollections.observableList(sbs.getSanBay()));
            
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(TraCuuChuyenBayController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void setTTUser(Users u){
        nd = u;
    }


}