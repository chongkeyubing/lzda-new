package com.mwkj.lzda.web.punish;
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
import javax.servlet.http.HttpServletRequest;

/**
* Created by CodeGenerator on 2019-07-19 14:48.
*/
@Controller
@RequestMapping("/pungift")
public class PunGiftController {
    @Resource
    private PunGiftService punGiftService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(PunGift punGift,HttpServletRequest request) {
        punGiftService.add(punGift,request);
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
    public Result update(PunGift punGift, HttpServletRequest  request) {
        punGiftService.update(punGift,request);
        return ResultUtil.success();
    }

}
