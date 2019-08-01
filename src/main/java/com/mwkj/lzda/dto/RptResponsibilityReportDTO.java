package com.mwkj.lzda.dto;

import com.mwkj.lzda.model.RptResponsibilityReport;
import com.mwkj.lzda.model.RptResponsibilityReportTask;

import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-08-01 10:37
 * @Description 主体责任上报入参
 */
public class RptResponsibilityReportDTO {
    private RptResponsibilityReport report;

    private List<RptResponsibilityReportTask> tasks;

    public RptResponsibilityReport getReport() {
        return report;
    }

    public void setReport(RptResponsibilityReport report) {
        this.report = report;
    }

    public List<RptResponsibilityReportTask> getTasks() {
        return tasks;
    }

    public void setTasks(List<RptResponsibilityReportTask> tasks) {
        this.tasks = tasks;
    }
}