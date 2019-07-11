package com.mwkj.lzda.service;

import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcMarriageInfo;
import com.mwkj.lzda.core.Service;

import javax.servlet.http.HttpServletRequest;


/**
 * @Author: libaogang
 * @Date: 2019-07-10 22:15
 * @Description TODO
 */
public interface ArcMarriageInfoService extends Service<ArcMarriageInfo> {
    void add(ArcMarriageInfo arcMarriageInfo, Approve approve, HttpServletRequest request);
}
