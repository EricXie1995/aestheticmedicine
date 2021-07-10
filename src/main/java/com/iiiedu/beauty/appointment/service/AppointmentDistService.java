package com.iiiedu.beauty.appointment.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.iiiedu.beauty.model.Dist;

@Service
public interface AppointmentDistService {



	public List<Dist> findAll();
}
