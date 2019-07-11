package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "arc_abroad_info")
public class ArcAbroadInfo {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 关联user表id
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 单位id
     */
    @Column(name = "organization_id")
    private Integer organizationId;

    /**
     * 档案填写人姓名
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 职务
     */
    @Column(name = "job_position")
    private String jobPosition;

    /**
     * 单位名称
     */
    private String organization;

    /**
     * 具体事由
     */
    private String reason;

    /**
     * 开始时间
     */
    @Column(name = "begin_time")
    private String beginTime;

    /**
     * 结束时间
     */
    @Column(name = "end_time")
    private String endTime;

    /**
     * 目的地
     */
    private String destination;

    /**
     * 批准单位
     */
    @Column(name = "approve_organization")
    private String approveOrganization;

    /**
     * 资金来源
     */
    @Column(name = "fund_source")
    private String fundSource;

    /**
     * 出国事由
     */
    @Column(name = "goabroad_reason")
    private String goabroadReason;

    /**
     * 审核状态：1待单位负责人审核
2单位负责人审核通过
3单位负责人驳回
4待纪委审核
5纪委审核通过
6纪委审核驳回
     */
    @Column(name = "approve_status")
    private Integer approveStatus;

    /**
     * 档案类型：出国（境）情况登记表，固定值7无需填写
     */
    @Column(name = "archive_type")
    private Integer archiveType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 出国情况报告
     */
    private String report;

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
     * 获取关联user表id
     *
     * @return user_id - 关联user表id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置关联user表id
     *
     * @param userId 关联user表id
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取单位id
     *
     * @return organization_id - 单位id
     */
    public Integer getOrganizationId() {
        return organizationId;
    }

    /**
     * 设置单位id
     *
     * @param organizationId 单位id
     */
    public void setOrganizationId(Integer organizationId) {
        this.organizationId = organizationId;
    }

    /**
     * 获取档案填写人姓名
     *
     * @return user_name - 档案填写人姓名
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置档案填写人姓名
     *
     * @param userName 档案填写人姓名
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 获取职务
     *
     * @return job_position - 职务
     */
    public String getJobPosition() {
        return jobPosition;
    }

    /**
     * 设置职务
     *
     * @param jobPosition 职务
     */
    public void setJobPosition(String jobPosition) {
        this.jobPosition = jobPosition;
    }

    /**
     * 获取单位名称
     *
     * @return organization - 单位名称
     */
    public String getOrganization() {
        return organization;
    }

    /**
     * 设置单位名称
     *
     * @param organization 单位名称
     */
    public void setOrganization(String organization) {
        this.organization = organization;
    }

    /**
     * 获取具体事由
     *
     * @return reason - 具体事由
     */
    public String getReason() {
        return reason;
    }

    /**
     * 设置具体事由
     *
     * @param reason 具体事由
     */
    public void setReason(String reason) {
        this.reason = reason;
    }

    /**
     * 获取开始时间
     *
     * @return begin_time - 开始时间
     */
    public String getBeginTime() {
        return beginTime;
    }

    /**
     * 设置开始时间
     *
     * @param beginTime 开始时间
     */
    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    /**
     * 获取结束时间
     *
     * @return end_time - 结束时间
     */
    public String getEndTime() {
        return endTime;
    }

    /**
     * 设置结束时间
     *
     * @param endTime 结束时间
     */
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    /**
     * 获取目的地
     *
     * @return destination - 目的地
     */
    public String getDestination() {
        return destination;
    }

    /**
     * 设置目的地
     *
     * @param destination 目的地
     */
    public void setDestination(String destination) {
        this.destination = destination;
    }

    /**
     * 获取批准单位
     *
     * @return approve_organization - 批准单位
     */
    public String getApproveOrganization() {
        return approveOrganization;
    }

    /**
     * 设置批准单位
     *
     * @param approveOrganization 批准单位
     */
    public void setApproveOrganization(String approveOrganization) {
        this.approveOrganization = approveOrganization;
    }

    /**
     * 获取资金来源
     *
     * @return fund_source - 资金来源
     */
    public String getFundSource() {
        return fundSource;
    }

    /**
     * 设置资金来源
     *
     * @param fundSource 资金来源
     */
    public void setFundSource(String fundSource) {
        this.fundSource = fundSource;
    }

    /**
     * 获取出国事由
     *
     * @return goabroad_reason - 出国事由
     */
    public String getGoabroadReason() {
        return goabroadReason;
    }

    /**
     * 设置出国事由
     *
     * @param goabroadReason 出国事由
     */
    public void setGoabroadReason(String goabroadReason) {
        this.goabroadReason = goabroadReason;
    }

    /**
     * 获取审核状态：1待单位负责人审核
2单位负责人审核通过
3单位负责人驳回
4待纪委审核
5纪委审核通过
6纪委审核驳回
     *
     * @return approve_status - 审核状态：1待单位负责人审核
2单位负责人审核通过
3单位负责人驳回
4待纪委审核
5纪委审核通过
6纪委审核驳回
     */
    public Integer getApproveStatus() {
        return approveStatus;
    }

    /**
     * 设置审核状态：1待单位负责人审核
2单位负责人审核通过
3单位负责人驳回
4待纪委审核
5纪委审核通过
6纪委审核驳回
     *
     * @param approveStatus 审核状态：1待单位负责人审核
2单位负责人审核通过
3单位负责人驳回
4待纪委审核
5纪委审核通过
6纪委审核驳回
     */
    public void setApproveStatus(Integer approveStatus) {
        this.approveStatus = approveStatus;
    }

    /**
     * 获取档案类型：出国（境）情况登记表，固定值7无需填写
     *
     * @return archive_type - 档案类型：出国（境）情况登记表，固定值7无需填写
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：出国（境）情况登记表，固定值7无需填写
     *
     * @param archiveType 档案类型：出国（境）情况登记表，固定值7无需填写
     */
    public void setArchiveType(Integer archiveType) {
        this.archiveType = archiveType;
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
     * 获取出国情况报告
     *
     * @return report - 出国情况报告
     */
    public String getReport() {
        return report;
    }

    /**
     * 设置出国情况报告
     *
     * @param report 出国情况报告
     */
    public void setReport(String report) {
        this.report = report;
    }
}