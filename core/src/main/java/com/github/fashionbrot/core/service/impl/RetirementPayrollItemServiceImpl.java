package com.github.fashionbrot.core.service.impl;

import com.github.fashionbrot.common.exception.MarsException;
import com.github.fashionbrot.core.dao.RetirementPayrollDao;
import com.github.fashionbrot.core.dao.RetirementPayrollItemDao;
import com.github.fashionbrot.core.dao.RetirementTypeDao;
import com.github.fashionbrot.core.dao.UserInfoDao;
import com.github.fashionbrot.core.entity.RetirementPayrollEntity;
import com.github.fashionbrot.core.entity.RetirementPayrollItemEntity;
import com.github.fashionbrot.core.entity.RetirementTypeEntity;
import com.github.fashionbrot.core.entity.UserInfo;
import com.github.fashionbrot.core.service.RetirementPayrollItemService;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.read.biff.WorkbookParser;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description:
 * @Author: pan zhenghui
 * @Date: 2021/3/18 14:56
 */
@Slf4j
@Service
public class RetirementPayrollItemServiceImpl implements RetirementPayrollItemService {


    @Autowired
    private UserInfoDao userInfoDao;

    @Autowired
    private RetirementTypeDao retirementTypeDao;

    @Autowired
    private RetirementPayrollItemDao retirementPayrollItemDao;

    @Autowired
    private RetirementPayrollDao retirementPayrollDao;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void uploadExcel(MultipartFile multipartFile) throws IOException {
        //获取原始的文件名
        String originalFilename = multipartFile.getOriginalFilename();
        //判断如果不是excel文件的话，就不上传了
        if (!originalFilename.endsWith("xls")) {
            throw new MarsException("jxl只支持2003版之前的Excel格式");
        }
        //查询用户数据
        List<UserInfo> userInfoList = userInfoDao.selectList(null);

        RetirementTypeEntity retirementTypeEntity = retirementTypeDao.queryDefaultFlag();

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

                UserInfo userInfo = null;
                for (int i = 0; i < userInfoList.size(); i++) {
                    if (StringUtils.isNotBlank(identityCard)) {
                        //如果用户已存在，则获取用户的id存入体检管理表
                        if (identityCard.equals(userInfoList.get(i).getIdentityCard())) {
                            userInfo = userInfoList.get(i);
                            break;
                        } else {
                            //如果没有该用户，则添加该用户到用户表
                            String pwd = identityCard.trim().substring(identityCard.length() - 6);
                            userInfo = UserInfo.builder()
                                    .department(dept)
                                    .identityCard(identityCard)
                                    .realName(userName)
                                    .userName(userName)
                                    .password(pwd)
                                    .status(1)
                                    .roleId(Long.valueOf(2))//菜单权限：普通员工
                                    .build();
                            userInfoDao.add(userInfo);
                            break;
                        }
                    }
                }

                //保存离退休工资管理表
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月");
                RetirementPayrollEntity retirementPayroll = RetirementPayrollEntity.builder()
                        .userId(userInfo.getId())
                        .personnelNumber(personnelNumber)
                        .payDate(simpleDateFormat.parse(payDate))
                        .retirementTypeId(retirementTypeEntity.getId())
                        .build();
                retirementPayrollDao.save(retirementPayroll);

                //保存离退休工资表
                List<RetirementPayrollItemEntity> retirementPayrollItemEntityList = new ArrayList<RetirementPayrollItemEntity>();
                for (int i = 5; i < titleCells.length; i++) {
                    String itemName = titleCells[i].getContents();
                    String payResult = cells[i].getContents();
                    RetirementPayrollItemEntity retirementPayrollItemEntity = RetirementPayrollItemEntity.builder()
                            .retirementPayrollId(retirementPayroll.getId())
                            .payItem(itemName)
                            .payResult(payResult)
                            .build();
                    retirementPayrollItemEntityList.add(retirementPayrollItemEntity);
                }
                retirementPayrollItemDao.saveBatch(retirementPayrollItemEntityList, 200);
            }


        } catch (BiffException b) {
            log.error("工作流读取异常", b);
        } catch (ParseException p) {
            log.error("日期转换异常", p);
        }
    }


}
