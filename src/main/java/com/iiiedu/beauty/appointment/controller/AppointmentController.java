package com.iiiedu.beauty.appointment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iiiedu.beauty.appointment.dao.AppointmentDao;
import com.iiiedu.beauty.model.City;

@Controller
@RequestMapping("/appointment")
public class AppointmentController {

//	@Autowired
//	private AppointmentService appointmentService;

	@Autowired
	private AppointmentDao appointmentDao;
	
	
	
	@GetMapping(value = "/appointment")
	public String getAllCity(Model model) {
		List<City> cities = appointmentDao.findAll();
		model.addAttribute("cities", cities);
//		List<Items> items = appointmentService.getAllItems();
//		model.addAttribute("items", items);
		return "schedule-timings";
	}
}
