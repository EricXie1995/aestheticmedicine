package com.iiiedu.beauty.Classification.service;

import java.util.List;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.iiiedu.beauty.model.Classification;

public interface ClassificationService {
	
	/**
     * 根據ID查詢
     *
     * @param id
     * @return
     */
    Classification findById(int id);

    /**
     * 依照類查詢所有
     *
     * @param type
     * @return
     */
    List<Classification> findAll(int type);

    /**
     * 依照類查詢所有
     *
     * @param pageable
     * @return
     */
    Page<Classification> findAll(int type,Pageable pageable);

    /**
     * 依條件查詢
     *
     * @param example
     * @return
     */
    List<Classification> findAllExample(Example<Classification> example);

    /**
     * 更新
     *
     * @param Classification
     * @return
     */
    void update(Classification Classification);

    /**
     * 創建
     *
     * @param Classification
     * @return
     */
    int create(Classification Classification);

    /**
     * 根據ID刪除
     *
     * @param id
     * @return
     */
    void delById(int id);

    /**
     * 依照First的ID查詢他所以有的Second ID
     * @param cid
     * @return
     */
    List<Classification> findByParentId(int cid);

}
