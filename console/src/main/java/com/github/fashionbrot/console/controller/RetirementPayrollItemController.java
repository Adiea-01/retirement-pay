package com.github.fashionbrot.console.controller;


import com.github.fashionbrot.common.vo.RespVo;
import com.github.fashionbrot.core.entity.RetirementPayrollItemEntity;
import com.github.fashionbrot.core.service.RetirementPayrollItemService;
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
 * 离退休工资数据表
 *
 * @author panzhenghui
 * @email
 * @date 2021-03-09
 */

@Controller
@RequestMapping("retirement/payroll/item")
@Api(tags = "离退休工资数据表")
@ApiSort(23048310)
public class RetirementPayrollItemController {

    @Autowired
    private RetirementPayrollItemService retirementPayrollItemService;


    @GetMapping("/index")
    public String index() {
        return "/retirementPayrollItemIndex";
    }


//    @ApiOperation("数据列表—分页")
//    @GetMapping("/page")
//    @ResponseBody
//    public RespVo page(RetirementPayrollItemReq req){
//        return  RespVo.success(retirementPayrollItemService.pageList(req));
//    }


    @ApiOperation("数据列表")
    @GetMapping("/queryList")
    @ResponseBody
    public Collection<RetirementPayrollItemEntity> queryList(@RequestParam Map<String, Object> params) {
        return retirementPayrollItemService.queryList(params);
    }


    @ApiOperation("根据id查询")
    @PostMapping("/selectById")
    @ResponseBody
    public RespVo selectById(Long id) {
        RetirementPayrollItemEntity data = retirementPayrollItemService.selectById(id);
        return RespVo.success(data);
    }


    @ApiOperation("新增")
    @PostMapping("/insert")
    @ResponseBody
    public RespVo add(@RequestBody RetirementPayrollItemEntity entity) {
        retirementPayrollItemService.insert(entity);
        return RespVo.success();
    }


    @ApiOperation("修改")
    @PostMapping("/updateById")
    @ResponseBody
    public RespVo updateById(@RequestBody RetirementPayrollItemEntity entity) {
        retirementPayrollItemService.updateById(entity);
        return RespVo.success();
    }

    @ApiOperation("根据id删除")
    @PostMapping("/deleteById")
    @ResponseBody
    public RespVo deleteById(Long id) {
        retirementPayrollItemService.deleteById(id);
        return RespVo.success();
    }


    @ApiOperation("批量删除")
    @PostMapping("/deleteByIds")
    @ResponseBody
    public RespVo delete(@RequestBody Long[] ids) {
        retirementPayrollItemService.deleteBatchIds(Arrays.asList(ids));
        return RespVo.success();
    }


}