package com.mwkj.lzda.service;
import com.mwkj.lzda.model.Reward;
import com.mwkj.lzda.model.RptIncorrupt;
import com.mwkj.lzda.core.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * Created by CodeGenerator on 2019-07-19 10:40.
 */
public interface RptIncorruptService extends Service<RptIncorrupt> {
    List<RptIncorrupt> selectForPage(RptIncorrupt rptIncorrupt);
    long selectCount(RptIncorrupt rptIncorrupt);
    //void Update(RptIncorrupt rptIncorrupt , Integer id);
}
