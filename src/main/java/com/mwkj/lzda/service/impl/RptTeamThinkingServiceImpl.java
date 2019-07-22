package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.RptTeamThinkingMapper;
import com.mwkj.lzda.model.RptTeamThinking;
import com.mwkj.lzda.service.RptTeamThinkingService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019-07-22 16:16.
 */
@Service
@Transactional
public class RptTeamThinkingServiceImpl extends AbstractService<RptTeamThinking> implements RptTeamThinkingService {
    @Resource
    private RptTeamThinkingMapper rptTeamThinkingMapper;

}
