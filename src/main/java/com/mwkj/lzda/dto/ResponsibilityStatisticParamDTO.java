package com.mwkj.lzda.dto;

/**
 * @Author: libaogang
 * @Date: 2019-08-01 17:18
 * @Description 主体责任统计入参
 */
public class ResponsibilityStatisticParamDTO {
    private String year; //开始时间
    private Integer organizationId;//单位id
    private String quarter; //季度

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public Integer getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(Integer organizationId) {
        this.organizationId = organizationId;
    }

    public String getQuarter() {
        return quarter;
    }

    public void setQuarter(String quarter) {
        this.quarter = quarter;
    }
}