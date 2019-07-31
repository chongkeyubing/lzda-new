package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.StatisticsMapper;
import com.mwkj.lzda.dto.ArchiveStatisticParamDTO;
import com.mwkj.lzda.dto.ArchiveStatisticResultDTO;
import com.mwkj.lzda.service.StatisticService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-26 16:42
 * @Description 统计
 */
@Service
@Transactional
public class StatisticServiceImpl implements StatisticService {
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

    /**
    * 方法实现说明
    * @author      zzy
    * @Description:(收受礼品统计)
    * @date        2019/7/29/029 15:19
    */
    @Override
    public List<ArchiveStatisticResultDTO> statisticAcceptGifts(ArchiveStatisticParamDTO archiveStatisticParamDTO) {
        return statisticsMapper.statisticAcceptGifts(archiveStatisticParamDTO);
    }

    /**
    * 方法实现说明
    * @author      zzy
    * @Description:(操办宴席)
    * @date        2019/7/30/030 9:15
    */
    @Override
    public List<ArchiveStatisticResultDTO> statisticBanquetApply(ArchiveStatisticParamDTO archiveStatisticParamDTO) {
        return statisticsMapper.statisticBanquetApply(archiveStatisticParamDTO);
    }

    /**
    * 方法实现说明
    * @author      zzy
    * @Description:(家人被追究刑事责任统计)
    * @date        2019/7/30/030 11:16
    */
    @Override
    public List<ArchiveStatisticResultDTO> statisticFamilyCriminal(ArchiveStatisticParamDTO archiveStatisticParamDTO) {
        return statisticsMapper.statisticFamilyCriminal(archiveStatisticParamDTO);
    }

    /**
    * 方法实现说明
    * @author      zzy
    * @Description:(可能影响公务执行职务统计)
    * @date        2019/7/30/030 14:11
    */
    @Override
    public List<ArchiveStatisticResultDTO> statisticAffectBusiness(ArchiveStatisticParamDTO archiveStatisticParamDTO) {
        return statisticsMapper.statisticAffectBusiness(archiveStatisticParamDTO);
    }

    /**
    * 方法实现说明
    * @author      zzy
    * @Description:(信访统计)
    * @date        2019/7/31/031 9:14
    */
    @Override
    public List<ArchiveStatisticResultDTO> statisticPunReport(ArchiveStatisticParamDTO archiveStatisticParamDTO) {
        return statisticsMapper.statisticPunReport(archiveStatisticParamDTO);
    }
}