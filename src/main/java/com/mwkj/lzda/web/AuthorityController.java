package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.Authority;
import com.mwkj.lzda.service.AuthorityService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by CodeGenerator on 2019/06/24.
*/
@Controller
@RequestMapping("/authority")
public class AuthorityController {
    @Resource
    private AuthorityService authorityService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(Authority authority) {
        authorityService.save(authority);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        authorityService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(Authority authority) {
        authorityService.update(authority);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        Authority authority = authorityService.findById(id);
        return ResultUtil.success(authority);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<Authority> list = authorityService.findAll();
        PageInfo<Authority> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
