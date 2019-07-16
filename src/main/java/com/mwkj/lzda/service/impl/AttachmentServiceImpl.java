package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.AttachmentMapper;
import com.mwkj.lzda.model.Attachment;
import com.mwkj.lzda.service.AttachmentService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019-07-15 14:06.
 */
@Service
@Transactional
public class AttachmentServiceImpl extends AbstractService<Attachment> implements AttachmentService {
    @Resource
    private AttachmentMapper attachmentMapper;

}
