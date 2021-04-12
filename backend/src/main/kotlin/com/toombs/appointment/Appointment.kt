package com.toombs.appointment

import io.quarkus.hibernate.orm.panache.kotlin.PanacheEntity
import java.time.LocalDate
import java.time.LocalDateTime
import javax.persistence.CascadeType
import javax.persistence.Entity
import javax.persistence.OneToMany

@Entity
data class Appointment (
    var lastName: String = "",
    var firstName: String = "",
    var dob: LocalDate? = null,
    var mrn: String = "",
    var date: LocalDateTime? = null,
    var clinician: String = "",
    var lastSaved: LocalDateTime? = null,
    @OneToMany(cascade = [CascadeType.ALL], mappedBy = "appointment", orphanRemoval = true)
    var medications: List<Medication> = emptyList()
) : PanacheEntity()