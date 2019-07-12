package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcFamilyAbroadMarriage;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-12 14:58
* @Description TODO
*/
public interface ArcFamilyAbroadMarriageService extends Service<ArcFamilyAbroadMarriage> {
    void add(ArcFamilyAbroadMarriage arcFamilyAbroadMarriage, Approve approve, HttpServletRequest request);
}
