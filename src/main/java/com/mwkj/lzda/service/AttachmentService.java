package com.mwkj.lzda.service;
import com.mwkj.lzda.model.Attachment;
import com.mwkj.lzda.core.Service;

import javax.servlet.http.HttpServletRequest;


/**
 * Created by CodeGenerator on 2019-07-17 11:13.
 */
public interface AttachmentService extends Service<Attachment> {

    String uploadImgsAndSaveUrls(HttpServletRequest request);

}
