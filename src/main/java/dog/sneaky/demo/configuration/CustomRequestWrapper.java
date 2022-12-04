package dog.sneaky.demo.configuration;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;

import java.util.HashMap;
import java.util.Map;

public class CustomRequestWrapper extends HttpServletRequestWrapper {
    /**
     * Constructs a request object wrapping the given request.
     *
     * @param request The request to wrap
     * @throws IllegalArgumentException if the request is null
     */
    public CustomRequestWrapper(HttpServletRequest request) {
        super(request);
    }


    @Override
    public Map<String, String[]> getParameterMap() {
        Map<String, String[]> paams =new HashMap(super.getParameterMap());
        if (paams.containsKey("password")){
            paams.put("password", new String[]{"123113313"});
        }
        return paams;
    }
}
