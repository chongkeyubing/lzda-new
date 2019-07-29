package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.core.AbstractService;
import com.mwkj.lzda.dao.IncorruptMapper;
import com.mwkj.lzda.dto.IncorruptSelfSummaryDTO;
import com.mwkj.lzda.model.IncorruptSelfSummary;
import com.mwkj.lzda.service.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by CodeGenerator on 2019-07-26 15:01.
 */
@Service
@Transactional
public class IncorruptServiceImpl implements IncorruptService {
    @Resource
    private IncorruptMapper incorruptMapper;

    @Override
    public List<IncorruptSelfSummaryDTO> selectForPage(IncorruptSelfSummaryDTO incorruptSelfSummaryDTO){
        return incorruptMapper.selectForPage(incorruptSelfSummaryDTO);
    }

    @Override
    public void update(IncorruptSelfSummaryDTO incorruptSelfSummaryDTO) {
        incorruptMapper.update(incorruptSelfSummaryDTO);
    }
}
