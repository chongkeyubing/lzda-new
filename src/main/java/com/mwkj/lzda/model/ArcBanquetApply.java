package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "arc_banquet_apply")
public class ArcBanquetApply {
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
     * 申报事由
     */
    private String reason;

    /**
     * 亲属人数
     */
    @Column(name = "relatives_number")
    private Integer relativesNumber;

    /**
     * 好友人数
     */
    @Column(name = "friend_number")
    private Integer friendNumber;

    /**
     * 其他人数
     */
    @Column(name = "other_number")
    private Integer otherNumber;

    /**
     * 宴席标准(元)
     */
    @Column(name = "total_level")
    private Integer totalLevel;

    /**
     * 酒水标准(元)
     */
    @Column(name = "wine_level")
    private Integer wineLevel;

    /**
     * 香烟和礼物标准(元)
     */
    @Column(name = "cigarette_gift_level")
    private Integer cigaretteGiftLevel;

    /**
     * 车辆来源
     */
    @Column(name = "vehicle_source")
    private String vehicleSource;

    /**
     * 车辆号码
     */
    @Column(name = "vehicle_number")
    private String vehicleNumber;

    /**
     * 活动时间
     */
    @Column(name = "activity_time")
    private String activityTime;

    /**
     * 活动地点
     */
    @Column(name = "activity_position")
    private String activityPosition;

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
     * 档案类型：操办宴席申请表，固定值6无需填写
     */
    @Column(name = "archive_type")
    private Integer archiveType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 其他需要申报和说明的情况
     */
    @Column(name = "other_info")
    private String otherInfo;

    /**
     * 个人申请
     */
    @Column(name = "personal_apply")
    private String personalApply;

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
     * 获取申报事由
     *
     * @return reason - 申报事由
     */
    public String getReason() {
        return reason;
    }

    /**
     * 设置申报事由
     *
     * @param reason 申报事由
     */
    public void setReason(String reason) {
        this.reason = reason;
    }

    /**
     * 获取亲属人数
     *
     * @return relatives_number - 亲属人数
     */
    public Integer getRelativesNumber() {
        return relativesNumber;
    }

    /**
     * 设置亲属人数
     *
     * @param relativesNumber 亲属人数
     */
    public void setRelativesNumber(Integer relativesNumber) {
        this.relativesNumber = relativesNumber;
    }

    /**
     * 获取好友人数
     *
     * @return friend_number - 好友人数
     */
    public Integer getFriendNumber() {
        return friendNumber;
    }

    /**
     * 设置好友人数
     *
     * @param friendNumber 好友人数
     */
    public void setFriendNumber(Integer friendNumber) {
        this.friendNumber = friendNumber;
    }

    /**
     * 获取其他人数
     *
     * @return other_number - 其他人数
     */
    public Integer getOtherNumber() {
        return otherNumber;
    }

    /**
     * 设置其他人数
     *
     * @param otherNumber 其他人数
     */
    public void setOtherNumber(Integer otherNumber) {
        this.otherNumber = otherNumber;
    }

    /**
     * 获取宴席标准(元)
     *
     * @return total_level - 宴席标准(元)
     */
    public Integer getTotalLevel() {
        return totalLevel;
    }

    /**
     * 设置宴席标准(元)
     *
     * @param totalLevel 宴席标准(元)
     */
    public void setTotalLevel(Integer totalLevel) {
        this.totalLevel = totalLevel;
    }

    /**
     * 获取酒水标准(元)
     *
     * @return wine_level - 酒水标准(元)
     */
    public Integer getWineLevel() {
        return wineLevel;
    }

    /**
     * 设置酒水标准(元)
     *
     * @param wineLevel 酒水标准(元)
     */
    public void setWineLevel(Integer wineLevel) {
        this.wineLevel = wineLevel;
    }

    /**
     * 获取香烟和礼物标准(元)
     *
     * @return cigarette_gift_level - 香烟和礼物标准(元)
     */
    public Integer getCigaretteGiftLevel() {
        return cigaretteGiftLevel;
    }

    /**
     * 设置香烟和礼物标准(元)
     *
     * @param cigaretteGiftLevel 香烟和礼物标准(元)
     */
    public void setCigaretteGiftLevel(Integer cigaretteGiftLevel) {
        this.cigaretteGiftLevel = cigaretteGiftLevel;
    }

    /**
     * 获取车辆来源
     *
     * @return vehicle_source - 车辆来源
     */
    public String getVehicleSource() {
        return vehicleSource;
    }

    /**
     * 设置车辆来源
     *
     * @param vehicleSource 车辆来源
     */
    public void setVehicleSource(String vehicleSource) {
        this.vehicleSource = vehicleSource;
    }

    /**
     * 获取车辆号码
     *
     * @return vehicle_number - 车辆号码
     */
    public String getVehicleNumber() {
        return vehicleNumber;
    }

    /**
     * 设置车辆号码
     *
     * @param vehicleNumber 车辆号码
     */
    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    /**
     * 获取活动时间
     *
     * @return activity_time - 活动时间
     */
    public String getActivityTime() {
        return activityTime;
    }

    /**
     * 设置活动时间
     *
     * @param activityTime 活动时间
     */
    public void setActivityTime(String activityTime) {
        this.activityTime = activityTime;
    }

    /**
     * 获取活动地点
     *
     * @return activity_position - 活动地点
     */
    public String getActivityPosition() {
        return activityPosition;
    }

    /**
     * 设置活动地点
     *
     * @param activityPosition 活动地点
     */
    public void setActivityPosition(String activityPosition) {
        this.activityPosition = activityPosition;
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
     * 获取档案类型：操办宴席申请表，固定值6无需填写
     *
     * @return archive_type - 档案类型：操办宴席申请表，固定值6无需填写
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：操办宴席申请表，固定值6无需填写
     *
     * @param archiveType 档案类型：操办宴席申请表，固定值6无需填写
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
     * 获取其他需要申报和说明的情况
     *
     * @return other_info - 其他需要申报和说明的情况
     */
    public String getOtherInfo() {
        return otherInfo;
    }

    /**
     * 设置其他需要申报和说明的情况
     *
     * @param otherInfo 其他需要申报和说明的情况
     */
    public void setOtherInfo(String otherInfo) {
        this.otherInfo = otherInfo;
    }

    /**
     * 获取个人申请
     *
     * @return personal_apply - 个人申请
     */
    public String getPersonalApply() {
        return personalApply;
    }

    /**
     * 设置个人申请
     *
     * @param personalApply 个人申请
     */
    public void setPersonalApply(String personalApply) {
        this.personalApply = personalApply;
    }
}