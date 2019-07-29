package com.mwkj.lzda.web.archive;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcFamilyInsurance;
import com.mwkj.lzda.service.ArcFamilyInsuranceService;
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
* @Date: 2019-07-11 17:50
* @Description TODO
*/
@Controller
@RequestMapping("/arcfamilyinsurance")
public class ArcFamilyInsuranceController {
    @Resource
    private ArcFamilyInsuranceService arcFamilyInsuranceService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcFamilyInsurance arcFamilyInsurance, Approve approve, HttpServletRequest request) {
        arcFamilyInsuranceService.add(arcFamilyInsurance,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcFamilyInsuranceService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcFamilyInsurance arcFamilyInsurance) {
        arcFamilyInsuranceService.update(arcFamilyInsurance);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcFamilyInsurance arcFamilyInsurance = arcFamilyInsuranceService.findById(id);
        return ResultUtil.success(arcFamilyInsurance);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcFamilyInsurance> list = arcFamilyInsuranceService.findAll();
        PageInfo<ArcFamilyInsurance> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
