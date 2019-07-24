package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArcLoanRelaMapper;
import com.mwkj.lzda.model.ArcLoanRela;
import com.mwkj.lzda.service.ArcLoanRelaService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
* @Author: libaogang
* @Date: 2019-07-24 09:53
* @Description todo
*/
@Service
@Transactional
public class ArcLoanRelaServiceImpl extends AbstractService<ArcLoanRela> implements ArcLoanRelaService {
    @Resource
    private ArcLoanRelaMapper arcLoanRelaMapper;

}
