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
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
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
    @FXML private DatePicker dpNgayXuatVe;
    @FXML private TableView<VeMayBay> tbVeMayBay;
    Users nd;
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        
        loadTable();
        loadVeMayBay(0, "", "", "");
            
            
        this.txtMaVe.textProperty().addListener((obj) -> {
                int maVe = 0;
                String maCB = "";
                String tenKH = "";
                String ngayXuatVe = "";
//
//                VeMayBay vmb = (VeMayBay) this.cbMaVe.getSelectionModel().getSelectedItem();
//                ChuyenBay cb = (ChuyenBay) this.cbMaCB.getSelectionModel().getSelectedItem();
                if (this.txtMaVe.getText().isEmpty() == false)
                    maVe = Integer.parseInt(this.txtMaVe.getText());
                if (this.txtMaCB.getText().isEmpty() == false)
                    maCB = this.txtMaCB.getText();
                if (this.txtTenKH.getText().isEmpty() == false)
                    tenKH = this.txtTenKH.getText();
                if (this.dpNgayXuatVe.getValue() != null)
                    ngayXuatVe = this.dpNgayXuatVe.getValue().toString();
                
                loadVeMayBay(maVe, maCB, tenKH, ngayXuatVe);
        });
        
        this.txtMaCB.textProperty().addListener((obj) -> {
                int maVe = 0;
                String maCB = "";
                String tenKH = "";
                String ngayXuatVe = "";
                
                if (this.txtMaVe.getText().isEmpty() == false)
                    maVe = Integer.parseInt(this.txtMaVe.getText());
                if (this.txtMaCB.getText().isEmpty() == false)
                    maCB = this.txtMaCB.getText();
                if (this.txtTenKH.getText().isEmpty() == false)
                    tenKH = this.txtTenKH.getText();
                if (this.dpNgayXuatVe.getValue() != null)
                    ngayXuatVe = this.dpNgayXuatVe.getValue().toString();
                
                loadVeMayBay(maVe, maCB, tenKH, ngayXuatVe);
        });
        
        this.txtTenKH.textProperty().addListener((obj) -> {
                int maVe = 0;
                String maCB = "";
                String tenKH = "";
                String ngayXuatVe = "";
                
                if (this.txtMaVe.getText().isEmpty() == false)
                    maVe = Integer.parseInt(this.txtMaVe.getText());
                if (this.txtMaCB.getText().isEmpty() == false)
                    maCB = this.txtMaCB.getText();
                if (this.txtTenKH.getText().isEmpty() == false)
                    tenKH = this.txtTenKH.getText();
                if (this.dpNgayXuatVe.getValue() != null)
                    ngayXuatVe = this.dpNgayXuatVe.getValue().toString();
                
                loadVeMayBay(maVe, maCB, tenKH, ngayXuatVe);
        });
    }
    
    public void setTTUser(Users u){
       nd = u; 
    }
    
    public void loadVeMayBay(int maVe, String maCB, String tenKH, String ngayXuatVe){
        
        try {
            this.tbVeMayBay.getItems().clear();
            Connection conn = JdbcUtils.getConn();
            VeMayBayService vmbs = new VeMayBayService(conn);
            this.tbVeMayBay.setItems(FXCollections.observableList(
                    vmbs.getVeMayBays(maVe, maCB, tenKH, ngayXuatVe)));
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(TraCuuVeController.class.getName()).log(Level.SEVERE, null, ex);
        } 
        
    }
    
    private void loadTable() {
        TableColumn colMaVe = new TableColumn("Mã Vé");
        colMaVe.setCellValueFactory(new PropertyValueFactory("maVe"));
        
        TableColumn colIdHangVe = new TableColumn("Hạng Vé");
        colIdHangVe.setCellValueFactory(new PropertyValueFactory("idHangVe"));
        
        TableColumn colGiaVe = new TableColumn("Giá Vé");
        colGiaVe.setCellValueFactory(new PropertyValueFactory("giaVe"));
        
        TableColumn colMaGhe = new TableColumn("Mã Ghế");
        colMaGhe.setCellValueFactory(new PropertyValueFactory("maGhe"));
        
        TableColumn colNgayXuatVe = new TableColumn("Ngày Xuất Vé");
        colNgayXuatVe.setCellValueFactory(new PropertyValueFactory("ngayXuatVe"));
        
        TableColumn colMaNguoiDat = new TableColumn("Tên Người Đặt");
        colMaNguoiDat.setCellValueFactory(new PropertyValueFactory("tenNguoiDat"));
        
        TableColumn colTenKH = new TableColumn("Tên Khách Hàng");
        colTenKH.setCellValueFactory(new PropertyValueFactory("tenKH"));
        
        TableColumn colMaCB = new TableColumn("Mã Chuyến Bay");
        colMaCB.setCellValueFactory(new PropertyValueFactory("maCB"));
        
        
        this.tbVeMayBay.getColumns().addAll(colMaVe, colGiaVe, colIdHangVe, colNgayXuatVe, colMaGhe, colMaCB, colTenKH, colMaNguoiDat);
    }
    
    
//    public void nhapTXTMaVe(ActionEvent evt){
//        if (evt.getSource() == this.txtMaVe) {
//            try {
//                    if (this.txtMaVe.getText().isEmpty() == false) {
//                        Connection conn = JdbcUtils.getConn();
//                        KhachHangService khs = new KhachHangService(conn);
//                        
//                        int maVe = 0;
//                        String maCB = "";
//                        int maKH = 0;
//                        String ngayXuatVe = "";
//                        
//                        if (this.txtMaVe.getText().isEmpty() == false)
//                            maVe = Integer.parseInt(this.txtMaVe.getText());
//                        if (this.txtMaCB.getText().isEmpty() == false)
//                            maCB = this.txtMaCB.getText();
//                        if (this.txtTenKH.getText().isEmpty() == false)
//                            maKH = khs.getKhachHang(this.txtTenKH.getText()).getMaKH();
//                        if (this.dpNgayXuatVe.getValue() != null)
//                            ngayXuatVe = this.dpNgayXuatVe.getValue().toString();
//                        
//                        loadVeMayBay(maVe, maCB, maKH, ngayXuatVe);
//                    }
//                        
//                } catch (SQLException ex) {
//                    Logger.getLogger(TraCuuVeController.class.getName()).log(Level.SEVERE, null, ex);
//                }
//        }
//    }
    
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
