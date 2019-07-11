package com.mwkj.lzda.web;

import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


/**
 * Created by CodeGenerator on 2019/07/02.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(User user) {
        userService.save(user);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        userService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(User user) {
        userService.update(user);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        User user = userService.findById(id);
        return ResultUtil.success(user);
    }

    /**
     * @return com.mwkj.lzda.core.Result
     * @Author libaogang
     * @Date 2019-07-03 14:55
     * @Param [user, page, size]
     * @Description 查找审核人，普通民警查找单位负责人，单位负责人查找纪委或者督察大队
     */
    @RequestMapping("/findApprover")
    @ResponseBody
    public Result list(
            @RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "0") Integer limit,
            HttpSession session) {

        PageHelper.startPage(page, limit);

        User currentUser = (User) session.getAttribute("currentUser");
        List<User> users = null;

        // 如果是普通民警，查找单位负责人
        if (SecurityUtils.getSubject().hasRole("普通民警")) {
            User user = new User();
            user.setRoleid(2);  //单位负责人角色id
            user.setOrganizationId(currentUser.getOrganizationId());
            users = userService.find(user);
        }

        // 如果是单位负责人查找纪委和督察大队
        if (SecurityUtils.getSubject().hasRole("单位负责人")) {
            users = new ArrayList<>();

            User user = new User();
            user.setRoleid(5); //纪委角色id
            users.addAll(userService.find(user));

            user.setRoleid(6); //督察大队角色id
            users.addAll(userService.find(user));
        }

        //生成分页信息，包含总数
        PageInfo<User> pageInfo = new PageInfo<>(users);
        return LayuiTableResultUtil.success(users, pageInfo.getSize());
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-03 14:32
     * @Param []
     * @Description 返回用户选择页面
     */
    @RequestMapping("/toUserSelect")
    public String toUserSelect() {
        return "/views/userSelect";
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-03 14:32
     * @Param []
     * @Description 返回单位负责人选择页面
     */
    @RequestMapping("/toApproverSelect")
    public String toApproverSelect() {
        return "/views/approve/approver_select";
    }


}
