package com.mwkj.lzda.web.archive;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcFamilyCriminal;
import com.mwkj.lzda.service.ArcFamilyCriminalService;
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
* @Date: 2019-07-11 16:17
* @Description TODO
*/
@Controller
@RequestMapping("/arcfamilycriminal")
public class ArcFamilyCriminalController {
    @Resource
    private ArcFamilyCriminalService arcFamilyCriminalService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcFamilyCriminal arcFamilyCriminal, Approve approve, HttpServletRequest request) {
        arcFamilyCriminalService.add(arcFamilyCriminal,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcFamilyCriminalService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcFamilyCriminal arcFamilyCriminal) {
        arcFamilyCriminalService.update(arcFamilyCriminal);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcFamilyCriminal arcFamilyCriminal = arcFamilyCriminalService.findById(id);
        return ResultUtil.success(arcFamilyCriminal);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcFamilyCriminal> list = arcFamilyCriminalService.findAll();
        PageInfo<ArcFamilyCriminal> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
