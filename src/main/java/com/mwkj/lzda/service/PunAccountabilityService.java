package com.mwkj.lzda.service;
import com.mwkj.lzda.model.PunAccountability;
import com.mwkj.lzda.core.Service;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by CodeGenerator on 2019-07-19 14:14.
 */
public interface PunAccountabilityService extends Service<PunAccountability> {

   void add(PunAccountability punAccountability , HttpServletRequest request);

   void update(PunAccountability punAccountability , HttpServletRequest request);

}
