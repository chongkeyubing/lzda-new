package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.core.AppException;
import com.mwkj.lzda.dao.RptResponsibilityReportMapper;
import com.mwkj.lzda.dto.RptResponsibilityReportDTO;
import com.mwkj.lzda.model.PunNotice;
import com.mwkj.lzda.model.RptResponsibilityReport;
import com.mwkj.lzda.model.RptResponsibilityReportTask;
import com.mwkj.lzda.service.AttachmentService;
import com.mwkj.lzda.service.RptResponsibilityReportService;
import com.mwkj.lzda.core.AbstractService;
import com.mwkj.lzda.service.RptResponsibilityReportTaskService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Iterator;
import java.util.List;


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

    @Resource
    private RptResponsibilityReportTaskService rptResponsibilityReportTaskService;

    @Override
    public void add(RptResponsibilityReportDTO rptResponsibilityReportDTO, HttpServletRequest request) {
        //上传图片并保存至附件表
        String attachmentId = attachmentService.uploadImgsAndSaveUrls(request);

        //保存主表
        RptResponsibilityReport report = rptResponsibilityReportDTO.getReport();
        //和附件表关联
        report.setAttachmentId(attachmentId);
        this.save(report);

        if (CollectionUtils.isEmpty(rptResponsibilityReportDTO.getTasks())) {
            throw new AppException("请新增工单");
        }

        //保存任务表
        for (RptResponsibilityReportTask rptResponsibilityReportTask : rptResponsibilityReportDTO.getTasks()) {
            rptResponsibilityReportTask.setResponsibilityReportId(report.getId());
        }

        rptResponsibilityReportTaskService.saveAll(rptResponsibilityReportDTO.getTasks());
    }

    @Override
    public void update(RptResponsibilityReportDTO rptResponsibilityReportDTO, HttpServletRequest request) {
        RptResponsibilityReport report = rptResponsibilityReportDTO.getReport();
        List<RptResponsibilityReportTask> rptResponsibilityReportTasks = rptResponsibilityReportDTO.getTasks();

        //更新主表
        this.update(report);

        //更新附件
        attachmentService.uploadImgsAndUpdateUrls(report.getAttachmentId(), request);

        //删除所有工单
        RptResponsibilityReportTask rptResponsibilityReportTask = new RptResponsibilityReportTask();
        rptResponsibilityReportTask.setResponsibilityReportId(report.getId());
        rptResponsibilityReportTaskService.delete(rptResponsibilityReportTask);

        //重新添加工单
        Iterator<RptResponsibilityReportTask> iterator = rptResponsibilityReportTasks.iterator();
        while (iterator.hasNext()) {
            RptResponsibilityReportTask task = iterator.next();
            if (StringUtils.isEmpty(task.getType())) {
                iterator.remove();
            }
            task.setResponsibilityReportId(report.getId());
        }
        rptResponsibilityReportTaskService.saveAll(rptResponsibilityReportTasks);

    }
}
