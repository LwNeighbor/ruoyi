package com.my.blog.website;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import javax.sql.DataSource;

@MapperScan("com.my.blog.website.dao")
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class CoreApplication extends SpringBootServletInitializer
{

    public static void main(String[] args) {
        SpringApplication.run(CoreApplication.class, args);
    }
}
