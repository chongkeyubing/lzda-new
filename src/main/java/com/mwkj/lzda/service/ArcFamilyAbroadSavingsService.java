package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcFamilyAbroadSavings;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-12 09:21
* @Description TODO
*/
public interface ArcFamilyAbroadSavingsService extends Service<ArcFamilyAbroadSavings> {
    void add(ArcFamilyAbroadSavings arcFamilyAbroadSavings, Approve approve, HttpServletRequest request);
}
