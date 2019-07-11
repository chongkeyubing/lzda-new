package com.mwkj.lzda.dao;

import com.mwkj.lzda.core.Mapper;
import com.mwkj.lzda.model.User;

import java.util.List;

public interface UserMapper extends Mapper<User> {

    List<String> getRoles(String policeCode);

    List<String> getPermissions(String policeCode);
}