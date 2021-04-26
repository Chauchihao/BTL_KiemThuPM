/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight;

import com.mycompany.pojo.ChuyenBay;
import com.mycompany.service.ChuyenBayService;
import com.mycompany.service.JdbcUtils;
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
import javafx.scene.control.DatePicker;

/**
 *
 * @author Admin
 */
public class TraCuuChuyenBayController {
    public class DangNhapController implements Initializable {
        @FXML private ChoiceBox cbNoiDi;
        @FXML private ChoiceBox cbNoiDen;
        @FXML private DatePicker ngayKhoiHanh;
        @FXML private DatePicker ngayVe;
        @FXML private Button btTraCuu;
        @FXML private Button btTiepTuc;
        @FXML private Button btThoat;
    
        @Override
        public void initialize(URL url, ResourceBundle rb) {
            try {
                Connection conn = JdbcUtils.getConn();
                ChuyenBayService s = new ChuyenBayService(conn);
                ChuyenBay cb = new ChuyenBay();
                //this.cbNoiDi.setItems(FXCollections.observableList(s.getChuyenBay()));

                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(DangNhapController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    
    
    }
}