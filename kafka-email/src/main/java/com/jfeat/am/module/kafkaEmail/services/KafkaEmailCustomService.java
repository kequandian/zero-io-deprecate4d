package com.jfeat.am.module.kafkaEmail.services;

import org.apache.kafka.clients.consumer.ConsumerRecord;

public interface KafkaEmailCustomService {
    void onEmailTextMassage(ConsumerRecord<?, ?> consumerRecord);

    void onEmailHtmlMassage(ConsumerRecord<?, ?> consumerRecord);
}
