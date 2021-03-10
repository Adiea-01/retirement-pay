
package com.github.fashionbrot.core.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.fashionbrot.core.entity.RetirementTypeEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

/**
 * 离退休分类表
 *
 * @author panzhenghui
 * @email
 * @date 2021-03-09
 */
@Mapper
public interface RetirementTypeMapper extends BaseMapper<RetirementTypeEntity> {

    @Update("UPDATE retirement_type SET default_flag = #{defaultFlag}")
    int updateAllByDefaultFlag(@Param("defaultFlag")Integer defaultFlag);

    @Update("UPDATE retirement_type SET default_flag = #{defaultFlag} WHERE id=#{id}")
    int updateDefaultFlagById(@Param("defaultFlag")Integer defaultFlag,@Param("id")Long id);


}