package com.mwkj.lzda.service;
import com.mwkj.lzda.model.PunReport;
import com.mwkj.lzda.core.Service;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by CodeGenerator on 2019-07-19 14:37.
 */
public interface PunReportService extends Service<PunReport> {

   void add(PunReport punReport , HttpServletRequest request);

   void update(PunReport punReport , HttpServletRequest request);

}
