package com.jfeat.am.module.kafkaEmail.services;

import org.apache.kafka.clients.consumer.ConsumerRecord;

public interface MasterKafkaEmailCustomService {

    void onEmailTextMassage(ConsumerRecord<?, ?> consumerRecord);

    void onEmailHtmlMassage(ConsumerRecord<?, ?> consumerRecord);
}
