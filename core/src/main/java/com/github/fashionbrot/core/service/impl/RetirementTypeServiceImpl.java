package com.github.fashionbrot.core.service.impl;

import com.github.fashionbrot.common.enums.RespCode;
import com.github.fashionbrot.common.exception.CurdException;
import com.github.fashionbrot.common.vo.PageVo;
import com.github.fashionbrot.core.dao.RetirementTypeDao;
import com.github.fashionbrot.core.entity.RetirementTypeEntity;
import com.github.fashionbrot.core.service.RetirementTypeService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 离退休分类表
 *
 * @author panzhenghui
 * @email
 * @date 2021-03-09
 */
@Service
public class RetirementTypeServiceImpl implements RetirementTypeService {

    @Autowired
    private RetirementTypeDao retirementTypeDao;

//    @Override
//    public Collection<RetirementTypeEntity> queryList(Map<String, Object> params) {
//        return retirementTypeDao.listByMap(params);
//    }

//    /**
//     * 查询数据列表
//     *
//     * @param params 查询条件
//     * @return List<RetirementTypeEntity>
//     */
//    public Collection<RetirementTypeEntity> retirementTypeByMap(Map<String, Object> params) {
//        return retirementTypeDao.listByMap(params);
//    }

    /**
     * 分页查询
     *
     * @return
     */
    @Override
    public PageVo queryAll(Integer start, Integer length) {
        Page<?> page = PageHelper.startPage(start, length);
        List<RetirementTypeEntity> list = retirementTypeDao.queryAll(null);

        return PageVo.builder()
                .rows(list)
                .total(page.getTotal())
                .build();
    }

    @Override
    public void insert(String retirementName) {
        retirementTypeDao.updateAllByDefaultFlag();
        RetirementTypeEntity retirementTypeEntity = RetirementTypeEntity.builder()
                .retirementName(retirementName)
                .defaultFlag(1)
                .build();
        int count = retirementTypeDao.add(retirementTypeEntity);
        if (count < 0) {
            throw new CurdException(RespCode.SAVE_ERROR);
        }
    }

    @Override
    public void updateDefaultFlag(Long id) {
        int count = retirementTypeDao.updateDefaultFlag(id);
        if (count < 0) {
            throw new CurdException("设置默认失败");
        }
    }

    //    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public boolean insertBatch(Collection<RetirementTypeEntity> entityList) {
//        return retirementTypeDao.saveBatch(entityList, 30);
//    }

//    /**
//     * 批量插入
//     *
//     * @param entityList
//     * @param batchSize
//     * @return
//     */
//    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public boolean insertBatch(Collection<RetirementTypeEntity> entityList, int batchSize) {
//        return retirementTypeDao.saveBatch(entityList, batchSize);
//    }
//
//    @Override
//    public void updateById(RetirementTypeEntity entity) {
//        if (!retirementTypeDao.updateById(entity)) {
//            throw new CurdException(RespCode.UPDATE_ERROR);
//        }
//    }
//
//    @Override
//    public void update(RetirementTypeEntity entity, Wrapper<RetirementTypeEntity> updateWrapper) {
//        if (!retirementTypeDao.update(entity, updateWrapper)) {
//            throw new CurdException(RespCode.UPDATE_ERROR);
//        }
//    }
//
//    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public boolean updateBatchById(Collection<RetirementTypeEntity> entityList) {
//        return retirementTypeDao.updateBatchById(entityList, 30);
//    }
//
//    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public boolean updateBatchById(Collection<RetirementTypeEntity> entityList, int batchSize) {
//        return retirementTypeDao.updateBatchById(entityList, batchSize);
//    }
//
//    @Override
//    public RetirementTypeEntity selectById(Serializable id) {
//        return retirementTypeDao.getById(id);
//    }
//
//    @Override
//    public void deleteById(Serializable id) {
//        if (!retirementTypeDao.removeById(id)) {
//            throw new CurdException(RespCode.DELETE_ERROR);
//        }
//    }
//
//    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public void deleteBatchIds(Collection<? extends Serializable> idList) {
//        if (CollectionUtils.isNotEmpty(idList)) {
//            boolean result = retirementTypeDao.removeByIds(idList);
//            if (!result) {
//                throw new CurdException(RespCode.DELETE_ERROR);
//            }
//        }
//    }
//
//    @Override
//    public boolean deleteByMap(Map<String, Object> columnMap) {
//        return retirementTypeDao.removeByMap(columnMap);
//    }
//
//    @Override
//    public boolean delete(Wrapper<RetirementTypeEntity> queryWrapper) {
//        return retirementTypeDao.remove(queryWrapper);
//    }


}