package com.jfeat.am.module.kafkaEmail.services;

import com.jfeat.am.module.kafkaEmail.properties.KafkaMailSenderProperties;

public interface KafkaSendEmailServices {
    boolean sendTextEmail(KafkaMailSenderProperties mailSenderInfo);

    boolean sendHtmlEmail(KafkaMailSenderProperties mailSenderInfo);
}
