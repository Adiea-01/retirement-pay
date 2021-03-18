package com.github.fashionbrot.core.service.impl;

import com.github.fashionbrot.core.dao.RetirementPayrollDao;
import com.github.fashionbrot.core.dao.RetirementPayrollItemDao;
import com.github.fashionbrot.core.service.RetirementPayrollItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/3/18 14:56
 */
@Service
@Slf4j
public class RetirementPayrollItemServiceImpl implements RetirementPayrollItemService {

    @Autowired
    private RetirementPayrollItemDao retirementPayrollItemDao;




}
