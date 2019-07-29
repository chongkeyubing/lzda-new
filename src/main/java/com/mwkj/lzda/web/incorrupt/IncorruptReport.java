package com.mwkj.lzda.web.incorrupt;

import com.mwkj.lzda.service.OrganizationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

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

    @RequestMapping("/toList")
    public String toList(ModelMap map) {
        map.put("organizations", organizationService.findAll());
        return "/views/incorrupt/incorrupt_report_list";
    }

    @RequestMapping("/toDetail")
    public String toDetail(ModelMap map) {
        return "/views/incorrupt/incorrupt_report_detail";
    }


}