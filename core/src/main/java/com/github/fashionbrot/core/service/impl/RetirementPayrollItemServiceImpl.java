package com.github.fashionbrot.core.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.github.fashionbrot.common.enums.RespCode;
import com.github.fashionbrot.common.exception.CurdException;
import com.github.fashionbrot.core.dao.RetirementPayrollItemDao;
import com.github.fashionbrot.core.entity.RetirementPayrollItemEntity;
import com.github.fashionbrot.core.service.RetirementPayrollItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.Collection;
import java.util.Map;

/**
 * 离退休工资数据表
 *
 * @author panzhenghui
 * @email
 * @date 2021-03-09
 */
@Service
public class RetirementPayrollItemServiceImpl implements RetirementPayrollItemService {

    @Autowired
    private RetirementPayrollItemDao retirementPayrollItemDao;

    @Override
    public Collection<RetirementPayrollItemEntity> queryList(Map<String, Object> params) {
        return retirementPayrollItemDao.listByMap(params);
    }

    /**
     * 查询数据列表
     *
     * @param params 查询条件
     * @return List<RetirementPayrollItemEntity>
     */
    public Collection<RetirementPayrollItemEntity> retirementPayrollItemByMap(Map<String, Object> params) {
        return retirementPayrollItemDao.listByMap(params);
    }

    /**
     * 分页查询
     *
     * @param req
     * @return
     */
//    public PageVo pageList(RetirementPayrollItemReq req){
//        Page<?> page= PageHelper.startPage(req.getPageNum(),req.getPageSize());
//        List<RetirementPayrollItemEntity> list = retirementPayrollItemDao.list(null);
//
//        return PageVo.builder()
//                .rows(list)
//                .total(page.getTotal())
//                .build();
//    }
    @Override
    public void insert(RetirementPayrollItemEntity entity) {
        if (!retirementPayrollItemDao.save(entity)) {
            throw new CurdException(RespCode.SAVE_ERROR);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insertBatch(Collection<RetirementPayrollItemEntity> entityList) {
        return retirementPayrollItemDao.saveBatch(entityList, 30);
    }

    /**
     * 批量插入
     *
     * @param entityList
     * @param batchSize
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insertBatch(Collection<RetirementPayrollItemEntity> entityList, int batchSize) {
        return retirementPayrollItemDao.saveBatch(entityList, batchSize);
    }

    @Override
    public void updateById(RetirementPayrollItemEntity entity) {
        if (!retirementPayrollItemDao.updateById(entity)) {
            throw new CurdException(RespCode.UPDATE_ERROR);
        }
    }

    @Override
    public void update(RetirementPayrollItemEntity entity, Wrapper<RetirementPayrollItemEntity> updateWrapper) {
        if (!retirementPayrollItemDao.update(entity, updateWrapper)) {
            throw new CurdException(RespCode.UPDATE_ERROR);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateBatchById(Collection<RetirementPayrollItemEntity> entityList) {
        return retirementPayrollItemDao.updateBatchById(entityList, 30);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateBatchById(Collection<RetirementPayrollItemEntity> entityList, int batchSize) {
        return retirementPayrollItemDao.updateBatchById(entityList, batchSize);
    }

    @Override
    public RetirementPayrollItemEntity selectById(Serializable id) {
        return retirementPayrollItemDao.getById(id);
    }

    @Override
    public void deleteById(Serializable id) {
        if (!retirementPayrollItemDao.removeById(id)) {
            throw new CurdException(RespCode.DELETE_ERROR);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteBatchIds(Collection<? extends Serializable> idList) {
        if (CollectionUtils.isNotEmpty(idList)) {
            boolean result = retirementPayrollItemDao.removeByIds(idList);
            if (!result) {
                throw new CurdException(RespCode.DELETE_ERROR);
            }
        }
    }

    @Override
    public boolean deleteByMap(Map<String, Object> columnMap) {
        return retirementPayrollItemDao.removeByMap(columnMap);
    }

    @Override
    public boolean delete(Wrapper<RetirementPayrollItemEntity> queryWrapper) {
        return retirementPayrollItemDao.remove(queryWrapper);
    }


}