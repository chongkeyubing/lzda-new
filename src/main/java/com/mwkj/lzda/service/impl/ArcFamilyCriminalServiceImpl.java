package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcFamilyCriminalMapper;
import com.mwkj.lzda.model.ArcFamilyCriminal;
import com.mwkj.lzda.service.ArcFamilyCriminalService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-11 16:17
* @Description TODO
*/
@Service
@Transactional
public class ArcFamilyCriminalServiceImpl extends AbstractService<ArcFamilyCriminal> implements ArcFamilyCriminalService {
    @Resource
    private ArcFamilyCriminalMapper arcFamilyCriminalMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcFamilyCriminal arcFamilyCriminal, Approve approve, HttpServletRequest request) {

    this.save(arcFamilyCriminal);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcFamilyCriminal.getId());
    approve.setArchiveType(arcFamilyCriminal.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
