/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.pojo;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class PhieuDatCho {
    private int maPhieu;
    private int maVe;
    private int maKH;
    private Date ngayDatVe;

    /**
     * @return the maPhieu
     */
    public int getMaPhieu() {
        return maPhieu;
    }

    /**
     * @param maPhieu the maPhieu to set
     */
    public void setMaPhieu(int maPhieu) {
        this.maPhieu = maPhieu;
    }

    /**
     * @return the maVe
     */
    public int getMaVe() {
        return maVe;
    }

    /**
     * @param maVe the maVe to set
     */
    public void setMaVe(int maVe) {
        this.maVe = maVe;
    }

    /**
     * @return the maKH
     */
    public int getMaKH() {
        return maKH;
    }

    /**
     * @param maKH the maKH to set
     */
    public void setMaKH(int maKH) {
        this.maKH = maKH;
    }

    /**
     * @return the ngayDatVe
     */
    public Date getNgayDatVe() {
        return ngayDatVe;
    }

    /**
     * @param ngayDatVe the ngayDatVe to set
     */
    public void setNgayDatVe(Date ngayDatVe) {
        this.ngayDatVe = ngayDatVe;
    }
    
}
