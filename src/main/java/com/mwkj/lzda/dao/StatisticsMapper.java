package com.mwkj.lzda.dao;

import com.mwkj.lzda.dto.ArchiveStatisticParamDTO;
import com.mwkj.lzda.dto.ArchiveStatisticResultDTO;

import java.util.List;
import java.util.Map;

/**
 * @Author libaogang
 * @Date 2019-07-26 16:40
 * @Description 统计
 */
public interface StatisticsMapper {

    //涉警报备统计
    List<ArchiveStatisticResultDTO> statisticPoliceInvolve(ArchiveStatisticParamDTO archiveStatisticParamDTO);

}