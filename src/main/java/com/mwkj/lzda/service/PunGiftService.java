package com.mwkj.lzda.service;
import com.mwkj.lzda.model.PunGift;
import com.mwkj.lzda.core.Service;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by CodeGenerator on 2019-07-19 14:48.
 */
public interface PunGiftService extends Service<PunGift> {

   void add(PunGift punGift , HttpServletRequest request);

   void update(PunGift punGift , HttpServletRequest request);

}
