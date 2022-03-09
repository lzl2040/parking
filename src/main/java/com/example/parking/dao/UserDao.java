package com.example.parking.dao;

import com.example.parking.entity.User;

public interface UserDao {
    public User queryUserByNameAndPwd(String username,String pwd);
    public int saveUser(User user);
    public int updateUser(User user);
}
