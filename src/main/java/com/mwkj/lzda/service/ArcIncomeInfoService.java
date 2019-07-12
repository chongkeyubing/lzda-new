package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcIncomeInfo;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-12 11:32
* @Description TODO
*/
public interface ArcIncomeInfoService extends Service<ArcIncomeInfo> {
    void add(ArcIncomeInfo arcIncomeInfo, Approve approve, HttpServletRequest request);
}
