/*
 * Copyright (C) 2014-2015 by ehngjen @ www.jfeat.com
 *
 *  The program may be used and/or copied only with the written permission
 *  from JFeat.com, or in accordance with the terms and
 *  conditions stipulated in the agreement/contract under which the program
 *  has been supplied.
 *
 *  All rights reserved.
 */

package com.jfeat.am.module.kafkaEmail.mail;


import com.jfeat.am.module.kafkaEmail.properties.KafkaMailSenderProperties;
import com.jfeat.am.module.kafkaEmail.services.KafkaMailSender;

/**
 * Created by ehngjen on 4/17/2015.
 */
public abstract class MailTask implements Runnable {

    private String host;
    private String port = "25";
    private String fromAddress;
    private String toAddress;
    private String subject;
    private String content;
    private String userName;
    private String password;

    private KafkaMailSender kafkaMailSender;

    public MailTask(KafkaMailSender sender) {
        kafkaMailSender = sender;
    }

    @Override
    public void run() {
        KafkaMailSenderProperties mailInfo = new KafkaMailSenderProperties();
        mailInfo.setHost(host);
        mailInfo.setPort(port);
        if (userName != null && !"".equalsIgnoreCase(userName)) {
            mailInfo.setValidate(true);
            mailInfo.setUserName(userName);
            mailInfo.setPassword(password);
        }
        mailInfo.setFromAddress(fromAddress);
        mailInfo.setToAddress(toAddress);
        mailInfo.setSubject(subject);
        mailInfo.setContent(content);

        kafkaMailSender.send(mailInfo);
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getFromAddress() {
        return fromAddress;
    }

    public void setFromAddress(String fromAddress) {
        this.fromAddress = fromAddress;
    }

    public String getToAddress() {
        return toAddress;
    }

    public void setToAddress(String toAddress) {
        this.toAddress = toAddress;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
