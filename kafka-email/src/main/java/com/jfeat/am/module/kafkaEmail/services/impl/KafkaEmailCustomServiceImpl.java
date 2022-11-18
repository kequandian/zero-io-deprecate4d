package com.jfeat.am.module.kafkaEmail.services.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jfeat.am.module.kafkaEmail.properties.KafkaMailSenderProperties;
import com.jfeat.am.module.kafkaEmail.services.KafkaEmailCustomService;
import com.jfeat.am.module.kafkaEmail.services.KafkaSendEmailServices;
import com.jfeat.module.kafka.services.domain.kafkaTopic.KafkaTopic;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Optional;

@Service
public class KafkaEmailCustomServiceImpl implements KafkaEmailCustomService {

    private final Logger logger = LoggerFactory.getLogger(KafkaEmailCustomService.class);
    @Resource
    KafkaSendEmailServices sendEmailServices;

    //不指定group，默认取yml里配置的
    @KafkaListener(topics = {KafkaTopic.EMAIL_TEXT})
    public void onEmailTextMassage(ConsumerRecord<?, ?> consumerRecord) {
        Optional<?> optional = Optional.ofNullable(consumerRecord.value());
        if (optional.isPresent()) {
            Object msg = optional.get();
            KafkaMailSenderProperties mailSenderProperties = new KafkaMailSenderProperties();
            JSONObject jsonObject = JSON.parseObject(msg.toString());
            mailSenderProperties.setToAddress(jsonObject.getString("toAddress"));
            mailSenderProperties.setTos(jsonObject.getJSONArray("toAddressList").toJavaList(String.class));
            mailSenderProperties.setSubject(jsonObject.getString("subject"));
            mailSenderProperties.setContent(jsonObject.getString("content"));
            System.out.println(JSONObject.toJSON(msg).toString());
            sendEmailServices.sendTextEmail(mailSenderProperties);
        }
    }

    @Override
    @KafkaListener(topics = {KafkaTopic.EMAIL_HTML})
    public void onEmailHtmlMassage(ConsumerRecord<?, ?> consumerRecord) {
        Optional<?> optional = Optional.ofNullable(consumerRecord.value());
        if (optional.isPresent()) {
            Object msg = optional.get();
            KafkaMailSenderProperties mailSenderProperties = new KafkaMailSenderProperties();
            JSONObject jsonObject = JSON.parseObject(msg.toString());
            mailSenderProperties.setTos(jsonObject.getJSONArray("toAddressList").toJavaList(String.class));
            mailSenderProperties.setToAddress(jsonObject.getString("toAddress"));
            mailSenderProperties.setSubject(jsonObject.getString("subject"));
            mailSenderProperties.setContent(jsonObject.getString("content"));
            System.out.println(JSONObject.toJSON(msg).toString());
            sendEmailServices.sendTextEmail(mailSenderProperties);
        }
    }
}
