package com.ruoyi.mq.rabbitmq.procuder;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 发布订阅模式生产者
 */
@Component
public class FanoutProcedure {

    @Autowired
    private AmqpTemplate amqpTemplate;

    public void send(){
        String context = "发布订阅模式";

        System.out.println("Send : " +context);
        this.amqpTemplate.convertAndSend("faExchange","",context);
    }
}
