package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.RoleMapper;
import com.mwkj.lzda.model.Role;
import com.mwkj.lzda.service.RoleService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019/06/24.
 */
@Service
@Transactional
public class RoleServiceImpl extends AbstractService<Role> implements RoleService {
    @Resource
    private RoleMapper roleMapper;

}
