package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "pun_gift")
public class PunGift {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 被惩罚人id，关联user表id
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 被惩罚人单位id
     */
    @Column(name = "organization_id")
    private Integer organizationId;

    /**
     * 被违惩人姓名
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 被惩罚人职务
     */
    @Column(name = "job_position")
    private String jobPosition;

    /**
     * 被惩罚人单位名称
     */
    private String organization;

    /**
     * 上缴时间
     */
    private String time;

    /**
     * 上缴礼品名称
     */
    @Column(name = "gift_name")
    private String giftName;

    /**
     * 数量
     */
    private Integer amount;

    /**
     * 折价（元）
     */
    private Integer price;

    /**
     * 上缴礼金（元）
     */
    private Integer money;

    /**
     * 上缴礼金（元）
     */
    private Integer total;

    /**
     * 送礼人姓名
     */
    @Column(name = "gift_person_name")
    private String giftPersonName;

    /**
     * 送礼人单位
     */
    @Column(name = "gift_person_org")
    private String giftPersonOrg;

    /**
     * 送礼人职务
     */
    @Column(name = "gift_person_job")
    private String giftPersonJob;

    /**
     * 送礼时间
     */
    @Column(name = "gift_time")
    private String giftTime;

    /**
     * 送礼地点
     */
    @Column(name = "gift_address")
    private String giftAddress;

    /**
     * 接受登记部门
     */
    @Column(name = "regist_org")
    private String registOrg;

    /**
     * 经手人id
     */
    @Column(name = "handle_person_id")
    private Integer handlePersonId;

    /**
     * 经手人
     */
    @Column(name = "handle_person")
    private String handlePerson;

    /**
     * 负责人id
     */
    @Column(name = "charge_person_id")
    private Integer chargePersonId;

    /**
     * 负责人
     */
    @Column(name = "charge_person")
    private String chargePerson;

    /**
     * 填表人ID
     */
    @Column(name = "operator_id")
    private Integer operatorId;

    /**
     * 填表人
     */
    private String operator;

    /**
     * 附件id，一对多关联attachment
     */
    @Column(name = "attachment_id")
    private String attachmentId;

    /**
     * 违惩类型：3一般干部收受礼品（金）情况登记表
     */
    @Column(name = "punish_type")
    private Integer punishType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 礼品处理情况
     */
    @Column(name = "handle_info")
    private String handleInfo;

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
     * 获取被惩罚人id，关联user表id
     *
     * @return user_id - 被惩罚人id，关联user表id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置被惩罚人id，关联user表id
     *
     * @param userId 被惩罚人id，关联user表id
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取被惩罚人单位id
     *
     * @return organization_id - 被惩罚人单位id
     */
    public Integer getOrganizationId() {
        return organizationId;
    }

    /**
     * 设置被惩罚人单位id
     *
     * @param organizationId 被惩罚人单位id
     */
    public void setOrganizationId(Integer organizationId) {
        this.organizationId = organizationId;
    }

    /**
     * 获取被违惩人姓名
     *
     * @return user_name - 被违惩人姓名
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置被违惩人姓名
     *
     * @param userName 被违惩人姓名
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 获取被惩罚人职务
     *
     * @return job_position - 被惩罚人职务
     */
    public String getJobPosition() {
        return jobPosition;
    }

    /**
     * 设置被惩罚人职务
     *
     * @param jobPosition 被惩罚人职务
     */
    public void setJobPosition(String jobPosition) {
        this.jobPosition = jobPosition;
    }

    /**
     * 获取被惩罚人单位名称
     *
     * @return organization - 被惩罚人单位名称
     */
    public String getOrganization() {
        return organization;
    }

    /**
     * 设置被惩罚人单位名称
     *
     * @param organization 被惩罚人单位名称
     */
    public void setOrganization(String organization) {
        this.organization = organization;
    }

    /**
     * 获取上缴时间
     *
     * @return time - 上缴时间
     */
    public String getTime() {
        return time;
    }

    /**
     * 设置上缴时间
     *
     * @param time 上缴时间
     */
    public void setTime(String time) {
        this.time = time;
    }

    /**
     * 获取上缴礼品名称
     *
     * @return gift_name - 上缴礼品名称
     */
    public String getGiftName() {
        return giftName;
    }

    /**
     * 设置上缴礼品名称
     *
     * @param giftName 上缴礼品名称
     */
    public void setGiftName(String giftName) {
        this.giftName = giftName;
    }

    /**
     * 获取数量
     *
     * @return amount - 数量
     */
    public Integer getAmount() {
        return amount;
    }

    /**
     * 设置数量
     *
     * @param amount 数量
     */
    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    /**
     * 获取折价（元）
     *
     * @return price - 折价（元）
     */
    public Integer getPrice() {
        return price;
    }

    /**
     * 设置折价（元）
     *
     * @param price 折价（元）
     */
    public void setPrice(Integer price) {
        this.price = price;
    }

    /**
     * 获取上缴礼金（元）
     *
     * @return money - 上缴礼金（元）
     */
    public Integer getMoney() {
        return money;
    }

    /**
     * 设置上缴礼金（元）
     *
     * @param money 上缴礼金（元）
     */
    public void setMoney(Integer money) {
        this.money = money;
    }

    /**
     * 获取上缴礼金（元）
     *
     * @return total - 上缴礼金（元）
     */
    public Integer getTotal() {
        return total;
    }

