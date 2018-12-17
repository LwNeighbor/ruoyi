package com.ruoyi.jwt.service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.ruoyi.jwt.domain.User;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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

        Calendar nowtime = Calendar.getInstance();
        nowtime.add(Calendar.MINUTE,1);
        Date date = nowtime.getTime();

        Map<String, Object> map = new HashMap<>();
        map.put("alg","HS256");
        map.put("typ","JWT");

        /**
         * 标准中注册的声明
         * iss: jwt签发者
         * sub:jwt所面向的用户
         * aud:接受jwt的一方
         * exp: jwt的过期时间,这个过期时间必须要大于签发时间
         * nbf: 定义在什么时间之前,该jwt都是不可用的
         * iat:jwt的签发时间
         * jti:jwt的唯一身份标识,主要用来作为一次性token
         */



        token = JWT.create()
                .withHeader(map) //header是固定的
                .withClaim("haha",11) //自定义payload
                .withExpiresAt(date)    //设置过期时间,过期时间大于签发日期
                .withIssuedAt(new Date())
                .sign(Algorithm.HMAC256(user.getPassword())); //对密码加密

        return token;
    }
}
