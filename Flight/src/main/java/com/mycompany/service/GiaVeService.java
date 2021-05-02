/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.pojo.ChuyenBay;
import com.mycompany.pojo.GiaVe;
import com.mycompany.pojo.HangVe;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class GiaVeService {
    private Connection conn;

    public GiaVeService(Connection conn) {
        this.conn = conn;
    }
    
    public GiaVe getGiaVeByChuyenBay_HangVe(String maCB, int idHangVe) throws SQLException {
        ChuyenBayService cbs = new ChuyenBayService(this.conn);
        ChuyenBay cb = new ChuyenBay();
//        HangVeService hvs = new HangVeService(this.conn);
//        HangVe hv = new HangVe();
        cb = cbs.getChuyenBayByMaCB(maCB);
//        hv = hvs.getHangVeById(idHangVe);
        String sql = "SELECT giave.maSanBayDi, giave.maSanBayDen, giave.idHangVe, "
                + "giave.hangBay, giaVe FROM chuyenbay, hangve, giave, "
                + "maybay WHERE chuyenbay.maSanBayDi = giave.maSanBayDi "
                + "AND chuyenbay.maSanBayDen = giave.maSanBayDen  "
                + "AND hangve.id = giave.idHangVe "
                + "AND maybay.soHieuMayBay = chuyenbay.soHieuMayBay "
                + "AND maybay.hangBay = giave.hangBay AND giave.maSanBayDi = ? "
                + "AND giave.maSanBayDen = ? AND giave.idHangVe = ?";
        PreparedStatement stm = this.conn.prepareStatement(sql);
        stm.setString(1, cb.getMaSanBayDi());
        stm.setString(2, cb.getMaSanBayDen());
        stm.setInt(3, idHangVe);
        ResultSet r = stm.executeQuery();
        
        
        GiaVe gv = null;
        while (r.next()) {
            gv = new GiaVe();
            gv.setMaSanBayDi(r.getString("maSanBayDi"));
            gv.setMaSanBayDen(r.getString("maSanBayDen"));
            gv.setIdHangVe(r.getInt("idHangVe"));
            gv.setHangBay(r.getString("hangBay"));
            gv.setGiaVe(r.getBigDecimal("giaVe"));
        }
        return gv;
    }
}