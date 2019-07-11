package com.mwkj.lzda.service;

import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.vo.BasicInfoVo;

import javax.servlet.http.HttpServletRequest;


/**
 * @Author: libaogang
 * @Date: 2019-07-04 11:10
 * @Description
 */
public interface ApproveService extends Service<Approve> {
    void addApprove(Approve approve, HttpServletRequest request);

    void approvePass(Approve approve, HttpServletRequest request);

    void reject(Approve approve, HttpServletRequest request);
}
