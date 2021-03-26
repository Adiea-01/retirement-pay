package com.github.fashionbrot.core.dao;

import com.github.fashionbrot.core.entity.RetirementPayrollEntity;
import com.github.fashionbrot.core.mapper.RetirementPayrollMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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

    /**
     * 管理员查询列表
     * @param map
     * @return
     */
    public List<Map<String, Object>> selectAll(Map<String, Object> map) {
        return retirementPayrollMapper.selectAll(map);
    }

    /**
     * 当前用户查询个人工资单
     * @param map
     * @return
     */
    public List<Map<String, Object>> selectPayrollById(Map<String, Object> map) {
        return retirementPayrollMapper.selectPayrollById(map);
    }

    public Map<String, Object> selectAllById(Long id) {
        return retirementPayrollMapper.selectAllById(id);
    }

    public int save(RetirementPayrollEntity retirementPayrollEntity){
        return retirementPayrollMapper.insert(retirementPayrollEntity);
    }

    public RetirementPayrollEntity selectById(Long id) {
        return retirementPayrollMapper.selectById(id);
    }

    public int updateById(RetirementPayrollEntity retirementPayrollEntity) {
        return retirementPayrollMapper.updateById(retirementPayrollEntity);
    }
}
