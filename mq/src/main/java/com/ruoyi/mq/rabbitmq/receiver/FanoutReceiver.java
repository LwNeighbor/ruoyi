package com.ruoyi.mq.rabbitmq.receiver;

import org.springframework.amqp.core.ExchangeTypes;
import org.springframework.amqp.rabbit.annotation.*;
import org.springframework.stereotype.Component;

@Component
@RabbitListener(
        bindings = @QueueBinding(
                value = @Queue(value = "faA",autoDelete = "false"),
                exchange = @Exchange(value = "faExchange",type = ExchangeTypes.FANOUT),
                key = "faA"
        )
)
public class FanoutReceiver {

    @RabbitHandler
    public void receiver(String message){
        System.out.println("Re1 : "+message);
    }
}
