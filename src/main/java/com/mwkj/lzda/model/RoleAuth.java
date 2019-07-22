package com.mwkj.lzda.model;

import javax.persistence.*;

@Table(name = "role_auth")
public class RoleAuth {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 权限id
     */
    private Integer aid;

    /**
     * 角色id
     */
    private Integer rid;

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
     * 获取权限id
     *
     * @return aid - 权限id
     */
    public Integer getAid() {
        return aid;
    }

    /**
     * 设置权限id
     *
     * @param aid 权限id
     */
    public void setAid(Integer aid) {
        this.aid = aid;
    }

    /**
     * 获取角色id
     *
     * @return rid - 角色id
     */
    public Integer getRid() {
        return rid;
    }

    /**
     * 设置角色id
     *
     * @param rid 角色id
     */
    public void setRid(Integer rid) {
        this.rid = rid;
    }
}