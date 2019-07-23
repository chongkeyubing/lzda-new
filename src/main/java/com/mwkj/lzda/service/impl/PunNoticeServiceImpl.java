package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.PunNoticeMapper;
import com.mwkj.lzda.enu.LogOperateTypeEnum;
import com.mwkj.lzda.enu.PunishTypeEnum;
import com.mwkj.lzda.model.PunNotice;
import com.mwkj.lzda.service.OperateLogService;
import com.mwkj.lzda.service.PunNoticeService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import com.mwkj.lzda.service.AttachmentService;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by CodeGenerator on 2019-07-19 14:38.
 */
@Service
@Transactional
public class PunNoticeServiceImpl extends AbstractService<PunNotice> implements PunNoticeService {
    @Resource
    private PunNoticeMapper punNoticeMapper;

    @Resource
    private AttachmentService attachmentService;

    @Resource
    private OperateLogService operateLogService;

    @Override
    public void add(PunNotice punNotice, HttpServletRequest request) {
        //上传图片并保存至附件表
        String attachmentId = attachmentService.uploadImgsAndSaveUrls(request);

        //和附件表关联
        punNotice.setAttachmentId(attachmentId);
        this.save(punNotice);

        //遍历惩罚表类型枚举
        String operateObject = null;
        for (PunishTypeEnum typeEnum : PunishTypeEnum.values()) {
            if (punNotice.getPunishType() == typeEnum.punishType()) {
                operateObject = typeEnum.punishName();
                break;
            }
        }

        //插入日志信息
        operateLogService.save(operateObject, LogOperateTypeEnum.添加.toString(), punNotice.getUserId());
    }

    @Override
    public void update(PunNotice punNotice, HttpServletRequest request) {
        attachmentService.uploadImgsAndUpdateUrls(punNotice.getAttachmentId(), request);
        this.update(punNotice);

        //遍历惩罚表类型枚举
        String operateObject = null;
        for (PunishTypeEnum typeEnum : PunishTypeEnum.values()) {
            if (punNotice.getPunishType() == typeEnum.punishType()) {
                operateObject = typeEnum.punishName();
                break;
            }
        }

        //插入日志信息
        operateLogService.save(operateObject, LogOperateTypeEnum.修改.toString(), punNotice.getUserId());
    }

}
