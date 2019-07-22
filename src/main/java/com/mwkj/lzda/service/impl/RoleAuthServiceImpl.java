package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.RoleAuthMapper;
import com.mwkj.lzda.model.RoleAuth;
import com.mwkj.lzda.service.RoleAuthService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019-07-20 18:21.
 */
@Service
@Transactional
public class RoleAuthServiceImpl extends AbstractService<RoleAuth> implements RoleAuthService {
    @Resource
    private RoleAuthMapper roleAuthMapper;

    @Override
    public void update(RoleAuth roleAuth, int originViewAuthId) {
        //删除原有查看权限
        RoleAuth roleAuth1 = new RoleAuth();
        roleAuth1.setAid(originViewAuthId);
        roleAuth1.setRid(roleAuth.getRid());
        RoleAuth  roleAuth2 = this.findOne(roleAuth1);
        if(!ObjectUtils.isEmpty(roleAuth2)){
            this.deleteById(roleAuth2.getId());
        }

        //新增提交的查看权限
        this.save(roleAuth);
    }
}
