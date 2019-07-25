package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.PunGiftMapper;
import com.mwkj.lzda.enu.LogOperateTypeEnum;
import com.mwkj.lzda.enu.PunishTypeEnum;
import com.mwkj.lzda.model.PunGift;
import com.mwkj.lzda.service.OperateLogService;
import com.mwkj.lzda.service.PunGiftService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import com.mwkj.lzda.service.AttachmentService;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by CodeGenerator on 2019-07-19 14:48.
 */
@Service
@Transactional
public class PunGiftServiceImpl extends AbstractService<PunGift> implements PunGiftService {
    @Resource
    private PunGiftMapper punGiftMapper;

    @Resource
    private AttachmentService attachmentService;

    @Resource
    private OperateLogService operateLogService;

    @Override
    public void add(PunGift punGift, HttpServletRequest request) {
        //上传图片并保存至附件表
        String attachmentId = attachmentService.uploadImgsAndSaveUrls(request);

        //和附件表关联
        punGift.setAttachmentId(attachmentId);
        this.save(punGift);

        //遍历惩罚表类型枚举
        String operateObject = null;
        for (PunishTypeEnum typeEnum : PunishTypeEnum.values()) {
            if (punGift.getPunishType() == typeEnum.punishType()) {
                operateObject = typeEnum.punishName();
                break;
            }
        }

        //插入日志信息
        operateLogService.save(operateObject, LogOperateTypeEnum.添加.toString(), punGift.getUserId());
    }

    @Override
    public void update(PunGift punGift, HttpServletRequest request) {
        attachmentService.uploadImgsAndUpdateUrls(punGift.getAttachmentId(), request);
        this.update(punGift);

        //遍历惩罚表类型枚举
        String operateObject = null;
        for (PunishTypeEnum typeEnum : PunishTypeEnum.values()) {
            if (punGift.getPunishType() == typeEnum.punishType()) {
                operateObject = typeEnum.punishName();
                break;
            }
        }
        //插入日志信息
        operateLogService.save(operateObject, LogOperateTypeEnum.修改.toString(), punGift.getUserId());
    }

}
