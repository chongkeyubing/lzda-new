package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "rpt_team_thinking")
public class RptTeamThinking {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 上报人id，关联user表id
     */
    @Column(name = "committer_id")
    private Integer committerId;

    /**
     * 上报人姓名
     */
    @Column(name = "committer_name")
    private String committerName;

    /**
     * 单位id
     */
    @Column(name = "organization_id")
    private Integer organizationId;

    /**
     * 单位名称
     */
    @Column(name = "organization_name")
    private String organizationName;

    /**
     * 月份
     */
    private String time;

    /**
     * 民警人数
     */
    @Column(name = "ploice_number")
    private Integer ploiceNumber;

    /**
     * 党员人数
     */
    @Column(name = "party_number")
    private Integer partyNumber;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 遵纪情况
     */
    @Column(name = "obey_info")
    private String obeyInfo;

    /**
     * 队伍思想状况
     */
    @Column(name = "team_thinking_info")
    private String teamThinkingInfo;

    /**
     * 队伍特色亮点及存在问题
     */
    @Column(name = "team_advantage_problem")
    private String teamAdvantageProblem;

    /**
     * 主要措施
     */
    @Column(name = "main_measure")
    private String mainMeasure;

    /**
     * 其他情况
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
     * 获取上报人id，关联user表id
     *
     * @return committer_id - 上报人id，关联user表id
     */
    public Integer getCommitterId() {
        return committerId;
    }

    /**
     * 设置上报人id，关联user表id
     *
     * @param committerId 上报人id，关联user表id
     */
    public void setCommitterId(Integer committerId) {
        this.committerId = committerId;
    }

    /**
     * 获取上报人姓名
     *
     * @return committer_name - 上报人姓名
     */
    public String getCommitterName() {
        return committerName;
    }

    /**
     * 设置上报人姓名
     *
     * @param committerName 上报人姓名
     */
    public void setCommitterName(String committerName) {
        this.committerName = committerName;
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
     * 获取单位名称
     *
     * @return organization_name - 单位名称
     */
    public String getOrganizationName() {
        return organizationName;
    }

    /**
     * 设置单位名称
     *
     * @param organizationName 单位名称
     */
    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    /**
     * 获取月份
     *
     * @return time - 月份
     */
    public String getTime() {
        return time;
    }

    /**
     * 设置月份
     *
     * @param time 月份
     */
    public void setTime(String time) {
        this.time = time;
    }

    /**
     * 获取民警人数
     *
     * @return ploice_number - 民警人数
     */
    public Integer getPloiceNumber() {
        return ploiceNumber;
    }

    /**
     * 设置民警人数
     *
     * @param ploiceNumber 民警人数
     */
    public void setPloiceNumber(Integer ploiceNumber) {
        this.ploiceNumber = ploiceNumber;
    }

    /**
     * 获取党员人数
     *
     * @return party_number - 党员人数
     */
    public Integer getPartyNumber() {
        return partyNumber;
    }

    /**
     * 设置党员人数
     *
     * @param partyNumber 党员人数
     */
    public void setPartyNumber(Integer partyNumber) {
        this.partyNumber = partyNumber;
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
     * 获取遵纪情况
     *
     * @return obey_info - 遵纪情况
     */
    public String getObeyInfo() {
        return obeyInfo;
    }

    /**
     * 设置遵纪情况
     *
     * @param obeyInfo 遵纪情况
     */
    public void setObeyInfo(String obeyInfo) {
        this.obeyInfo = obeyInfo;
    }

    /**
     * 获取队伍思想状况
     *
     * @return team_thinking_info - 队伍思想状况
     */
    public String getTeamThinkingInfo() {
        return teamThinkingInfo;
    }

    /**
     * 设置队伍思想状况
     *
     * @param teamThinkingInfo 队伍思想状况
     */
    public void setTeamThinkingInfo(String teamThinkingInfo) {
        this.teamThinkingInfo = teamThinkingInfo;
    }

    /**
     * 获取队伍特色亮点及存在问题
     *
     * @return team_advantage_problem - 队伍特色亮点及存在问题
     */
    public String getTeamAdvantageProblem() {
        return teamAdvantageProblem;
    }

    /**
     * 设置队伍特色亮点及存在问题
     *
     * @param teamAdvantageProblem 队伍特色亮点及存在问题
     */
    public void setTeamAdvantageProblem(String teamAdvantageProblem) {
        this.teamAdvantageProblem = teamAdvantageProblem;
    }

    /**
     * 获取主要措施
     *
     * @return main_measure - 主要措施
     */
    public String getMainMeasure() {
        return mainMeasure;
    }

    /**
     * 设置主要措施
     *
     * @param mainMeasure 主要措施
     */
    public void setMainMeasure(String mainMeasure) {
        this.mainMeasure = mainMeasure;
    }

    /**
     * 获取其他情况
     *
     * @return other_info - 其他情况
     */
    public String getOtherInfo() {
        return otherInfo;
    }

    /**
     * 设置其他情况
     *
     * @param otherInfo 其他情况
     */
    public void setOtherInfo(String otherInfo) {
        this.otherInfo = otherInfo;
    }
}