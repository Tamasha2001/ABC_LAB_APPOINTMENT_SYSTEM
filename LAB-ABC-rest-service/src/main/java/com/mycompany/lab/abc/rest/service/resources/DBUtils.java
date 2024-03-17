/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.lab.abc.rest.service.resources;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * /**
 *
 * @author User
 */
public class DBUtils {

    static final String DB_URL = "jdbc:mysql://localhost:3306/lab-appointment-system";
    static final String USER = "root";
    static final String PASS = "";

    public DBUtils() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception e) {

        }
    }
    

    public boolean addPatient(Patient pt) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                stmt.executeUpdate("INSERT INTO patient (p_name, dob, gender, email, password, contact) "
                        + "VALUES ('" + pt.getP_name()+ "', '" + pt.getDob() + "', '" + pt.getGender()+ "', '" + pt.getEmail() + "', '"
                        + pt.getPassword() + "', '" + pt.getContact() + "');");   
                
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean authenticatePatient(String email, String password) {
        try {
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
                 PreparedStatement stmt = conn.prepareStatement("SELECT * FROM patient WHERE email = ? AND password = ?")) {
                stmt.setString(1, email);
                stmt.setString(2, password);
                try (ResultSet rs = stmt.executeQuery()) {
                    return rs.next(); 
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
     public Appointment getAppointment(int id) throws SQLException {
        Appointment at = null;
         try {

            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS); 
                    Statement stmt = conn.createStatement(); 
                    ResultSet rs = stmt.executeQuery("SELECT * FROM appointments WHERE apid="+ id);) {
                while (rs.next()) {
                    at = new Appointment();
                    at.setApid( rs.getInt("apid"));
                    at.setPatient_name( rs.getString("patient_name"));
                    at.setDate(rs.getString("date"));
                    at.setTime(rs.getString("time"));
                    at.setTest(rs.getString("test"));
                    break;
                }
            } catch (SQLException e) {
                System.err.print(e);
                throw e;
            }

        } catch (SQLException e) {
            System.err.print(e);
            throw e;
        }

        return at;
    }
                    
    public List<Appointment> getAppointment() {
        List<Appointment> appointment = new ArrayList<>();
         try {
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS); 
                    Statement stmt = conn.createStatement(); 
                    ResultSet rs = stmt.executeQuery("SELECT * FROM appointments");) {
                while (rs.next()) {
                    Appointment at = new Appointment();
                    at.setApid( rs.getInt("apid"));
                    at.setPatient_name( rs.getString("patient_name"));
                    at.setDate(rs.getString("date"));
                    at.setTime(rs.getString("time"));
                    at.setTest(rs.getString("test"));
                    appointment.add(at);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {

        }

        return appointment;
    }
    
    public boolean makeAppointment(Appointment appointment) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                String query = "INSERT INTO appointments (patient_name, date, time, test) "
                        + "VALUES ('" + appointment.getPatient_name() + "', '" + appointment.getDate() + "', '"
                        + appointment.getTime() + "', '" + appointment.getTest() + "');";
                stmt.executeUpdate(query);
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
   
    public boolean updateAppointment(Appointment at) {
        try {
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS); 
                    Statement stmt = conn.createStatement(); 
                    ) {
                stmt.executeUpdate("UPDATE appointments SET patient_name = '" +at.getPatient_name() + "', date = '" +at.getDate() + "', time = '" + at.getTime()+ "', test = '" +at.getTest() + "' WHERE (apid = '" + at.getApid() +"');");
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {

        }
        return false;
    }
    
    public boolean deleteAppointment(int apid) {
        try {
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS); 
                    Statement stmt = conn.createStatement(); 
                    ) {
                stmt.executeUpdate("DELETE FROM appointments WHERE (apid = '"+ apid + "');");
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {

        }
        return false;
    }
}


