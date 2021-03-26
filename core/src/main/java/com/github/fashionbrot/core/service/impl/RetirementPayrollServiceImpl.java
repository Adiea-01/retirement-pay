package com.github.fashionbrot.core.service.impl;

import com.github.fashionbrot.common.model.LoginModel;
import com.github.fashionbrot.common.vo.PageVo;
import com.github.fashionbrot.core.dao.RetirementPayrollDao;
import com.github.fashionbrot.core.dao.impl.RetirementPayrollItemDaoImpl;
import com.github.fashionbrot.core.entity.RetirementPayrollEntity;
import com.github.fashionbrot.core.entity.RetirementPayrollItemEntity;
import com.github.fashionbrot.core.service.RetirementPayrollService;
import com.github.fashionbrot.core.service.UserLoginService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
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
    private RetirementPayrollItemDaoImpl retirementPayrollItemDao;

    @Autowired
    private UserLoginService userLoginService;


    @Override
    public PageVo queryAll(Integer start, Integer length, String department, String realName, String beginTime, String endTime) {
        LoginModel model = userLoginService.getLogin();
        Map<String, Object> map = new HashMap<>();
        map.put("department", department);
        map.put("realName", realName);
        map.put("beginTime", beginTime);
        map.put("endTime", endTime);
        Page<?> page = PageHelper.startPage(start, length);
        List<Map<String, Object>> list = null;
        if (model != null) {
            if (model.isSuperAdmin()) {
                list = retirementPayrollDao.selectAll(map);
            } else {
                map.put("id", model.getUserId());
                list = retirementPayrollDao.selectPayrollById(map);
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

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int updateById(Long id) {
        RetirementPayrollEntity retirementPayrollEntity = retirementPayrollDao.selectById(id);
        retirementPayrollEntity.setView(Long.valueOf(1));
        retirementPayrollEntity.setViewDate(new Date());
        int count = retirementPayrollDao.updateById(retirementPayrollEntity);
        return count;
    }

}
