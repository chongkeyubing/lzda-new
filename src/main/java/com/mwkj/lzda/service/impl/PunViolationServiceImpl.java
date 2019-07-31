package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.core.AbstractService;
import com.mwkj.lzda.dao.PunViolationMapper;
import com.mwkj.lzda.enu.LogOperateTypeEnum;
import com.mwkj.lzda.enu.PunishTypeEnum;
import com.mwkj.lzda.model.Organization;
import com.mwkj.lzda.model.PunViolation;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.AttachmentService;
import com.mwkj.lzda.service.OperateLogService;
import com.mwkj.lzda.service.PunViolationService;
import com.mwkj.lzda.vo.PunViolationStatisticsVo;
import com.mwkj.lzda.vo.PunViolationVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;


/**
 * Created by CodeGenerator on 2019-07-18 20:34.
 */
@Service
@Transactional
public class PunViolationServiceImpl extends AbstractService<PunViolation> implements PunViolationService {
    @Resource
    private PunViolationMapper punViolationMapper;

    @Resource
    private AttachmentService attachmentService;

    @Resource
    private OperateLogService operateLogService;

    @Resource
    private OrganizationServiceImpl organizationService;

    @Override
    public void add(PunViolation punViolation, HttpServletRequest request) {
        //上传图片并保存至附件表
        String attachmentId = attachmentService.uploadImgsAndSaveUrls(request);

        //和附件表关联
        punViolation.setAttachmentId(attachmentId);
        this.save(punViolation);

        //遍历惩罚表类型枚举
        String operateObject = null;
        for (PunishTypeEnum typeEnum : PunishTypeEnum.values()) {
            if (punViolation.getPunishType() == typeEnum.punishType()) {
                operateObject = typeEnum.punishName();
                break;
            }
        }

        //插入日志信息
        operateLogService.save(operateObject, LogOperateTypeEnum.添加.toString(), punViolation.getUserId());
    }

    @Override
    public void update(PunViolation punViolation, HttpServletRequest request) {
        attachmentService.uploadImgsAndUpdateUrls(punViolation.getAttachmentId(), request);
        this.update(punViolation);

        //遍历惩罚表类型枚举
        String operateObject = null;
        for (PunishTypeEnum typeEnum : PunishTypeEnum.values()) {
            if (punViolation.getPunishType() == typeEnum.punishType()) {
                operateObject = typeEnum.punishName();
                break;
            }
        }

        //插入日志信息
        operateLogService.save(operateObject, LogOperateTypeEnum.修改.toString(), punViolation.getUserId());
    }

