package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "pun_report")
public class PunReport {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 被惩罚人id，关联user表id
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 被惩罚人单位id
     */
    @Column(name = "organization_id")
    private Integer organizationId;

    /**
     * 被违惩人姓名
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 被惩罚人职务
     */
    @Column(name = "job_position")
    private String jobPosition;

    /**
     * 被惩罚人单位名称
     */
    private String organization;

    /**
     * 举报形式：写检举、电话举报、当面向有关人员举报、网上举报
     */
    private String type;

    /**
     * 受理部门
     */
    @Column(name = "handle_org")
    private String handleOrg;

    /**
     * 举报时间
     */
    private String time;

    /**
     * 举报人
     */
    @Column(name = "report_person_name")
    private String reportPersonName;

    /**
     * 联系方式
     */
    private String contact;

    /**
     * 核实结束时间
     */
    @Column(name = "end_time")
    private String endTime;

    /**
     * 负责人id
     */
    @Column(name = "charge_person_id")
    private Integer chargePersonId;

    /**
     * 负责人姓名
     */
    @Column(name = "charge_person")
    private String chargePerson;

    /**
     * 填表人ID
     */
    @Column(name = "operator_id")
    private Integer operatorId;

    /**
     * 填表人
     */
    private String operator;

    /**
     * 附件id，一对多关联attachment
     */
    @Column(name = "attachment_id")
    private String attachmentId;

    /**
     * 违惩类型：6一般干部被群众信访举报情况登记表
     */
    @Column(name = "punish_type")
    private Integer punishType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 填表科室
     */
    @Column(name = "handle_dep")
    private String handleDep;

    /**
     * 反应主要问题
     */
    private String problem;

    /**
     * 核实结果
     */
    private String result;

    /**
     * 处理结果
     */
    @Column(name = "hanlde_result")
    private String hanldeResult;

    /**
     * 备注
     */
    private String remark;

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
     * 获取被惩罚人id，关联user表id
     *
     * @return user_id - 被惩罚人id，关联user表id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置被惩罚人id，关联user表id
     *
     * @param userId 被惩罚人id，关联user表id
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取被惩罚人单位id
     *
     * @return organization_id - 被惩罚人单位id
     */
    public Integer getOrganizationId() {
        return organizationId;
    }

    /**
     * 设置被惩罚人单位id
     *
     * @param organizationId 被惩罚人单位id
     */
    public void setOrganizationId(Integer organizationId) {
        this.organizationId = organizationId;
    }

    /**
     * 获取被违惩人姓名
     *
     * @return user_name - 被违惩人姓名
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置被违惩人姓名
     *
     * @param userName 被违惩人姓名
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 获取被惩罚人职务
     *
     * @return job_position - 被惩罚人职务
     */
    public String getJobPosition() {
        return jobPosition;
    }

    /**
     * 设置被惩罚人职务
     *
     * @param jobPosition 被惩罚人职务
     */
    public void setJobPosition(String jobPosition) {
        this.jobPosition = jobPosition;
    }

    /**
     * 获取被惩罚人单位名称
     *
     * @return organization - 被惩罚人单位名称
     */
    public String getOrganization() {
        return organization;
    }

    /**
     * 设置被惩罚人单位名称
     *
     * @param organization 被惩罚人单位名称
     */
    public void setOrganization(String organization) {
        this.organization = organization;
    }

    /**
     * 获取举报形式：写检举、电话举报、当面向有关人员举报、网上举报
     *
     * @return type - 举报形式：写检举、电话举报、当面向有关人员举报、网上举报
     */
    public String getType() {
        return type;
    }

    /**
     * 设置举报形式：写检举、电话举报、当面向有关人员举报、网上举报
     *
     * @param type 举报形式：写检举、电话举报、当面向有关人员举报、网上举报
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取受理部门
     *
     * @return handle_org - 受理部门
     */
    public String getHandleOrg() {
        return handleOrg;
    }

    /**
     * 设置受理部门
     *
     * @param handleOrg 受理部门
     */
    public void setHandleOrg(String handleOrg) {
        this.handleOrg = handleOrg;
    }

    /**
     * 获取举报时间
     *
     * @return time - 举报时间
     */
    public String getTime() {
        return time;
    }

    /**
     * 设置举报时间
     *
     * @param time 举报时间
     */
    public void setTime(String time) {
        this.time = time;
    }

