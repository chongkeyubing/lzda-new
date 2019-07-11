package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.OperateLogMapper;
import com.mwkj.lzda.model.OperateLog;
import com.mwkj.lzda.service.OperateLogService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
* @Author: libaogang
* @Date: 2019-07-10 17:14
* @Description TODO
*/
@Service
@Transactional
public class OperateLogServiceImpl extends AbstractService<OperateLog> implements OperateLogService {
    @Resource
    private OperateLogMapper operateLogMapper;

}
