package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.PunAccountability;
import com.mwkj.lzda.service.PunAccountabilityService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
* Created by CodeGenerator on 2019-07-19 14:14.
*/
@Controller
@RequestMapping("/punaccountability")
public class PunAccountabilityController {
    @Resource
    private PunAccountabilityService punAccountabilityService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(PunAccountability punAccountability,HttpServletRequest request) {
        punAccountabilityService.add(punAccountability,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        punAccountabilityService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(PunAccountability punAccountability, HttpServletRequest  request) {
        punAccountabilityService.update(punAccountability,request);
        return ResultUtil.success();
    }

}
