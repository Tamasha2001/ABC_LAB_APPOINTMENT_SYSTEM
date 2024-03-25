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
@Path("payment")
public class PaymentResource {
  Gson gson = new Gson();

    public PaymentResource() {
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getPayments(){    
        return Response
                .ok(gson.toJson(new DBUtils().getPayments()))
                .build();
    }

    @GET
    @Path("{payid}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getPayment(@PathParam("payid") int id){ 
       System.err.println("Payment "+ id);
        try {
        Payment payment = new DBUtils().getPayment(id);
        
        if (payment != null) {
                  return Response
                    .ok(gson.toJson(payment))
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
    public Response addPayment(String json){ 
        Payment payment = gson.fromJson(json, Payment.class); 
        new DBUtils().addPayment(payment);
        return Response
                .status(Response.Status.CREATED)
                .build();
    }
    
    @PUT
    @Path("{payid}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updatePayment(String json, @PathParam("payid") int id){ 
        Payment payment = gson.fromJson(json, Payment.class);
        new DBUtils().updatePayment(payment);
        return Response
                    .ok()
                    .build();
    }
    
  
    @DELETE
    @Path("{payid}")
    public Response deletePayment(@PathParam("payid") int id){ 
        new DBUtils().deletePayment(id);
        return Response
            .ok()
            .build();
    }
}
