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
    
     public boolean verifyLogin(String email, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            String sql = "SELECT * FROM patient WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // If result set is not empty, login is successful
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
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
    
    //Test
    
     public Test getTest(int test_id) throws SQLException {
        Test ts = null;
         try {

            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS); 
                    Statement stmt = conn.createStatement(); 
                    ResultSet rs = stmt.executeQuery("SELECT * FROM test_details WHERE test_id="+ test_id);) {
                while (rs.next()) {
                    ts = new Test();
                    ts.setTest_id( rs.getInt("test_id"));
                    ts.setPatient_name( rs.getString("patient_name"));
                    ts.setTest_type(rs.getString("test_type"));
                    ts.setTest_date(rs.getString("test_date"));
                    ts.setTest_time(rs.getString("test_time"));
                    ts.setTechnician_name(rs.getString("technician_name"));
                    ts.setReferring_doctor(rs.getString("referring_doctor"));
                    ts.setResult_DETAILS(rs.getString("result_DETAILS"));
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

        return ts;
    }
                    
    public List<Test> getTest() {
        List<Test> test = new ArrayList<>();
         try {
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS); 
                    Statement stmt = conn.createStatement(); 
                    ResultSet rs = stmt.executeQuery("SELECT * FROM test_details");) {
                while (rs.next()) {
                    Test ts = new Test();
                   ts.setTest_id( rs.getInt("test_id"));
                    ts.setPatient_name( rs.getString("patient_name"));
                    ts.setTest_type(rs.getString("test_type"));
                    ts.setTest_date(rs.getString("test_date"));
                    ts.setTest_time(rs.getString("test_time"));
                    ts.setTechnician_name(rs.getString("technician_name"));
                    ts.setReferring_doctor(rs.getString("referring_doctor"));
                    ts.setResult_DETAILS(rs.getString("result_DETAILS"));
                    test.add(ts);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {

        }

        return test;
    }
    
    public boolean addTest(Test test) {
        try {
            try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);  Statement stmt = conn.createStatement();) {
                String query = "INSERT INTO test_details (test_id, patient_name, test_type, test_date, test_time, technician_name, referring_doctor, result_DETAILS) "
                        + "VALUES ('" + test.getTest_id() + "', '" + test.getPatient_name() + "', '" + test.getTest_type() + "', '" + test.getTest_date() + "', '" + test.getTest_time() + "', '" + test.getTechnician_name() + "', '" + test.getReferring_doctor() + "', '" + test.getResult_DETAILS() + "');";
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
    
   
    public boolean updateTest(Test ts) {
        try {
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS); 
                    Statement stmt = conn.createStatement(); 
                    ) {
                stmt.executeUpdate("UPDATE test_details SET patient_name = '" +ts.getPatient_name() + "', test_type = '" + ts.getTest_type()+ "', test_date = '" +ts.getTest_date() + "', test_time = '" + ts.getTest_time()+ "', technician_name = '" + ts.getTechnician_name()+ "',referring_doctor = '" + ts.getReferring_doctor()+ "',result_DETAILS = '" + ts.getResult_DETAILS()+ "', WHERE (test_id = '" + ts.getTest_id() +"');");
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {

        }
        return false;
    }
    
    public boolean deleteTest(int test_id) {
        try {
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS); 
                    Statement stmt = conn.createStatement(); 
                    ) {
                stmt.executeUpdate("DELETE FROM test_details WHERE (test_id = '"+ test_id + "');");
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {

        }
        return false;
    }
}


