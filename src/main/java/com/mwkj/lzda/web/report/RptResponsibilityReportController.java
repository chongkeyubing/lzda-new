package com.mwkj.lzda.web.report;

import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.enu.LogOperateTypeEnum;
import com.mwkj.lzda.enu.RptTableNameEnum;
import com.mwkj.lzda.model.*;
import com.mwkj.lzda.service.AttachmentService;
import com.mwkj.lzda.service.OperateLogService;
import com.mwkj.lzda.service.OrganizationService;
import com.mwkj.lzda.service.RptResponsibilityReportService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by CodeGenerator on 2019-07-22 10:17.
 */
@Controller
@RequestMapping("/rptresponsibilityreport")
public class RptResponsibilityReportController {
    @Resource
    private RptResponsibilityReportService rptResponsibilityReportService;
/*
    @Resource
    private RptResponsibilityReport responsibilityReport;*/

    @Resource
    private OrganizationService organizationService;

    @Resource
    private OperateLogService operateLogService;

    @Resource
    private AttachmentService attachmentService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(RptResponsibilityReport rptResponsibilityReport,HttpServletRequest request) {
        rptResponsibilityReportService.add(rptResponsibilityReport,request);

        //日志操作
        //                                                  表名                  操作                                    操作人
        operateLogService.save(RptTableNameEnum.主体责任上报.toString(), LogOperateTypeEnum.添加.toString(),rptResponsibilityReport.getCommitterId());

        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        RptResponsibilityReport rptResponsibilityReport=rptResponsibilityReportService.findById(id);

        rptResponsibilityReportService.deleteById(id);

        //日志操作
        //                                                  表名                  操作                                    操作人
        operateLogService.save(RptTableNameEnum.主体责任上报.toString(), LogOperateTypeEnum.删除.toString(),rptResponsibilityReport.getCommitterId());

        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(RptResponsibilityReport rptResponsibilityReport,HttpServletRequest request) {
        rptResponsibilityReportService.update(rptResponsibilityReport,request);

        //日志操作
        //                                                  表名                  操作                                    操作人
        operateLogService.save(RptTableNameEnum.主体责任上报.toString(), LogOperateTypeEnum.修改.toString(),rptResponsibilityReport.getCommitterId());
        return ResultUtil.success();
    }

    @RequestMapping("/toDetail")
    public String detail(@RequestParam Integer id ,ModelMap map) {
        RptResponsibilityReport rptResponsibilityReport = rptResponsibilityReportService.findById(id);

        //查询附件
        Attachment attachment = new Attachment();
        attachment.setSourceId(rptResponsibilityReport.getAttachmentId());
        List<Attachment> attachments =  attachmentService.find(attachment);

        map.put("report",rptResponsibilityReport);
        map.put("attachments",attachments);


        //日志操作
        //                                                  表名                  操作                                    操作人
        operateLogService.save(RptTableNameEnum.主体责任上报.toString(), LogOperateTypeEnum.查看.toString(),rptResponsibilityReport.getCommitterId());

        return "views/report/responsibility_report_detail";
    }

    /**
     * @return com.mwkj.lzda.core.Result
     * @Author libaogang
     * @Date 2019-07-22 11:21
     * @Param [rptResponsibilityReport, page, limit]
     * @Description 分页条件查询主体责任上报管理
     */
    @RequestMapping("/list")
    @ResponseBody
    public Result list(RptResponsibilityReport rptResponsibilityReport, HttpSession session,
                       @RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);

        Condition condition = new Condition(RptResponsibilityReport.class);

        Example.Criteria criteria = condition.createCriteria();
        //and 条件
        criteria.andEqualTo("organizationId",rptResponsibilityReport.getOrganizationId());

        if(StringUtils.isNotBlank(rptResponsibilityReport.getYear())){
            criteria.andEqualTo("year",rptResponsibilityReport.getYear());
        }
        if(StringUtils.isNotBlank(rptResponsibilityReport.getQuarter())){
            criteria.andEqualTo("quarter",rptResponsibilityReport.getQuarter());
        }


        //如果是能查看本单位
        if (SecurityUtils.getSubject().isPermitted("能查看本单位")) {
            User user = (User) session.getAttribute("currentUser");
            /*rptResponsibilityReport.setOrganizationId(user.getOrganizationId());*/
            criteria.andEqualTo("organizationId",user.getOrganizationId());
        }



        //构造sql语句的 order by  条件
        condition.setOrderByClause("create_time desc");

        /*List<RptResponsibilityReport> list = rptResponsibilityReportService.find(rptResponsibilityReport);*/
        List<RptResponsibilityReport> list = rptResponsibilityReportService.findByCondition(condition);

        PageInfo<RptResponsibilityReport> pageInfo = new PageInfo<>(list);
        return LayuiTableResultUtil.success(list, pageInfo.getTotal());
    }

    /**
     * @Author libaogang
     * @Date 2019-07-22 15:24
     * @Param [map]
     * @return java.lang.String
     * @Description 跳转到列表页
     */
    @RequestMapping("/toList")
    public String toList(ModelMap map) {
        //获取所有单位
        map.put("organizations", organizationService.findAll());
        return "views/report/responsibility_report_list";
    }

    /**
     * @Author libaogang
     * @Date 2019-07-22 15:24
     * @Param []
     * @return java.lang.String
     * @Description 跳转到新增页
     */
    @RequestMapping("/toAdd")
    public String toAdd() {
        return "views/report/responsibility_report_add";
    }

    /**
     * @Author libaogang
     * @Date 2019-07-22 15:24
     * @Param [id, map]
     * @return java.lang.String
     * @Description 跳转到更新页
     */
    @RequestMapping("/toUpdate")
    public String toUpdate(int id ,ModelMap map ) {
        RptResponsibilityReport rptResponsibilityReport = rptResponsibilityReportService.findById(id);

        //查询附件
        Attachment attachment = new Attachment();
        attachment.setSourceId(rptResponsibilityReport.getAttachmentId());
        List<Attachment> attachments =  attachmentService.find(attachment);

        map.put("report",rptResponsibilityReport);
        map.put("attachments",attachments);

        return "views/report/responsibility_report_update";
    }
}
