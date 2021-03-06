package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcFamilyAbroadMarriageMapper;
import com.mwkj.lzda.model.ArcFamilyAbroadMarriage;
import com.mwkj.lzda.service.ArcFamilyAbroadMarriageService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-12 14:58
* @Description TODO
*/
@Service
@Transactional
public class ArcFamilyAbroadMarriageServiceImpl extends AbstractService<ArcFamilyAbroadMarriage> implements ArcFamilyAbroadMarriageService {
    @Resource
    private ArcFamilyAbroadMarriageMapper arcFamilyAbroadMarriageMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcFamilyAbroadMarriage arcFamilyAbroadMarriage, Approve approve, HttpServletRequest request) {

    this.save(arcFamilyAbroadMarriage);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcFamilyAbroadMarriage.getId());
    approve.setArchiveType(arcFamilyAbroadMarriage.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
