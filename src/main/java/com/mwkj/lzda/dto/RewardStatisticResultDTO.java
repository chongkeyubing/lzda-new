package com.mwkj.lzda.dto;

/**
 * @Author: libaogang
 * @Date: 2019-07-31 10:45
 * @Description 奖励统计返回结果
 */
public class RewardStatisticResultDTO {
    Integer organizationId;
    String organizationName;
    String rewardType;
    long count;

    public String getRewardType() {
        return rewardType;
    }

    public void setRewardType(String rewardType) {
        this.rewardType = rewardType;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
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

}