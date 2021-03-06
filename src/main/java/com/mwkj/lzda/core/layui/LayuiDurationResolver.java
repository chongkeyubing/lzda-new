package com.mwkj.lzda.core.layui;

import org.apache.commons.lang3.StringUtils;

/**
 * @Author: libaogang
 * @Date: 2019-07-29 9:11
 * @Description layui前台时间段
 */
public class LayuiDurationResolver {
    public static String getBeginTime(String duration) {
        if (duration != null && duration.trim().length() != 0) {
            return duration.substring(0, 10);
        }
        return null;
    }

    public static String getEndTime(String duration) {
        if (duration != null && duration.trim().length() != 0) {
            return duration.substring(13, 23);
        }
        return null;
    }

}