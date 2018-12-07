package com.ruoyi.mq.rabbitmq.receiver;

import org.springframework.amqp.core.ExchangeTypes;
import org.springframework.amqp.rabbit.annotation.*;
import org.springframework.stereotype.Component;

@Component
@RabbitListener(bindings = @QueueBinding(
        value = @Queue(value = "dict_queue",autoDelete = "false"),
        exchange = @Exchange(value = "direct_exchange",type = ExchangeTypes.DIRECT),
        //key = "hi" ---> 需要键完全匹配 为 hello,才会受到消息,这样是收不到的
        key = {"hello","hi"}       //绑定两个路由key
    )
)
public class DirectReceiver {

    @RabbitHandler
    public void receive(String message){
        System.out.println("Receive: " + message);
    }
}
