package com.mwkj.lzda.service;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcHkMoInfo;
import com.mwkj.lzda.model.ArcPassportInfo;
import com.mwkj.lzda.core.Service;

import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-10 21:00
* @Description TODO
*/
public interface ArcPassportInfoService extends Service<ArcPassportInfo> {

    void add(ArcPassportInfo arcPassportInfo, Approve approve, HttpServletRequest request);

}
