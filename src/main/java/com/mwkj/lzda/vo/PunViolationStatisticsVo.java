package com.mwkj.lzda.vo;

import java.io.Serializable;

/**
 * @ClassName: PunViolationStatisticsVo
 * @Description: 违纪统计表VO
 * @Author: wj
 * @Date: 2019-7-26 18:37
 **/
public class PunViolationStatisticsVo implements Serializable {
    private static final long serialVersionUID = 4412005249688957612L;

    private int index;

    /**
     * 单位名称
     */
    private String dwmc;

    /**
     * 单位ID
     */
    private Integer orgId;

    /**
     * 警告人数
     */
    private Integer jgCount = 0;

    /**
     * 记过人数
     */
    private Integer jguoCount= 0;

    /**
     * 记大过人数
     */
    private Integer jdgCount= 0;

    /**
     * 降级人数
     */
    private Integer jjCount= 0;

    /**
     * 撤职人数
     */
    private Integer czCount= 0;

    /**
     * 开除人数
     */
    private Integer kcCount= 0;

    /**
     * 政务处分小计
     */
    private Integer zwcfCount= 0;

    /**
     * 警告人数
     */
    private Integer djcfJgCount= 0;

    /**
     * 严重警告人数
     */
    private Integer yzjgCount= 0;

    /**
     * 撤销党内职务人数
     */
    private Integer cxdnzwCount= 0;

    /**
     * 留党察看人数
     */
    private Integer ldckCount= 0;

    /**
     * 开除党籍人数
     */
    private Integer kcdjCount= 0;

    /**
     * 党纪处分小计
     */
    private Integer djcfCount= 0;

    /**
     * 通报人数
     */
    private Integer tbCount= 0;

    /**
     * 诫勉谈话人数
     */
    private Integer jmthCount= 0;

    /**
     * 停职检查人数
     */
    private Integer tzjcCount= 0;

    /**
     * 调整职务人数
     */
    private Integer tzzwCount= 0;

    /**
     * 责令辞职人数
     */
    private Integer zlczCount= 0;

    /**
     * 降职人数
     */
    private Integer jzCount= 0;

    /**
     * 免职人数
     */
    private Integer mzCount= 0;

    /**
     * 问责小计
     */
    private Integer wzCount= 0;

    /**
     * 分局通报人数
     */
    private Integer fjtbCount= 0;

    /**
     * 提醒谈话人数
     */
    private Integer txthCount= 0;

    /**
     * 书面检查人数
     */
    private Integer smjcCount= 0;

    /**
     * 扣分人数
     */
    private Integer kfCount= 0;

    /**
     * 违规小计
     */
    private Integer wgCount= 0;

    /**
     * 移交司法机关的人数
     */
    private Integer yjsfjgCount= 0;

    /**
     * 未移交司法机关的人数
     */
    private Integer wyjsfjgCount= 0;

    /**
     * 违法小计
     */
    private Integer wfCount= 0;


    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String getDwmc() {
        return dwmc;
    }

    public void setDwmc(String dwmc) {
        this.dwmc = dwmc;
    }

    public Integer getOrgId() {
        return orgId;
    }

    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    public Integer getJgCount() {
        return jgCount;
    }

    public void setJgCount(Integer jgCount) {
        this.jgCount = jgCount;
    }

    public Integer getJguoCount() {
        return jguoCount;
    }

    public void setJguoCount(Integer jguoCount) {
        this.jguoCount = jguoCount;
    }

    public Integer getJdgCount() {
        return jdgCount;
    }

    public void setJdgCount(Integer jdgCount) {
        this.jdgCount = jdgCount;
    }

    public Integer getJjCount() {
        return jjCount;
    }

    public void setJjCount(Integer jjCount) {
        this.jjCount = jjCount;
    }

    public Integer getCzCount() {
        return czCount;
    }

    public void setCzCount(Integer czCount) {
        this.czCount = czCount;
    }

    public Integer getKcCount() {
        return kcCount;
    }

    public void setKcCount(Integer kcCount) {
        this.kcCount = kcCount;
    }

    public Integer getZwcfCount() {
        return zwcfCount;
    }

    public void setZwcfCount(Integer zwcfCount) {
        this.zwcfCount = zwcfCount;
    }

    public Integer getDjcfJgCount() {
        return djcfJgCount;
    }

    public void setDjcfJgCount(Integer djcfJgCount) {
        this.djcfJgCount = djcfJgCount;
    }

    public Integer getYzjgCount() {
        return yzjgCount;
    }

    public void setYzjgCount(Integer yzjgCount) {
        this.yzjgCount = yzjgCount;
    }

    public Integer getCxdnzwCount() {
        return cxdnzwCount;
    }

    public void setCxdnzwCount(Integer cxdnzwCount) {
        this.cxdnzwCount = cxdnzwCount;
    }

