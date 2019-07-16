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
    @Column(name = "sourceId")
    private String sourceid;

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
     * @return sourceId - 关联id
     */
    public String getSourceid() {
        return sourceid;
    }

    /**
     * 设置关联id
     *
     * @param sourceid 关联id
     */
    public void setSourceid(String sourceid) {
        this.sourceid = sourceid;
    }
}