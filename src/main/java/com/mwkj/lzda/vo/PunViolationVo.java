package com.mwkj.lzda.vo;

import java.io.Serializable;

/**
 * @ClassName: PunViolationVo
 * @Description: 违纪信息实体类
 * @Author: wj
 * @Date: 2019-7-26 19:20
 **/
public class PunViolationVo implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;

    /**
     * 单位ID
     */
    private Integer orgId;

    /**
     * 单位名称
     */
    private String orgName;

    /**
     * 违规级别名称
     */
    private String violationLevelName;

    /**
     * 违规类型名称
     */
    private String violationTypeName;

    /**
     * 人数
     */
    private Integer count;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrgId() {
        return orgId;
    }

    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public String getViolationLevelName() {
        return violationLevelName;
    }

    public void setViolationLevelName(String violationLevelName) {
        this.violationLevelName = violationLevelName;
    }

    public String getViolationTypeName() {
        return violationTypeName;
    }

    public void setViolationTypeName(String violationTypeName) {
        this.violationTypeName = violationTypeName;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "PunViolationVo{" +
                "id=" + id +
                ", orgId=" + orgId +
                ", orgName='" + orgName + '\'' +
                ", violationLevelName='" + violationLevelName + '\'' +
                ", violationTypeName='" + violationTypeName + '\'' +
                ", count=" + count +
                '}';
    }
}
