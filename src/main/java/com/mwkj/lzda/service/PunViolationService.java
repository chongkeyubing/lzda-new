package com.mwkj.lzda.service;
import com.mwkj.lzda.model.PunViolation;
import com.mwkj.lzda.core.Service;
import com.mwkj.lzda.vo.PunViolationStatisticsVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


/**
 * Created by CodeGenerator on 2019-07-18 20:34.
 */
public interface PunViolationService extends Service<PunViolation> {

    void add(PunViolation punViolation , HttpServletRequest request);

    void update(PunViolation punViolation , HttpServletRequest request);

    /**
     * 查询违纪统计表数据
     *
     * @param orgId 单位ID
     * @param queryTime 查询时间，yyyy-MM-dd~yyyy-MM-dd
     * @param request
     * @param response
     * @return
     */
    List<PunViolationStatisticsVo> findPunViolationStatistics(Integer orgId, String queryTime, HttpServletRequest request, HttpServletResponse response);

}
