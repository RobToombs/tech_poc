package com.toombs.appointment

import javax.enterprise.context.ApplicationScoped
import javax.enterprise.inject.Default
import javax.inject.Inject
import javax.transaction.Transactional

@ApplicationScoped
class AppointmentService {

    @Inject
    @field: Default
    lateinit var appointmentDAO: AppointmentDAO

    fun getAppointments() : List<Appointment> {
        return appointmentDAO.listAll()
    }

    @Transactional
    fun saveAppointments(appointment : Appointment) {
        appointment.persist()
      //  appointmentDAO.persist(appointments)
    }

}