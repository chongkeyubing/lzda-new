package com.mwkj.lzda.web;

import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @Author: libaogang
 * @Date: 2019-06-24 10:50
 * @Description 登陆登出控制器
 */
@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(String policeCode, String password, HttpSession session, ModelMap modelMap) {
        try {
            UsernamePasswordToken token = new UsernamePasswordToken(policeCode, password);
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
            User user = userService.findBy("policeCode", policeCode);
            session.setAttribute("currentUser", user);
        } catch (AuthenticationException e) {
            modelMap.put("msg", "账号或密码错误");
            modelMap.put("policeCode", policeCode);
            e.printStackTrace();
            return "/index";
        }
        return "redirect:/main.jsp";
    }

    @RequestMapping("/logout")
    public String logout() {
        SecurityUtils.getSubject().logout();
        return "redirect:/index.jsp";
    }

}
