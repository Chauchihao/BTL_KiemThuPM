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
    private String hangVe;

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
     * @return the hangVe
     */
    public String getHangVe() {
        return hangVe;
    }

    /**
     * @param hangVe the hangVe to set
     */
    public void setHangVe(String hangVe) {
        this.hangVe = hangVe;
    }
    
    
}
