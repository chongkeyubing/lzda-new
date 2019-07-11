package com.mwkj.lzda.service;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.core.Service;

import java.util.List;


/**
 * Created by CodeGenerator on 2019/07/02.
 */
public interface UserService extends Service<User> {

    List<String> getRoles(String policeCode);
    List<String> getPermissions(String policeCode);
}
