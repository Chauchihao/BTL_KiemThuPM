/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight;

import com.mycompany.pojo.ChuyenBay;
import com.mycompany.pojo.Users;
import com.mycompany.pojo.VeMayBay;
import com.mycompany.service.ChuyenBayService;
import com.mycompany.service.JdbcUtils;
import com.mycompany.service.KhachHangService;
import com.mycompany.service.PhieuDatChoService;
import com.mycompany.service.UsersService;
import com.mycompany.service.VeMayBayService;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.TableCell;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;

/**
 *
 * @author Admin
 */
public class TraCuuVeController implements Initializable {
    @FXML private TextField txtMaVe;
    @FXML private TextField txtMaCB;
    @FXML private TextField txtTenKH;
    @FXML private TextField txtTenNguoiDat;
    @FXML private Label lbHidden;
    @FXML private TableView<VeMayBay> tbVeMayBay;
    Users nd;
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        
        loadTable();
        loadVeMayBay(0, "", "", "");
            
        
            
//        this.txtMaVe.textProperty().addListener((obj) -> {
//                int maVe = 0;
//                String maCB = "";
//                String tenKH = "";
//                String tenNguoiDat = "";
////
////                VeMayBay vmb = (VeMayBay) this.cbMaVe.getSelectionModel().getSelectedItem();
////                ChuyenBay cb = (ChuyenBay) this.cbMaCB.getSelectionModel().getSelectedItem();
//                if (this.txtMaVe.getText().isEmpty() == false)
//                    maVe = Integer.parseInt(this.txtMaVe.getText());
//                if (this.txtMaCB.getText().isEmpty() == false)
//                    maCB = this.txtMaCB.getText();
//                if (this.txtTenKH.getText().isEmpty() == false)
//                    tenKH = this.txtTenKH.getText();
//                if (this.txtTenNguoiDat.getText() != null)
//                    tenNguoiDat = this.txtTenNguoiDat.getText();
//                
//                loadVeMayBay(maVe, maCB, tenKH, tenNguoiDat);
//        });
        
        this.txtMaVe.textProperty().addListener((obj) -> {
            nhapDL();
        });
        
