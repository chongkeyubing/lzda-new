package com.mwkj.lzda.dao;

import com.mwkj.lzda.core.Mapper;
import com.mwkj.lzda.dto.IncorruptSelfSummaryDTO;

import java.util.List;

public interface IncorruptMapper{

    List<IncorruptSelfSummaryDTO> selectForPage(IncorruptSelfSummaryDTO incorruptSelfSummaryDTO);

    void update(IncorruptSelfSummaryDTO incorruptSelfSummaryDTO);

}