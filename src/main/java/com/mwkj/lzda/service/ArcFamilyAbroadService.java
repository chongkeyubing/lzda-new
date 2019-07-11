package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcFamilyAbroad;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-11 14:47
* @Description TODO
*/
public interface ArcFamilyAbroadService extends Service<ArcFamilyAbroad> {
    void add(ArcFamilyAbroad arcFamilyAbroad, Approve approve, HttpServletRequest request);
}
