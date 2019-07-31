package com.mwkj.lzda.web.statistic;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.dto.ArchiveStatisticParamDTO;
import com.mwkj.lzda.dto.ArchiveStatisticResultDTO;
import com.mwkj.lzda.model.ArcFamilyCriminal;
import com.mwkj.lzda.service.ArcFamilyCriminalService;
import com.mwkj.lzda.service.OrganizationService;
import com.mwkj.lzda.service.StatisticService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-26 17:31
 * @Description 涉警报备统计控制器
 */
@Controller
@RequestMapping("/arcFamilyCriminaltistic")
public class ArcFamilyCriminalStatisticController {

    @Resource
    private StatisticService statisticService;
    @Resource
    private OrganizationService organizationService;

    @Resource
    private ArcFamilyCriminalService arcFamilyCriminalService;

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-26 19:30
     * @Param [map]
     * @Description 跳转到统计页
     */
    @RequestMapping("/toList")
    public String toStatisticFamiayCriminal(ModelMap map) {
        map.put("organizations", organizationService.findAll());
        return "views/statistic/arc_family_criminal_statistic_list";
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-26 19:21
     * @Param [archiveStatisticParamDTO, time, map]
     * @Description 跳转到明细页
     */
    @RequestMapping("/toDetail")
    public String toStatisticFamiayCriminalDetai(int organizationId, String time, ModelMap map) {
        map.put("organizationId", organizationId);
        map.put("time", time);
        return "views/statistic/arc_family_criminal_statistic_detail";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result statisticFamiayCriminal(@RequestParam(defaultValue = "0") Integer page,
                                         @RequestParam(defaultValue = "0") Integer limit,
                                         ArchiveStatisticParamDTO archiveStatisticParamDTO,
                                         String time) {
        //解析时间
        if (StringUtils.isNotBlank(time)) {
            archiveStatisticParamDTO.setBeginTime(time.substring(0, 10));
            archiveStatisticParamDTO.setEndTime(time.substring(13, 23));
        }

        PageHelper.startPage(page, limit);

        List<ArchiveStatisticResultDTO> list = statisticService.statisticFamilyCriminal(archiveStatisticParamDTO);

        PageInfo<ArchiveStatisticResultDTO> pageInfo = new PageInfo<>(list);

        return LayuiTableResultUtil.success(list, pageInfo.getTotal());
    }


    /**
    * 方法实现说明
    * @author      zzy
    * @Description:(明细分页)
    * @date        2019/7/30/030 11:07
    */
    @RequestMapping("/lists")
    @ResponseBody
    public Result lists(@RequestParam(defaultValue = "0") Integer page,
                        @RequestParam(defaultValue = "0") Integer limit,
                        ArcFamilyCriminal arcFamilyCriminal,
                        String time) {
        PageHelper.startPage(page, limit);

        Condition condition = new Condition(ArcFamilyCriminal.class);
        Example.Criteria criteria = condition.createCriteria();

        //设置单位id
        criteria.andEqualTo("organizationId", arcFamilyCriminal.getOrganizationId());

        if (StringUtils.isNotBlank(time)) {
            //设置时间段
            criteria.andBetween("time", time.substring(0, 10), time.substring(13, 23));
        }

        List<ArcFamilyCriminal> list = arcFamilyCriminalService.findByCondition(condition);
        PageInfo<ArcFamilyCriminal> pageInfo = new PageInfo<>(list);
        return LayuiTableResultUtil.success(list, pageInfo.getTotal());
    }


}