package dog.sneaky.demo.configuration;

import jakarta.servlet.FilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import static org.springframework.security.web.util.matcher.RequestMatcher.*;


//@Component
public class VerifyEmailFilter extends OncePerRequestFilter {

    AntPathRequestMatcher requestMatcher = new AntPathRequestMatcher("/verify","GET");

    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest,
                                    HttpServletResponse httpServletResponse,
                                    FilterChain filterChain) throws ServletException, IOException {

        MatchResult matchResult = requestMatcher.matcher(httpServletRequest);
        if (matchResult.isMatch()) {
            System.out.println("12313131313");
        }

        filterChain.doFilter(httpServletRequest, httpServletResponse);
        System.out.println("123131313");
    }
}
