package com.github.fashionbrot.core.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.github.fashionbrot.common.vo.PageVo;
import com.github.fashionbrot.core.entity.RetirementTypeEntity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Map;

/**
 * 离退休分类表
 *
 * @author panzhenghui
 * @email
 * @date 2021-03-09
 */
public interface RetirementTypeService {

//    /**
//     * 根据 map 查询
//     *
//     * @param params
//     * @return
//     */
//    Collection<RetirementTypeEntity> queryList(Map<String, Object> params);
//
//    /**
//     * 根据 map 查询
//     *
//     * @param params
//     * @return
//     */
//    Collection<RetirementTypeEntity> retirementTypeByMap(Map<String, Object> params);

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
     * @param id
     */
    void updateDefaultFlag(Long id);



//    /**
//     * <p>
//     * 插入（批量），该方法不支持 Oracle、SQL Server
//     * </p>
//     *
//     * @param entityList 实体对象集合
//     */
//    boolean insertBatch(Collection<RetirementTypeEntity> entityList);
//
//    /**
//     * <p>
//     * 插入（批量）
//     * </p>
//     *
//     * @param entityList 实体对象集合
//     * @param batchSize  插入批次数量
//     */
//    boolean insertBatch(Collection<RetirementTypeEntity> entityList, int batchSize);
//
//    /**
//     * <p>
//     * 根据 ID 选择修改
//     * </p>
//     *
//     * @param entity 实体对象
//     */
//    void updateById(RetirementTypeEntity entity);
//
//    /**
//     * <p>
//     * 根据 whereEntity 条件，更新记录
//     * </p>
//     *
//     * @param entity        实体对象
//     * @param updateWrapper 实体对象封装操作类 {@link com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper}
//     */
//    void update(RetirementTypeEntity entity, Wrapper<RetirementTypeEntity> updateWrapper);
//
//    /**
//     * <p>
//     * 根据ID 批量更新
//     * </p>
//     *
//     * @param entityList 实体对象集合
//     */
//    boolean updateBatchById(Collection<RetirementTypeEntity> entityList);
//
//    /**
//     * <p>
//     * 根据ID 批量更新
//     * </p>
//     *
//     * @param entityList 实体对象集合
//     * @param batchSize  更新批次数量
//     */
//    boolean updateBatchById(Collection<RetirementTypeEntity> entityList, int batchSize);
//
//    /**
//     * <p>
//     * 根据 ID 查询
//     * </p>
//     *
//     * @param id 主键ID
//     */
//    RetirementTypeEntity selectById(Serializable id);
//
//    /**
//     * <p>
//     * 根据 ID 删除
//     * </p>
//     *
//     * @param id 主键ID
//     */
//    void deleteById(Serializable id);
//
//    /**
//     * <p>
//     * 删除（根据ID 批量删除）
//     * </p>
//     *
//     * @param idList 主键ID列表
//     */
//    void deleteBatchIds(Collection<? extends Serializable> idList);
//
//    /**
//     * <p>
//     * 根据 columnMap 条件，删除记录
//     * </p>
//     *
//     * @param columnMap 表字段 map 对象
//     */
//    boolean deleteByMap(Map<String, Object> columnMap);
//
//    /**
//     * <p>
//     * 根据 entity 条件，删除记录
//     * </p>
//     *
//     * @param queryWrapper 实体对象封装操作类（可以为 null）
//     */
//    boolean delete(Wrapper<RetirementTypeEntity> queryWrapper);
}