package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcFamilyAbroadMarriage;
import com.mwkj.lzda.service.ArcFamilyAbroadMarriageService;
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
* @Date: 2019-07-12 14:58
* @Description TODO
*/
@Controller
@RequestMapping("/arcfamilyabroadmarriage")
public class ArcFamilyAbroadMarriageController {
    @Resource
    private ArcFamilyAbroadMarriageService arcFamilyAbroadMarriageService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcFamilyAbroadMarriage arcFamilyAbroadMarriage, Approve approve, HttpServletRequest request) {
        arcFamilyAbroadMarriageService.add(arcFamilyAbroadMarriage,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcFamilyAbroadMarriageService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcFamilyAbroadMarriage arcFamilyAbroadMarriage) {
        arcFamilyAbroadMarriageService.update(arcFamilyAbroadMarriage);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcFamilyAbroadMarriage arcFamilyAbroadMarriage = arcFamilyAbroadMarriageService.findById(id);
        return ResultUtil.success(arcFamilyAbroadMarriage);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcFamilyAbroadMarriage> list = arcFamilyAbroadMarriageService.findAll();
        PageInfo<ArcFamilyAbroadMarriage> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
