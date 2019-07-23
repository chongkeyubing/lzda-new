package com.mwkj.lzda.dto;

import java.util.Date;

/**
 * @Author: libaogang
 * @Date: 2019-07-17 16:59
 * @Description 违惩公共属性，用于违惩管理页查询
 */
public class PunishDTO {
    private Integer userId;
    private String userName;
    private String policeCode;
    private Integer organizationId;
    private String organizationName;
    private Integer punishType;
    private Integer punishId;
    private Date createTime;
    private String operator;

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPoliceCode() {
        return policeCode;
    }

    public void setPoliceCode(String policeCode) {
        this.policeCode = policeCode;
    }

    public Integer getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(Integer organizationId) {
        this.organizationId = organizationId;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public Integer getPunishType() {
        return punishType;
    }

    public void setPunishType(Integer punishType) {
        this.punishType = punishType;
    }

    public Integer getPunishId() {
        return punishId;
    }

    public void setPunishId(Integer punishId) {
        this.punishId = punishId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}