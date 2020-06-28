package com.jfeat.upload.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Created on 2020/6/28.
 *
 * @author Wen Hao
 */

@Data
@Component
@ConfigurationProperties(prefix = "io")
public class IOProperties {

    private String fileUploadPath;

    private String fileHost;

    private SSOProperties ssoProperties = new SSOProperties();

    @Data
    public class SSOProperties {
        public String endpoint = "";
        public String accessKeyId = "";
        public String accessKeySecret = "";
        public String bucketName = "";
        public String username = "";
        /**
         * 图片压缩参数
         **/
        public String thumbParam = "x-oss-process=image/resize,m_fill,h_750,w_750";
        /**
         * 访问域名
         **/
        public String accessUrl = "";
    }

}
