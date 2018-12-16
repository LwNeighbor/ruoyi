package com.ruoyi.jwt.controller;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.jwt.annotation.UserLoginToken;
import com.ruoyi.jwt.domain.User;
import com.ruoyi.jwt.service.TokenService;
import com.ruoyi.jwt.service.UserService;
import com.ruoyi.jwt.utils.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;



@RestController
@RequestMapping("api")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    TokenService tokenService;

    @GetMapping("/login/{id}")
    public AjaxResult login(@PathVariable("id") String id){

        User user = new User("1","haha","www");

        JSONObject jsonObject = new JSONObject();

        User userT = userService.findUserById(id);
        if(userT == null){
            return AjaxResult.error("登陆失败,用户不存在");
        }else {

            if(!userT.getPassword().equals(user.getPassword())){
                return AjaxResult.error("登陆失败,密码错误");
            }else{
                String token = tokenService.getToken(userT);
                return AjaxResult.success(token);
            }
        }
    }

    @UserLoginToken
    @GetMapping("/getMessage")
    public String getMessage(){
        return "你已通过验证";
    }


}
