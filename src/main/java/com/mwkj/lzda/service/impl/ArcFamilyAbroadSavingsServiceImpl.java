package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcFamilyAbroadSavingsMapper;
import com.mwkj.lzda.model.ArcFamilyAbroadSavings;
import com.mwkj.lzda.service.ArcFamilyAbroadSavingsService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-12 09:21
* @Description TODO
*/
@Service
@Transactional
public class ArcFamilyAbroadSavingsServiceImpl extends AbstractService<ArcFamilyAbroadSavings> implements ArcFamilyAbroadSavingsService {
    @Resource
    private ArcFamilyAbroadSavingsMapper arcFamilyAbroadSavingsMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcFamilyAbroadSavings arcFamilyAbroadSavings, Approve approve, HttpServletRequest request) {

    this.save(arcFamilyAbroadSavings);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcFamilyAbroadSavings.getId());
    approve.setArchiveType(arcFamilyAbroadSavings.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
