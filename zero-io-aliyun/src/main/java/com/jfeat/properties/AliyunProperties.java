package com.jfeat.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

/**
 * Created on 2020/6/28.
 *
 * @author Wen Hao
 */

@Data
@Component
@ConfigurationProperties(prefix = "aliyun")
public class AliyunProperties {

    private SSOProperties sso = new SSOProperties();

    private SmsProperties sms = new SmsProperties();

    @Data
    public class SSOProperties {
        private String endpoint = "";
        private String accessKeyId = "";
        private String accessKeySecret = "";
        private String bucketName = "";
        private String username = "";
        /**
         * 图片压缩参数
         **/
        private String thumbParam = "x-com.jfeat.oss-process=image/resize,m_fill,h_750,w_750";
        /**
         * 访问域名
         **/
        private String accessUrl = "http://xxxxxx.oss-cn-shenzhen.aliyuncs.com";
    }


    @Data
    public class SmsProperties {

        private String signName;
        private String accessKeyId;
        private String accessSecret;
        private Boolean enable;
    }

}
