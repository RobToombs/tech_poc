package com.toombs.appointment

import java.math.BigDecimal
import java.time.LocalDate
import java.time.LocalDateTime
import javax.enterprise.context.ApplicationScoped
import javax.enterprise.inject.Default
import javax.inject.Inject
import javax.transaction.Transactional

@ApplicationScoped
class AppointmentService {

    @Inject
    @field: Default
    lateinit var appointmentRepository: AppointmentRepository

    @Inject
    @field: Default
    lateinit var medicationRepository: MedicationRepository

    fun getAppointments() : List<Appointment> {
        return appointmentRepository.listAll()
    }

    @Transactional
    fun populateDatabase() : Boolean {
        return try {
            medicationRepository.deleteAll();
            appointmentRepository.deleteAll();

            for (index in 1..20) {
                val appt = createAppointment(index)
                appointmentRepository.persistAndFlush(appt)
            }

            true
        } catch (e: Exception) {
            false
        }
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