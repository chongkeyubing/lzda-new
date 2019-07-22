package com.mwkj.lzda.dao;

import com.mwkj.lzda.core.Mapper;
import com.mwkj.lzda.dto.RoleWithAuthsDTO;
import com.mwkj.lzda.model.Role;

public interface RoleMapper extends Mapper<Role> {
    RoleWithAuthsDTO findAuthsByRoleId(int id);
}