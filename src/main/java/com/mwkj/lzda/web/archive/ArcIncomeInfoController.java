package com.mwkj.lzda.web.archive;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcIncomeInfo;
import com.mwkj.lzda.service.ArcIncomeInfoService;
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
* @Date: 2019-07-12 11:32
* @Description TODO
*/
@Controller
@RequestMapping("/arcincomeinfo")
public class ArcIncomeInfoController {
    @Resource
    private ArcIncomeInfoService arcIncomeInfoService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcIncomeInfo arcIncomeInfo, Approve approve, HttpServletRequest request) {
        arcIncomeInfoService.add(arcIncomeInfo,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcIncomeInfoService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcIncomeInfo arcIncomeInfo) {
        arcIncomeInfoService.update(arcIncomeInfo);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcIncomeInfo arcIncomeInfo = arcIncomeInfoService.findById(id);
        return ResultUtil.success(arcIncomeInfo);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcIncomeInfo> list = arcIncomeInfoService.findAll();
        PageInfo<ArcIncomeInfo> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
