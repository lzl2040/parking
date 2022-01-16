package com.example.parking.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/update")
public class UpdateUserServlet extends HttpServlet {
    public void updateUser(HttpServletRequest req,HttpServletResponse resp) throws SQLException {

    }

}
