package com.mwkj.lzda.service;
import com.mwkj.lzda.model.RptIncorrupt;
import com.mwkj.lzda.core.Service;

import java.util.List;


/**
 * Created by CodeGenerator on 2019-07-19 10:40.
 */
public interface RptIncorruptService extends Service<RptIncorrupt> {
    List<RptIncorrupt> selectForPage(RptIncorrupt rptIncorrupt);
}
