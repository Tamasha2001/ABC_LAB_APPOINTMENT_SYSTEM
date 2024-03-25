/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.lab.abc.rest.service.resources;

/**
 *
 * @author User
 */
public class Payment {
    private int payid;
    private String patient_name;
    private String amount;
    private String cardno;
    private String exdate;
    private int cvv; 
    
    public Payment(){
    }

    public Payment(int payid, String patient_name, String amount, String cardno, String exdate, int cvv) {
        this.payid = payid;
        this.patient_name = patient_name;
        this.amount = amount;
        this.cardno = cardno;
        this.exdate = exdate;
        this.cvv = cvv;
    }

    public int getPayid() {
        return payid;
    }

    public void setPayid(int payid) {
        this.payid = payid;
    }

    public String getPatient_name() {
        return patient_name;
    }

    public void setPatient_name(String patient_name) {
        this.patient_name = patient_name;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getCardno() {
        return cardno;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno;
    }

    public String getExdate() {
        return exdate;
    }

    public void setExdate(String exdate) {
        this.exdate = exdate;
    }

    public int getCvv() {
        return cvv;
    }

    public void setCvv(int cvv) {
        this.cvv = cvv;
    }
    
    
}
