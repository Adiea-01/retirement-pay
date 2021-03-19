package com.github.fashionbrot.core.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * 离退休工资数据表
 *
 * @author panzhenghui
 * @email
 * @date 2021-03-09
 */
public interface RetirementPayrollItemService {

    void uploadExcel(MultipartFile multipartFile) throws IOException;

}