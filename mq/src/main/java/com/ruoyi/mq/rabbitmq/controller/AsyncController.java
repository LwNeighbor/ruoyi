package com.ruoyi.mq.rabbitmq.controller;

import com.ruoyi.mq.rabbitmq.service.AsyncService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 异步任务
 */
@RestController
public class AsyncController {

    @Autowired
    private AsyncService service;

    @GetMapping("/hello")
    public String hello(){
        service.asyncHello();
        return "success";
    }
}
