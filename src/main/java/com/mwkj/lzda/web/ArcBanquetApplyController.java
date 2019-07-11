package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcBanquetApply;
import com.mwkj.lzda.service.ArcBanquetApplyService;
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
* @Date: 2019-07-11 10:27
* @Description TODO
*/
@Controller
@RequestMapping("/arcbanquetapply")
public class ArcBanquetApplyController {
    @Resource
    private ArcBanquetApplyService arcBanquetApplyService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcBanquetApply arcBanquetApply, Approve approve, HttpServletRequest request) {
        arcBanquetApplyService.add(arcBanquetApply,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcBanquetApplyService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcBanquetApply arcBanquetApply) {
        arcBanquetApplyService.update(arcBanquetApply);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcBanquetApply arcBanquetApply = arcBanquetApplyService.findById(id);
        return ResultUtil.success(arcBanquetApply);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcBanquetApply> list = arcBanquetApplyService.findAll();
        PageInfo<ArcBanquetApply> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
