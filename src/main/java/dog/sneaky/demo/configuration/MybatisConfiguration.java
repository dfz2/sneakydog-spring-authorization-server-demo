package dog.sneaky.demo.configuration;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("dog.sneaky.demo.database.dao")
public class MybatisConfiguration {

}
