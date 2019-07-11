package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcOrganizationMeeting;
import com.mwkj.lzda.service.ArcOrganizationMeetingService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
* @Author: libaogang
* @Date: 2019-07-11 08:37
* @Description TODO
*/
@Controller
@RequestMapping("/arcorganizationmeeting")
public class ArcOrganizationMeetingController {
    @Resource
    private ArcOrganizationMeetingService arcOrganizationMeetingService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcOrganizationMeeting arcOrganizationMeeting, Approve approve, HttpServletRequest request) {
        arcOrganizationMeetingService.add(arcOrganizationMeeting,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcOrganizationMeetingService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcOrganizationMeeting arcOrganizationMeeting) {
        arcOrganizationMeetingService.update(arcOrganizationMeeting);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcOrganizationMeeting arcOrganizationMeeting = arcOrganizationMeetingService.findById(id);
        return ResultUtil.success(arcOrganizationMeeting);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcOrganizationMeeting> list = arcOrganizationMeetingService.findAll();
        PageInfo<ArcOrganizationMeeting> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
