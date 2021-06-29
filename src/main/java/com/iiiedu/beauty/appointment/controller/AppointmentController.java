package com.iiiedu.beauty.appointment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iiiedu.beauty.appointment.service.AppointmentCityService;
import com.iiiedu.beauty.appointment.service.AppointmentDistService;
import com.iiiedu.beauty.appointment.service.AppointmentItemsService;
import com.iiiedu.beauty.model.City;
import com.iiiedu.beauty.model.Items;

@Controller
@RequestMapping("/appointment")
public class AppointmentController {

	@Autowired
	AppointmentCityService appointmentCityService;
	
	@Autowired
	AppointmentDistService appointmentDistService;
	
	@Autowired
	AppointmentItemsService appointmentItemsService;
	
	@GetMapping(value = "/appointment")
	public String getAllCity(Model model) {
		List<City> cities = appointmentCityService.findAll();
		model.addAttribute("cities", cities);
		List<Items> items = appointmentItemsService.findAll();
		model.addAttribute("items", items);
		return "schedule-timings";
	}
}