    public Integer getLdckCount() {
        return ldckCount;
    }

    public void setLdckCount(Integer ldckCount) {
        this.ldckCount = ldckCount;
    }

    public Integer getKcdjCount() {
        return kcdjCount;
    }

    public void setKcdjCount(Integer kcdjCount) {
        this.kcdjCount = kcdjCount;
    }

    public Integer getDjcfCount() {
        return djcfCount;
    }

    public void setDjcfCount(Integer djcfCount) {
        this.djcfCount = djcfCount;
    }

    public Integer getTbCount() {
        return tbCount;
    }

    public void setTbCount(Integer tbCount) {
        this.tbCount = tbCount;
    }

    public Integer getJmthCount() {
        return jmthCount;
    }

    public void setJmthCount(Integer jmthCount) {
        this.jmthCount = jmthCount;
    }

    public Integer getTzjcCount() {
        return tzjcCount;
    }

    public void setTzjcCount(Integer tzjcCount) {
        this.tzjcCount = tzjcCount;
    }

    public Integer getTzzwCount() {
        return tzzwCount;
    }

    public void setTzzwCount(Integer tzzwCount) {
        this.tzzwCount = tzzwCount;
    }

    public Integer getZlczCount() {
        return zlczCount;
    }

    public void setZlczCount(Integer zlczCount) {
        this.zlczCount = zlczCount;
    }

    public Integer getJzCount() {
        return jzCount;
    }

    public void setJzCount(Integer jzCount) {
        this.jzCount = jzCount;
    }

    public Integer getMzCount() {
        return mzCount;
    }

    public void setMzCount(Integer mzCount) {
        this.mzCount = mzCount;
    }

    public Integer getWzCount() {
        return wzCount;
    }

    public void setWzCount(Integer wzCount) {
        this.wzCount = wzCount;
    }

    public Integer getFjtbCount() {
        return fjtbCount;
    }

    public void setFjtbCount(Integer fjtbCount) {
        this.fjtbCount = fjtbCount;
    }

    public Integer getTxthCount() {
        return txthCount;
    }

    public void setTxthCount(Integer txthCount) {
        this.txthCount = txthCount;
    }

    public Integer getSmjcCount() {
        return smjcCount;
    }

    public void setSmjcCount(Integer smjcCount) {
        this.smjcCount = smjcCount;
    }

    public Integer getKfCount() {
        return kfCount;
    }

    public void setKfCount(Integer kfCount) {
        this.kfCount = kfCount;
    }

    public Integer getWgCount() {
        return wgCount;
    }

    public void setWgCount(Integer wgCount) {
        this.wgCount = wgCount;
    }

    public Integer getYjsfjgCount() {
        return yjsfjgCount;
    }

    public void setYjsfjgCount(Integer yjsfjgCount) {
        this.yjsfjgCount = yjsfjgCount;
    }

    public Integer getWyjsfjgCount() {
        return wyjsfjgCount;
    }

    public void setWyjsfjgCount(Integer wyjsfjgCount) {
        this.wyjsfjgCount = wyjsfjgCount;
    }

    public Integer getWfCount() {
        return wfCount;
    }

    public void setWfCount(Integer wfCount) {
        this.wfCount = wfCount;
    }

    @Override
    public String toString() {
        return "PunViolationStatisticsVo{" +
                "dwmc='" + dwmc + '\'' +
                ", jgCount=" + jgCount +
                ", jguoCount=" + jguoCount +
                ", jdgCount=" + jdgCount +
                ", jjCount=" + jjCount +
                ", czCount=" + czCount +
                ", kcCount=" + kcCount +
                ", zwcfCount=" + zwcfCount +
                ", djcfJgCount=" + djcfJgCount +
                ", yzjgCount=" + yzjgCount +
                ", cxdnzwCount=" + cxdnzwCount +
                ", ldckCount=" + ldckCount +
                ", kcdjCount=" + kcdjCount +
                ", djcfCount=" + djcfCount +
                ", tbCount=" + tbCount +
                ", jmthCount=" + jmthCount +
                ", tzjcCount=" + tzjcCount +
                ", tzzwCount=" + tzzwCount +
                ", zlczCount=" + zlczCount +
                ", jzCount=" + jzCount +
                ", mzCount=" + mzCount +
                ", wzCount=" + wzCount +
                ", fjtbCount=" + fjtbCount +
                ", txthCount=" + txthCount +
                ", smjcCount=" + smjcCount +
                ", kfCount=" + kfCount +
                ", wgCount=" + wgCount +
                ", yjsfjgCount=" + yjsfjgCount +
                ", wyjsfjgCount=" + wyjsfjgCount +
                ", wfCount=" + wfCount +
                '}';
    }

}
