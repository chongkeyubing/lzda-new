package com.mwkj.lzda.web.punish;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.PunTalk;
import com.mwkj.lzda.service.PunTalkService;
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
* Created by CodeGenerator on 2019-07-19 14:34.
*/
@Controller
@RequestMapping("/puntalk")
public class PunTalkController {
    @Resource
    private PunTalkService punTalkService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(PunTalk punTalk,HttpServletRequest request) {
        punTalkService.add(punTalk,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        punTalkService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(PunTalk punTalk, HttpServletRequest  request) {
        punTalkService.update(punTalk,request);
        return ResultUtil.success();
    }

}
