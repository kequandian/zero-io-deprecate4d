package com.jfeat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import lombok.extern.slf4j.Slf4j;

/**
 * Created on 2020/6/28.
 *
 * @author Wen Hao
 */
@Slf4j
@SpringBootApplication
public class AmApplication {
    public static void main(String[] args) {
        SpringApplication.run(AmApplication.class, args);
        log.info("com.jfeat.AmApplication is running success");
    }
}