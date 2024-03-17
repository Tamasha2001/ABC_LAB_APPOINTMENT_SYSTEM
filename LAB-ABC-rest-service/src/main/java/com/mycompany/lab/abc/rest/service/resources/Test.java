/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.lab.abc.rest.service.resources;


/**
 *
 * @author User
 */
public class Test {
    private int test_id;
    private String patient_name;
    private String test_type;
    private String test_date;
    private String test_time;
    private String technician_name;
    private String referring_doctor;
    private String result_DETAILS;

    public Test(){
}

    public Test(int test_id, String patient_name, String test_type, String test_date, String test_time, String technician_name, String referring_doctor, String result_DETAILS) {
        this.test_id = test_id;
        this.patient_name = patient_name;
        this.test_type = test_type;
        this.test_date = test_date;
        this.test_time = test_time;
        this.technician_name = technician_name;
        this.referring_doctor = referring_doctor;
        this.result_DETAILS = result_DETAILS;
    }

    public int getTest_id() {
        return test_id;
    }

    public void setTest_id(int test_id) {
        this.test_id = test_id;
    }

    public String getPatient_name() {
        return patient_name;
    }

    public void setPatient_name(String patient_name) {
        this.patient_name = patient_name;
    }

    public String getTest_type() {
        return test_type;
    }

    public void setTest_type(String test_type) {
        this.test_type = test_type;
    }

    public String getTest_date() {
        return test_date;
    }

    public void setTest_date(String test_date) {
        this.test_date = test_date;
    }

    public String getTest_time() {
        return test_time;
    }

    public void setTest_time(String test_time) {
        this.test_time = test_time;
    }

    public String getTechnician_name() {
        return technician_name;
    }

    public void setTechnician_name(String technician_name) {
        this.technician_name = technician_name;
    }

    public String getReferring_doctor() {
        return referring_doctor;
    }

    public void setReferring_doctor(String referring_doctor) {
        this.referring_doctor = referring_doctor;
    }

    public String getResult_DETAILS() {
        return result_DETAILS;
    }

    public void setResult_DETAILS(String result_DETAILS) {
        this.result_DETAILS = result_DETAILS;
    }
    
    
}
