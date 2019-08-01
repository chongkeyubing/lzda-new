package com.mwkj.lzda.web.archive;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcPassportInfo;
import com.mwkj.lzda.service.ArcPassportInfoService;
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
* @Date: 2019-07-10 21:00
* @Description TODO
*/
@Controller
@RequestMapping("/arcpassportinfo")
public class ArcPassportInfoController {
    @Resource
    private ArcPassportInfoService arcPassportInfoService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcPassportInfo arcPassportInfo, Approve approve, HttpServletRequest request) {
        arcPassportInfoService.add(arcPassportInfo ,approve ,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcPassportInfoService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcPassportInfo arcPassportInfo) {
        arcPassportInfoService.update(arcPassportInfo);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcPassportInfo arcPassportInfo = arcPassportInfoService.findById(id);
        return ResultUtil.success(arcPassportInfo);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcPassportInfo> list = arcPassportInfoService.findAll();
        PageInfo<ArcPassportInfo> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
