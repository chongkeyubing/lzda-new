package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcGiftInfo;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-12 12:19
* @Description TODO
*/
public interface ArcGiftInfoService extends Service<ArcGiftInfo> {
    void add(ArcGiftInfo arcGiftInfo, Approve approve, HttpServletRequest request);
}
