package com.mwkj.lzda.dao;

import com.mwkj.lzda.core.Mapper;
import com.mwkj.lzda.dto.OperateLogDTO;
import com.mwkj.lzda.model.OperateLog;

import java.util.List;

public interface OperateLogMapper extends Mapper<OperateLog> {
    List<OperateLogDTO> findAllLogsByConditions(OperateLogDTO operateLogDTO);
    long findAllLogsCountByConditions(OperateLogDTO operateLogDTO);
}