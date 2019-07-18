package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "pun_violation")
public class PunViolation {
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
     * 出生年月
     */
    private String birthday;

    /**
     * 性别
     */
    private String gender;

    /**
     * 违纪级别：政务处分 党纪处分 问责 违纪
     */
    @Column(name = "violation_level")
    private String violationLevel;

    /**
     * 违纪类型：见需求确认文档
     */
    @Column(name = "violation_type")
    private String violationType;

    /**
     * 是否移交司法机关：是 否
     */
    private String transfer;

    /**
     * 查处单位
     */
    @Column(name = "violation_org")
    private String violationOrg;

    /**
     * 处理时间
     */
    @Column(name = "handle_time")
    private String handleTime;

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
     * 违惩类型：1一般干部违纪情况登记表
     */
    @Column(name = "punish_type")
    private Integer punishType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 处理情况
     */
    @Column(name = "handle_info")
    private String handleInfo;

    /**
     * 主要错误事实
     */
    @Column(name = "mistake_fact")
    private String mistakeFact;

    /**
     * 处理依据
     */
    @Column(name = "handle_basis")
    private String handleBasis;

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
     * 获取出生年月
     *
     * @return birthday - 出生年月
     */
    public String getBirthday() {
        return birthday;
    }

    /**
     * 设置出生年月
     *
     * @param birthday 出生年月
     */
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    /**
     * 获取性别
     *
     * @return gender - 性别
     */
    public String getGender() {
        return gender;
    }

    /**
     * 设置性别
     *
     * @param gender 性别
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * 获取违纪级别：政务处分 党纪处分 问责 违纪
     *
     * @return violation_level - 违纪级别：政务处分 党纪处分 问责 违纪
     */
    public String getViolationLevel() {
        return violationLevel;
    }

    /**
     * 设置违纪级别：政务处分 党纪处分 问责 违纪
     *
     * @param violationLevel 违纪级别：政务处分 党纪处分 问责 违纪
     */
    public void setViolationLevel(String violationLevel) {
        this.violationLevel = violationLevel;
    }

    /**
     * 获取违纪类型：见需求确认文档
     *
     * @return violation_type - 违纪类型：见需求确认文档
     */
    public String getViolationType() {
        return violationType;
    }

    /**
     * 设置违纪类型：见需求确认文档
     *
     * @param violationType 违纪类型：见需求确认文档
     */
    public void setViolationType(String violationType) {
        this.violationType = violationType;
    }

    /**
     * 获取是否移交司法机关：是 否
     *
     * @return transfer - 是否移交司法机关：是 否
     */
    public String getTransfer() {
        return transfer;
    }

    /**
     * 设置是否移交司法机关：是 否
     *
     * @param transfer 是否移交司法机关：是 否
     */
    public void setTransfer(String transfer) {
        this.transfer = transfer;
    }

    /**
     * 获取查处单位
     *
     * @return violation_org - 查处单位
     */
    public String getViolationOrg() {
        return violationOrg;
    }

    /**
     * 设置查处单位
     *
     * @param violationOrg 查处单位
     */
    public void setViolationOrg(String violationOrg) {
        this.violationOrg = violationOrg;
    }

    /**
     * 获取处理时间
     *
     * @return handle_time - 处理时间
     */
    public String getHandleTime() {
        return handleTime;
    }

    /**
     * 设置处理时间
     *
     * @param handleTime 处理时间
     */
    public void setHandleTime(String handleTime) {
        this.handleTime = handleTime;
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
     * 获取违惩类型：1一般干部违纪情况登记表
     *
     * @return punish_type - 违惩类型：1一般干部违纪情况登记表
     */
    public Integer getPunishType() {
        return punishType;
    }

    /**
     * 设置违惩类型：1一般干部违纪情况登记表
     *
     * @param punishType 违惩类型：1一般干部违纪情况登记表
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
     * 获取主要错误事实
     *
     * @return mistake_fact - 主要错误事实
     */
    public String getMistakeFact() {
        return mistakeFact;
    }

    /**
     * 设置主要错误事实
     *
     * @param mistakeFact 主要错误事实
     */
    public void setMistakeFact(String mistakeFact) {
        this.mistakeFact = mistakeFact;
    }

    /**
     * 获取处理依据
     *
     * @return handle_basis - 处理依据
     */
    public String getHandleBasis() {
        return handleBasis;
    }

    /**
     * 设置处理依据
     *
     * @param handleBasis 处理依据
     */
    public void setHandleBasis(String handleBasis) {
        this.handleBasis = handleBasis;
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