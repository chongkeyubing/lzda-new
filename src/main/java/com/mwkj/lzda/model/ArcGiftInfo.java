package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "arc_gift_info")
public class ArcGiftInfo {
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
     * 送礼人姓名
     */
    @Column(name = "gift_person_name")
    private String giftPersonName;

    /**
     * 送礼人单位
     */
    @Column(name = "gift_org")
    private String giftOrg;

    /**
     * 送礼人职务
     */
    @Column(name = "gift_job")
    private String giftJob;

    /**
     * 送礼时间
     */
    @Column(name = "gift_time")
    private String giftTime;

    /**
     * 送礼地址
     */
    @Column(name = "gift_address")
    private String giftAddress;

    /**
     * 送礼方式
     */
    @Column(name = "gift_way")
    private String giftWay;

    /**
     * 礼品名称
     */
    @Column(name = "gift_name")
    private String giftName;

    /**
     * 礼品数量
     */
    @Column(name = "gift_number")
    private Integer giftNumber;

    /**
     * 礼品折价(元)
     */
    @Column(name = "gift_price")
    private Integer giftPrice;

    /**
     * 礼金(元)
     */
    @Column(name = "gift_money")
    private Integer giftMoney;

    /**
     * 合计(元)
     */
    @Column(name = "gift_total")
    private Integer giftTotal;

    /**
     * 处理情况:退还当事人、上缴分局、上缴单位、其他
     */
    @Column(name = "gift_handle")
    private String giftHandle;

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
     * 档案类型：收受礼品登记表，固定值23无需填写
     */
    @Column(name = "archive_type")
    private Integer archiveType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 送礼事由
     */
    @Column(name = "gift_reason")
    private String giftReason;

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

    public String getGiftPersonName() {
        return giftPersonName;
    }

    public void setGiftPersonName(String giftPersonName) {
        this.giftPersonName = giftPersonName;
    }

    /**
     * 获取送礼人单位
     *
     * @return gift_org - 送礼人单位
     */
    public String getGiftOrg() {
        return giftOrg;
    }

    /**
     * 设置送礼人单位
     *
     * @param giftOrg 送礼人单位
     */
    public void setGiftOrg(String giftOrg) {
        this.giftOrg = giftOrg;
    }

    /**
     * 获取送礼人职务
     *
     * @return gift_job - 送礼人职务
     */
    public String getGiftJob() {
        return giftJob;
    }

    /**
     * 设置送礼人职务
     *
     * @param giftJob 送礼人职务
     */
    public void setGiftJob(String giftJob) {
        this.giftJob = giftJob;
    }

    /**
     * 获取送礼时间
     *
     * @return gift_time - 送礼时间
     */
    public String getGiftTime() {
        return giftTime;
    }

    /**
     * 设置送礼时间
     *
     * @param giftTime 送礼时间
     */
    public void setGiftTime(String giftTime) {
        this.giftTime = giftTime;
    }

    /**
     * 获取送礼地址
     *
     * @return gift_address - 送礼地址
     */
    public String getGiftAddress() {
        return giftAddress;
    }

    /**
     * 设置送礼地址
     *
     * @param giftAddress 送礼地址
     */
    public void setGiftAddress(String giftAddress) {
        this.giftAddress = giftAddress;
    }

    /**
     * 获取送礼方式
     *
     * @return gift_way - 送礼方式
     */
    public String getGiftWay() {
        return giftWay;
    }

    /**
     * 设置送礼方式
     *
     * @param giftWay 送礼方式
     */
    public void setGiftWay(String giftWay) {
        this.giftWay = giftWay;
    }

    /**
     * 获取礼品名称
     *
     * @return gift_name - 礼品名称
     */
    public String getGiftName() {
        return giftName;
    }

    /**
     * 设置礼品名称
     *
     * @param giftName 礼品名称
     */
    public void setGiftName(String giftName) {
        this.giftName = giftName;
    }

    /**
     * 获取礼品数量
     *
     * @return gift_number - 礼品数量
     */
    public Integer getGiftNumber() {
        return giftNumber;
    }

    /**
     * 设置礼品数量
     *
     * @param giftNumber 礼品数量
     */
    public void setGiftNumber(Integer giftNumber) {
        this.giftNumber = giftNumber;
    }

    /**
     * 获取礼品折价(元)
     *
     * @return gift_price - 礼品折价(元)
     */
    public Integer getGiftPrice() {
        return giftPrice;
    }

    /**
     * 设置礼品折价(元)
     *
     * @param giftPrice 礼品折价(元)
     */
    public void setGiftPrice(Integer giftPrice) {
        this.giftPrice = giftPrice;
    }

    /**
     * 获取礼金(元)
     *
     * @return gift_money - 礼金(元)
     */
    public Integer getGiftMoney() {
        return giftMoney;
    }

    /**
     * 设置礼金(元)
     *
     * @param giftMoney 礼金(元)
     */
    public void setGiftMoney(Integer giftMoney) {
        this.giftMoney = giftMoney;
    }

    /**
     * 获取合计(元)
     *
     * @return gift_total - 合计(元)
     */
    public Integer getGiftTotal() {
        return giftTotal;
    }

    /**
     * 设置合计(元)
     *
     * @param giftTotal 合计(元)
     */
    public void setGiftTotal(Integer giftTotal) {
        this.giftTotal = giftTotal;
    }

    /**
     * 获取处理情况:退还当事人、上缴分局、上缴单位、其他
     *
     * @return gift_handle - 处理情况:退还当事人、上缴分局、上缴单位、其他
     */
    public String getGiftHandle() {
        return giftHandle;
    }

    /**
     * 设置处理情况:退还当事人、上缴分局、上缴单位、其他
     *
     * @param giftHandle 处理情况:退还当事人、上缴分局、上缴单位、其他
     */
    public void setGiftHandle(String giftHandle) {
        this.giftHandle = giftHandle;
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
     * 获取档案类型：收受礼品登记表，固定值23无需填写
     *
     * @return archive_type - 档案类型：收受礼品登记表，固定值23无需填写
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：收受礼品登记表，固定值23无需填写
     *
     * @param archiveType 档案类型：收受礼品登记表，固定值23无需填写
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
     * 获取送礼事由
     *
     * @return gift_reason - 送礼事由
     */
    public String getGiftReason() {
        return giftReason;
    }

    /**
     * 设置送礼事由
     *
     * @param giftReason 送礼事由
     */
    public void setGiftReason(String giftReason) {
        this.giftReason = giftReason;
    }
}