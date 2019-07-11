package com.mwkj.lzda.web;

import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.ApproveService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
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
 * @Author: libaogang
 * @Date: 2019-07-04 11:10
 * @Description 档案审核查询控制器
 */
@Controller
@RequestMapping("/approve")
public class ApproveController {
    @Resource
    private ApproveService approveService;

    /**
     * @return com.mwkj.lzda.core.Result
     * @Author libaogang
     * @Date 2019-07-08 9:56
     * @Param [approve, page, limit]
     * @Description 档案审核查询
     */
    @RequestMapping("/list")
    @ResponseBody
    public Result list(Approve approve, HttpSession session,
                       @RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {

        User currentuser = (User) session.getAttribute("currentUser");

        Condition condition = new Condition(Approve.class);
        Example.Criteria criteria = condition.createCriteria();
        if(StringUtils.isNotBlank(approve.getCommitterName())){
            criteria.andLike("committerName","%"+ approve.getCommitterName() + "%");
        }
        if(StringUtils.isNotBlank(approve.getApplicantName())){
            criteria.andLike("applicantName","%"+ approve.getApplicantName() + "%");
        }
        criteria.andEqualTo("approverId",currentuser.getId());  //查询提交给自己的档案

        criteria.andEqualTo("archiveType",approve.getArchiveType());

        if(null == approve.getStatus() ){
            if(SecurityUtils.getSubject().hasRole("单位负责人")){
                approve.setStatus(1); //待单位负责人审核
            }else{
                approve.setStatus(4); //待纪委审核
            }
        }
        criteria.andEqualTo("status",approve.getStatus());

        // 待审核状态只查询最后一步是待审核的
        if(1 == approve.getStatus() || 4 == approve.getStatus()){
            criteria.andEqualTo("lastStep",1);
        }

        //时间倒叙
        condition.setOrderByClause("create_time desc");

        PageHelper.startPage(page, limit);
        List<Approve> list = approveService.findByCondition(condition);

        PageInfo<Approve> pageInfo = new PageInfo<>(list);
        return LayuiTableResultUtil.success(list, pageInfo.getTotal());
    }

    /**
     * @Author libaogang
     * @Date 2019-07-08 17:54
     * @Param [basicInfoVo, request]
     * @return com.mwkj.lzda.core.Result
     * @Description 通过审核
     */
    @RequestMapping("/approvePass")
    @ResponseBody
    public Result approvePass(Approve approve , HttpServletRequest request){
        approveService.approvePass(approve,request);
        return ResultUtil.success();
    }

    /**
     * @Author libaogang
     * @Date 2019-07-08 17:54
     * @Param [basicInfoVo, request]
     * @return com.mwkj.lzda.core.Result
     * @Description 驳回
     */
    @RequestMapping("/reject")
    @ResponseBody
    public Result reject(Approve approve, HttpServletRequest request){
        approveService.reject(approve,request);
        return ResultUtil.success();
    }
}
