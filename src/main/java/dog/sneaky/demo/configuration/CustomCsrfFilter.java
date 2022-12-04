package dog.sneaky.demo.configuration;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.filter.OncePerRequestFilter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@Slf4j
//@Component
public class CustomCsrfFilter extends OncePerRequestFilter {
    private final AntPathMatcher antPathMatcher = new AntPathMatcher();


    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        log.info(request.getRequestURL().toString());
        log.info(request.getRequestURI());

        if (!checkAlreadySignedOut(request)) {
            response.sendRedirect("/login.html");
            return;
        }

        if (!checkAlreadyLoggedIn(request)) {
            response.sendRedirect("/");
            return;
        }

        filterChain.doFilter(request, response);
    }


    private boolean checkAlreadyLoggedIn(HttpServletRequest request) {
        if ("POST".equalsIgnoreCase(request.getMethod())
                && antPathMatcher.match("/login", request.getRequestURI())) {
            String username = request.getParameter("customerDTO[username]");
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication != null
                    && authentication.isAuthenticated()
                    && username != null
                    && username.equals(authentication.getName())) {
                return false;
            }
        }
        return true;
    }


    private boolean checkAlreadySignedOut(HttpServletRequest request){
        if ("POST".equalsIgnoreCase(request.getMethod())
                && antPathMatcher.match("/logout", request.getRequestURI())) {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            return authentication != null;
        } else {
            return true;
        }
    }
}
