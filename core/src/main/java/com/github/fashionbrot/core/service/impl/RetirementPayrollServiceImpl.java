package com.github.fashionbrot.core.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.github.fashionbrot.common.enums.RespCode;
import com.github.fashionbrot.common.exception.CurdException;
import com.github.fashionbrot.core.dao.RetirementPayrollDao;
import com.github.fashionbrot.core.entity.RetirementPayrollEntity;
import com.github.fashionbrot.core.service.RetirementPayrollService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.Collection;
import java.util.Map;

/**
 * 离退休工资单管理表
 *
 * @author panzhenghui
 * @email
 * @date 2021-03-09
 */
@Service
public class RetirementPayrollServiceImpl implements RetirementPayrollService {

    @Autowired
    private RetirementPayrollDao retirementPayrollDao;

    @Override
    public Collection<RetirementPayrollEntity> queryList(Map<String, Object> params) {
        return retirementPayrollDao.listByMap(params);
    }

    /**
     * 查询数据列表
     *
     * @param params 查询条件
     * @return List<RetirementPayrollEntity>
     */
    public Collection<RetirementPayrollEntity> retirementPayrollByMap(Map<String, Object> params) {
        return retirementPayrollDao.listByMap(params);
    }

    /**
     * 分页查询
     *
     * @param req
     * @return
     */
//    public PageVo pageList(RetirementPayrollReq req){
//        Page<?> page= PageHelper.startPage(req.getPageNum(),req.getPageSize());
//        List<RetirementPayrollEntity> list = retirementPayrollDao.list(null);
//
//        return PageVo.builder()
//                .rows(list)
//                .total(page.getTotal())
//                .build();
//    }
    @Override
    public void insert(RetirementPayrollEntity entity) {
        if (!retirementPayrollDao.save(entity)) {
            throw new CurdException(RespCode.SAVE_ERROR);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insertBatch(Collection<RetirementPayrollEntity> entityList) {
        return retirementPayrollDao.saveBatch(entityList, 30);
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
    public boolean insertBatch(Collection<RetirementPayrollEntity> entityList, int batchSize) {
        return retirementPayrollDao.saveBatch(entityList, batchSize);
    }

    @Override
    public void updateById(RetirementPayrollEntity entity) {
        if (!retirementPayrollDao.updateById(entity)) {
            throw new CurdException(RespCode.UPDATE_ERROR);
        }
    }

    @Override
    public void update(RetirementPayrollEntity entity, Wrapper<RetirementPayrollEntity> updateWrapper) {
        if (!retirementPayrollDao.update(entity, updateWrapper)) {
            throw new CurdException(RespCode.UPDATE_ERROR);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateBatchById(Collection<RetirementPayrollEntity> entityList) {
        return retirementPayrollDao.updateBatchById(entityList, 30);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateBatchById(Collection<RetirementPayrollEntity> entityList, int batchSize) {
        return retirementPayrollDao.updateBatchById(entityList, batchSize);
    }

    @Override
    public RetirementPayrollEntity selectById(Serializable id) {
        return retirementPayrollDao.getById(id);
    }

    @Override
    public void deleteById(Serializable id) {
        if (!retirementPayrollDao.removeById(id)) {
            throw new CurdException(RespCode.DELETE_ERROR);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteBatchIds(Collection<? extends Serializable> idList) {
        if (CollectionUtils.isNotEmpty(idList)) {
            boolean result = retirementPayrollDao.removeByIds(idList);
            if (!result) {
                throw new CurdException(RespCode.DELETE_ERROR);
            }
        }
    }

    @Override
    public boolean deleteByMap(Map<String, Object> columnMap) {
        return retirementPayrollDao.removeByMap(columnMap);
    }

    @Override
    public boolean delete(Wrapper<RetirementPayrollEntity> queryWrapper) {
        return retirementPayrollDao.remove(queryWrapper);
    }


}