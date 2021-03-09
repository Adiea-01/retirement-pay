package com.github.fashionbrot.console.controller;

import com.github.fashionbrot.common.annotation.MarsPermission;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/3/8 17:07
 */
@Controller
@RequestMapping("/system/pay")
@Slf4j
public class RetirementPayController {


    @MarsPermission("system:pay:index")
    @GetMapping("/index")
    public String index(String a) {
        return "system/pay/upload";
    }

}
