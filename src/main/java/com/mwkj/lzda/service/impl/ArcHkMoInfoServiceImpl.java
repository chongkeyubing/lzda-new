package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcHkMoInfoMapper;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcHkMoInfo;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.service.ArcHkMoInfoService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
* @Author: libaogang
* @Date: 2019-07-09 14:06
* @Description TODO
*/
@Service
@Transactional
public class ArcHkMoInfoServiceImpl extends AbstractService<ArcHkMoInfo> implements ArcHkMoInfoService {
    @Resource
    private ArcHkMoInfoMapper arcHkMoInfoMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcHkMoInfo arcHkMoInfo, Approve approve, HttpServletRequest request) {

        this.save(arcHkMoInfo);

        //构造 插入审核申请 参数
        approve.setArchiveId(arcHkMoInfo.getId());
        approve.setArchiveType(arcHkMoInfo.getArchiveType());
        approve.setApproverId(approve.getApproverId());
        approve.setApproverName(approve.getApproverName());
        //插入审核申请
        approveService.addApprove(approve,request);
    }
}
