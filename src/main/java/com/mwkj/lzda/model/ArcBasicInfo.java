package com.mwkj.lzda.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import javax.persistence.*;

@Table(name = "arc_basic_info")
public class ArcBasicInfo {
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
     * 姓名
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 头像url
     */
    @Column(name = "avatar_url")
    private String avatarUrl;

    /**
     * 名族
     */
    private String nation;

    /**
     * 婚姻状况：未婚、已婚
     */
    @Column(name = "marital_status")
    private String maritalStatus;

    /**
     * 政治面貌：党员 群众 团员
     */
    @Column(name = "politic_face")
    private String politicFace;

    /**
     * 手机号码
     */
    private String phone;

    /**
     * 办公电话
     */
    @Column(name = "office_phone")
    private String officePhone;

    /**
     * 学历
     */
    private String education;

    /**
     * 性别： 男 女
     */
    private String gender;

    /**
     * 出生日期
     */
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date birthday;

    /**
     * 现任职务
     */
    @Column(name = "job_position")
    private String jobPosition;

    /**
     * 职级:1办事员2科员3副科级4副科职5正科级6正科职务7副处职
     */
    @Column(name = "job_position_level")
    private String jobPositionLevel;

    /**
     * 现任职务时间
     */
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Column(name = "job_position_time")
    private Date jobPositionTime;

    /**
     * 籍贯
     */
    @Column(name = "native_place")
    private String nativePlace;

    /**
     * 身份证
     */
    @Column(name = "identity_number")
    private String identityNumber;

    /**
     * 入党时间
     */
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Column(name = "party_join_time")
    private Date partyJoinTime;

    /**
     * 家庭住址
     */
    @Column(name = "home_address")
    private String homeAddress;

    /**
     * 分管工作
     */
    private String responsibility;

    /**
     * 工作单位名称
     */
    private String organization;

    /**
     * 工作单位id，关联organization表id
     */
    @Column(name = "organization_id")
    private Integer organizationId;

    /**
     * 档案类型：个人基本情况报备，固定值1无需填写
     */
    @Column(name = "archive_type")
    private Integer archiveType;

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
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 个人工作简历
     */
    @Column(name = "work_experience")
    private String workExperience;

    /**
     * 其他需要说明的情况
     */
    @Column(name = "other_info")
    private String otherInfo;

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
     * 获取姓名
     *
     * @return user_name - 姓名
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置姓名
     *
     * @param userName 姓名
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 获取头像url
     *
     * @return avatar_url - 头像url
     */
    public String getAvatarUrl() {
        return avatarUrl;
    }

    /**
     * 设置头像url
     *
     * @param avatarUrl 头像url
     */
    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    /**
     * 获取名族
     *
     * @return nation - 名族
     */
    public String getNation() {
        return nation;
    }

    /**
     * 设置名族
     *
     * @param nation 名族
     */
    public void setNation(String nation) {
        this.nation = nation;
    }

    /**
     * 获取婚姻状况：未婚、已婚
     *
     * @return marital_status - 婚姻状况：未婚、已婚
     */
    public String getMaritalStatus() {
        return maritalStatus;
    }

