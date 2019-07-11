package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcFamilyCriminal;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-11 16:17
* @Description TODO
*/
public interface ArcFamilyCriminalService extends Service<ArcFamilyCriminal> {
    void add(ArcFamilyCriminal arcFamilyCriminal, Approve approve, HttpServletRequest request);
}
