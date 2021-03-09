package com.github.fashionbrot.core.dao.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.fashionbrot.core.dao.RetirementPayrollDao;
import com.github.fashionbrot.core.entity.RetirementPayrollEntity;
import com.github.fashionbrot.core.mapper.RetirementPayrollMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RetirementPayrollDaoImpl extends ServiceImpl<RetirementPayrollMapper, RetirementPayrollEntity> implements RetirementPayrollDao {

    @Autowired
    private RetirementPayrollMapper retirementPayrollMapper;


}
