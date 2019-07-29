package com.mwkj.lzda.dto;

public class IncorruptSelfSummaryDTO {
    //小结表的用户id
    private Integer userId;
    //user表id
    private Integer id;
    //user表真实姓名
    private String realname;
    //小结
    private String summary;


    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }
}
