package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.model.Attachment;
import com.mwkj.lzda.model.Reward;
import com.mwkj.lzda.service.AttachmentService;
import com.mwkj.lzda.service.RewardService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
* Created by CodeGenerator on 2019-07-15 13:57.
*/
@Controller
@RequestMapping("/reward")
public class RewardController {
    @Resource
    private RewardService rewardService;

    @Resource
    private AttachmentService attachmentService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(Reward reward, HttpServletRequest request) {
        rewardService.add(reward,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        rewardService.deleteById(id);
        return ResultUtil.success();
    }

    /**
     * @Author libaogang
     * @Date 2019-07-17 15:06
     * @Param [reward, request]
     * @return com.mwkj.lzda.core.Result
     * @Description 更新奖励信息，重新上传附件
     */
    @RequestMapping("/update")
    @ResponseBody
    public Result update(Reward reward,HttpServletRequest request) {
        rewardService.update(reward,request);
        return ResultUtil.success();
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer size,
                       Reward reward) {

        PageHelper.startPage(page, size);
        List<Reward> list = rewardService.findRewardsByCondition(reward);
        PageInfo<Reward> pageInfo = new PageInfo<>(list);
        return LayuiTableResultUtil.success(list,pageInfo.getTotal());
    }

    @RequestMapping("/toAddReward")
    public String toAddReward(){
        return "views/reward/reward_add";
    }

    @RequestMapping("/toRewardDetail")
    public String toRewardDetail(Integer id, ModelMap map){
        Reward reward = rewardService.findById(id);

        //附件信息
        Attachment attachment = new Attachment();
        attachment.setSourceId(reward.getAttachmentId());
                    List<Attachment> attachments = attachmentService.find(attachment);

        map.put("reward",reward);
        map.put("attachments",attachments);

        return "views/reward/reward_detail";
    }

    /**
     * @Author libaogang
     * @Date 2019-07-17 14:04
     * @Param [id, map]
     * @return java.lang.String
     * @Description 跳转到奖励信息修改
     */
    @RequestMapping("/toRewardUpdate")
    public String toRewardUpdate(Integer id,ModelMap map){
        Reward reward = rewardService.findById(id);

        //附件信息
        Attachment attachment = new Attachment();
        attachment.setSourceId(reward.getAttachmentId());
        List<Attachment> attachments = attachmentService.find(attachment);

        map.put("reward",reward);
        map.put("attachments",attachments);

        return "views/reward/reward_update";
    }


}
