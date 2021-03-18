package com.github.fashionbrot.core.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

/**
 * 离退休工资数据表
 *
 * @author panzhenghui
 * @email
 * @date 2021-03-09
 */
@ApiModel(value = "离退休工资数据表")
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("retirement_payroll_item")
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RetirementPayrollItemEntity{
    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "离退休工资单id")
    @TableField("retirement_payroll_id")
    private Long retirementPayrollId;

    @ApiModelProperty(value = "工资项目")
    @TableField("pay_item")
    private String payItem;

    @ApiModelProperty(value = "工资数据")
    @TableField("pay_result")
    private String payResult;

    @ApiModelProperty(value = "单位")
    @TableField("unit")
    private String unit;
}