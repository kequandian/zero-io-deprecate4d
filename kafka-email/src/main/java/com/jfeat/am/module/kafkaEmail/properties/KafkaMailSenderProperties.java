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

package com.jfeat.am.module.kafkaEmail.properties;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Properties;

@Component
@ConfigurationProperties(prefix = "spring.mail")
public class KafkaMailSenderProperties {
    // 发送邮件的服务器的IP和端口
    @Value("${spring.mail.host:#{'smtp.126.com'}}")
    private String host;
    @Value("${spring.mail.port:#{'25'}}")
    private String port;
    // 邮件发送者的地址
    @Value("${spring.mail.username:#{'jiajiajia5000@126.com'}}")
    private String fromAddress;
    // 邮件接收者的地址
    private String toAddress;
    // 登陆邮件发送服务器的用户名和密码
    @Value("${spring.mail.username:#{'jiajiajia5000@126.com'}}")
    private String userName;
    @Value("${spring.mail.password:#{'CFERNTQPRZYHBRXO'}}")
    private String password;
    // 是否需要身份验证
    //@Value("${cpris.docRootPath:#{null}}")
    @Value("${spring.mail.properties.mail.smtp.auth:#{false}}")
    private boolean validate ;
    // 邮件主题
    private String subject;
    // 邮件的文本内容
    private String content;

    // 邮件附件的文件名
    private String[] attachFileNames;

//    @Value("{spring.mail.properties.mail.templates:#{null}}")
    private JSONObject emailTemplate;


    private List<String> tos;

    private List<String> copyTo;

    public JSONObject getEmailTemplate() {
        return emailTemplate;
    }

    public void setEmailTemplate(JSONObject emailTemplate) {
        this.emailTemplate = emailTemplate;
    }

    public List<String> getTos() {
        return tos;
    }

    public void setTos(List<String> tos) {
        this.tos = tos;
    }

    public List<String> getCopyTo() {
        return copyTo;
    }

    public void setCopyTo(List<String> copyTo) {
        this.copyTo = copyTo;
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

    public boolean isValidate() {
        return validate;
    }

    public void setValidate(boolean validate) {
        this.validate = validate;
    }

    public String[] getAttachFileNames() {
        return attachFileNames;
    }

    public void setAttachFileNames(String[] fileNames) {
        this.attachFileNames = fileNames;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getToAddress() {
        return toAddress;
    }

    public void setToAddress(String toAddress) {
        this.toAddress = toAddress;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

    public void setContent(String textContent) {
        this.content = textContent;
    }

    public String getFromAddress() {
        return fromAddress;
    }

    public void setFromAddress(String fromAddress) {
        this.fromAddress = fromAddress;
    }

    /**
     * 获得邮件会话属性
     */
    public Properties getProperties() {
        Properties p = new Properties();
        p.put("mail.smtp.host", this.host);
        if(this.port!=null){
            p.put("mail.smtp.port", this.port);
        }
        p.put("mail.smtp.auth", validate ? "true" : "false");
        p.put("mail.smtp.socketFactory.port", this.port);
        p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        return p;
    }

}