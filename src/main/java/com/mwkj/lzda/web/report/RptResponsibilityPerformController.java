package com.mwkj.lzda.web.report;

import com.mwkj.lzda.core.AppException;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.enu.LogOperateTypeEnum;
import com.mwkj.lzda.enu.RptTableNameEnum;
import com.mwkj.lzda.model.Attachment;
import com.mwkj.lzda.model.RptResponsibilityPerform;
import com.mwkj.lzda.model.RptResponsibilityReport;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.AttachmentService;
import com.mwkj.lzda.service.OperateLogService;
import com.mwkj.lzda.service.OrganizationService;
import com.mwkj.lzda.service.RptResponsibilityPerformService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.ui.ModelMap;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-22 17:24
 * @Description 履责纪实管理
 */
@Controller
@RequestMapping("/rptresponsibilityperform")
public class RptResponsibilityPerformController {
    @Resource
    private RptResponsibilityPerformService rptResponsibilityPerformService;

    @Resource
    private AttachmentService attachmentService;

    @Resource
    private OrganizationService organizationService;



    @Resource
    private OperateLogService operateLogService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(RptResponsibilityPerform rptResponsibilityPerform, HttpServletRequest request) {
        rptResponsibilityPerformService.add(rptResponsibilityPerform, request);

        //日志操作
        //                      表名              操作                                    操作人
        operateLogService.save(RptTableNameEnum.履责纪实上报.toString(), LogOperateTypeEnum.添加.toString(),rptResponsibilityPerform.getCommitterId());
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        RptResponsibilityPerform rptResponsibilityPerform=rptResponsibilityPerformService.findById(id);
        if (ObjectUtils.isEmpty(rptResponsibilityPerform)){
            throw new AppException("删除失败，数据不存在！！！");
        }

        rptResponsibilityPerformService.deleteById(id);

        //日志操作
        //                      表名              操作                                    操作人
        operateLogService.save(RptTableNameEnum.履责纪实上报.toString(), LogOperateTypeEnum.删除.toString(),rptResponsibilityPerform.getCommitterId());
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(RptResponsibilityPerform rptResponsibilityPerform, HttpServletRequest request) {
        rptResponsibilityPerformService.update(rptResponsibilityPerform, request);

        //日志操作
        //                      表名              操作                                    操作人
        operateLogService.save(RptTableNameEnum.履责纪实上报.toString(), LogOperateTypeEnum.修改.toString(),rptResponsibilityPerform.getCommitterId());

        return ResultUtil.success();
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-22 17:36
     * @Param [id, map]
     * @Description 跳转到详情页
     */
    @RequestMapping("/toDetail")
    public String detail(@RequestParam Integer id, ModelMap map) {
        RptResponsibilityPerform rptResponsibilityPerform = rptResponsibilityPerformService.findById(id);

        //查询附件
        Attachment attachment = new Attachment();
        attachment.setSourceId(rptResponsibilityPerform.getAttachmentId());
        List<Attachment> attachments = attachmentService.find(attachment);

        map.put("report", rptResponsibilityPerform);
        map.put("attachments", attachments);


        //日志操作
        //                                                   表名              操作                                    操作人
        operateLogService.save(RptTableNameEnum.履责纪实上报.toString(), LogOperateTypeEnum.查看.toString(),rptResponsibilityPerform.getCommitterId());

        return "views/report/rpt_responsibility_perform_detail";
    }

    /**
     * @return com.mwkj.lzda.core.Result
     * @Author libaogang
     * @Date 2019-07-22 17:37
     * @Param [rptResponsibilityReport, page, limit]
     * @Description 分页条件查询履责纪实管理
     */
    @RequestMapping("/list")
    @ResponseBody
    public Result list(RptResponsibilityPerform rptResponsibilityPerform, HttpSession session,
                       @RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);

        //如果是能查看本单位
        if (SecurityUtils.getSubject().isPermitted("能查看本单位")) {
            User user = (User) session.getAttribute("currentUser");
            rptResponsibilityPerform.setOrganizationId(user.getOrganizationId());
        }

        Condition condition = new Condition(RptResponsibilityPerform.class);
        Example.Criteria criteria = condition.createCriteria();


        if (StringUtils.isNotBlank(rptResponsibilityPerform.getTitle())) {
            criteria.andLike("title", "%" + rptResponsibilityPerform.getTitle() + "%");
        }

        if (StringUtils.isNotBlank(rptResponsibilityPerform.getTime())) {
            criteria.andEqualTo("time", rptResponsibilityPerform.getTime());
        }
        
        criteria.andEqualTo("organizationId", rptResponsibilityPerform.getOrganizationId());

        condition.setOrderByClause("create_time desc");

        List<RptResponsibilityPerform> list = rptResponsibilityPerformService.findByCondition(condition);
        PageInfo<RptResponsibilityPerform> pageInfo = new PageInfo<>(list);
        return LayuiTableResultUtil.success(list, pageInfo.getTotal());
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-22 15:24
     * @Param [map]
     * @Description 跳转到列表页
     */
    @RequestMapping("/toList")
    public String toList(ModelMap map) {
        //获取所有单位
        map.put("organizations", organizationService.findAll());
        return "views/report/rpt_responsibility_perform_list";
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-22 15:24
     * @Param []
     * @Description 跳转到新增页
     */
    @RequestMapping("/toAdd")
    public String toAdd() {
        return "views/report/rpt_responsibility_perform_add";
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-22 15:24
     * @Param [id, map]
     * @Description 跳转到更新页
     */
    @RequestMapping("/toUpdate")
    public String toUpdate(int id, ModelMap map) {
        RptResponsibilityPerform rptResponsibilityPerform = rptResponsibilityPerformService.findById(id);

        //查询附件
        Attachment attachment = new Attachment();
        attachment.setSourceId(rptResponsibilityPerform.getAttachmentId());
        List<Attachment> attachments = attachmentService.find(attachment);

        map.put("report", rptResponsibilityPerform);
        map.put("attachments", attachments);
        return "views/report/rpt_responsibility_perform_update";
    }
}
