package com.example.parking.filter;

import com.example.parking.entity.User;
import com.example.parking.service.UserService;
import com.example.parking.service.imp.UserServiceImp;
import com.example.parking.util.CheckUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = "/page/user/login.jsp")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletResponse  resp = (HttpServletResponse) servletResponse;
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        //说明没有登录
        System.out.println("进入到后台登录过滤器");
        Cookie[] cookies = req.getCookies();
        String username = null;
        String pwd = null;
        if(cookies != null){
            username = cookies[0].getValue();
            pwd = cookies[1].getValue();
        }
        if(CheckUtil.checkRegisterOrLogin(username,pwd)){
            UserService userService = new UserServiceImp();
            User user = userService.login(username,pwd);
            req.getSession().setAttribute("user",user);
            resp.sendRedirect(req.getContextPath()+"/getMap?action=getMap");
        }
        filterChain.doFilter(req,resp);
    }
}
