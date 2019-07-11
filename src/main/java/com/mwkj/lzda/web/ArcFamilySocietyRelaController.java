package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.ArcFamilySocietyRela;
import com.mwkj.lzda.service.ArcFamilySocietyRelaService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
* @Author: libaogang
* @Date: 2019-07-05 16:55
* @Description
*/
@Controller
@RequestMapping("/arcfamilysocietyrela")
public class ArcFamilySocietyRelaController {
    @Resource
    private ArcFamilySocietyRelaService arcFamilySocietyRelaService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcFamilySocietyRela arcFamilySocietyRela) {
        arcFamilySocietyRelaService.save(arcFamilySocietyRela);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcFamilySocietyRelaService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcFamilySocietyRela arcFamilySocietyRela) {
        arcFamilySocietyRelaService.update(arcFamilySocietyRela);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcFamilySocietyRela arcFamilySocietyRela = arcFamilySocietyRelaService.findById(id);
        return ResultUtil.success(arcFamilySocietyRela);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcFamilySocietyRela> list = arcFamilySocietyRelaService.findAll();
        PageInfo<ArcFamilySocietyRela> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
