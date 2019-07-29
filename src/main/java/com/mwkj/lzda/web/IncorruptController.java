package com.mwkj.lzda.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.dto.IncorruptSelfSummaryDTO;
import com.mwkj.lzda.model.IncorruptSelfSummary;
import com.mwkj.lzda.service.IncorruptService;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by CodeGenerator on 2019-07-26 15:01.
*/
@Controller
@RequestMapping("/incorrupt")
public class IncorruptController {
    @Resource
    private IncorruptService incorruptService;


    @RequestMapping("/toList")
    public String toList(ModelMap map ,IncorruptSelfSummaryDTO incorruptSelfSummaryDTO) {



        List<IncorruptSelfSummaryDTO> list = incorruptService.selectForPage(incorruptSelfSummaryDTO);

        map.put("map",list);
        return "views/incorruptSelfSummary/incorrupt_list";
    }


    /**
    * 方法实现说明
    * @author      zzy
    * @Description:(分页查询)
    * @date        2019/7/26/026 16:01
    */
  /*  @RequestMapping("/list")
    @ResponseBody
    public Result list(IncorruptSelfSummaryDTO IncorruptSelfSummaryDTO,
                       @RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {

        PageHelper.startPage(page, limit);
        List<IncorruptSelfSummaryDTO> list = incorruptService.selectForPage(IncorruptSelfSummaryDTO);
        PageInfo<IncorruptSelfSummaryDTO> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }*/



}
