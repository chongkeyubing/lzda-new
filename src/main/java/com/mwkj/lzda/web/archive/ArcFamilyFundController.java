package com.mwkj.lzda.web.archive;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcFamilyFund;
import com.mwkj.lzda.service.ArcFamilyFundService;
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
* @Date: 2019-07-11 17:31
* @Description TODO
*/
@Controller
@RequestMapping("/arcfamilyfund")
public class ArcFamilyFundController {
    @Resource
    private ArcFamilyFundService arcFamilyFundService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcFamilyFund arcFamilyFund, Approve approve, HttpServletRequest request) {
        arcFamilyFundService.add(arcFamilyFund,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcFamilyFundService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcFamilyFund arcFamilyFund) {
        arcFamilyFundService.update(arcFamilyFund);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcFamilyFund arcFamilyFund = arcFamilyFundService.findById(id);
        return ResultUtil.success(arcFamilyFund);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcFamilyFund> list = arcFamilyFundService.findAll();
        PageInfo<ArcFamilyFund> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
