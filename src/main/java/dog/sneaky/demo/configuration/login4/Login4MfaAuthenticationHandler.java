package dog.sneaky.demo.configuration.login4;

import dog.sneaky.demo.configuration.mfa.CodeErrorAuthenticationException;
import dog.sneaky.demo.configuration.mfa.MfaAuthentication;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import java.io.IOException;

public class Login4MfaAuthenticationHandler extends SimpleUrlAuthenticationFailureHandler implements AuthenticationSuccessHandler, AuthenticationFailureHandler {

    private final AuthenticationSuccessHandler successHandler;

    public Login4MfaAuthenticationHandler(String url) {
        SimpleUrlAuthenticationSuccessHandler successHandler = new SimpleUrlAuthenticationSuccessHandler(url);
        successHandler.setAlwaysUseDefaultTargetUrl(true);
        this.successHandler = successHandler;
    }

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {

        if (exception instanceof CodeErrorAuthenticationException) {
            CodeErrorAuthenticationException ee = (CodeErrorAuthenticationException) exception;
            saveMfaAuthentication(request, response, ee.getAuthentication());
        } else {
//            Authentication anonymous = new AnonymousAuthenticationToken("key", "anonymousUser",
//                    AuthorityUtils.createAuthorityList("ROLE_ANONYMOUS"));
//            saveMfaAuthentication(request, response, new MfaAuthentication(anonymous));

            String jUsername = request.getParameter("j_username");
            System.out.println(jUsername);
            setDefaultFailureUrl("/pwderror?j_username="+ jUsername);
            super.onAuthenticationFailure(request, response, exception);
        }
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        saveMfaAuthentication(request, response, authentication);
    }

    private void saveMfaAuthentication(HttpServletRequest request, HttpServletResponse response,
                                       Authentication authentication) throws IOException, ServletException {
        SecurityContextHolder.getContext().setAuthentication(new MfaAuthentication(authentication));
        this.successHandler.onAuthenticationSuccess(request, response, authentication);
    }
}
