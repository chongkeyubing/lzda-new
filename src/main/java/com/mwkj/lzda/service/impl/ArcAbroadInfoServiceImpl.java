package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcAbroadInfoMapper;
import com.mwkj.lzda.model.ArcAbroadInfo;
import com.mwkj.lzda.service.ArcAbroadInfoService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-11 10:51
* @Description TODO
*/
@Service
@Transactional
public class ArcAbroadInfoServiceImpl extends AbstractService<ArcAbroadInfo> implements ArcAbroadInfoService {
    @Resource
    private ArcAbroadInfoMapper arcAbroadInfoMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcAbroadInfo arcAbroadInfo, Approve approve, HttpServletRequest request) {

    this.save(arcAbroadInfo);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcAbroadInfo.getId());
    approve.setArchiveType(arcAbroadInfo.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
