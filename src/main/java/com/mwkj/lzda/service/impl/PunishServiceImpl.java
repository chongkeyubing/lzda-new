package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.PunishMapper;
import com.mwkj.lzda.dto.PunishDTO;
import com.mwkj.lzda.model.Attachment;
import com.mwkj.lzda.model.PunViolation;
import com.mwkj.lzda.service.AttachmentService;
import com.mwkj.lzda.service.PunViolationService;
import com.mwkj.lzda.service.PunishService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-18 17:14
 * @Description TODO
 */
@Service
@Transactional
public class PunishServiceImpl implements PunishService {
    @Resource
    PunishMapper punishMapper;

    @Resource
    AttachmentService attachmentService;

    @Resource
    PunViolationService punViolationService;


    @Override
    public List<PunishDTO> findAllPunishByConditions(PunishDTO punishDTO) {
        return punishMapper.findAllPunishByConditions(punishDTO);
    }

    @Override
    public long findAllPunishCounts(PunishDTO punishDTO) {
        return punishMapper.findAllPunishCounts(punishDTO);
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-18 18:11
     * @Param [punishDTO]
     * @Description 根据类型跳转到违惩新增页
     */
    @Override
    public String toAddPunish(PunishDTO punishDTO) {
        String page = null;
        switch (punishDTO.getPunishType()) {
            case 1:
                page = "/views/punish/pun_violation";
                break;
            case 2:
                page = "/views/punish/pun_accountability";
                break;
            case 3:
                page = "/views/punish/pun_gift";
                break;
            case 4:
                page = "/views/punish/pun_talk";
                break;
            case 5:
                page = "/views/punish/pun_notice";
                break;
            case 6:
                page = "/views/punish/pun_report";
                break;
        }
        return page;
    }

    /**
     * @Author libaogang
     * @Date 2019-07-18 23:30
     * @Param [punishDTO, map]
     * @return java.lang.String
     * @Description 根据类型和id跳转到违惩新详情页
     */
    @Override
    public String toPunishDetail(PunishDTO punishDTO, ModelMap map) {
        String page = null;
        switch (punishDTO.getPunishType()) {
            case 1:
                PunViolation punViolation = punViolationService.findById(punishDTO.getPunishId());
                List<Attachment> attachments = attachmentService.find(new Attachment().setSourceId(punViolation.getAttachmentId()));
                map.put("punish", punViolation);
                map.put("attachments", attachments);
                page = "/views/punish/pun_violation_table";
                break;
            case 2:

                page = "/views/punish/pun_violation_table";
                break;
            case 3:

                page = "/views/punish/pun_violation_table";
                break;
            case 4:

                page = "/views/punish/pun_violation_table";
                break;
            case 5:

                page = "/views/punish/pun_violation_table";
                break;
            case 6:

                page = "/views/punish/pun_violation_table";
                break;
        }
        return page;
    }

    @Override
    public void delete(PunishDTO punishDTO) {
        switch (punishDTO.getPunishType()) {
            case 1:
                punViolationService.deleteById(punishDTO.getPunishId());
                break;
            case 2:


                break;
            case 3:


                break;
            case 4:


                break;
            case 5:


                break;
            case 6:


                break;
        }
    }


}