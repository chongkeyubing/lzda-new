package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.PunReportMapper;
import com.mwkj.lzda.model.PunReport;
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

    @Override
    public void add(PunReport punReport, HttpServletRequest request) {
    //上传图片并保存至附件表
    String attachmentId = attachmentService.uploadImgsAndSaveUrls(request);

    //和附件表关联
    punReport.setAttachmentId(attachmentId);
        this.save(punReport);
    }

    @Override
    public void update(PunReport punReport, HttpServletRequest request) {
        attachmentService.uploadImgsAndUpdateUrls(punReport.getAttachmentId(),request);
        this.update(punReport);
    }

}
