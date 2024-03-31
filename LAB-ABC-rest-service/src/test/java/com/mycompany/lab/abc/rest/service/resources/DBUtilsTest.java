/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package com.mycompany.lab.abc.rest.service.resources;

import java.util.List;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author User
 */
public class DBUtilsTest {
    
    public DBUtilsTest() {
    }
    
    @BeforeAll
    public static void setUpClass() {
    }
    
    @AfterAll
    public static void tearDownClass() {
    }
    
    @BeforeEach
    public void setUp() {
    }
    
    @AfterEach
    public void tearDown() {
    }

    /**
     * Test of getPatient method, of class DBUtils.
     */
    @Test
    public void testGetPatient() throws Exception {
        System.out.println("getPatient");
        int id = 0;
        DBUtils instance = new DBUtils();
        Patient expResult = null;
        Patient result = instance.getPatient(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPatients method, of class DBUtils.
     */
    @Test
    public void testGetPatients() {
        System.out.println("getPatients");
        DBUtils instance = new DBUtils();
        List<Patient> expResult = null;
        List<Patient> result = instance.getPatients();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of addPatient method, of class DBUtils.
     */
    @Test
    public void testAddPatient() {
        System.out.println("addPatient");
        Patient pt = null;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.addPatient(pt);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updatePatient method, of class DBUtils.
     */
    @Test
    public void testUpdatePatient() {
        System.out.println("updatePatient");
        Patient pt = null;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.updatePatient(pt);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deletePatient method, of class DBUtils.
     */
    @Test
    public void testDeletePatient() {
        System.out.println("deletePatient");
        int id = 0;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.deletePatient(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of viewPatient method, of class DBUtils.
     */
    @Test
    public void testViewPatient() {
        System.out.println("viewPatient");
        DBUtils instance = new DBUtils();
        List<Patient> expResult = null;
        List<Patient> result = instance.viewPatient();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of verifyLogin method, of class DBUtils.
     */
    @Test
    public void testVerifyLogin() {
        System.out.println("verifyLogin");
        String email = "";
        String password = "";
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.verifyLogin(email, password);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAppointment method, of class DBUtils.
     */
    @Test
    public void testGetAppointment() throws Exception {
        System.out.println("getAppointment");
        int id = 0;
        DBUtils instance = new DBUtils();
        Appointment expResult = null;
        Appointment result = instance.getAppointment(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAppointments method, of class DBUtils.
     */
    @Test
    public void testGetAppointments() {
        System.out.println("getAppointments");
        DBUtils instance = new DBUtils();
        List<Appointment> expResult = null;
        List<Appointment> result = instance.getAppointments();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of makeAppointment method, of class DBUtils.
     */
    @Test
    public void testMakeAppointment() {
        System.out.println("makeAppointment");
        Appointment appointment = null;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.makeAppointment(appointment);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateAppointment method, of class DBUtils.
     */
    @Test
    public void testUpdateAppointment() {
        System.out.println("updateAppointment");
        Appointment at = null;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.updateAppointment(at);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deleteAppointment method, of class DBUtils.
     */
    @Test
    public void testDeleteAppointment() {
        System.out.println("deleteAppointment");
        int apid = 0;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.deleteAppointment(apid);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTechnician method, of class DBUtils.
     */
    @Test
    public void testGetTechnician() throws Exception {
        System.out.println("getTechnician");
        int tid = 0;
        DBUtils instance = new DBUtils();
        Technician expResult = null;
        Technician result = instance.getTechnician(tid);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTechnicians method, of class DBUtils.
     */
    @Test
    public void testGetTechnicians() {
        System.out.println("getTechnicians");
        DBUtils instance = new DBUtils();
        List<Technician> expResult = null;
        List<Technician> result = instance.getTechnicians();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of addTechnician method, of class DBUtils.
     */
    @Test
    public void testAddTechnician() {
        System.out.println("addTechnician");
        Technician technician = null;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.addTechnician(technician);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateTechnician method, of class DBUtils.
     */
    @Test
    public void testUpdateTechnician() {
        System.out.println("updateTechnician");
        Technician tn = null;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.updateTechnician(tn);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deleteTechnician method, of class DBUtils.
     */
    @Test
    public void testDeleteTechnician() {
        System.out.println("deleteTechnician");
        int tid = 0;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.deleteTechnician(tid);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTest method, of class DBUtils.
     */
    @Test
    public void testGetTest() throws Exception {
        System.out.println("getTest");
        int test_id = 0;
        DBUtils instance = new DBUtils();
        com.mycompany.lab.abc.rest.service.resources.Test expResult = null;
        com.mycompany.lab.abc.rest.service.resources.Test result = instance.getTest(test_id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTests method, of class DBUtils.
     */
    @Test
    public void testGetTests() {
        System.out.println("getTests");
        DBUtils instance = new DBUtils();
        List<com.mycompany.lab.abc.rest.service.resources.Test> expResult = null;
        List<com.mycompany.lab.abc.rest.service.resources.Test> result = instance.getTests();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of addTest method, of class DBUtils.
     */
    @Test
    public void testAddTest() {
        System.out.println("addTest");
        com.mycompany.lab.abc.rest.service.resources.Test test = null;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.addTest(test);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateTest method, of class DBUtils.
     */
    @Test
    public void testUpdateTest() {
        System.out.println("updateTest");
        com.mycompany.lab.abc.rest.service.resources.Test ts = null;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.updateTest(ts);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deleteTest method, of class DBUtils.
     */
    @Test
    public void testDeleteTest() {
        System.out.println("deleteTest");
        int test_id = 0;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.deleteTest(test_id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getReport method, of class DBUtils.
     */
    @Test
    public void testGetReport() throws Exception {
        System.out.println("getReport");
        int rid = 0;
        DBUtils instance = new DBUtils();
        Report expResult = null;
        Report result = instance.getReport(rid);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getReports method, of class DBUtils.
     */
    @Test
    public void testGetReports() {
        System.out.println("getReports");
        DBUtils instance = new DBUtils();
        List<Report> expResult = null;
        List<Report> result = instance.getReports();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of addReport method, of class DBUtils.
     */
    @Test
    public void testAddReport() {
        System.out.println("addReport");
        Report rp = null;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.addReport(rp);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateReport method, of class DBUtils.
     */
    @Test
    public void testUpdateReport() {
        System.out.println("updateReport");
        Report rp = null;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.updateReport(rp);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deleteReport method, of class DBUtils.
     */
    @Test
    public void testDeleteReport() {
        System.out.println("deleteReport");
        int rid = 0;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.deleteReport(rid);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPayment method, of class DBUtils.
     */
    @Test
    public void testGetPayment() throws Exception {
        System.out.println("getPayment");
        int payid = 0;
        DBUtils instance = new DBUtils();
        Payment expResult = null;
        Payment result = instance.getPayment(payid);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPayments method, of class DBUtils.
     */
    @Test
    public void testGetPayments() {
        System.out.println("getPayments");
        DBUtils instance = new DBUtils();
        List<Payment> expResult = null;
        List<Payment> result = instance.getPayments();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of addPayment method, of class DBUtils.
     */
    @Test
    public void testAddPayment() {
        System.out.println("addPayment");
        Payment payment = null;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.addPayment(payment);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updatePayment method, of class DBUtils.
     */
    @Test
    public void testUpdatePayment() {
        System.out.println("updatePayment");
        Payment pm = null;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.updatePayment(pm);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deletePayment method, of class DBUtils.
     */
    @Test
    public void testDeletePayment() {
        System.out.println("deletePayment");
        int payid = 0;
        DBUtils instance = new DBUtils();
        boolean expResult = false;
        boolean result = instance.deletePayment(payid);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
