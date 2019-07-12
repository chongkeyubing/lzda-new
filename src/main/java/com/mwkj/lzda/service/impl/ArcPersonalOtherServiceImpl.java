package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcPersonalOtherMapper;
import com.mwkj.lzda.model.ArcPersonalOther;
import com.mwkj.lzda.service.ArcPersonalOtherService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-12 10:28
* @Description TODO
*/
@Service
@Transactional
public class ArcPersonalOtherServiceImpl extends AbstractService<ArcPersonalOther> implements ArcPersonalOtherService {
    @Resource
    private ArcPersonalOtherMapper arcPersonalOtherMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcPersonalOther arcPersonalOther, Approve approve, HttpServletRequest request) {

    this.save(arcPersonalOther);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcPersonalOther.getId());
    approve.setArchiveType(arcPersonalOther.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
