package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "arc_family_marriage")
public class ArcFamilyMarriage {
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
     * 有无变化:有变化、无变化
     */
    @Column(name = "change_status")
    private String changeStatus;

    /**
     * 子女姓名
     */
    @Column(name = "family_name")
    private String familyName;

    /**
     * 子女称谓
     */
    @Column(name = "family_appellation")
    private String familyAppellation;

    /**
     * 配偶姓名
     */
    @Column(name = "partner_name")
    private String partnerName;

    /**
     * 配偶所在地区
     */
    @Column(name = "partner_area")
    private String partnerArea;

    /**
     * 配偶职务
     */
    @Column(name = "partner_job")
    private String partnerJob;

    /**
     * 配偶单位
     */
    @Column(name = "partner_org")
    private String partnerOrg;

    /**
     * 登记时间
     */
    private String time;

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
     * 档案类型：子女与港澳以及台湾居民通婚的情况，固定值20无需填写
     */
    @Column(name = "archive_type")
    private Integer archiveType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

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
     * 获取有无变化:有变化、无变化
     *
     * @return change_status - 有无变化:有变化、无变化
     */
    public String getChangeStatus() {
        return changeStatus;
    }

    /**
     * 设置有无变化:有变化、无变化
     *
     * @param changeStatus 有无变化:有变化、无变化
     */
    public void setChangeStatus(String changeStatus) {
        this.changeStatus = changeStatus;
    }

    /**
     * 获取子女姓名
     *
     * @return family_name - 子女姓名
     */
    public String getFamilyName() {
        return familyName;
    }

    /**
     * 设置子女姓名
     *
     * @param familyName 子女姓名
     */
    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    /**
     * 获取子女称谓
     *
     * @return family_appellation - 子女称谓
     */
    public String getFamilyAppellation() {
        return familyAppellation;
    }

    /**
     * 设置子女称谓
     *
     * @param familyAppellation 子女称谓
     */
    public void setFamilyAppellation(String familyAppellation) {
        this.familyAppellation = familyAppellation;
    }

    /**
     * 获取配偶姓名
     *
     * @return partner_name - 配偶姓名
     */
    public String getPartnerName() {
        return partnerName;
    }

    /**
     * 设置配偶姓名
     *
     * @param partnerName 配偶姓名
     */
    public void setPartnerName(String partnerName) {
        this.partnerName = partnerName;
    }

    /**
     * 获取配偶所在地区
     *
     * @return partner_area - 配偶所在地区
     */
    public String getPartnerArea() {
        return partnerArea;
    }

    /**
     * 设置配偶所在地区
     *
     * @param partnerArea 配偶所在地区
     */
    public void setPartnerArea(String partnerArea) {
        this.partnerArea = partnerArea;
    }

    /**
     * 获取配偶职务
     *
     * @return partner_job - 配偶职务
     */
    public String getPartnerJob() {
        return partnerJob;
    }

    /**
     * 设置配偶职务
     *
     * @param partnerJob 配偶职务
     */
    public void setPartnerJob(String partnerJob) {
        this.partnerJob = partnerJob;
    }

    /**
     * 获取配偶单位
     *
     * @return partner_org - 配偶单位
     */
    public String getPartnerOrg() {
        return partnerOrg;
    }

    /**
     * 设置配偶单位
     *
     * @param partnerOrg 配偶单位
     */
    public void setPartnerOrg(String partnerOrg) {
        this.partnerOrg = partnerOrg;
    }

    /**
     * 获取登记时间
     *
     * @return time - 登记时间
     */
    public String getTime() {
        return time;
    }

    /**
     * 设置登记时间
     *
     * @param time 登记时间
     */
    public void setTime(String time) {
        this.time = time;
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
     * 获取档案类型：子女与港澳以及台湾居民通婚的情况，固定值20无需填写
     *
     * @return archive_type - 档案类型：子女与港澳以及台湾居民通婚的情况，固定值20无需填写
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：子女与港澳以及台湾居民通婚的情况，固定值20无需填写
     *
     * @param archiveType 档案类型：子女与港澳以及台湾居民通婚的情况，固定值20无需填写
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
}