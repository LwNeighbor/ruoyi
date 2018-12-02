package com.ruoyi.mq.rabbitmq.receiver;

import org.springframework.amqp.core.ExchangeTypes;
import org.springframework.amqp.rabbit.annotation.*;
import org.springframework.stereotype.Component;

@Component
@RabbitListener(
            bindings = @QueueBinding(
                        value = @Queue(value = "topic.wang",autoDelete = "true"),
                        exchange = @Exchange(value = "topicExchange",type = ExchangeTypes.TOPIC),
                        key = "haha"
                    )
        )
public class TopicReceiver {

    @RabbitHandler
    public void process(String message) {
        System.out.println("Topic Receiver3  : " + message);
    }

}