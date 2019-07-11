package com.mwkj.lzda.service;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcBasicInfo;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.vo.BasicInfoVo;

import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-11 09:31
* @Description TODO
*/
public interface ArcBasicInfoService extends Service<ArcBasicInfo> {
    void add(BasicInfoVo basicInfoVo, Approve approve, HttpServletRequest request);
}
