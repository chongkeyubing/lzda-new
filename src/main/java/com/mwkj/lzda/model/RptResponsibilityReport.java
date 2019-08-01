package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "rpt_responsibility_report")
public class RptResponsibilityReport {
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
     * 年份
     */
    private String year;

    /**
     * 季度：第一二三四季度
     */
    private String quarter;


    /**
     * 附件id，一对多关联attachment
     */
    @Column(name = "attachment_id")
    private String attachmentId;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;


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
     * 获取年份
     *
     * @return year - 年份
     */
    public String getYear() {
        return year;
    }

    /**
     * 设置年份
     *
     * @param year 年份
     */
    public void setYear(String year) {
        this.year = year;
    }

    /**
     * 获取季度：第一二三四季度
     *
     * @return quarter - 季度：第一二三四季度
     */
    public String getQuarter() {
        return quarter;
    }

    /**
     * 设置季度：第一二三四季度
     *
     * @param quarter 季度：第一二三四季度
     */
    public void setQuarter(String quarter) {
        this.quarter = quarter;
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

}