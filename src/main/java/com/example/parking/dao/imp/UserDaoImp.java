package com.example.parking.dao.imp;

import com.example.parking.dao.UserDao2;
import com.example.parking.entity.User;

public class UserDaoImp extends BaseDao implements UserDao2 {
    @Override
    public User queryUserByNameAndPwd(String username, String pwd) {
        String sql = "select * from user where user_name = ? and pwd = ?";
        return queryForOne(User.class,sql,username,pwd);
    }

    @Override
    public int saveUser(User user) {
        return 0;
    }

    @Override
    public int updateUser(User user) {
        String sql = "update user set user_name = ?,pwd = ?,live_address = ?,sex = ?,phone = ? where user_num = ?";
        return update(sql,user.getUsername(),user.getPwd(),user.getLiveAddress(),user.getSex(),user.getPhone(),user.getUserNum());
    }
}
