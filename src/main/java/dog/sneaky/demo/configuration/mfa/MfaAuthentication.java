package dog.sneaky.demo.configuration.mfa;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.CredentialsContainer;

import java.util.Collections;

public class MfaAuthentication extends AbstractAuthenticationToken {
    private final Authentication authentication;

    public MfaAuthentication(Authentication authentication) {
        super(Collections.emptyList());
        this.authentication = authentication;
    }


    @Override
    public Object getPrincipal() {
        return this.authentication.getPrincipal();
    }

    @Override
    public Object getCredentials() {
        return this.authentication.getCredentials();
    }

    @Override
    public void eraseCredentials() {
        if (this.authentication instanceof CredentialsContainer) {
            ((CredentialsContainer) this.authentication).eraseCredentials();
        }
    }

    @Override
    public boolean isAuthenticated() {
        return false;
    }

    public Authentication getAuthentication() {
        return this.authentication;
    }
}
