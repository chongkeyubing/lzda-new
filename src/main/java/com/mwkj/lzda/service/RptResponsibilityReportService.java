package com.mwkj.lzda.service;
import com.mwkj.lzda.model.RptResponsibilityReport;
import com.mwkj.lzda.core.Service;

import javax.servlet.http.HttpServletRequest;


/**
 * Created by CodeGenerator on 2019-07-22 10:17.
 */
public interface RptResponsibilityReportService extends Service<RptResponsibilityReport> {
    void add(RptResponsibilityReport rptResponsibilityReport, HttpServletRequest request);
    void update(RptResponsibilityReport rptResponsibilityReport, HttpServletRequest request);
}
