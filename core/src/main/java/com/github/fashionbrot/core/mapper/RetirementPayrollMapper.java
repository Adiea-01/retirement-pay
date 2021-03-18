
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


    @Select("SELECT rpr.id,rpr.personnel_number AS personnelNumber,sui.department,sui.real_name AS realName,rpr.pay_date AS payDate,rpr.`view`,rpr.view_date AS viewDate,rpr.create_date AS createDate,rt.retirement_name AS retirementName FROM retirement_payroll rpr " +
            "LEFT JOIN sys_user_info sui ON rpr.identity_card=sui.identity_card " +
            "LEFT JOIN retirement_type rt ON rpr.retirement_type_id=rt.id")
    List<Map<String, Object>> selectAll();

    @Select("SELECT rpr.id,rpr.personnel_number AS personnelNumber,sui.department,sui.real_name AS realName,rpr.pay_date AS payDate,rpr.`view`,rpr.view_date AS viewDate,rpr.create_date AS createDate,rt.retirement_name AS retirementName FROM retirement_payroll rpr " +
            "LEFT JOIN sys_user_info sui ON rpr.identity_card=sui.identity_card " +
            "LEFT JOIN retirement_type rt ON rpr.retirement_type_id=rt.id " +
            "WHERE rpr.identity_card=#{identityCard}")
    List<Map<String, Object>> selectAllByIdentityCard(@Param("identityCard") String identityCard);

//    @Select("SELECT rpr.id,sui.department,sui.real_name AS realName,rpr.personnel_number AS personnelNumber,rpr.pay_date AS payDate FROM retirement_payroll rpr " +
//            "LEFT JOIN sys_user_info sui ON rpr.identity_card = sui.identity_card " +
//            "WHERE rpr.id=#{id} AND rpr.del_flag=0 AND sui.del_flag=0")
    @Select("SELECT rpr.id,sui.department,sui.real_name AS realName,rpr.personnel_number AS personnelNumber,rpr.pay_date AS payDate FROM retirement_payroll rpr " +
            "LEFT JOIN sys_user_info sui ON rpr.identity_card = sui.identity_card " +
            "WHERE rpr.id=#{id}")
    Map<String, Object> selectAllById(@Param("id") Long id);


}