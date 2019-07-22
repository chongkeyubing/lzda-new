package com.mwkj.lzda.service;
import com.mwkj.lzda.model.RoleAuth;
import com.mwkj.lzda.core.Service;


/**
 * Created by CodeGenerator on 2019-07-20 18:21.
 */
public interface RoleAuthService extends Service<RoleAuth> {
     void update(RoleAuth roleAuth,int originViewAuthId);

}
