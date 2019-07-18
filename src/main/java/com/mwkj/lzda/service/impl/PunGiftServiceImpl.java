package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.PunGiftMapper;
import com.mwkj.lzda.model.PunGift;
import com.mwkj.lzda.service.PunGiftService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019-07-18 14:17.
 */
@Service
@Transactional
public class PunGiftServiceImpl extends AbstractService<PunGift> implements PunGiftService {
    @Resource
    private PunGiftMapper punGiftMapper;

}
