package com.mwkj.lzda.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import javax.persistence.*;

@Table(name = "arc_family_society_rela")
public class ArcFamilySocietyRela {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 关联arc_basic_info表id
     */
    @Column(name = "basic_info_id")
    private Integer basicInfoId;

    /**
     * 姓名
     */
    private String name;

    /**
     * 称谓
     */
    private String appellation;

    /**
     * 政治面貌：党员 群众 团员
     */
    @Column(name = "politic_face")
    private String politicFace;

    /**
     * 出生日期
     */
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date birthday;

    /**
     * 工作单位
     */
    private String organization;

    /**
     * 职务
     */
    @Column(name = "job_position")
    private String jobPosition;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 获取主键
     *
     * @return id - 主键
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置主键
     *
     * @param id 主键
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取关联arc_basic_info表id
     *
     * @return basic_info_id - 关联arc_basic_info表id
     */
    public Integer getBasicInfoId() {
        return basicInfoId;
    }

    /**
     * 设置关联arc_basic_info表id
     *
     * @param basicInfoId 关联arc_basic_info表id
     */
    public void setBasicInfoId(Integer basicInfoId) {
        this.basicInfoId = basicInfoId;
    }

    /**
     * 获取姓名
     *
     * @return name - 姓名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置姓名
     *
     * @param name 姓名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取称谓
     *
     * @return appellation - 称谓
     */
    public String getAppellation() {
        return appellation;
    }

    /**
     * 设置称谓
     *
     * @param appellation 称谓
     */
    public void setAppellation(String appellation) {
        this.appellation = appellation;
    }

    /**
     * 获取政治面貌：党员 群众 团员
     *
     * @return politic_face - 政治面貌：党员 群众 团员
     */
    public String getPoliticFace() {
        return politicFace;
    }

    /**
     * 设置政治面貌：党员 群众 团员
     *
     * @param politicFace 政治面貌：党员 群众 团员
     */
    public void setPoliticFace(String politicFace) {
        this.politicFace = politicFace;
    }

    /**
     * 获取出生日期
     *
     * @return birthday - 出生日期
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * 设置出生日期
     *
     * @param birthday 出生日期
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * 获取工作单位
     *
     * @return organization - 工作单位
     */
    public String getOrganization() {
        return organization;
    }

    /**
     * 设置工作单位
     *
     * @param organization 工作单位
     */
    public void setOrganization(String organization) {
        this.organization = organization;
    }

    /**
     * 获取职务
     *
     * @return job_position - 职务
     */
    public String getJobPosition() {
        return jobPosition;
    }

    /**
     * 设置职务
     *
     * @param jobPosition 职务
     */
    public void setJobPosition(String jobPosition) {
        this.jobPosition = jobPosition;
    }

    /**
     * 获取创建时间
     *
     * @return create_time - 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}