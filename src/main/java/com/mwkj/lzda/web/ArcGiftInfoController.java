package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcGiftInfo;
import com.mwkj.lzda.service.ArcGiftInfoService;
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
* @Date: 2019-07-12 12:19
* @Description TODO
*/
@Controller
@RequestMapping("/arcgiftinfo")
public class ArcGiftInfoController {
    @Resource
    private ArcGiftInfoService arcGiftInfoService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcGiftInfo arcGiftInfo, Approve approve, HttpServletRequest request) {
        arcGiftInfoService.add(arcGiftInfo,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcGiftInfoService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcGiftInfo arcGiftInfo) {
        arcGiftInfoService.update(arcGiftInfo);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcGiftInfo arcGiftInfo = arcGiftInfoService.findById(id);
        return ResultUtil.success(arcGiftInfo);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcGiftInfo> list = arcGiftInfoService.findAll();
        PageInfo<ArcGiftInfo> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
