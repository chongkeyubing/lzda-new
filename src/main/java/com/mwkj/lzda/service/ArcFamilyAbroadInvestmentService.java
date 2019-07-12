package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcFamilyAbroadInvestment;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-12 09:28
* @Description TODO
*/
public interface ArcFamilyAbroadInvestmentService extends Service<ArcFamilyAbroadInvestment> {
    void add(ArcFamilyAbroadInvestment arcFamilyAbroadInvestment, Approve approve, HttpServletRequest request);
}
