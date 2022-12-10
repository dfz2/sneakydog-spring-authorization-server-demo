package dog.sneaky.demo.configuration;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.security.authentication.AuthenticationDetailsSource;

public class CustomWebAuthenticationDetailsSource implements AuthenticationDetailsSource<HttpServletRequest, CustomWebAuthenticationDetails> {
    @Override
    public CustomWebAuthenticationDetails buildDetails(HttpServletRequest context) {
        return new CustomWebAuthenticationDetails(context);
    }
}
