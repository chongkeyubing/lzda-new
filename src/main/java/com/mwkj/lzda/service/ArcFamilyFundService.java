package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcFamilyFund;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-11 17:31
* @Description TODO
*/
public interface ArcFamilyFundService extends Service<ArcFamilyFund> {
    void add(ArcFamilyFund arcFamilyFund, Approve approve, HttpServletRequest request);
}
