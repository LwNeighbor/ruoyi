package com.ruoyi.mq;

import com.ruoyi.mq.rabbitmq.procuder.FanoutProcedure;
import com.ruoyi.mq.rabbitmq.procuder.TopicRabbitProcedure;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TopicRabbitTest {

    @Autowired
    private TopicRabbitProcedure procedure;

    @Autowired
    private FanoutProcedure fanoutProcedure;

    @Test
    public void topic() throws Exception{
        //procedure.send();
        //procedure.send1();
        //procedure.send2();
        procedure.send3();
    }

    @Test
    public void fanout(){
        fanoutProcedure.send();
    }

}
