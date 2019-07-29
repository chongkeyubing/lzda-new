package com.mwkj.lzda.service.impl;

import cn.afterturn.easypoi.word.WordExportUtil;
import com.mwkj.lzda.dao.ArchiveMapper;
import com.mwkj.lzda.dto.ArcLoanDTO;
import com.mwkj.lzda.dto.ArchiveDTO;
import com.mwkj.lzda.enu.ArchiveTypeEnum;
import com.mwkj.lzda.enu.LogOperateTypeEnum;
import com.mwkj.lzda.enu.RoleEnum;
import com.mwkj.lzda.model.*;
import com.mwkj.lzda.service.*;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import javax.annotation.Resource;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: libaogang
 * @Date: 2019-07-02 11:17
 * @Description 26类档案的新增跳转、详情跳转、审核状态修改
 */
@Service
@Transactional
public class ArchiveServiceImpl implements ArchiveService {

    @Resource
    private UserService userService;

    @Resource
    private ArchiveMapper archiveMapper;

    @Resource
    private ArcBasicInfoService arcBasicInfoService;

    @Resource
    private OperateLogService operateLogService;

    @Resource
    private ApproveService approveService;

    @Resource
    private ArcFamilySocietyRelaService arcFamilySocietyRelaService;

    @Resource
    private ArcHkMoInfoService arcHkMoInfoService;

    @Resource
    private ArcPassportInfoService arcPassportInfoService;

    @Resource
    private ArcMarriageInfoService arcMarriageInfoService;

    @Resource
    private ArcOrganizationMeetingService arcOrganizationMeetingService;

    @Resource
    private ArcBanquetApplyService arcBanquetApplyService;

    @Resource
    private ArcAbroadInfoService arcAbroadInfoService;

    @Resource
    private ArcAffectBusinessService arcAffectBusinessService;

    @Resource
    private ArcLeaveofficeHandoverService arcLeaveofficeHandoverService;

    @Resource
    private ArcFamilyAbroadService arcFamilyAbroadService;

    @Resource
    private ArcFamilyWorkabroadService arcFamilyWorkabroadService;

    @Resource
    private ArcFamilyCriminalService arcFamilyCriminalService;

    @Resource
    private ArcFamilyStockService arcFamilyStockService;

    @Resource
    private ArcFamilyFundService arcFamilyFundService;

    @Resource
    private ArcFamilyInsuranceService arcFamilyInsuranceService;

    @Resource
    private ArcFamilyAbroadSavingsService arcFamilyAbroadSavingsService;

    @Resource
    private ArcFamilyAbroadInvestmentService arcFamilyAbroadInvestmentService;

    @Resource
    private ArcPersonalOtherService arcPersonalOtherService;

    @Resource
    private ArcFamilyMarriageService arcFamilyMarriageService;

    @Resource
    private ArcPoliceInvolveService arcPoliceInvolveService;

    @Resource
    private ArcIncomeInfoService arcIncomeInfoService;

    @Resource
    private ArcGiftInfoService arcGiftInfoService;

    @Resource
    private ArcPartTimeJobService arcPartTimeJobService;

    @Resource
    private ArcHouseInfoService arcHouseInfoService;

    @Resource
    private ArcFamilyAbroadMarriageService arcFamilyAbroadMarriageService;

    @Resource
    private ArcLoanService arcLoanService;

    /**
     * @return java.util.List<com.mwkj.lzda.dto.ArchiveDTO>
     * @Author libaogang
     * @Date 2019-07-12 20:25
     * @Param [archive]
     * @Description 条件分页查询26类档案
     */
    @Override
    public List<ArchiveDTO> findAllArchivesByConditions(ArchiveDTO archive) {
        return archiveMapper.findAllArchivesByConditions(archive);
    }

