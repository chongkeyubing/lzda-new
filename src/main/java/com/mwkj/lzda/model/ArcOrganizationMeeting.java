package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "`arc_organization_meeting`")
public class ArcOrganizationMeeting {
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
     * 会议议题
     */
    @Column(name = "meeting_subject")
    private String meetingSubject;

    /**
     * 参与时间
     */
    @Column(name = "meeting_time")
    private String meetingTime;

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
     * 档案类型：参加单位组织生活会情况，固定值5无需填写
     */
    @Column(name = "archive_type")
    private Integer archiveType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 查找问题
     */
    private String problem;

    /**
     * 整改措施
     */
    private String rectify;

    /**
     * 党委意见
     */
    @Column(name = "party_opinion")
    private String partyOpinion;

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
     * 获取会议议题
     *
     * @return meeting_subject - 会议议题
     */
    public String getMeetingSubject() {
        return meetingSubject;
    }

    /**
     * 设置会议议题
     *
     * @param meetingSubject 会议议题
     */
    public void setMeetingSubject(String meetingSubject) {
        this.meetingSubject = meetingSubject;
    }

    /**
     * 获取参与时间
     *
     * @return meeting_time - 参与时间
     */
    public String getMeetingTime() {
        return meetingTime;
    }

    /**
     * 设置参与时间
     *
     * @param meetingTime 参与时间
     */
    public void setMeetingTime(String meetingTime) {
        this.meetingTime = meetingTime;
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
     * 获取档案类型：参加单位组织生活会情况，固定值5无需填写
     *
     * @return archive_type - 档案类型：参加单位组织生活会情况，固定值5无需填写
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：参加单位组织生活会情况，固定值5无需填写
     *
     * @param archiveType 档案类型：参加单位组织生活会情况，固定值5无需填写
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
     * 获取查找问题
     *
     * @return problem - 查找问题
     */
    public String getProblem() {
        return problem;
    }

    /**
     * 设置查找问题
     *
     * @param problem 查找问题
     */
    public void setProblem(String problem) {
        this.problem = problem;
    }

    /**
     * 获取整改措施
     *
     * @return rectify - 整改措施
     */
    public String getRectify() {
        return rectify;
    }

    /**
     * 设置整改措施
     *
     * @param rectify 整改措施
     */
    public void setRectify(String rectify) {
        this.rectify = rectify;
    }

    /**
     * 获取党委意见
     *
     * @return party_opinion - 党委意见
     */
    public String getPartyOpinion() {
        return partyOpinion;
    }

    /**
     * 设置党委意见
     *
     * @param partyOpinion 党委意见
     */
    public void setPartyOpinion(String partyOpinion) {
        this.partyOpinion = partyOpinion;
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