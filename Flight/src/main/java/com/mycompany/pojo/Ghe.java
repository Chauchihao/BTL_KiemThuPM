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
    private int idHangVe;

    @Override
    public String toString() {
        return this.getMaGhe();
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

    
    
    
}
