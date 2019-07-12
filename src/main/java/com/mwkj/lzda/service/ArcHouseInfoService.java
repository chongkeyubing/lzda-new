package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcHouseInfo;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-12 14:40
* @Description TODO
*/
public interface ArcHouseInfoService extends Service<ArcHouseInfo> {
    void add(ArcHouseInfo arcHouseInfo, Approve approve, HttpServletRequest request);
}
