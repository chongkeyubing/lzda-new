package com.mwkj.lzda.vo;

import com.mwkj.lzda.model.ArcBasicInfo;
import com.mwkj.lzda.model.ArcFamilySocietyRela;
import com.mwkj.lzda.model.User;

import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-03 10:47
 * @Description 接收前台提交个人基本情况报备表的参数
 */
public class BasicInfoVo {
    //基本情况
    private ArcBasicInfo arcBasicInfo;

    //家庭或重要社会关系
    private List<ArcFamilySocietyRela> arcs;

//    //审核人信息
//    private User approver;
//
//    public User getApprover() {
//        return approver;
//    }
//
//    public void setApprover(User approver) {
//        this.approver = approver;
//    }

    public ArcBasicInfo getArcBasicInfo() {
        return arcBasicInfo;
    }

    public void setArcBasicInfo(ArcBasicInfo arcBasicInfo) {
        this.arcBasicInfo = arcBasicInfo;
    }

    public List<ArcFamilySocietyRela> getArcs() {
        return arcs;
    }

    public void setArcs(List<ArcFamilySocietyRela> arcs) {
        this.arcs = arcs;
    }
}