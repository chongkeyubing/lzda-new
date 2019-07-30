package com.mwkj.lzda.web.incorrupt;

import com.mwkj.lzda.constant.SystemConstant;
import com.mwkj.lzda.core.AppException;
import com.mwkj.lzda.core.layui.LayuiDurationResolver;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.IncorruptReportService;
import com.mwkj.lzda.service.OrganizationService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.URLEncoder;
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
    public ResponseEntity<byte[]> export(int id, String time, HttpServletRequest request) throws Exception {
        Map<String, Object> paramMap = incorruptReportService.getIncorruptReportParam(id, LayuiDurationResolver.getBeginTime(time),
                LayuiDurationResolver.getEndTime(time));

        //获取配置,加载模板
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_23);
        cfg.setClassForTemplateLoading(this.getClass(), "/templet");
        cfg.setDefaultEncoding("UTF-8");
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.IGNORE_HANDLER);
        Template template = cfg.getTemplate("廉政报告模板.ftl");

        //报告本地存放路径
        time = time.replace(" - ", "至");
        String fileName = String.format("关于%s同志廉情报告%s.docx", ((User) paramMap.get("user")).getRealname(), time);
        File file = new File(SystemConstant.REPORT_TEMP_PATH + fileName);

        //本地生成报告
        Writer writer = new OutputStreamWriter(new FileOutputStream(file), "utf-8");
        template.process(paramMap, writer);
        writer.close();

        //下载
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment;filename=", URLEncoder.encode(fileName, "utf-8"));
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        ResponseEntity responseEntity = new ResponseEntity<>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);

        //删除临时文件
        file.delete();

        return responseEntity;
    }

}