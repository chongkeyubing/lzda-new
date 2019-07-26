package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.StatisticsMapper;
import com.mwkj.lzda.dto.ArchiveStatisticParamDTO;
import com.mwkj.lzda.dto.ArchiveStatisticResultDTO;
import com.mwkj.lzda.service.StatisticsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Author: libaogang
 * @Date: 2019-07-26 16:42
 * @Description 统计
 */
@Service
@Transactional
public class StatisticsServiceImpl implements StatisticsService {
    @Resource
    private StatisticsMapper statisticsMapper;

    /**
     * @Author libaogang
     * @Date 2019-07-26 17:30
     * @Param [archiveStatisticParamDTO]
     * @return java.util.Map<java.lang.String,java.lang.String>
     * @Description 涉警报备统计
     */
    @Override
    public List<ArchiveStatisticResultDTO> statisticPoliceInvolve(ArchiveStatisticParamDTO archiveStatisticParamDTO) {
        return statisticsMapper.statisticPoliceInvolve(archiveStatisticParamDTO);
    }
}