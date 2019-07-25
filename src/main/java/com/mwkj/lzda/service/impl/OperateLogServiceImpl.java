package com.mwkj.lzda.service.impl;

import com.alibaba.druid.util.DruidWebUtils;
import com.mwkj.lzda.dao.OperateLogMapper;
import com.mwkj.lzda.dao.UserMapper;
import com.mwkj.lzda.dto.OperateLogDTO;
import com.mwkj.lzda.enu.ArchiveTypeEnum;
import com.mwkj.lzda.enu.LogOperateTypeEnum;
import com.mwkj.lzda.enu.RoleEnum;
import com.mwkj.lzda.model.OperateLog;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.OperateLogService;
import com.mwkj.lzda.core.AbstractService;
import com.mwkj.lzda.util.WebContextHolder;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-10 17:14
 * @Description 日志管理
 */
@Service
@Transactional
public class OperateLogServiceImpl extends AbstractService<OperateLog> implements OperateLogService {
    @Resource
    private OperateLogMapper operateLogMapper;

    @Resource
    private UserMapper userMapper;

    @Override
    public List<OperateLogDTO> findAllLogsByConditions(OperateLogDTO operateLogDTO) {
        return operateLogMapper.findAllLogsByConditions(operateLogDTO);
    }

    @Override
    public long findAllLogsCountByConditions(OperateLogDTO operateLogDTO) {
        return operateLogMapper.findAllLogsCountByConditions(operateLogDTO);
    }

    /**
     * @return void
     * @Author libaogang
     * @Date 2019-07-15 10:45
     * @Param [operateObject, operateType, archiveOwnerId]
     * @Description 插入日志
     */
    @Override
    public void save(String operateObject, String operateType, int archiveOwnerId) {
        Subject subject = SecurityUtils.getSubject();
//        if (subject.hasRole(RoleEnum.单位负责人.toString()) || subject.hasRole(RoleEnum.纪委.toString())
//                || subject.hasRole(RoleEnum.督察大队.toString()) || subject.hasRole(RoleEnum.政治处领导.toString())) {
        if (!subject.hasRole(RoleEnum.普通用户.toString())) {
            HttpServletRequest request = WebContextHolder.getRequest();
            User currentUser = (User) request.getSession().getAttribute("currentUser");
            OperateLog operateLog = new OperateLog();
            operateLog.setOperatorId(currentUser.getId());
            operateLog.setOperatorName(currentUser.getRealname());
            operateLog.setOperatorIp(DruidWebUtils.getRemoteAddr(request));
            operateLog.setArchiveOwnerId(archiveOwnerId);

            User user = new User();
            user.setId(archiveOwnerId);
            user = userMapper.selectOne(user);

            operateLog.setArchiveOwnerName(user.getRealname());
            operateLog.setOperateObject(operateObject);
            operateLog.setOperateType(operateType);
            operateLog.setOwnerOrg(user.getOrganizationName());
            operateLogMapper.insertSelective(operateLog);
        }
    }
}
