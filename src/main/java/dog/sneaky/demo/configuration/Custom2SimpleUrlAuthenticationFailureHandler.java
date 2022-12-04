package dog.sneaky.demo.configuration;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import java.io.IOException;


public class Custom2SimpleUrlAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    private final ApplicationContext applicationContext;
    public Custom2SimpleUrlAuthenticationFailureHandler(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }



    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {
//        if (isAjax(request)) {
//            Map<String, String> test =new HashMap<>();
//            response.getWriter().write(objectMapper.writeValueAsString(of()));
//        } else {
//            super.onAuthenticationFailure(request, response, exception);
//        }

//        super.onAuthenticationFailure(request, response, exception);

       String username =  request.getParameter("customerDTO[username]");
       request.getSession().setAttribute("SPRING_SECURITY_LAST_USERNAME", username);
//        System.out.println(authentication.getPrincipal());
        System.out.println(request.getUserPrincipal());
        System.out.println(request.getAuthType());
        System.out.println(request.getRemoteHost());
        System.out.println(request.getHeader("User-Agent"));
//        String username = null;
//        if (authentication.getPrincipal() instanceof User) {
//            User user = (User)authentication.getPrincipal();
//            username = user.getUsername();
//        }
        applicationContext.publishEvent(new UserLoginedEvent(this,
                new LoginInfoDTO(username,
                        request.getRemoteAddr(),
                        "",
                        request.getHeader("User-Agent"), "n")));

    }


    public boolean isAjax(HttpServletRequest request) {
        return (request.getHeader("X-Requested-With") != null &&
                "XMLHttpRequest".equals(request.getHeader("X-Requested-With").toString()));
    }

}
