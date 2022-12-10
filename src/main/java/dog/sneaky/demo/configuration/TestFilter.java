package dog.sneaky.demo.configuration;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

public class TestFilter extends UsernamePasswordAuthenticationFilter {

    @Override
    protected String obtainPassword(HttpServletRequest request) {
        return "123456";
    }
}
