/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.lab.abc.rest.service.resources;

import com.google.gson.Gson;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

/**
 *
 * @author User
 */
@Path("technician")
public class TechnicianResource {
    Gson gson = new Gson();

    public TechnicianResource() {
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getTechnicians(){    
        return Response
                .ok(gson.toJson(new DBUtils().getTechnicians()))
                .build();
    }

    @GET
    @Path("{tid}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getTechnician(@PathParam("tid") int id){ 
       System.err.println("Technician "+ id);
        try {
        Technician technician = new DBUtils().getTechnician(id);
        
        if (technician != null) {
                  return Response
                    .ok(gson.toJson(technician))
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
    public Response addTechnician(String json){ 
        Technician technician = gson.fromJson(json, Technician.class); 
        new DBUtils().addTechnician(technician);
        return Response
                .status(Response.Status.CREATED)
                .build();
    }
    
    @PUT
    @Path("{tid}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateTechnician(String json, @PathParam("tid") int id){ 
        Technician technician = gson.fromJson(json, Technician.class);
        new DBUtils().updateTechnician(technician);
        return Response
                    .ok()
                    .build();
    }
    
  
    @DELETE
    @Path("{tid}")
    public Response deleteTechnician(@PathParam("tid") int id){ 
        new DBUtils().deleteTechnician(id);
        return Response
            .ok()
            .build();
    }
}

