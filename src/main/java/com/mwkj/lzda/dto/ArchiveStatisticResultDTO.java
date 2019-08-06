package com.mwkj.lzda.dto;

/**
 * @Author: libaogang
 * @Date: 2019-07-26 16:52
 * @Description 档案类统计返回结果
 */
public class ArchiveStatisticResultDTO {
    private Integer organizationId;
    private String organizationName;
    private long count;

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

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }
}