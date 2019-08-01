package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.IncorruptSelfSummaryMapper;
import com.mwkj.lzda.model.IncorruptSelfSummary;
import com.mwkj.lzda.service.IncorruptSelfSummaryService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by CodeGenerator on 2019-07-26 16:39.
 */
@Service
@Transactional
public class IncorruptSelfSummaryServiceImpl extends AbstractService<IncorruptSelfSummary> implements IncorruptSelfSummaryService {
    @Resource
    private IncorruptSelfSummaryMapper incorruptSelfSummaryMapper;

}
