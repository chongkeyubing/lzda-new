package com.mwkj.lzda.model;

import javax.persistence.*;

public class Attachment {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 附件url
     */
    private String url;

    /**
     * 关联id
     */
    @Column(name = "source_id")
    private String sourceId;

    /**
     * 缩略图url
     */
    @Column(name = "quick_url")
    private String quickUrl;

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
     * 获取附件url
     *
     * @return url - 附件url
     */
    public String getUrl() {
        return url;
    }

    /**
     * 设置附件url
     *
     * @param url 附件url
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * 获取关联id
     *
     * @return source_id - 关联id
     */
    public String getSourceId() {
        return sourceId;
    }

    /**
     * 设置关联id
     *
     * @param sourceId 关联id
     */
    public void setSourceId(String sourceId) {
        this.sourceId = sourceId;
    }

    /**
     * 获取缩略图url
     *
     * @return quick_url - 缩略图url
     */
    public String getQuickUrl() {
        return quickUrl;
    }

    /**
     * 设置缩略图url
     *
     * @param quickUrl 缩略图url
     */
    public void setQuickUrl(String quickUrl) {
        this.quickUrl = quickUrl;
    }
}