package com.github.fashionbrot.core.service.impl;

import com.github.fashionbrot.common.model.LoginModel;
import com.github.fashionbrot.common.vo.PageVo;
import com.github.fashionbrot.core.dao.RetirementPayrollDao;
import com.github.fashionbrot.core.dao.RetirementPayrollItemDao;
import com.github.fashionbrot.core.entity.RetirementPayrollItemEntity;
import com.github.fashionbrot.core.service.RetirementPayrollService;
import com.github.fashionbrot.core.service.UserLoginService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.google.common.collect.Maps;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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
    private RetirementPayrollItemDao retirementPayrollItemDao;

    @Autowired
    private UserLoginService userLoginService;

    @Override
    public PageVo queryAll(Integer start, Integer length) {
        LoginModel model = userLoginService.getLogin();
        Page<?> page = PageHelper.startPage(start, length);
        List<Map<String,Object>> list = null;
        if (model != null) {
            if (model.isSuperAdmin()) {
                list = retirementPayrollDao.selectAll();
            } else {
                list = retirementPayrollDao.selectAllByIdentityCard("");
            }
        }
        return PageVo.builder()
                .rows(list)
                .total(page.getTotal())
                .build();
    }

    @Override
    public Map<String, Object> selectAllById(Long id) {
        return retirementPayrollDao.selectAllById(id);
    }

    @Override
    public List<RetirementPayrollItemEntity> queryAllByRetirementPayrollId(Long id) {
        return retirementPayrollItemDao.queryAllByRetirementPayrollId(id);
    }
}
