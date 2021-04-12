package com.toombs.appointment

import com.fasterxml.jackson.annotation.JsonIgnore
import io.quarkus.hibernate.orm.panache.kotlin.PanacheEntity
import java.math.BigDecimal
import java.time.LocalDate
import javax.persistence.*

@Entity
data class Medication (
    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "appointment_id")
    var appointment: Appointment? = null,
    var name: String = "",
    var firstFill: LocalDate? = null,
    var copay: BigDecimal = BigDecimal.ZERO,
    var daysSupply: Int = 0
) : PanacheEntity()
