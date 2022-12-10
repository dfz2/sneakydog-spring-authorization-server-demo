package dog.sneaky.demo.configuration;

import dog.sneaky.demo.common.IPUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import java.io.IOException;

public class Custom2UrlAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    private final ApplicationContext applicationContext;
    public Custom2UrlAuthenticationSuccessHandler(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }


    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        super.onAuthenticationSuccess(request, response, authentication);
        System.out.println(authentication.getPrincipal());
        System.out.println(request.getUserPrincipal());
        System.out.println(request.getAuthType());
        System.out.println(request.getRemoteAddr());
        System.out.println(request.getHeader("User-Agent"));
        String username = authentication.getName();
//        if (authentication.getPrincipal() instanceof User) {
//            User user = (User)authentication.getPrincipal();
//            username = user.getUsername();


//        }

        String remoteAddr = IPUtil.getClientIP(request);
        String region = IPUtil.getAddressByIP(remoteAddr);
        applicationContext.publishEvent(new UserLoginedEvent(this,
                new LoginInfoDTO(username,
                        remoteAddr,
                        region,
                        request.getHeader("User-Agent"), "y")));
    }
}
