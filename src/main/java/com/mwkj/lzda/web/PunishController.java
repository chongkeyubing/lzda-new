package com.mwkj.lzda.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.dto.PunishDTO;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.PunishService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-04 11:10
 * @Description 违惩控制器
 */
@Controller
@RequestMapping("/punish")
public class PunishController {

    @Resource
    PunishService punishService;

    /**
     * @return com.mwkj.lzda.core.Result
     * @Author libaogang
     * @Date 2019-07-18 17:38
     * @Param [punishDTO, session, page, limit]
     * @Description 分页条件查询6类违惩表
     */
    @RequestMapping("/list")
    @ResponseBody
    public Result findAllPunishs(PunishDTO punishDTO,HttpSession session,
                                 @RequestParam(defaultValue = "0") int page,
                                 @RequestParam(defaultValue = "0") int limit) {
        //开启分页查询
        PageHelper.startPage(page, limit);

        User currentuser = (User) session.getAttribute("currentUser");
        Subject subject = SecurityUtils.getSubject();
        if (subject.isPermitted("能查看本单位")) {
            punishDTO.setOrganizationId(currentuser.getOrganizationId());
        } else if (subject.isPermitted("只能查看自己")) {
            punishDTO.setUserId(currentuser.getId());
        }

        //默认查询所有人
        List<PunishDTO> punishs = punishService.findAllPunishByConditions(punishDTO);

        PageInfo<PunishDTO> pageInfo = new PageInfo<>(punishs);

        return LayuiTableResultUtil.success(punishs, pageInfo.getTotal());
    }


    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-18 17:45
     * @Param [punishDTO, map]
     * @Description 根据违惩类型跳转到对应新增页面
     */
    @RequestMapping("/toAddPunish")
    public String toAddPunish(PunishDTO punishDTO, ModelMap map) {
        map.put("punishType", punishDTO.getPunishType());
        return punishService.toAddPunish(punishDTO);
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-18 17:48
     * @Param [archive, map]
     * @Description 根据违惩类型和违惩id查询违惩详情
     */
    @RequestMapping("/toPunishDetail")
    public String toPunishDetail(PunishDTO punishDTO, ModelMap map) {
        return punishService.toPunishDetail(punishDTO, map);
    }

    /**
     * @return com.mwkj.lzda.core.Result
     * @Author libaogang
     * @Date 2019-07-18 23:39
     * @Param [punishDTO, map]
     * @Description TODO
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(PunishDTO punishDTO) {
        punishService.delete(punishDTO);
        return ResultUtil.success();
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-19 9:45
     * @Param [punishDTO, map]
     * @Description 跳转到更新页面
     */
    @RequestMapping("/toPunishUpdate")
    public String toPunishUpdate(PunishDTO punishDTO, ModelMap map) {
        map.put("punishType", punishDTO.getPunishType());
        return punishService.toUpdate(punishDTO, map);
    }
}
