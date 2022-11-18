package com.jfeat.am.module.kafkaEmail.services.impl;

import com.jfeat.am.module.kafkaEmail.mail.KafkaHtmlKafkaMailSender;
import com.jfeat.am.module.kafkaEmail.mail.KafkaTextKafkaMailSender;
import com.jfeat.am.module.kafkaEmail.properties.KafkaMailSenderProperties;
import com.jfeat.am.module.kafkaEmail.services.KafkaSendEmailServices;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class KafkaSendEmailServiceImpl implements KafkaSendEmailServices {

    @Resource
    KafkaTextKafkaMailSender kafkaTextMailSender;
    @Resource
    KafkaHtmlKafkaMailSender kafkaHtmlMailSender;

    @Override
    public boolean sendTextEmail(KafkaMailSenderProperties mailSenderInfo){

        boolean send = kafkaTextMailSender.send(mailSenderInfo);
        return send;
    }


    @Override
    public boolean sendHtmlEmail(KafkaMailSenderProperties mailSenderInfo){

        boolean send = kafkaHtmlMailSender.send(mailSenderInfo);
        return send;
    }

}
