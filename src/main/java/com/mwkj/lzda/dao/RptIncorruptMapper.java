package com.mwkj.lzda.dao;

import com.mwkj.lzda.core.Mapper;
import com.mwkj.lzda.model.RptIncorrupt;

import java.util.List;

public interface RptIncorruptMapper extends Mapper<RptIncorrupt> {
    List<RptIncorrupt> selectForPage(RptIncorrupt rptIncorrupt);
}