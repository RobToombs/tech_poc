package com.toombs.appointment

import io.quarkus.hibernate.orm.panache.kotlin.PanacheRepository
import javax.enterprise.context.ApplicationScoped

@ApplicationScoped
class AppointmentRepository : PanacheRepository<Appointment> {}

