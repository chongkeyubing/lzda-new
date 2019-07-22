package com.mwkj.lzda.service;
import com.mwkj.lzda.dto.RoleWithAuthsDTO;
import com.mwkj.lzda.model.Role;
import com.mwkj.lzda.core.Service;


/**
 * Created by CodeGenerator on 2019-07-20 14:28.
 */
public interface RoleService extends Service<Role> {

    RoleWithAuthsDTO findAuthsByRoleId(int id);

}
