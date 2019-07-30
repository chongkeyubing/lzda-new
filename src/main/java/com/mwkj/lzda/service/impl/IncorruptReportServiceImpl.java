package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.model.*;
import com.mwkj.lzda.service.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: libaogang
 * @Date: 2019-07-30 9:40
 * @Description 廉政报告
 */
@Service
@Transactional
public class IncorruptReportServiceImpl implements IncorruptReportService {

    @Resource
    UserService userService;

    @Resource
    RewardService rewardService;

    @Resource
    PunViolationService punViolationService;

    @Resource
    PunGiftService punGiftService;

    @Resource
    IncorruptSelfSummaryService incorruptSelfSummaryService;

    @Resource
    PunReportService punReportService;

    @Resource
    ArcMarriageInfoService arcMarriageInfoService;

    @Resource
    ArcBanquetApplyService arcBanquetApplyService;

    @Resource
    ArcAffectBusinessService arcAffectBusinessService;

    @Resource
    ArcPoliceInvolveService arcPoliceInvolveService;

    @Resource
    ArcGiftInfoService arcGiftInfoService;

    @Resource
    ArcLoanService arcLoanService;

    @Resource
    ArcLoanRelaService arcLoanRelaService;

    /**
     * @return java.util.Map<java.lang.String , java.lang.Object>
     * @Author libaogang
     * @Date 2019-07-30 9:44
     * @Param [userId, beginTime, endTime]
     * @Description 根据用户id和时间段获取生成廉政报告的map数据集合
     */
    @Override
    public Map<String, Object> getIncorruptReportParam(int userId, String beginTime, String endTime) {
        Map<String, Object> paramMap = new HashMap<>();

        //基本情况
        User user = userService.findById(userId);
        paramMap.put("user", user);

        Condition condition = null;

        //奖励情况
        condition = new Condition(Reward.class);
        condition.createCriteria()
                .andBetween("rewardTime", beginTime, endTime)
                .andEqualTo("userId", userId);
        paramMap.put("rewards", rewardService.findByCondition(condition));


        //违纪情况
        condition = new Condition(PunViolation.class);
        condition.createCriteria()
                .andBetween("handleTime", beginTime, endTime)
                .andEqualTo("userId", userId);
        paramMap.put("violations", punViolationService.findByCondition(condition));

        //收受礼品
        condition = new Condition(PunGift.class);
        condition.createCriteria()
                .andBetween("time", beginTime, endTime)
                .andEqualTo("userId", userId);
        paramMap.put("punGifts", punGiftService.findByCondition(condition));

        //个人廉洁自律小结
//        condition = new Condition(IncorruptSelfSummary.class);
//        condition.createCriteria().andEqualTo("userid", userId);
        IncorruptSelfSummary incorruptSelfSummary = new IncorruptSelfSummary();
        incorruptSelfSummary.setUserid(userId);
        paramMap.put("selfSummary", incorruptSelfSummaryService.findOne(incorruptSelfSummary));

        //信访投诉
        condition = new Condition(PunReport.class);
        condition.createCriteria()
                .andBetween("time", beginTime, endTime)
                .andEqualTo("userId", userId);
        paramMap.put("reports", punReportService.findByCondition(condition));

        //婚姻变化
        condition = new Condition(ArcMarriageInfo.class);
        condition.createCriteria()
                .andBetween("changeDate", beginTime, endTime)
                .andEqualTo("userId", userId);
        paramMap.put("marriages", arcMarriageInfoService.findByCondition(condition));

        //操办宴席申请
        condition = new Condition(ArcBanquetApply.class);
        condition.createCriteria()
                .andBetween("activityTime", beginTime, endTime)
                .andEqualTo("userId", userId);
        paramMap.put("banquets", arcBanquetApplyService.findByCondition(condition));

        //可能影响公正执行职务
        condition = new Condition(ArcAffectBusiness.class);
        condition.createCriteria()
                .andBetween("time", beginTime, endTime)
                .andEqualTo("userId", userId);
        paramMap.put("businessAffects", arcAffectBusinessService.findByCondition(condition));

        //涉警报备
        condition = new Condition(ArcPoliceInvolve.class);
        condition.createCriteria()
                .andBetween("time", beginTime, endTime)
                .andEqualTo("userId", userId);
        paramMap.put("policeInvolves", arcPoliceInvolveService.findByCondition(condition));

        //收受礼品
        condition = new Condition(ArcGiftInfo.class);
        condition.createCriteria()
                .andBetween("giftTime", beginTime, endTime)
                .andEqualTo("userId", userId);
        paramMap.put("arcGifts", arcGiftInfoService.findByCondition(condition));

        //借出、借入、担保、经营活动
        condition = new Condition(ArcLoan.class);
        condition.createCriteria()
                .andBetween("createTime", beginTime, endTime)
                .andEqualTo("userId", userId);
        List<ArcLoan> arcLoanList =  arcLoanService.findByCondition(condition);

        //借出汇总
        List<ArcLoanRela> loans = new ArrayList<>();
        //借入汇总
        List<ArcLoanRela> borrows = new ArrayList<>();
        //担保汇总
        List<ArcLoanRela> assures = new ArrayList<>();
        //经营活动汇总
        List<ArcLoanRela> activitys = new ArrayList<>();

        for(ArcLoan arcLoan:arcLoanList){
            //借出
            condition = new Condition(ArcLoanRela.class);
            condition.createCriteria().andEqualTo("loanId",arcLoan.getId())
                    .andEqualTo("type",1);
            List<ArcLoanRela> arcLoanRelas1 =  arcLoanRelaService.findByCondition(condition);
            loans.addAll(arcLoanRelas1);

            //借入
            condition = new Condition(ArcLoanRela.class);
            condition.createCriteria().andEqualTo("loanId",arcLoan.getId())
                    .andEqualTo("type",2);
            List<ArcLoanRela> arcLoanRelas2 =  arcLoanRelaService.findByCondition(condition);
            borrows.addAll(arcLoanRelas2);

            //担保
            condition = new Condition(ArcLoanRela.class);
            condition.createCriteria().andEqualTo("loanId",arcLoan.getId())
                    .andEqualTo("type",3);
            List<ArcLoanRela> arcLoanRelas3 =  arcLoanRelaService.findByCondition(condition);
            assures.addAll(arcLoanRelas3);

            //经营活动
            condition = new Condition(ArcLoanRela.class);
            condition.createCriteria().andEqualTo("loanId",arcLoan.getId())
                    .andEqualTo("type",4);
            List<ArcLoanRela> arcLoanRelas4 =  arcLoanRelaService.findByCondition(condition);
            activitys.addAll(arcLoanRelas4);
        }

        paramMap.put("loans", loans);
        paramMap.put("borrows", borrows);
        paramMap.put("assures", assures);
        paramMap.put("activitys", activitys);

        return paramMap;
    }
}