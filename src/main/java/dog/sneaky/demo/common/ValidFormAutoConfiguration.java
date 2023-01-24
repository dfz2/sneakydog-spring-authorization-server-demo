package dog.sneaky.demo.common;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

//@Configuration
//@EnableAspectJAutoProxy
class ValidFormAutoConfiguration {
//    @Bean
//    @ConditionalOnMissingBean(ValidFormAspect.class)
    public ValidFormAspect validFormAspect() {
        return new ValidFormAspect();
    }
}
