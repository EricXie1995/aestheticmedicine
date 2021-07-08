package com.iiiedu.beauty.appointment.service;

import java.util.List;

import com.iiiedu.beauty.model.Appointment;
import com.iiiedu.beauty.model.Dentist;
import com.iiiedu.beauty.model.TimeTable;

public interface AppointmentService {

	List<Dentist> getDoctor(int item, int time, int clinic);

	List<Appointment> checkFull(Dentist dentist, String timeTablePkId, String appointmentDate);

	List<TimeTable> getTimeTable(String day);

}
