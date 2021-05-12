package com.jfeat.fs.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 存储桶关键属性配置
 *
 * @author zchengb
 * @date 2021-05-12
 */
@Data
@Component
@Accessors(chain = true)
@ConfigurationProperties(prefix = "bucket")
public class BucketProperties {
    /**
     * 应用ID
     */
    Long appId;

    /**
     * 应用密钥
     */
    String appKey;
}