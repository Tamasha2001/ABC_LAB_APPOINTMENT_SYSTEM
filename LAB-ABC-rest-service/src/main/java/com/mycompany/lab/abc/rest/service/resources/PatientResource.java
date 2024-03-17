/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.lab.abc.rest.service.resources;
import com.google.gson.Gson;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

/**
 *
 * @author User
 */

@Path("patient")
public class PatientResource {
    Gson gson = new Gson();

    public PatientResource() {
        
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addPatient(String json){ 
        Patient patient = gson.fromJson(json, Patient.class); 
        new DBUtils().addPatient(patient);
        return Response
                .status(Response.Status.CREATED)
                .build();
    }
}

