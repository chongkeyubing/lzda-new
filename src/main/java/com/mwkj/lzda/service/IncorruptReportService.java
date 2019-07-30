package com.mwkj.lzda.service;

import java.util.Map;

public interface IncorruptReportService {
    Map<String,Object> getIncorruptReportParam(int userId,String beginTime,String endTime);
}
