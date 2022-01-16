package com.example.parking.util;

import java.sql.*;
import java.util.LinkedList;

public class ConnectPool {
    private static LinkedList<Connection> pool = new LinkedList<Connection>();
    private int maxLinks = 5;
    public ConnectPool(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            for(int i = 0;i < maxLinks;i++){
                Connection conn = DriverManager.getConnection(CommonData.getUrl(),CommonData.getName(),CommonData.getPwd());
                pool.add(conn);
            }
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }catch (SQLException e1){
            e1.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException{
        Connection conn = null;
        if(pool.size() > 0){
            conn = pool.removeFirst();
        }else{
            conn = DriverManager.getConnection(CommonData.getUrl(),CommonData.getName(),CommonData.getPwd());
        }
        return conn;
    }

    public static void closeAll(Connection conn, ResultSet rs, PreparedStatement ps,Statement st) throws SQLException{
        if(conn != null){
            conn.close();
        }
        if(ps != null){
            ps.close();
        }
        if(st != null){
            st.close();
        }
        if(rs != null){
            rs.close();
        }
    }
}
