package com.github.fashionbrot.core.dao.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.fashionbrot.core.dao.RetirementPayrollItemDao;
import com.github.fashionbrot.core.entity.RetirementPayrollItemEntity;
import com.github.fashionbrot.core.mapper.RetirementPayrollItemMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class RetirementPayrollItemDaoImpl extends ServiceImpl<RetirementPayrollItemMapper, RetirementPayrollItemEntity> implements RetirementPayrollItemDao {

    @Autowired
    private RetirementPayrollItemMapper retirementPayrollItemMapper;

    public List<RetirementPayrollItemEntity> queryAllByRetirementPayrollId(Long id) {
        return retirementPayrollItemMapper.selectList(new QueryWrapper<RetirementPayrollItemEntity>().eq("retirement_payroll_id", id));
    }


}