    @Override
    public List<ArchiveDTO> findAllWarningsByConditions(ArchiveDTO archive) {
        return archiveMapper.findAllWarningsByConditions(archive);
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-12 20:25
     * @Param [archive]
     * @Description 档案新增跳转
     */
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
            case 17:
                page = "/views/archive/arc_family_abroad_savings";
                break;
            case 18:
                page = "/views/archive/arc_family_abroad_investment";
                break;
            case 19:
                page = "/views/archive/arc_personal_other";
                break;
            case 20:
                page = "/views/archive/arc_family_marriage";
                break;
            case 21:
                page = "/views/archive/arc_police_involve";
                break;
            case 22:
                page = "/views/archive/arc_income_info";
                break;
            case 23:
                page = "/views/archive/arc_gift_info";
                break;
            case 24:
                page = "/views/archive/arc_part_time_job";
                break;
            case 25:
                page = "/views/archive/arc_house_info";
                break;
            case 26:
                page = "/views/archive/arc_family_abroad_marriage";
                break;
            case 27:
                page = "/views/archive/arc_loan";
                break;

        }
        return page;
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-12 20:26
     * @Param [archive, map, approveRecord, approveOperate]
     * @Description 档案详情跳转
     */
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
            case 17:
                ArcFamilyAbroadSavings arcFamilyAbroadSavings = arcFamilyAbroadSavingsService.findById(archive.getArchiveId());
                map.put("archive", arcFamilyAbroadSavings); // 统一命名为archive
                page = "/views/archive/arc_family_abroad_savings_table";
                break;
            case 18:
                ArcFamilyAbroadInvestment arcFamilyAbroadInvestment = arcFamilyAbroadInvestmentService.findById(archive.getArchiveId());
                map.put("archive", arcFamilyAbroadInvestment); // 统一命名为archive
                page = "/views/archive/arc_family_abroad_investment_table";
                break;

            case 19:
                ArcPersonalOther arcPersonalOther = arcPersonalOtherService.findById(archive.getArchiveId());
                map.put("archive", arcPersonalOther); // 统一命名为archive
                page = "/views/archive/arc_personal_other_table";
                break;

            case 20:
                ArcFamilyMarriage arcFamilyMarriage = arcFamilyMarriageService.findById(archive.getArchiveId());
                map.put("archive", arcFamilyMarriage); // 统一命名为archive
                page = "/views/archive/arc_family_marriage_table";
                break;
            case 21:
                ArcPoliceInvolve arcPoliceInvolve = arcPoliceInvolveService.findById(archive.getArchiveId());
                map.put("archive", arcPoliceInvolve); // 统一命名为archive
                page = "/views/archive/arc_police_involve_table";
                break;

            case 22:
                ArcIncomeInfo ArcIncomeInfo = arcIncomeInfoService.findById(archive.getArchiveId());
                map.put("archive", ArcIncomeInfo); // 统一命名为archive
                page = "/views/archive/arc_income_info_table";
                break;

            case 23:
                ArcGiftInfo arcGiftInfo = arcGiftInfoService.findById(archive.getArchiveId());
                map.put("archive", arcGiftInfo); // 统一命名为archive
                page = "/views/archive/arc_gift_info_table";
                break;
            case 24:
                ArcPartTimeJob arcPartTimeJob = arcPartTimeJobService.findById(archive.getArchiveId());
                map.put("archive", arcPartTimeJob); // 统一命名为archive
                page = "/views/archive/arc_part_time_job_table";
                break;
            case 25:
                ArcHouseInfo arcHouseInfo = arcHouseInfoService.findById(archive.getArchiveId());
                map.put("archive", arcHouseInfo); // 统一命名为archive
                page = "/views/archive/arc_house_info_table";
                break;
            case 26:
                ArcFamilyAbroadMarriage arcFamilyAbroadMarriage = arcFamilyAbroadMarriageService.findById(archive.getArchiveId());
                map.put("archive", arcFamilyAbroadMarriage); // 统一命名为archive
                page = "/views/archive/arc_family_abroad_marriage_table";
                break;
            case 27:
                ArcLoanDTO arcLoanDTO = arcLoanService.toDetail(archive.getArchiveId());
                map.put("archive", arcLoanDTO.getArcLoan());
                map.put("loans",arcLoanDTO.getLoans());
                map.put("borrows",arcLoanDTO.getBorrows());
                map.put("assures",arcLoanDTO.getAssures());
                map.put("activitys",arcLoanDTO.getActivitys());

