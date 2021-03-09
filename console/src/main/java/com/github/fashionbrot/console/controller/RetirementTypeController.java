package com.github.fashionbrot.console.controller;


import com.github.fashionbrot.common.annotation.MarsPermission;
import com.github.fashionbrot.common.vo.RespVo;
import com.github.fashionbrot.core.entity.RetirementTypeEntity;
import com.github.fashionbrot.core.service.RetirementTypeService;
import com.github.xiaoymin.knife4j.annotations.ApiSort;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Collection;
import java.util.Map;


/**
 * 离退休分类表
 *
 * @author panzhenghui
 * @email
 * @date 2021-03-09
 */

@Controller
@RequestMapping("/retirement/type")
@Api(tags = "离退休分类表")
@ApiSort(23054521)
public class RetirementTypeController {

    @Autowired
    private RetirementTypeService retirementTypeService;


    @GetMapping("/index")
    @MarsPermission("retirement:type:index")
    public String index() {
        return "system/pay/upload";
    }

    @GetMapping("/index/add")
    public String indexAdd() {
        return "system/pay/add";
    }

    @ApiOperation("数据列表—分页")
    @PostMapping("/queryAll")
    @ResponseBody
    public RespVo queryAll(@RequestParam(defaultValue = "1") Integer pageNum,
                       @RequestParam(defaultValue = "20") Integer pageSize){
        return  RespVo.success(retirementTypeService.queryAll(pageNum,pageSize));
    }


    @ApiOperation("数据列表")
    @GetMapping("/queryList")
    @ResponseBody
    public Collection<RetirementTypeEntity> queryList(@RequestParam Map<String, Object> params) {
        return retirementTypeService.queryList(params);
    }


    @ApiOperation("根据id查询")
    @PostMapping("/selectById")
    @ResponseBody
    public RespVo selectById(Long id) {
        RetirementTypeEntity data = retirementTypeService.selectById(id);
        return RespVo.success(data);
    }


    @ApiOperation("新增")
    @PostMapping("/insert")
    @ResponseBody
    public RespVo add(@RequestBody RetirementTypeEntity entity) {
        retirementTypeService.insert(entity);
        return RespVo.success();
    }


    @ApiOperation("修改")
    @PostMapping("/updateById")
    @ResponseBody
    public RespVo updateById(@RequestBody RetirementTypeEntity entity) {
        retirementTypeService.updateById(entity);
        return RespVo.success();
    }

    @ApiOperation("根据id删除")
    @PostMapping("/deleteById")
    @ResponseBody
    public RespVo deleteById(Long id) {
        retirementTypeService.deleteById(id);
        return RespVo.success();
    }


    @ApiOperation("批量删除")
    @PostMapping("/deleteByIds")
    @ResponseBody
    public RespVo delete(@RequestBody Long[] ids) {
        retirementTypeService.deleteBatchIds(Arrays.asList(ids));
        return RespVo.success();
    }


}