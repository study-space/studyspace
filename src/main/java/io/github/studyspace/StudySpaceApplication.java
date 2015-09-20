package io.github.studyspace;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.web.SpringBootServletInitializer;

@SpringBootApplication
public class StudySpaceApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(StudySpaceApplication.class, args);
    }
}