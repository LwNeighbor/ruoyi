package com.ruoyi.mq.rabbitmq.service;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

/**
 * 定时任务
 */
@Service
public class ScheduleService {

    //@Scheduled(cron = "3 * * * * MON-WED")
    public void scheHello(){
        System.out.println("hello world");
    }

}
