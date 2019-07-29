package com.mwkj.lzda.model;

import javax.persistence.*;

@Table(name = "incorrupt_self_summary")
public class IncorruptSelfSummary {
    /**
     * 主键id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 用户id，关联user表id
     */
    @Column(name = "userId")
    private Integer userid;

    /**
     * 廉政自律小结
     */
    private String summary;

    /**
     * 获取主键id
     *
     * @return id - 主键id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置主键id
     *
     * @param id 主键id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取用户id，关联user表id
     *
     * @return userId - 用户id，关联user表id
     */
    public Integer getUserid() {
        return userid;
    }

    /**
     * 设置用户id，关联user表id
     *
     * @param userid 用户id，关联user表id
     */
    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    /**
     * 获取廉政自律小结
     *
     * @return summary - 廉政自律小结
     */
    public String getSummary() {
        return summary;
    }

    /**
     * 设置廉政自律小结
     *
     * @param summary 廉政自律小结
     */
    public void setSummary(String summary) {
        this.summary = summary;
    }
}