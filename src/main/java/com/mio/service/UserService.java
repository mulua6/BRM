package com.mio.service;

import com.mio.domain.User;
import org.springframework.stereotype.Service;

/**
 * Created by liuhe on 2016/10/11.
 * update
 */
@Service("userService")
public interface UserService {

    public User login(User user);
}
