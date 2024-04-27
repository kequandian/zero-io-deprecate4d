package com.jfeat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @description: TODO
 * @project: zero-io
 * @version: 1.0
 * @date: 2023/4/23 15:16
 * @author: hhhhhtao
 */
@SpringBootApplication
public class AmApplication {

    protected static final Logger logger = LoggerFactory.getLogger(AmApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(AmApplication.class,args);
        logger.info("zero-io-wechat-message start up success");
    }

}
