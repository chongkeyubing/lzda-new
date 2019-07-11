package com.mwkj.lzda.service;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcMarriageInfo;
import com.mwkj.lzda.model.ArcOrganizationMeeting;
import com.mwkj.lzda.core.Service;

import javax.servlet.http.HttpServletRequest;


/**
* @Author: libaogang
* @Date: 2019-07-11 08:37
* @Description TODO
*/
public interface ArcOrganizationMeetingService extends Service<ArcOrganizationMeeting> {
    void add(ArcOrganizationMeeting arcOrganizationMeeting, Approve approve, HttpServletRequest request);

}
