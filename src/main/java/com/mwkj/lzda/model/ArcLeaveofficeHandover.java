package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "arc_leaveoffice_handover")
public class ArcLeaveofficeHandover {
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
     * 任职时间
     */
    @Column(name = "during_time")
    private String duringTime;

    /**
     * 调往单位
     */
    @Column(name = "to_organization")
    private String toOrganization;

    /**
     * 调往职务
     */
    @Column(name = "to_job_position")
    private String toJobPosition;

    /**
     * 公文资料是否移交
     */
    @Column(name = "document_handover")
    private String documentHandover;

    /**
     * 办公用具是否移交
     */
    @Column(name = "office_handover")
    private String officeHandover;

    /**
     * 生活用具是否移交
     */
    @Column(name = "life_handover")
    private String lifeHandover;

    /**
     * 有无单位欠款
     */
    private String debt;

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
     * 档案类型：离职交接情况登记表，固定值9无需填写
     */
    @Column(name = "archive_type")
    private Integer archiveType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 其他公物按规定移交情况
     */
    @Column(name = "other_handover")
    private String otherHandover;

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
     * 获取任职时间
     *
     * @return during_time - 任职时间
     */
    public String getDuringTime() {
        return duringTime;
    }

    /**
     * 设置任职时间
     *
     * @param duringTime 任职时间
     */
    public void setDuringTime(String duringTime) {
        this.duringTime = duringTime;
    }

    /**
     * 获取调往单位
     *
     * @return to_organization - 调往单位
     */
    public String getToOrganization() {
        return toOrganization;
    }

    /**
     * 设置调往单位
     *
     * @param toOrganization 调往单位
     */
    public void setToOrganization(String toOrganization) {
        this.toOrganization = toOrganization;
    }

    /**
     * 获取调往职务
     *
     * @return to_job_position - 调往职务
     */
    public String getToJobPosition() {
        return toJobPosition;
    }

    /**
     * 设置调往职务
     *
     * @param toJobPosition 调往职务
     */
    public void setToJobPosition(String toJobPosition) {
        this.toJobPosition = toJobPosition;
    }

    /**
     * 获取公文资料是否移交
     *
     * @return document_handover - 公文资料是否移交
     */
    public String getDocumentHandover() {
        return documentHandover;
    }

    /**
     * 设置公文资料是否移交
     *
     * @param documentHandover 公文资料是否移交
     */
    public void setDocumentHandover(String documentHandover) {
        this.documentHandover = documentHandover;
    }

    /**
     * 获取办公用具是否移交
     *
     * @return office_handover - 办公用具是否移交
     */
    public String getOfficeHandover() {
        return officeHandover;
    }

    /**
     * 设置办公用具是否移交
     *
     * @param officeHandover 办公用具是否移交
     */
    public void setOfficeHandover(String officeHandover) {
        this.officeHandover = officeHandover;
    }

    /**
     * 获取生活用具是否移交
     *
     * @return life_handover - 生活用具是否移交
     */
    public String getLifeHandover() {
        return lifeHandover;
    }

    /**
     * 设置生活用具是否移交
     *
     * @param lifeHandover 生活用具是否移交
     */
    public void setLifeHandover(String lifeHandover) {
        this.lifeHandover = lifeHandover;
    }

    /**
     * 获取有无单位欠款
     *
     * @return debt - 有无单位欠款
     */
    public String getDebt() {
        return debt;
    }

    /**
     * 设置有无单位欠款
     *
     * @param debt 有无单位欠款
     */
    public void setDebt(String debt) {
        this.debt = debt;
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
     * 获取档案类型：离职交接情况登记表，固定值9无需填写
     *
     * @return archive_type - 档案类型：离职交接情况登记表，固定值9无需填写
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：离职交接情况登记表，固定值9无需填写
     *
     * @param archiveType 档案类型：离职交接情况登记表，固定值9无需填写
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
     * 获取其他公物按规定移交情况
     *
     * @return other_handover - 其他公物按规定移交情况
     */
    public String getOtherHandover() {
        return otherHandover;
    }

    /**
     * 设置其他公物按规定移交情况
     *
     * @param otherHandover 其他公物按规定移交情况
     */
    public void setOtherHandover(String otherHandover) {
        this.otherHandover = otherHandover;
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