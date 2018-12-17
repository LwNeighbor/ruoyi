package com.ruoyi.jwt.intercepter;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.ruoyi.jwt.annotation.PassToken;
import com.ruoyi.jwt.annotation.UserLoginToken;
import com.ruoyi.jwt.domain.User;
import com.ruoyi.jwt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.util.Map;

public class AuthenticationInterceptor implements HandlerInterceptor {
    @Autowired
    UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {

        //从请求头中取出token
        String token = request.getHeader("token");
        //如果不是映射到方法直接通过
        if(!(handler instanceof HandlerMethod)){
            return true;
        }

        HandlerMethod handlerMethod = (HandlerMethod)handler;

        Method method = handlerMethod.getMethod();

        //检查是否由passtoken注释,有则跳过认证
        if(method.isAnnotationPresent(PassToken.class)){
            PassToken passToken = method.getAnnotation(PassToken.class);
            if(passToken.required()){
                return true;
            }
        }

        //检查有没有需要用户权限的注解
        if(method.isAnnotationPresent(UserLoginToken.class)){
            UserLoginToken userLoginToken = method.getAnnotation(UserLoginToken.class);
            if(userLoginToken.required()){
                //执行认证
                if(token == null){
                    throw new RuntimeException("无Token,请重新登陆");
                }

                User user = userService.findUserById("1");

                if(user == null){
                    throw new RuntimeException("用户不存在,请重新登陆");
                }

                //验证token
                JWTVerifier build = JWT.require(Algorithm.HMAC256(user.getPassword())).build();
                try {
                    build.verify(token);

                }catch (JWTDecodeException e){
                    throw new RuntimeException("401");
                }

                return true;
            }
        }

        return true;
    }

}
