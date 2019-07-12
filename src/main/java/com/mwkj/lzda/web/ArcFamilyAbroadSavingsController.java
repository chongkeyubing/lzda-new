package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcFamilyAbroadSavings;
import com.mwkj.lzda.service.ArcFamilyAbroadSavingsService;
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
* @Date: 2019-07-12 09:21
* @Description TODO
*/
@Controller
@RequestMapping("/arcfamilyabroadsavings")
public class ArcFamilyAbroadSavingsController {
    @Resource
    private ArcFamilyAbroadSavingsService arcFamilyAbroadSavingsService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcFamilyAbroadSavings arcFamilyAbroadSavings, Approve approve, HttpServletRequest request) {
        arcFamilyAbroadSavingsService.add(arcFamilyAbroadSavings,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcFamilyAbroadSavingsService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcFamilyAbroadSavings arcFamilyAbroadSavings) {
        arcFamilyAbroadSavingsService.update(arcFamilyAbroadSavings);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcFamilyAbroadSavings arcFamilyAbroadSavings = arcFamilyAbroadSavingsService.findById(id);
        return ResultUtil.success(arcFamilyAbroadSavings);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcFamilyAbroadSavings> list = arcFamilyAbroadSavingsService.findAll();
        PageInfo<ArcFamilyAbroadSavings> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
