package com.mwkj.lzda.dto;

/**
 * @Author: libaogang
 * @Date: 2019-07-26 16:52
 * @Description 接受档案类统计的前台参数
 */
public class ArchiveStatisticParamDTO {
    String beginTime; //开始时间
    String endTime; //结束时间
    String organizationId;//单位id

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(String organizationId) {
        this.organizationId = organizationId;
    }
}