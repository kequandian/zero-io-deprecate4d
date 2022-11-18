package com.jfeat.am.module.kafkaEmail.services.impl;

import com.jfeat.am.module.kafkaEmail.mail.*;

/**
 * Created by ehngjen on 4/17/2015.
 */
public class TextMailTask extends MailTask {
    public TextMailTask() {
        super(new KafkaTextKafkaMailSender());
    }
}
