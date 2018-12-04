package com.ruoyi.mq.rabbitmq.service;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 异步任务
 */
@Service
public class AsyncService {

    //告诉spring这是一个异步方法
    @Async
    public void asyncHello(){
        try {
            Thread.sleep(3000);
            System.out.println("处理完成");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }


}
