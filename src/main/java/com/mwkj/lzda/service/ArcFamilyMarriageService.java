package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcFamilyMarriage;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-12 10:39
* @Description TODO
*/
public interface ArcFamilyMarriageService extends Service<ArcFamilyMarriage> {
    void add(ArcFamilyMarriage arcFamilyMarriage, Approve approve, HttpServletRequest request);
}