    @Override
    public List<PunViolationStatisticsVo> findPunViolationStatistics(Integer orgId, String queryTime,
                                                                     HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("currentUser");
        List<PunViolationStatisticsVo> punViolationStatisticsVoList = new ArrayList<>();
        LocalDateTime beginTime;
        LocalDateTime endTime;
        if (StringUtils.isNotBlank(queryTime)) {
            String[] splitTime = queryTime.split("~");
            DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            beginTime = LocalDateTime.parse(splitTime[0].trim() + " 00:00:00", df);
            endTime = LocalDateTime.parse(splitTime[1].trim() + " 00:00:00", df);
        } else {
            beginTime = null;
            endTime = null;
        }
        //查询单位列表
        List<Organization> organizationList;
        int index = 0;
        if (null != orgId) {
            organizationList = organizationService.findByIds(String.valueOf(orgId));
        } else {
            organizationList = organizationService.findAll();
        }
        //遍历单位列表
        for (int i = 1; i <= organizationList.size(); i++) {
            Organization organization = organizationList.get(i - 1);
            PunViolationStatisticsVo punViolationStatisticsVo = new PunViolationStatisticsVo();
            punViolationStatisticsVo.setIndex(i);
            punViolationStatisticsVo.setDwmc(organization.getName());
            punViolationStatisticsVo.setOrgId(organization.getId());
            //根据单位和时间段查询统计列表
            List<PunViolationVo> punViolationVos = punViolationMapper.findPunViolationStatistics(organization.getId(), beginTime, endTime);
            //遍历统计列表
            punViolationVos.forEach(punViolationVo -> {
                String violationLevelName = punViolationVo.getViolationLevelName();
                String violationTypeName = punViolationVo.getViolationTypeName();
                if (StringUtils.isNotBlank(violationLevelName)) {
                    switch (violationLevelName) {
                        case "政务处分":
                            if (StringUtils.isNotBlank(violationTypeName)) {
                                switch (violationTypeName) {
                                    case "政务警告":
                                        punViolationStatisticsVo.setJgCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "记过":
                                        punViolationStatisticsVo.setJguoCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "记大过":
                                        punViolationStatisticsVo.setJdgCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "降级":
                                        punViolationStatisticsVo.setJjCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "撤职":
                                        punViolationStatisticsVo.setCzCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "开除":
                                        punViolationStatisticsVo.setKcCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    default:
                                        break;
                                }
                            }
                            break;
                        case "党纪处分":
                            if (StringUtils.isNotBlank(violationTypeName)) {
                                switch (violationTypeName) {
                                    case "警告":
                                        punViolationStatisticsVo.setDjcfJgCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "严重警告":
                                        punViolationStatisticsVo.setYzjgCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "撤销党内职务":
                                        punViolationStatisticsVo.setCxdnzwCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "留党察看":
                                        punViolationStatisticsVo.setLdckCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "开除党籍":
                                        punViolationStatisticsVo.setKcdjCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    default:
                                        break;
                                }
                            }
                            break;
                        case "问责":
                            if (StringUtils.isNotBlank(violationTypeName)) {
                                switch (violationTypeName) {
                                    case "通报":
                                        punViolationStatisticsVo.setTbCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "诫勉谈话":
                                        punViolationStatisticsVo.setJmthCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "停职检查":
                                        punViolationStatisticsVo.setTzjcCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "调整职务":
                                        punViolationStatisticsVo.setTzzwCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "责令辞职":
                                        punViolationStatisticsVo.setZlczCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "降职":
                                        punViolationStatisticsVo.setJzCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                    case "免职":
                                        punViolationStatisticsVo.setMzCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    default:
                                        break;
                                }
                            }
                            break;
                        case "违规":
                            if (StringUtils.isNotBlank(violationTypeName)) {
                                switch (violationTypeName) {
                                    case "分局通报":
                                        punViolationStatisticsVo.setFjtbCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "提醒谈话":
                                        punViolationStatisticsVo.setTxthCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "书面检查":
                                        punViolationStatisticsVo.setSmjcCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "扣分":
                                        punViolationStatisticsVo.setKfCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    default:
                                        break;
                                }
                            }
                            break;
                        case "违法":
                            if (StringUtils.isNotBlank(violationTypeName)) {
                                switch (violationTypeName) {
                                    case "移交司法机关":
                                        punViolationStatisticsVo.setYjsfjgCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    case "未移交司法机关":
                                        punViolationStatisticsVo.setWyjsfjgCount(punViolationVo.getCount() == null ? 0 : punViolationVo.getCount());
                                        break;
                                    default:
                                        break;
                                }
                            }
                            break;
                        default:
                            break;
                    }
                }
            });
            punViolationStatisticsVo.setZwcfCount(punViolationStatisticsVo.getJgCount() + punViolationStatisticsVo.getJguoCount() +
                    punViolationStatisticsVo.getJdgCount() + punViolationStatisticsVo.getJjCount() +
                    punViolationStatisticsVo.getCzCount() + punViolationStatisticsVo.getKcCount());
            punViolationStatisticsVo.setDjcfCount(punViolationStatisticsVo.getDjcfJgCount() + punViolationStatisticsVo.getYzjgCount() +
                    punViolationStatisticsVo.getCxdnzwCount() + punViolationStatisticsVo.getLdckCount() + punViolationStatisticsVo.getKcdjCount());
            punViolationStatisticsVo.setWzCount(punViolationStatisticsVo.getTbCount() + punViolationStatisticsVo.getJmthCount() +
                    punViolationStatisticsVo.getTzjcCount() + punViolationStatisticsVo.getTzzwCount() + punViolationStatisticsVo.getZlczCount() +
                    punViolationStatisticsVo.getJzCount() + punViolationStatisticsVo.getMzCount());
            punViolationStatisticsVo.setWgCount(punViolationStatisticsVo.getFjtbCount() + punViolationStatisticsVo.getSmjcCount() +
                    punViolationStatisticsVo.getTxthCount() + punViolationStatisticsVo.getKfCount());
            punViolationStatisticsVo.setWfCount(punViolationStatisticsVo.getYjsfjgCount() + punViolationStatisticsVo.getWyjsfjgCount());
            punViolationStatisticsVoList.add(punViolationStatisticsVo);
        }
        ;
        //插入日志信息
        operateLogService.save("违纪统计", LogOperateTypeEnum.查看统计数据.toString(), user.getId());
        return punViolationStatisticsVoList;
    }

    @Override
    public List<PunViolation> findList(PunViolation punViolation, String time) {
        LocalDateTime beginTime;
        LocalDateTime endTime;
        if (StringUtils.isNotBlank(time)) {
            String[] splitTime = time.split("~");
            DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            beginTime = LocalDateTime.parse(splitTime[0].trim() + " 00:00:00", df);
            endTime = LocalDateTime.parse(splitTime[1].trim() + " 00:00:00", df);
        } else {
            beginTime = null;
            endTime = null;
        }
        return this.punViolationMapper.findList(punViolation.getOrganizationId(), punViolation.getViolationLevel(), punViolation.getViolationType(), beginTime, endTime);
    }
}
