package com.mwkj.lzda.service;
import com.mwkj.lzda.dto.RptResponsibilityReportDTO;
import com.mwkj.lzda.model.RptResponsibilityReport;
import com.mwkj.lzda.core.Service;

import javax.servlet.http.HttpServletRequest;


/**
 * Created by CodeGenerator on 2019-07-22 10:17.
 */
public interface RptResponsibilityReportService extends Service<RptResponsibilityReport> {
    void add(RptResponsibilityReportDTO rptResponsibilityReportDTO, HttpServletRequest request);
    void update(RptResponsibilityReportDTO rptResponsibilityReportDTO, HttpServletRequest request);
}
