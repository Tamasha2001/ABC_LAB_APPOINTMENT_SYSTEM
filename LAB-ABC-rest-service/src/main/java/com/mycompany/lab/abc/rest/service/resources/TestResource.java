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
@Path("test")
public class TestResource {
    Gson gson = new Gson();

    public TestResource() {
    }
    
    
     @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getTests(){    
        return Response
                .ok(gson.toJson(new DBUtils().getTests()))
                .build();
    }

    @GET
    @Path("{test_id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getTest(@PathParam("test_id") int id){ 
       System.err.println("Test "+ id);
        try {
        Test test = new DBUtils().getTest(id);
        
        if (test != null) {
                  return Response
                    .ok(gson.toJson(test))
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
    public Response addTest(String json){ 
        Test test = gson.fromJson(json, Test.class); 
        new DBUtils().addTest(test);
        return Response
                .status(Response.Status.CREATED)
                .build();
    }
    
    @PUT
    @Path("{test_id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateTest(String json, @PathParam("test_id") int id){ 
        Test test = gson.fromJson(json, Test.class);
        new DBUtils().updateTest(test);
        return Response
                    .ok()
                    .build();
    }
    
    
    @DELETE
    @Path("{test_id}")
    public Response deleteTest(@PathParam("test_id") int id){ 
        new DBUtils().deleteTest(id);
        return Response
            .ok()
            .build();
    }
}
