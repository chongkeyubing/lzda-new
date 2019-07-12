package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcPoliceInvolve;
import com.mwkj.lzda.service.ArcPoliceInvolveService;
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
* @Date: 2019-07-12 11:07
* @Description TODO
*/
@Controller
@RequestMapping("/arcpoliceinvolve")
public class ArcPoliceInvolveController {
    @Resource
    private ArcPoliceInvolveService arcPoliceInvolveService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcPoliceInvolve arcPoliceInvolve, Approve approve, HttpServletRequest request) {
        arcPoliceInvolveService.add(arcPoliceInvolve,approve,request);
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

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcPoliceInvolve> list = arcPoliceInvolveService.findAll();
        PageInfo<ArcPoliceInvolve> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
