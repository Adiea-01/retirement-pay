package com.github.fashionbrot.core.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.util.Date;

/**
 * 离退休工资单管理表
 *
 * @author panzhenghui
 * @email 
 * @date 2021-03-09
 */
@ApiModel(value = "离退休工资单管理表")
@Data
@EqualsAndHashCode(callSuper=false)
@TableName("retirement_payroll")
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RetirementPayrollEntity extends BaseEntity {
	private static final long serialVersionUID = 1L;


	@ApiModelProperty(value = "用户id")
	@TableField("user_id")
	private Long userId;

	@ApiModelProperty(value = "身份证号")
	@TableField("identity_card")
	private String identityCard;

	@ApiModelProperty(value = "人员编号")
	@TableField("personnel_number")
	private String personnelNumber;

	@ApiModelProperty(value = "体检日期")
	@TableField("pay_date")
	private Date payDate;

	@ApiModelProperty(value = "离退休分类id")
	@TableField("retirement_type_id")
	private String retirementTypeId;

	@ApiModelProperty(value = "是否查看 1：已查看；0：未查看")
	@TableField("view")
	private Long view;

	@ApiModelProperty(value = "查看日期")
	@TableField("view_date")
	private Date viewDate;
}