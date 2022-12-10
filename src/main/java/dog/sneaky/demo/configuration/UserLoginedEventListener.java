package dog.sneaky.demo.configuration;


import dog.sneaky.demo.common.IPUtil;
import dog.sneaky.demo.data.eneity.UserLoginLog;
import dog.sneaky.demo.data.repository.UserLoginLogRepository;
import groovy.util.logging.Slf4j;
import lombok.RequiredArgsConstructor;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.authentication.event.AuthenticationFailureBadCredentialsEvent;
import org.springframework.security.authentication.event.InteractiveAuthenticationSuccessEvent;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import java.util.Map;

@Slf4j
@Component
@RequiredArgsConstructor
public class UserLoginedEventListener {
//    private final LogsDAO logsDAO;

    private final UserLoginLogRepository userLoginLogRepository;



    @Async
    @EventListener
    public void loginSuccessEvent(InteractiveAuthenticationSuccessEvent interactiveAuthenticationSuccessEvent) {

        System.out.println(interactiveAuthenticationSuccessEvent);

        Authentication authentication = interactiveAuthenticationSuccessEvent.getAuthentication();
        CustomWebAuthenticationDetails customWebAuthenticationDetails = (CustomWebAuthenticationDetails) authentication.getDetails();
//        HttpServletRequest httpServletRequest = customWebAuthenticationDetails.getHttpServletRequest();
//

        Map<String, Object> headers = customWebAuthenticationDetails.getHeaders();
        String remoteAddress = customWebAuthenticationDetails.getRemoteAddress();
        String sessionId = customWebAuthenticationDetails.getSessionId();

//        String remoteAddr = IPUtil.getClientIP(httpServletRequest);
        String region = IPUtil.getAddressByIP(remoteAddress);

        UserLoginLog logs = new UserLoginLog();
        logs.setUsername(authentication.getName());
        logs.setUserAgent(headers.get("user-agent").toString());
        logs.setIpAddress(remoteAddress);
        logs.setRegion(region);
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


    //    AuthenticationFailureBadCredentialsEvent 可以使用

    @EventListener
    public void authenticationFailureBadCredentialsEvent(AuthenticationFailureBadCredentialsEvent authenticationFailureBadCredentialsEvent) {
        UserLoginLog logs = new UserLoginLog();
        Authentication authentication = authenticationFailureBadCredentialsEvent.getAuthentication();
        String username = authentication.getName();
        CustomWebAuthenticationDetails customWebAuthenticationDetails = (CustomWebAuthenticationDetails) authentication.getDetails();
//        HttpServletRequest httpServletRequest = customWebAuthenticationDetails.getHttpServletRequest();
//        String remoteAddr = IPUtil.getClientIP(httpServletRequest);
//

        Map<String, Object> headers = customWebAuthenticationDetails.getHeaders();
        String remoteAddress = customWebAuthenticationDetails.getRemoteAddress();
        String sessionId = customWebAuthenticationDetails.getSessionId();
        String region = IPUtil.getAddressByIP(remoteAddress);

        logs.setUsername(username);
        logs.setUserAgent(headers.get("user-agent").toString());
        logs.setIpAddress(remoteAddress);
        logs.setRegion(region);
        logs.setLoginStatus("n");
        userLoginLogRepository.save(logs);
    }



}
