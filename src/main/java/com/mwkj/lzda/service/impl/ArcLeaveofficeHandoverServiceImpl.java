package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcLeaveofficeHandoverMapper;
import com.mwkj.lzda.model.ArcLeaveofficeHandover;
import com.mwkj.lzda.service.ArcLeaveofficeHandoverService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-11 14:21
* @Description TODO
*/
@Service
@Transactional
public class ArcLeaveofficeHandoverServiceImpl extends AbstractService<ArcLeaveofficeHandover> implements ArcLeaveofficeHandoverService {
    @Resource
    private ArcLeaveofficeHandoverMapper arcLeaveofficeHandoverMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcLeaveofficeHandover arcLeaveofficeHandover, Approve approve, HttpServletRequest request) {

    this.save(arcLeaveofficeHandover);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcLeaveofficeHandover.getId());
    approve.setArchiveType(arcLeaveofficeHandover.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
