package com.mwkj.lzda.web.statistic;

import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.model.Organization;
import com.mwkj.lzda.service.OrganizationService;
import com.mwkj.lzda.service.PunViolationService;
import com.mwkj.lzda.util.EasyPOIUtil;
import com.mwkj.lzda.vo.PunViolationStatisticsVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: PunViolationStatisticController
 * @Description: 违纪统计表Controller
 * @Author: wj
 * @Date: 2019-7-29 18:35
 **/
@Controller
@RequestMapping("/punViolationStatistic")
public class PunViolationStatisticController implements Serializable {

    @Resource
    private OrganizationService organizationService;
    @Resource
    private PunViolationService punViolationService;

    /**
     * 跳转到违纪统计表页面
     *
     * @param map
     * @return
     */
    @RequestMapping("/toList")
    public String toPunViolationStatistic(ModelMap map) {
        map.put("organizations", organizationService.findAll());
        return "views/statistic/pun_violation_statistic_list";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result punViolationStatisticList(@RequestParam(defaultValue = "0") Integer page,
                                            @RequestParam(defaultValue = "0") Integer limit,
                                            @RequestParam(required = false) Integer orgId,
                                            @RequestParam(required = false) String time,
                                            HttpServletRequest request, HttpServletResponse response) {
        List<PunViolationStatisticsVo> list = punViolationService.findPunViolationStatistics(orgId, time, request, response);
        return LayuiTableResultUtil.success(list, list.size());
    }

    @RequestMapping("/list/export")
    @ResponseBody
    public void punViolationStatisticExport(@RequestParam(required = false) Integer orgId,
                                            @RequestParam(required = false) String time,
                                            HttpServletRequest request, HttpServletResponse response) throws Exception {
        String orgName = "";
        if (null != orgId) {
            Organization organization = organizationService.findById(orgId);
            orgName = organization.getName();
        }
        List<PunViolationStatisticsVo> list = punViolationService.findPunViolationStatistics(orgId, time, request, response);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("punViolationStatisticsList", list);
        String contextPath = request.getServletContext().getRealPath("/");
        String templetPath = contextPath + "resources" + File.separator + "templet" + File.separator + "违纪统计表模板.xlsx";
        String fileName = orgName + "违纪统计表" + time + ".xlsx";
        EasyPOIUtil.exportByTemplate(templetPath, map, "/export/", fileName);
        File file = new File("/export" + File.separator + fileName);
        //下载
        if (file.exists()) {
            response.setHeader("content-type", "application/octet-stream");
            response.setContentType("application/octet-stream");
            try {
                response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "utf-8"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            byte[] buffer = new byte[1024];
            FileInputStream fis = null;
            BufferedInputStream bis = null;
            try {
                fis = new FileInputStream(file);
                bis = new BufferedInputStream(fis);
                OutputStream os = response.getOutputStream();
                int i = bis.read(buffer);
                while (i != -1) {
                    os.write(buffer, 0, i);
                    i = bis.read(buffer);
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (bis != null) {
                    try {
                        bis.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                if (fis != null) {
                    try {
                        fis.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }

    }
}
