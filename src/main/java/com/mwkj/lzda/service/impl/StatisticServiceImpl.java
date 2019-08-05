package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.StatisticsMapper;
import com.mwkj.lzda.dto.ArchiveStatisticParamDTO;
import com.mwkj.lzda.dto.ArchiveStatisticResultDTO;
import com.mwkj.lzda.dto.RewardStatisticParamDTO;
import com.mwkj.lzda.dto.RewardStatisticResultDTO;
import com.mwkj.lzda.model.Organization;
import com.mwkj.lzda.service.OrganizationService;
import com.mwkj.lzda.service.StatisticService;
import com.mwkj.lzda.vo.RewardStatisticVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
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

    @Resource
    private OrganizationService organizationService;

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

    /**
    * 方法实现说明
    * @author      zzy
    * @Description:(队伍思想状况统计)
    * @date        2019/7/31/031 16:53
    */
    @Override
    public List<ArchiveStatisticResultDTO> statisticTeamThinking(ArchiveStatisticParamDTO archiveStatisticParamDTO) {
        return statisticsMapper.statisticTeamThinking(archiveStatisticParamDTO);
    }


    /**
    * 方法实现说明
    * @author      zzy
    * @Description:(履责纪实统计)
    * @date        2019/7/31/031 16:54
    */
    @Override
    public List<ArchiveStatisticResultDTO> statisticResponsibilityPerform(ArchiveStatisticParamDTO archiveStatisticParamDTO) {
        return statisticsMapper.statisticResponsibilityPerform(archiveStatisticParamDTO);
       /* List<ArchiveStatisticResultDTO> archiveStatisticResultDTOS = statisticsMapper.statisticResponsibilityPerform(archiveStatisticParamDTO);
        List<ArchiveStatisticResultDTO> archiveStatisticResults = new ArrayList<>(64);

        Organization organizationParam = new Organization();
        organizationParam.setId(archiveStatisticParamDTO.getOrganizationId());
        List<Organization> organizations = organizationService.find(organizationParam);

        for (Organization organization : organizations) {
            for(ArchiveStatisticResultDTO archiveStatisticResultDTO1:archiveStatisticResultDTOS){
                ArchiveStatisticResultDTO archiveStatisticResultDTO2 = new ArchiveStatisticResultDTO();
                archiveStatisticResultDTO2.setOrganizationId(organization.getId());
                archiveStatisticResultDTO2.setOrganizationName(organization.getName());

                if(organization.getId().equals(archiveStatisticResultDTO1.getOrganizationId())){
                    archiveStatisticResultDTO2.setCount(archiveStatisticResultDTO1.getCount());
                }
                archiveStatisticResults.add(archiveStatisticResultDTO2);
            }

        }
        return archiveStatisticResults;*/

    }

    /**
     * @return java.util.List<com.mwkj.lzda.dto.RewardStatisticResultDTO>
     * @Author libaogang
     * @Date 2019-07-31 11:08
     * @Param [rewardStatisticParamDTO]
     * @Description 表彰统计
     */
    @Override
    public List<RewardStatisticVO> statisticReward(RewardStatisticParamDTO rewardStatisticParamDTO) {
        List<RewardStatisticResultDTO> RewardStatisticResultDTOs = statisticsMapper.statisticReward(rewardStatisticParamDTO);
        List<RewardStatisticVO> rewardStatisticVOs = new ArrayList<>(64);

        //统计数据去重
        Organization organizationParam = new Organization();
        organizationParam.setId(rewardStatisticParamDTO.getOrganizationId());
        List<Organization> organizations = organizationService.find(organizationParam);

        for (Organization organization : organizations) {
            RewardStatisticVO rewardStatisticVO = new RewardStatisticVO();
            rewardStatisticVO.setOrganizationId(organization.getId());
            rewardStatisticVO.setOrganizationName(organization.getName());

            for (RewardStatisticResultDTO rewardStatisticResultDTO : RewardStatisticResultDTOs) {
                if (organization.getId() == rewardStatisticResultDTO.getOrganizationId()) {
                    switch (rewardStatisticResultDTO.getRewardType()) {
                        case "通报表扬":
                            rewardStatisticVO.setHonourNumber(rewardStatisticResultDTO.getCount());
                            break;
                        case "嘉奖":
                            rewardStatisticVO.setCommendationNumber(rewardStatisticResultDTO.getCount());
                            break;
                        case "三等功":
                            rewardStatisticVO.setThirdNumber(rewardStatisticResultDTO.getCount());
                            break;
                        case "二等功":
                            rewardStatisticVO.setSecondNumber(rewardStatisticResultDTO.getCount());
                            break;
                        case "一等功":
                            rewardStatisticVO.setFirstNumber(rewardStatisticResultDTO.getCount());
                            break;
                        case "其他":
                            rewardStatisticVO.setOtherNumber(rewardStatisticResultDTO.getCount());
                            break;
                    }
                }
            }

            //计算总数
            rewardStatisticVO.setTotal(rewardStatisticVO.getHonourNumber()
                    + rewardStatisticVO.getCommendationNumber()
                    + rewardStatisticVO.getThirdNumber()
                    + rewardStatisticVO.getSecondNumber()
                    + rewardStatisticVO.getFirstNumber()
                    + rewardStatisticVO.getOtherNumber()
            );

            //添加到视图结果集
            rewardStatisticVOs.add(rewardStatisticVO);
        }
        return rewardStatisticVOs;
    }
}