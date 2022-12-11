package dog.sneaky.demo.configuration;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;

public class CustomRequestCache extends HttpSessionRequestCache {

    @Override
    public void saveRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        System.out.println("Saving request to " + httpServletRequest.getRequestURI());
        super.saveRequest(httpServletRequest, httpServletResponse);
    }

    @Override
    public HttpServletRequest getMatchingRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        System.out.println("Returning request for " + httpServletRequest.getRequestURI());
        return super.getMatchingRequest(httpServletRequest, httpServletResponse);
    }
}