    /**
     * 设置上缴礼金（元）
     *
     * @param total 上缴礼金（元）
     */
    public void setTotal(Integer total) {
        this.total = total;
    }

    /**
     * 获取送礼人姓名
     *
     * @return gift_person_name - 送礼人姓名
     */
    public String getGiftPersonName() {
        return giftPersonName;
    }

    /**
     * 设置送礼人姓名
     *
     * @param giftPersonName 送礼人姓名
     */
    public void setGiftPersonName(String giftPersonName) {
        this.giftPersonName = giftPersonName;
    }

    /**
     * 获取送礼人单位
     *
     * @return gift_person_org - 送礼人单位
     */
    public String getGiftPersonOrg() {
        return giftPersonOrg;
    }

    /**
     * 设置送礼人单位
     *
     * @param giftPersonOrg 送礼人单位
     */
    public void setGiftPersonOrg(String giftPersonOrg) {
        this.giftPersonOrg = giftPersonOrg;
    }

    /**
     * 获取送礼人职务
     *
     * @return gift_person_job - 送礼人职务
     */
    public String getGiftPersonJob() {
        return giftPersonJob;
    }

    /**
     * 设置送礼人职务
     *
     * @param giftPersonJob 送礼人职务
     */
    public void setGiftPersonJob(String giftPersonJob) {
        this.giftPersonJob = giftPersonJob;
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
     * 获取送礼地点
     *
     * @return gift_address - 送礼地点
     */
    public String getGiftAddress() {
        return giftAddress;
    }

    /**
     * 设置送礼地点
     *
     * @param giftAddress 送礼地点
     */
    public void setGiftAddress(String giftAddress) {
        this.giftAddress = giftAddress;
    }

    /**
     * 获取接受登记部门
     *
     * @return regist_org - 接受登记部门
     */
    public String getRegistOrg() {
        return registOrg;
    }

    /**
     * 设置接受登记部门
     *
     * @param registOrg 接受登记部门
     */
    public void setRegistOrg(String registOrg) {
        this.registOrg = registOrg;
    }

    /**
     * 获取经手人id
     *
     * @return handle_person_id - 经手人id
     */
    public Integer getHandlePersonId() {
        return handlePersonId;
    }

    /**
     * 设置经手人id
     *
     * @param handlePersonId 经手人id
     */
    public void setHandlePersonId(Integer handlePersonId) {
        this.handlePersonId = handlePersonId;
    }

    /**
     * 获取经手人
     *
     * @return handle_person - 经手人
     */
    public String getHandlePerson() {
        return handlePerson;
    }

    /**
     * 设置经手人
     *
     * @param handlePerson 经手人
     */
    public void setHandlePerson(String handlePerson) {
        this.handlePerson = handlePerson;
    }

    /**
     * 获取负责人id
     *
     * @return charge_person_id - 负责人id
     */
    public Integer getChargePersonId() {
        return chargePersonId;
    }

    /**
     * 设置负责人id
     *
     * @param chargePersonId 负责人id
     */
    public void setChargePersonId(Integer chargePersonId) {
        this.chargePersonId = chargePersonId;
    }

    /**
     * 获取负责人
     *
     * @return charge_person - 负责人
     */
    public String getChargePerson() {
        return chargePerson;
    }

    /**
     * 设置负责人
     *
     * @param chargePerson 负责人
     */
    public void setChargePerson(String chargePerson) {
        this.chargePerson = chargePerson;
    }

    /**
     * 获取填表人ID
     *
     * @return operator_id - 填表人ID
     */
    public Integer getOperatorId() {
        return operatorId;
    }

    /**
     * 设置填表人ID
     *
     * @param operatorId 填表人ID
     */
    public void setOperatorId(Integer operatorId) {
        this.operatorId = operatorId;
    }

    /**
     * 获取填表人
     *
     * @return operator - 填表人
     */
    public String getOperator() {
        return operator;
    }

    /**
     * 设置填表人
     *
     * @param operator 填表人
     */
    public void setOperator(String operator) {
        this.operator = operator;
    }

    /**
     * 获取附件id，一对多关联attachment
     *
     * @return attachment_id - 附件id，一对多关联attachment
     */
    public String getAttachmentId() {
        return attachmentId;
    }

    /**
     * 设置附件id，一对多关联attachment
     *
     * @param attachmentId 附件id，一对多关联attachment
     */
    public void setAttachmentId(String attachmentId) {
        this.attachmentId = attachmentId;
    }

    /**
     * 获取违惩类型：3一般干部收受礼品（金）情况登记表
     *
     * @return punish_type - 违惩类型：3一般干部收受礼品（金）情况登记表
     */
    public Integer getPunishType() {
        return punishType;
    }

    /**
     * 设置违惩类型：3一般干部收受礼品（金）情况登记表
     *
     * @param punishType 违惩类型：3一般干部收受礼品（金）情况登记表
     */
    public void setPunishType(Integer punishType) {
        this.punishType = punishType;
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
     * 获取礼品处理情况
     *
     * @return handle_info - 礼品处理情况
     */
    public String getHandleInfo() {
        return handleInfo;
    }

    /**
     * 设置礼品处理情况
     *
     * @param handleInfo 礼品处理情况
     */
    public void setHandleInfo(String handleInfo) {
        this.handleInfo = handleInfo;
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