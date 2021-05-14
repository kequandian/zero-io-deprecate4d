package com.jfeat.config;

import com.jfeat.properties.AliyunProperties;
import com.jfeat.sms.SmsUtil;

import org.springframework.context.annotation.Configuration;

import java.util.Optional;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import lombok.extern.slf4j.Slf4j;

/**
 * Created on 2020/9/29 11:55 上午.
 *
 * @author Wen Hao
 */
@Configuration
@Slf4j
public class SmsConfiguration {
    @Resource
    AliyunProperties aliyunProperties;

    @PostConstruct
    public void setSmsUtilProperties() {
        log.info("start com.jfeat.config com.jfeat.sms com.jfeat.properties ...");
        AliyunProperties.SmsProperties sms = aliyunProperties.getSms();
        if (sms == null) {
            log.warn("com.jfeat.sms com.jfeat.properties is empty!");
            return;
        }
        /* 是否全局禁止短信发送 */
        Boolean enable = Optional.ofNullable(sms.getEnable()).orElse(true);
        log.info("com.jfeat.sms global enable : {}", enable);
        if (!enable) {
            log.warn("com.jfeat.sms 短信设置为全局禁止！");
        }
        SmsUtil.init(sms.getAccessKeyId(), sms.getAccessSecret(), sms.getSignName(), enable);

        log.info("com.jfeat.config com.jfeat.sms com.jfeat.properties end");
    }
}
