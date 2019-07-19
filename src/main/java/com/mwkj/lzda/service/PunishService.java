package com.mwkj.lzda.service;

import com.mwkj.lzda.dto.ArchiveDTO;
import com.mwkj.lzda.dto.PunishDTO;
import org.springframework.ui.ModelMap;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-02 11:17
 * @Description 违惩管理
 */
public interface PunishService {
    List<PunishDTO> findAllPunishByConditions(PunishDTO punishDTO);

    long findAllPunishCounts(PunishDTO punishDTO);

    String toAddPunish(PunishDTO punishDTO);

    String toPunishDetail(PunishDTO punishDTO,ModelMap modelMap);

    void delete(PunishDTO punishDTO);

    String toUpdate(PunishDTO punishDTO,ModelMap modelMap);

}