    /**
     * 获取举报人
     *
     * @return report_person_name - 举报人
     */
    public String getReportPersonName() {
        return reportPersonName;
    }

    /**
     * 设置举报人
     *
     * @param reportPersonName 举报人
     */
    public void setReportPersonName(String reportPersonName) {
        this.reportPersonName = reportPersonName;
    }

    /**
     * 获取联系方式
     *
     * @return contact - 联系方式
     */
    public String getContact() {
        return contact;
    }

    /**
     * 设置联系方式
     *
     * @param contact 联系方式
     */
    public void setContact(String contact) {
        this.contact = contact;
    }

    /**
     * 获取核实结束时间
     *
     * @return end_time - 核实结束时间
     */
    public String getEndTime() {
        return endTime;
    }

    /**
     * 设置核实结束时间
     *
     * @param endTime 核实结束时间
     */
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    /**
     * 获取负责人id
     *
     * @return charge_person_id - 负责人id
     */
    public Integer getChargePersonId() {
        return chargePersonId;
    }

    /**
     * 设置负责人id
     *
     * @param chargePersonId 负责人id
     */
    public void setChargePersonId(Integer chargePersonId) {
        this.chargePersonId = chargePersonId;
    }

    /**
     * 获取负责人姓名
     *
     * @return charge_person - 负责人姓名
     */
    public String getChargePerson() {
        return chargePerson;
    }

    /**
     * 设置负责人姓名
     *
     * @param chargePerson 负责人姓名
     */
    public void setChargePerson(String chargePerson) {
        this.chargePerson = chargePerson;
    }

    /**
     * 获取填表人ID
     *
     * @return operator_id - 填表人ID
     */
    public Integer getOperatorId() {
        return operatorId;
    }

    /**
     * 设置填表人ID
     *
     * @param operatorId 填表人ID
     */
    public void setOperatorId(Integer operatorId) {
        this.operatorId = operatorId;
    }

    /**
     * 获取填表人
     *
     * @return operator - 填表人
     */
    public String getOperator() {
        return operator;
    }

    /**
     * 设置填表人
     *
     * @param operator 填表人
     */
    public void setOperator(String operator) {
        this.operator = operator;
    }

    /**
     * 获取附件id，一对多关联attachment
     *
     * @return attachment_id - 附件id，一对多关联attachment
     */
    public String getAttachmentId() {
        return attachmentId;
    }

    /**
     * 设置附件id，一对多关联attachment
     *
     * @param attachmentId 附件id，一对多关联attachment
     */
    public void setAttachmentId(String attachmentId) {
        this.attachmentId = attachmentId;
    }

    /**
     * 获取违惩类型：6一般干部被群众信访举报情况登记表
     *
     * @return punish_type - 违惩类型：6一般干部被群众信访举报情况登记表
     */
    public Integer getPunishType() {
        return punishType;
    }

    /**
     * 设置违惩类型：6一般干部被群众信访举报情况登记表
     *
     * @param punishType 违惩类型：6一般干部被群众信访举报情况登记表
     */
    public void setPunishType(Integer punishType) {
        this.punishType = punishType;
    }

    /**
     * 获取创建时间
     *
     * @return create_time - 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取填表科室
     *
     * @return handle_dep - 填表科室
     */
    public String getHandleDep() {
        return handleDep;
    }

    /**
     * 设置填表科室
     *
     * @param handleDep 填表科室
     */
    public void setHandleDep(String handleDep) {
        this.handleDep = handleDep;
    }

    /**
     * 获取反应主要问题
     *
     * @return problem - 反应主要问题
     */
    public String getProblem() {
        return problem;
    }

    /**
     * 设置反应主要问题
     *
     * @param problem 反应主要问题
     */
    public void setProblem(String problem) {
        this.problem = problem;
    }

    /**
     * 获取核实结果
     *
     * @return result - 核实结果
     */
    public String getResult() {
        return result;
    }

    /**
     * 设置核实结果
     *
     * @param result 核实结果
     */
    public void setResult(String result) {
        this.result = result;
    }

    /**
     * 获取处理结果
     *
     * @return hanlde_result - 处理结果
     */
    public String getHanldeResult() {
        return hanldeResult;
    }

    /**
     * 设置处理结果
     *
     * @param hanldeResult 处理结果
     */
    public void setHanldeResult(String hanldeResult) {
        this.hanldeResult = hanldeResult;
    }

    /**
     * 获取备注
     *
     * @return remark - 备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置备注
     *
     * @param remark 备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }
}