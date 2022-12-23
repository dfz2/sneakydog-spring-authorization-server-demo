package dog.sneaky.demo.configuration;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.session.config.annotation.web.http.EnableSpringHttpSession;
//import org.springframework.session.config.annotation.web.http.EnableSpringHttpSession;


@Configuration
@EnableSpringHttpSession
public class SessionConfiguration {

    @Bean
    public HttpSessionEventPublisher httpSessionEventPublisher() {
        return new HttpSessionEventPublisher();
    }

}
