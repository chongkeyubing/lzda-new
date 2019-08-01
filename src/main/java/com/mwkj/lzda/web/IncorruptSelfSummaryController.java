package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.dao.IncorruptSelfSummaryMapper;
import com.mwkj.lzda.dto.IncorruptSelfSummaryDTO;
import com.mwkj.lzda.model.IncorruptSelfSummary;
import com.mwkj.lzda.service.IncorruptSelfSummaryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

/**
* Created by CodeGenerator on 2019-07-26 16:39.
*/
@Controller
@RequestMapping("/incorruptselfsummary")
public class IncorruptSelfSummaryController {
    @Resource
    private IncorruptSelfSummaryService incorruptSelfSummaryService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(IncorruptSelfSummary incorruptSelfSummary) {
        incorruptSelfSummaryService.save(incorruptSelfSummary);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        incorruptSelfSummaryService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(IncorruptSelfSummary incorruptSelfSummary) {
        incorruptSelfSummaryService.update(incorruptSelfSummary);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        IncorruptSelfSummary incorruptSelfSummary = incorruptSelfSummaryService.findById(id);
        return ResultUtil.success(incorruptSelfSummary);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<IncorruptSelfSummary> list = incorruptSelfSummaryService.findAll();
        PageInfo<IncorruptSelfSummary> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }


    @RequestMapping("/toList")
    public String toList(ModelMap map , IncorruptSelfSummary incorruptSelfSummary) {
        List list =incorruptSelfSummaryService.find(incorruptSelfSummary);
/*
        Condition condition = new Condition(IncorruptSelfSummary.class);

        Example.Criteria criteria = condition.createCriteria();

        //构建where 条件  userid
        criteria.andEqualTo("userid",incorruptSelfSummary.getUserid());

        incorruptSelfSummaryService.updateByCondition(incorruptSelfSummary,condition);*/

       // incorruptSelfSummaryService.update(incorruptSelfSummary);



        if (list.size()>0){
            map.put("map",list);
            return "views/incorruptSelfSummary/incorrupt_list";
        }else{
            return "views/incorruptSelfSummary/incorrupt_add";
        }



    }

}
