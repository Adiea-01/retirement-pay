package com.github.fashionbrot.core.service;

import com.github.fashionbrot.common.vo.PageVo;

/**
 * 离退休工资单管理表
 *
 * @author panzhenghui
 * @email
 * @date 2021-03-09
 */
public interface RetirementPayrollService {

    PageVo queryAll(Integer start, Integer length);


}