package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "operate_log")
public class OperateLog {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 操作人id，关联user表id
     */
    @Column(name = "operator_id")
    private Integer operatorId;

    /**
     * 操作人姓名
     */
    @Column(name = "operator_name")
    private String operatorName;


    @Column(name = "operator_code")
    private String operatorCode;

    /**
     * 操作人真实ip
     */
    @Column(name = "operator_ip")
    private String operatorIp;

    /**
     * 表中人id、档案拥有者id，关联user表id

     */
    @Column(name = "archive_owner_id")
    private Integer archiveOwnerId;

    /**
     * 表中人姓名、档案拥有者姓名
     */
    @Column(name = "archive_owner_name")
    private String archiveOwnerName;

    /**
     * 操作对象：26类个人填报档案表、奖惩表、上报表、统计信息
     */
    @Column(name = "operate_object")
    private String operateObject;

    /**
     * 操作类型：0查看1添加2修改3删除4提交审核5审核通过6审核驳回7上报
     */
    @Column(name = "operate_type")
    private String operateType;

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
     * 获取操作人id，关联user表id
     *
     * @return operator_id - 操作人id，关联user表id
     */
    public Integer getOperatorId() {
        return operatorId;
    }

    /**
     * 设置操作人id，关联user表id
     *
     * @param operatorId 操作人id，关联user表id
     */
    public void setOperatorId(Integer operatorId) {
        this.operatorId = operatorId;
    }

    /**
     * 获取操作人姓名
     *
     * @return operator_name - 操作人姓名
     */
    public String getOperatorName() {
        return operatorName;
    }

    /**
     * 设置操作人姓名
     *
     * @param operatorName 操作人姓名
     */
    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }

    /**
     * 获取操作人真实ip
     *
     * @return operator_ip - 操作人真实ip
     */
    public String getOperatorIp() {
        return operatorIp;
    }

    /**
     * 设置操作人真实ip
     *
     * @param operatorIp 操作人真实ip
     */
    public void setOperatorIp(String operatorIp) {
        this.operatorIp = operatorIp;
    }

    /**
     * 获取表中人id、档案拥有者id，关联user表id

     *
     * @return archive_owner_id - 表中人id、档案拥有者id，关联user表id

     */
    public Integer getArchiveOwnerId() {
        return archiveOwnerId;
    }

    /**
     * 设置表中人id、档案拥有者id，关联user表id

     *
     * @param archiveOwnerId 表中人id、档案拥有者id，关联user表id

     */
    public void setArchiveOwnerId(Integer archiveOwnerId) {
        this.archiveOwnerId = archiveOwnerId;
    }

    /**
     * 获取表中人姓名、档案拥有者姓名
     *
     * @return archive_owner_name - 表中人姓名、档案拥有者姓名
     */
    public String getArchiveOwnerName() {
        return archiveOwnerName;
    }

    /**
     * 设置表中人姓名、档案拥有者姓名
     *
     * @param archiveOwnerName 表中人姓名、档案拥有者姓名
     */
    public void setArchiveOwnerName(String archiveOwnerName) {
        this.archiveOwnerName = archiveOwnerName;
    }

    /**
     * 获取操作对象：26类个人填报档案表、奖惩表、上报表、统计信息
     *
     * @return operate_object - 操作对象：26类个人填报档案表、奖惩表、上报表、统计信息
     */
    public String getOperateObject() {
        return operateObject;
    }

    /**
     * 设置操作对象：26类个人填报档案表、奖惩表、上报表、统计信息
     *
     * @param operateObject 操作对象：26类个人填报档案表、奖惩表、上报表、统计信息
     */
    public void setOperateObject(String operateObject) {
        this.operateObject = operateObject;
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

    public String getOperateType() {
        return operateType;
    }

    public void setOperateType(String operateType) {
        this.operateType = operateType;
    }

    public String getOperatorCode() {
        return operatorCode;
    }

    public void setOperatorCode(String operatorCode) {
        this.operatorCode = operatorCode;
    }
}