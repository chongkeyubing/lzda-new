package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "arc_family_abroad_savings")
public class ArcFamilyAbroadSavings {
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
     * 有无此类情况：有此类情况，无此类情况
     */
    @Column(name = "change_status")
    private String changeStatus;

    /**
     * 存款人姓名
     */
    @Column(name = "family_name")
    private String familyName;

    /**
     * 存款人称谓
     */
    @Column(name = "family_appellation")
    private String familyAppellation;

    /**
     * 存款地址
     */
    private String address;

    /**
     * 开户银行
     */
    @Column(name = "bank_name")
    private String bankName;

    /**
     * 币种
     */
    private String currency;

    /**
     * 金额
     */
    private Integer amount;

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
     * 档案类型：在国（境）外的存款情况，固定值17无需填写
     */
    @Column(name = "archive_type")
    private Integer archiveType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

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

    public String getChangeStatus() {
        return changeStatus;
    }

    public void setChangeStatus(String changeStatus) {
        this.changeStatus = changeStatus;
    }

    /**
     * 获取存款人姓名
     *
     * @return family_name - 存款人姓名
     */
    public String getFamilyName() {
        return familyName;
    }

    /**
     * 设置存款人姓名
     *
     * @param familyName 存款人姓名
     */
    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    /**
     * 获取存款人称谓
     *
     * @return family_appellation - 存款人称谓
     */
    public String getFamilyAppellation() {
        return familyAppellation;
    }

    /**
     * 设置存款人称谓
     *
     * @param familyAppellation 存款人称谓
     */
    public void setFamilyAppellation(String familyAppellation) {
        this.familyAppellation = familyAppellation;
    }

    /**
     * 获取存款地址
     *
     * @return address - 存款地址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置存款地址
     *
     * @param address 存款地址
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取开户银行
     *
     * @return bank_name - 开户银行
     */
    public String getBankName() {
        return bankName;
    }

    /**
     * 设置开户银行
     *
     * @param bankName 开户银行
     */
    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    /**
     * 获取币种
     *
     * @return currency - 币种
     */
    public String getCurrency() {
        return currency;
    }

    /**
     * 设置币种
     *
     * @param currency 币种
     */
    public void setCurrency(String currency) {
        this.currency = currency;
    }

    /**
     * 获取金额
     *
     * @return amount - 金额
     */
    public Integer getAmount() {
        return amount;
    }

    /**
     * 设置金额
     *
     * @param amount 金额
     */
    public void setAmount(Integer amount) {
        this.amount = amount;
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
     * 获取档案类型：在国（境）外的存款情况，固定值17无需填写
     *
     * @return archive_type - 档案类型：在国（境）外的存款情况，固定值17无需填写
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：在国（境）外的存款情况，固定值17无需填写
     *
     * @param archiveType 档案类型：在国（境）外的存款情况，固定值17无需填写
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