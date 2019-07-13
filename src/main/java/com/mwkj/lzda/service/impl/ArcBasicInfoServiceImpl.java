package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.core.AppException;
import com.mwkj.lzda.util.SpringFileUploader;
import com.mwkj.lzda.dao.ArcBasicInfoMapper;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcBasicInfo;
import com.mwkj.lzda.model.ArcFamilySocietyRela;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.service.ArcBasicInfoService;
import com.mwkj.lzda.core.AbstractService;
import com.mwkj.lzda.service.ArcFamilySocietyRelaService;
import com.mwkj.lzda.dto.BasicInfoDTO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-11 09:31
 * @Description 个人基本情况报备
 */
@Service
@Transactional
public class ArcBasicInfoServiceImpl extends AbstractService<ArcBasicInfo> implements ArcBasicInfoService {
    @Resource
    private ArcBasicInfoMapper arcBasicInfoMapper;

    @Resource
    private ArcFamilySocietyRelaService arcFamilySocietyRelaService;

    @Resource
    private ApproveService approveService;

    @Override
    public void add(BasicInfoDTO basicInfoDTO, Approve approve, HttpServletRequest request) throws AppException {
        //上传图片
        String url = null;
        try {
            url = SpringFileUploader.uploadImg(request);
        } catch (IOException e) {
            throw new AppException(e.getMessage());
        }

        //保存个人基本情况报备
        ArcBasicInfo arcBasicInfo = basicInfoDTO.getArcBasicInfo();
        arcBasicInfo.setAvatarUrl(url);
        this.save(arcBasicInfo);

        int arcBasicInfoId = arcBasicInfo.getId();

        //保存重要关系
        List<ArcFamilySocietyRela> arcs = basicInfoDTO.getArcs();
        for (ArcFamilySocietyRela arc : arcs) {
            arc.setBasicInfoId(arcBasicInfoId);
        }
        arcFamilySocietyRelaService.saveAll(arcs);


        //构造 插入审核申请 参数
        approve.setArchiveId(arcBasicInfoId);
        approve.setArchiveType(arcBasicInfo.getArchiveType());
        approve.setApproverId(approve.getApproverId());
        approve.setApproverName(approve.getApproverName());
        //插入审核申请
        approveService.addApprove(approve, request);
    }
}
