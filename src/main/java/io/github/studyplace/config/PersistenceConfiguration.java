package io.github.studyplace.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.Properties;

@Configuration
public class PersistenceConfiguration {
    private  static final Logger logger = LoggerFactory.getLogger(PersistenceConfiguration.class);

    @Bean
    @Profile("prod")
    public DataSource prodDataSource() throws IOException {
        Resource resource = new ClassPathResource("/config/database/prod-datasource.properties");
        Properties props = PropertiesLoaderUtils.loadProperties(resource);

        DataSource dataSource = new DriverManagerDataSource(
                props.getProperty("spring.datasource.url"),
                props.getProperty("spring.datasource.username"),
                props.getProperty("spring.datasource.password")
        );

        return dataSource;
    }

    @Bean
    @Profile("dev")
    public DataSource embeddedDataSource(){
        EmbeddedDatabaseBuilder builder = new EmbeddedDatabaseBuilder();

        return builder.setType(EmbeddedDatabaseType.H2).build();
    }
}
