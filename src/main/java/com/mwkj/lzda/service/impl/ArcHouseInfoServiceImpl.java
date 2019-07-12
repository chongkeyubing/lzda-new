package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcHouseInfoMapper;
import com.mwkj.lzda.model.ArcHouseInfo;
import com.mwkj.lzda.service.ArcHouseInfoService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-12 14:40
* @Description TODO
*/
@Service
@Transactional
public class ArcHouseInfoServiceImpl extends AbstractService<ArcHouseInfo> implements ArcHouseInfoService {
    @Resource
    private ArcHouseInfoMapper arcHouseInfoMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcHouseInfo arcHouseInfo, Approve approve, HttpServletRequest request) {

    this.save(arcHouseInfo);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcHouseInfo.getId());
    approve.setArchiveType(arcHouseInfo.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
