package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcAffectBusiness;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-11 11:22
* @Description TODO
*/
public interface ArcAffectBusinessService extends Service<ArcAffectBusiness> {
    void add(ArcAffectBusiness arcAffectBusiness, Approve approve, HttpServletRequest request);
}
