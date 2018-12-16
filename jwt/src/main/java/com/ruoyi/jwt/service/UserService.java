package com.ruoyi.jwt.service;

import com.ruoyi.jwt.domain.User;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    public User findUserById(String userId) {

        User user = new User();

        if(userId.equals("1")){
            user.setId("1");
            user.setUsername("haha");
            user.setPassword("www");
        }else {
            user = null;
        }
        return user;
    }
}
