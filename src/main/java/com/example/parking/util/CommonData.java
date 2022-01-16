package com.example.parking.util;

public class CommonData {

    private static ConnectPool pool;
    private static String name="root";
    private static String pwd="123456";
    private static String databaseName = "stop_car";
    private static String IP = "121.5.128.157:3306/"+databaseName;;
    private static String url = "jdbc:mysql://"+IP+"?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8";

    private static int STUDENT = 0,TEACHER = 1,ADMIN = 2;

    public static int getSTUDENT() {
        return STUDENT;
    }

    public static int getTEACHER() {
        return TEACHER;
    }

    public static int getADMIN() {
        return ADMIN;
    }

    public static ConnectPool getPool() {
        return pool;
    }

    public static void setPool(ConnectPool pool) {
        CommonData.pool = pool;
    }

    public static String getUrl() {
        return url;
    }

    public static String getName() {
        return name;
    }

    public static String getPwd() {
        return pwd;
    }
}
