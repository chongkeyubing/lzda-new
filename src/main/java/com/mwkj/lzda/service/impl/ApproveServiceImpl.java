package com.mwkj.lzda.service.impl;

import com.alibaba.druid.util.DruidWebUtils;
import com.mwkj.lzda.dao.ApproveMapper;
import com.mwkj.lzda.enu.ArchiveTypeEnum;
import com.mwkj.lzda.enu.LogOperateTypeEnum;
import com.mwkj.lzda.enu.RoleEnum;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.OperateLog;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.core.AbstractService;
import com.mwkj.lzda.service.ArcBasicInfoService;
import com.mwkj.lzda.service.ArchiveService;
import com.mwkj.lzda.service.OperateLogService;
import com.mwkj.lzda.util.WebContextHolder;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @Author: libaogang
 * @Date: 2019-07-04 11:10
 * @Description 插入审核记录
 */
@Service
@Transactional
public class ApproveServiceImpl extends AbstractService<Approve> implements ApproveService {
    @Resource
    private ApproveMapper approveMapper;

    @Resource
    private ArcBasicInfoService arcBasicInfoService;

    @Resource
    private ArchiveService archiveService;

    @Resource
    private OperateLogService operateLogService;

    /**
     * @return void
     * @Author libaogang
     * @Date 2019-07-09 9:09
     * @Param [approve, request]
     * @Description 插入审核记录
     */
    @Override
    public void addApprove(Approve approve, HttpServletRequest request) {
        User currentUser = (User) request.getSession().getAttribute("currentUser");

        Approve approve1 = new Approve();

        //提交人,当前用户
        approve1.setCommitterId(currentUser.getId());
        approve1.setCommitterName(currentUser.getRealname());

        //填表人,当前用户
        approve1.setApplicantId(currentUser.getId());
        approve1.setApplicantName(currentUser.getRealname());


        Subject subject = SecurityUtils.getSubject();
        //如果是纪委或者督察审核人填自己，默认审核通过
        if (!(subject.hasRole(RoleEnum.纪委.toString()) || subject.hasRole(RoleEnum.督察大队.toString()))) {
            //审核人
            approve1.setApproverId(approve.getApproverId());
            approve1.setApproverName(approve.getApproverName());

            //如果有档案审核权限的，提交给纪委审核
            if (subject.isPermitted("档案审核")) {
                approve1.setStatus(4); //待纪委审核

                //对应档案表的档案状态修改为同样的状态
                archiveService.updateSpecifiedArchiveStatus(approve.getArchiveType(), approve.getArchiveId(), 4);
            } else {
                //普通民警
                approve1.setStatus(1); //待单位负责人审核，对应档案表的档案状态默认为1
            }

        } else {
            //审核人
            approve1.setApproverId(currentUser.getId());
            approve1.setApproverName(currentUser.getRealname());

            approve1.setStatus(5); //纪委审核通过
            approve1.setComments("通过");

            //对应档案表的档案状态修改为同样的状态
            archiveService.updateSpecifiedArchiveStatus(approve.getArchiveType(), approve.getArchiveId(), 5);
        }

        //档案类型
        approve1.setArchiveType(approve.getArchiveType());
        //档案id
        approve1.setArchiveId(approve.getArchiveId());
        approve1.setLastStep(1);
        this.save(approve1);
    }

    /**
     * @return void
     * @Author libaogang
     * @Date 2019-07-08 17:00
     * @Param [approve, request]
     * @Description 审核通过
     */
    public void approvePass(Approve approve, HttpServletRequest request) {
        User currentUser = (User) request.getSession().getAttribute("currentUser");

        Approve approve1 = findLastAndUpdateLastStep(approve);
        approve1.setCreateTime(null);
        //角色判断
        if (SecurityUtils.getSubject().hasRole(RoleEnum.单位负责人.toString())) {
            //添加第二条记录
            approve1.setId(null);

            approve1.setComments("通过");
            approve1.setStatus(2);  //单位负责人审核通过
            save(approve1);

            //添加第三条记录
            approve1.setId(null);
            approve1.setComments(null);
            approve1.setApproverId(approve.getApproverId());
            approve1.setApproverName(approve.getApproverName());
            approve1.setCommitterId(currentUser.getId());
            approve1.setCommitterName(currentUser.getRealname());
            approve1.setStatus(4); //待纪委审核
            approve1.setLastStep(1);
            save(approve1);

            //修改对应档案状态为同样状态
            archiveService.updateSpecifiedArchiveStatus(approve1.getArchiveType(), approve1.getArchiveId(), 4);
        } else {
            approve1.setId(null);
            approve1.setComments("通过");
            approve1.setStatus(5);  //纪委审核通过
            approve1.setLastStep(1);
            save(approve1);

            //修改对应档案状态为同样状态
            archiveService.updateSpecifiedArchiveStatus(approve1.getArchiveType(), approve1.getArchiveId(), 5);
        }

        //插入日志
        String operateObject = null;
        for (ArchiveTypeEnum typeEnum : ArchiveTypeEnum.values()) {
            if (approve.getArchiveType() == typeEnum.archiveType()) {
                operateObject = typeEnum.archiveName();
                break;
            }
        }

        operateLogService.save(operateObject, LogOperateTypeEnum.审核通过.toString(), approve.getApplicantId());
    }

    /**
     * @return void
     * @Author libaogang
     * @Date 2019-07-08 17:13
     * @Param [approve, request]
     * @Description 驳回
     */
    public void reject(Approve approve, HttpServletRequest request) {
        Approve approve1 = findLastAndUpdateLastStep(approve);
        User currentUser = (User) request.getSession().getAttribute("currentUser");

        if (SecurityUtils.getSubject().hasRole(RoleEnum.单位负责人.toString())) {
            approve1.setStatus(3); //单位负责人驳回
            //修改对应档案状态为通用状态
            archiveService.updateSpecifiedArchiveStatus(approve1.getArchiveType(), approve1.getArchiveId(), 3);
        } else {
            approve1.setStatus(6); //纪委驳回
            //修改对应档案状态为通用状态
            archiveService.updateSpecifiedArchiveStatus(approve1.getArchiveType(), approve1.getArchiveId(), 6);
        }
        approve1.setId(null);
        approve1.setCreateTime(null);
        approve1.setComments(approve.getComments());
        approve1.setLastStep(1);
        save(approve1);

        //插入日志
        String operateObject = null;
        for (ArchiveTypeEnum typeEnum : ArchiveTypeEnum.values()) {
            if (approve.getArchiveType() == typeEnum.archiveType()) {
                operateObject = typeEnum.archiveName();
                break;
            }
        }

        operateLogService.save(operateObject, LogOperateTypeEnum.审核驳回.toString(), approve.getApplicantId());
    }

    /**
     * @return com.mwkj.lzda.model.Approve
     * @Author libaogang
     * @Date 2019-07-08 17:14
     * @Param [approve]
     * @Description 审核通过和驳回公用部分
     */
    private Approve findLastAndUpdateLastStep(Approve approve) {
        //查询当前最后一步记录
        Approve approveParam = new Approve();
        approveParam.setArchiveId(approve.getArchiveId());
        approveParam.setArchiveType(approve.getArchiveType());
        approveParam.setLastStep(1);
        Approve approve1 = findOne(approveParam);

        //修改当前最后一步的laststep为0
        approve1.setLastStep(0);
        update(approve1);
        return approve1;
    }

}
