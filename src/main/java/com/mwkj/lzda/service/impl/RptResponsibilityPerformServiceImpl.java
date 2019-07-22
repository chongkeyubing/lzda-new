package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.RptResponsibilityPerformMapper;
import com.mwkj.lzda.model.RptResponsibilityPerform;
import com.mwkj.lzda.model.RptResponsibilityReport;
import com.mwkj.lzda.service.AttachmentService;
import com.mwkj.lzda.service.RptResponsibilityPerformService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-22 17:24
* @Description todo
*/
@Service
@Transactional
public class RptResponsibilityPerformServiceImpl extends AbstractService<RptResponsibilityPerform> implements RptResponsibilityPerformService {
    @Resource
    private RptResponsibilityPerformMapper rptResponsibilityPerformMapper;

    @Resource
    private AttachmentService attachmentService;

    @Override
    public void add(RptResponsibilityPerform rptResponsibilityPerform, HttpServletRequest request) {
        //上传图片并保存至附件表
        String attachmentId = attachmentService.uploadImgsAndSaveUrls(request);

        //和附件表关联
        rptResponsibilityPerform.setAttachmentId(attachmentId);
        this.save(rptResponsibilityPerform);
    }

    @Override
    public void update(RptResponsibilityPerform rptResponsibilityPerform, HttpServletRequest request) {
        attachmentService.uploadImgsAndUpdateUrls(rptResponsibilityPerform.getAttachmentId(),request);
        this.update(rptResponsibilityPerform);
    }

}
