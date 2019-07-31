package com.mwkj.lzda.dto;

import com.mwkj.lzda.model.Authority;

import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-20 14:23
 * @Description 带权限的角色实体
 */
public class RoleWithAuthsDTO {
    private String roleId;
    private String roleName;
    private List<Authority> authorityList;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public List<Authority> getAuthorityList() {
        return authorityList;
    }

    public void setAuthorityList(List<Authority> authorityList) {
        this.authorityList = authorityList;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}