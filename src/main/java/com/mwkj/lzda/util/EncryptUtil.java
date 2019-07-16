package com.mwkj.lzda.util;

import com.mwkj.lzda.constant.SysConstant;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * @Author: libaogang
 * @Date: 2019-07-15 20:11
 * @Description 密码加密工具类
 */
public class EncryptUtil {

    /**
     * @Author libaogang
     * @Date 2019-07-15 20:13
     * @Param [password, salt, hashIterations]
     * @return java.lang.String
     * @Description shiro提供的MD5加密方法
     */
    public static final String md5(String password, String salt, int hashIterations){
        //加密方式
        String hashAlgorithmName = "MD5";
        //盐：为了即使相同的密码不同的盐加密后的结果也不同
        ByteSource byteSalt = ByteSource.Util.bytes(salt);
        SimpleHash result = new SimpleHash(hashAlgorithmName, password, byteSalt, hashIterations);
        return result.toString();
    }

    public static void main(String[] args) {
        String password = md5("123456", SysConstant.SALT,1024);
        System.out.println(password);
    }
}