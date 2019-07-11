package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcFamilyWorkabroadMapper;
import com.mwkj.lzda.model.ArcFamilyWorkabroad;
import com.mwkj.lzda.service.ArcFamilyWorkabroadService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-11 15:49
* @Description TODO
*/
@Service
@Transactional
public class ArcFamilyWorkabroadServiceImpl extends AbstractService<ArcFamilyWorkabroad> implements ArcFamilyWorkabroadService {
    @Resource
    private ArcFamilyWorkabroadMapper arcFamilyWorkabroadMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcFamilyWorkabroad arcFamilyWorkabroad, Approve approve, HttpServletRequest request) {

    this.save(arcFamilyWorkabroad);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcFamilyWorkabroad.getId());
    approve.setArchiveType(arcFamilyWorkabroad.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
