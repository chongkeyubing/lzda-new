package com.mwkj.lzda.core.util;

import java.io.File;
import java.util.UUID;

/**
 * @Author: libaogang
 * @Date: 2019-07-04 18:21
 * @Description ID生成器
 */
public class IDGenerator {

    /**
     * @Author libaogang
     * @Date 2019-07-04 18:24
     * @Param []
     * @return java.lang.String
     * @Description 生成32位UUID（通用唯一识别码）
     */
    public static String getUUID(){
        return UUID.randomUUID().toString().replace("-", "").toLowerCase();
    }


}