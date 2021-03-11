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

    @Override
    public RetirementTypeEntity queryById(Long id) {
        return retirementTypeDao.queryById(id);
    }




}