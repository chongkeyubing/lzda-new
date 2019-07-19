package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.PunReport;
import com.mwkj.lzda.service.PunReportService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
* Created by CodeGenerator on 2019-07-19 14:37.
*/
@Controller
@RequestMapping("/punreport")
public class PunReportController {
    @Resource
    private PunReportService punReportService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(PunReport punReport,HttpServletRequest request) {
        punReportService.add(punReport,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        punReportService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(PunReport punReport, HttpServletRequest  request) {
        punReportService.update(punReport,request);
        return ResultUtil.success();
    }

}
