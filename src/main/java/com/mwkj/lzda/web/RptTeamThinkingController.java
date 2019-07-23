package com.mwkj.lzda.web;

import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.enu.LogOperateTypeEnum;
import com.mwkj.lzda.enu.RptTableNameEnum;
import com.mwkj.lzda.model.Attachment;
import com.mwkj.lzda.model.RptResponsibilityReport;
import com.mwkj.lzda.model.RptTeamThinking;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.OperateLogService;
import com.mwkj.lzda.service.OrganizationService;
import com.mwkj.lzda.service.RptTeamThinkingService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.SecurityUtils;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author libaogang
 * @Date 2019-07-22 16:30
 * @Description 队伍思想状况管理
 */
@Controller
@RequestMapping("/rptteamthinking")
public class RptTeamThinkingController {
    @Resource
    private RptTeamThinkingService rptTeamThinkingService;

    /*@Resource
    private RptTeamThinking rptTeamThinking;*/

    @Resource
    OrganizationService organizationService;


    @Resource
    private OperateLogService operateLogService;


    @RequestMapping("/add")
    @ResponseBody
    public Result add(RptTeamThinking rptTeamThinking) {
        rptTeamThinkingService.save(rptTeamThinking);

        //日志操作
        //                                                  表名                  操作                                    操作人
        operateLogService.save(RptTableNameEnum.队伍思想状况上报.toString(), LogOperateTypeEnum.添加.toString(),rptTeamThinking.getOrganizationId());

        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {

        RptTeamThinking rptTeamThinking=rptTeamThinkingService.findById(id);

        rptTeamThinkingService.deleteById(id);

        //日志操作
        //                                                  表名                  操作                                    操作人
        operateLogService.save(RptTableNameEnum.队伍思想状况上报.toString(), LogOperateTypeEnum.删除.toString(),rptTeamThinking.getOrganizationId());
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(RptTeamThinking rptTeamThinking) {
        rptTeamThinkingService.update(rptTeamThinking);

        //日志操作
        //                                                  表名                  操作                                    操作人
        operateLogService.save(RptTableNameEnum.队伍思想状况上报.toString(), LogOperateTypeEnum.修改.toString(),rptTeamThinking.getOrganizationId());
        return ResultUtil.success();
    }

    @RequestMapping("/toDetail")
    public String detail(@RequestParam Integer id, ModelMap map) {
        RptTeamThinking rptTeamThinking = rptTeamThinkingService.findById(id);
        map.put("report", rptTeamThinking);

        //日志操作
        //                                                  表名                  操作                                    操作人
        operateLogService.save(RptTableNameEnum.队伍思想状况上报.toString(), LogOperateTypeEnum.查看.toString(),rptTeamThinking.getOrganizationId());

        return "views/report/rpt_team_thinking_detail";
    }

    /**
     * @return com.mwkj.lzda.core.Result
     * @Author libaogang
     * @Date 2019-07-22 16:33
     * @Param [page, limit]
     * @Description 列表页表格分页条件查询
     */
    @RequestMapping("/list")
    @ResponseBody
    public Result list(RptTeamThinking rptTeamThinking, HttpSession session,
                       @RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);

        //如果是能查看本单位
        if (SecurityUtils.getSubject().isPermitted("能查看本单位")) {
            User user = (User) session.getAttribute("currentUser");
            rptTeamThinking.setOrganizationId(user.getOrganizationId());
        }

        List<RptTeamThinking> list = rptTeamThinkingService.find(rptTeamThinking);
        PageInfo<RptTeamThinking> pageInfo = new PageInfo<>(list);
        return LayuiTableResultUtil.success(list, pageInfo.getTotal());
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-22 16:33
     * @Param [map]
     * @Description 跳转到列表页
     */
    @RequestMapping("/toList")
    public String toList(ModelMap map) {
        //获取所有单位
        map.put("organizations", organizationService.findAll());
        return "views/report/rpt_team_thinking_list";
    }


    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-22 16:31
     * @Param []
     * @Description 跳转到新增页
     */
    @RequestMapping("/toAdd")
    public String toAdd() {
        return "views/report/rpt_team_thinking_add";
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-22 16:31
     * @Param [id, map]
     * @Description 跳转到修改页
     */
    @RequestMapping("/toUpdate")
    public String toUpdate(int id, ModelMap map) {
        map.put("report", rptTeamThinkingService.findById(id));
        return "views/report/rpt_team_thinking_update";
    }
}
