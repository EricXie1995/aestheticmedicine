package com.iiiedu.beauty.appointment.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.iiiedu.beauty.model.Appointment;
import com.iiiedu.beauty.model.Clinic;
import com.iiiedu.beauty.model.Dentist;
import com.iiiedu.beauty.model.TimeTable;

@Service
public interface AppointmentService {

	Appointment saveAppointment(Appointment appointment);
	
	Appointment updateAppointment(Appointment appointment);
	
	Appointment findAppointment(String appointmentPkId);
	
	void deleteAppointment(String appointmentPkId);

	List<TimeTable> getTimeTable(String day);

	List<Dentist> getDoctor(int item, int time, int clinic);

	List<Appointment> checkFull(Dentist dentist, String timeTablePkId, String appointmentDate);

	void InsertAppointment(Appointment ap);

	Object getClinicBeanByClinicPkId(Clinic clinic);

}
