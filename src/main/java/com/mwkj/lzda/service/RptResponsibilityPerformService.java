package com.mwkj.lzda.service;
import com.mwkj.lzda.model.RptResponsibilityPerform;
import com.mwkj.lzda.core.Service;

import java.util.List;


/**
 * Created by CodeGenerator on 2019-07-22 16:08.
 */
public interface RptResponsibilityPerformService extends Service<RptResponsibilityPerform> {
    List<RptResponsibilityPerform> selectForPage(RptResponsibilityPerform rptResponsibilityPerform);
    long selectCount(RptResponsibilityPerform rptResponsibilityPerform);
}
