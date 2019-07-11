package com.mwkj.lzda.core.layui;

import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;

/**
 * @Author: libaogang
 * @Date: 2019-07-02 11:28
 * @Description layui表格结果生成工具
 */
public class LayuiTableResultUtil {

    private static final int SUCCESS_CODE = 0;
    private static final int FAIL_CODE = -1;
    private static final String DEFAULT_SUCCESS_MESSAGE = "success";

    public static <T> Result<T> success(T data, long count) {
        LayuiTableResult<T> result = new LayuiTableResult<>();
        result.setCount(count);
        result.setCode(SUCCESS_CODE);
        result.setSuccess(true);
        result.setMessage(DEFAULT_SUCCESS_MESSAGE);
        result.setData(data);
        return result;
    }

    public static Result fail(String message) {
        LayuiTableResult result = new LayuiTableResult();
        result.setCount(0);
        result.setCode(FAIL_CODE);
        result.setSuccess(false);
        result.setMessage(null);
        return result;
    }
}