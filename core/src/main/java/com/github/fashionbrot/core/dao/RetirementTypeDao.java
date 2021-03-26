package com.github.fashionbrot.core.dao;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.fashionbrot.core.entity.RetirementTypeEntity;
import com.github.fashionbrot.core.mapper.RetirementTypeMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/3/10 15:21
 */
@Slf4j
@Service
public class RetirementTypeDao {

    @Autowired
    private RetirementTypeMapper retirementTypeMapper;

    public int updateAllByDefaultFlag() {
        return retirementTypeMapper.updateAllByDefaultFlag(0);
    }

    public List<RetirementTypeEntity> queryAll(QueryWrapper queryWrapper) {
        return retirementTypeMapper.selectList(queryWrapper);
    }

    public int add(RetirementTypeEntity retirementTypeEntity) {
        retirementTypeEntity.setCreateDate(new Date());
        return retirementTypeMapper.insert(retirementTypeEntity);
    }

    public int updateDefaultFlag(Long id) {
        //先把全部都设置为0，再对当前id设置为默认
        retirementTypeMapper.updateAllByDefaultFlag(0);
        return retirementTypeMapper.updateDefaultFlagById(1, id);
    }


    public RetirementTypeEntity queryById(Long id) {
        RetirementTypeEntity retirementTypeEntity = retirementTypeMapper.selectById(id);
        return retirementTypeEntity;
    }


    public int update(RetirementTypeEntity retirementTypeEntity) {
        return retirementTypeMapper.updateById(retirementTypeEntity);
    }

    public int deleteById(Long id) {
        return retirementTypeMapper.deleteById(id);
    }


    public RetirementTypeEntity queryDefaultFlag() {
        RetirementTypeEntity retirementTypeEntity = retirementTypeMapper.selectOne(new QueryWrapper<RetirementTypeEntity>().eq("default_flag", 1));
        return retirementTypeEntity;
    }

}
