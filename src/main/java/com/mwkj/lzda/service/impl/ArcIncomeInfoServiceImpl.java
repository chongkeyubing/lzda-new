package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcIncomeInfoMapper;
import com.mwkj.lzda.model.ArcIncomeInfo;
import com.mwkj.lzda.service.ArcIncomeInfoService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-12 11:32
* @Description TODO
*/
@Service
@Transactional
public class ArcIncomeInfoServiceImpl extends AbstractService<ArcIncomeInfo> implements ArcIncomeInfoService {
    @Resource
    private ArcIncomeInfoMapper arcIncomeInfoMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcIncomeInfo arcIncomeInfo, Approve approve, HttpServletRequest request) {

    this.save(arcIncomeInfo);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcIncomeInfo.getId());
    approve.setArchiveType(arcIncomeInfo.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