    /**
     * 设置婚姻状况：未婚、已婚
     *
     * @param maritalStatus 婚姻状况：未婚、已婚
     */
    public void setMaritalStatus(String maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    /**
     * 获取政治面貌：党员 群众 团员
     *
     * @return politic_face - 政治面貌：党员 群众 团员
     */
    public String getPoliticFace() {
        return politicFace;
    }

    /**
     * 设置政治面貌：党员 群众 团员
     *
     * @param politicFace 政治面貌：党员 群众 团员
     */
    public void setPoliticFace(String politicFace) {
        this.politicFace = politicFace;
    }

    /**
     * 获取手机号码
     *
     * @return phone - 手机号码
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置手机号码
     *
     * @param phone 手机号码
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取办公电话
     *
     * @return office_phone - 办公电话
     */
    public String getOfficePhone() {
        return officePhone;
    }

    /**
     * 设置办公电话
     *
     * @param officePhone 办公电话
     */
    public void setOfficePhone(String officePhone) {
        this.officePhone = officePhone;
    }

    /**
     * 获取学历
     *
     * @return education - 学历
     */
    public String getEducation() {
        return education;
    }

    /**
     * 设置学历
     *
     * @param education 学历
     */
    public void setEducation(String education) {
        this.education = education;
    }

    /**
     * 获取性别： 男 女
     *
     * @return gender - 性别： 男 女
     */
    public String getGender() {
        return gender;
    }

    /**
     * 设置性别： 男 女
     *
     * @param gender 性别： 男 女
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * 获取出生日期
     *
     * @return birthday - 出生日期
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * 设置出生日期
     *
     * @param birthday 出生日期
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * 获取现任职务
     *
     * @return job_position - 现任职务
     */
    public String getJobPosition() {
        return jobPosition;
    }

    /**
     * 设置现任职务
     *
     * @param jobPosition 现任职务
     */
    public void setJobPosition(String jobPosition) {
        this.jobPosition = jobPosition;
    }

    /**
     * 获取职级:1办事员2科员3副科级4副科职5正科级6正科职务7副处职
     *
     * @return job_position_level - 职级:1办事员2科员3副科级4副科职5正科级6正科职务7副处职
     */
    public String getJobPositionLevel() {
        return jobPositionLevel;
    }

    /**
     * 设置职级:1办事员2科员3副科级4副科职5正科级6正科职务7副处职
     *
     * @param jobPositionLevel 职级:1办事员2科员3副科级4副科职5正科级6正科职务7副处职
     */
    public void setJobPositionLevel(String jobPositionLevel) {
        this.jobPositionLevel = jobPositionLevel;
    }

    /**
     * 获取现任职务时间
     *
     * @return job_position_time - 现任职务时间
     */
    public Date getJobPositionTime() {
        return jobPositionTime;
    }

    /**
     * 设置现任职务时间
     *
     * @param jobPositionTime 现任职务时间
     */
    public void setJobPositionTime(Date jobPositionTime) {
        this.jobPositionTime = jobPositionTime;
    }

    /**
     * 获取籍贯
     *
     * @return native_place - 籍贯
     */
    public String getNativePlace() {
        return nativePlace;
    }

    /**
     * 设置籍贯
     *
     * @param nativePlace 籍贯
     */
    public void setNativePlace(String nativePlace) {
        this.nativePlace = nativePlace;
    }

    /**
     * 获取身份证
     *
     * @return identity_number - 身份证
     */
    public String getIdentityNumber() {
        return identityNumber;
    }

    /**
     * 设置身份证
     *
     * @param identityNumber 身份证
     */
    public void setIdentityNumber(String identityNumber) {
        this.identityNumber = identityNumber;
    }

    /**
     * 获取入党时间
     *
     * @return party_join_time - 入党时间
     */
    public Date getPartyJoinTime() {
        return partyJoinTime;
    }

    /**
     * 设置入党时间
     *
     * @param partyJoinTime 入党时间
     */
    public void setPartyJoinTime(Date partyJoinTime) {
        this.partyJoinTime = partyJoinTime;
    }

    /**
     * 获取家庭住址
     *
     * @return home_address - 家庭住址
     */
    public String getHomeAddress() {
        return homeAddress;
    }

    /**
     * 设置家庭住址
     *
     * @param homeAddress 家庭住址
     */
    public void setHomeAddress(String homeAddress) {
        this.homeAddress = homeAddress;
    }

    /**
     * 获取分管工作
     *
     * @return responsibility - 分管工作
     */
    public String getResponsibility() {
        return responsibility;
    }

    /**
     * 设置分管工作
     *
     * @param responsibility 分管工作
     */
    public void setResponsibility(String responsibility) {
        this.responsibility = responsibility;
    }

    /**
     * 获取工作单位名称
     *
     * @return organization - 工作单位名称
     */
    public String getOrganization() {
        return organization;
    }

    /**
     * 设置工作单位名称
     *
     * @param organization 工作单位名称
     */
    public void setOrganization(String organization) {
        this.organization = organization;
    }

    /**
     * 获取工作单位id，关联organization表id
     *
     * @return organization_id - 工作单位id，关联organization表id
     */
    public Integer getOrganizationId() {
        return organizationId;
    }

    /**
     * 设置工作单位id，关联organization表id
     *
     * @param organizationId 工作单位id，关联organization表id
     */
    public void setOrganizationId(Integer organizationId) {
        this.organizationId = organizationId;
    }

    /**
     * 获取档案类型：个人基本情况报备，固定值1无需填写
     *
     * @return archive_type - 档案类型：个人基本情况报备，固定值1无需填写
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：个人基本情况报备，固定值1无需填写
     *
     * @param archiveType 档案类型：个人基本情况报备，固定值1无需填写
     */
    public void setArchiveType(Integer archiveType) {
        this.archiveType = archiveType;
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
     * 获取个人工作简历
     *
     * @return work_experience - 个人工作简历
     */
    public String getWorkExperience() {
        return workExperience;
    }

    /**
     * 设置个人工作简历
     *
     * @param workExperience 个人工作简历
     */
    public void setWorkExperience(String workExperience) {
        this.workExperience = workExperience;
    }

    /**
     * 获取其他需要说明的情况
     *
     * @return other_info - 其他需要说明的情况
     */
    public String getOtherInfo() {
        return otherInfo;
    }

    /**
     * 设置其他需要说明的情况
     *
     * @param otherInfo 其他需要说明的情况
     */
    public void setOtherInfo(String otherInfo) {
        this.otherInfo = otherInfo;
    }
}