package com.github.fashionbrot.console.controller;


import com.github.fashionbrot.common.annotation.MarsPermission;
import com.github.fashionbrot.common.vo.RespVo;
import com.github.fashionbrot.core.entity.RetirementPayrollEntity;
import com.github.fashionbrot.core.service.RetirementPayrollService;
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
 * 离退休工资单管理表
 *
 * @author panzhenghui
 * @email
 * @date 2021-03-09
 */

@Controller
@RequestMapping("/retirement/payroll")
@Api(tags = "离退休工资单管理表")
@ApiSort(23048309)
public class RetirementPayrollController {

    @Autowired
    private RetirementPayrollService retirementPayrollService;


    @GetMapping("/index")
    @MarsPermission("retirement:payroll:index")
    public String index() {
        return "system/pay/upload";
    }


//    @ApiOperation("数据列表—分页")
//    @GetMapping("/page")
//    @ResponseBody
//    public RespVo page(RetirementPayrollReq req) {
//        return RespVo.success(retirementPayrollService.pageList(req));
//    }


    @ApiOperation("数据列表")
    @GetMapping("/queryList")
    @ResponseBody
    public Collection<RetirementPayrollEntity> queryList(@RequestParam Map<String, Object> params) {
        return retirementPayrollService.queryList(params);
    }


    @ApiOperation("根据id查询")
    @PostMapping("/selectById")
    @ResponseBody
    public RespVo selectById(Long id) {
        RetirementPayrollEntity data = retirementPayrollService.selectById(id);
        return RespVo.success(data);
    }


    @ApiOperation("新增")
    @PostMapping("/insert")
    @ResponseBody
    public RespVo add(@RequestBody RetirementPayrollEntity entity) {
        retirementPayrollService.insert(entity);
        return RespVo.success();
    }


    @ApiOperation("修改")
    @PostMapping("/updateById")
    @ResponseBody
    public RespVo updateById(@RequestBody RetirementPayrollEntity entity) {
        retirementPayrollService.updateById(entity);
        return RespVo.success();
    }

    @ApiOperation("根据id删除")
    @PostMapping("/deleteById")
    @ResponseBody
    public RespVo deleteById(Long id) {
        retirementPayrollService.deleteById(id);
        return RespVo.success();
    }


    @ApiOperation("批量删除")
    @PostMapping("/deleteByIds")
    @ResponseBody
    public RespVo delete(@RequestBody Long[] ids) {
        retirementPayrollService.deleteBatchIds(Arrays.asList(ids));
        return RespVo.success();
    }


}