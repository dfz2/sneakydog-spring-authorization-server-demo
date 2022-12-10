package dog.sneaky.demo.configuration.mfa;

import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MfaService {
    private final StringRedisTemplate stringRedisTemplate;

    public boolean check(String emailAddress, String code) {
        String key = emailAddress + "^_^" + code;
        return Boolean.TRUE.equals(stringRedisTemplate.hasKey(key));
    }

}
