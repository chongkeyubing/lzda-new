package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.PunishMapper;
import com.mwkj.lzda.dto.PunishDTO;
import com.mwkj.lzda.model.*;
import com.mwkj.lzda.service.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-18 17:14
 * @Description 6类违惩表统一跳转
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

    @Resource
    PunAccountabilityService punAccountabilityService;

    @Resource
    PunTalkService punTalkService;

    @Resource
    PunReportService punReportService;  //举报

    @Resource
    PunNoticeService punNoticeService;  //通报

    @Resource
    PunGiftService punGiftService;

    /**
     * @return java.util.List<com.mwkj.lzda.dto.PunishDTO>
     * @Author libaogang
     * @Date 2019-07-19 14:48
     * @Param [punishDTO]
     * @Description 6类违惩表统一查询
     */
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
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-18 23:30
     * @Param [punishDTO, map]
     * @Description 根据类型和id跳转到违惩详情页
     */
    @Override
    public String toPunishDetail(PunishDTO punishDTO, ModelMap map) {
        String page = null;
        switch (punishDTO.getPunishType()) {
            case 1:
                PunViolation punViolation = punViolationService.findById(punishDTO.getPunishId());
                List<Attachment> attachments1 = attachmentService.find(new Attachment().setSourceId(punViolation.getAttachmentId()));
                map.put("punish", punViolation);
                map.put("attachments", attachments1);
                page = "/views/punish/pun_violation_table";
                break;
            case 2:
                PunAccountability punAccountability = punAccountabilityService.findById(punishDTO.getPunishId());
                List<Attachment> attachments2 = attachmentService.find(new Attachment().setSourceId(punAccountability.getAttachmentId()));
                map.put("punish", punAccountability);
                map.put("attachments", attachments2);
                page = "/views/punish/pun_accountability_table";
                break;
            case 3:
                PunGift punGift = punGiftService.findById(punishDTO.getPunishId());
                List<Attachment> attachments3 = attachmentService.find(new Attachment().setSourceId(punGift.getAttachmentId()));
                map.put("punish", punGift);
                map.put("attachments", attachments3);
                page = "/views/punish/pun_gift_table";
                break;
            case 4:
                PunTalk punTalk = punTalkService.findById(punishDTO.getPunishId());
                List<Attachment> attachments4 = attachmentService.find(new Attachment().setSourceId(punTalk.getAttachmentId()));
                map.put("punish", punTalk);
                map.put("attachments", attachments4);
                page = "/views/punish/pun_talk_table";
                break;
            case 5:
                PunNotice punNotice = punNoticeService.findById(punishDTO.getPunishId());
                List<Attachment> attachments5 = attachmentService.find(new Attachment().setSourceId(punNotice.getAttachmentId()));
                map.put("punish", punNotice);
                map.put("attachments", attachments5);
                page = "/views/punish/pun_notice_table";
                break;
            case 6:
                PunReport punReport = punReportService.findById(punishDTO.getPunishId());
                List<Attachment> attachments6 = attachmentService.find(new Attachment().setSourceId(punReport.getAttachmentId()));
                map.put("punish", punReport);
                map.put("attachments", attachments6);
                page = "/views/punish/pun_report_table";
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
                punAccountabilityService.deleteById(punishDTO.getPunishId());
                break;
            case 3:
                punGiftService.deleteById(punishDTO.getPunishId());
                break;
            case 4:
                punTalkService.deleteById(punishDTO.getPunishId());
                break;
            case 5:
                punNoticeService.deleteById(punishDTO.getPunishId());
                break;
            case 6:
                punReportService.deleteById(punishDTO.getPunishId());
                break;
        }
    }

    /**
     * @return void
     * @Author libaogang
     * @Date 2019-07-19 9:46
     * @Param [punishDTO, modelMap]
     * @Description 跳转到更新
     */
    @Override
    public String toUpdate(PunishDTO punishDTO, ModelMap map) {
        String page = null;
        switch (punishDTO.getPunishType()) {
            case 1:
                PunViolation punViolation = punViolationService.findById(punishDTO.getPunishId());
                List<Attachment> attachments1 = attachmentService.find(new Attachment().setSourceId(punViolation.getAttachmentId()));
                map.put("punish", punViolation);
                map.put("attachments", attachments1);
                page = "/views/punish/pun_violation_update";
                break;
            case 2:
                PunAccountability punAccountability = punAccountabilityService.findById(punishDTO.getPunishId());
                List<Attachment> attachments2 = attachmentService.find(new Attachment().setSourceId(punAccountability.getAttachmentId()));
                map.put("punish", punAccountability);
                map.put("attachments", attachments2);
                page = "/views/punish/pun_accountability_update";
                break;
            case 3:
                PunGift punGift = punGiftService.findById(punishDTO.getPunishId());
                List<Attachment> attachments3 = attachmentService.find(new Attachment().setSourceId(punGift.getAttachmentId()));
                map.put("punish", punGift);
                map.put("attachments", attachments3);
                page = "/views/punish/pun_gift_update";
                break;
            case 4:
                PunTalk punTalk = punTalkService.findById(punishDTO.getPunishId());
                List<Attachment> attachments4 = attachmentService.find(new Attachment().setSourceId(punTalk.getAttachmentId()));
                map.put("punish", punTalk);
                map.put("attachments", attachments4);
                page = "/views/punish/pun_talk_table_update";
                break;
            case 5:
                PunNotice punNotice = punNoticeService.findById(punishDTO.getPunishId());
                List<Attachment> attachments5 = attachmentService.find(new Attachment().setSourceId(punNotice.getAttachmentId()));
                map.put("punish", punNotice);
                map.put("attachments", attachments5);
                page = "/views/punish/pun_notice_table_update";
                break;
            case 6:
                PunReport punReport = punReportService.findById(punishDTO.getPunishId());
                List<Attachment> attachments6 = attachmentService.find(new Attachment().setSourceId(punReport.getAttachmentId()));
                map.put("punish", punReport);
                map.put("attachments", attachments6);
                page = "/views/punish/pun_report_table_update";
                break;
        }
        return page;
    }


}