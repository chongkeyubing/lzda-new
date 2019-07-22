package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.RptResponsibilityPerformMapper;
import com.mwkj.lzda.model.RptResponsibilityPerform;
import com.mwkj.lzda.service.RptResponsibilityPerformService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by CodeGenerator on 2019-07-22 16:08.
 */
@Service
@Transactional
public class RptResponsibilityPerformServiceImpl extends AbstractService<RptResponsibilityPerform> implements RptResponsibilityPerformService {
    @Resource
    private RptResponsibilityPerformMapper rptResponsibilityPerformMapper;


    @Override
    public List<RptResponsibilityPerform> selectForPage(RptResponsibilityPerform rptResponsibilityPerform) {
        return rptResponsibilityPerformMapper.selectForPage(rptResponsibilityPerform);
    }

    @Override
    public long selectCount(RptResponsibilityPerform rptResponsibilityPerform) {
        return rptResponsibilityPerformMapper.selectCount(rptResponsibilityPerform);
    }
}
