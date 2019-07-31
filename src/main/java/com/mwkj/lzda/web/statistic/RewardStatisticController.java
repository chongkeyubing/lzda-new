package com.mwkj.lzda.web.statistic;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.layui.LayuiDurationResolver;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.dto.ArchiveStatisticParamDTO;
import com.mwkj.lzda.dto.ArchiveStatisticResultDTO;
import com.mwkj.lzda.dto.RewardStatisticParamDTO;
import com.mwkj.lzda.service.OrganizationService;
import com.mwkj.lzda.service.StatisticService;
import com.mwkj.lzda.vo.RewardStatisticVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-26 17:31
 * @Description 表彰统计控制器
 */
@Controller
@RequestMapping("/rewardstatistic")
public class RewardStatisticController {

    @Resource
    private StatisticService statisticService;

    @Resource
    private OrganizationService organizationService;

    @RequestMapping("/toList")
    public String toList(ModelMap map) {
        map.put("organizations", organizationService.findAll());
        return "views/statistic/reward_statistic_list";
    }

    @RequestMapping("/toDetail")
    public String toDetail(int organizationId, String time, String rewardType, ModelMap map) {
        map.put("rewardType", rewardType);
        map.put("organizationId", organizationId);
        map.put("time", time);
        return "views/statistic/reward_statistic_detail";
    }

    /**
     * @return com.mwkj.lzda.core.Result
     * @Author libaogang
     * @Date 2019-07-31 12:27
     * @Param [page, limit, rewardStatisticParamDTO, time]
     * @Description 统计列表数据
     */
    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit,
                       RewardStatisticParamDTO rewardStatisticParamDTO,
                       String time) {
        //解析时间
        if (StringUtils.isNotBlank(time)) {
            rewardStatisticParamDTO.setBeginTime(LayuiDurationResolver.getBeginTime(time));
            rewardStatisticParamDTO.setEndTime(LayuiDurationResolver.getEndTime(time));
        }

        List<RewardStatisticVO> result = statisticService.statisticReward(rewardStatisticParamDTO);
        return LayuiTableResultUtil.success(result, 0);  //不展示分页
    }

}