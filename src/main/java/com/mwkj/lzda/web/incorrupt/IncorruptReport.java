package com.mwkj.lzda.web.incorrupt;

import com.google.common.base.Strings;
import com.mwkj.lzda.core.layui.LayuiDurationResolver;
import com.mwkj.lzda.service.IncorruptReportService;
import com.mwkj.lzda.service.OrganizationService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

/**
 * @Author: libaogang
 * @Date: 2019-07-29 9:45
 * @Description 廉政报告控制器
 */
@Controller
@RequestMapping("/incorruptReport")
public class IncorruptReport {

    @Resource
    OrganizationService organizationService;

    @Resource
    IncorruptReportService incorruptReportService;

    @RequestMapping("/toList")
    public String toList(ModelMap map) {
        map.put("organizations", organizationService.findAll());
        return "/views/incorrupt/incorrupt_report_list";
    }

    @RequestMapping("/toDetail")
    public String toDetail(ModelMap map) {
        return "/views/incorrupt/incorrupt_report_detail";
    }

    /**
     * @return void
     * @Author libaogang
     * @Date 2019-07-30 10:00
     * @Param [id 用户id, time 时间段]
     * @Description 廉政报告导出
     */
    @RequestMapping("/export")
    public void export(int id, String time, HttpServletRequest request) throws Exception {
        Map<String, Object> paramMap = incorruptReportService.getIncorruptReportParam(id, LayuiDurationResolver.getBeginTime(time),
                LayuiDurationResolver.getEndTime(time));

        Configuration cfg = null;

        String templetFolder = "templet";
        File file = new File("templet");
        String s1 = request.getContextPath();
        String s = request.getSession().getServletContext().getRealPath("") + request.getContextPath();


        cfg = new Configuration(Configuration.VERSION_2_3_23);
        cfg.setDirectoryForTemplateLoading(new File(templetFolder));
        cfg.setDefaultEncoding("UTF-8");
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.IGNORE_HANDLER);

        Template template = cfg.getTemplate("廉政报告模板.ftl");
        Writer writer = new OutputStreamWriter(new FileOutputStream("temp/temp.doc"), "utf-8");
        template.process(paramMap, writer);
        writer.close();

    }

}