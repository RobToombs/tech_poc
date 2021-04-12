package com.toombs.appointment

import javax.enterprise.inject.Default
import javax.inject.Inject
import javax.ws.rs.GET
import javax.ws.rs.Path

@Path("/appointments")
class AppointmentController {

    @Inject
    @field: Default
    lateinit var appointmentService: AppointmentService

    @GET
    fun appointments() : List<Appointment> {
        return appointmentService.getAppointments()
    }
}