package com.iiiedu.beauty.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.iiiedu.beauty.model.AdminUser;

public interface AdminUserService {
	/**
     * 根據id查詢
     *
     * @param id
     * @return
     */
    AdminUser findById(int id);

    /**
     * 分頁查詢所有
     *
     * @param pageable
     * @return
     */
    Page<AdminUser> findAll(Pageable pageable);

    /**
     * 依條件查詢
     *
     * @param example
     * @return
     */
    List<AdminUser> findAllExample(Example<AdminUser> example);

    /**
     * 更新
     *
     * @param adminUser
     * @return
     */
    void update(AdminUser adminUser);

    /**
     * 創建
     *
     * @param adminUser
     * @return
     */
    int create(AdminUser adminUser);

    /**
     * 根據ID刪除
     *
     * @param id
     * @return
     */
    void delById(int id);

    /**
     * 檢查登入
     * @param request
     * @param username
     * @param pwd
     * @return
     */
    AdminUser checkLogin(HttpServletRequest request,String username, String pwd);

}
