package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcFamilyInsuranceMapper;
import com.mwkj.lzda.model.ArcFamilyInsurance;
import com.mwkj.lzda.service.ArcFamilyInsuranceService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-11 17:50
* @Description TODO
*/
@Service
@Transactional
public class ArcFamilyInsuranceServiceImpl extends AbstractService<ArcFamilyInsurance> implements ArcFamilyInsuranceService {
    @Resource
    private ArcFamilyInsuranceMapper arcFamilyInsuranceMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcFamilyInsurance arcFamilyInsurance, Approve approve, HttpServletRequest request) {

    this.save(arcFamilyInsurance);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcFamilyInsurance.getId());
    approve.setArchiveType(arcFamilyInsurance.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
