package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.AuthorityMapper;
import com.mwkj.lzda.model.Authority;
import com.mwkj.lzda.service.AuthorityService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019/06/24.
 */
@Service
@Transactional
public class AuthorityServiceImpl extends AbstractService<Authority> implements AuthorityService {
    @Resource
    private AuthorityMapper authorityMapper;

}
