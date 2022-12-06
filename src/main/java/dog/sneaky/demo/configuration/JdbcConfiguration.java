package dog.sneaky.demo.configuration;


import cn.hutool.core.util.IdUtil;
import dog.sneaky.demo.data.AbstractEntity;
import dog.sneaky.demo.data.AbstractId;
import dog.sneaky.demo.data.BaseRepositoryImpl;
import io.vavr.control.Option;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jdbc.repository.config.AbstractJdbcConfiguration;
import org.springframework.data.jdbc.repository.config.EnableJdbcAuditing;
import org.springframework.data.jdbc.repository.config.EnableJdbcRepositories;
import org.springframework.data.relational.core.mapping.DefaultNamingStrategy;
import org.springframework.data.relational.core.mapping.ForeignKeyNaming;
import org.springframework.data.relational.core.mapping.NamingStrategy;
import org.springframework.data.relational.core.mapping.RelationalPersistentProperty;
import org.springframework.data.relational.core.mapping.event.BeforeConvertCallback;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Optional;

@Configuration
@EnableJdbcAuditing(auditorAwareRef = "auditorAwareRef")
@EnableJdbcRepositories(basePackages = "dog.sneaky.demo.data.repository", repositoryBaseClass = BaseRepositoryImpl.class)
@Order(3)
public class JdbcConfiguration extends AbstractJdbcConfiguration {

    @Bean("auditorAwareRef")
    AuditorAware<String> auditorAwareRef() {
        return () -> {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication != null) {
                return Optional.ofNullable(authentication.getName());
            } else {
                return "nuknow".describeConstable();
            }
        };
    }


    @Bean
    public <T extends AbstractId<Long>> BeforeConvertCallback<T> beforeConvertCallbackRef() {
       return new BeforeConvertCallback<T>() {
           @Override
           public T onBeforeConvert(T aggregate) {
               if (aggregate.getId() != null) {
                   return aggregate;
               }
               aggregate.setId(IdUtil.getSnowflakeNextId());
               return aggregate;
           }
       };
    }

    @Bean
    NamingStrategy namingStrategy(){
        return new DefaultNamingStrategy(){
            @Override
            public String getColumnName(RelationalPersistentProperty property) {
                return property.getName();
            }
        };
    }


    public static void main(String[] args) {
        Object orElse = Option.of("test").getOrElse("1231313");
        System.out.println(orElse);
    }

}
