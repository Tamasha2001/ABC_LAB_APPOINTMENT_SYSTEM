package com.mycompany.lab.abc.rest.service.resources;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
@Path("appointment")
public class AppointmentResource {
     Gson gson = new Gson();

    public AppointmentResource() {
    }
    
    
     @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAppointments(){    
        return Response
                .ok(gson.toJson(new DBUtils().getAppointments()))
                .build();
    }

    @GET
    @Path("{apid}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAppointment(@PathParam("apid") int id){ 
//        System.err.println("Test "+ id);
        try {
        Appointment appointment = new DBUtils().getAppointment(id);
        
        if (appointment != null) {
                  return Response
                    .ok(gson.toJson(appointment))
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
    public Response makeAppointment(String json){ 
        Appointment appointment = gson.fromJson(json, Appointment.class); 
        new DBUtils().makeAppointment(appointment);
        return Response
                .status(Response.Status.CREATED)
                .build();
    }
    
    @PUT
    @Path("{apid}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateAppointment(String json, @PathParam("id") int id){ 
        Appointment appointment = gson.fromJson(json, Appointment.class);
        new DBUtils().updateAppointment(appointment);
        return Response
                    .ok()
                    .build();
    }
    
    
    @DELETE
    @Path("{apid}")
    public Response deleteAppointment(@PathParam("id") int id){ 
        new DBUtils().deleteAppointment(id);
        return Response
            .ok()
            .build();
    }
}
