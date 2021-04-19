/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.pojo;

/**
 *
 * @author Admin
 */
public class Ghe {
    private String maGhe;
    private Boolean trangThai;
    private Enum hangGhe;

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
     * @return the trangThai
     */
    public Boolean getTrangThai() {
        return trangThai;
    }

    /**
     * @param trangThai the trangThai to set
     */
    public void setTrangThai(Boolean trangThai) {
        this.trangThai = trangThai;
    }

    /**
     * @return the hangGhe
     */
    public Enum getHangGhe() {
        return hangGhe;
    }

    /**
     * @param hangGhe the hangGhe to set
     */
    public void setHangGhe(Enum hangGhe) {
        this.hangGhe = hangGhe;
    }

}
