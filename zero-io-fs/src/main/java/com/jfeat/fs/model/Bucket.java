package com.jfeat.fs.model;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 存储桶实体类
 *
 * @author zchengb
 * @date 2021-05-12
 */
@Data
@Accessors(chain = true)
public class Bucket {
    /**
     * 存储桶名称
     */
    private String bucket;

    /**
     * 应用ID
     */
    private String appId;

    /**
     * 应用密钥
     */
    private String appSecret;
}