package com.mwkj.lzda.service;

import com.mwkj.lzda.dto.ArchiveDTO;
import org.springframework.ui.ModelMap;

import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-02 11:17
 * @Description 档案管理
 */
public interface ArchiveService {
    List<ArchiveDTO> findAllArchivesByConditions(ArchiveDTO archive);

    long findAllArchivesCounts(ArchiveDTO archive);

    void updateSpecifiedArchiveStatus(int archiveType, int id, int status);

    String toAddArchive(ArchiveDTO archive);

    String toArchiveDetail(ArchiveDTO archive, ModelMap map, boolean approveRecord, boolean approveOperate);
}
