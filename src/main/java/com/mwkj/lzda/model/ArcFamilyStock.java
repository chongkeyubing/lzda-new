package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "arc_family_stock")
public class ArcFamilyStock {
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
     * 股票名称或代码
     */
    @Column(name = "stock_name")
    private String stockName;

    /**
     * 持股数量
     */
    @Column(name = "stock_number")
    private Integer stockNumber;

    /**
     * 填报前一交易日市值
     */
    private Integer price;

    /**
     * 填报前一交易日总市值
     */
    @Column(name = "total_price")
    private Integer totalPrice;

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
     * 档案类型：持有股票的情况，固定值14无需填写
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
     * 获取股票名称或代码
     *
     * @return stock_name - 股票名称或代码
     */
    public String getStockName() {
        return stockName;
    }

    /**
     * 设置股票名称或代码
     *
     * @param stockName 股票名称或代码
     */
    public void setStockName(String stockName) {
        this.stockName = stockName;
    }

    /**
     * 获取持股数量
     *
     * @return stock_number - 持股数量
     */
    public Integer getStockNumber() {
        return stockNumber;
    }

    /**
     * 设置持股数量
     *
     * @param stockNumber 持股数量
     */
    public void setStockNumber(Integer stockNumber) {
        this.stockNumber = stockNumber;
    }

    /**
     * 获取填报前一交易日市值
     *
     * @return price - 填报前一交易日市值
     */
    public Integer getPrice() {
        return price;
    }

    /**
     * 设置填报前一交易日市值
     *
     * @param price 填报前一交易日市值
     */
    public void setPrice(Integer price) {
        this.price = price;
    }

    /**
     * 获取填报前一交易日总市值
     *
     * @return total_price - 填报前一交易日总市值
     */
    public Integer getTotalPrice() {
        return totalPrice;
    }

    /**
     * 设置填报前一交易日总市值
     *
     * @param totalPrice 填报前一交易日总市值
     */
    public void setTotalPrice(Integer totalPrice) {
        this.totalPrice = totalPrice;
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
     * 获取档案类型：持有股票的情况，固定值14无需填写
     *
     * @return archive_type - 档案类型：持有股票的情况，固定值14无需填写
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：持有股票的情况，固定值14无需填写
     *
     * @param archiveType 档案类型：持有股票的情况，固定值14无需填写
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