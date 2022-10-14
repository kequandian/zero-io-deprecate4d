package com.jfeat;

import com.jfeat.crud.plus.META;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@Slf4j
@SpringBootApplication
public class AmApplication {
    public static void main(String[] args) {
        META.enabledTag(true);
        SpringApplication.run(AmApplication.class, args);
        log.info("Application run success!");
    }
}