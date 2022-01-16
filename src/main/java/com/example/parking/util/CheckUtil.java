package com.example.parking.util;

public class CheckUtil {
    public static boolean checkRegisterOrLogin(String name,String pwd){
        if(pwd == null || pwd.equals("")){
            return false;
        }
        if(name == null || name.equals("")){
            return false;
        }
        return true;
    }
}
