package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcBasicInfo;
import com.mwkj.lzda.service.ArcBasicInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mwkj.lzda.dto.BasicInfoDTO;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
* @Author: libaogang
* @Date: 2019-07-11 09:31
* @Description TODO
*/
@Controller
@RequestMapping("/arcbasicinfo")
public class ArcBasicInfoController {
    @Resource
    private ArcBasicInfoService arcBasicInfoService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(BasicInfoDTO basicInfoDTO, Approve approve, HttpServletRequest request) {
        arcBasicInfoService.add(basicInfoDTO,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcBasicInfoService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcBasicInfo arcBasicInfo) {
        arcBasicInfoService.update(arcBasicInfo);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcBasicInfo arcBasicInfo = arcBasicInfoService.findById(id);
        return ResultUtil.success(arcBasicInfo);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcBasicInfo> list = arcBasicInfoService.findAll();
        PageInfo<ArcBasicInfo> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
