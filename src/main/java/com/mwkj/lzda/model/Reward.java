package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

public class Reward {
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
     * 被表彰人姓名
     */
    @Column(name = "user_name")
    private String userName;

    @Transient
    private String policeCode;

    public String getPoliceCode() {
        return policeCode;
    }

    public void setPoliceCode(String policeCode) {
        this.policeCode = policeCode;
    }

    /**
     * 职务
     */
    @Column(name = "job_position")
    private String jobPosition;

    /**
     * 单位名称
     */
    private String organization;

    @Transient
    private String organizationName;

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    /**
     * 表彰类型
     */
    @Column(name = "reward_type")
    private String rewardType;

    /**
     * 表彰时间
     */
    @Column(name = "reward_time")
    private String rewardTime;

    /**
     * 表彰单位
     */
    @Column(name = "reward_organization")
    private String rewardOrganization;

    /**
     * 附件uuid，关联附件表sourceId
     */
    @Column(name = "attachment_id")
    private String attachmentId;

    /**
     * 操作者姓名
     */
    @Column(name = "operator_name")
    private String operatorName;

    /**
     * 操作者id
     */
    @Column(name = "operator_id")
    private Integer operatorId;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 表彰内容
     */
    private String content;

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
     * 获取被表彰人姓名
     *
     * @return user_name - 被表彰人姓名
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置被表彰人姓名
     *
     * @param userName 被表彰人姓名
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
     * 获取表彰类型
     *
     * @return reward_type - 表彰类型
     */
    public String getRewardType() {
        return rewardType;
    }

    /**
     * 设置表彰类型
     *
     * @param rewardType 表彰类型
     */
    public void setRewardType(String rewardType) {
        this.rewardType = rewardType;
    }

    /**
     * 获取表彰时间
     *
     * @return reward_time - 表彰时间
     */
    public String getRewardTime() {
        return rewardTime;
    }

    /**
     * 设置表彰时间
     *
     * @param rewardTime 表彰时间
     */
    public void setRewardTime(String rewardTime) {
        this.rewardTime = rewardTime;
    }

    /**
     * 获取表彰单位
     *
     * @return reward_organization - 表彰单位
     */
    public String getRewardOrganization() {
        return rewardOrganization;
    }

    /**
     * 设置表彰单位
     *
     * @param rewardOrganization 表彰单位
     */
    public void setRewardOrganization(String rewardOrganization) {
        this.rewardOrganization = rewardOrganization;
    }

    public String getAttachmentId() {
        return attachmentId;
    }

    public void setAttachmentId(String attachmentId) {
        this.attachmentId = attachmentId;
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }

    public Integer getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(Integer operatorId) {
        this.operatorId = operatorId;
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
     * 获取表彰内容
     *
     * @return content - 表彰内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置表彰内容
     *
     * @param content 表彰内容
     */
    public void setContent(String content) {
        this.content = content;
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