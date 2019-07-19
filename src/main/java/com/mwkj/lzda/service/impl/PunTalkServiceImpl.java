package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.PunTalkMapper;
import com.mwkj.lzda.model.PunTalk;
import com.mwkj.lzda.service.PunTalkService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import com.mwkj.lzda.service.AttachmentService;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by CodeGenerator on 2019-07-19 14:34.
 */
@Service
@Transactional
public class PunTalkServiceImpl extends AbstractService<PunTalk> implements PunTalkService {
    @Resource
    private PunTalkMapper punTalkMapper;

    @Resource
    private AttachmentService attachmentService;

    @Override
    public void add(PunTalk punTalk, HttpServletRequest request) {
    //上传图片并保存至附件表
    String attachmentId = attachmentService.uploadImgsAndSaveUrls(request);

    //和附件表关联
    punTalk.setAttachmentId(attachmentId);
        this.save(punTalk);
    }

    @Override
    public void update(PunTalk punTalk, HttpServletRequest request) {
        attachmentService.uploadImgsAndUpdateUrls(punTalk.getAttachmentId(),request);
        this.update(punTalk);
    }

}
