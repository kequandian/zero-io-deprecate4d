package com.jfeat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.freemarker.FreeMarkerAutoConfiguration;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * Created on 2020/1/3.
 *
 * @author Wen Hao
 */

@SpringBootApplication
@EnableScheduling
@EnableAutoConfiguration(exclude = { FreeMarkerAutoConfiguration.class })
public class IoApplication {
    protected final static Logger logger = LoggerFactory.getLogger(IoApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(IoApplication.class, args);
        logger.info("Test IoApplication is success!");

    }


}
