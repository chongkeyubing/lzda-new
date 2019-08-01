package com.mwkj.lzda.web.report;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.RptResponsibilityReportTask;
import com.mwkj.lzda.service.RptResponsibilityReportTaskService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by CodeGenerator on 2019-08-01 10:36.
*/
@Controller
@RequestMapping("/rptresponsibilityreporttask")
public class RptResponsibilityReportTaskController {
    @Resource
    private RptResponsibilityReportTaskService rptResponsibilityReportTaskService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(RptResponsibilityReportTask rptResponsibilityReportTask) {
        rptResponsibilityReportTaskService.save(rptResponsibilityReportTask);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        rptResponsibilityReportTaskService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(RptResponsibilityReportTask rptResponsibilityReportTask) {
        rptResponsibilityReportTaskService.update(rptResponsibilityReportTask);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        RptResponsibilityReportTask rptResponsibilityReportTask = rptResponsibilityReportTaskService.findById(id);
        return ResultUtil.success(rptResponsibilityReportTask);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<RptResponsibilityReportTask> list = rptResponsibilityReportTaskService.findAll();
        PageInfo<RptResponsibilityReportTask> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
