package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.core.AppException;
import com.mwkj.lzda.dao.UserMapper;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.UserService;
import com.mwkj.lzda.core.AbstractService;
import com.mwkj.lzda.util.EncryptUtil;
import javafx.scene.Parent;
import org.apache.shiro.SecurityUtils;
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

    /**
     * @return void
     * @Author libaogang
     * @Date 2019-07-15 16:19
     * @Param [user]
     * @Description 更新密码
     */
    @Override
    public void updatePassword(User user, String newPassword) {
        if (newPassword.trim().length() < 6 || newPassword.trim().length() > 18) {
            throw new AppException("密码长度请保持在6-18位");
        }

        //加密盐值和加密次数与shiro配置保持一直
        String salt = String.valueOf(user.getId());
        final int hashIterations = 1024;

        user.setPassword(EncryptUtil.md5(user.getPassword(), salt, hashIterations));
        User user1 = this.findOne(user);

        if (null == user1) {
            throw new AppException("修改失败，原密码错误");
        }

        user.setPassword(EncryptUtil.md5(newPassword, salt, hashIterations));
        userMapper.updateByPrimaryKeySelective(user);

        //登出系统
        SecurityUtils.getSubject().logout();
    }
}
