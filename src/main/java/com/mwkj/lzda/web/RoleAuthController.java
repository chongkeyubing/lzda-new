package com.mwkj.lzda.web;

import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.RoleAuth;
import com.mwkj.lzda.service.RoleAuthService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by CodeGenerator on 2019-07-20 18:21.
 */
@Controller
@RequestMapping("/roleauth")
public class RoleAuthController {
    @Resource
    private RoleAuthService roleAuthService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(RoleAuth roleAuth) {
        roleAuthService.save(roleAuth);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(RoleAuth roleAuth) {
        RoleAuth roleAuth1 = roleAuthService.findOne(roleAuth);
        roleAuthService.deleteById(roleAuth1.getId());
        return ResultUtil.success();
    }

    /**
     * @return com.mwkj.lzda.core.Result
     * @Author libaogang
     * @Date 2019-07-20 18:29
     * @Param [roleAuth]
     * @Description 查看范围更改
     */
    @RequestMapping("/update")
    @ResponseBody
    public Result update(RoleAuth roleAuth, int originViewAuthId) {
        roleAuthService.update(roleAuth, originViewAuthId);
        return ResultUtil.success();
    }


}
