package com.dietsite;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@MapperScan(value = {"com.dietsite.mapper"})
@SpringBootApplication
public class DietSiteApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(DietSiteApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder applicationBuilder) {
        return applicationBuilder.sources(ServletInitializer.class);
    }

}