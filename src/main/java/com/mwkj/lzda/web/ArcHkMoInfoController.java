package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcHkMoInfo;
import com.mwkj.lzda.service.ArcHkMoInfoService;
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
* @Date: 2019-07-09 14:06
* @Description 本人持有港澳情况
*/
@Controller
@RequestMapping("/archkmoinfo")
public class ArcHkMoInfoController {
    @Resource
    private ArcHkMoInfoService arcHkMoInfoService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcHkMoInfo arcHkMoInfo, Approve approve, HttpServletRequest request) {
        arcHkMoInfoService.add(arcHkMoInfo,approve,request);
        return ResultUtil.success();
    }
}
