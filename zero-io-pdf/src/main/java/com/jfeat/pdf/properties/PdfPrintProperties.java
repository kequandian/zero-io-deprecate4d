package com.jfeat.pdf.properties;

import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * Created on 2021/2/3 4:21 下午.
 *
 * @author Wen Hao
 */
@Configuration
@ConfigurationProperties(prefix = "pdf")
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class PdfPrintProperties {

    /**
     * pdf 打印模版存放路径
     */
    String templateDirectory;
}
