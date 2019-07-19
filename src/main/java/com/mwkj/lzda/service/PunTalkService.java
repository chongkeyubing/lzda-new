package com.mwkj.lzda.service;
import com.mwkj.lzda.model.PunTalk;
import com.mwkj.lzda.core.Service;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by CodeGenerator on 2019-07-19 14:34.
 */
public interface PunTalkService extends Service<PunTalk> {

   void add(PunTalk punTalk , HttpServletRequest request);

   void update(PunTalk punTalk , HttpServletRequest request);

}
