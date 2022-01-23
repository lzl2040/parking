package com.example.parking.web;

import com.example.parking.dao.UserDao;
import com.example.parking.entity.User;
import com.example.parking.util.CheckUtil;
import com.example.parking.util.CommonData;
import com.example.parking.util.ConnectPool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("username");
        String pwd = req.getParameter("pwd");
        if(CommonData.getPool()==null){
            ConnectPool pool = new ConnectPool();
            CommonData.setPool(pool);
        }
        if(CheckUtil.checkRegisterOrLogin(name,pwd)){
            UserDao ud = new UserDao();
            User user = ud.login(name,pwd);
            if(user == null){
                req.getSession().setAttribute("msg","登录失败,请检查密码是否正确");
                resp.sendRedirect("message.jsp");
            }else {
                System.out.println("登录成功");
                req.getSession().setAttribute("user",user);
                resp.sendRedirect(req.getContextPath()+"/page/manage/map.jsp");
            }
        }else{
            req.getSession().setAttribute("msg","用户名或者密码不能为空");
            resp.sendRedirect("message.jsp");
        }

    }
    /**
     * 获取6位随机生成的验证码
     * @return
     */
    public static String getVerifyCode() {
        String[] verifyString = new String[] { "0", "1", "2", "3", "4", "5",
                "6", "7", "8", "9" };
        Random random = new Random(System.currentTimeMillis());
        StringBuilder verifyBuilder = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            int rd = random.nextInt(10);
            verifyBuilder.append(verifyString[rd]);
        }
        String verifyCode = verifyBuilder.toString();
        return verifyCode;
    }
}
