package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcPersonalOther;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-12 10:28
* @Description TODO
*/
public interface ArcPersonalOtherService extends Service<ArcPersonalOther> {
    void add(ArcPersonalOther arcPersonalOther, Approve approve, HttpServletRequest request);
}
