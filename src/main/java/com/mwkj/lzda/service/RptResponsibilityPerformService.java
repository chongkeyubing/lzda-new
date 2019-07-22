package com.mwkj.lzda.service;

import com.mwkj.lzda.model.RptResponsibilityPerform;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.RptResponsibilityReport;

import javax.servlet.http.HttpServletRequest;


/**
 * @Author: libaogang
 * @Date: 2019-07-22 17:24
 * @Description todo
 */
public interface RptResponsibilityPerformService extends Service<RptResponsibilityPerform> {
    void add(RptResponsibilityPerform rptResponsibilityPerform, HttpServletRequest request);

    void update(RptResponsibilityPerform rptResponsibilityPerform, HttpServletRequest request);
}
