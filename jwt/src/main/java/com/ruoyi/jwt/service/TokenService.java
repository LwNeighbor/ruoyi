package com.ruoyi.jwt.service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.ruoyi.jwt.domain.User;
import org.springframework.stereotype.Service;

@Service
public class TokenService {
    /**
     * 生成token
     * @param user
     * @return
     */
    public String getToken(User user){
        String token = "";
        //token = JWT.create().withAudience(user.getId()).sign(Algorithm.HMAC256(user.getPassword()));


        token = JWT.create().withClaim("hahah",11).sign(Algorithm.HMAC256(user.getPassword()));

        return token;
    }
}
