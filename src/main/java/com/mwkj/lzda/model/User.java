package com.mwkj.lzda.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import javax.persistence.*;

public class User {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 角色id
     */
    private Integer roleid;

    /**
     * 密码
     */
    private String password;

    /**
     * 真实姓名
     */
    private String realname;

    /**
     * 性别：男  女
     */
    private String gender;

    @Transient
    private String role;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    /**
     * 出生日期
     */
    private String birthday;


    /**
     * 身份证
     */
    @Column(name = "identity_number")
    private String identityNumber;

    /**
     * 工作单位id，关联organization表id
     */
    @Column(name = "organization_id")
    private Integer organizationId;

    /**
     * 工作单位名称，冗余以避免关联查询
     */
    @Column(name = "organization_name")
    private String organizationName;

    /**
     * 警号
     */
    @Column(name = "police_code")
    private String policeCode;

    /**
     * 职位
     */
    @Column(name = "job_position")
    private String jobPosition;

    /**
     * 是否有效：0无效1有效
     */
    private Integer active;

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
     * 获取角色id
     *
     * @return roleid - 角色id
     */
    public Integer getRoleid() {
        return roleid;
    }

    /**
     * 设置角色id
     *
     * @param roleid 角色id
     */
    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    /**
     * 获取密码
     *
     * @return password - 密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置密码
     *
     * @param password 密码
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获取真实姓名
     *
     * @return realname - 真实姓名
     */
    public String getRealname() {
        return realname;
    }

    /**
     * 设置真实姓名
     *
     * @param realname 真实姓名
     */
    public void setRealname(String realname) {
        this.realname = realname;
    }


    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * 获取身份证
     *
     * @return identity_number - 身份证
     */
    public String getIdentityNumber() {
        return identityNumber;
    }

    /**
     * 设置身份证
     *
     * @param identityNumber 身份证
     */
    public void setIdentityNumber(String identityNumber) {
        this.identityNumber = identityNumber;
    }

    /**
     * 获取工作单位id，关联organization表id
     *
     * @return organization_id - 工作单位id，关联organization表id
     */
    public Integer getOrganizationId() {
        return organizationId;
    }

    /**
     * 设置工作单位id，关联organization表id
     *
     * @param organizationId 工作单位id，关联organization表id
     */
    public void setOrganizationId(Integer organizationId) {
        this.organizationId = organizationId;
    }

    /**
     * 获取警号
     *
     * @return police_code - 警号
     */
    public String getPoliceCode() {
        return policeCode;
    }

    /**
     * 设置警号
     *
     * @param policeCode 警号
     */
    public void setPoliceCode(String policeCode) {
        this.policeCode = policeCode;
    }

    /**
     * 获取职位
     *
     * @return job_positon - 职位
     */
    public String getJobPosition() {
        return jobPosition;
    }

    /**
     * 设置职位
     *
     * @param jobPosition 职位
     */
    public void setJobPosition(String jobPosition) {
        this.jobPosition = jobPosition;
    }

    /**
     * 获取是否有效：0无效1有效
     *
     * @return active - 是否有效：0无效1有效
     */
    public Integer getActive() {
        return active;
    }

    /**
     * 设置是否有效：0无效1有效
     *
     * @param active 是否有效：0无效1有效
     */
    public void setActive(Integer active) {
        this.active = active;
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


    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", roleid=" + roleid +
                ", password='" + password + '\'' +
                ", realname='" + realname + '\'' +
                ", gender=" + gender +
                ", birthday=" + birthday +
                ", identityNumber='" + identityNumber + '\'' +
                ", organizationId=" + organizationId +
                ", organizationName='" + organizationName + '\'' +
                ", policeCode='" + policeCode + '\'' +
                ", jobPosition='" + jobPosition + '\'' +
                ", active=" + active +
                ", createTime=" + createTime +
                '}';
    }
}