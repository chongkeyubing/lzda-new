package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcLoanRela;
import com.mwkj.lzda.service.ArcLoanRelaService;
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
* @Date: 2019-07-24 09:53
* @Description todo
*/
@Controller
@RequestMapping("/arcloanrela")
public class ArcLoanRelaController {
    @Resource
    private ArcLoanRelaService arcLoanRelaService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcLoanRela arcLoanRela) {
        arcLoanRelaService.save(arcLoanRela);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcLoanRelaService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcLoanRela arcLoanRela) {
        arcLoanRelaService.update(arcLoanRela);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcLoanRela arcLoanRela = arcLoanRelaService.findById(id);
        return ResultUtil.success(arcLoanRela);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcLoanRela> list = arcLoanRelaService.findAll();
        PageInfo<ArcLoanRela> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
