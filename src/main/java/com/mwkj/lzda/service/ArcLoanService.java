package com.mwkj.lzda.service;
import com.mwkj.lzda.dto.ArcLoanDTO;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcGiftInfo;
import com.mwkj.lzda.model.ArcLoan;
import com.mwkj.lzda.core.Service;
import org.springframework.ui.ModelMap;

import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-24 09:53
* @Description 借贷（担保）
*/
public interface ArcLoanService extends Service<ArcLoan> {
    ArcLoanDTO toDetail(int id);
    void add(ArcLoanDTO arcLoanDTO, Approve approve, HttpServletRequest request);

}
