package com.mwkj.lzda.dto;

import javax.persistence.Column;
import javax.persistence.Transient;
import java.util.Date;

/**
 * @Author: libaogang
 * @Date: 2019-07-25 17:11
 * @Description TODO
 */
public class RewardDTO {
    private Integer id;

    /**
     * 关联user表id
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 单位id
     */
    @Column(name = "organization_id")
    private Integer organizationId;

    /**
     * 被表彰人姓名
     */
    @Column(name = "user_name")
    private String userName;

    @Transient
    private String policeCode;

    public String getPoliceCode() {
        return policeCode;
    }

    public void setPoliceCode(String policeCode) {
        this.policeCode = policeCode;
    }

    /**
     * 职务
     */
    @Column(name = "job_position")
    private String jobPosition;

    /**
     * 单位名称
     */
    private String organization;

    /**
     * 表彰类型
     */
    @Column(name = "reward_type")
    private String rewardType;

    /**
     * 表彰时间
     */
    @Column(name = "reward_time")
    private String rewardTime;

    /**
     * 表彰单位
     */
    @Column(name = "reward_organization")
    private String rewardOrganization;

    /**
     * 附件uuid，关联附件表sourceId
     */
    @Column(name = "attachment_id")
    private String attachmentId;

    /**
     * 操作者姓名
     */
    @Column(name = "operator_name")
    private String operatorName;

    /**
     * 操作者id
     */
    @Column(name = "operator_id")
    private Integer operatorId;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 表彰内容
     */
    private String content;

    /**
     * 备注
     */
    private String remark;
}