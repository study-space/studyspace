package io.github.studyplace.config;

import io.github.studyplace.controller.converter.PositionParamterConverter;
import org.springframework.boot.autoconfigure.web.WebMvcAutoConfiguration;
import org.springframework.boot.context.embedded.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.format.FormatterRegistry;

@Configuration
public class WebConfiguration extends WebMvcAutoConfiguration.WebMvcAutoConfigurationAdapter {

    @Bean
    @Profile("dev")
    public ServletRegistrationBean h2servletRegistration() {
        ServletRegistrationBean registration = new ServletRegistrationBean(new org.h2.server.web.WebServlet());
        registration.addUrlMappings("/h2console/*");

        return registration;
    }

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(new PositionParamterConverter());
        super.addFormatters(registry);
    }
}
