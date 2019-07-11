package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.OperateLog;
import com.mwkj.lzda.service.OperateLogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
* @Author: libaogang
* @Date: 2019-07-10 17:14
* @Description TODO
*/
@Controller
@RequestMapping("/operatelog")
public class OperateLogController {
    @Resource
    private OperateLogService operateLogService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(OperateLog operateLog) {
        operateLogService.save(operateLog);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        operateLogService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(OperateLog operateLog) {
        operateLogService.update(operateLog);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        OperateLog operateLog = operateLogService.findById(id);
        return ResultUtil.success(operateLog);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<OperateLog> list = operateLogService.findAll();
        PageInfo<OperateLog> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
