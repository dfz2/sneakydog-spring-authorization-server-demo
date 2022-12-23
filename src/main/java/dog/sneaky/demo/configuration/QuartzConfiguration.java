package dog.sneaky.demo.configuration;


import org.springframework.boot.autoconfigure.quartz.QuartzDataSource;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

import javax.sql.DataSource;


@Configuration
@EnableScheduling
public class QuartzConfiguration  {

//    @Bean("quartzDataSource")
//    @QuartzDataSource
//    @ConfigurationProperties(prefix = "spring.quartz.datasource")
//    DataSource quartzDataSource(){
//        return DataSourceBuilder.create().build();
//    }
}
