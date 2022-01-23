package com.example.parking.service.imp;

import com.example.parking.dao.UserDao2;
import com.example.parking.dao.imp.UserDaoImp;
import com.example.parking.entity.User;
import com.example.parking.service.UserService;

public class UserServiceImp implements UserService {
    UserDao2 userDao2 = new UserDaoImp();
    @Override
    public User login(String username, String pwd) {
        return userDao2.queryUserByNameAndPwd(username,pwd);
    }

    @Override
    public int updateUser(User user) {
        return userDao2.updateUser(user);
    }

    @Override
    public int register(User user) {
        return userDao2.saveUser(user);
    }
}
