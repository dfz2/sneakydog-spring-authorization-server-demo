package dog.sneaky.demo.configuration;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.Set;


@Component
@Order(1)
@RequiredArgsConstructor
public class ProfileLocalClearAllRedisCache implements ApplicationRunner {

    private final RedisTemplate<Object, Object> redisTemplate;


    @Override
    public void run(ApplicationArguments args) throws Exception {
        Set<Object> keys = redisTemplate.keys("*");
        if (keys!=null){
            redisTemplate.delete(keys);
        }
    }
}
