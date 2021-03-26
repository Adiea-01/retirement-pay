
package com.github.fashionbrot.core.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.fashionbrot.core.entity.RetirementPayrollEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * 离退休工资单管理表
 *
 * @author panzhenghui
 * @email
 * @date 2021-03-09
 */
@Mapper
public interface RetirementPayrollMapper extends BaseMapper<RetirementPayrollEntity> {

    //管理员查询体检列表
    List<Map<String, Object>> selectAll(Map<String, Object> map);

    //登录人查询个人体检列表
    List<Map<String, Object>> selectPayrollById(Map<String, Object> map);

    @Select("SELECT rpr.id,sui.department,sui.real_name AS realName,rpr.personnel_number AS personnelNumber,LEFT(rpr.pay_date, 7) AS payDate FROM retirement_payroll rpr " +
            "LEFT JOIN sys_user_info sui ON rpr.user_id = sui.id " +
            "WHERE rpr.id=#{id}")
    Map<String, Object> selectAllById(@Param("id") Long id);


}