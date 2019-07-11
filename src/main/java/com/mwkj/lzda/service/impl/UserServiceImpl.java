package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.UserMapper;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.UserService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by CodeGenerator on 2019/07/02.
 */
@Service
@Transactional
public class UserServiceImpl extends AbstractService<User> implements UserService {
    @Resource
    private UserMapper userMapper;

    @Override
    public List<String> getRoles(String policeCode) {
        return userMapper.getRoles(policeCode);
    }

    @Override
    public List<String> getPermissions(String policeCode) {
        return userMapper.getPermissions(policeCode);
    }
}
