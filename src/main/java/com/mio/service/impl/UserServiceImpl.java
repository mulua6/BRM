package com.mio.service.impl;

import com.mio.domain.User;
import com.mio.domain.UserExample;
import com.mio.mapper.UserMapper;
import com.mio.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by liuhe on 2016/10/11.
 * update
 */
public class UserServiceImpl implements UserService{

    @Autowired
    UserMapper userMapper;


    @Override
    public User login(User user) {

        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();

        criteria.andUsernameEqualTo(user.getUsername());
        criteria.andPasswordEqualTo(user.getPassword());


        List<User> users = userMapper.selectByExample(userExample);

        return users.get(0);
    }


    public UserMapper getUserMapper() {
        return userMapper;
    }

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }
}
