package com.mwkj.lzda.web.archive;

import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.dto.ArchiveStatisticParamDTO;
import com.mwkj.lzda.model.ArcPoliceInvolve;
import com.mwkj.lzda.service.ArcPoliceInvolveService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.mwkj.lzda.model.Approve;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

/**
 * @Author: libaogang
 * @Date: 2019-07-12 11:07
 * @Description 涉警报备
 */
@Controller
@RequestMapping("/arcpoliceinvolve")
public class ArcPoliceInvolveController {
    @Resource
    private ArcPoliceInvolveService arcPoliceInvolveService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcPoliceInvolve arcPoliceInvolve, Approve approve, HttpServletRequest request) {
        arcPoliceInvolveService.add(arcPoliceInvolve, approve, request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcPoliceInvolveService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcPoliceInvolve arcPoliceInvolve) {
        arcPoliceInvolveService.update(arcPoliceInvolve);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcPoliceInvolve arcPoliceInvolve = arcPoliceInvolveService.findById(id);
        return ResultUtil.success(arcPoliceInvolve);
    }

    /**
     * @return com.mwkj.lzda.core.Result
     * @Author libaogang
     * @Date 2019-07-26 19:32
     * @Param [page, limit, arcPoliceInvolve, time]
     * @Description 根据时间段和单位分页查询
     */
    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit,
                       ArcPoliceInvolve arcPoliceInvolve,
                       String time) {
        PageHelper.startPage(page, limit);

        Condition condition = new Condition(ArcPoliceInvolve.class);
        Example.Criteria criteria = condition.createCriteria();

        //设置单位id
        criteria.andEqualTo("organizationId", arcPoliceInvolve.getOrganizationId());

        if (StringUtils.isNotBlank(time)) {
            //设置时间段
            criteria.andBetween("time", time.substring(0, 10), time.substring(13, 23));
        }

        List<ArcPoliceInvolve> list = arcPoliceInvolveService.findByCondition(condition);
        PageInfo<ArcPoliceInvolve> pageInfo = new PageInfo<>(list);
        return LayuiTableResultUtil.success(list, pageInfo.getTotal());
    }
}
