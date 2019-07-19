package com.mwkj.lzda.service;
import com.mwkj.lzda.model.PunNotice;
import com.mwkj.lzda.core.Service;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by CodeGenerator on 2019-07-19 14:38.
 */
public interface PunNoticeService extends Service<PunNotice> {

   void add(PunNotice punNotice , HttpServletRequest request);

   void update(PunNotice punNotice , HttpServletRequest request);

}
