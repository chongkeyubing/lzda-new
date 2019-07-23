package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Mapper;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.dao.RptIncorruptMapper;
import com.mwkj.lzda.enu.LogOperateTypeEnum;
import com.mwkj.lzda.enu.RptTableNameEnum;
import com.mwkj.lzda.model.RptIncorrupt;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.OperateLogService;
import com.mwkj.lzda.service.OrganizationService;
import com.mwkj.lzda.service.RptIncorruptService;
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
* Created by CodeGenerator on 2019-07-19 10:40.
*/
@Controller
@RequestMapping("/rptincorrupt")
public class RptIncorruptController {
    @Resource
    private RptIncorruptService rptIncorruptService;


    @Resource
    private OrganizationService organizationService;

    @Resource
    private OperateLogService operateLogService;


    @RequestMapping("/add")
    @ResponseBody
    public Result add(RptIncorrupt rptIncorrupt) {
        rptIncorruptService.save(rptIncorrupt);

        //日志操作
        //                      表名                                               操作                                    操作人
        operateLogService.save(RptTableNameEnum.廉政信息上报.toString(), LogOperateTypeEnum.添加.toString(),rptIncorrupt.getOrganizationId());
        return ResultUtil.success();
    }

  /**
  * 方法实现说明
  * @author      zzy
  * @Description:(跳转到新增页面)
  * @date        2019/7/19/019 14:11
  */
  @RequestMapping("/toAddReport")
  public String toAddReport(){
      return "views/report/report_add";
  }


    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
      RptIncorrupt rptIncorrupt=rptIncorruptService.findById(id);

        rptIncorruptService.deleteById(id);

        //日志操作
        //                      表名              操作                                    操作人
        operateLogService.save(RptTableNameEnum.廉政信息上报.toString(), LogOperateTypeEnum.删除.toString(),rptIncorrupt.getOrganizationId());
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(RptIncorrupt rptIncorrupt) {
        rptIncorruptService.update(rptIncorrupt);

        //日志操作
        //                      表名              操作                                    操作人
        operateLogService.save(RptTableNameEnum.廉政信息上报.toString(),LogOperateTypeEnum.修改.toString(),rptIncorrupt.getOrganizationId());

        return ResultUtil.success();
    }


    /**
    * 方法实现说明
    * @author      zzy
    * @Description:(跳转到修改页面)
    * @date        2019/7/22/022 11:41
    */
    @RequestMapping("/toReportUpdate")
    public String toReportUpdate(Integer id,ModelMap map){
        RptIncorrupt rptIncorrupt =rptIncorruptService.findById(id);
        map.put("rptIncorrupt",rptIncorrupt);
        return "views/report/report_update";
    }


    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        RptIncorrupt rptIncorrupt = rptIncorruptService.findById(id);
        return ResultUtil.success(rptIncorrupt);
    }
    /**
    * 方法实现说明
    * @author      zzy
    * @Description:(跳转到详情页面)
    * @date         10:50
    */
    @RequestMapping("/toReportDetail")
    public String toReportDetail(Integer id,ModelMap map){
        RptIncorrupt rptIncorrupt =rptIncorruptService.findById(id);
            map.put("rptIncorrupt",rptIncorrupt);

        //日志操作
        //                      表名              操作                                    操作人
        operateLogService.save(RptTableNameEnum.廉政信息上报.toString(), LogOperateTypeEnum.查看.toString(),rptIncorrupt.getOrganizationId());

        return "views/report/report_detail";
    }


    /**
    * 方法实现说明
    * @author      zzy
    * @Description:(跳转到分页)
    * @date        2019/7/22/022 17:36
    */
    @RequestMapping("/toList")
    public String toList(ModelMap map) {
        //获取所有单位
        map.put("organizations", organizationService.findAll());
        return "views/report/report_list";
    }


    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit,
                       RptIncorrupt rptIncorrupt, HttpSession session) {
       /* PageHelper.startPage(page, size);
        List<RptIncorrupt> list = rptIncorruptService.findRewardsByCondition(rptIncorrupt);
        PageInfo<RptIncorrupt> pageInfo = new PageInfo<>(list);*/
        //return LayuiTableResultUtil.success(list,pageInfo.getTotal());

        PageHelper.startPage(page, limit);

        //如果是能查看本单位
        if (SecurityUtils.getSubject().isPermitted("能查看本单位")) {
            User user = (User) session.getAttribute("currentUser");
            rptIncorrupt.setOrganizationId(user.getOrganizationId());
        }

        //List<RptIncorrupt> list = rptIncorruptService.findAll();

        List<RptIncorrupt> list = rptIncorruptService.find(rptIncorrupt);



       /* List<RptIncorrupt> list = rptIncorruptService.selectForPage(rptIncorrupt);*/

        //生成分页信息，包含总数
        PageInfo<RptIncorrupt> pageInfo = new PageInfo<>(list);
       // return ResultUtil.success(pageInfo);
        return LayuiTableResultUtil.success(list,pageInfo.getTotal());



    }
}
