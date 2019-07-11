package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcLeaveofficeHandover;
import com.mwkj.lzda.service.ArcLeaveofficeHandoverService;
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
* @Date: 2019-07-11 14:21
* @Description TODO
*/
@Controller
@RequestMapping("/arcleaveofficehandover")
public class ArcLeaveofficeHandoverController {
    @Resource
    private ArcLeaveofficeHandoverService arcLeaveofficeHandoverService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcLeaveofficeHandover arcLeaveofficeHandover, Approve approve, HttpServletRequest request) {
        arcLeaveofficeHandoverService.add(arcLeaveofficeHandover,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcLeaveofficeHandoverService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcLeaveofficeHandover arcLeaveofficeHandover) {
        arcLeaveofficeHandoverService.update(arcLeaveofficeHandover);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcLeaveofficeHandover arcLeaveofficeHandover = arcLeaveofficeHandoverService.findById(id);
        return ResultUtil.success(arcLeaveofficeHandover);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcLeaveofficeHandover> list = arcLeaveofficeHandoverService.findAll();
        PageInfo<ArcLeaveofficeHandover> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
