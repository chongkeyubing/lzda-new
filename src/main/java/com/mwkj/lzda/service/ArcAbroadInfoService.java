package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcAbroadInfo;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-11 10:51
* @Description TODO
*/
public interface ArcAbroadInfoService extends Service<ArcAbroadInfo> {
    void add(ArcAbroadInfo arcAbroadInfo, Approve approve, HttpServletRequest request);
}
