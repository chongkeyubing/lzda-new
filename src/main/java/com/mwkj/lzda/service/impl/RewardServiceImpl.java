package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.core.AppException;
import com.mwkj.lzda.dao.RewardMapper;
import com.mwkj.lzda.model.Attachment;
import com.mwkj.lzda.model.Reward;
import com.mwkj.lzda.service.AttachmentService;
import com.mwkj.lzda.service.RewardService;
import com.mwkj.lzda.core.AbstractService;
import com.mwkj.lzda.util.IDGenerator;
import com.mwkj.lzda.util.SpringFileUploader;
import com.mwkj.lzda.util.WebContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


/**
 * Created by CodeGenerator on 2019-07-15 13:57.
 */
@Service
@Transactional
public class RewardServiceImpl extends AbstractService<Reward> implements RewardService {
    @Resource
    private RewardMapper rewardMapper;

    @Resource
    private AttachmentService attachmentService;

    @Override
    public List<Reward> findRewardsByCondition(Reward reward) {
        return rewardMapper.findRewardsByCondition(reward);
    }


    @Override
    public void add(Reward reward, HttpServletRequest request) {
        //上传图片
        List<String> urls = null;
        try {
            urls = SpringFileUploader.uploadImgs(request);
        } catch (IOException e) {
            throw new AppException(e.getMessage());
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
            attachmentService.saveAll(attachments);
        }

        //关联附件表sourceId
        reward.setAttachmentId(attachmentId);
        this.save(reward);
    }

    @Override
    public void update(Reward reward, HttpServletRequest request) {
        //上传图片
        List<String> urls = null;
        try {
            urls = SpringFileUploader.uploadImgs(request);
        } catch (IOException e) {
            throw new AppException(e.getMessage());
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

            attachmentService.saveAll(attachments);
        }

        reward.setAttachmentId(attachmentId);

        this.update(reward);
    }
}
