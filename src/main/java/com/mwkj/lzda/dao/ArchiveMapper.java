package com.mwkj.lzda.dao;

import com.mwkj.lzda.dto.ArchiveDTO;

import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-02 10:27
 * @Description 档案管理
 */
public interface ArchiveMapper {

    List<ArchiveDTO> findAllArchivesByConditions(ArchiveDTO archive);

    List<ArchiveDTO> findAllWarningsByConditions(ArchiveDTO archive);

}