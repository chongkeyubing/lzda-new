package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcLeaveofficeHandover;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-11 14:21
* @Description TODO
*/
public interface ArcLeaveofficeHandoverService extends Service<ArcLeaveofficeHandover> {
    void add(ArcLeaveofficeHandover arcLeaveofficeHandover, Approve approve, HttpServletRequest request);
}
