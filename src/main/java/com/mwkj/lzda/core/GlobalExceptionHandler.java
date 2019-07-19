package com.mwkj.lzda.core;

import com.alibaba.fastjson.JSON;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: libaogang
 * @Date: 2019-06-06 23:40
 * @Description 全局异常处理类，ajax请求和页面请求而分开处理
 */
public class GlobalExceptionHandler implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response,
                                         Object handler, Exception e) {
        e.printStackTrace();
        ModelAndView mv = new ModelAndView();
        //如果是ajax请求
        if (isAjax(request)) {
            Result result;
            //业务异常
            if (e instanceof AppException) {
                result = ResultUtil.fail(e.getMessage());
            } else {
                //其余异常
                result = ResultUtil.fail("接口 [" + request.getRequestURI() + "] 内部错误:" + e.getMessage());
            }
            //输出json,不会再跳转到视图
            responseResult(response, result);
        } else {
            //如果是页面请求跳转到错误页面
            mv.setViewName("error");
            if (e instanceof AppException) {
                mv.addObject("msg", e.getMessage());
            } else {
                mv.addObject("msg", "系统内部错误:" + e.getMessage());
            }
        }
        return mv;
    }

    private void responseResult(HttpServletResponse response, Result result) {
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Content-type", "application/json;charset=UTF-8");
        response.setStatus(200);
        try {
            response.getWriter().write(JSON.toJSONString(result));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private boolean isAjax(HttpServletRequest req) {
        return ("XMLHttpRequest").equals(req.getHeader("x-requested-with"));
    }
}