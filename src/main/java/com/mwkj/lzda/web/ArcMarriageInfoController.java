package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcMarriageInfo;
import com.mwkj.lzda.service.ArcMarriageInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
* @Author: libaogang
* @Date: 2019-07-10 22:15
* @Description TODO
*/
@Controller
@RequestMapping("/arcmarriageinfo")
public class ArcMarriageInfoController {
    @Resource
    private ArcMarriageInfoService arcMarriageInfoService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcMarriageInfo arcMarriageInfo, Approve approve , HttpServletRequest request) {
        arcMarriageInfoService.add(arcMarriageInfo ,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcMarriageInfoService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcMarriageInfo arcMarriageInfo) {
        arcMarriageInfoService.update(arcMarriageInfo);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcMarriageInfo arcMarriageInfo = arcMarriageInfoService.findById(id);
        return ResultUtil.success(arcMarriageInfo);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcMarriageInfo> list = arcMarriageInfoService.findAll();
        PageInfo<ArcMarriageInfo> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
