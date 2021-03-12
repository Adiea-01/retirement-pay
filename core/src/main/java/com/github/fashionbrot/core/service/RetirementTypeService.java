package com.github.fashionbrot.core.service;

import com.github.fashionbrot.common.vo.PageVo;
import com.github.fashionbrot.core.entity.RetirementTypeEntity;

/**
 * 离退休分类表
 *
 * @author panzhenghui
 * @email
 * @date 2021-03-09
 */
public interface RetirementTypeService {

    /**
     * 分页查询
     *
     * @return PageVo
     */
    PageVo queryAll(Integer start, Integer length);


    /**
     * 插入一条记录（选择字段，策略插入）
     */
    void insert(String retirementName);

    /**
     * 修改默认
     *
     * @param id
     */
    void updateDefaultFlag(Long id);


    /**
     * 查询该条信息
     * @param id
     * @return
     */
    RetirementTypeEntity queryById(Long id);

    /**
     * 修改离退休名称
     * @param retirementTypeEntity
     */
    void update(RetirementTypeEntity retirementTypeEntity);

    /**
     * 通过id删除该条信息
     * @param id
     */
    void deleteById(Long id);




}