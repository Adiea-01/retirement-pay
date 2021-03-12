package com.github.fashionbrot.console.controller;


import com.github.fashionbrot.common.annotation.MarsPermission;
import com.github.fashionbrot.common.annotation.PersistentLog;
import com.github.fashionbrot.common.vo.RespVo;
import com.github.fashionbrot.core.entity.RetirementTypeEntity;
import com.github.fashionbrot.core.service.RetirementTypeService;
import com.github.xiaoymin.knife4j.annotations.ApiSort;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


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
@Slf4j
public class RetirementTypeController {

    @Autowired
    private RetirementTypeService retirementTypeService;


    @GetMapping("/index")
    @MarsPermission("retirement:type:index")
    public String index() {
        return "system/payImport/retirementTypeList";
    }

    @GetMapping("/index/add")
    public String indexAdd() {
        return "system/payImport/add";
    }

    @GetMapping("/upload")
    public String upload() {
        return "system/payImport/upload";
    }

    @ApiOperation("数据列表—分页")
    @PostMapping("/queryAll")
    @ResponseBody
    public RespVo queryAll(@RequestParam(defaultValue = "1") Integer pageNum,
                       @RequestParam(defaultValue = "10") Integer pageSize){
        return  RespVo.success(retirementTypeService.queryAll(pageNum,pageSize));
    }


    @PersistentLog
    @ApiOperation("新增离退休名称")
    @PostMapping("/add")
    @ResponseBody
    @MarsPermission("system:type:add")
    public RespVo add(@RequestParam("retirementName") String retirementName) {
        retirementTypeService.insert(retirementName);
        return RespVo.success();
    }

    @PersistentLog
    @ApiOperation("修改当前默认")
    @PostMapping("/updateDefaultFlag")
    @ResponseBody
    @MarsPermission("system:type:update")
    public RespVo updateDefaultFlag(@RequestParam("id") Long id) {
        retirementTypeService.updateDefaultFlag(id);
        return RespVo.success();
    }


    @GetMapping("/index/edit")
    public String edit(Long id, ModelMap modelMap) {
        modelMap.put("info", retirementTypeService.queryById(id));
        return "system/payImport/edit";
    }

    @ApiOperation("修改离退休名称")
    @PersistentLog
    @PostMapping("/update")
    @ResponseBody
    @MarsPermission("system:type:update")
    public RespVo update(@RequestBody RetirementTypeEntity retirementTypeEntity) {
        retirementTypeService.update(retirementTypeEntity);
        return RespVo.success();
    }

    @ApiOperation("根据id删除")
    @PersistentLog
    @PostMapping("/deleteById")
    @ResponseBody
    @MarsPermission("system:type:delete")
    public RespVo deleteById(Long id) {
        retirementTypeService.deleteById(id);
        return RespVo.success();
    }





}