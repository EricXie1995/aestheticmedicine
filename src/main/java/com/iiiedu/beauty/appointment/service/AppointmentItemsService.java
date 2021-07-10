package com.iiiedu.beauty.appointment.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.iiiedu.beauty.model.Items;

@Service
public interface AppointmentItemsService {

	public List<Items> findAll();
}
