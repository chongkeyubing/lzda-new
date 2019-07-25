package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "arc_affect_business")
public class ArcAffectBusiness {
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
     * 时间
     */
    private String time;

    /**
     * 与民警关系:家人 亲戚 朋友 同事
     */
    private String relationship;

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
     * 档案类型：可能影响公正执行职务报备表，固定值8无需填写
     */
    @Column(name = "archive_type")
    private Integer archiveType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 可能影响公正执行职务内容
     */
    private String content;

    /**
     * 处理情况
     */
    @Column(name = "handle_info")
    private String handleInfo;

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
     * 获取时间
     *
     * @return time - 时间
     */
    public String getTime() {
        return time;
    }

    /**
     * 设置时间
     *
     * @param time 时间
     */
    public void setTime(String time) {
        this.time = time;
    }

    /**
     * 获取与民警关系:家人 亲戚 朋友 同事
     *
     * @return relationship - 与民警关系:家人 亲戚 朋友 同事
     */
    public String getRelationship() {
        return relationship;
    }

    /**
     * 设置与民警关系:家人 亲戚 朋友 同事
     *
     * @param relationship 与民警关系:家人 亲戚 朋友 同事
     */
    public void setRelationship(String relationship) {
        this.relationship = relationship;
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
     * 获取档案类型：可能影响公正执行职务报备表，固定值8无需填写
     *
     * @return archive_type - 档案类型：可能影响公正执行职务报备表，固定值8无需填写
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：可能影响公正执行职务报备表，固定值8无需填写
     *
     * @param archiveType 档案类型：可能影响公正执行职务报备表，固定值8无需填写
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
     * 获取可能影响公正执行职务内容
     *
     * @return content - 可能影响公正执行职务内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置可能影响公正执行职务内容
     *
     * @param content 可能影响公正执行职务内容
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取处理情况
     *
     * @return handle_info - 处理情况
     */
    public String getHandleInfo() {
        return handleInfo;
    }

    /**
     * 设置处理情况
     *
     * @param handleInfo 处理情况
     */
    public void setHandleInfo(String handleInfo) {
        this.handleInfo = handleInfo;
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


    /**
     * 影响人姓名
     */
    @Column(name = "affect_name")
    private String affectName;

    public String getAffectName() {
        return affectName;
    }

    public void setAffectName(String affectName) {
        this.affectName = affectName;
    }

    /**
     * 影响人单位
     */
    @Column(name = "affect_organization")
    private String affectOrganization;

    public String getAffectOrganization() {
        return affectOrganization;
    }

    public void setAffectOrganization(String affectOrganization) {
        this.affectOrganization = affectOrganization;
    }
}