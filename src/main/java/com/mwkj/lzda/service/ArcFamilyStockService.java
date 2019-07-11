package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcFamilyStock;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-11 16:45
* @Description TODO
*/
public interface ArcFamilyStockService extends Service<ArcFamilyStock> {
    void add(ArcFamilyStock arcFamilyStock, Approve approve, HttpServletRequest request);
}
