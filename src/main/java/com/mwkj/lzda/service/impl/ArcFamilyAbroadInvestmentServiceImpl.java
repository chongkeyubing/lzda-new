package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcFamilyAbroadInvestmentMapper;
import com.mwkj.lzda.model.ArcFamilyAbroadInvestment;
import com.mwkj.lzda.service.ArcFamilyAbroadInvestmentService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-12 09:28
* @Description TODO
*/
@Service
@Transactional
public class ArcFamilyAbroadInvestmentServiceImpl extends AbstractService<ArcFamilyAbroadInvestment> implements ArcFamilyAbroadInvestmentService {
    @Resource
    private ArcFamilyAbroadInvestmentMapper arcFamilyAbroadInvestmentMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcFamilyAbroadInvestment arcFamilyAbroadInvestment, Approve approve, HttpServletRequest request) {

    this.save(arcFamilyAbroadInvestment);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcFamilyAbroadInvestment.getId());
    approve.setArchiveType(arcFamilyAbroadInvestment.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
