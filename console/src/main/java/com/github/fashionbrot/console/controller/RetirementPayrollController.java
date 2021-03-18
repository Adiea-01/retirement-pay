package com.github.fashionbrot.console.controller;

import com.github.fashionbrot.common.annotation.MarsPermission;
import com.github.fashionbrot.common.vo.RespVo;
import com.github.fashionbrot.core.entity.LogEntity;
import com.github.fashionbrot.core.entity.RetirementPayrollItemEntity;
import com.github.fashionbrot.core.service.RetirementPayrollService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/3/12 15:59
 */
@Controller
@RequestMapping("/retirement/payroll")
@Api(tags = "离退休工资管理")
@Slf4j
public class RetirementPayrollController {

    @Autowired
    private RetirementPayrollService retirementPayrollService;

    @GetMapping("/index")
    @MarsPermission("retirement:payroll:index")
    public String index() {
        return "system/payList/list";
    }

    @GetMapping("/index/payDetail")
    @MarsPermission("system:payroll:index:detail")
    public String payDetail( Long id, ModelMap modelMap){
        Map<String, Object> userMap = retirementPayrollService.selectAllById(id);
        List<RetirementPayrollItemEntity> retirementPayrollItemEntities = retirementPayrollService.queryAllByRetirementPayrollId(id);
        modelMap.put("user",userMap);
        modelMap.put("list",retirementPayrollItemEntities);
        return "system/payList/payDetail";
    }


    @ApiOperation("查询离退休人员列表")
    @PostMapping("/queryAll")
    @ResponseBody
    public RespVo queryAll(@RequestParam(defaultValue = "1") Integer pageNum,
                           @RequestParam(defaultValue = "10") Integer pageSize){
        return  RespVo.success(retirementPayrollService.queryAll(pageNum,pageSize));
    }

}
