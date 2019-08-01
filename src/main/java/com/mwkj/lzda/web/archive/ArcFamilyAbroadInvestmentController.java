package com.mwkj.lzda.web.archive;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcFamilyAbroadInvestment;
import com.mwkj.lzda.service.ArcFamilyAbroadInvestmentService;
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
* @Date: 2019-07-12 09:28
* @Description TODO
*/
@Controller
@RequestMapping("/arcfamilyabroadinvestment")
public class ArcFamilyAbroadInvestmentController {
    @Resource
    private ArcFamilyAbroadInvestmentService arcFamilyAbroadInvestmentService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcFamilyAbroadInvestment arcFamilyAbroadInvestment, Approve approve, HttpServletRequest request) {
        arcFamilyAbroadInvestmentService.add(arcFamilyAbroadInvestment,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcFamilyAbroadInvestmentService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcFamilyAbroadInvestment arcFamilyAbroadInvestment) {
        arcFamilyAbroadInvestmentService.update(arcFamilyAbroadInvestment);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcFamilyAbroadInvestment arcFamilyAbroadInvestment = arcFamilyAbroadInvestmentService.findById(id);
        return ResultUtil.success(arcFamilyAbroadInvestment);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcFamilyAbroadInvestment> list = arcFamilyAbroadInvestmentService.findAll();
        PageInfo<ArcFamilyAbroadInvestment> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
