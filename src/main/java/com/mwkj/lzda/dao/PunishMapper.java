package com.mwkj.lzda.dao;

import com.mwkj.lzda.dto.ArchiveDTO;
import com.mwkj.lzda.dto.PunishDTO;

import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-02 10:27
 * @Description 违惩管理
 */
public interface PunishMapper {

    List<PunishDTO> findAllPunishByConditions(PunishDTO punishDTO);

    long findAllPunishCounts(PunishDTO punishDTO);

}