package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.ArchiveMapper;
import com.mwkj.lzda.dto.ArchiveDTO;
import com.mwkj.lzda.model.*;
import com.mwkj.lzda.service.*;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-02 11:17
 * @Description 档案管理
 */
@Service
@Transactional
public class ArchiveServiceImpl implements ArchiveService {

    @Resource
    ArchiveMapper archiveMapper;

    @Resource
    ArcBasicInfoService arcBasicInfoService;

    @Resource
    OperateLogService operateLogService;

    @Resource
    ApproveService approveService;

    @Resource
    ArcFamilySocietyRelaService arcFamilySocietyRelaService;

    @Resource
    ArcHkMoInfoService arcHkMoInfoService;

    @Resource
    ArcPassportInfoService arcPassportInfoService;

    @Resource
    ArcMarriageInfoService arcMarriageInfoService;

    @Resource
    ArcOrganizationMeetingService arcOrganizationMeetingService;

    @Resource
    ArcBanquetApplyService arcBanquetApplyService;

    @Resource
    ArcAbroadInfoService arcAbroadInfoService;

    @Resource
    ArcAffectBusinessService arcAffectBusinessService;

    @Resource
    ArcLeaveofficeHandoverService arcLeaveofficeHandoverService;

    @Resource
    ArcFamilyAbroadService arcFamilyAbroadService;

    @Resource
    ArcFamilyWorkabroadService arcFamilyWorkabroadService;

    @Resource
    ArcFamilyCriminalService arcFamilyCriminalService;

    @Resource
    ArcFamilyStockService arcFamilyStockService;

    @Resource
    ArcFamilyFundService arcFamilyFundService;

    @Resource
    ArcFamilyInsuranceService arcFamilyInsuranceService;


    @Override
    public List<ArchiveDTO> findAllArchivesByConditions(ArchiveDTO archive) {
        return archiveMapper.findAllArchivesByConditions(archive);
    }

    @Override
    public long findAllArchivesCounts(ArchiveDTO archive) {
        return archiveMapper.findAllArchivesCounts(archive);
    }


    @Override
    public String toAddArchive(ArchiveDTO archive) {
        String page = null;
        switch (archive.getArchiveType()) {
            //个人基本情况报备
            case 1:
                page = "/views/archive/arc_basic_info";
                break;
            //港澳情况
            case 2:
                page = "/views/archive/arc_hk_mo_info";
                break;
            case 3:
                page = "/views/archive/arc_passport_info";
                break;
            case 4:
                page = "/views/archive/arc_marriage_info";
                break;
            case 5:
                page = "/views/archive/arc_organization_meeting";
                break;
            case 6:
                page = "/views/archive/arc_banquet_apply";
                break;
            case 7:
                page = "/views/archive/arc_abroad_info";
                break;
            case 8:
                page = "/views/archive/arc_affect_business";
                break;
            case 9:
                page = "/views/archive/arc_leaveoffice_handover";
                break;
            // todo

            case 11:
                page = "/views/archive/arc_family_abroad";
                break;
            case 12:
                page = "/views/archive/arc_family_workabroad";
                break;
            case 13:
                page = "/views/archive/arc_family_criminal";
                break;
            case 14:
                page = "/views/archive/arc_family_stock";
                break;
            case 15:
                page = "/views/archive/arc_family_fund";
                break;
            case 16:
                page = "/views/archive/arc_family_insurance";
                break;


            //todo
        }
        return page;
    }

