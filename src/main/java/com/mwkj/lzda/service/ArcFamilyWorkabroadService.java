package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcFamilyWorkabroad;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-11 15:49
* @Description TODO
*/
public interface ArcFamilyWorkabroadService extends Service<ArcFamilyWorkabroad> {
    void add(ArcFamilyWorkabroad arcFamilyWorkabroad, Approve approve, HttpServletRequest request);
}
