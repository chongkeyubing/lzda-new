package com.mwkj.lzda.service;
import com.mwkj.lzda.model.PunViolation;
import com.mwkj.lzda.core.Service;

import javax.servlet.http.HttpServletRequest;


/**
 * Created by CodeGenerator on 2019-07-18 20:34.
 */
public interface PunViolationService extends Service<PunViolation> {

    void add(PunViolation punViolation , HttpServletRequest request);

    void update(PunViolation punViolation , HttpServletRequest request);

}
