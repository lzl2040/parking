package com.example.parking.filter;

import com.example.parking.entity.User;
import com.example.parking.util.CommonData;
import com.example.parking.util.ConnectPool;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebFilter(urlPatterns = "/*")
public class CommonFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String ip = req.getRemoteAddr();
        String url = req.getRequestURI().toString();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d = new Date();
        String date = sdf.format(d);
        if(CommonData.getPool()==null){
            ConnectPool pool = new ConnectPool();
            CommonData.setPool(pool);
        }

        System.out.printf("%s %s 访问了 %s%n", date, ip, url);
        filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }

    public boolean checkIsLogin(User user){
        if(user == null){
            return false;
        }
        return true;
    }
}
