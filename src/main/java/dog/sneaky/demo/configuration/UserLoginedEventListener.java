package dog.sneaky.demo.configuration;


import dog.sneaky.demo.common.IPUtil;
import dog.sneaky.demo.data.eneity.UserLoginLog;
import dog.sneaky.demo.data.repository.UserLoginLogRepository;
import groovy.util.logging.Slf4j;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.authentication.event.AuthenticationFailureBadCredentialsEvent;
import org.springframework.security.authentication.event.InteractiveAuthenticationSuccessEvent;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.FacesRequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Slf4j
@Component
@RequiredArgsConstructor
public class UserLoginedEventListener {
//    private final LogsDAO logsDAO;

    private final UserLoginLogRepository userLoginLogRepository;



    @Async
    @EventListener
    public void test(InteractiveAuthenticationSuccessEvent interactiveAuthenticationSuccessEvent) {

        System.out.println(interactiveAuthenticationSuccessEvent);

        Authentication authentication = interactiveAuthenticationSuccessEvent.getAuthentication();
//        ServletRequestAttributes ra= (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
//        HttpServletRequest request =  ra.getRequest();
//        String remoteAddr = IPUtil.getClientIP(request);
//        String region = IPUtil.getAddressByIP(remoteAddr);

        UserLoginLog logs = new UserLoginLog();
        logs.setUsername(authentication.getName());
//        logs.setUserAgent(request.getHeader("User-Agent"));
//        logs.setIpAddress(remoteAddr);
//        logs.setRegion(region);
        logs.setLoginStatus("y");
        userLoginLogRepository.save(logs);

    }

//    @EventListener
    // 可以使用 AuthenticationSuccessEvent
    public void userLoginedEvent(UserLoginedEvent userLoginedEvent) {
        UserLoginLog logs = new UserLoginLog();
        logs.setUsername(userLoginedEvent.getLoginInfoDTO().getUsername());
        logs.setUserAgent(userLoginedEvent.getLoginInfoDTO().getUserAgent());
        logs.setIpAddress(userLoginedEvent.getLoginInfoDTO().getIpAddress());
        logs.setRegion(userLoginedEvent.getLoginInfoDTO().getRegion());
        logs.setLoginStatus(userLoginedEvent.getLoginInfoDTO().getLoginStatus());
//        userLoginLogRepository.save(logs);
    }


//    @EventListener
    // AuthenticationFailureBadCredentialsEvent 可以使用
    public void authenticationFailureBadCredentialsEvent(AuthenticationFailureBadCredentialsEvent authenticationFailureBadCredentialsEvent) {
        UserLoginLog logs = new UserLoginLog();
        Authentication authentication = authenticationFailureBadCredentialsEvent.getAuthentication();
        String username = authentication.getName();
//        if (authentication.getPrincipal() instanceof User) {
//            username = ((User) authentication.getPrincipal()).getUsername();
//        }
        ServletRequestAttributes ra= (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request =  ra.getRequest();

        String remoteAddr = IPUtil.getClientIP(request);
        String region = IPUtil.getAddressByIP(remoteAddr);

        logs.setUsername(username);
        logs.setUserAgent(request.getHeader("User-Agent"));
        logs.setIpAddress(remoteAddr);
        logs.setRegion(region);
        logs.setLoginStatus("n");
//        userLoginLogRepository.save(logs);
    }



}
