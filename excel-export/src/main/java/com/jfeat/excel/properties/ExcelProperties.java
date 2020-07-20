package com.jfeat.excel.properties;

import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * Created on 2020/7/20.
 *
 * @author Wen Hao
 */
@Configuration
@ConfigurationProperties(prefix = "excel")
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ExcelProperties {

    String templateDirectory;

    /**
     * excel 导出
     */
    Map<String, ExcelPojo> export = new HashMap<>();

    @Data
    @Component
    public static class ExcelPojo {

        private String api;

        private String templateName;
    }
}
