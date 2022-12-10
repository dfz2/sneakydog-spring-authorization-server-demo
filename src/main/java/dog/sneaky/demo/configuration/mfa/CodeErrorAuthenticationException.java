package dog.sneaky.demo.configuration.mfa;

import lombok.Getter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

public class CodeErrorAuthenticationException extends AuthenticationException {

    @Getter
    private final Authentication authentication;

    public CodeErrorAuthenticationException(String msg, Authentication authentication) {
        super(msg);
        this.authentication = authentication;
    }

    public CodeErrorAuthenticationException(String msg, Throwable cause, Authentication authentication) {
        super(msg, cause);
        this.authentication = authentication;
    }
}
