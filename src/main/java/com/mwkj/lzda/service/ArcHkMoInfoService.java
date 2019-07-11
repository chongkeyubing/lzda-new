package com.mwkj.lzda.service;

import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcHkMoInfo;
import com.mwkj.lzda.core.Service;

import javax.servlet.http.HttpServletRequest;


/**
 * @Author: libaogang
 * @Date: 2019-07-09 14:06
 * @Description TODO
 */
public interface ArcHkMoInfoService extends Service<ArcHkMoInfo> {

    void add(ArcHkMoInfo arcHkMoInfo, Approve approve, HttpServletRequest request);

}
