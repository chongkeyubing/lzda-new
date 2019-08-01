package com.mwkj.lzda.web.statistic;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.dto.ArchiveStatisticParamDTO;
import com.mwkj.lzda.dto.ArchiveStatisticResultDTO;
import com.mwkj.lzda.enu.LogOperateTypeEnum;
import com.mwkj.lzda.model.ArcBanquetApply;
import com.mwkj.lzda.service.ArcBanquetApplyService;
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
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;


@Controller
@RequestMapping("/arcBanquet")
public class ArcBanquetController {
    @Resource
    private StatisticService statisticService;

    @Resource
    private OrganizationService organizationService;

    @Resource
    private ArcBanquetApplyService arcBanquetApplyService;

    @Resource
    private OperateLogService operateLogService;


    /**
    * 方法实现说明
    * @author      zzy
    * @Description:(单位名称下拉框)
    * @date        2019/7/30/030 9:50
    */
    @RequestMapping("/toList")
    public String toList(ModelMap map) {
        map.put("organizations", organizationService.findAll());
        //插入日志信息
        operateLogService.save("操办宴席申请统计", LogOperateTypeEnum.查看.toString(), null);
        return "views/statistic/arc_banquet_apply_statistic_list";
    }

    /**
     * 方法实现说明
     * @author      zzy
     * @Description:(跳转到详情页)
     * @date        2019/7/29/029 15:26
     */
    @RequestMapping("/toDetail")
    public String toDetail(int organizationId, String time, ModelMap map) {
        map.put("organizationId", organizationId);
        map.put("time", time);
        return "views/statistic/arc_banquet_apply_statistic_detail";
    }

    /**
     * 方法实现说明
     * @author      zzy
     * @Description:(分页)
     * @date        2019/7/29/029 15:26
     */
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

        List<ArchiveStatisticResultDTO> list = statisticService.statisticBanquetApply(archiveStatisticParamDTO);

        PageInfo<ArchiveStatisticResultDTO> pageInfo = new PageInfo<>(list);

        return LayuiTableResultUtil.success(list, pageInfo.getTotal());
    }


    /**
     * 方法实现说明
     * @author      zzy
     * @Description:(详情分页)
     * @date        2019/7/29/029 17:44
     */
    @RequestMapping("/lists")
    @ResponseBody
    public Result lists(@RequestParam(defaultValue = "0") Integer page,
                        @RequestParam(defaultValue = "0") Integer limit,
                        ArcBanquetApply arcBanquetApply,
                        String time) {
        PageHelper.startPage(page, limit);

        Condition condition = new Condition(ArcBanquetApply.class);
        Example.Criteria criteria = condition.createCriteria();

        //设置单位id
        criteria.andEqualTo("organizationId", arcBanquetApply.getOrganizationId());

        if (StringUtils.isNotBlank(time)) {
            //设置时间段
            criteria.andBetween("time", time.substring(0, 10), time.substring(13, 23));
        }

        List<ArcBanquetApply> list = arcBanquetApplyService.findByCondition(condition);
        PageInfo<ArcBanquetApply> pageInfo = new PageInfo<>(list);
        return LayuiTableResultUtil.success(list, pageInfo.getTotal());
    }



}
