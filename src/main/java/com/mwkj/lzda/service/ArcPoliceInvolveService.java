package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcPoliceInvolve;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-12 11:07
* @Description TODO
*/
public interface ArcPoliceInvolveService extends Service<ArcPoliceInvolve> {
    void add(ArcPoliceInvolve arcPoliceInvolve, Approve approve, HttpServletRequest request);
}
