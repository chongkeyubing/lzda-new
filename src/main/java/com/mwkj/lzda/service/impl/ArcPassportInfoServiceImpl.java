package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcPassportInfoMapper;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcHkMoInfo;
import com.mwkj.lzda.model.ArcPassportInfo;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.service.ArcPassportInfoService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
* @Author: libaogang
* @Date: 2019-07-10 21:00
* @Description TODO
*/
@Service
@Transactional
public class ArcPassportInfoServiceImpl extends AbstractService<ArcPassportInfo> implements ArcPassportInfoService {
    @Resource
    private ArcPassportInfoMapper arcPassportInfoMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcPassportInfo arcPassportInfo, Approve approve, HttpServletRequest request) {

        this.save(arcPassportInfo);

        //构造 插入审核申请 参数
        approve.setArchiveId(arcPassportInfo.getId());
        approve.setArchiveType(arcPassportInfo.getArchiveType());
        approve.setApproverId(approve.getApproverId());
        approve.setApproverName(approve.getApproverName());
        //插入审核申请
        approveService.addApprove(approve,request);
    }
}
