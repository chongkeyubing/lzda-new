package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.PunAccountabilityMapper;
import com.mwkj.lzda.enu.LogOperateTypeEnum;
import com.mwkj.lzda.enu.PunishTypeEnum;
import com.mwkj.lzda.model.PunAccountability;
import com.mwkj.lzda.service.OperateLogService;
import com.mwkj.lzda.service.PunAccountabilityService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import com.mwkj.lzda.service.AttachmentService;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by CodeGenerator on 2019-07-19 14:14.
 */
@Service
@Transactional
public class PunAccountabilityServiceImpl extends AbstractService<PunAccountability> implements PunAccountabilityService {
    @Resource
    private PunAccountabilityMapper punAccountabilityMapper;

    @Resource
    private AttachmentService attachmentService;

    @Resource
    OperateLogService operateLogService;

    @Override
    public void add(PunAccountability punAccountability, HttpServletRequest request) {
        //上传图片并保存至附件表
        String attachmentId = attachmentService.uploadImgsAndSaveUrls(request);

        //和附件表关联
        punAccountability.setAttachmentId(attachmentId);
        this.save(punAccountability);

        //遍历惩罚表类型枚举
        String operateObject = null;
        for (PunishTypeEnum typeEnum : PunishTypeEnum.values()) {
            if (punAccountability.getPunishType() == typeEnum.punishType()) {
                operateObject = typeEnum.punishName();
                break;
            }
        }

        //插入日志信息
        operateLogService.save(operateObject, LogOperateTypeEnum.添加.toString(), punAccountability.getUserId());
    }

    @Override
    public void update(PunAccountability punAccountability, HttpServletRequest request) {
        attachmentService.uploadImgsAndUpdateUrls(punAccountability.getAttachmentId(), request);
        this.update(punAccountability);


        //遍历惩罚表类型枚举
        String operateObject = null;
        for (PunishTypeEnum typeEnum : PunishTypeEnum.values()) {
            if (punAccountability.getPunishType() == typeEnum.punishType()) {
                operateObject = typeEnum.punishName();
                break;
            }
        }
        //插入日志信息
        operateLogService.save(operateObject, LogOperateTypeEnum.修改.toString(), punAccountability.getUserId());
    }

}
