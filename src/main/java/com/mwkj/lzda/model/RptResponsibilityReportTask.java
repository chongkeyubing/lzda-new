package com.mwkj.lzda.model;

import javax.persistence.*;

@Table(name = "rpt_responsibility_report_task")
public class RptResponsibilityReportTask {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 关联rpt_responsibility_report表id
     */
    @Column(name = "responsibility_report_id")
    private Integer responsibilityReportId;

    /**
     * 工单类别：主体责任季度工单、第一责任人责任季度工单
     */
    private String type;

    /**
     * 任务序号
     */
    @Column(name = "task_order")
    private String taskOrder;

    /**
     * 是否完成
     */
    private String complete;

    /**
     * 具体落实情况
     */
    @Column(name = "complete_info")
    private String completeInfo;

    /**
     * 获取主键
     *
     * @return id - 主键
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置主键
     *
     * @param id 主键
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取关联rpt_responsibility_report表id
     *
     * @return responsibility_report_id - 关联rpt_responsibility_report表id
     */
    public Integer getResponsibilityReportId() {
        return responsibilityReportId;
    }

    /**
     * 设置关联rpt_responsibility_report表id
     *
     * @param responsibilityReportId 关联rpt_responsibility_report表id
     */
    public void setResponsibilityReportId(Integer responsibilityReportId) {
        this.responsibilityReportId = responsibilityReportId;
    }

    /**
     * 获取工单类别：主体责任季度工单、第一责任人责任季度工单
     *
     * @return type - 工单类别：主体责任季度工单、第一责任人责任季度工单
     */
    public String getType() {
        return type;
    }

    /**
     * 设置工单类别：主体责任季度工单、第一责任人责任季度工单
     *
     * @param type 工单类别：主体责任季度工单、第一责任人责任季度工单
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取任务序号
     *
     * @return task_order - 任务序号
     */
    public String getTaskOrder() {
        return taskOrder;
    }

    /**
     * 设置任务序号
     *
     * @param taskOrder 任务序号
     */
    public void setTaskOrder(String taskOrder) {
        this.taskOrder = taskOrder;
    }

    /**
     * 获取是否完成
     *
     * @return complete - 是否完成
     */
    public String getComplete() {
        return complete;
    }

    /**
     * 设置是否完成
     *
     * @param complete 是否完成
     */
    public void setComplete(String complete) {
        this.complete = complete;
    }

    /**
     * 获取具体落实情况
     *
     * @return complete_info - 具体落实情况
     */
    public String getCompleteInfo() {
        return completeInfo;
    }

    /**
     * 设置具体落实情况
     *
     * @param completeInfo 具体落实情况
     */
    public void setCompleteInfo(String completeInfo) {
        this.completeInfo = completeInfo;
    }
}