        this.txtMaCB.textProperty().addListener((obj) -> {
            nhapDL();
        });
        this.txtTenKH.textProperty().addListener((obj) -> {
            nhapDL();
        });
        this.txtTenNguoiDat.textProperty().addListener((obj) -> {
            nhapDL();
        });
        
        
    }
    
    public void setTTUser(Users u){
        try {
            Connection conn = JdbcUtils.getConn();
            UsersService us = new UsersService(conn);
            this.lbHidden.setText(u.getTenTK());
            //nd = us.getUsers(u.getTenTK());
        } catch (SQLException ex) {
            Logger.getLogger(TraCuuVeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void loadVeMayBay(int maVe, String maCB, String tenKH, String tenNguoiDat){
        
        try {
            this.tbVeMayBay.getItems().clear();
            Connection conn = JdbcUtils.getConn();
            VeMayBayService vmbs = new VeMayBayService(conn);
            this.tbVeMayBay.setItems(FXCollections.observableList(
                    vmbs.getVeMayBays(maVe, maCB, tenKH, tenNguoiDat)));
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(TraCuuVeController.class.getName()).log(Level.SEVERE, null, ex);
        } 
        
    }
    
    private void loadTable() {
        TableColumn colMaVe = new TableColumn("Mã Vé");
        colMaVe.setCellValueFactory(new PropertyValueFactory("maVe"));
        
        TableColumn colHangVe = new TableColumn("Hạng Vé");
        colHangVe.setCellValueFactory(new PropertyValueFactory("hangVe"));
        
        TableColumn colGiaVe = new TableColumn("Giá Vé");
        colGiaVe.setCellValueFactory(new PropertyValueFactory("giaVe"));
        
        TableColumn colMaGhe = new TableColumn("Mã Ghế");
        colMaGhe.setCellValueFactory(new PropertyValueFactory("maGhe"));
        
        TableColumn colNgayXuatVe = new TableColumn("Ngày Xuất Vé");
        colNgayXuatVe.setCellValueFactory(new PropertyValueFactory("ngayXuatVe"));
        
        TableColumn colTenNguoiDat = new TableColumn("Tên Người Đặt");
        colTenNguoiDat.setCellValueFactory(new PropertyValueFactory("tenNguoiDat"));
        
        TableColumn colTenKH = new TableColumn("Tên Khách Hàng");
        colTenKH.setCellValueFactory(new PropertyValueFactory("tenKH"));
        
        TableColumn colMaCB = new TableColumn("Mã Chuyến Bay");
        colMaCB.setCellValueFactory(new PropertyValueFactory("maCB"));
        
        TableColumn colAction = new TableColumn();
        colAction.setCellFactory((obj) -> {
            Button btn = new Button("Hủy Vé");
            
            btn.setOnAction(evt -> {
                Utils.getBox("Bạn có xác nhận hủy không?", Alert.AlertType.CONFIRMATION)
                     .showAndWait().ifPresent(bt -> {
                         if (bt == ButtonType.OK) {
                             try {
                                 TableCell cell = (TableCell) ((Button) evt.getSource()).getParent();
                                 VeMayBay vmb = (VeMayBay) cell.getTableRow().getItem();
                                 
                                 Connection conn = JdbcUtils.getConn();
                                 VeMayBayService vmbs = new VeMayBayService(conn);
                                 PhieuDatChoService pdcs = new PhieuDatChoService(conn);
                                 
                                 if (pdcs.getPhieuDatChoByMaVe(vmb.getMaVe()) != null)
                                 {
                                    if (pdcs.delelePhieuDatCho(vmb.getMaVe())){
                                       if (vmbs.deleleVeMayBay(vmb.getMaVe())) {
                                           Utils.getBox("SUCCESSFUL", Alert.AlertType.INFORMATION).show();
                                           loadVeMayBay(0, "", "", "");
                                       } else
                                           Utils.getBox("FAILED", Alert.AlertType.ERROR).show();
                                    }
                                 }
                                else {
                                    if (vmbs.deleleVeMayBay(vmb.getMaVe())) {
                                       Utils.getBox("SUCCESSFUL", Alert.AlertType.INFORMATION).show();
                                       loadVeMayBay(0, "", "", "");
                                   } else
                                       Utils.getBox("FAILED", Alert.AlertType.ERROR).show();
                                 }
                                 
                                 conn.close();
                             } catch (SQLException ex) {
                                 
                                 ex.printStackTrace();
                                 Logger.getLogger(PrimaryController.class.getName()).log(Level.SEVERE, null, ex);
                             }
                         }
                     });
                
                
               
            });
            
            TableCell cell = new TableCell();
            cell.setGraphic(btn);
            return cell;
        });
        
        
        this.tbVeMayBay.getColumns().addAll(colMaVe, colMaCB, colHangVe, colMaGhe, colTenKH, colTenNguoiDat, colGiaVe, colNgayXuatVe, colAction);
    }
    
    
    public void nhapDL() {
        int maVe = 0;
        String maCB = "";
        String tenKH = "";
        String tenNguoiDat = "";

        if (this.txtMaVe.getText().isEmpty() == false)
            maVe = Integer.parseInt(this.txtMaVe.getText());
        if (this.txtMaCB.getText().isEmpty() == false)
            maCB = this.txtMaCB.getText();
        if (this.txtTenKH.getText().isEmpty() == false)
            tenKH = this.txtTenKH.getText();
        if (this.txtTenNguoiDat.getText() != null)
            tenNguoiDat = this.txtTenNguoiDat.getText();

        loadVeMayBay(maVe, maCB, tenKH, tenNguoiDat);
    }
    
    public void logoutHandler(ActionEvent evt) throws IOException {
        Parent dangnhap;
        Stage stage = (Stage)((Node) evt.getSource()).getScene().getWindow();
        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource("dangnhap.fxml"));
        dangnhap = loader.load();
        Scene scene = new Scene(dangnhap);
        stage.setScene(scene);
        stage.show();

    }
    
    public void continueHandler(ActionEvent evt) throws IOException {
        Parent trangChuKhach;
        var path="";
        if (nd.getIdLoaiTK() == 1)
            path = "UInhanvien.fxml";
        if (nd.getIdLoaiTK() == 2)
            path = "UIkhachhang.fxml";
        Stage stage = (Stage)((Node) evt.getSource()).getScene().getWindow();
        FXMLLoader loader = new FXMLLoader();
        loader.setLocation(getClass().getResource(path));
        trangChuKhach = loader.load();
        Scene scene = new Scene(trangChuKhach);
        TrangChuController controller = loader.getController();
        controller.setTenTK(nd);
        stage.setScene(scene);
        stage.show();
    }
}
