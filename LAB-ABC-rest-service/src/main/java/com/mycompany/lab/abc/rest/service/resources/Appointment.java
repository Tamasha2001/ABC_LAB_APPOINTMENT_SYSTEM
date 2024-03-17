/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.lab.abc.rest.service.resources;


/**
 *
 * @author User
 */
public class Appointment {
    private int apid;
    private String patient_name;
    private String date;
    private String time;
    private String test;

    public Appointment() {
       
    }

    public Appointment(String patient_name, String date, String time, String test) {
        this.patient_name = patient_name;
        this.date = date;
        this.time = time;
        this.test = test;
    }

    public int getApid() {
        return apid;
    }

    public void setApid(int apid) {
        this.apid = apid;
    }

    public String getPatient_name() {
        return patient_name;
    }

    public void setPatient_name(String patient_name) {
        this.patient_name = patient_name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
    }

   
}