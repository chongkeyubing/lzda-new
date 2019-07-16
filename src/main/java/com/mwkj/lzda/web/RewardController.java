package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.model.Reward;
import com.mwkj.lzda.service.RewardService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by CodeGenerator on 2019-07-15 13:57.
*/
@Controller
@RequestMapping("/reward")
public class RewardController {
    @Resource
    private RewardService rewardService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(Reward reward) {
        rewardService.save(reward);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        rewardService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(Reward reward) {
        rewardService.update(reward);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        Reward reward = rewardService.findById(id);
        return ResultUtil.success(reward);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<Reward> list = rewardService.findAll();
        PageInfo<Reward> pageInfo = new PageInfo<>(list);
        return LayuiTableResultUtil.success(list,pageInfo.getTotal());
    }

    @RequestMapping("/toAddReward")
    public String toAddReward(){
        return "views/reward/reward_add";
    }
}
