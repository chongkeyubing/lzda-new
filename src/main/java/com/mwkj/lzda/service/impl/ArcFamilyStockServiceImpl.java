package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcFamilyStockMapper;
import com.mwkj.lzda.model.ArcFamilyStock;
import com.mwkj.lzda.service.ArcFamilyStockService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-11 16:45
* @Description TODO
*/
@Service
@Transactional
public class ArcFamilyStockServiceImpl extends AbstractService<ArcFamilyStock> implements ArcFamilyStockService {
    @Resource
    private ArcFamilyStockMapper arcFamilyStockMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcFamilyStock arcFamilyStock, Approve approve, HttpServletRequest request) {

    this.save(arcFamilyStock);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcFamilyStock.getId());
    approve.setArchiveType(arcFamilyStock.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
