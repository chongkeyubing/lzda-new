package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.PunAccountabilityMapper;
import com.mwkj.lzda.model.PunAccountability;
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

    @Override
    public void add(PunAccountability punAccountability, HttpServletRequest request) {
    //上传图片并保存至附件表
    String attachmentId = attachmentService.uploadImgsAndSaveUrls(request);

    //和附件表关联
    punAccountability.setAttachmentId(attachmentId);
        this.save(punAccountability);
    }

    @Override
    public void update(PunAccountability punAccountability, HttpServletRequest request) {
        attachmentService.uploadImgsAndUpdateUrls(punAccountability.getAttachmentId(),request);
        this.update(punAccountability);
    }

}
