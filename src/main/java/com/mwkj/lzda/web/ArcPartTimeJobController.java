package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcPartTimeJob;
import com.mwkj.lzda.service.ArcPartTimeJobService;
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
* @Date: 2019-07-12 14:19
* @Description TODO
*/
@Controller
@RequestMapping("/arcparttimejob")
public class ArcPartTimeJobController {
    @Resource
    private ArcPartTimeJobService arcPartTimeJobService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcPartTimeJob arcPartTimeJob, Approve approve, HttpServletRequest request) {
        arcPartTimeJobService.add(arcPartTimeJob,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcPartTimeJobService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcPartTimeJob arcPartTimeJob) {
        arcPartTimeJobService.update(arcPartTimeJob);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcPartTimeJob arcPartTimeJob = arcPartTimeJobService.findById(id);
        return ResultUtil.success(arcPartTimeJob);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcPartTimeJob> list = arcPartTimeJobService.findAll();
        PageInfo<ArcPartTimeJob> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
