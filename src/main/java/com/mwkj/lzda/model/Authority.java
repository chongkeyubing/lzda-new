package com.mwkj.lzda.model;

import javax.persistence.*;

public class Authority {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 权限名
     */
    private String name;

    /**
     * 权限标识
     */
    private String authflag;

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
     * 获取权限名
     *
     * @return name - 权限名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置权限名
     *
     * @param name 权限名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取权限标识
     *
     * @return authflag - 权限标识
     */
    public String getAuthflag() {
        return authflag;
    }

    /**
     * 设置权限标识
     *
     * @param authflag 权限标识
     */
    public void setAuthflag(String authflag) {
        this.authflag = authflag;
    }
}