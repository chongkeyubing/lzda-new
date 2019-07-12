package com.mwkj.lzda.service;
import com.mwkj.lzda.model.ArcPartTimeJob;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.model.Approve;
import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-12 14:19
* @Description TODO
*/
public interface ArcPartTimeJobService extends Service<ArcPartTimeJob> {
    void add(ArcPartTimeJob arcPartTimeJob, Approve approve, HttpServletRequest request);
}
