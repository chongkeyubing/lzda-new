package com.mwkj.lzda.web;

import com.github.pagehelper.ISelect;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.dto.ArchiveStatisticParamDTO;
import com.mwkj.lzda.dto.ArchiveStatisticResultDTO;
import com.mwkj.lzda.service.OrganizationService;
import com.mwkj.lzda.service.StatisticsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: libaogang
 * @Date: 2019-07-26 17:31
 * @Description 统计控制器
 */
@Controller
@RequestMapping("/statistic")
public class StatisticsController {

    @Resource
    private StatisticsService statisticsService;

    @Resource
    private OrganizationService organizationService;

    /**
     * @Author libaogang
     * @Date 2019-07-26 19:30
     * @Param [map]
     * @return java.lang.String
     * @Description 跳转到统计页
     */
    @RequestMapping("/toStatisticPoliceInvolve")
    public String toStatisticPoliceInvolve(ModelMap map) {
        map.put("organizations", organizationService.findAll());
        return "views/statistic/arc_police_involve_statistic";
    }

    /**
     * @Author libaogang
     * @Date 2019-07-26 19:21
     * @Param [archiveStatisticParamDTO, time, map]
     * @return java.lang.String
     * @Description 跳转到明细页
     */
    @RequestMapping("/toStatisticPoliceInvolveDetai")
    public String toStatisticPoliceInvolveDetai(int organizationId, String time, ModelMap map) {
        map.put("organizationId", organizationId);
        map.put("time",time);
        return "views/statistic/arc_police_involve_statistic_detail";
    }

    @RequestMapping("/statisticPoliceInvolve")
    @ResponseBody
    public Result statisticPoliceInvolve(@RequestParam(defaultValue = "0") Integer page,
                                         @RequestParam(defaultValue = "0") Integer limit,
                                         ArchiveStatisticParamDTO archiveStatisticParamDTO,
                                         String time) {

        //解析时间
        if (StringUtils.isNotBlank(time)) {
            archiveStatisticParamDTO.setBeginTime(time.substring(0, 10));
            archiveStatisticParamDTO.setEndTime(time.substring(13, 23));
        }

        PageHelper.startPage(page, limit);

        List<ArchiveStatisticResultDTO> list = statisticsService.statisticPoliceInvolve(archiveStatisticParamDTO);

        PageInfo<ArchiveStatisticParamDTO> pageInfo = new PageInfo<>();

        return LayuiTableResultUtil.success(list, pageInfo.getTotal());
    }

}