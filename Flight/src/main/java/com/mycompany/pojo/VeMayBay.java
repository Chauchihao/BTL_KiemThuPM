/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.pojo;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;

/**
 *
 * @author ADmin
 */
public class VeMayBay {
    private int maVe;
    private int idHangVe;
    private BigDecimal giaVe;
    private String maGhe;
    private String ngayXuatVe;
    private int maNguoiDat;
    private int maKH;
    private String maCB;

    
    @Override
    public String toString() {
        return Integer.toString(this.getMaVe());
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
     * @return the idHangVe
     */
    public int getIdHangVe() {
        return idHangVe;
    }

    /**
     * @param idHangVe the idHangVe to set
     */
    public void setIdHangVe(int idHangVe) {
        this.idHangVe = idHangVe;
    }

    /**
     * @return the giaVe
     */
    public BigDecimal getGiaVe() {
        return giaVe;
    }

    /**
     * @param giaVe the giaVe to set
     */
    public void setGiaVe(BigDecimal giaVe) {
        this.giaVe = giaVe;
    }

    /**
     * @return the maGhe
     */
    public String getMaGhe() {
        return maGhe;
    }

    /**
     * @param maGhe the maGhe to set
     */
    public void setMaGhe(String maGhe) {
        this.maGhe = maGhe;
    }

    /**
     * @return the ngayXuatVe
     */
    public String getNgayXuatVe() {
        return ngayXuatVe;
    }

    /**
     * @param ngayXuatVe the ngayXuatVe to set
     */
    public void setNgayXuatVe(String ngayXuatVe) {
        this.ngayXuatVe = ngayXuatVe;
    }

    /**
     * @return the maNguoiDat
     */
    public int getMaNguoiDat() {
        return maNguoiDat;
    }

    /**
     * @param maNguoiDat the maNguoiDat to set
     */
    public void setMaNguoiDat(int maNguoiDat) {
        this.maNguoiDat = maNguoiDat;
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
     * @return the maCB
     */
    public String getMaCB() {
        return maCB;
    }

    /**
     * @param maCB the maCB to set
     */
    public void setMaCB(String maCB) {
        this.maCB = maCB;
    }

    
}
