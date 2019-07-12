package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcHouseInfo;
import com.mwkj.lzda.service.ArcHouseInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.mwkj.lzda.model.Approve;

/**
* @Author: libaogang
* @Date: 2019-07-12 14:40
* @Description TODO
*/
@Controller
@RequestMapping("/archouseinfo")
public class ArcHouseInfoController {
    @Resource
    private ArcHouseInfoService arcHouseInfoService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcHouseInfo arcHouseInfo, Approve approve, HttpServletRequest request) {
        arcHouseInfoService.add(arcHouseInfo,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcHouseInfoService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcHouseInfo arcHouseInfo) {
        arcHouseInfoService.update(arcHouseInfo);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcHouseInfo arcHouseInfo = arcHouseInfoService.findById(id);
        return ResultUtil.success(arcHouseInfo);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcHouseInfo> list = arcHouseInfoService.findAll();
        PageInfo<ArcHouseInfo> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