                page = "/views/archive/arc_loan_table";
                break;
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
            if (status == 1 || (status == 4 && !SecurityUtils.getSubject().hasRole(RoleEnum.单位负责人.toString()))) {
                map.put("approveOperate", approveOperate);
            }
        }

        //遍历档案类型枚举
        String operateObject = null;
        for (ArchiveTypeEnum typeEnum : ArchiveTypeEnum.values()) {
            if (archive.getArchiveType() == typeEnum.archiveType()) {
                operateObject = typeEnum.archiveName();
                break;
            }
        }
        operateLogService.save(operateObject, LogOperateTypeEnum.查看.toString(), archive.getUserId());
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
            case 17:
                ArcFamilyAbroadSavings arcFamilyAbroadSavings = new ArcFamilyAbroadSavings();
                arcFamilyAbroadSavings.setId(id);
                arcFamilyAbroadSavings.setApproveStatus(status);
                arcFamilyAbroadSavingsService.update(arcFamilyAbroadSavings);
                break;
            case 18:
                ArcFamilyAbroadInvestment arcFamilyAbroadInvestment = new ArcFamilyAbroadInvestment();
                arcFamilyAbroadInvestment.setId(id);
                arcFamilyAbroadInvestment.setApproveStatus(status);
                arcFamilyAbroadInvestmentService.update(arcFamilyAbroadInvestment);
                break;
            case 19:
                ArcPersonalOther arcPersonalOther = new ArcPersonalOther();
                arcPersonalOther.setId(id);
                arcPersonalOther.setApproveStatus(status);
                arcPersonalOtherService.update(arcPersonalOther);
                break;
            case 20:
                ArcFamilyMarriage arcFamilyMarriage = new ArcFamilyMarriage();
                arcFamilyMarriage.setId(id);
                arcFamilyMarriage.setApproveStatus(status);
                arcFamilyMarriageService.update(arcFamilyMarriage);
                break;
            case 21:
                ArcPoliceInvolve arcPoliceInvolve = new ArcPoliceInvolve();
                arcPoliceInvolve.setId(id);
                arcPoliceInvolve.setApproveStatus(status);
                arcPoliceInvolveService.update(arcPoliceInvolve);
                break;
            case 22:
                ArcIncomeInfo arcIncomeInfo = new ArcIncomeInfo();
                arcIncomeInfo.setId(id);
                arcIncomeInfo.setApproveStatus(status);
                arcIncomeInfoService.update(arcIncomeInfo);
                break;
            case 23:
                ArcGiftInfo arcGiftInfo = new ArcGiftInfo();
                arcGiftInfo.setId(id);
                arcGiftInfo.setApproveStatus(status);
                arcGiftInfoService.update(arcGiftInfo);
                break;
            case 24:
                ArcPartTimeJob arcPartTimeJob = new ArcPartTimeJob();
                arcPartTimeJob.setId(id);
                arcPartTimeJob.setApproveStatus(status);
                arcPartTimeJobService.update(arcPartTimeJob);
                break;
            case 25:
                ArcHouseInfo arcHouseInfo = new ArcHouseInfo();
                arcHouseInfo.setId(id);
                arcHouseInfo.setApproveStatus(status);
                arcHouseInfoService.update(arcHouseInfo);
                break;
            case 26:
                ArcFamilyAbroadMarriage arcFamilyAbroadMarriage = new ArcFamilyAbroadMarriage();
                arcFamilyAbroadMarriage.setId(id);
                arcFamilyAbroadMarriage.setApproveStatus(status);
                arcFamilyAbroadMarriageService.update(arcFamilyAbroadMarriage);
                break;
            case 27:
                ArcLoan arcLoan = new ArcLoan();
                arcLoan.setId(id);
                arcLoan.setApproveStatus(status);
                arcLoanService.update(arcLoan);
                break;
        }
    }


    /**
     * @Author libaogang
     * @Date 2019-07-26 15:48
     * @Param [id 用户id]
     * @return java.util.Map<java.lang.String,java.lang.String> 生成廉政报告的参数集合
     * @Description 获取廉政报告模板参数
     */
    public Map<String,Object> findIncorruptReportParam(int userId){
        Map<String,Object> paramMap = new HashMap<>();

        //基本情况
        User user =  userService.findById(userId);
        paramMap.put("user",user);
        paramMap.put("name",user.getRealname());
        paramMap.put("gender",user.getGender());

        try {
            XWPFDocument doc = WordExportUtil.exportWord07(
                    "templet/廉政报告.docx", paramMap);
            FileOutputStream fos = new FileOutputStream("D:/excel/廉政报告.docx");
            doc.write(fos);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


}