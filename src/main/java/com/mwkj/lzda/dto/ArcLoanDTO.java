package com.mwkj.lzda.dto;

import com.mwkj.lzda.model.ArcLoan;
import com.mwkj.lzda.model.ArcLoanRela;

import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-24 10:38
 * @Description 接受借贷（担保）表单参数,返回接受借贷（担保）详情
 */
public class ArcLoanDTO {

    private ArcLoan arcLoan;

    //借出
    private List<ArcLoanRela> loans;

    //借入
    private List<ArcLoanRela> borrows;

    //担保
    private List<ArcLoanRela> assures;

    //经营活动（公司）
    private List<ArcLoanRela> activitys;

    public ArcLoan getArcLoan() {
        return arcLoan;
    }

    public void setArcLoan(ArcLoan arcLoan) {
        this.arcLoan = arcLoan;
    }

    public List<ArcLoanRela> getLoans() {
        return loans;
    }

    public void setLoans(List<ArcLoanRela> loans) {
        this.loans = loans;
    }

    public List<ArcLoanRela> getBorrows() {
        return borrows;
    }

    public void setBorrows(List<ArcLoanRela> borrows) {
        this.borrows = borrows;
    }

    public List<ArcLoanRela> getAssures() {
        return assures;
    }

    public void setAssures(List<ArcLoanRela> assures) {
        this.assures = assures;
    }

    public List<ArcLoanRela> getActivitys() {
        return activitys;
    }

    public void setActivitys(List<ArcLoanRela> activitys) {
        this.activitys = activitys;
    }
}