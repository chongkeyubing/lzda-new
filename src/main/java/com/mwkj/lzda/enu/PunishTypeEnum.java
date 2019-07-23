package com.mwkj.lzda.enu;

/**
 * @Author: libaogang
 * @Date: 2019-07-23 11:55
 * @Description 违惩表类型
 */
public enum PunishTypeEnum {

    PUN_VIOLATION(1, "一般干部违纪情况登记表"),
    PUN_ACCOUNTABILITY(2, "一般干部问责情况登记表"),
    PUN_GIFT(3, "一般干部收受礼品（金）上缴情况登记表"),
    PUN_TALK(4, "一般干部廉政谈话情况登记表"),
    PUN_NOTICE(5, "一般干部被通报情况登记表"),
    PUN_REPORT(6, "一般干部被群众信访举报情况登记表");

    private final int punishType;
    private final String punishName;

    PunishTypeEnum(final int punishType, String punishName) {
        this.punishType = punishType;
        this.punishName = punishName;

    }


    public int punishType() {
        return this.punishType;
    }

    public String punishName() {
        return this.punishName;
    }
}
