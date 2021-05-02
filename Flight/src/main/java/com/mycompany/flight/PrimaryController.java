package com.mycompany.flight;

import com.mycompany.pojo.KhachHang;
import com.mycompany.service.JdbcUtils;
import com.mycompany.service.KhachHangService;
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
import javafx.scene.control.ButtonType;
import javafx.scene.control.TableCell;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableRow;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;

public class PrimaryController implements Initializable {

    /*@FXML
    private void switchToSecondary() throws IOException {
        App.setRoot("secondary");
    }*/
    
    
    @FXML private TableView<KhachHang> tbKH;
    @FXML private TextField txtKeywords;
    @FXML private TextField txtTenKH;
    @FXML private TextField txtEmail;
    @FXML private TextField txtSdt;
    

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        
        loadTables();
        loadKhachHangData("");
        
        this.txtKeywords.textProperty().addListener((obj) -> {
            loadKhachHangData(this.txtKeywords.getText());
        });
        
        this.tbKH.setRowFactory(obj -> {
            TableRow r = new TableRow();
            
            r.setOnMouseClicked(evt -> {
                try {
                    Connection conn = JdbcUtils.getConn();
                    
                    KhachHang kh = this.tbKH.getSelectionModel().getSelectedItem();
                    txtTenKH.setText(kh.getTenKH());
                    txtEmail.setText(kh.getEmail());
                    txtSdt.setText(kh.getSdt());
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(PrimaryController.class.getName()).log(Level.SEVERE, null, ex);
                }
            });
            
            return r;
        });
    }
    
    public void addHandler(ActionEvent evt) {
        try {
            Connection conn = JdbcUtils.getConn();
            KhachHangService s = new KhachHangService(conn);
            
            KhachHang kh = new KhachHang();
            kh.setTenKH(txtTenKH.getText());
            kh.setEmail(txtEmail.getText());
            kh.setSdt(txtSdt.getText());
            if (s.addKhachHang(kh) == true) {
                Utils.getBox("SUCCESSFUL", Alert.AlertType.INFORMATION).show();
                this.loadKhachHangData("");
            } else
                Utils.getBox("FAILED", Alert.AlertType.INFORMATION).show();
            
        } catch (SQLException ex) {
            Logger.getLogger(PrimaryController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void loadKhachHangData(String kw) {
        try {
            this.tbKH.getItems().clear();
            
            Connection conn = JdbcUtils.getConn();
            KhachHangService s = new KhachHangService(conn);
            
            //this.tbKH.setItems(FXCollections.observableList(s.getKhachHang(this.txtTenKH.getText())));
            
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(PrimaryController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void loadTables() {
        TableColumn colMa = new TableColumn("Mã khách hàng");
        colMa.setCellValueFactory(new PropertyValueFactory("maKH"));
        
        TableColumn colTen = new TableColumn("Tên khách hàng");
        colTen.setCellValueFactory(new PropertyValueFactory("tenKH"));
        
        TableColumn colEmail = new TableColumn("Email");
        colEmail.setCellValueFactory(new PropertyValueFactory("email"));
        
        TableColumn colSdt = new TableColumn("Số điện thoại");
        colSdt.setCellValueFactory(new PropertyValueFactory("sdt"));
        
        TableColumn colAction = new TableColumn();
        colAction.setCellFactory((obj) -> {
            Button btn = new Button("Xóa");
            
            btn.setOnAction(evt -> {
                Utils.getBox("Ban chac chan xoa khong?", Alert.AlertType.CONFIRMATION)
                     .showAndWait().ifPresent(bt -> {
                         if (bt == ButtonType.OK) {
                             try {
                                 TableCell cell = (TableCell) ((Button) evt.getSource()).getParent();
                                 KhachHang kh = (KhachHang) cell.getTableRow().getItem();
                                 
                                 Connection conn = JdbcUtils.getConn();
                                 KhachHangService s = new KhachHangService(conn);
                                 
                                 if (s.deleleKhachHang(kh.getMaKH())) {
                                     Utils.getBox("SUCCESSFUL", Alert.AlertType.INFORMATION).show();
                                     loadKhachHangData("");
                                 } else
                                     Utils.getBox("FAILED", Alert.AlertType.ERROR).show();
                                 
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
        
        this.tbKH.getColumns().addAll(colMa, colTen, colEmail, colSdt, colAction);
    }
}
