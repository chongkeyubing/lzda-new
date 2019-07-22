package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.model.RptResponsibilityPerform;
import com.mwkj.lzda.service.RptResponsibilityPerformService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by CodeGenerator on 2019-07-22 16:08.
*/
@Controller
@RequestMapping("/rptresponsibilityperform")
public class RptResponsibilityPerformController {
    @Resource
    private RptResponsibilityPerformService rptResponsibilityPerformService;

    /**
    * 方法实现说明
    * @author      zzy
    * @Description:(跳转到新增页面)
    * @date        2019/7/22/022 16:28
    */
    @RequestMapping("/toAddPer")
    public String toAddPer(){
        return "views/report/per_add";
    }

    @RequestMapping("/add")
    @ResponseBody
    public Result add(RptResponsibilityPerform rptResponsibilityPerform) {
        rptResponsibilityPerformService.save(rptResponsibilityPerform);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        rptResponsibilityPerformService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(RptResponsibilityPerform rptResponsibilityPerform) {
        rptResponsibilityPerformService.update(rptResponsibilityPerform);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        RptResponsibilityPerform rptResponsibilityPerform = rptResponsibilityPerformService.findById(id);
        return ResultUtil.success(rptResponsibilityPerform);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit,
                       RptResponsibilityPerform rptResponsibilityPerform) {
        PageHelper.startPage(page, limit);
        //List<RptResponsibilityPerform> list = rptResponsibilityPerformService.findAll();
        List<RptResponsibilityPerform> list =rptResponsibilityPerformService.selectForPage(rptResponsibilityPerform);
        PageInfo<RptResponsibilityPerform> pageInfo = new PageInfo<>(list);
       // return ResultUtil.success(pageInfo);
        return   LayuiTableResultUtil.success(list,pageInfo.getTotal());
    }
}
