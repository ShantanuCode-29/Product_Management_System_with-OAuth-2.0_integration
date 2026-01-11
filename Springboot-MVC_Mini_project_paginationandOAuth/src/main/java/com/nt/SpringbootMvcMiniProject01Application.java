package com.nt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;                         // ✅ add this
import org.springframework.web.servlet.view.InternalResourceViewResolver; // ✅ add this

@SpringBootApplication
public class SpringbootMvcMiniProject01Application {

    public static void main(String[] args) {
        SpringApplication.run(SpringbootMvcMiniProject01Application.class, args);
    }

    // ✅ Bean method should be OUTSIDE main(), exactly like this
    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/pages/");  // folder containing JSPs
        resolver.setSuffix(".jsp");              // file extension
        return resolver;
    }
}
