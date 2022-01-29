package com.example.parking.web;

import com.example.parking.dao.UserDao;
import com.example.parking.entity.User;
import com.example.parking.service.UserService;
import com.example.parking.service.imp.UserServiceImp;
import com.example.parking.util.CheckUtil;
import com.example.parking.util.CommonData;
import com.example.parking.util.ConnectPool;
import com.example.parking.util.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/userservice")
public class UserServlet extends BaseServlet{
    UserService userService = new UserServiceImp();

    public void updateUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        String userNum = (req.getParameter("usernum"));
        String username = req.getParameter("username");
        String sex = req.getParameter("sex");
        String phone = req.getParameter("phone");
        String liveAddress = req.getParameter("address");
        String pwd = req.getParameter("pwd");
        User user = new User(userNum,username,pwd,WebUtils.transformSexIntoInt(sex),liveAddress,phone);
        System.out.println("用户编号为"+userNum);
        int rs = userService.updateUser(user);
        if(rs != -1){
            req.getSession().setAttribute("user",user);
            //
            resp.sendRedirect(req.getContextPath()+"/page/manage/userInfo.jsp");
            System.out.println("修改成功");
        }
    }

    public void login(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ServletException {
        String name = req.getParameter("username");
        String pwd = req.getParameter("pwd");
        if(CommonData.getPool()==null){
            ConnectPool pool = new ConnectPool();
            CommonData.setPool(pool);
        }
        if(CheckUtil.checkRegisterOrLogin(name,pwd)){
            User user = userService.login(name,pwd);
            if(user == null){
                req.getSession().setAttribute("msg","登录失败,请检查密码是否正确");
                resp.sendRedirect("message.jsp");
            }else {
                System.out.println("登录成功");
                req.getSession().setAttribute("user",user);
                req.getRequestDispatcher("/getMap?action=getMap").forward(req,resp);
            }
        }else{
            req.getSession().setAttribute("msg","用户名或者密码不能为空");
            resp.sendRedirect("message.jsp");
        }
    }

    public void register(HttpServletRequest req, HttpServletResponse resp) throws SQLException,IOException{
        String name = req.getParameter("username");
        String pwd = req.getParameter("pwd");
        String rpwd = req.getParameter("rpwd");
        User user = new User(name,pwd);
        if(pwd.equals(rpwd)){
            if(CheckUtil.checkRegisterOrLogin(name,pwd)){
                int res = userService.register(user);
                if(res != -1){
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
