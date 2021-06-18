package com.iiiedu.beauty.admin.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iiiedu.beauty.model.AdminUser;

public interface AdminUserDao extends JpaRepository<AdminUser, Integer> {
	AdminUser findByUsernameAndPassword(String username, String pwd);
}
