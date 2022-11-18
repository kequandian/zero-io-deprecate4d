package com.jfeat.am.module.kafkaEmail.mail;

import com.jfeat.am.module.kafkaEmail.properties.KafkaMailSenderProperties;

public class MailUtil {
    public static void setSenderInfoByRequest(KafkaMailSenderProperties settingInfo, KafkaMailSenderProperties bodyInfo){
        if(bodyInfo.getUserName()!=null){
            settingInfo.setFromAddress(bodyInfo.getUserName());
            settingInfo.setUserName(bodyInfo.getUserName());}
        if(bodyInfo.getPassword()!=null){settingInfo.setPassword(bodyInfo.getPassword());}
        if(bodyInfo.getPort()!=null){settingInfo.setPort(bodyInfo.getPort());}
        if(bodyInfo.getHost()!=null){settingInfo.setHost(bodyInfo.getHost());}

    };
}
