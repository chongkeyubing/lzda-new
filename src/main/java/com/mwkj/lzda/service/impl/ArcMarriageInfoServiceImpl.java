package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcMarriageInfoMapper;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcMarriageInfo;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.service.ArcMarriageInfoService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
* @Author: libaogang
* @Date: 2019-07-10 22:15
* @Description TODO
*/
@Service
@Transactional
public class ArcMarriageInfoServiceImpl extends AbstractService<ArcMarriageInfo> implements ArcMarriageInfoService {
    @Resource
    private ArcMarriageInfoMapper arcMarriageInfoMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcMarriageInfo arcMarriageInfo, Approve approve, HttpServletRequest request) {
        this.save(arcMarriageInfo);

        //构造 插入审核申请 参数
        approve.setArchiveId(arcMarriageInfo.getId());
        approve.setArchiveType(arcMarriageInfo.getArchiveType());
        approve.setApproverId(approve.getApproverId());
        approve.setApproverName(approve.getApproverName());
        //插入审核申请
        approveService.addApprove(approve,request);
    }
}
