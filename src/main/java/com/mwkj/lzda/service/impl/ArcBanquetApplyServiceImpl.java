package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcBanquetApplyMapper;
import com.mwkj.lzda.model.ArcBanquetApply;
import com.mwkj.lzda.service.ArcBanquetApplyService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-11 10:27
* @Description TODO
*/
@Service
@Transactional
public class ArcBanquetApplyServiceImpl extends AbstractService<ArcBanquetApply> implements ArcBanquetApplyService {
    @Resource
    private ArcBanquetApplyMapper arcBanquetApplyMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcBanquetApply arcBanquetApply, Approve approve, HttpServletRequest request) {

    this.save(arcBanquetApply);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcBanquetApply.getId());
    approve.setArchiveType(arcBanquetApply.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
