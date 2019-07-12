package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcPoliceInvolveMapper;
import com.mwkj.lzda.model.ArcPoliceInvolve;
import com.mwkj.lzda.service.ArcPoliceInvolveService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-12 11:07
* @Description TODO
*/
@Service
@Transactional
public class ArcPoliceInvolveServiceImpl extends AbstractService<ArcPoliceInvolve> implements ArcPoliceInvolveService {
    @Resource
    private ArcPoliceInvolveMapper arcPoliceInvolveMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcPoliceInvolve arcPoliceInvolve, Approve approve, HttpServletRequest request) {

    this.save(arcPoliceInvolve);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcPoliceInvolve.getId());
    approve.setArchiveType(arcPoliceInvolve.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
