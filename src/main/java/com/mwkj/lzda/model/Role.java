package com.mwkj.lzda.model;

import javax.persistence.*;

public class Role {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 角色名
     */
    private String rolename;

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
     * 获取角色名
     *
     * @return rolename - 角色名
     */
    public String getRolename() {
        return rolename;
    }

    /**
     * 设置角色名
     *
     * @param rolename 角色名
     */
    public void setRolename(String rolename) {
        this.rolename = rolename;
    }
}