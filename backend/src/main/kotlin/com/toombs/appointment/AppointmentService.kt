package com.toombs.appointment

import java.math.BigDecimal
import java.time.LocalDate
import java.time.LocalDateTime
import javax.enterprise.context.ApplicationScoped
import javax.enterprise.inject.Default
import javax.inject.Inject

@ApplicationScoped
class AppointmentService {

    @Inject
    @field: Default
    lateinit var appointmentDAO: AppointmentDAO

    fun getAppointments() : List<Appointment> {
        return appointmentDAO.listAll()
    }

    fun populateDatabase() : Boolean {
        for(index in 1..20) {
            val appt = createAppointment(index)
            appointmentDAO.persistAndFlush(appt)
        }
        return true
    }

    private fun createAppointment(index : Int) : Appointment {
        val appt = Appointment()
        appt.lastName = "Last $index"
        appt.firstName = "First $index"
        appt.dob = LocalDate.now().minusYears(index.toLong())
        appt.mrn = "Mrn $index"
        appt.date = LocalDateTime.now().plusDays(index.toLong())
        appt.clinician = "Dr. Pants"

        val med = Medication()
        med.appointment = appt
        med.name = "Med $index"
        med.firstFill = LocalDate.now().minusDays(index.toLong())
        med.copay = BigDecimal.valueOf(index.toLong() + 1)
        med.daysSupply = index

        appt.medications = listOf(med)

        return appt
    }
}