package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.core.AppException;
import com.mwkj.lzda.dao.ArcLoanMapper;
import com.mwkj.lzda.dto.ArcLoanDTO;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcLoan;
import com.mwkj.lzda.model.ArcLoanRela;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.service.ArcLoanRelaService;
import com.mwkj.lzda.service.ArcLoanService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;


/**
 * @Author: libaogang
 * @Date: 2019-07-24 09:53
 * @Description 借贷（担保）
 */
@Service
@Transactional
public class ArcLoanServiceImpl extends AbstractService<ArcLoan> implements ArcLoanService {
    @Resource
    private ArcLoanMapper arcLoanMapper;

    @Resource
    private ArcLoanRelaService arcLoanRelaService;

    @Resource
    private ApproveService approveService;

    /**
     * @return void
     * @Author libaogang
     * @Date 2019-07-24 10:52
     * @Param [arcLoanDTO]
     * @Description 借贷新增
     */
    @Override
    public void add(ArcLoanDTO arcLoanDTO, Approve approve, HttpServletRequest request) {
        //保存主表内容
        ArcLoan arcLoan = arcLoanDTO.getArcLoan();
        this.save(arcLoan);

        List<ArcLoanRela> arcLoanRelas = new ArrayList<>();
        if (!CollectionUtils.isEmpty(arcLoanDTO.getLoans())) {
            arcLoanRelas.addAll(arcLoanDTO.getLoans());
        }
        if (!CollectionUtils.isEmpty(arcLoanDTO.getBorrows())) {
            arcLoanRelas.addAll(arcLoanDTO.getBorrows());
        }
        if (!CollectionUtils.isEmpty(arcLoanDTO.getAssures())) {
            arcLoanRelas.addAll(arcLoanDTO.getAssures());
        }
        if (!CollectionUtils.isEmpty(arcLoanDTO.getActivitys())) {
            arcLoanRelas.addAll(arcLoanDTO.getActivitys());
        }

        if (CollectionUtils.isEmpty(arcLoanRelas)) {
            throw new AppException("请新增借贷担保信息");
        }

        //关联主表
        for (ArcLoanRela arcLoanRela : arcLoanRelas) {
            arcLoanRela.setLoanId(arcLoan.getId());
        }

        arcLoanRelaService.saveAll(arcLoanRelas);

        //构造 插入审核申请 参数
        approve.setArchiveId(arcLoan.getId());
        approve.setArchiveType(arcLoan.getArchiveType());
        approve.setApproverId(approve.getApproverId());
        approve.setApproverName(approve.getApproverName());
        //插入审核申请
        approveService.addApprove(approve, request);
    }


    /**
     * @return void
     * @Author libaogang
     * @Date 2019-07-24 10:29
     * @Param [id, map]
     * @Description 跳转到借贷详情页
     */
    @Override
    public ArcLoanDTO toDetail(int id) {
        ArcLoanDTO arcLoanDTO = new ArcLoanDTO();

        ArcLoan arcLoan = this.findById(id);
        arcLoanDTO.setArcLoan(arcLoan);

        //借出
        ArcLoanRela arcLoanRela = new ArcLoanRela();
        arcLoanRela.setLoanId(arcLoan.getId());
        arcLoanRela.setType(1);
        arcLoanDTO.setLoans(arcLoanRelaService.find(arcLoanRela));

        //借入
        arcLoanRela.setType(2);
        arcLoanDTO.setBorrows(arcLoanRelaService.find(arcLoanRela));

        //担保
        arcLoanRela.setType(3);
        arcLoanDTO.setAssures(arcLoanRelaService.find(arcLoanRela));

        //经营活动(公司)
        arcLoanRela.setType(4);
        arcLoanDTO.setActivitys(arcLoanRelaService.find(arcLoanRela));

        return arcLoanDTO;
    }

}
