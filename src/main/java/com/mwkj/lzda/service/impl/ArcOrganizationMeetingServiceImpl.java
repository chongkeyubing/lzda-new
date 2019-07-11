package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcOrganizationMeetingMapper;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcOrganizationMeeting;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.service.ArcOrganizationMeetingService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @Author: libaogang
 * @Date: 2019-07-11 08:37
 * @Description TODO
 */
@Service
@Transactional
public class ArcOrganizationMeetingServiceImpl extends AbstractService<ArcOrganizationMeeting> implements ArcOrganizationMeetingService {
    @Resource
    private ArcOrganizationMeetingMapper arcOrganizationMeetingMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcOrganizationMeeting arcOrganizationMeeting, Approve approve, HttpServletRequest request) {
        this.save(arcOrganizationMeeting);

        //构造 插入审核申请 参数
        approve.setArchiveId(arcOrganizationMeeting.getId());
        approve.setArchiveType(arcOrganizationMeeting.getArchiveType());
        approve.setApproverId(approve.getApproverId());
        approve.setApproverName(approve.getApproverName());
        //插入审核申请
        approveService.addApprove(approve,request);
    }
}
