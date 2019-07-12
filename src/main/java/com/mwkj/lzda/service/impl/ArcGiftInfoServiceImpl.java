package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcGiftInfoMapper;
import com.mwkj.lzda.model.ArcGiftInfo;
import com.mwkj.lzda.service.ArcGiftInfoService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-12 12:19
* @Description TODO
*/
@Service
@Transactional
public class ArcGiftInfoServiceImpl extends AbstractService<ArcGiftInfo> implements ArcGiftInfoService {
    @Resource
    private ArcGiftInfoMapper arcGiftInfoMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcGiftInfo arcGiftInfo, Approve approve, HttpServletRequest request) {

    this.save(arcGiftInfo);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcGiftInfo.getId());
    approve.setArchiveType(arcGiftInfo.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
