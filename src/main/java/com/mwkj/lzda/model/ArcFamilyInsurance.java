package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "arc_family_insurance")
public class ArcFamilyInsurance {
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
     * 持有人姓名
     */
    @Column(name = "family_name")
    private String familyName;

    /**
     * 持有人称谓
     */
    @Column(name = "family_appellation")
    private String familyAppellation;

    /**
     * 保险产品名称
     */
    @Column(name = "insurance_name")
    private String insuranceName;

    /**
     * 保险单号
     */
    @Column(name = "insurance_number")
    private Integer insuranceNumber;

    /**
     * 保险公司全称
     */
    @Column(name = "company_name")
    private String companyName;

    /**
     * 累积缴纳保费、投资资金
     */
    private Integer price;

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
     * 档案类型：持有投资型保险的情况，固定值16无需填写
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
     * 获取有无此类情况：有此类情况，无此类情况
     *
     * @return change_status - 有无此类情况：有此类情况，无此类情况
     */
    public String getChangeStatus() {
        return changeStatus;
    }

    /**
     * 设置有无此类情况：有此类情况，无此类情况
     *
     * @param changeStatus 有无此类情况：有此类情况，无此类情况
     */
    public void setChangeStatus(String changeStatus) {
        this.changeStatus = changeStatus;
    }

    /**
     * 获取持有人姓名
     *
     * @return family_name - 持有人姓名
     */
    public String getFamilyName() {
        return familyName;
    }

    /**
     * 设置持有人姓名
     *
     * @param familyName 持有人姓名
     */
    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    /**
     * 获取持有人称谓
     *
     * @return family_appellation - 持有人称谓
     */
    public String getFamilyAppellation() {
        return familyAppellation;
    }

    /**
     * 设置持有人称谓
     *
     * @param familyAppellation 持有人称谓
     */
    public void setFamilyAppellation(String familyAppellation) {
        this.familyAppellation = familyAppellation;
    }

    /**
     * 获取保险产品名称
     *
     * @return insurance_name - 保险产品名称
     */
    public String getInsuranceName() {
        return insuranceName;
    }

    /**
     * 设置保险产品名称
     *
     * @param insuranceName 保险产品名称
     */
    public void setInsuranceName(String insuranceName) {
        this.insuranceName = insuranceName;
    }

    /**
     * 获取保险单号
     *
     * @return insurance_number - 保险单号
     */
    public Integer getInsuranceNumber() {
        return insuranceNumber;
    }

    /**
     * 设置保险单号
     *
     * @param insuranceNumber 保险单号
     */
    public void setInsuranceNumber(Integer insuranceNumber) {
        this.insuranceNumber = insuranceNumber;
    }

    /**
     * 获取保险公司全称
     *
     * @return company_name - 保险公司全称
     */
    public String getCompanyName() {
        return companyName;
    }

    /**
     * 设置保险公司全称
     *
     * @param companyName 保险公司全称
     */
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    /**
     * 获取累积缴纳保费、投资资金
     *
     * @return price - 累积缴纳保费、投资资金
     */
    public Integer getPrice() {
        return price;
    }

    /**
     * 设置累积缴纳保费、投资资金
     *
     * @param price 累积缴纳保费、投资资金
     */
    public void setPrice(Integer price) {
        this.price = price;
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
     * 获取档案类型：持有投资型保险的情况，固定值16无需填写
     *
     * @return archive_type - 档案类型：持有投资型保险的情况，固定值16无需填写
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：持有投资型保险的情况，固定值16无需填写
     *
     * @param archiveType 档案类型：持有投资型保险的情况，固定值16无需填写
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