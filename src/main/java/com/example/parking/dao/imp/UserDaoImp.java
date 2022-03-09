package com.example.parking.dao.imp;

import com.example.parking.dao.UserDao;
import com.example.parking.entity.User;

public class UserDaoImp extends BaseDao implements UserDao {
    @Override
    public User queryUserByNameAndPwd(String username, String pwd) {
        String sql = "select * from user where user_name = ? and pwd = ?";
        return queryForOne(User.class,sql,username,pwd);
    }

    @Override
    public int saveUser(User user) {
        String sql = "insert into user(user_num,user_name,pwd) values(null,?,?)";
        return update(sql,user.getUser_name(),user.getPwd());
    }

    @Override
    public int updateUser(User user) {
        String sql = "update user set user_name = ?,pwd = ?,live_address = ?,sex = ?,phone = ? where user_num = ?";
        return update(sql,user.getUser_name(),user.getPwd(),user.getLive_address(),user.getSex(),user.getPhone(),user.getUser_num());
    }
}
