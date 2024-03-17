package com.mycompany.lab.abc.rest.service.resources;

import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/login")
public class LoginResource {
 
    private DBUtils DBUtils = new DBUtils();
 
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response login(Patient patient) {
        boolean success = DBUtils.verifyLogin(patient.getEmail(), patient.getPassword());
        if (success) {
            return Response.ok().entity("{\"success\": true}").build();
        } else {
            return Response.status(Response.Status.UNAUTHORIZED).entity("{\"success\": false, \"message\": \"Invalid email or password\"}").build();
        }
    }
}