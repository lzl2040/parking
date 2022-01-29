package com.example.parking.service.imp;

import com.example.parking.entity.User;
import com.example.parking.service.UserService;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UserServiceImpTest {

    @Test
    void login() {
        UserService userService = new UserServiceImp();
        User user = userService.login("lzl","1234");
        System.out.println(user.getUser_name());
    }
}