package com.github.fashionbrot.core.dao;

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

    public List<Map<String, Object>> selectAll() {
        return retirementPayrollMapper.selectAll();
    }

    public List<Map<String, Object>> selectAllByIdentityCard(String identityCard) {
        return retirementPayrollMapper.selectAllByIdentityCard(identityCard);
    }

    public Map<String, Object> selectAllById(Long id) {
        return retirementPayrollMapper.selectAllById(id);
    }


}
