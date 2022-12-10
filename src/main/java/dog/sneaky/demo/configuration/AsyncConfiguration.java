package dog.sneaky.demo.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.AsyncConfigurer;
import org.springframework.scheduling.annotation.EnableAsync;


@Configuration
@EnableAsync
public class AsyncConfiguration implements AsyncConfigurer {
//    @Bean
//    @Primary
//    public TaskExecutor taskExecutor() {
//        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
//        executor.setCorePoolSize(4);
//        executor.setMaxPoolSize(50);
//        executor.initialize();
//        return executor;
//    }
//
//    @Override
//    public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {
//        return new DefaultAsyncExceptionHandler();
//    }
}
