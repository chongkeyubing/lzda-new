package com.mwkj.lzda.web;

import com.mwkj.lzda.core.AppException;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.core.layui.LayuiDurationResolver;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.enu.LogOperateTypeEnum;
import com.mwkj.lzda.model.ArcPoliceInvolve;
import com.mwkj.lzda.model.Attachment;
import com.mwkj.lzda.model.Reward;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.AttachmentService;
import com.mwkj.lzda.service.OperateLogService;
import com.mwkj.lzda.service.RewardService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.ui.ModelMap;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    private OperateLogService operateLogService;

    @Resource
    private AttachmentService attachmentService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(Reward reward, HttpServletRequest request) {
        rewardService.add(reward, request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        Reward reward = rewardService.findById(id);
        if (ObjectUtils.isEmpty(reward)) {
            throw new AppException("删除失败，数据不存在");
        }
        rewardService.deleteById(id);

        //插入日志信息
        operateLogService.save(reward.getRewardType(), LogOperateTypeEnum.删除.toString(), reward.getUserId());
        return ResultUtil.success();
    }

    /**
     * @return com.mwkj.lzda.core.Result
     * @Author libaogang
     * @Date 2019-07-17 15:06
     * @Param [reward, request]
     * @Description 更新奖励信息，重新上传附件
     */
    @RequestMapping("/update")
    @ResponseBody
    public Result update(Reward reward, HttpServletRequest request) {
        rewardService.update(reward, request);
        return ResultUtil.success();
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit,
                       Reward reward, HttpSession session) {

        PageHelper.startPage(page, limit);

        User currentuser = (User) session.getAttribute("currentUser");
        Subject subject = SecurityUtils.getSubject();
        if (subject.isPermitted("能查看本单位")) {
            reward.setOrganizationId(currentuser.getOrganizationId());
        } else if (subject.isPermitted("只能查看自己")) {
            reward.setUserId(currentuser.getId());
        }

        List<Reward> list = rewardService.findRewardsByCondition(reward);
        PageInfo<Reward> pageInfo = new PageInfo<>(list);
        return LayuiTableResultUtil.success(list, pageInfo.getTotal());
    }

    /**
     * @return com.mwkj.lzda.core.Result
     * @Author libaogang
     * @Date 2019-07-31 14:18
     * @Param [page, limit, reward, session]
     * @Description 表彰统计页面点击穿透接口
     */
    @RequestMapping("/list1")
    @ResponseBody
    public Result list1(@RequestParam(defaultValue = "0") Integer page,
                        @RequestParam(defaultValue = "0") Integer limit,
                        Reward reward, String time) {

        PageHelper.startPage(page, limit);
        Condition condition = new Condition(Reward.class);
        Example.Criteria criteria = condition.createCriteria();

        //设置单位id
        criteria.andEqualTo("organizationId", reward.getOrganizationId());
        if (StringUtils.isNotBlank(reward.getRewardType())) {
            criteria.andEqualTo("rewardType", reward.getRewardType());
        }

        if (StringUtils.isNotBlank(time)) {
            //设置时间段
            criteria.andBetween("rewardTime",
                    LayuiDurationResolver.getBeginTime(time),
                    LayuiDurationResolver.getEndTime(time));
        }
        List<Reward> list = rewardService.findByCondition(condition);
        PageInfo<Reward> pageInfo = new PageInfo<>(list);
        return LayuiTableResultUtil.success(list, pageInfo.getTotal());
    }


    @RequestMapping("/toAddReward")
    public String toAddReward() {
        return "views/reward/reward_add";
    }

    @RequestMapping("/toRewardDetail")
    public String toRewardDetail(Integer id, ModelMap map) {
        Reward reward = rewardService.findById(id);

        //附件信息
        Attachment attachment = new Attachment();
        attachment.setSourceId(reward.getAttachmentId());
        List<Attachment> attachments = attachmentService.find(attachment);

        map.put("reward", reward);
        map.put("attachments", attachments);

        //插入日志信息
        operateLogService.save(reward.getRewardType(), LogOperateTypeEnum.查看.toString(), reward.getUserId());

        return "views/reward/reward_detail";
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-17 14:04
     * @Param [id, map]
     * @Description 跳转到奖励信息修改
     */
    @RequestMapping("/toRewardUpdate")
    public String toRewardUpdate(Integer id, ModelMap map) {
        Reward reward = rewardService.findById(id);

        //附件信息
        Attachment attachment = new Attachment();
        attachment.setSourceId(reward.getAttachmentId());
        List<Attachment> attachments = attachmentService.find(attachment);

        map.put("reward", reward);
        map.put("attachments", attachments);

        return "views/reward/reward_update";
    }


}
