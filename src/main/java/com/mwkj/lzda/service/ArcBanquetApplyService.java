package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcBanquetApply;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-11 10:27
* @Description TODO
*/
public interface ArcBanquetApplyService extends Service<ArcBanquetApply> {
    void add(ArcBanquetApply arcBanquetApply, Approve approve, HttpServletRequest request);
}
