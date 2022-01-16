package com.example.parking.entity;

public class User {
    private String userNum;
    private String username;
    private String pwd;
    private int sex;
    private String liveAddress;
    private String phone;

    public User(String name, String pwd){
        this.username = name;
        this.pwd = pwd;
    }

    public User(String usernum,String username, String pwd, int sex, String liveAddress, String phone) {
        this.userNum = usernum;
        this.username = username;
        this.pwd = pwd;
        this.sex = sex;
        this.liveAddress = liveAddress;
        this.phone = phone;
    }

    public User() {
    }

    public String getUserNum() {
        return userNum;
    }

    public void setUserNum(String userNum) {
        this.userNum = userNum;
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

    public String getLiveAddress() {
        return liveAddress;
    }

    public void setLiveAddress(String liveAddress) {
        this.liveAddress = liveAddress;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
