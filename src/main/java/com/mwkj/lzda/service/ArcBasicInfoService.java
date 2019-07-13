package com.mwkj.lzda.service;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcBasicInfo;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.dto.BasicInfoDTO;

import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-11 09:31
* @Description TODO
*/
public interface ArcBasicInfoService extends Service<ArcBasicInfo> {
    void add(BasicInfoDTO basicInfoDTO, Approve approve, HttpServletRequest request);
}
