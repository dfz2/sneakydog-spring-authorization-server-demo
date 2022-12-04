package dog.sneaky.demo.configuration;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.servlet.error.DefaultErrorAttributes;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.context.request.WebRequest;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import static com.google.common.collect.ImmutableMap.of;



public class CustomSimpleUrlAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    ObjectMapper objectMapper = new ObjectMapper();


    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {
//        if (isAjax(request)) {
//            Map<String, String> test =new HashMap<>();
//            response.getWriter().write(objectMapper.writeValueAsString(of()));
//        } else {
//            super.onAuthenticationFailure(request, response, exception);
//        }


        Map<String, String> test =new HashMap<>();
        test.put("message", exception.getMessage());
        response.setStatus(9527);
        response.getWriter().write(objectMapper.writeValueAsString(test));
    }


    public boolean isAjax(HttpServletRequest request) {
        return (request.getHeader("X-Requested-With") != null &&
                "XMLHttpRequest".equals(request.getHeader("X-Requested-With").toString()));
    }

}
