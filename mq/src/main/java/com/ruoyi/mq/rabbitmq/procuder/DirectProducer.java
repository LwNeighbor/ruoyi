package com.ruoyi.mq.rabbitmq.procuder;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 路由模式. 匹配指定的键的消息才能被处理
 */
@Component
public class DirectProducer {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    public void directHello(){

        String context = "direct...";

        rabbitTemplate.convertAndSend("direct_exchange","hello",context);
    }

    public void directHi(){
        String context = "hello And Hi";

        rabbitTemplate.convertAndSend("direct_exchange","hi",context);
    }

}
