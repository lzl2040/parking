package com.example.parking.web;

import com.example.parking.entity.CircularBanner;
import com.example.parking.entity.CircularBanners;
import com.example.parking.entity.Message;
import com.example.parking.service.CircularBannerService;
import com.example.parking.service.imp.CircularBannerServiceImp;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(value = "/cbanner")
public class CircularBannerServlet extends HttpServlet {
    CircularBannerService cbs = new CircularBannerServiceImp();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        /*设置返回数据的格式*/
        resp.setCharacterEncoding("UTF-8");//设置服务器的文本格式
        resp.setContentType("application/json;charset=UTF-8");//告诉浏览器服务器的编码格式
        resp.setHeader("Content-type","application/json;charset=UTF-8");
        List<CircularBanner> cb = cbs.getCircularBanner();
        PrintWriter printWriter = resp.getWriter();
        if(cb != null){
            Message message = new Message("获取成功",200);
            CircularBanners circularBanners = new CircularBanners();
            circularBanners.setMsg(message);
            circularBanners.setData(cb);
            JSONArray jsonArray = JSONArray.fromObject(circularBanners);
            resp.setStatus(200);
            printWriter.write(jsonArray.toString());
        }else{
            Message msg = new Message("内部错误",500);
            resp.setStatus(500);
            JSONObject object = JSONObject.fromObject(msg);
            printWriter.write(object.toString());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
