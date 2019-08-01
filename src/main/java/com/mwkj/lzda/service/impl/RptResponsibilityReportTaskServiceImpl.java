package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.RptResponsibilityReportTaskMapper;
import com.mwkj.lzda.model.RptResponsibilityReportTask;
import com.mwkj.lzda.service.RptResponsibilityReportTaskService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019-08-01 10:36.
 */
@Service
@Transactional
public class RptResponsibilityReportTaskServiceImpl extends AbstractService<RptResponsibilityReportTask> implements RptResponsibilityReportTaskService {
    @Resource
    private RptResponsibilityReportTaskMapper rptResponsibilityReportTaskMapper;

}
