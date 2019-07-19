package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.core.AppException;
import com.mwkj.lzda.dao.AttachmentMapper;
import com.mwkj.lzda.model.Attachment;
import com.mwkj.lzda.service.AttachmentService;
import com.mwkj.lzda.core.AbstractService;
import com.mwkj.lzda.util.IDGenerator;
import com.mwkj.lzda.util.SpringFileUploader;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


/**
 * Created by CodeGenerator on 2019-07-17 11:13.
 */
@Service
@Transactional
public class AttachmentServiceImpl extends AbstractService<Attachment> implements AttachmentService {
    @Resource
    private AttachmentMapper attachmentMapper;

    /**
     * @Author libaogang
     * @Date 2019-07-18 21:55
     * @Param [request]
     * @return java.lang.String
     * @Description 多附件上传 并将附件路径保存至附件表
     */
    @Override
    public String uploadImgsAndSaveUrls(HttpServletRequest request) {
        //上传图片
        List<String> urls = null;
        try {
            urls = SpringFileUploader.uploadImgs(request);
        } catch (IOException e) {
            throw new AppException("图片上传失败");
        }

        String attachmentId = null;
        if (!CollectionUtils.isEmpty(urls)) {
            attachmentId = IDGenerator.getUUID();

            //保存图片路径至附件表
            List<Attachment> attachments = new ArrayList<>();
            for (String url : urls) {
                Attachment attachment = new Attachment();
                attachment.setSourceId(attachmentId);
                attachment.setUrl(url);
                attachments.add(attachment);
            }
            this.saveAll(attachments);
        }
        return attachmentId;
    }

    /**
     * @Author libaogang
     * @Date 2019-07-19 10:53
     * @Param [attachmentId, request]
     * @return void
     * @Description 修改附件，在原有附件基础上新增图片，需要给定原有关联id
     */
    @Override
    public void uploadImgsAndUpdateUrls(String attachmentId, HttpServletRequest request) {
        //上传图片
        List<String> urls = null;
        try {
            urls = SpringFileUploader.uploadImgs(request);
        } catch (IOException e) {
            throw new AppException("图片上传失败");
        }
        if (!CollectionUtils.isEmpty(urls)) {
            //保存图片路径至附件表
            List<Attachment> attachments = new ArrayList<>();
            for (String url : urls) {
                Attachment attachment = new Attachment();
                attachment.setSourceId(attachmentId);
                attachment.setUrl(url);
                attachments.add(attachment);
            }
            this.saveAll(attachments);
        }
    }
}
