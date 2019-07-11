package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcAffectBusiness;
import com.mwkj.lzda.service.ArcAffectBusinessService;
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
* @Date: 2019-07-11 11:22
* @Description TODO
*/
@Controller
@RequestMapping("/arcaffectbusiness")
public class ArcAffectBusinessController {
    @Resource
    private ArcAffectBusinessService arcAffectBusinessService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcAffectBusiness arcAffectBusiness, Approve approve, HttpServletRequest request) {
        arcAffectBusinessService.add(arcAffectBusiness,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcAffectBusinessService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcAffectBusiness arcAffectBusiness) {
        arcAffectBusinessService.update(arcAffectBusiness);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcAffectBusiness arcAffectBusiness = arcAffectBusinessService.findById(id);
        return ResultUtil.success(arcAffectBusiness);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcAffectBusiness> list = arcAffectBusinessService.findAll();
        PageInfo<ArcAffectBusiness> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
