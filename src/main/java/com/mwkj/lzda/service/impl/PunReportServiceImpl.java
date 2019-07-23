package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.PunReportMapper;
import com.mwkj.lzda.enu.LogOperateTypeEnum;
import com.mwkj.lzda.enu.PunishTypeEnum;
import com.mwkj.lzda.model.PunReport;
import com.mwkj.lzda.service.OperateLogService;
import com.mwkj.lzda.service.PunReportService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import com.mwkj.lzda.service.AttachmentService;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by CodeGenerator on 2019-07-19 14:37.
 */
@Service
@Transactional
public class PunReportServiceImpl extends AbstractService<PunReport> implements PunReportService {
    @Resource
    private PunReportMapper punReportMapper;

    @Resource
    private AttachmentService attachmentService;

    @Resource
    private OperateLogService operateLogService;

    @Override
    public void add(PunReport punReport, HttpServletRequest request) {
        //上传图片并保存至附件表
        String attachmentId = attachmentService.uploadImgsAndSaveUrls(request);

        //和附件表关联
        punReport.setAttachmentId(attachmentId);
        this.save(punReport);

        //遍历惩罚表类型枚举
        String operateObject = null;
        for (PunishTypeEnum typeEnum : PunishTypeEnum.values()) {
            if (punReport.getPunishType() == typeEnum.punishType()) {
                operateObject = typeEnum.punishName();
                break;
            }
        }

        //插入日志信息
        operateLogService.save(operateObject, LogOperateTypeEnum.添加.toString(), punReport.getUserId());
    }

    @Override
    public void update(PunReport punReport, HttpServletRequest request) {
        attachmentService.uploadImgsAndUpdateUrls(punReport.getAttachmentId(), request);
        this.update(punReport);

        //遍历惩罚表类型枚举
        String operateObject = null;
        for (PunishTypeEnum typeEnum : PunishTypeEnum.values()) {
            if (punReport.getPunishType() == typeEnum.punishType()) {
                operateObject = typeEnum.punishName();
                break;
            }
        }

        //插入日志信息
        operateLogService.save(operateObject, LogOperateTypeEnum.修改.toString(), punReport.getUserId());
    }

}
