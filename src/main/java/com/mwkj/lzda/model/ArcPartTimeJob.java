package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "arc_part_time_job")
public class ArcPartTimeJob {
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
     * 兼职单位
     */
    @Column(name = "parttime_org")
    private String parttimeOrg;

    /**
     * 兼职单位性质：国家机关、全民企业单位、全民事业单位、社会团体、集体企业、民办企业、外资企业
     */
    @Column(name = "parttime_org_type")
    private String parttimeOrgType;

    /**
     * 兼任职务
     */
    @Column(name = "parttime_job")
    private String parttimeJob;

    /**
     * 兼职时间
     */
    @Column(name = "parttime_during")
    private String parttimeDuring;

    /**
     * 兼职取酬情况(元/年)
     */
    @Column(name = "parttime_salary")
    private Integer parttimeSalary;

    /**
     * 批准机关
     */
    @Column(name = "approve_org")
    private String approveOrg;

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
     * 档案类型：在企业、中介组织和社会团体兼职，固定值24无需填写
     */
    @Column(name = "archive_type")
    private Integer archiveType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 情况说明以及本人意见
     */
    private String advice;

    /**
     * 纠正处理情况
     */
    private String handle;

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
     * 获取兼职单位
     *
     * @return parttime_org - 兼职单位
     */
    public String getParttimeOrg() {
        return parttimeOrg;
    }

    /**
     * 设置兼职单位
     *
     * @param parttimeOrg 兼职单位
     */
    public void setParttimeOrg(String parttimeOrg) {
        this.parttimeOrg = parttimeOrg;
    }

    /**
     * 获取兼职单位性质：国家机关、全民企业单位、全民事业单位、社会团体、集体企业、民办企业、外资企业
     *
     * @return parttime_org_type - 兼职单位性质：国家机关、全民企业单位、全民事业单位、社会团体、集体企业、民办企业、外资企业
     */
    public String getParttimeOrgType() {
        return parttimeOrgType;
    }

    /**
     * 设置兼职单位性质：国家机关、全民企业单位、全民事业单位、社会团体、集体企业、民办企业、外资企业
     *
     * @param parttimeOrgType 兼职单位性质：国家机关、全民企业单位、全民事业单位、社会团体、集体企业、民办企业、外资企业
     */
    public void setParttimeOrgType(String parttimeOrgType) {
        this.parttimeOrgType = parttimeOrgType;
    }

    /**
     * 获取兼任职务
     *
     * @return parttime_job - 兼任职务
     */
    public String getParttimeJob() {
        return parttimeJob;
    }

    /**
     * 设置兼任职务
     *
     * @param parttimeJob 兼任职务
     */
    public void setParttimeJob(String parttimeJob) {
        this.parttimeJob = parttimeJob;
    }

    /**
     * 获取兼职时间
     *
     * @return parttime_during - 兼职时间
     */
    public String getParttimeDuring() {
        return parttimeDuring;
    }

    /**
     * 设置兼职时间
     *
     * @param parttimeDuring 兼职时间
     */
    public void setParttimeDuring(String parttimeDuring) {
        this.parttimeDuring = parttimeDuring;
    }

    /**
     * 获取兼职取酬情况(元/年)
     *
     * @return parttime_salary - 兼职取酬情况(元/年)
     */
    public Integer getParttimeSalary() {
        return parttimeSalary;
    }

    /**
     * 设置兼职取酬情况(元/年)
     *
     * @param parttimeSalary 兼职取酬情况(元/年)
     */
    public void setParttimeSalary(Integer parttimeSalary) {
        this.parttimeSalary = parttimeSalary;
    }

    /**
     * 获取批准机关
     *
     * @return approve_org - 批准机关
     */
    public String getApproveOrg() {
        return approveOrg;
    }

    /**
     * 设置批准机关
     *
     * @param approveOrg 批准机关
     */
    public void setApproveOrg(String approveOrg) {
        this.approveOrg = approveOrg;
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
     * 获取档案类型：在企业、中介组织和社会团体兼职，固定值24无需填写
     *
     * @return archive_type - 档案类型：在企业、中介组织和社会团体兼职，固定值24无需填写
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：在企业、中介组织和社会团体兼职，固定值24无需填写
     *
     * @param archiveType 档案类型：在企业、中介组织和社会团体兼职，固定值24无需填写
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
     * 获取情况说明以及本人意见
     *
     * @return advice - 情况说明以及本人意见
     */
    public String getAdvice() {
        return advice;
    }

    /**
     * 设置情况说明以及本人意见
     *
     * @param advice 情况说明以及本人意见
     */
    public void setAdvice(String advice) {
        this.advice = advice;
    }

    /**
     * 获取纠正处理情况
     *
     * @return handle - 纠正处理情况
     */
    public String getHandle() {
        return handle;
    }

    /**
     * 设置纠正处理情况
     *
     * @param handle 纠正处理情况
     */
    public void setHandle(String handle) {
        this.handle = handle;
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