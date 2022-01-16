package com.example.parking.web;

import com.example.parking.entity.User;
import com.example.parking.service.UserService;
import com.example.parking.service.imp.UserServiceImp;
import com.example.parking.util.WebUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@WebServlet(value = "/userservice")
public class UserServlet extends BaseServlet{
    UserService userService = new UserServiceImp();

    public void updateUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
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
            System.out.println("修改成功");
        }
    }
}
