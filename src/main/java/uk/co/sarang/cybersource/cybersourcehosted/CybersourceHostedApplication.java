package uk.co.sarang.cybersource.cybersourcehosted;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class CybersourceHostedApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder  configure(SpringApplicationBuilder  application) {
        return application.sources(CybersourceHostedApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(CybersourceHostedApplication.class, args);
    }

}
