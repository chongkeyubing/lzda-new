package com.mwkj.lzda.dao;

import com.mwkj.lzda.core.Mapper;
import com.mwkj.lzda.model.RptResponsibilityPerform;

import java.util.List;

public interface RptResponsibilityPerformMapper extends Mapper<RptResponsibilityPerform> {
    List<RptResponsibilityPerform> selectForPage(RptResponsibilityPerform rptResponsibilityPerformMapper);
    int selectCount(RptResponsibilityPerform rptResponsibilityPerform);
}