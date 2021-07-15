package com.iiiedu.beauty.appointment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.appointment.dao.AppointmentRepository;
import com.iiiedu.beauty.model.Appointment;
import com.iiiedu.beauty.model.Clinic;
import com.iiiedu.beauty.model.Dentist;
import com.iiiedu.beauty.model.TimeTable;

@Service
public class AppointmentServiceImpl implements AppointmentService {

	@Autowired
	AppointmentRepository appointmentRepository;
	
	@Override
	public Appointment updateAppointment(Appointment appointment) {
		return appointmentRepository.save(appointment);
	}

	@Override
	public Appointment saveAppointment(Appointment appointment) {
		return appointmentRepository.save(appointment);
	}




	@Override
	public List<TimeTable> getTimeTable(String day) {
		return null;
	}

	@Override
	public List<Dentist> getDoctor(int item, int time, int clinic) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Appointment> checkFull(Dentist dentist, String timeTablePkId, String appointmentDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void InsertAppointment(Appointment ap) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Object getClinicBeanByClinicPkId(Clinic clinic) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteAppointment(String appointmentPkId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Appointment> findAllById(Appointment appointment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Appointment findAppointment(String appointmentPkId) {
		// TODO Auto-generated method stub
		return null;
	}

}
