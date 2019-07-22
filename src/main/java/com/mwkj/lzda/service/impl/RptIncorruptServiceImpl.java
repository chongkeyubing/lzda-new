package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.RptIncorruptMapper;
import com.mwkj.lzda.model.RptIncorrupt;
import com.mwkj.lzda.service.RptIncorruptService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by CodeGenerator on 2019-07-19 10:40.
 */
@Service
@Transactional
public class RptIncorruptServiceImpl extends AbstractService<RptIncorrupt> implements RptIncorruptService {
    @Resource
    private RptIncorruptMapper rptIncorruptMapper;

    @Override
    public List<RptIncorrupt> selectForPage(RptIncorrupt rptIncorrupt) {
        return rptIncorruptMapper.selectForPage(rptIncorrupt);
    }
}
