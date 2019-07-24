package com.mwkj.lzda.model;

import javax.persistence.*;

@Table(name = "arc_loan_rela")
public class ArcLoanRela {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 关联arc_loan表id
     */
    @Column(name = "loan_id")
    private Integer loanId;

    /**
     * 类型:1借出2借入3担保4经营活动
     */
    private Integer type;

    /**
     * 债权人
     */
    private String creditor;

    /**
     * 债务人
     */
    private String cbligor;

    /**
     * 金额
     */
    private Integer amount;

    /**
     * 约定期限
     */
    @Column(name = "time_limit")
    private String timeLimit;

    /**
     * 约定年利率
     */
    private String interest;

    /**
     * 资金来源
     */
    @Column(name = "fund_source")
    private String fundSource;

    /**
     * 企业名称
     */
    @Column(name = "enterprise_name")
    private String enterpriseName;

    /**
     * 企业类型：1独资2合伙
     */
    @Column(name = "enterprise_type")
    private String enterpriseType;

    /**
     * 盈利情况
     */
    private String profit;

    /**
     * 整改情况
     */
    @Column(name = "rectify_info")
    private String rectifyInfo;

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
     * 获取关联arc_loan表loan_id
     *
     * @return loan_id - 关联arc_loan表loan_id
     */
    public Integer getLoanId() {
        return loanId;
    }

    /**
     * 设置关联arc_loan表loan_id
     *
     * @param loanId 关联arc_loan表loan_id
     */
    public void setLoanId(Integer loanId) {
        this.loanId = loanId;
    }

    /**
     * 获取类型:1借出2借入3担保4经营活动
     *
     * @return type - 类型:1借出2借入3担保4经营活动
     */
    public Integer getType() {
        return type;
    }

    /**
     * 设置类型:1借出2借入3担保4经营活动
     *
     * @param type 类型:1借出2借入3担保4经营活动
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * 获取债权人
     *
     * @return creditor - 债权人
     */
    public String getCreditor() {
        return creditor;
    }

    /**
     * 设置债权人
     *
     * @param creditor 债权人
     */
    public void setCreditor(String creditor) {
        this.creditor = creditor;
    }

    /**
     * 获取债务人
     *
     * @return cbligor - 债务人
     */
    public String getCbligor() {
        return cbligor;
    }

    /**
     * 设置债务人
     *
     * @param cbligor 债务人
     */
    public void setCbligor(String cbligor) {
        this.cbligor = cbligor;
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
     * 获取约定期限
     *
     * @return time_limit - 约定期限
     */
    public String getTimeLimit() {
        return timeLimit;
    }

    /**
     * 设置约定期限
     *
     * @param timeLimit 约定期限
     */
    public void setTimeLimit(String timeLimit) {
        this.timeLimit = timeLimit;
    }

    /**
     * 获取约定年利率
     *
     * @return interest - 约定年利率
     */
    public String getInterest() {
        return interest;
    }

    /**
     * 设置约定年利率
     *
     * @param interest 约定年利率
     */
    public void setInterest(String interest) {
        this.interest = interest;
    }

    /**
     * 获取资金来源
     *
     * @return fund_source - 资金来源
     */
    public String getFundSource() {
        return fundSource;
    }

    /**
     * 设置资金来源
     *
     * @param fundSource 资金来源
     */
    public void setFundSource(String fundSource) {
        this.fundSource = fundSource;
    }

    /**
     * 获取企业名称
     *
     * @return enterprise_name - 企业名称
     */
    public String getEnterpriseName() {
        return enterpriseName;
    }

    /**
     * 设置企业名称
     *
     * @param enterpriseName 企业名称
     */
    public void setEnterpriseName(String enterpriseName) {
        this.enterpriseName = enterpriseName;
    }

    /**
     * 获取企业类型：1独资2合伙
     *
     * @return enterprise_type - 企业类型：1独资2合伙
     */
    public String getEnterpriseType() {
        return enterpriseType;
    }

    /**
     * 设置企业类型：1独资2合伙
     *
     * @param enterpriseType 企业类型：1独资2合伙
     */
    public void setEnterpriseType(String enterpriseType) {
        this.enterpriseType = enterpriseType;
    }

    /**
     * 获取盈利情况
     *
     * @return profit - 盈利情况
     */
    public String getProfit() {
        return profit;
    }

    /**
     * 设置盈利情况
     *
     * @param profit 盈利情况
     */
    public void setProfit(String profit) {
        this.profit = profit;
    }

    /**
     * 获取整改情况
     *
     * @return rectify_info - 整改情况
     */
    public String getRectifyInfo() {
        return rectifyInfo;
    }

    /**
     * 设置整改情况
     *
     * @param rectifyInfo 整改情况
     */
    public void setRectifyInfo(String rectifyInfo) {
        this.rectifyInfo = rectifyInfo;
    }
}