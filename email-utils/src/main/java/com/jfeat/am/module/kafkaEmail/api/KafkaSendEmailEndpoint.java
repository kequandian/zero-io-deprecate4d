package com.jfeat.am.module.kafkaEmail.api;

import com.jfeat.am.module.kafkaEmail.properties.KafkaMailSenderProperties;
import com.jfeat.am.module.kafkaEmail.services.KafkaSendEmailServices;
import com.jfeat.am.module.kafkaEmail.util.TemplateUtil;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/u/email")
public class KafkaSendEmailEndpoint {
    @Resource
    KafkaSendEmailServices kafkaSendEmailServices;

    @PostMapping("/text")
    public Tip sendEmail(@RequestBody KafkaMailSenderProperties mailSenderInfo){
        List<String> copyTo = new ArrayList<>();
        copyTo.add("1152808759@qq.com");
        mailSenderInfo.setCopyTo(copyTo);
        boolean b = kafkaSendEmailServices.sendTextEmail(mailSenderInfo);
        return SuccessTip.create(b);
    }

    @PostMapping("/html")
    public Tip sendHtmlEmail(@RequestBody KafkaMailSenderProperties mailSenderInfo){
        boolean b = kafkaSendEmailServices.sendHtmlEmail(mailSenderInfo);
        return SuccessTip.create(b);
    }

    @GetMapping("/test")
    public Tip test(){
        String templateContent="【元咕咕】您的短信验证码是：{code}，2分钟内有效";
        String templateParam="{\"code\": \"%s\"}";
//        System.out.println(formatTemplateParam(templateParam,"2000"));
//        System.out.println(getContent(templateContent,"2000"));
        Map<String,String> map = new HashMap<>();
        map.put("code","2000");
        return SuccessTip.create(TemplateUtil.getContent(templateContent,map));
    }

}
