package com.mwkj.lzda.web.statistic;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.layui.LayuiDurationResolver;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.dto.ArchiveStatisticParamDTO;
import com.mwkj.lzda.dto.ArchiveStatisticResultDTO;
import com.mwkj.lzda.dto.ResponsibilityStatisticParamDTO;
import com.mwkj.lzda.dto.RptResponsibilityReportDTO;
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
 * @Description 主体责任统计控制器
 */
@Controller
@RequestMapping("/rptresponsibilityreportstatistic")
public class RptResponsibilityReportStatisticController {

    @Resource
    private StatisticService statisticService;

    @Resource
    private OrganizationService organizationService;

    @Resource
    private OperateLogService operateLogService;

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-08-01 17:09
     * @Param [map]
     * @Description 跳转到列表页
     */
    @RequestMapping("/toList")
    public String toList(ModelMap map) {
        map.put("organizations", organizationService.findAll());
        //插入日志信息
        operateLogService.save("主体责任统计", LogOperateTypeEnum.查看.toString(), null);
        return "views/statistic/rpt_responsibility_report_statistic_list";
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-08-01 17:09
     * @Param [organizationId, time, map]
     * @Description 跳转到明细页
     */
    @RequestMapping("/toDetail")
    public String toDetail(ResponsibilityStatisticParamDTO responsibilityStatisticParamDTO, ModelMap map) {
        map.put("organizationId", responsibilityStatisticParamDTO.getOrganizationId());
        map.put("year", responsibilityStatisticParamDTO.getYear());
        map.put("quarter", responsibilityStatisticParamDTO.getQuarter());
        return "views/statistic/rpt_responsibility_report_statistic_detail";
    }

    /**
     * @return com.mwkj.lzda.core.Result
     * @Author libaogang
     * @Date 2019-08-01 17:09
     * @Param [page, limit, archiveStatisticParamDTO, time]
     * @Description 列表页数据
     */
    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit,
                       ResponsibilityStatisticParamDTO responsibilityStatisticParamDTO) {

        PageHelper.startPage(page, limit);
        List<ArchiveStatisticResultDTO> list = statisticService.statisticResponsibility(responsibilityStatisticParamDTO);
        PageInfo<ArchiveStatisticResultDTO> pageInfo = new PageInfo<>(list);
        return LayuiTableResultUtil.success(list, pageInfo.getTotal());
    }

}