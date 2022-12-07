package dog.sneaky.demo.configuration;

import jakarta.servlet.http.HttpServletRequest;
import lombok.Getter;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

public class CustomWebAuthenticationDetails extends WebAuthenticationDetails {

    @Getter
    private final Map<String,Object> headers = new HashMap<>();


    public CustomWebAuthenticationDetails(HttpServletRequest httpServletRequest) {
        super(httpServletRequest);

        Enumeration<String> headerNames = httpServletRequest.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String key = headerNames.nextElement();
            headers.put(key, httpServletRequest.getHeader(key));
        }
    }



}
