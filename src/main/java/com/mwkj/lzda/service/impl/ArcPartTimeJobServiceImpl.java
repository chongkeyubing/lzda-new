package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcPartTimeJobMapper;
import com.mwkj.lzda.model.ArcPartTimeJob;
import com.mwkj.lzda.service.ArcPartTimeJobService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-12 14:19
* @Description TODO
*/
@Service
@Transactional
public class ArcPartTimeJobServiceImpl extends AbstractService<ArcPartTimeJob> implements ArcPartTimeJobService {
    @Resource
    private ArcPartTimeJobMapper arcPartTimeJobMapper;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(ArcPartTimeJob arcPartTimeJob, Approve approve, HttpServletRequest request) {

    this.save(arcPartTimeJob);

    //构造 插入审核申请 参数
    approve.setArchiveId(arcPartTimeJob.getId());
    approve.setArchiveType(arcPartTimeJob.getArchiveType());
    approve.setApproverId(approve.getApproverId());
    approve.setApproverName(approve.getApproverName());
    //插入审核申请
    approveService.addApprove(approve,request);
    }

}
