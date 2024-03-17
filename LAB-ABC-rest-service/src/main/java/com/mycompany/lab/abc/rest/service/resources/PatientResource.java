/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.lab.abc.rest.service.resources;
import com.google.gson.Gson;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;

/**
 *
 * @author User
 */

@Path("patient")
public class PatientResource {
    Gson gson = new Gson();

    public PatientResource() {
        
    }

     @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getPatient(){    
        return Response
                .ok(gson.toJson(new DBUtils().getTest()))
                .build();
    }

    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getPatient(@PathParam("id") int id){ 
        try {
        Patient patient = new DBUtils().getPatient(id);
        
        if (patient != null) {
                  return Response
                    .ok(gson.toJson(patient))
                    .build();
        } 

        return Response
                .status(Response.Status.NOT_FOUND)
                .build();
        } catch(Exception e) {
             return Response
                .status(Response.Status.INTERNAL_SERVER_ERROR)
                .build();
        }
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
    

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response viewPatient() {
        List<Patient> patient = new DBUtils().viewPatient();
        return Response.ok(gson.toJson(patient)).build();
    }
}

    



