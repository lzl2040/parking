package com.example.parking.dao;

import com.example.parking.entity.User;
import com.example.parking.util.ConnectPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    public User login(String name, String pwd){
        String sql = "select * from user where user_name = ? and pwd = ?";
        try {
            Connection conn = ConnectPool.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            ps.setString(2,pwd);
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                User user = new User(name,pwd);
                ConnectPool.closeAll(conn,rs,ps,null);
                return user;
            }
            ConnectPool.closeAll(conn,rs,ps,null);
            return null;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public boolean register(String name,String pwd){
        String sql = "insert into user(user_num,user_nmae,pwd) values(null,?,?)";
        try {
            Connection conn = ConnectPool.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,name);
            ps.setString(2,pwd);
            int res = ps.executeUpdate();
            ConnectPool.closeAll(conn,null,ps,null);
            if(res == 1){
                return true;
            }
            return false;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }
}
