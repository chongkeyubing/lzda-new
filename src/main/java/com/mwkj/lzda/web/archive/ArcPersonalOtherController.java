package com.mwkj.lzda.web.archive;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcPersonalOther;
import com.mwkj.lzda.service.ArcPersonalOtherService;
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
* @Date: 2019-07-12 10:28
* @Description TODO
*/
@Controller
@RequestMapping("/arcpersonalother")
public class ArcPersonalOtherController {
    @Resource
    private ArcPersonalOtherService arcPersonalOtherService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcPersonalOther arcPersonalOther, Approve approve, HttpServletRequest request) {
        arcPersonalOtherService.add(arcPersonalOther,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcPersonalOtherService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcPersonalOther arcPersonalOther) {
        arcPersonalOtherService.update(arcPersonalOther);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcPersonalOther arcPersonalOther = arcPersonalOtherService.findById(id);
        return ResultUtil.success(arcPersonalOther);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcPersonalOther> list = arcPersonalOtherService.findAll();
        PageInfo<ArcPersonalOther> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
