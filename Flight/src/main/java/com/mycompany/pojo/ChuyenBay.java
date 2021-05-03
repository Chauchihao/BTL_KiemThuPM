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
public class ChuyenBay {
    private String maChuyenBay;
    private String soHieuMayBay;
    private String ngayGioKhoiHanh;
    private String ngayGioDen;
    private String maSanBayDi;
    private String maSanBayDen;
    private String sanBayTrungGian; 

    @Override
    public String toString() {
        return this.getMaChuyenBay();
    }

    /**
     * @return the maChuyenBay
     */
    public String getMaChuyenBay() {
        return maChuyenBay;
    }

    /**
     * @param maChuyenBay the maChuyenBay to set
     */
    public void setMaChuyenBay(String maChuyenBay) {
        this.maChuyenBay = maChuyenBay;
    }

    /**
     * @return the soHieuMayBay
     */
    public String getSoHieuMayBay() {
        return soHieuMayBay;
    }

    /**
     * @param soHieuMayBay the soHieuMayBay to set
     */
    public void setSoHieuMayBay(String soHieuMayBay) {
        this.soHieuMayBay = soHieuMayBay;
    }

    /**
     * @return the ngayGioKhoiHanh
     */
    public String getNgayGioKhoiHanh() {
        return ngayGioKhoiHanh;
    }

    /**
     * @param ngayGioKhoiHanh the ngayGioKhoiHanh to set
     */
    public void setNgayGioKhoiHanh(String ngayGioKhoiHanh) {
        this.ngayGioKhoiHanh = ngayGioKhoiHanh;
    }

    /**
     * @return the ngayGioDen
     */
    public String getNgayGioDen() {
        return ngayGioDen;
    }

    /**
     * @param ngayGioDen the ngayGioDen to set
     */
    public void setNgayGioDen(String ngayGioDen) {
        this.ngayGioDen = ngayGioDen;
    }

    /**
     * @return the maSanBayDi
     */
    public String getMaSanBayDi() {
        return maSanBayDi;
    }

    /**
     * @param maSanBayDi the maSanBayDi to set
     */
    public void setMaSanBayDi(String maSanBayDi) {
        this.maSanBayDi = maSanBayDi;
    }

    /**
     * @return the maSanBayDen
     */
    public String getMaSanBayDen() {
        return maSanBayDen;
    }

    /**
     * @param maSanBayDen the maSanBayDen to set
     */
    public void setMaSanBayDen(String maSanBayDen) {
        this.maSanBayDen = maSanBayDen;
    }

    /**
     * @return the sanBayTrungGian
     */
    public String getSanBayTrungGian() {
        return sanBayTrungGian;
    }

    /**
     * @param sanBayTrungGian the sanBayTrungGian to set
     */
    public void setSanBayTrungGian(String sanBayTrungGian) {
        this.sanBayTrungGian = sanBayTrungGian;
    }

    
}