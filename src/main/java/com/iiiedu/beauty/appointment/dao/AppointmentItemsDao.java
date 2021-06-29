package com.iiiedu.beauty.appointment.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iiiedu.beauty.model.Items;

public interface AppointmentItemsDao extends JpaRepository<Items, Integer>{

}
