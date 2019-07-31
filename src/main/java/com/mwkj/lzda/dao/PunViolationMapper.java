package com.mwkj.lzda.dao;

import com.mwkj.lzda.core.Mapper;
import com.mwkj.lzda.model.PunViolation;
import com.mwkj.lzda.vo.PunViolationVo;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;
import java.util.List;

public interface PunViolationMapper extends Mapper<PunViolation> {

    /**
     * 根据单位ID和时间查询违纪统计列表
     *
     * @param orgId     单位ID
     * @param beginTime 开始时间
     * @param endTime   结束时间
     * @return
     */
    List<PunViolationVo> findPunViolationStatistics(@Param("orgId") Integer orgId, @Param("beginTime") LocalDateTime beginTime, @Param("endTime") LocalDateTime endTime);

}