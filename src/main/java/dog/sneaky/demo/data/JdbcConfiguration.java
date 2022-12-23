package dog.sneaky.demo.data;


import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ReflectUtil;
import dog.sneaky.demo.data.rowmappers.SimpleGrantedAuthorityRowMapper;
import io.vavr.control.Try;
import org.reflections.Reflections;
import org.springframework.boot.autoconfigure.quartz.QuartzDataSource;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.annotation.Order;
import org.springframework.core.convert.converter.Converter;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jdbc.repository.QueryMappingConfiguration;
import org.springframework.data.jdbc.repository.config.AbstractJdbcConfiguration;
import org.springframework.data.jdbc.repository.config.DefaultQueryMappingConfiguration;
import org.springframework.data.jdbc.repository.config.EnableJdbcAuditing;
import org.springframework.data.jdbc.repository.config.EnableJdbcRepositories;
import org.springframework.data.relational.core.mapping.DefaultNamingStrategy;
import org.springframework.data.relational.core.mapping.NamingStrategy;
import org.springframework.data.relational.core.mapping.RelationalPersistentProperty;
import org.springframework.data.relational.core.mapping.event.BeforeConvertCallback;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.ObjectUtils;

import javax.sql.DataSource;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Configuration
@EnableJdbcAuditing(auditorAwareRef = "auditorAwareRef")
@EnableJdbcRepositories(namedQueriesLocation = "classpath:META-INF/jdbc-named-queries.properties", basePackages = "dog.sneaky.demo.data.repository", repositoryBaseClass = BaseRepositoryImpl.class)
@Order(3)
public class JdbcConfiguration extends AbstractJdbcConfiguration {


    @Primary
    @Bean
    @ConfigurationProperties(prefix = "spring.datasource")
    DataSource dataSource(){
        return DataSourceBuilder.create().build();
    }

    @SuppressWarnings("rawtypes")
    @Override
    protected List<?> userConverters() {
        Set<Class<? extends Converter>> subTypesOf = new Reflections("dog.sneaky.demo.data.converters").getSubTypesOf(Converter.class);
        return subTypesOf.stream().map(it -> Try.of(()->ReflectUtil.newInstance(it)).get()).collect(Collectors.toList());
    }


    @SuppressWarnings("rawtypes")
    @Bean
    QueryMappingConfiguration rowMappers() {
        DefaultQueryMappingConfiguration mappers = new DefaultQueryMappingConfiguration();
        mappers.registerRowMapper(SimpleGrantedAuthority.class, new SimpleGrantedAuthorityRowMapper());
        return mappers;
    }


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
    public <T extends Identifier<Long>> BeforeConvertCallback<T> beforeConvertCallbackRef() {
       return aggregate -> {
           if (ObjectUtils.isEmpty(aggregate.getId())) {
               aggregate.setId(IdUtil.getSnowflakeNextId());
           }
           return aggregate;
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


}