    @Override
    public String toArchiveDetail(ArchiveDTO archive, ModelMap map, boolean approveRecord, boolean approveOperate) {
        String page = null;
        switch (archive.getArchiveType()) {
            //个人基本情况报备
            case 1:
                ArcBasicInfo arcBasicInfo = arcBasicInfoService.findById(archive.getArchiveId());

                ArcFamilySocietyRela arcFamilySocietyRela = new ArcFamilySocietyRela();
                arcFamilySocietyRela.setBasicInfoId(arcBasicInfo.getId());
                List<ArcFamilySocietyRela> arcFamilySocietyRelaList = arcFamilySocietyRelaService.find(arcFamilySocietyRela);

                map.put("archive", arcBasicInfo);  // 统一命名为archive
                map.put("arcFamilySocietyRelaList", arcFamilySocietyRelaList);
                map.put("arcFamilySocietyRelaListSize", arcFamilySocietyRelaList.size() + 1);
                page = "/views/archive/arc_basic_info_table";
                break;
            case 2:
                ArcHkMoInfo arcHkMoInfo = arcHkMoInfoService.findById(archive.getArchiveId());
                map.put("archive", arcHkMoInfo); // 统一命名为archive
                page = "/views/archive/arc_hk_mo_info_table";
                break;
            case 3:
                ArcPassportInfo arcPassportInfo = arcPassportInfoService.findById(archive.getArchiveId());
                map.put("archive", arcPassportInfo); // 统一命名为archive
                page = "/views/archive/arc_passport_info_table";
                break;
            case 4:
                ArcMarriageInfo arcMarriageInfo = arcMarriageInfoService.findById(archive.getArchiveId());
                map.put("archive", arcMarriageInfo); // 统一命名为archive
                page = "/views/archive/arc_marriage_info_table";
                break;
            case 5:
                ArcOrganizationMeeting arcOrganizationMeeting = arcOrganizationMeetingService.findById(archive.getArchiveId());
                map.put("archive", arcOrganizationMeeting); // 统一命名为archive
                page = "/views/archive/arc_organization_meeting_table";
                break;
            case 6:
                ArcBanquetApply arcBanquetApply = arcBanquetApplyService.findById(archive.getArchiveId());
                map.put("archive", arcBanquetApply); // 统一命名为archive
                page = "/views/archive/arc_banquet_apply_table";
                break;
            case 7:
                ArcAbroadInfo arcAbroadInfo = arcAbroadInfoService.findById(archive.getArchiveId());
                map.put("archive", arcAbroadInfo); // 统一命名为archive
                page = "/views/archive/arc_abroad_info_table";
                break;
            case 8:
                ArcAffectBusiness arcAffectBusiness = arcAffectBusinessService.findById(archive.getArchiveId());
                map.put("archive", arcAffectBusiness); // 统一命名为archive
                page = "/views/archive/arc_affect_business_table";
                break;
            case 9:
                ArcLeaveofficeHandover arcLeaveofficeHandover = arcLeaveofficeHandoverService.findById(archive.getArchiveId());
                map.put("archive", arcLeaveofficeHandover); // 统一命名为archive
                page = "/views/archive/arc_leaveoffice_handover_table";
                break;

            // todo

            case 11:
                ArcFamilyAbroad arcFamilyAbroad = arcFamilyAbroadService.findById(archive.getArchiveId());
                map.put("archive", arcFamilyAbroad); // 统一命名为archive
                page = "/views/archive/arc_family_abroad_table";
                break;
            case 12:
                ArcFamilyWorkabroad arcFamilyWorkabroad = arcFamilyWorkabroadService.findById(archive.getArchiveId());
                map.put("archive", arcFamilyWorkabroad); // 统一命名为archive
                page = "/views/archive/arc_family_workabroad_table";
                break;
            case 13:
                ArcFamilyCriminal arcFamilyCriminal = arcFamilyCriminalService.findById(archive.getArchiveId());
                map.put("archive", arcFamilyCriminal); // 统一命名为archive
                page = "/views/archive/arc_family_criminal_table";
                break;
            case 14:
                ArcFamilyStock arcFamilyStock = arcFamilyStockService.findById(archive.getArchiveId());
                map.put("archive", arcFamilyStock); // 统一命名为archive
                page = "/views/archive/arc_family_stock_table";
                break;
            case 15:
                ArcFamilyFund arcFamilyFund = arcFamilyFundService.findById(archive.getArchiveId());
                map.put("archive", arcFamilyFund); // 统一命名为archive
                page = "/views/archive/arc_family_fund_table";
                break;
            case 16:
                ArcFamilyInsurance arcFamilyInsurance = arcFamilyInsuranceService.findById(archive.getArchiveId());
                map.put("archive", arcFamilyInsurance); // 统一命名为archive
                page = "/views/archive/arc_family_insurance_table";
                break;

            //todo
        }

        //附带审核记录
        if (approveRecord) {
            Approve approve = new Approve();
            approve.setArchiveId(archive.getArchiveId());
            approve.setArchiveType(archive.getArchiveType());
            List<Approve> approves = approveService.find(approve);
            map.put("approves", approves);
            map.put("approveRecord", approveRecord);
        }

        //附带审核操作
        if (approveOperate) {
            // 审核的最后一步状态
            Approve approve = new Approve();
            approve.setArchiveId(archive.getArchiveId());
            approve.setArchiveType(archive.getArchiveType());
            approve.setLastStep(1);
            Approve approve1 = approveService.findOne(approve);
            int status = approve1.getStatus();

            //只有待审核状态才展示审核操作按钮
            if (status == 1 || (status == 4 && !SecurityUtils.getSubject().hasRole("单位负责人"))) {
                map.put("approveOperate", approveOperate);
            }
        }

        //插入日志信息
//        User currentUser = (User)session.getAttribute("currentUser");
//        OperateLog operateLog = new OperateLog();
//        operateLog.setOperatorId(currentUser.getId());
//        operateLog.setOperateName(currentUser.getRealname());
//        operateLog.setArchiveOwnerId(archive.getUserId());
//        operateLog.setArchiveOwnerName(archive.getUserName());
//        operateLog.setOperateObject();
//        operateLog.setOperateName("查看");
//        operateLogService.save();

        return page;
    }

