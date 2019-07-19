package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.PunNotice;
import com.mwkj.lzda.service.PunNoticeService;
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
* Created by CodeGenerator on 2019-07-19 14:38.
*/
@Controller
@RequestMapping("/punnotice")
public class PunNoticeController {
    @Resource
    private PunNoticeService punNoticeService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(PunNotice punNotice,HttpServletRequest request) {
        punNoticeService.add(punNotice,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        punNoticeService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(PunNotice punNotice, HttpServletRequest  request) {
        punNoticeService.update(punNotice,request);
        return ResultUtil.success();
    }

}
