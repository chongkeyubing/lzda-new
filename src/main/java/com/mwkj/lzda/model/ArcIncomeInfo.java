package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "arc_income_info")
public class ArcIncomeInfo {
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
     * 上年度工资收入
     */
    @Column(name = "last_year")
    private Integer lastYear;

    /**
     * 从事股票、基金、理财产品收益所得（元
     */
    private Integer stock;

    /**
     * 各类奖金、津贴、补贴及福利费等（元）
     */
    private Integer award;

    /**
     * 从事咨询、讲学、写作、审稿、书画等劳务所得（元）
     */
    private Integer labour;

    /**
     * 其他
     */
    private Integer other;

    /**
     * 合计
     */
    private Integer total;

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
     * 档案类型：收入情况登记表，固定值22无需填写
     */
    @Column(name = "archive_type")
    private Integer archiveType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 个人说明
     */
    @Column(name = "personal_info")
    private String personalInfo;

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
     * 获取上年度工资收入
     *
     * @return last_year - 上年度工资收入
     */
    public Integer getLastYear() {
        return lastYear;
    }

    /**
     * 设置上年度工资收入
     *
     * @param lastYear 上年度工资收入
     */
    public void setLastYear(Integer lastYear) {
        this.lastYear = lastYear;
    }

    /**
     * 获取从事股票、基金、理财产品收益所得（元
     *
     * @return stock - 从事股票、基金、理财产品收益所得（元
     */
    public Integer getStock() {
        return stock;
    }

    /**
     * 设置从事股票、基金、理财产品收益所得（元
     *
     * @param stock 从事股票、基金、理财产品收益所得（元
     */
    public void setStock(Integer stock) {
        this.stock = stock;
    }

    /**
     * 获取各类奖金、津贴、补贴及福利费等（元）
     *
     * @return award - 各类奖金、津贴、补贴及福利费等（元）
     */
    public Integer getAward() {
        return award;
    }

    /**
     * 设置各类奖金、津贴、补贴及福利费等（元）
     *
     * @param award 各类奖金、津贴、补贴及福利费等（元）
     */
    public void setAward(Integer award) {
        this.award = award;
    }

    /**
     * 获取从事咨询、讲学、写作、审稿、书画等劳务所得（元）
     *
     * @return labour - 从事咨询、讲学、写作、审稿、书画等劳务所得（元）
     */
    public Integer getLabour() {
        return labour;
    }

    /**
     * 设置从事咨询、讲学、写作、审稿、书画等劳务所得（元）
     *
     * @param labour 从事咨询、讲学、写作、审稿、书画等劳务所得（元）
     */
    public void setLabour(Integer labour) {
        this.labour = labour;
    }

    /**
     * 获取其他
     *
     * @return other - 其他
     */
    public Integer getOther() {
        return other;
    }

    /**
     * 设置其他
     *
     * @param other 其他
     */
    public void setOther(Integer other) {
        this.other = other;
    }

    /**
     * 获取合计
     *
     * @return total - 合计
     */
    public Integer getTotal() {
        return total;
    }

    /**
     * 设置合计
     *
     * @param total 合计
     */
    public void setTotal(Integer total) {
        this.total = total;
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
     * 获取档案类型：收入情况登记表，固定值22无需填写
     *
     * @return archive_type - 档案类型：收入情况登记表，固定值22无需填写
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：收入情况登记表，固定值22无需填写
     *
     * @param archiveType 档案类型：收入情况登记表，固定值22无需填写
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
     * 获取个人说明
     *
     * @return personal_info - 个人说明
     */
    public String getPersonalInfo() {
        return personalInfo;
    }

    /**
     * 设置个人说明
     *
     * @param personalInfo 个人说明
     */
    public void setPersonalInfo(String personalInfo) {
        this.personalInfo = personalInfo;
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