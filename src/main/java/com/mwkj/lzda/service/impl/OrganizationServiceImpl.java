package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.OrganizationMapper;
import com.mwkj.lzda.model.Organization;
import com.mwkj.lzda.service.OrganizationService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019/07/03.
 */
@Service
@Transactional
public class OrganizationServiceImpl extends AbstractService<Organization> implements OrganizationService {
    @Resource
    private OrganizationMapper organizationMapper;

}
