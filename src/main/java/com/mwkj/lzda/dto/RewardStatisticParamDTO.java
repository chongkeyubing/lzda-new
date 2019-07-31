package com.mwkj.lzda.dto;

/**
 * @Author: libaogang
 * @Date: 2019-07-31 10:45
 * @Description 奖励统计入参
 */
public class RewardStatisticParamDTO {
    String beginTime; //开始时间
    String endTime; //结束时间
    Integer organizationId;//单位id

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

    public Integer getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(Integer organizationId) {
        this.organizationId = organizationId;
    }
}