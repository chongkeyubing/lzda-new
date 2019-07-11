package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "arc_family_abroad")
public class ArcFamilyAbroad {
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
     * 有无变化
     */
    @Column(name = "change_status")
    private String changeStatus;

    /**
     * 家人姓名
     */
    @Column(name = "family_name")
    private String familyName;

    /**
     * 家人称谓
     */
    @Column(name = "family_appellation")
    private String familyAppellation;

    /**
     * 移居国家
     */
    @Column(name = "to_country")
    private String toCountry;

    /**
     * 移居城市
     */
    @Column(name = "to_city")
    private String toCity;

    /**
     * 证件号码
     */
    @Column(name = "identification_number")
    private String identificationNumber;

    /**
     * 移居类别：外国国籍 永久居留资格 长期居留许可
     */
    private String type;

    /**
     * 移居时间
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
     * 档案类型：家人移居国外情况，固定值11无需填写
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


    /**
     * 获取家人姓名
     *
     * @return family_name - 家人姓名
     */
    public String getFamilyName() {
        return familyName;
    }

    /**
     * 设置家人姓名
     *
     * @param familyName 家人姓名
     */
    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    /**
     * 获取家人称谓
     *
     * @return family_appellation - 家人称谓
     */
    public String getFamilyAppellation() {
        return familyAppellation;
    }

    /**
     * 设置家人称谓
     *
     * @param familyAppellation 家人称谓
     */
    public void setFamilyAppellation(String familyAppellation) {
        this.familyAppellation = familyAppellation;
    }

    /**
     * 获取移居国家
     *
     * @return to_country - 移居国家
     */
    public String getToCountry() {
        return toCountry;
    }

    /**
     * 设置移居国家
     *
     * @param toCountry 移居国家
     */
    public void setToCountry(String toCountry) {
        this.toCountry = toCountry;
    }

    /**
     * 获取移居城市
     *
     * @return to_city - 移居城市
     */
    public String getToCity() {
        return toCity;
    }

    /**
     * 设置移居城市
     *
     * @param toCity 移居城市
     */
    public void setToCity(String toCity) {
        this.toCity = toCity;
    }

    /**
     * 获取证件号码
     *
     * @return identification_number - 证件号码
     */
    public String getIdentificationNumber() {
        return identificationNumber;
    }

    /**
     * 设置证件号码
     *
     * @param identificationNumber 证件号码
     */
    public void setIdentificationNumber(String identificationNumber) {
        this.identificationNumber = identificationNumber;
    }

    /**
     * 获取移居类别：外国国籍 永久居留资格 长期居留许可
     *
     * @return type - 移居类别：外国国籍 永久居留资格 长期居留许可
     */
    public String getType() {
        return type;
    }

    /**
     * 设置移居类别：外国国籍 永久居留资格 长期居留许可
     *
     * @param type 移居类别：外国国籍 永久居留资格 长期居留许可
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取移居时间
     *
     * @return time - 移居时间
     */
    public String getTime() {
        return time;
    }

    /**
     * 设置移居时间
     *
     * @param time 移居时间
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
     * 获取档案类型：家人移居国外情况，固定值11无需填写
     *
     * @return archive_type - 档案类型：家人移居国外情况，固定值11无需填写
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：家人移居国外情况，固定值11无需填写
     *
     * @param archiveType 档案类型：家人移居国外情况，固定值11无需填写
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

    public String getChangeStatus() {
        return changeStatus;
    }

    public void setChangeStatus(String changeStatus) {
        this.changeStatus = changeStatus;
    }
}