package com.mwkj.lzda.dto;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import java.util.Date;

/**
 * @Author: libaogang
 * @Date: 2019-07-13 15:23
 * @Description TODO
 */
public class OperateLogDTO {

    private String operatorName;

    private String operatorCode;

    private String operatorIp;

    private String archiveOwnerName;

    private String operateObject;

    private String operateType;

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }

    public String getOperatorCode() {
        return operatorCode;
    }

    public void setOperatorCode(String operatorCode) {
        this.operatorCode = operatorCode;
    }

    public String getOperatorIp() {
        return operatorIp;
    }

    public void setOperatorIp(String operatorIp) {
        this.operatorIp = operatorIp;
    }

    public String getArchiveOwnerName() {
        return archiveOwnerName;
    }

    public void setArchiveOwnerName(String archiveOwnerName) {
        this.archiveOwnerName = archiveOwnerName;
    }

    public String getOperateObject() {
        return operateObject;
    }

    public void setOperateObject(String operateObject) {
        this.operateObject = operateObject;
    }

    public String getOperateType() {
        return operateType;
    }

    public void setOperateType(String operateType) {
        this.operateType = operateType;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    private Date createTime;

}