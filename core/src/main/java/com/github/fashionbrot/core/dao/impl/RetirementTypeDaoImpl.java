package com.github.fashionbrot.core.dao.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.fashionbrot.core.dao.RetirementTypeDao;
import com.github.fashionbrot.core.entity.RetirementTypeEntity;
import com.github.fashionbrot.core.mapper.RetirementTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RetirementTypeDaoImpl extends ServiceImpl<RetirementTypeMapper, RetirementTypeEntity> implements RetirementTypeDao {

    @Autowired
    private RetirementTypeMapper retirementTypeMapper;


}
