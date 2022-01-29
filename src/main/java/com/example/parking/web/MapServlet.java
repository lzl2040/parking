package com.example.parking.web;

import com.example.parking.entity.Location;
import com.example.parking.service.MapService;
import com.example.parking.service.imp.MapServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(value = "/getMap")
public class MapServlet extends BaseServlet{
    MapService mapService = new MapServiceImp();
    public void getMap(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ServletException {
        List<Location> locations = mapService.getMap();
        req.getSession().setAttribute("locations",locations);
        req.getRequestDispatcher("/page/manage/map.jsp").forward(req,resp);
    }
}
