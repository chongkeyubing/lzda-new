package com.mwkj.lzda.filter;

import com.alibaba.fastjson.JSON;
import com.mwkj.lzda.core.ResultUtil;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author: libaogang
 * @Date: 2019-07-25 8:58
 * @Description 解决ajax请求session失效的问题
 */
public class ajaxAuthenticationFilter extends FormAuthenticationFilter {
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        if (isLoginRequest(request, response)) {
            if (isLoginSubmission(request, response)) {
                return executeLogin(request, response);
            } else {
                return true;
            }
        } else {
            if (isAjax(request)) {
                HttpServletResponse rep = (HttpServletResponse) response;
                rep.getWriter().write(JSON.toJSONString(ResultUtil.fail("登陆已超时，请重新登陆")));
                rep.setHeader("sessionstatus", "timeout");
            } else {
                this.saveRequestAndRedirectToLogin(request, response);
            }
            return false;
        }
    }

    private boolean isAjax(ServletRequest req) {
        return ("XMLHttpRequest").equals(((HttpServletRequest) req).getHeader("x-requested-with"));
    }
}