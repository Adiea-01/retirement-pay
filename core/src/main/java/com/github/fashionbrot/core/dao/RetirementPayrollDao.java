package com.github.fashionbrot.core.dao;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.fashionbrot.core.entity.RetirementTypeEntity;
import com.github.fashionbrot.core.mapper.RetirementPayrollMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/3/10 15:21
 */
@Slf4j
@Service
public class RetirementPayrollDao {

    @Autowired
    private RetirementPayrollMapper retirementPayrollMapper;

    public List<RetirementTypeEntity> queryAll(QueryWrapper queryWrapper) {
        return retirementPayrollMapper.selectList(queryWrapper);
    }

}
