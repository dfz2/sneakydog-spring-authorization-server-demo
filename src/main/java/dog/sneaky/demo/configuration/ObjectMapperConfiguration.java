package dog.sneaky.demo.configuration;


import dog.sneaky.demo.common.DefaultObjectMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//@Configuration
public class ObjectMapperConfiguration {

    @Bean("defaultObjectMapper")
    public DefaultObjectMapper defaultObjectMapper() {
        return new DefaultObjectMapper();
    }
}
