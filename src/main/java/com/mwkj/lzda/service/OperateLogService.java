package com.mwkj.lzda.service;
import com.mwkj.lzda.dto.OperateLogDTO;
import com.mwkj.lzda.model.OperateLog;
import com.mwkj.lzda.core.Service;

import java.util.List;


/**
* @Author: libaogang
* @Date: 2019-07-10 17:14
* @Description TODO
*/
public interface OperateLogService extends Service<OperateLog> {
    List<OperateLogDTO> findAllLogsByConditions(OperateLogDTO operateLogDTO);
    long findAllLogsCountByConditions(OperateLogDTO operateLogDTO);
    void save(String operateObject,String operateType,Integer archiveOwnerId);
}
