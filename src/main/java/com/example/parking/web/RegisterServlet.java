package com.example.parking.web;

import com.example.parking.dao.UserDao;
import com.example.parking.util.CheckUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("username");
        String pwd = req.getParameter("pwd");
        String rpwd = req.getParameter("rpwd");
        if(pwd.equals(rpwd)){
            if(CheckUtil.checkRegisterOrLogin(name,pwd)){
                UserDao ud = new UserDao();
                boolean flag = ud.register(name,pwd);
                if(flag){
                    resp.sendRedirect("index.jsp");
                }else{
                    req.getSession().setAttribute("msg","注册失败");
                    resp.sendRedirect("message.jsp");
//                resp.getWriter().println("<script>alert('注册失败');</script>");
                }
            }else{
                req.getSession().setAttribute("msg","用户名或者密码不能为空");
                resp.sendRedirect("message.jsp");
            }

        }else{
            req.getSession().setAttribute("msg","两次密码不匹配");
            resp.sendRedirect("message.jsp");
//            resp.getWriter().println("<script>alert('两次密码不匹配');</script>");
        }
    }
}
