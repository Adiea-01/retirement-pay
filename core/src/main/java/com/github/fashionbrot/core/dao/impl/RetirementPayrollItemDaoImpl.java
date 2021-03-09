package com.github.fashionbrot.core.dao.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.fashionbrot.core.dao.RetirementPayrollItemDao;
import com.github.fashionbrot.core.entity.RetirementPayrollItemEntity;
import com.github.fashionbrot.core.mapper.RetirementPayrollItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RetirementPayrollItemDaoImpl extends ServiceImpl<RetirementPayrollItemMapper, RetirementPayrollItemEntity> implements RetirementPayrollItemDao {

    @Autowired
    private RetirementPayrollItemMapper retirementPayrollItemMapper;


}
