package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Mapper;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.model.RptIncorrupt;
import com.mwkj.lzda.service.RptIncorruptService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by CodeGenerator on 2019-07-19 10:40.
*/
@Controller
@RequestMapping("/rptincorrupt")
public class RptIncorruptController {
    @Resource
    private RptIncorruptService rptIncorruptService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(RptIncorrupt rptIncorrupt) {
        rptIncorruptService.save(rptIncorrupt);

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
        rptIncorruptService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(RptIncorrupt rptIncorrupt) {
        rptIncorruptService.update(rptIncorrupt);
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
        return "views/report/report_detail";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer size,
                       RptIncorrupt rptIncorrupt) {
       /* PageHelper.startPage(page, size);
        List<RptIncorrupt> list = rptIncorruptService.findRewardsByCondition(rptIncorrupt);
        PageInfo<RptIncorrupt> pageInfo = new PageInfo<>(list);*/
        //return LayuiTableResultUtil.success(list,pageInfo.getTotal());

        PageHelper.startPage(page, size);
        //List<RptIncorrupt> list = rptIncorruptService.findAll();
        List<RptIncorrupt> list = rptIncorruptService.selectForPage(rptIncorrupt);
        PageInfo<RptIncorrupt> pageInfo = new PageInfo<>(list);
       // return ResultUtil.success(pageInfo);
        return LayuiTableResultUtil.success(list,pageInfo.getTotal());



    }
}
