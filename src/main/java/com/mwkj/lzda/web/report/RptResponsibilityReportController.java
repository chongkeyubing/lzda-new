package com.mwkj.lzda.web.report;

import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.dto.RptResponsibilityReportDTO;
import com.mwkj.lzda.enu.LogOperateTypeEnum;
import com.mwkj.lzda.enu.RptTableNameEnum;
import com.mwkj.lzda.model.*;
import com.mwkj.lzda.service.*;
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

    @Resource
    private RptResponsibilityReportTaskService rptResponsibilityReportTaskService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(RptResponsibilityReportDTO rptResponsibilityReportDTO, HttpServletRequest request) {
        rptResponsibilityReportService.add(rptResponsibilityReportDTO, request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        //删除主表数据
        RptResponsibilityReport rptResponsibilityReport = rptResponsibilityReportService.findById(id);
        rptResponsibilityReportService.deleteById(id);

        //删除任务表数据
        RptResponsibilityReportTask rptResponsibilityReportTask = new RptResponsibilityReportTask();
        rptResponsibilityReportTask.setResponsibilityReportId(id);
        rptResponsibilityReportTaskService.delete(rptResponsibilityReportTask);

        //日志操作
        //                                                  表名                  操作                                    操作人
        operateLogService.save(RptTableNameEnum.主体责任上报.toString(), LogOperateTypeEnum.删除.toString(), rptResponsibilityReport.getCommitterId());

        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(RptResponsibilityReportDTO rptResponsibilityReportDTO, HttpServletRequest request) {
        rptResponsibilityReportService.update(rptResponsibilityReportDTO, request);


        //日志操作
        //                                                  表名                  操作                                    操作人
        operateLogService.save(RptTableNameEnum.主体责任上报.toString(),
                LogOperateTypeEnum.修改.toString(),
                rptResponsibilityReportDTO.getReport().getCommitterId());
        return ResultUtil.success();
    }

    @RequestMapping("/toDetail")
    public String detail(@RequestParam Integer id, ModelMap map) {
        //主表
        RptResponsibilityReport rptResponsibilityReport = rptResponsibilityReportService.findById(id);
        map.put("report", rptResponsibilityReport);

        //主体责任季度工单
        RptResponsibilityReportTask rptResponsibilityReportTask = new RptResponsibilityReportTask();
        rptResponsibilityReportTask.setResponsibilityReportId(id);
        rptResponsibilityReportTask.setType("0");
        map.put("tasks1", rptResponsibilityReportTaskService.find(rptResponsibilityReportTask));

        //“第一责任人”责任季度工单
        rptResponsibilityReportTask.setType("1");
        map.put("tasks2", rptResponsibilityReportTaskService.find(rptResponsibilityReportTask));

        //查询附件
        Attachment attachment = new Attachment();
        attachment.setSourceId(rptResponsibilityReport.getAttachmentId());
        List<Attachment> attachments = attachmentService.find(attachment);
        map.put("attachments", attachments);

        //日志操作
        operateLogService.save(RptTableNameEnum.主体责任上报.toString(), LogOperateTypeEnum.查看.toString(), rptResponsibilityReport.getCommitterId());
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
        criteria.andEqualTo("organizationId", rptResponsibilityReport.getOrganizationId());

        if (StringUtils.isNotBlank(rptResponsibilityReport.getYear())) {
            criteria.andEqualTo("year", rptResponsibilityReport.getYear());
        }
        if (StringUtils.isNotBlank(rptResponsibilityReport.getQuarter())) {
            criteria.andEqualTo("quarter", rptResponsibilityReport.getQuarter());
        }

        //如果是能查看本单位
        if (SecurityUtils.getSubject().isPermitted("能查看本单位")) {
            User user = (User) session.getAttribute("currentUser");
            criteria.andEqualTo("organizationId", user.getOrganizationId());
        }

        //构造sql语句的 order by 条件
        condition.setOrderByClause("create_time desc");

        List<RptResponsibilityReport> list = rptResponsibilityReportService.findByCondition(condition);

        PageInfo<RptResponsibilityReport> pageInfo = new PageInfo<>(list);
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
        return "views/report/responsibility_report_list";
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
        return "views/report/responsibility_report_add";
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
        RptResponsibilityReport rptResponsibilityReport = rptResponsibilityReportService.findById(id);
        map.put("report", rptResponsibilityReport);

        //查询附件
        Attachment attachment = new Attachment();
        attachment.setSourceId(rptResponsibilityReport.getAttachmentId());
        List<Attachment> attachments = attachmentService.find(attachment);
        map.put("attachments", attachments);

        //任务表
        RptResponsibilityReportTask rptResponsibilityReportTask = new RptResponsibilityReportTask();
        rptResponsibilityReportTask.setResponsibilityReportId(id);
        map.put("tasks", rptResponsibilityReportTaskService.find(rptResponsibilityReportTask));

        return "views/report/responsibility_report_update";
    }
}
