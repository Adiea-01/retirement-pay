package com.github.fashionbrot.core.service.impl;

import com.github.fashionbrot.common.exception.MarsException;
import com.github.fashionbrot.core.dao.RetirementPayrollItemDao;
import com.github.fashionbrot.core.entity.RetirementPayrollEntity;
import com.github.fashionbrot.core.entity.RetirementPayrollItemEntity;
import com.github.fashionbrot.core.service.RetirementPayrollItemService;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.read.biff.WorkbookParser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/3/18 14:56
 */
@Slf4j
@Service
public class RetirementPayrollItemServiceImpl implements RetirementPayrollItemService {

    @Autowired
    private RetirementPayrollItemDao retirementPayrollItemDao;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void uploadExcel(MultipartFile multipartFile) throws IOException {
        //获取原始的文件名
        String originalFilename = multipartFile.getOriginalFilename();
        //判断如果不是excel文件的话，就不上传了
        if (!originalFilename.endsWith("xls")) {
            throw new MarsException("jxl只支持2003版之前的Excel格式");
        }
        Workbook workbook = null;
        InputStream inputStream = multipartFile.getInputStream();
        try {
            workbook = WorkbookParser.getWorkbook(inputStream);
            Sheet sheet = workbook.getSheet(0);
            //读取excel表中的数据写入到数据库
            int rowsCount = sheet.getRows();//总行数
            int columnsCount = sheet.getColumns();//总列数

            Cell[] titleCells = sheet.getRow(0);
            for (int y = 1; y < rowsCount; y++) {
                Cell[] cells = sheet.getRow(y);
                String personnelNumber = cells[0].getContents();//人员编号
                String dept = cells[1].getContents();//部门
                String userName = cells[2].getContents();//真实姓名
                String identityCard = cells[3].getContents();//身份证号
                String payDate = cells[4].getContents();//日期
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                RetirementPayrollEntity retirementPayroll=RetirementPayrollEntity.builder()
                        .identityCard(identityCard)
                        .personnelNumber(personnelNumber)
                        .payDate(simpleDateFormat.parse(payDate))
                        .build();


                for (int i = 5; i < titleCells.length; i++) {
                    String itemName = titleCells[i].getContents();
                    String payResult = cells[i].getContents();
                    RetirementPayrollItemEntity.builder()
                            .retirementPayrollId(retirementPayroll.getId())
                            .payItem(itemName)
                            .payResult(payResult)
                            .build();

                }
            }


        } catch (BiffException b) {
            log.error("工作流读取异常", b);
        } catch (ParseException p) {
            log.error("日期转换异常", p);
        }
    }


}
