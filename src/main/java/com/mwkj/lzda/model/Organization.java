package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

public class Organization {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 单位名称
     */
    private String name;

    /**
     * 父单位id
     */
    @Column(name = "parent_id")
    private Integer parentId;

    /**
     * 是否有效，0：无效，1：有效
     */
    private Integer active;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 修改时间，自动更新
     */
    @Column(name = "update_time")
    private Date updateTime;

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
     * 获取单位名称
     *
     * @return name - 单位名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置单位名称
     *
     * @param name 单位名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取父单位id
     *
     * @return parent_id - 父单位id
     */
    public Integer getParentId() {
        return parentId;
    }

    /**
     * 设置父单位id
     *
     * @param parentId 父单位id
     */
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    /**
     * 获取是否有效，0：无效，1：有效
     *
     * @return active - 是否有效，0：无效，1：有效
     */
    public Integer getActive() {
        return active;
    }

    /**
     * 设置是否有效，0：无效，1：有效
     *
     * @param active 是否有效，0：无效，1：有效
     */
    public void setActive(Integer active) {
        this.active = active;
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
     * 获取修改时间，自动更新
     *
     * @return update_time - 修改时间，自动更新
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 设置修改时间，自动更新
     *
     * @param updateTime 修改时间，自动更新
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}