package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "rpt_responsibility_perform")
public class RptResponsibilityPerform {
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
     * 时间
     */
    private String time;

    /**
     * 地点
     */
    private String address;

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
     * 参加人员
     */
    private String participants;

    /**
     * 标题
     */
    private String title;

    /**
     * 内容
     */
    private String content;

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
     * 获取时间
     *
     * @return time - 时间
     */
    public String getTime() {
        return time;
    }

    /**
     * 设置时间
     *
     * @param time 时间
     */
    public void setTime(String time) {
        this.time = time;
    }

    /**
     * 获取地点
     *
     * @return address - 地点
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置地点
     *
     * @param address 地点
     */
    public void setAddress(String address) {
        this.address = address;
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

    /**
     * 获取参加人员
     *
     * @return participants - 参加人员
     */
    public String getParticipants() {
        return participants;
    }

    /**
     * 设置参加人员
     *
     * @param participants 参加人员
     */
    public void setParticipants(String participants) {
        this.participants = participants;
    }

    /**
     * 获取标题
     *
     * @return title - 标题
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置标题
     *
     * @param title 标题
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 获取内容
     *
     * @return content - 内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置内容
     *
     * @param content 内容
     */
    public void setContent(String content) {
        this.content = content;
    }
}