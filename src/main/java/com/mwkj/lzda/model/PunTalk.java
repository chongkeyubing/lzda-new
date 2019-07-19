package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "pun_talk")
public class PunTalk {
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
     * 谈话时间
     */
    private String time;

    /**
     * 谈话类型
     */
    private String type;

    /**
     * 地点
     */
    private String address;

    /**
     * 谈话人id
     */
    @Column(name = "talk_person_id")
    private Integer talkPersonId;

    /**
     * 谈话人姓名
     */
    @Column(name = "talk_person_name")
    private String talkPersonName;

    /**
     * 谈话人单位
     */
    @Column(name = "talk_person_org")
    private String talkPersonOrg;

    /**
     * 谈话人职务
     */
    @Column(name = "talk_person_job")
    private String talkPersonJob;

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
     * 违惩类型：4一般干部廉政谈话情况登记表
     */
    @Column(name = "punish_type")
    private Integer punishType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 谈话内容
     */
    private String content;

    /**
     * 被谈话人意见
     */
    @Column(name = "talked_person_advice")
    private String talkedPersonAdvice;

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
     * 获取谈话时间
     *
     * @return time - 谈话时间
     */
    public String getTime() {
        return time;
    }

    /**
     * 设置谈话时间
     *
     * @param time 谈话时间
     */
    public void setTime(String time) {
        this.time = time;
    }

    /**
     * 获取谈话类型
     *
     * @return type - 谈话类型
     */
    public String getType() {
        return type;
    }

    /**
     * 设置谈话类型
     *
     * @param type 谈话类型
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取地点
     *
     * @return address - 地点
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置地点
     *
     * @param address 地点
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取谈话人id
     *
     * @return talk_person_id - 谈话人id
     */
    public Integer getTalkPersonId() {
        return talkPersonId;
    }

    /**
     * 设置谈话人id
     *
     * @param talkPersonId 谈话人id
     */
    public void setTalkPersonId(Integer talkPersonId) {
        this.talkPersonId = talkPersonId;
    }

    /**
     * 获取谈话人姓名
     *
     * @return talk_person_name - 谈话人姓名
     */
    public String getTalkPersonName() {
        return talkPersonName;
    }

    /**
     * 设置谈话人姓名
     *
     * @param talkPersonName 谈话人姓名
     */
    public void setTalkPersonName(String talkPersonName) {
        this.talkPersonName = talkPersonName;
    }

    /**
     * 获取谈话人单位
     *
     * @return talk_person_org - 谈话人单位
     */
    public String getTalkPersonOrg() {
        return talkPersonOrg;
    }

    /**
     * 设置谈话人单位
     *
     * @param talkPersonOrg 谈话人单位
     */
    public void setTalkPersonOrg(String talkPersonOrg) {
        this.talkPersonOrg = talkPersonOrg;
    }

    /**
     * 获取谈话人职务
     *
     * @return talk_person_job - 谈话人职务
     */
    public String getTalkPersonJob() {
        return talkPersonJob;
    }

    /**
     * 设置谈话人职务
     *
     * @param talkPersonJob 谈话人职务
     */
    public void setTalkPersonJob(String talkPersonJob) {
        this.talkPersonJob = talkPersonJob;
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
     * 获取违惩类型：4一般干部廉政谈话情况登记表
     *
     * @return punish_type - 违惩类型：4一般干部廉政谈话情况登记表
     */
    public Integer getPunishType() {
        return punishType;
    }

    /**
     * 设置违惩类型：4一般干部廉政谈话情况登记表
     *
     * @param punishType 违惩类型：4一般干部廉政谈话情况登记表
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
     * 获取谈话内容
     *
     * @return content - 谈话内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置谈话内容
     *
     * @param content 谈话内容
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取被谈话人意见
     *
     * @return talked_person_advice - 被谈话人意见
     */
    public String getTalkedPersonAdvice() {
        return talkedPersonAdvice;
    }

    /**
     * 设置被谈话人意见
     *
     * @param talkedPersonAdvice 被谈话人意见
     */
    public void setTalkedPersonAdvice(String talkedPersonAdvice) {
        this.talkedPersonAdvice = talkedPersonAdvice;
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