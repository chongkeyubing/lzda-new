package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "arc_house_info")
public class ArcHouseInfo {
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
     * 房屋地址
     */
    private String address;

    /**
     * 房屋性质:福利房、商品房、自建房、集资建房
     */
    private String type;

    /**
     * 产权人
     */
    private String owner;

    /**
     * 建筑面积
     */
    private Integer area;

    /**
     * 购租时间
     */
    private String time;

    /**
     * 有无公款装修情况:有、无
     */
    @Column(name = "public_funds")
    private String publicFunds;

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
     * 档案类型：住房情况登记表，固定值25无需填写
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
     * 获取房屋地址
     *
     * @return address - 房屋地址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置房屋地址
     *
     * @param address 房屋地址
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取房屋性质:福利房、商品房、自建房、集资建房
     *
     * @return type - 房屋性质:福利房、商品房、自建房、集资建房
     */
    public String getType() {
        return type;
    }

    /**
     * 设置房屋性质:福利房、商品房、自建房、集资建房
     *
     * @param type 房屋性质:福利房、商品房、自建房、集资建房
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取产权人
     *
     * @return owner - 产权人
     */
    public String getOwner() {
        return owner;
    }

    /**
     * 设置产权人
     *
     * @param owner 产权人
     */
    public void setOwner(String owner) {
        this.owner = owner;
    }

    /**
     * 获取建筑面积
     *
     * @return area - 建筑面积
     */
    public Integer getArea() {
        return area;
    }

    /**
     * 设置建筑面积
     *
     * @param area 建筑面积
     */
    public void setArea(Integer area) {
        this.area = area;
    }

    /**
     * 获取购租时间
     *
     * @return time - 购租时间
     */
    public String getTime() {
        return time;
    }

    /**
     * 设置购租时间
     *
     * @param time 购租时间
     */
    public void setTime(String time) {
        this.time = time;
    }

    /**
     * 获取有无公款装修情况:有、无
     *
     * @return public_funds - 有无公款装修情况:有、无
     */
    public String getPublicFunds() {
        return publicFunds;
    }

    /**
     * 设置有无公款装修情况:有、无
     *
     * @param publicFunds 有无公款装修情况:有、无
     */
    public void setPublicFunds(String publicFunds) {
        this.publicFunds = publicFunds;
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
     * 获取档案类型：住房情况登记表，固定值25无需填写
     *
     * @return archive_type - 档案类型：住房情况登记表，固定值25无需填写
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：住房情况登记表，固定值25无需填写
     *
     * @param archiveType 档案类型：住房情况登记表，固定值25无需填写
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