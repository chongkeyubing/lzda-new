package com.mwkj.lzda.converter;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;

/**
 * @Author: libaogang
 * @Date: 2019-07-30 17:40
 * @Description 重写FastJsonHttpMessageConverter排除对byte[]类型的支持,解决下载文件乱码问题
 */

public class MyFastJsonHttpMessageConverter extends FastJsonHttpMessageConverter {

    @Override
    protected boolean supports(Class<?> clazz) {
        if (clazz.equals(byte[].class)) {
            return false;
        }
        return true;
    }
}