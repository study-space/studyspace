package io.github.studyspace;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages = {"io.github.studyspace"})
@SpringBootApplication
public class StudySpaceApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(StudySpaceApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(StudySpaceApplication.class, args);
    }
}