    /**
     * @return void
     * @Author libaogang
     * @Date 2019-07-09 8:55
     * @Param [archiveType, id, status]
     * @Description 修改档案的审核状态
     */
    @Override
    public void updateSpecifiedArchiveStatus(int archiveType, int id, int status) {
        switch (archiveType) {
            case 1:
                ArcBasicInfo arcBasicInfo = new ArcBasicInfo();
                arcBasicInfo.setId(id);
                arcBasicInfo.setApproveStatus(status);
                arcBasicInfoService.update(arcBasicInfo);
                break;
            case 2:
                ArcHkMoInfo arcHkMoInfo = new ArcHkMoInfo();
                arcHkMoInfo.setId(id);
                arcHkMoInfo.setApproveStatus(status);
                arcHkMoInfoService.update(arcHkMoInfo);
                break;
            case 3:
                ArcPassportInfo arcPassportInfo = new ArcPassportInfo();
                arcPassportInfo.setId(id);
                arcPassportInfo.setApproveStatus(status);
                arcPassportInfoService.update(arcPassportInfo);
                break;
            case 4:
                ArcMarriageInfo arcMarriageInfo = new ArcMarriageInfo();
                arcMarriageInfo.setId(id);
                arcMarriageInfo.setApproveStatus(status);
                arcMarriageInfoService.update(arcMarriageInfo);
                break;
            case 5:
                ArcOrganizationMeeting arcOrganizationMeeting = new ArcOrganizationMeeting();
                arcOrganizationMeeting.setId(id);
                arcOrganizationMeeting.setApproveStatus(status);
                arcOrganizationMeetingService.update(arcOrganizationMeeting);
                break;
            case 6:
                ArcBanquetApply arcBanquetApply = new ArcBanquetApply();
                arcBanquetApply.setId(id);
                arcBanquetApply.setApproveStatus(status);
                arcBanquetApplyService.update(arcBanquetApply);
                break;
            case 7:
                ArcAbroadInfo arcAbroadInfo = new ArcAbroadInfo();
                arcAbroadInfo.setId(id);
                arcAbroadInfo.setApproveStatus(status);
                arcAbroadInfoService.update(arcAbroadInfo);
                break;
            case 8:
                ArcAffectBusiness arcAffectBusiness = new ArcAffectBusiness();
                arcAffectBusiness.setId(id);
                arcAffectBusiness.setApproveStatus(status);
                arcAffectBusinessService.update(arcAffectBusiness);
                break;
            case 9:
                ArcLeaveofficeHandover arcLeaveofficeHandover = new ArcLeaveofficeHandover();
                arcLeaveofficeHandover.setId(id);
                arcLeaveofficeHandover.setApproveStatus(status);
                arcLeaveofficeHandoverService.update(arcLeaveofficeHandover);
                break;

            // todo
            case 11:
                ArcFamilyAbroad arcFamilyAbroad = new ArcFamilyAbroad();
                arcFamilyAbroad.setId(id);
                arcFamilyAbroad.setApproveStatus(status);
                arcFamilyAbroadService.update(arcFamilyAbroad);
                break;
            case 12:
                ArcFamilyWorkabroad arcFamilyWorkabroad = new ArcFamilyWorkabroad();
                arcFamilyWorkabroad.setId(id);
                arcFamilyWorkabroad.setApproveStatus(status);
                arcFamilyWorkabroadService.update(arcFamilyWorkabroad);
                break;
            case 13:
                ArcFamilyCriminal arcFamilyCriminal = new ArcFamilyCriminal();
                arcFamilyCriminal.setId(id);
                arcFamilyCriminal.setApproveStatus(status);
                arcFamilyCriminalService.update(arcFamilyCriminal);
                break;
            case 14:
                ArcFamilyStock arcFamilyStock = new ArcFamilyStock();
                arcFamilyStock.setId(id);
                arcFamilyStock.setApproveStatus(status);
                arcFamilyStockService.update(arcFamilyStock);
                break;
            case 15:
                ArcFamilyFund arcFamilyFund = new ArcFamilyFund();
                arcFamilyFund.setId(id);
                arcFamilyFund.setApproveStatus(status);
                arcFamilyFundService.update(arcFamilyFund);
                break;

            case 16:
                ArcFamilyInsurance arcFamilyInsurance = new ArcFamilyInsurance();
                arcFamilyInsurance.setId(id);
                arcFamilyInsurance.setApproveStatus(status);
                arcFamilyInsuranceService.update(arcFamilyInsurance);
                break;

            // todo
        }
    }


}