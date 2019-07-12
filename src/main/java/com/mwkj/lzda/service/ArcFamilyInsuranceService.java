package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcFamilyInsurance;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-11 17:50
* @Description TODO
*/
public interface ArcFamilyInsuranceService extends Service<ArcFamilyInsurance> {
    void add(ArcFamilyInsurance arcFamilyInsurance, Approve approve, HttpServletRequest request);
}
