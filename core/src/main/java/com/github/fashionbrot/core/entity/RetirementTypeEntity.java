package com.github.fashionbrot.core.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

/**
 * 离退休分类表
 *
 * @author panzhenghui
 * @email
 * @date 2021-03-09
 */
@ApiModel(value = "离退休分类表")
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("retirement_type")
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RetirementTypeEntity extends BaseEntity {
    private static final long serialVersionUID = 1L;


    @ApiModelProperty(value = "离退休工资分类名称")
    @TableField("retirement_name")
    private String retirementName;

    @ApiModelProperty(value = "当前默认 1:当前默认")
    @TableField("default_flag")
    private Integer defaultFlag;

}