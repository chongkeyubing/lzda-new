package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcFamilyFundMapper;
import com.mwkj.lzda.model.ArcFamilyFund;
import com.mwkj.lzda.service.ArcFamilyFundService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-11 17:31
* @Description TODO
*/
@Service
@Transactional
public class ArcFamilyFundServiceImpl extends AbstractService<ArcFamilyFund> implements ArcFamilyFundService {
    @Resource
    private ArcFamilyFundMapper arcFamilyFundMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcFamilyFund arcFamilyFund, Approve approve, HttpServletRequest request) {

    this.save(arcFamilyFund);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcFamilyFund.getId());
    approve.setArchiveType(arcFamilyFund.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
