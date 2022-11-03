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
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Date;
import java.util.Properties;

/**
 * Created by ehngjen on 4/17/2015.
 */
@Service
public class KafkaHtmlKafkaMailSender implements KafkaMailSender {

    @Autowired
    KafkaMailSenderProperties info;

    @Override
    public boolean send(KafkaMailSenderProperties mailInfo) {
        if(info.getHost()==null || info.getFromAddress()==null || info.getToAddress()==null || info.getUserName()==null || info.getPassword()==null){
            throw new BusinessException(BusinessCode.BadRequest, "spring.mail properties not yet config, do not use email registration!");
        }

        //优先根据请求体中的参数进行配置
        MailUtil.setSenderInfoByRequest(info,mailInfo);
        // 判断是否需要身份认证
        MailAuthenticator authenticator = null;
        Properties pro = info.getProperties();
        //如果需要身份认证，则创建一个密码验证器
        if (info.isValidate()) {
            authenticator = new MailAuthenticator(info.getUserName(), info.getPassword());
        }
        // 根据邮件会话属性和密码验证器构造一个发送邮件的session
        Session sendMailSession = Session.getDefaultInstance(pro, authenticator);
        try {
            // 根据session创建一个邮件消息
            Message mailMessage = new MimeMessage(sendMailSession);
            // 创建邮件发送者地址
            Address from = new InternetAddress(info.getFromAddress());
            // 设置邮件消息的发送者
            mailMessage.setFrom(from);
            // 创建邮件的接收者地址，并设置到邮件消息中
            if (mailInfo.getToAddress()!=null){
                Address to = new InternetAddress(mailInfo.getToAddress());
                mailMessage.setRecipient(Message.RecipientType.TO, to);
            }



            if (mailInfo.getTos()!=null && mailInfo.getTos().size()>0){
                Address tos[] = new InternetAddress[mailInfo.getTos().size()];
                for (int i=0;i<mailInfo.getTos().size();i++){
                    tos[i] = new InternetAddress(mailInfo.getTos().get(i));
                }
                mailMessage.setRecipients(Message.RecipientType.TO,tos);
            }

            if (mailInfo.getCopyTo()!=null && mailInfo.getCopyTo().size()>0){
                Address copyTO[] = new InternetAddress[mailInfo.getCopyTo().size()];
                for (int i=0;i<mailInfo.getCopyTo().size();i++){
                    copyTO[i] = new InternetAddress(mailInfo.getCopyTo().get(i));
                }
                mailMessage.setRecipients(Message.RecipientType.CC,copyTO);
            }

            // 设置邮件消息的主题
            mailMessage.setSubject(mailInfo.getSubject());
            // 设置邮件消息发送的时间
            mailMessage.setSentDate(new Date());
            // MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象
            Multipart mainPart = new MimeMultipart();
            // 创建一个包含HTML内容的MimeBodyPart
            BodyPart html = new MimeBodyPart();
            // 设置HTML内容
            html.setContent(mailInfo.getContent(), "text/html; charset=utf-8");
            mainPart.addBodyPart(html);
            // 将MiniMultipart对象设置为邮件内容
            mailMessage.setContent(mainPart);
            // 发送邮件
            Transport.send(mailMessage);
            return true;
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
        return false;
    }
}
