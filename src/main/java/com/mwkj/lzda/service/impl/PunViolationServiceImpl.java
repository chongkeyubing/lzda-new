package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.core.AppException;
import com.mwkj.lzda.dao.PunViolationMapper;
import com.mwkj.lzda.model.Attachment;
import com.mwkj.lzda.model.PunViolation;
import com.mwkj.lzda.service.AttachmentService;
import com.mwkj.lzda.service.PunViolationService;
import com.mwkj.lzda.core.AbstractService;
import com.mwkj.lzda.util.IDGenerator;
import com.mwkj.lzda.util.SpringFileUploader;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


/**
 * Created by CodeGenerator on 2019-07-18 20:34.
 */
@Service
@Transactional
public class PunViolationServiceImpl extends AbstractService<PunViolation> implements PunViolationService {
    @Resource
    private PunViolationMapper punViolationMapper;

    @Resource
    private AttachmentService attachmentService;

    @Override
    public void add(PunViolation punViolation, HttpServletRequest request) {
        //上传图片并保存至附件表
        String attachmentId = attachmentService.uploadImgsAndSaveUrls(request);

        //和附件表关联
        punViolation.setAttachmentId(attachmentId);
        this.save(punViolation);
    }

    @Override
    public void update(PunViolation punViolation, HttpServletRequest request) {
        attachmentService.uploadImgsAndUpdateUrls(punViolation.getAttachmentId(),request);
        this.update(punViolation);
    }
}
