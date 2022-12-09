package dog.sneaky.demo.configuration;


import org.springframework.context.annotation.Configuration;
import org.springframework.session.config.annotation.web.http.EnableSpringHttpSession;
//import org.springframework.session.config.annotation.web.http.EnableSpringHttpSession;


@Configuration
@EnableSpringHttpSession
public class SessionConfiguration {
}
