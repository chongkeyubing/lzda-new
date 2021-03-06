package com.mwkj.lzda.web.statistic;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.dto.ArchiveStatisticParamDTO;
import com.mwkj.lzda.dto.ArchiveStatisticResultDTO;
import com.mwkj.lzda.enu.LogOperateTypeEnum;
import com.mwkj.lzda.service.OperateLogService;
import com.mwkj.lzda.service.OrganizationService;
import com.mwkj.lzda.service.StatisticService;
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
 * @Description 涉警报备统计控制器
 */
@Controller
@RequestMapping("/arcpoliceinvolvestatistic")
public class ArcPoliceInvolveStatisticController {

    @Resource
    private StatisticService statisticService;

    @Resource
    private OrganizationService organizationService;

    @Resource
    private OperateLogService operateLogService;


    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-26 19:30
     * @Param [map]
     * @Description 跳转到统计页
     */
    @RequestMapping("/toList")
    public String toList(ModelMap map) {
        map.put("organizations", organizationService.findAll());
        //插入日志信息
        operateLogService.save("涉警报备统计", LogOperateTypeEnum.查看.toString(), null);
        return "views/statistic/arc_police_involve_statistic_list";
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-26 19:21
     * @Param [archiveStatisticParamDTO, time, map]
     * @Description 跳转到明细页
     */
    @RequestMapping("/toDetail")
    public String toDetail(int organizationId, String time, ModelMap map) {
        map.put("organizationId", organizationId);
        map.put("time", time);
        return "views/statistic/arc_police_involve_statistic_detail";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit,
                       ArchiveStatisticParamDTO archiveStatisticParamDTO,
                       String time) {

        //解析时间
        if (StringUtils.isNotBlank(time)) {
            archiveStatisticParamDTO.setBeginTime(time.substring(0, 10));
            archiveStatisticParamDTO.setEndTime(time.substring(13, 23));
        }

        PageHelper.startPage(page, limit);

        List<ArchiveStatisticResultDTO> list = statisticService.statisticPoliceInvolve(archiveStatisticParamDTO);

        PageInfo<ArchiveStatisticResultDTO> pageInfo = new PageInfo<>(list);

        return LayuiTableResultUtil.success(list, pageInfo.getTotal());
    }

}