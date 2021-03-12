package com.github.fashionbrot.core.service.impl;

import com.github.fashionbrot.common.enums.RespCode;
import com.github.fashionbrot.common.exception.CurdException;
import com.github.fashionbrot.common.vo.PageVo;
import com.github.fashionbrot.core.dao.RetirementTypeDao;
import com.github.fashionbrot.core.entity.RetirementTypeEntity;
import com.github.fashionbrot.core.service.RetirementTypeService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

/**
 * 离退休分类表
 *
 * @author panzhenghui
 * @email
 * @date 2021-03-09
 */
@Service
@Slf4j
public class RetirementTypeServiceImpl implements RetirementTypeService {

    @Autowired
    private RetirementTypeDao retirementTypeDao;


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

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void insert(String retirementName) {
        retirementTypeDao.updateAllByDefaultFlag();
        RetirementTypeEntity retirementTypeEntity = RetirementTypeEntity.builder()
                .retirementName(retirementName)
                .defaultFlag(1)
                .build();
        int count = retirementTypeDao.add(retirementTypeEntity);
        if (count != 1) {
            throw new CurdException(RespCode.SAVE_ERROR);
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateDefaultFlag(Long id) {
        int count = retirementTypeDao.updateDefaultFlag(id);
        if (count != 1) {
            throw new CurdException("设置默认失败");
        }
    }

    @Override
    public RetirementTypeEntity queryById(Long id) {
        return retirementTypeDao.queryById(id);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void update(RetirementTypeEntity retirementTypeEntity) {
        int count = retirementTypeDao.update(retirementTypeEntity);
        if (count != 1) {
            throw new CurdException(RespCode.UPDATE_ERROR);
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteById(Long id) {
        RetirementTypeEntity retirementTypeEntity = retirementTypeDao.queryById(id);
        Optional.ofNullable(retirementTypeEntity)
                .filter(rte -> rte.getDefaultFlag() == 0)
                .orElseThrow(() -> new CurdException("该数据作为当前默认，不能删除"));
        int count = retirementTypeDao.deleteById(id);
        if (count != 1) {
            throw new CurdException(RespCode.DELETE_ERROR);
        }
    }



}