package dog.sneaky.demo.configuration;


import dog.sneaky.demo.data.AbstractEntity;
import dog.sneaky.demo.data.BaseRepositoryImpl;
import io.vavr.control.Option;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jdbc.repository.config.EnableJdbcAuditing;
import org.springframework.data.jdbc.repository.config.EnableJdbcRepositories;
import org.springframework.data.relational.core.mapping.event.BeforeConvertCallback;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Optional;

@Configuration
@EnableJdbcAuditing(auditorAwareRef = "auditorAwareRef")
@EnableJdbcRepositories(basePackages = "dog.sneaky.demo.data.repository", repositoryBaseClass = BaseRepositoryImpl.class)
@Order(3)
public class JdbcConfiguration {

    @Bean("auditorAwareRef")
    AuditorAware<String> auditorAwareRef() {
        return () -> {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            return Optional.of(authentication.getName());
        };
    }


    @Bean
    public BeforeConvertCallback<AbstractEntity> beforeConvertCallbackRef() {
        return aggregate -> {
            aggregate.setId(Option.of(aggregate.getId()).getOrElse(1121211L));
            return aggregate;
        };
    }


    public static void main(String[] args) {
        Object orElse = Option.of("test").getOrElse("1231313");
        System.out.println(orElse);
    }

}
