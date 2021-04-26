package com.toombs.appointment

import javax.enterprise.inject.Default
import javax.inject.Inject
import javax.ws.rs.GET
import javax.ws.rs.Path

@Path("/api")
class AppointmentController {

    @Inject
    @field: Default
    lateinit var appointmentService: AppointmentService

    @GET
    @Path("/appointments")
    fun appointments() : List<Appointment> {
        return appointmentService.getAppointments()
    }
}