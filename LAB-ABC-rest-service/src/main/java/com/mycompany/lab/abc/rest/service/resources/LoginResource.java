package com.mycompany.lab.abc.rest.service.resources;

import com.google.gson.Gson;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("p_login")
public class LoginResource {
    Gson gson = new Gson();

    public LoginResource() {
        
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response loginPatient(String json){ 
        Patient patient = gson.fromJson(json, Patient.class); 
        
        boolean isAuthenticated = new DBUtils().authenticatePatient(patient.getEmail(), patient.getPassword());
        
        if (isAuthenticated) {
            return Response
                .status(Response.Status.OK)
                .build();
        } else {
            return Response
                .status(Response.Status.UNAUTHORIZED)
                .build();
        }
    }
}
