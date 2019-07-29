package com.mwkj.lzda.web.archive;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcFamilyWorkabroad;
import com.mwkj.lzda.service.ArcFamilyWorkabroadService;
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
* @Date: 2019-07-11 15:49
* @Description TODO
*/
@Controller
@RequestMapping("/arcfamilyworkabroad")
public class ArcFamilyWorkabroadController {
    @Resource
    private ArcFamilyWorkabroadService arcFamilyWorkabroadService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcFamilyWorkabroad arcFamilyWorkabroad, Approve approve, HttpServletRequest request) {
        arcFamilyWorkabroadService.add(arcFamilyWorkabroad,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcFamilyWorkabroadService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcFamilyWorkabroad arcFamilyWorkabroad) {
        arcFamilyWorkabroadService.update(arcFamilyWorkabroad);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcFamilyWorkabroad arcFamilyWorkabroad = arcFamilyWorkabroadService.findById(id);
        return ResultUtil.success(arcFamilyWorkabroad);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcFamilyWorkabroad> list = arcFamilyWorkabroadService.findAll();
        PageInfo<ArcFamilyWorkabroad> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
