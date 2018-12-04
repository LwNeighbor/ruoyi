package com.ruoyi.mq.rabbitmq.receiver;

import org.springframework.amqp.core.ExchangeTypes;
import org.springframework.amqp.rabbit.annotation.*;
import org.springframework.stereotype.Component;

@Component
@RabbitListener(
        bindings = @QueueBinding(
                value = @Queue(value = "faB",autoDelete = "false"),
                exchange = @Exchange(value = "faExchange",type = ExchangeTypes.FANOUT)
        )
)
public class FanoutReceiver2{
    @RabbitHandler
    public void receiver2(String message){
        System.out.println("faB...."+message);
    }

}
