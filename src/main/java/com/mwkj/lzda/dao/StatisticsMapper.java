package com.mwkj.lzda.dao;

import com.mwkj.lzda.dto.*;

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

    //收受礼品统计
    List<ArchiveStatisticResultDTO> statisticAcceptGifts(ArchiveStatisticParamDTO archiveStatisticParamDTO);

    //操办宴席统计
    List<ArchiveStatisticResultDTO> statisticBanquetApply(ArchiveStatisticParamDTO archiveStatisticParamDTO);

    //家人被追究刑事责任统计
    List<ArchiveStatisticResultDTO> statisticFamilyCriminal(ArchiveStatisticParamDTO archiveStatisticParamDTO);

    //影响公正执行职务报备统计
    List<ArchiveStatisticResultDTO> statisticAffectBusiness(ArchiveStatisticParamDTO archiveStatisticParamDTO);

    //一般干部被群众信访举报情况登记
    List<ArchiveStatisticResultDTO> statisticPunReport(ArchiveStatisticParamDTO archiveStatisticParamDTO);

    //表彰统计
    List<RewardStatisticResultDTO> statisticReward(RewardStatisticParamDTO rewardStatisticParamDTO);

    //主体责任统计
    List<ArchiveStatisticResultDTO> statisticResponsibility(RptResponsibilityReportDTO rptResponsibilityReportDTO);
}
