package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.PunGift;
import com.mwkj.lzda.service.PunGiftService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by CodeGenerator on 2019-07-18 14:17.
*/
@Controller
@RequestMapping("/pungift")
public class PunGiftController {
    @Resource
    private PunGiftService punGiftService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(PunGift punGift) {
        punGiftService.save(punGift);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        punGiftService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(PunGift punGift) {
        punGiftService.update(punGift);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        PunGift punGift = punGiftService.findById(id);
        return ResultUtil.success(punGift);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<PunGift> list = punGiftService.findAll();
        PageInfo<PunGift> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
