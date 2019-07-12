package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcFamilyMarriageMapper;
import com.mwkj.lzda.model.ArcFamilyMarriage;
import com.mwkj.lzda.service.ArcFamilyMarriageService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-12 10:39
* @Description TODO
*/
@Service
@Transactional
public class ArcFamilyMarriageServiceImpl extends AbstractService<ArcFamilyMarriage> implements ArcFamilyMarriageService {
    @Resource
    private ArcFamilyMarriageMapper arcFamilyMarriageMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcFamilyMarriage arcFamilyMarriage, Approve approve, HttpServletRequest request) {

    this.save(arcFamilyMarriage);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcFamilyMarriage.getId());
    approve.setArchiveType(arcFamilyMarriage.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
