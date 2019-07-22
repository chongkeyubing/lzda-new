package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.RptResponsibilityReportMapper;
import com.mwkj.lzda.model.PunNotice;
import com.mwkj.lzda.model.RptResponsibilityReport;
import com.mwkj.lzda.service.AttachmentService;
import com.mwkj.lzda.service.RptResponsibilityReportService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


/**
 * Created by CodeGenerator on 2019-07-22 10:17.
 */
@Service
@Transactional
public class RptResponsibilityReportServiceImpl extends AbstractService<RptResponsibilityReport> implements RptResponsibilityReportService {
    @Resource
    private RptResponsibilityReportMapper rptResponsibilityReportMapper;

    @Resource
    private AttachmentService attachmentService;

    @Override
    public void add(RptResponsibilityReport rptResponsibilityReport, HttpServletRequest request) {
        //上传图片并保存至附件表
        String attachmentId = attachmentService.uploadImgsAndSaveUrls(request);

        //和附件表关联
        rptResponsibilityReport.setAttachmentId(attachmentId);
        this.save(rptResponsibilityReport);
    }

    @Override
    public void update(RptResponsibilityReport rptResponsibilityReport, HttpServletRequest request) {
        attachmentService.uploadImgsAndUpdateUrls(rptResponsibilityReport.getAttachmentId(),request);
        this.update(rptResponsibilityReport);
    }
}
