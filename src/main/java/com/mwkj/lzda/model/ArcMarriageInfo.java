package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "arc_marriage_info")
public class ArcMarriageInfo {
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
     * 单位名称
     */
    private String organization;

    /**
     * 档案填写人姓名
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 婚姻现状：未婚 离婚 已婚 丧偶
     */
    @Column(name = "marriage_status")
    private String marriageStatus;

    /**
     * 变化情况：有变化 无变化
     */
    @Column(name = "change_situation")
    private String changeSituation;

    /**
     * 有变化：结婚 离婚 丧偶 再婚
     */
    @Column(name = "change_status")
    private String changeStatus;

    /**
     * 变化时间
     */
    @Column(name = "change_date")
    private String changeDate;

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
     * 档案类型：本人婚姻情况，固定值4无需填写
     */
    @Column(name = "archive_type")
    private Integer archiveType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 变化原因
     */
    @Column(name = "change_reason")
    private String changeReason;

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
     * 获取婚姻现状：未婚 离婚 已婚 丧偶
     *
     * @return marriage_status - 婚姻现状：未婚 离婚 已婚 丧偶
     */
    public String getMarriageStatus() {
        return marriageStatus;
    }

    /**
     * 设置婚姻现状：未婚 离婚 已婚 丧偶
     *
     * @param marriageStatus 婚姻现状：未婚 离婚 已婚 丧偶
     */
    public void setMarriageStatus(String marriageStatus) {
        this.marriageStatus = marriageStatus;
    }


    public String getChangeSituation() {
        return changeSituation;
    }

    public void setChangeSituation(String changeSituation) {
        this.changeSituation = changeSituation;
    }

    /**
     * 获取有变化：结婚 离婚 丧偶 再婚
     *
     * @return change_status - 有变化：结婚 离婚 丧偶 再婚
     */
    public String getChangeStatus() {
        return changeStatus;
    }

    /**
     * 设置有变化：结婚 离婚 丧偶 再婚
     *
     * @param changeStatus 有变化：结婚 离婚 丧偶 再婚
     */
    public void setChangeStatus(String changeStatus) {
        this.changeStatus = changeStatus;
    }

    /**
     * 获取变化时间
     *
     * @return change_date - 变化时间
     */
    public String getChangeDate() {
        return changeDate;
    }

    /**
     * 设置变化时间
     *
     * @param changeDate 变化时间
     */
    public void setChangeDate(String changeDate) {
        this.changeDate = changeDate;
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
     * 获取档案类型：本人婚姻情况，固定值4无需填写
     *
     * @return archive_type - 档案类型：本人婚姻情况，固定值4无需填写
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：本人婚姻情况，固定值4无需填写
     *
     * @param archiveType 档案类型：本人婚姻情况，固定值4无需填写
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
     * 获取变化原因
     *
     * @return change_reason - 变化原因
     */
    public String getChangeReason() {
        return changeReason;
    }

    /**
     * 设置变化原因
     *
     * @param changeReason 变化原因
     */
    public void setChangeReason(String changeReason) {
        this.changeReason = changeReason;
    }
}