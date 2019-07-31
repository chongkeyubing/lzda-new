package com.mwkj.lzda.vo;

/**
 * @Author: libaogang
 * @Date: 2019-07-31 11:11
 * @Description 奖励统计返回视图
 */
public class RewardStatisticVO {
    Integer organizationId;
    String organizationName;
    long honourNumber; //通报表扬
    long CommendationNumber; //嘉奖
    long ThirdNumber; //三等功
    long SecondNumber; //二等功
    long FirstNumber; //一等功
    long otherNumber; //其他
    long total;//总计

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

    public long getHonourNumber() {
        return honourNumber;
    }

    public void setHonourNumber(long honourNumber) {
        this.honourNumber = honourNumber;
    }

    public long getCommendationNumber() {
        return CommendationNumber;
    }

    public void setCommendationNumber(long commendationNumber) {
        CommendationNumber = commendationNumber;
    }

    public long getThirdNumber() {
        return ThirdNumber;
    }

    public void setThirdNumber(long thirdNumber) {
        ThirdNumber = thirdNumber;
    }

    public long getSecondNumber() {
        return SecondNumber;
    }

    public void setSecondNumber(long secondNumber) {
        SecondNumber = secondNumber;
    }

    public long getFirstNumber() {
        return FirstNumber;
    }

    public void setFirstNumber(long firstNumber) {
        FirstNumber = firstNumber;
    }

    public long getOtherNumber() {
        return otherNumber;
    }

    public void setOtherNumber(long otherNumber) {
        this.otherNumber = otherNumber;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }
}