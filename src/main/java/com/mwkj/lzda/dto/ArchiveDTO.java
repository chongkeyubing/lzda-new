package com.mwkj.lzda.dto;

import java.util.Date;

/**
 * @Author: libaogang
 * @Date: 2019-07-02 11:06
 * @Description 档案公共属性，用于档案管理页的所有档案查询
 */
public class ArchiveDTO {
    private Integer userId;
    private String userName;
    private String policeCode;
    private Integer organizationId;
    private String organizationName;
    private Integer approveStatus;
    private Integer archiveType;
    private Integer archiveId;
    private Date createTime;

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



    public Integer getApproveStatus() {
        return approveStatus;
    }

    public void setApproveStatus(Integer approveStatus) {
        this.approveStatus = approveStatus;
    }

    public Integer getArchiveType() {
        return archiveType;
    }

    public void setArchiveType(Integer archiveType) {
        this.archiveType = archiveType;
    }

    public Integer getArchiveId() {
        return archiveId;
    }

    public void setArchiveId(Integer archiveId) {
        this.archiveId = archiveId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public Integer getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(Integer organizationId) {
        this.organizationId = organizationId;
    }

    @Override
    public String toString() {
        return "ArchiveDTO{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", policeCode='" + policeCode + '\'' +
                ", organizationId=" + organizationId +
                ", organizationName='" + organizationName + '\'' +
                ", approveStatus=" + approveStatus +
                ", archiveType=" + archiveType +
                ", archiveId=" + archiveId +
                ", createTime=" + createTime +
                '}';
    }
}