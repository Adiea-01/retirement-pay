package com.github.fashionbrot.core.service.impl;

import com.github.fashionbrot.common.exception.CurdException;
import com.github.fashionbrot.common.model.LoginModel;
import com.github.fashionbrot.common.vo.PageVo;
import com.github.fashionbrot.core.dao.RetirementPayrollDao;
import com.github.fashionbrot.core.entity.RetirementTypeEntity;
import com.github.fashionbrot.core.service.RetirementPayrollService;
import com.github.fashionbrot.core.service.UserLoginService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/3/12 16:20
 */
@Service
@Slf4j
public class RetirementPayrollServiceImpl implements RetirementPayrollService {

    @Autowired
    private RetirementPayrollDao retirementPayrollDao;

    @Autowired
    private UserLoginService userLoginService;

    @Override
    public PageVo queryAll(Integer start, Integer length) {
        LoginModel model = userLoginService.getLogin();

        Optional.ofNullable(model)
                .filter(model1 -> !model1.isSuperAdmin())
                .ifPresent(m -> {

                });

        Page<?> page = PageHelper.startPage(start, length);
        List<RetirementTypeEntity> list = retirementPayrollDao.queryAll(null);

        return PageVo.builder()
                .rows(list)
                .total(page.getTotal())
                .build();
    }
}
