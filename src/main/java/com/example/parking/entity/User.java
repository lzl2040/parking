package com.example.parking.entity;

public class User {
    private String user_num;
    private String user_name;
    private String pwd;
    private int sex;
    private String live_address;
    private String phone;

    public User(String name, String pwd){
        this.user_name = name;
        this.pwd = pwd;
    }

    public User() {
    }

    public User(String user_num, String user_name, String pwd, int sex, String live_address, String phone) {
        this.user_num = user_num;
        this.user_name = user_name;
        this.pwd = pwd;
        this.sex = sex;
        this.live_address = live_address;
        this.phone = phone;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUser_num() {
        return user_num;
    }

    public void setUser_num(String user_num) {
        this.user_num = user_num;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getLive_address() {
        return live_address;
    }

    public void setLive_address(String live_address) {
        this.live_address = live_address;
    }
}
