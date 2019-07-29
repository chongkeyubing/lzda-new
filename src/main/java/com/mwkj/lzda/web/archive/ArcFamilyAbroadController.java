package com.mwkj.lzda.web.archive;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcFamilyAbroad;
import com.mwkj.lzda.service.ArcFamilyAbroadService;
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
* @Date: 2019-07-11 14:47
* @Description TODO
*/
@Controller
@RequestMapping("/arcfamilyabroad")
public class ArcFamilyAbroadController {
    @Resource
    private ArcFamilyAbroadService arcFamilyAbroadService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcFamilyAbroad arcFamilyAbroad, Approve approve, HttpServletRequest request) {
        arcFamilyAbroadService.add(arcFamilyAbroad,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcFamilyAbroadService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcFamilyAbroad arcFamilyAbroad) {
        arcFamilyAbroadService.update(arcFamilyAbroad);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcFamilyAbroad arcFamilyAbroad = arcFamilyAbroadService.findById(id);
        return ResultUtil.success(arcFamilyAbroad);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcFamilyAbroad> list = arcFamilyAbroadService.findAll();
        PageInfo<ArcFamilyAbroad> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
