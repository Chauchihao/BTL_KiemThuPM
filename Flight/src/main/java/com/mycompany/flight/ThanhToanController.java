/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight;

import com.mycompany.pojo.Users;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.fxml.Initializable;

/**
 *
 * @author Admin
 */
public class ThanhToanController implements Initializable {
    Users nd;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
    }
    
    public void setTTUser(Users u){
            nd = u;
    }
}
