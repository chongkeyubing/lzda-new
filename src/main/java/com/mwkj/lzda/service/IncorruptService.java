package com.mwkj.lzda.service;

import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.dto.IncorruptSelfSummaryDTO;

import java.util.List;


public interface IncorruptService{

    List<IncorruptSelfSummaryDTO> selectForPage(IncorruptSelfSummaryDTO incorruptSelfSummaryDTO);

    void update(IncorruptSelfSummaryDTO incorruptSelfSummaryDTO);
}
