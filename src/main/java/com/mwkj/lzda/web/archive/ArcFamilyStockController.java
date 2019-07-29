package com.mwkj.lzda.web.archive;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcFamilyStock;
import com.mwkj.lzda.service.ArcFamilyStockService;
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
* @Date: 2019-07-11 16:45
* @Description TODO
*/
@Controller
@RequestMapping("/arcfamilystock")
public class ArcFamilyStockController {
    @Resource
    private ArcFamilyStockService arcFamilyStockService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcFamilyStock arcFamilyStock, Approve approve, HttpServletRequest request) {
        arcFamilyStockService.add(arcFamilyStock,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcFamilyStockService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcFamilyStock arcFamilyStock) {
        arcFamilyStockService.update(arcFamilyStock);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcFamilyStock arcFamilyStock = arcFamilyStockService.findById(id);
        return ResultUtil.success(arcFamilyStock);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcFamilyStock> list = arcFamilyStockService.findAll();
        PageInfo<ArcFamilyStock> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
