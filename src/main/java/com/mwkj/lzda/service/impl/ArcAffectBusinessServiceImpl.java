package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcAffectBusinessMapper;
import com.mwkj.lzda.model.ArcAffectBusiness;
import com.mwkj.lzda.service.ArcAffectBusinessService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-11 11:22
* @Description TODO
*/
@Service
@Transactional
public class ArcAffectBusinessServiceImpl extends AbstractService<ArcAffectBusiness> implements ArcAffectBusinessService {
    @Resource
    private ArcAffectBusinessMapper arcAffectBusinessMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcAffectBusiness arcAffectBusiness, Approve approve, HttpServletRequest request) {

    this.save(arcAffectBusiness);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcAffectBusiness.getId());
    approve.setArchiveType(arcAffectBusiness.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
