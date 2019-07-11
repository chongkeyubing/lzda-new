package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcFamilySocietyRelaMapper;
import com.mwkj.lzda.model.ArcFamilySocietyRela;
import com.mwkj.lzda.service.ArcFamilySocietyRelaService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-05 16:55
* @Description
*/
@Service
@Transactional
public class ArcFamilySocietyRelaServiceImpl extends AbstractService<ArcFamilySocietyRela> implements ArcFamilySocietyRelaService {
    @Resource
    private ArcFamilySocietyRelaMapper arcFamilySocietyRelaMapper;

}
