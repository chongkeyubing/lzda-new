package com.mwkj.lzda.enu;

/**
 * @Author: libaogang
 * @Date: 2019-07-12 22:24
 * @Description 档案类型枚举
 */
public enum ArchiveTypeEnum {
    ARC_BASIC_INFO(1, "个人基本情况报备"),
    ARC_HK_MO_INFO(2, "本人持有港澳通行证情况登记表"),
    ARC_PASSPORT_INFO(3, "本人持有护照情况登记表"),
    ARC_MARRIAGE_INFO(4,"本人婚姻情况"),
    ARC_ORGANIZATION_MEETING(5,"参加单位组织生活会情况登记表"),
    ARC_BANQUET_APPLY(6,"操办宴席申请表  "),
    ARC_ABROAD_INFO(7,"出国（境）情况登记表"),
    ARC_AFFECT_BUSINESS(8,"可能影响公正执行职务报备表"),
    ARC_LEAVEOFFICE_HANDOVER(9,"离职交接情况登记表"),
    ARC_FAMILY_WORK(10,"配偶、子女及其配偶从业情况登记表"),
    ARC_FAMILY_ABROAD(11,"配偶、子女移居国（境）外的情况"),
    ARC_FAMILY_WORKABROAD(12,"配偶、子女连续在国（境）外工作、生活一年以上的情况"),
    ARC_FAMILY_CRIMINAL(13,"配偶、子女被司法机关追究刑事责任的情况"),
    ARC_FAMILY_STOCK(14,"本人、配偶、共同生活的子女持有股票的情况"),
    ARC_FAMILY_FUND(15,"本人、配偶、共同生活的子女持有基金的情况"),
    ARC_FAMILY_INSURANCE(16,"本人、配偶、共同生活的子女持有投资型保险的情况"),
    ARC_FAMILY_ABROAD_SAVINGS(17,"本人、配偶、共同生活的子女在国（境）外的存款情况"),
    ARC_FAMILY_ABROAD_INVESTMENT(18,"本人、配偶、共同生活的子女在国（境）外的投资情况"),
    ARC_PERSONAL_OTHER(19,"个人认为需要报告的其他事项"),
    ARC_FAMILY_MARRIAGE(20,"子女与港澳以及台湾居民通婚的情况"),
    ARC_POLICE_INVOLVE(21,"涉警报备表"),
    ARC_INCOME_INFO(22,"收入情况登记表"),
    ARC_GIFT_INFO(23,"收受礼品登记表"),
    ARC_PART_TIME_JOB(24,"在企业、中介组织和社会团体兼职"),
    ARC_HOUSE_INFO(25,"住房情况登记表"),
    ARC_FAMILY_ABROAD_MARRIAGE(26,"子女与外国人、无国籍人通婚的情况"),
    ARC_LOAN(27,"借贷（担保）登记表");


    private final int archiveType;
    private final String archiveName;


    ArchiveTypeEnum(final int archiveType, String archiveName) {
        this.archiveType = archiveType;
        this.archiveName = archiveName;

    }


    public int archiveType() {
        return this.archiveType;
    }

    public String archiveName() {
        return this.archiveName;
    }
    }