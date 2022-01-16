package com.example.parking.service;

import com.example.parking.entity.User;

public interface UserService {
    public User login(String username,String pwd);
    public int updateUser(User user);
}
