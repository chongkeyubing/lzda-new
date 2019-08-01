package com.mwkj.lzda.web;

import com.mwkj.lzda.core.AppException;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.core.layui.LayuiTableResult;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.dto.RoleWithAuthsDTO;
import com.mwkj.lzda.model.Authority;
import com.mwkj.lzda.model.Role;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.AuthorityService;
import com.mwkj.lzda.service.RoleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mwkj.lzda.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


/**
 * Created by CodeGenerator on 2019/06/24.
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    @Resource
    private RoleService roleService;

    @Resource
    private UserService userService;

    @Resource
    private AuthorityService authorityService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(Role role) {
        roleService.save(role);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        User user = new User();
        user.setRoleid(id);
        long count = userService.findCount(user);
        if(count != 0){
            throw new AppException("删除角色失败，存在该角色的用户");
        }
        roleService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(Role role) {
        roleService.update(role);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {

        //查找该角色所有权限
        RoleWithAuthsDTO roleWithAuthsDTO = roleService.findAuthsByRoleId(id);

        return ResultUtil.success(roleWithAuthsDTO);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(Role role,
                       @RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);

        Condition condition = new Condition(Role.class);
        Example.Criteria criteria = condition.createCriteria();

        if (StringUtils.isNotBlank(role.getRoleName())) {
            criteria.andLike("roleName", "%" + role.getRoleName() + "%");
        }

        List<Role> list = roleService.findByCondition(condition);
        PageInfo<Role> pageInfo = new PageInfo<>(list);
        return LayuiTableResultUtil.success(list, pageInfo.getTotal());
    }

    /**
     * @Author libaogang
     * @Date 2019-07-20 16:43
     * @Param [id]
     * @return java.lang.String
     * @Description 跳转到更新页
     */
    @RequestMapping("/toUpdate")
    public String toRoleUpdate(int id, ModelMap map){
        //查询所有权限
        List<Authority> authorities = authorityService.findAll();

        //查找该角色所有权限
        RoleWithAuthsDTO roleWithAuthsDTO = roleService.findAuthsByRoleId(id);

        map.put("roleWithAuths",roleWithAuthsDTO);
        map.put("authorities",authorities);

        return "views/role/role_update";
    }
}
