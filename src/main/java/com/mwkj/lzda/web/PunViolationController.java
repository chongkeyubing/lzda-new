package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.PunViolation;
import com.mwkj.lzda.service.PunViolationService;
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
* Created by CodeGenerator on 2019-07-18 20:34.
*/
@Controller
@RequestMapping("/punviolation")
public class PunViolationController {
    @Resource
    private PunViolationService punViolationService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(PunViolation punViolation, HttpServletRequest request) {
        punViolationService.add(punViolation,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        punViolationService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(PunViolation punViolation,HttpServletRequest request) {
        punViolationService.update(punViolation,request);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        PunViolation punViolation = punViolationService.findById(id);
        return ResultUtil.success(punViolation);
    }

}
