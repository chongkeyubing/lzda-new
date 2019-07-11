package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcFamilyAbroadMapper;
import com.mwkj.lzda.model.ArcFamilyAbroad;
import com.mwkj.lzda.service.ArcFamilyAbroadService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-11 14:47
* @Description TODO
*/
@Service
@Transactional
public class ArcFamilyAbroadServiceImpl extends AbstractService<ArcFamilyAbroad> implements ArcFamilyAbroadService {
    @Resource
    private ArcFamilyAbroadMapper arcFamilyAbroadMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcFamilyAbroad arcFamilyAbroad, Approve approve, HttpServletRequest request) {

    this.save(arcFamilyAbroad);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcFamilyAbroad.getId());
    approve.setArchiveType(arcFamilyAbroad.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
