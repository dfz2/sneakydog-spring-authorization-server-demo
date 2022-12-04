package dog.sneaky.demo.configuration;

import jakarta.servlet.FilterChain;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.filter.OncePerRequestFilter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@Slf4j
//@Component
public class VerifyCodeFilter extends OncePerRequestFilter {
    @Value("${spring.captcha.enabled}")
    private boolean springCaptchaEnabled;
    private final AntPathMatcher antPathMatcher = new AntPathMatcher();

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (!verifyCAPTCHA(request)) {
            String username = request.getParameter("customerDTO[username]");
            session.setAttribute("SPRING_SECURITY_LAST_USERNAME", username);
            response.sendRedirect("/login?CAPTCHACode");
        } else {
            filterChain.doFilter(request, response);
        }
    }

    private boolean verifyCAPTCHA(HttpServletRequest request) {
        if (springCaptchaEnabled && "POST".equalsIgnoreCase(request.getMethod())
                && antPathMatcher.match("/login", request.getRequestURI())) {
            String text = request.getParameter("CAPTCHACode");
            if (text != null && !text.isEmpty()) {
                HttpSession session = request.getSession();
                String kaptchaSessionKey = "KAPTCHA_SESSION_KEY_" + text.toUpperCase();
                String genCaptcha = (String) session.getAttribute(kaptchaSessionKey);
                log.info("requestCaptcha=" + text);
                log.info("genCaptcha=" + genCaptcha);
                if (genCaptcha !=null ){
                    session.removeAttribute(kaptchaSessionKey);
                    return true;
//                    if (!genCaptcha.equals(text.toUpperCase())) {
//                        // throw new AuthenticationServiceException("验证码错误!");
//                        return false;
//                    }
                } else {
                    return false;
//                throw new AuthenticationServiceException("验证码不能为空!");
//                response.sendRedirect("/login?CAPTCHACode");
                }
            } else {

                return false;
            }

        } else {

            return true;
        }

    }
}
