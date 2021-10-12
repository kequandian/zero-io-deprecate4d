package com.jfeat.fs.properties;

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
public class FSProperties {

    // 文件上传的保存相对路径
    private String fileUploadPath;

    // 外网访问的相对路径(基于网关nginx)，相当于 fileDownloadPath
    private String fileHost;
}
